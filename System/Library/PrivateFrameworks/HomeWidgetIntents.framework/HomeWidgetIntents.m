Swift::Void __swiftcall StartHomeWidgetIntentsService()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void *v5;

  if (qword_256DC7808 != -1)
    swift_once();
  v0 = sub_23EC83780();
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC8528);
  v1 = sub_23EC83768();
  v2 = sub_23EC83A5C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23EC52000, v1, v2, "Starting AppIntentsExtension", v3, 2u);
    MEMORY[0x24265CB1C](v3, -1, -1);
  }

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_23EC83834();
  objc_msgSend(v4, sel_setDefaultEffectiveBundleIdentifier_, v5);

  if (qword_256DC77E8 != -1)
    swift_once();
  sub_23EC55CA8(byte_256DC8508, qword_256DC8510, unk_256DC8518);
}

id sub_23EC53F3C()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  qword_256DC8500 = (uint64_t)result;
  return result;
}

uint64_t sub_23EC53F74(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 + 144) = a4;
  *(_QWORD *)(v4 + 72) = a2;
  *(_QWORD *)(v4 + 80) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7948);
  *(_QWORD *)(v4 + 88) = swift_task_alloc();
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7988);
  *(_QWORD *)(v4 + 104) = swift_task_alloc();
  v5 = sub_23EC834A4();
  *(_QWORD *)(v4 + 112) = v5;
  *(_QWORD *)(v4 + 120) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  sub_23EC8399C();
  *(_QWORD *)(v4 + 136) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC54064()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 80);
  sub_23EC83408();
  if (v1 >> 62)
  {
    sub_23EC8333C();
    result = sub_23EC83C90();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_26:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = sub_23EC8333C();
  if (!v2)
    goto LABEL_26;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v37 = v1 & 0xC000000000000001;
    v35 = *(_QWORD *)(v0 + 80) + 32;
    v36 = *(_QWORD *)(v0 + 120);
    v38 = v2;
    while (1)
    {
      if (v37)
        v5 = (id)MEMORY[0x24265C474](v4, *(_QWORD *)(v0 + 80));
      else
        v5 = *(id *)(v35 + 8 * v4);
      v6 = v5;
      if ((*(_BYTE *)(v0 + 144) & 1) != 0)
      {
LABEL_17:
        v22 = *(_QWORD *)(v0 + 88);
        v21 = *(_QWORD *)(v0 + 96);
        v23 = (_QWORD *)swift_allocObject();
        v23[2] = 0;
        v24 = v23 + 2;
        v23[3] = 0;
        v23[4] = v6;
        v25 = sub_23EC839C0();
        v26 = *(_QWORD *)(v25 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v21, 1, 1, v25);
        sub_23EC56494(v21, v22);
        LODWORD(v22) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v22, 1, v25);
        v27 = v6;
        v28 = *(_QWORD *)(v0 + 88);
        if ((_DWORD)v22 == 1)
        {
          sub_23EC563CC(*(_QWORD *)(v0 + 88), &qword_256DC7948);
          if (*v24)
            goto LABEL_19;
LABEL_21:
          v29 = 0;
          v31 = 0;
        }
        else
        {
          sub_23EC839B4();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v25);
          if (!*v24)
            goto LABEL_21;
LABEL_19:
          swift_getObjectType();
          swift_unknownObjectRetain();
          v29 = sub_23EC83984();
          v31 = v30;
          swift_unknownObjectRelease();
        }
        v32 = **(_QWORD **)(v0 + 72);
        v33 = swift_allocObject();
        *(_QWORD *)(v33 + 16) = &unk_256DC7998;
        *(_QWORD *)(v33 + 24) = v23;
        v34 = v31 | v29;
        if (v31 | v29)
        {
          *(_QWORD *)(v0 + 16) = 0;
          *(_QWORD *)(v0 + 24) = 0;
          v34 = v0 + 16;
          *(_QWORD *)(v0 + 32) = v29;
          *(_QWORD *)(v0 + 40) = v31;
        }
        *(_QWORD *)(v0 + 48) = 1;
        *(_QWORD *)(v0 + 56) = v34;
        *(_QWORD *)(v0 + 64) = v32;
        swift_task_create();

        sub_23EC83408();
        goto LABEL_6;
      }
      sub_23EC83510();
      v7 = (void *)sub_23EC83504();
      v8 = objc_msgSend(v6, sel_uniqueIdentifier);
      sub_23EC8348C();

      v9 = sub_23EC834F8();
      if (*(_QWORD *)(v9 + 16))
      {
        v10 = sub_23EC5F41C(*(_QWORD *)(v0 + 128));
        v11 = *(_QWORD *)(v0 + 104);
        if ((v12 & 1) != 0)
        {
          v13 = v10;
          v14 = *(_QWORD *)(v9 + 56);
          v15 = sub_23EC83570();
          v16 = *(_QWORD *)(v15 - 8);
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v11, v14 + *(_QWORD *)(v16 + 72) * v13, v15);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(v11, 0, 1, v15);
          goto LABEL_16;
        }
      }
      else
      {
        v11 = *(_QWORD *)(v0 + 104);
      }
      v15 = sub_23EC83570();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
LABEL_16:
      v17 = *(_QWORD *)(v0 + 128);
      v18 = *(_QWORD *)(v0 + 104);
      v19 = *(_QWORD *)(v0 + 112);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v17, v19);
      sub_23EC83570();
      v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v18, 1, v15);
      sub_23EC563CC(v18, &qword_256DC7988);
      if (v20 == 1)
        goto LABEL_17;

LABEL_6:
      if (v38 == ++v4)
        goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC54468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7988);
  v3[4] = swift_task_alloc();
  type metadata accessor for HomeID();
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC544E4()
{
  _QWORD *v0;
  void *v1;
  id *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  void *v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_256DC7808 != -1)
    swift_once();
  v2 = (id *)(v0 + 3);
  v1 = (void *)v0[3];
  v3 = sub_23EC83780();
  __swift_project_value_buffer(v3, (uint64_t)qword_256DC8528);
  v4 = v1;
  v5 = sub_23EC83768();
  v6 = sub_23EC83A5C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = v0[5];
    v8 = (void *)v0[3];
    v9 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17 = v16;
    *(_DWORD *)v9 = 136315138;
    v10 = objc_msgSend(v8, sel_uniqueIdentifier);
    sub_23EC8348C();

    v11 = _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
    v13 = v12;
    sub_23EC56564(v7);
    v0[2] = sub_23EC79A04(v11, v13, &v17);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23EC52000, v5, v6, "Asking DataModel to rebuild snapshot of home: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v16, -1, -1);
    MEMORY[0x24265CB1C](v9, -1, -1);
  }
  else
  {
    v14 = *v2;

  }
  v0[6] = sub_23EC83510();
  sub_23EC8399C();
  v0[7] = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC54718()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  *(_QWORD *)(v0 + 64) = sub_23EC83504();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_23EC5477C;
  return sub_23EC834EC();
}

uint64_t sub_23EC5477C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)v0 + 64);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc();

  sub_23EC563CC(v2, &qword_256DC7988);
  return swift_task_switch();
}

uint64_t sub_23EC547E8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC54820()
{
  uint64_t result;

  sub_23EC565A0();
  result = sub_23EC83AB0();
  byte_256DC8508 = 1;
  qword_256DC8510 = result;
  unk_256DC8518 = sub_23EC54868;
  qword_256DC8520 = 0;
  return result;
}

id sub_23EC54868()
{
  if (qword_256DC77E0 != -1)
    swift_once();
  return objc_msgSend((id)qword_256DC8500, sel_homeManager);
}

uint64_t sub_23EC548B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  sub_23EC8399C();
  v1[4] = sub_23EC83990();
  v1[5] = sub_23EC83984();
  v1[6] = v2;
  return swift_task_switch();
}

uint64_t sub_23EC54924()
{
  uint64_t v0;
  void *v1;
  id v2;
  _QWORD *v4;

  v1 = *(void **)(*(_QWORD *)(v0 + 24) + 24);
  if (v1)
  {
    v2 = v1;
    sub_23EC83408();
    return (*(uint64_t (**)(id))(v0 + 8))(v2);
  }
  else
  {
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v4;
    *v4 = v0;
    v4[1] = sub_23EC549A8;
    return sub_23EC55024();
  }
}

uint64_t sub_23EC549A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC54A10()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, _QWORD, uint64_t);
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  void (*v26)(uint64_t, _QWORD, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  v1 = *(_QWORD *)(v0 + 64);
  sub_23EC83408();
  if (v1)
  {
    v2 = *(void **)(v0 + 64);
    if (qword_256DC7808 != -1)
      swift_once();
    v3 = sub_23EC83780();
    __swift_project_value_buffer(v3, (uint64_t)qword_256DC8528);
    v4 = sub_23EC83768();
    v5 = sub_23EC83A5C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23EC52000, v4, v5, "HomeKitDispatcher.homeManager was successfully created", v6, 2u);
      MEMORY[0x24265CB1C](v6, -1, -1);
    }
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 24);

    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;
    v10 = v2;

    return (*(uint64_t (**)(id))(v0 + 8))(v10);
  }
  else
  {
    if (qword_256DC7808 != -1)
      swift_once();
    v12 = sub_23EC83780();
    __swift_project_value_buffer(v12, (uint64_t)qword_256DC8528);
    v13 = sub_23EC83768();
    v14 = sub_23EC83A44();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23EC52000, v13, v14, "HomeKitDispatcher.homeManager framework gave nil HMHomeManager", v15, 2u);
      MEMORY[0x24265CB1C](v15, -1, -1);
    }

    v16 = sub_23EC83A8C();
    sub_23EC55DE4();
    v17 = (void *)swift_allocError();
    v18 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104);
    v18(v19, *MEMORY[0x24BE4CD68], v16);
    swift_willThrow();
    if (qword_256DC7808 != -1)
      swift_once();
    __swift_project_value_buffer(v12, (uint64_t)qword_256DC8528);
    v20 = v17;
    v21 = v17;
    v22 = sub_23EC83768();
    v23 = sub_23EC83A44();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v24 = 138412290;
      v25 = v17;
      v26 = v18;
      v27 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 16) = v27;
      sub_23EC83AF8();
      *v29 = v27;
      v18 = v26;

      _os_log_impl(&dword_23EC52000, v22, v23, "HomeKitDispatcher.homeManager failed: %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7940);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v29, -1, -1);
      MEMORY[0x24265CB1C](v24, -1, -1);
    }
    else
    {

    }
    swift_allocError();
    *v28 = v17;
    v18((uint64_t)v28, *MEMORY[0x24BE4CD70], v16);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23EC54E14()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  sub_23EC83408();
  v1 = *(void **)(v0 + 72);
  if (qword_256DC7808 != -1)
    swift_once();
  v2 = sub_23EC83780();
  __swift_project_value_buffer(v2, (uint64_t)qword_256DC8528);
  v3 = v1;
  v4 = v1;
  v5 = sub_23EC83768();
  v6 = sub_23EC83A44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v10;
    sub_23EC83AF8();
    *v8 = v10;

    _os_log_impl(&dword_23EC52000, v5, v6, "HomeKitDispatcher.homeManager failed: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7940);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v8, -1, -1);
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  else
  {

  }
  v11 = sub_23EC83A8C();
  sub_23EC55DE4();
  swift_allocError();
  *v12 = v1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v12, *MEMORY[0x24BE4CD70], v11);
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC55024()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7948);
  v1[5] = swift_task_alloc();
  v1[6] = sub_23EC8399C();
  v1[7] = sub_23EC83990();
  v1[8] = sub_23EC83984();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_23EC550B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 16);
  v0[10] = v2;
  if (v2)
  {
    sub_23EC83348();
    v3 = (_QWORD *)swift_task_alloc();
    v0[11] = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7960);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7968);
    v4 = sub_23EC55230;
  }
  else
  {
    v5 = v0[5];
    sub_23EC839A8();
    v6 = sub_23EC839C0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
    v7 = sub_23EC83990();
    v8 = swift_allocObject();
    v9 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v8 + 16) = v7;
    *(_QWORD *)(v8 + 24) = v9;
    v10 = sub_23EC55A4C(v5, (uint64_t)&unk_256DC7958, v8);
    v0[13] = v10;
    *(_QWORD *)(v1 + 16) = v10;
    sub_23EC83348();
    sub_23EC83408();
    v3 = (_QWORD *)swift_task_alloc();
    v0[14] = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7960);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7968);
    v4 = sub_23EC552E0;
  }
  *v3 = v0;
  v3[1] = v4;
  return sub_23EC839CC();
}

uint64_t sub_23EC55230()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC55290()
{
  uint64_t v0;
  uint64_t v1;

  sub_23EC83408();
  sub_23EC83408();
  v1 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23EC552E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC55340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  sub_23EC83408();
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = 0;
  sub_23EC83408();
  sub_23EC83408();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23EC553AC()
{
  uint64_t v0;

  sub_23EC83408();
  sub_23EC83408();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC553F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_23EC83408();
  *(_QWORD *)(v1 + 16) = 0;
  sub_23EC83408();
  sub_23EC83408();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC55458(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  v1[3] = sub_23EC8399C();
  v1[4] = sub_23EC83990();
  v1[5] = sub_23EC83984();
  v1[6] = v2;
  return swift_task_switch();
}

uint64_t sub_23EC554C8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  if (qword_256DC77E0 != -1)
    swift_once();
  v1 = objc_msgSend((id)qword_256DC8500, sel_homeManager);
  *(_QWORD *)(v0 + 56) = v1;
  if (v1)
  {
    if (qword_256DC7808 != -1)
      swift_once();
    v2 = sub_23EC83780();
    *(_QWORD *)(v0 + 64) = __swift_project_value_buffer(v2, (uint64_t)qword_256DC8528);
    v3 = sub_23EC83768();
    v4 = sub_23EC83A5C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23EC52000, v3, v4, "Requesting all homes from HomeKit", v5, 2u);
      MEMORY[0x24265CB1C](v5, -1, -1);
    }

    *(_QWORD *)(v0 + 72) = qword_256DC8500;
    *(_QWORD *)(v0 + 80) = sub_23EC83990();
    *(_QWORD *)(v0 + 88) = sub_23EC83984();
    *(_QWORD *)(v0 + 96) = v6;
    return swift_task_switch();
  }
  else
  {
    sub_23EC83408();
    **(_QWORD **)(v0 + 16) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23EC55660()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC837BC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *v1 = v0;
  v1[1] = sub_23EC556B8;
  return sub_23EC83A80();
}

uint64_t sub_23EC556B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC55720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 112);
  sub_23EC83408();
  if (v1 < 0 || (v1 & 0x4000000000000000) != 0)
  {
    v2 = (uint64_t)sub_23EC5F8C4(*(_QWORD *)(v0 + 112));
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = v1 & 0xFFFFFFFFFFFFFF8;
  }
  *(_QWORD *)(v0 + 128) = v2;
  return swift_task_switch();
}

uint64_t sub_23EC55788()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC557C0()
{
  uint64_t v0;

  sub_23EC83408();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC55800()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t (*v6)(uint64_t, char);

  if (*(_QWORD *)(*(_QWORD *)(v0 + 128) + 16)
    && (objc_msgSend((id)objc_opt_self(), sel_synchronizesHomeDataModel) & 1) != 0)
  {
    v6 = (uint64_t (*)(uint64_t, char))((char *)&dword_256DC7970 + dword_256DC7970);
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v1;
    *v1 = v0;
    v1[1] = sub_23EC55940;
    return v6(*(_QWORD *)(v0 + 128), 0);
  }
  else
  {
    sub_23EC83408();
    sub_23EC83408();
    v3 = sub_23EC83768();
    v4 = sub_23EC83A5C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23EC52000, v3, v4, "Finished synchronizing all homes from HomeKit.", v5, 2u);
      MEMORY[0x24265CB1C](v5, -1, -1);
    }

    **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 56);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23EC55940()
{
  swift_task_dealloc();
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC55994()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  sub_23EC83408();
  v1 = sub_23EC83768();
  v2 = sub_23EC83A5C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23EC52000, v1, v2, "Finished synchronizing all homes from HomeKit.", v3, 2u);
    MEMORY[0x24265CB1C](v3, -1, -1);
  }

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 56);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC55A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23EC839C0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23EC839B4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23EC563CC(a1, &qword_256DC7948);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23EC83984();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7960);
  return swift_task_create();
}

uint64_t IntentsService.deinit()
{
  uint64_t v0;

  sub_23EC83408();

  return v0;
}

uint64_t IntentsService.__deallocating_deinit()
{
  uint64_t v0;

  sub_23EC83408();

  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *sub_23EC55BE8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23EC55BF8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23EC55C04(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23EC55C5C;
  return v4();
}

uint64_t sub_23EC55C5C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23EC55CA8(char a1, uint64_t a2, void (*a3)(void))
{
  void *v6;
  id v7;

  if ((a1 & 1) != 0)
  {
    v6 = (void *)objc_opt_self();
    objc_msgSend(v6, sel_setOverrideSynchronizesHomeDataModel_, 1);
    objc_msgSend(v6, sel_setSynchronizesHomeDataModel_, 1);
  }
  objc_msgSend((id)objc_opt_self(), sel_setConfiguration_, a2);
  if (qword_256DC77E0 != -1)
    swift_once();
  objc_msgSend((id)qword_256DC8500, sel_warmup);
  if ((a1 & 1) != 0)
  {
    sub_23EC83510();
    v7 = (id)sub_23EC83504();
    a3();
    sub_23EC834E0();

  }
}

uint64_t type metadata accessor for IntentsService()
{
  return objc_opt_self();
}

uint64_t method lookup function for IntentsService()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_23EC55DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7938;
  if (!qword_256DC7938)
  {
    v1 = sub_23EC83A8C();
    result = MEMORY[0x24265CA8C](MEMORY[0x24BE4CD80], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7938);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265CA74]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23EC55E6C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23EC55E90(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC55EF4;
  return sub_23EC55458(a1);
}

uint64_t sub_23EC55EF4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23EC55F3C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v2 + 104) = a2;
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = sub_23EC8399C();
  *(_QWORD *)(v2 + 48) = sub_23EC83990();
  *(_QWORD *)(v2 + 56) = sub_23EC83984();
  *(_QWORD *)(v2 + 64) = v3;
  return swift_task_switch();
}

uint64_t sub_23EC55FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_23EC83C3C();
    v3 = (void **)(v1 + 32);
    do
    {
      v4 = *v3++;
      v5 = v4;
      sub_23EC83C0C();
      sub_23EC83C48();
      sub_23EC83C54();
      sub_23EC83C24();
      --v2;
    }
    while (v2);
    v6 = v17;
    *(_QWORD *)(v0 + 72) = v17;
    if (qword_256DC7808 != -1)
      swift_once();
    v7 = sub_23EC83780();
    __swift_project_value_buffer(v7, (uint64_t)qword_256DC8528);
    swift_bridgeObjectRetain_n();
    v8 = sub_23EC83768();
    v9 = sub_23EC83A5C();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v17 = v11;
      *(_DWORD *)v10 = 136315394;
      *(_QWORD *)(v0 + 16) = sub_23EC79A04(0xD000000000000027, 0x800000023EC86DC0, &v17);
      sub_23EC83AF8();
      *(_WORD *)(v10 + 12) = 2048;
      if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
      {
        sub_23EC8333C();
        v12 = sub_23EC83C90();
        sub_23EC83408();
      }
      else
      {
        v12 = *(_QWORD *)(v6 + 16);
      }
      sub_23EC83408();
      *(_QWORD *)(v0 + 24) = v12;
      sub_23EC83AF8();
      sub_23EC83408();
      _os_log_impl(&dword_23EC52000, v8, v9, "%s: will sync %ld homes", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v11, -1, -1);
      MEMORY[0x24265CB1C](v10, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v14 = *(_BYTE *)(v0 + 104);
    *(_QWORD *)(v0 + 80) = sub_23EC83990();
    v15 = swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v15;
    *(_QWORD *)(v15 + 16) = v6;
    *(_BYTE *)(v15 + 24) = v14;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v16;
    *v16 = v0;
    v16[1] = sub_23EC562BC;
    return sub_23EC83D8C();
  }
  else
  {
    sub_23EC83408();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23EC562BC()
{
  swift_task_dealloc();
  sub_23EC83408();
  sub_23EC83408();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC5632C()
{
  uint64_t v0;

  sub_23EC83408();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC5635C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(_BYTE *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_23EC55EF4;
  return sub_23EC53F74(a1, a2, v6, v7);
}

uint64_t sub_23EC563CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EC56408()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23EC56434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23EC56630;
  return sub_23EC54468(v2, v3, v4);
}

uint64_t sub_23EC56494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EC564DC()
{
  sub_23EC83408();
  return swift_deallocObject();
}

uint64_t sub_23EC56500()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC56630;
  return ((uint64_t (*)(int *))((char *)&dword_256DC79A0 + dword_256DC79A0))(v2);
}

uint64_t sub_23EC56564(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23EC565A0()
{
  unint64_t result;

  result = qword_256DC79B0;
  if (!qword_256DC79B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DC79B0);
  }
  return result;
}

void type metadata accessor for ComparisonResult()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256DC79B8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256DC79B8);
  }
}

double sub_23EC56634()
{
  double result;

  result = 2.21366487e214;
  xmmword_256DC7A20 = xmmword_23EC843E0;
  return result;
}

uint64_t static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.getter()
{
  uint64_t v0;

  if (qword_256DC77F0 != -1)
    swift_once();
  swift_beginAccess();
  v0 = xmmword_256DC7A20;
  sub_23EC8333C();
  return v0;
}

uint64_t static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  if (qword_256DC77F0 != -1)
    swift_once();
  swift_beginAccess();
  *(_QWORD *)&xmmword_256DC7A20 = a1;
  *((_QWORD *)&xmmword_256DC7A20 + 1) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.modify())()
{
  if (qword_256DC77F0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23EC567B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_23EC8342C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EC834BC();
  MEMORY[0x24BDAC7A8]();
  sub_23EC83828();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_23EC83444();
  __swift_allocate_value_buffer(v4, qword_256DC7A30);
  __swift_project_value_buffer(v4, (uint64_t)qword_256DC7A30);
  sub_23EC837EC();
  sub_23EC834B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD328], v0);
  return sub_23EC83450();
}

uint64_t static HomeXLModuleConfigurationIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23EC56BA8(&qword_256DC77F8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256DC7A30, a1);
}

uint64_t sub_23EC56958()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_23EC8342C();
  v2 = *(_QWORD *)(v9[0] - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EC834BC();
  MEMORY[0x24BDAC7A8]();
  sub_23EC83828();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_23EC83444();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = sub_23EC83288();
  __swift_allocate_value_buffer(v7, qword_256DC7A48);
  __swift_project_value_buffer(v7, (uint64_t)qword_256DC7A48);
  sub_23EC837EC();
  sub_23EC834B0();
  (*(void (**)(char *, _QWORD, _QWORD))(v2 + 104))(v4, *MEMORY[0x24BDCD328], v9[0]);
  sub_23EC83450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_23EC83294();
}

uint64_t static HomeXLModuleConfigurationIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23EC56BA8(&qword_256DC7800, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256DC7A48, a1);
}

uint64_t sub_23EC56BA8@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t HomeXLModuleConfigurationIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *);
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t result;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  void (*v66)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v67;
  unsigned int v68;
  uint64_t v69;
  char *v70;
  void (*v71)(char *);
  char *v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v60 = a1;
  v1 = sub_23EC832B8();
  MEMORY[0x24BDAC7A8](v1);
  v59 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8](v3);
  v58 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_23EC83360();
  v73 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v76 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A68);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v72 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A70);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23EC8342C();
  v17 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23EC83444();
  v27 = *(_QWORD *)(v26 - 8);
  v75 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A78);
  sub_23EC837EC();
  v62 = v22;
  sub_23EC834B0();
  v68 = *MEMORY[0x24BDCD328];
  v71 = *(void (**)(char *))(v17 + 104);
  v63 = v19;
  v71(v19);
  v67 = 0x800000023EC843F0;
  sub_23EC83450();
  v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  v30 = v70;
  v66(v70, 1, 1, v26);
  LOBYTE(v79) = 1;
  v31 = sub_23EC83978();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v13, 1, 1, v31);
  v32 = sub_23EC83210();
  v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
  v64 = v32;
  v65 = v33;
  v34 = v10;
  v33(v10, 1, 1, v32);
  v74 = *MEMORY[0x24BDB6090];
  v73 = *(_QWORD *)(v73 + 104);
  v35 = v77;
  ((void (*)(char *))v73)(v76);
  v61 = v29;
  v57 = sub_23EC83264();
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A80);
  v54 = v25;
  sub_23EC837EC();
  sub_23EC834B0();
  v36 = v68;
  v37 = v69;
  ((void (*)(char *, _QWORD, uint64_t))v71)(v63, v68, v69);
  sub_23EC83450();
  v38 = v66;
  v66(v30, 1, 1, v75);
  LOBYTE(v79) = 0;
  v53 = v34;
  v40 = v64;
  v39 = v65;
  v65(v34, 1, 1, v64);
  v39(v72, 1, 1, v40);
  ((void (*)(char *, _QWORD, uint64_t))v73)(v76, v74, v35);
  sub_23EC5746C();
  v56 = sub_23EC8324C();
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A90);
  sub_23EC837EC();
  sub_23EC834B0();
  v41 = v63;
  v42 = v37;
  v43 = v71;
  ((void (*)(char *, uint64_t, uint64_t))v71)(v63, v36, v42);
  sub_23EC83450();
  v44 = v70;
  v38(v70, 1, 1, v75);
  v45 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v58, 1, 1, v45);
  v47 = v64;
  v46 = v65;
  v65(v53, 1, 1, v64);
  v46(v72, 1, 1, v47);
  v48 = v76;
  ((void (*)(char *, _QWORD, uint64_t))v73)(v76, v74, v77);
  sub_23EC574B0();
  v72 = (char *)sub_23EC83258();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AA0);
  sub_23EC837EC();
  sub_23EC834B0();
  ((void (*)(char *, _QWORD, uint64_t))v43)(v41, v68, v69);
  sub_23EC83450();
  v66(v44, 1, 1, v75);
  v79 = 0;
  sub_23EC832AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B20);
  swift_getKeyPath();
  swift_getKeyPath();
  v78 = sub_23EC833A8();
  ((void (*)(char *, _QWORD, uint64_t))v73)(v48, v74, v77);
  sub_23EC58044();
  sub_23EC58F78(&qword_256DC7AA8, &qword_256DC7AB0, MEMORY[0x24BEE12E0]);
  result = sub_23EC83270();
  v50 = v60;
  v51 = v56;
  *v60 = v57;
  v50[1] = v51;
  v50[2] = (uint64_t)v72;
  v50[3] = result;
  return result;
}

unint64_t sub_23EC5746C()
{
  unint64_t result;

  result = qword_256DC7A88;
  if (!qword_256DC7A88)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_256DC7A88);
  }
  return result;
}

unint64_t sub_23EC574B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7A98;
  if (!qword_256DC7A98)
  {
    v1 = type metadata accessor for SelectedHomeEntity();
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for SelectedHomeEntity, v1);
    atomic_store(result, (unint64_t *)&qword_256DC7A98);
  }
  return result;
}

uint64_t HomeXLModuleConfigurationIntent.useRecommendations.getter()
{
  unsigned __int8 v1;

  sub_23EC83228();
  return v1;
}

uint64_t sub_23EC57528@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v3;
  return result;
}

uint64_t sub_23EC575B4()
{
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t HomeXLModuleConfigurationIntent.useRecommendations.setter()
{
  return sub_23EC83234();
}

uint64_t (*HomeXLModuleConfigurationIntent.useRecommendations.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

uint64_t HomeXLModuleConfigurationIntent.$useRecommendations.getter()
{
  return sub_23EC83240();
}

uint64_t HomeXLModuleConfigurationIntent.show.getter()
{
  unsigned __int8 v1;

  sub_23EC83228();
  return v1;
}

uint64_t sub_23EC57700@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v3;
  return result;
}

uint64_t sub_23EC5778C()
{
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t HomeXLModuleConfigurationIntent.show.setter()
{
  return sub_23EC83234();
}

uint64_t (*HomeXLModuleConfigurationIntent.show.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

uint64_t HomeXLModuleConfigurationIntent.$show.getter()
{
  return sub_23EC83240();
}

uint64_t HomeXLModuleConfigurationIntent.home.getter()
{
  return sub_23EC83228();
}

uint64_t HomeXLModuleConfigurationIntent.home.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8]();
  sub_23EC580CC(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23EC83234();
  return sub_23EC58114(a1);
}

uint64_t (*HomeXLModuleConfigurationIntent.home.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

uint64_t HomeXLModuleConfigurationIntent.$home.getter()
{
  return sub_23EC83240();
}

uint64_t HomeXLModuleConfigurationIntent.items.getter()
{
  uint64_t v1;

  sub_23EC83228();
  return v1;
}

uint64_t sub_23EC579DC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v3;
  return result;
}

uint64_t sub_23EC57A68()
{
  sub_23EC8333C();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t HomeXLModuleConfigurationIntent.items.setter()
{
  return sub_23EC83234();
}

uint64_t (*HomeXLModuleConfigurationIntent.items.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

void sub_23EC57B64(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t HomeXLModuleConfigurationIntent.$items.getter()
{
  return sub_23EC83240();
}

uint64_t static HomeXLModuleConfigurationIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;

  v0 = sub_23EC833F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6308], v0);
  v13 = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AB8);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AC0);
  v7 = sub_23EC58468();
  v8 = sub_23EC58F78(&qword_256DC7AC8, &qword_256DC7AB8, MEMORY[0x24BDB6460]);
  v9 = sub_23EC58F78(&qword_256DC7AD0, &qword_256DC7AC0, MEMORY[0x24BDB5F68]);
  v10 = sub_23EC58F78(&qword_256DC7AD8, &qword_256DC7A78, MEMORY[0x24BDB55D8]);
  return MEMORY[0x24265BCB8](KeyPath, v3, &v13, sub_23EC57DB4, 0, sub_23EC5845C, 0, v5, v6, MEMORY[0x24BEE1328], v7, v8, v9, MEMORY[0x24BEE1340], v10);
}

uint64_t sub_23EC57D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

uint64_t sub_23EC57DB4@<X0>(uint64_t a1@<X8>)
{
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
  void (*v12)(char *, uint64_t);
  _QWORD v14[2];

  v14[1] = a1;
  v1 = sub_23EC833E4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AB8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v14 - v10;
  swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDB6258], v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AC0);
  sub_23EC58468();
  sub_23EC58F78(&qword_256DC7AD0, &qword_256DC7AC0, MEMORY[0x24BDB5F68]);
  sub_23EC58F78((unint64_t *)&unk_256DC7B10, &qword_256DC7A90, MEMORY[0x24BDB55D8]);
  sub_23EC83408();
  sub_23EC58F78(&qword_256DC7AC8, &qword_256DC7AB8, MEMORY[0x24BDB6460]);
  sub_23EC8336C();
  v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v9, v5);
  sub_23EC8336C();
  return ((uint64_t (*)(char *, uint64_t))v12)(v11, v5);
}

uint64_t sub_23EC57FBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

unint64_t sub_23EC58044()
{
  unint64_t result;

  result = qword_256DC7B60;
  if (!qword_256DC7B60)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLTileEntityQuery, &type metadata for HomeXLTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_256DC7B60);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265CA80](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23EC580CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EC58114(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EC58154()
{
  return sub_23EC581F8();
}

uint64_t sub_23EC58160()
{
  return sub_23EC584B8();
}

uint64_t sub_23EC5816C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

uint64_t sub_23EC581EC()
{
  return sub_23EC581F8();
}

uint64_t sub_23EC581F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AC0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - v5;
  sub_23EC58468();
  sub_23EC83354();
  sub_23EC58F78(&qword_256DC7AD0, &qword_256DC7AC0, MEMORY[0x24BDB5F68]);
  sub_23EC8336C();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  sub_23EC8336C();
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_23EC5831C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_23EC58468();
  v0 = sub_23EC83348();
  sub_23EC83408();
  swift_getKeyPath();
  sub_23EC83348();
  v1 = sub_23EC83348();
  sub_23EC83408();
  swift_getKeyPath();
  sub_23EC83348();
  v2 = sub_23EC83348();
  sub_23EC83408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23EC843F0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  sub_23EC83930();
  sub_23EC83348();
  v4 = sub_23EC8333C();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23EC5845C()
{
  return sub_23EC581F8();
}

unint64_t sub_23EC58468()
{
  unint64_t result;

  result = qword_2543412D0;
  if (!qword_2543412D0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLModuleConfigurationIntent, &type metadata for HomeXLModuleConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412D0);
  }
  return result;
}

uint64_t sub_23EC584AC()
{
  return sub_23EC584B8();
}

uint64_t sub_23EC584B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  sub_23EC58468();
  v0 = sub_23EC83348();
  sub_23EC83408();
  swift_getKeyPath();
  sub_23EC83348();
  v1 = sub_23EC83348();
  sub_23EC83408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23EC84400;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  sub_23EC83930();
  sub_23EC83348();
  v3 = sub_23EC8333C();
  sub_23EC83408();
  sub_23EC83408();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23EC585B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

uint64_t sub_23EC58638()
{
  uint64_t v0;

  if (qword_256DC77F0 != -1)
    swift_once();
  swift_beginAccess();
  v0 = xmmword_256DC7A20;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC586B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC77F8 != -1)
    swift_once();
  v2 = sub_23EC83444();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7A30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC58730(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;

  v3 = sub_23EC833F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDB6308], v3);
  v15 = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AB8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7AC0);
  v10 = sub_23EC58F78(&qword_256DC7AC8, &qword_256DC7AB8, MEMORY[0x24BDB6460]);
  v11 = sub_23EC58F78(&qword_256DC7AD0, &qword_256DC7AC0, MEMORY[0x24BDB5F68]);
  v12 = sub_23EC58F78(&qword_256DC7AD8, &qword_256DC7A78, MEMORY[0x24BDB55D8]);
  return MEMORY[0x24265BCB8](KeyPath, v6, &v15, sub_23EC57DB4, 0, sub_23EC5845C, 0, v8, v9, MEMORY[0x24BEE1328], a2, v10, v11, MEMORY[0x24BEE1340], v12);
}

uint64_t sub_23EC588B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23EC58F30();
  *v1 = v0;
  v1[1] = sub_23EC58914;
  return sub_23EC833D8();
}

uint64_t sub_23EC58914()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;

  v2 = *v1;
  result = swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  return result;
}

uint64_t sub_23EC58974()
{
  sub_23EC58468();
  return sub_23EC831B0();
}

void static HomeXLModuleConfigurationIntent.defaultIntent.getter(uint64_t *a1@<X8>)
{
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
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v17 - v6;
  HomeXLModuleConfigurationIntent.init()(v17);
  v8 = v17[0];
  v9 = v17[1];
  v10 = v17[2];
  v11 = v17[3];
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v13 = objc_msgSend(v12, sel_homeManager);

  if (v13)
  {
    v14 = objc_msgSend(v13, sel_homes);
    sub_23EC58B7C();
    v15 = sub_23EC83918();

    if (v15 >> 62)
    {
      sub_23EC8333C();
      v16 = sub_23EC83C90();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v16 >= 2)
    {
      sub_23EC83348();
      sub_23EC83348();
      sub_23EC83348();
      sub_23EC83348();
      static SelectedHomeEntity.selectedHome.getter((uint64_t)v7);
      sub_23EC580CC((uint64_t)v7, (uint64_t)v5);
      sub_23EC83234();
      sub_23EC58114((uint64_t)v7);
      sub_23EC83408();
      sub_23EC83408();
      sub_23EC83408();
      sub_23EC83408();
    }

  }
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
}

unint64_t sub_23EC58B7C()
{
  unint64_t result;

  result = qword_256DC7C90;
  if (!qword_256DC7C90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DC7C90);
  }
  return result;
}

unint64_t sub_23EC58BC0()
{
  unint64_t result;

  result = qword_2543412D8;
  if (!qword_2543412D8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLModuleConfigurationIntent, &type metadata for HomeXLModuleConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412D8);
  }
  return result;
}

unint64_t sub_23EC58C08()
{
  unint64_t result;

  result = qword_2543412C8;
  if (!qword_2543412C8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLModuleConfigurationIntent, &type metadata for HomeXLModuleConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412C8);
  }
  return result;
}

unint64_t sub_23EC58C50()
{
  unint64_t result;

  result = qword_256DC7AE0;
  if (!qword_256DC7AE0)
  {
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB6680], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_256DC7AE0);
  }
  return result;
}

uint64_t sub_23EC58C94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for HomeXLModuleConfigurationIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  sub_23EC83348();
  return v3;
}

uint64_t destroy for HomeXLModuleConfigurationIntent()
{
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

_QWORD *initializeWithCopy for HomeXLModuleConfigurationIntent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  return a1;
}

_QWORD *assignWithCopy for HomeXLModuleConfigurationIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_23EC83348();
  sub_23EC83408();
  a1[1] = a2[1];
  sub_23EC83348();
  sub_23EC83408();
  a1[2] = a2[2];
  sub_23EC83348();
  sub_23EC83408();
  a1[3] = a2[3];
  sub_23EC83348();
  sub_23EC83408();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for HomeXLModuleConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  sub_23EC83408();
  *a1 = *a2;
  sub_23EC83408();
  sub_23EC83408();
  a1[1] = a2[1];
  sub_23EC83408();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLModuleConfigurationIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeXLModuleConfigurationIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeXLModuleConfigurationIntent()
{
  return &type metadata for HomeXLModuleConfigurationIntent;
}

uint64_t sub_23EC58F04()
{
  return sub_23EC58F78(&qword_256DC7AF0, &qword_256DC7AF8, MEMORY[0x24BDB6460]);
}

unint64_t sub_23EC58F30()
{
  unint64_t result;

  result = qword_256DC7B00;
  if (!qword_256DC7B00)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLModuleConfigurationIntent, &type metadata for HomeXLModuleConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_256DC7B00);
  }
  return result;
}

uint64_t sub_23EC58F78(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24265CA8C](a3, v6);
    atomic_store(result, a1);
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

uint64_t sub_23EC58FFC()
{
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t sub_23EC59074(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_23EC65E44(a1, (uint64_t)&v9 - v6, &qword_256DC7A60);
  sub_23EC65E44((uint64_t)v7, (uint64_t)v5, &qword_256DC7A60);
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC563CC((uint64_t)v7, &qword_256DC7A60);
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t HomeXLTileEntityQuery.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B20);
  swift_getKeyPath();
  swift_getKeyPath();
  result = sub_23EC833A8();
  *a1 = result;
  return result;
}

uint64_t HomeXLTileEntityQuery.moduleConfiguration.getter()
{
  return sub_23EC8339C();
}

uint64_t HomeXLTileEntityQuery.entities(for:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1[5] = a1;
  v1[6] = *(_QWORD *)(type metadata accessor for HomeXLTileEntity() - 8);
  v1[7] = swift_task_alloc();
  v3 = type metadata accessor for ElementID();
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC7B30 + dword_256DC7B30);
  v4 = (_QWORD *)swift_task_alloc();
  v1[11] = v4;
  *v4 = v1;
  v4[1] = sub_23EC592C4;
  return v6(1, a1);
}

uint64_t sub_23EC592C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 96) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC5934C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;

  if (qword_256DC7808 != -1)
    swift_once();
  v1 = sub_23EC83780();
  __swift_project_value_buffer(v1, (uint64_t)qword_256DC8528);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v2 = sub_23EC83768();
  v3 = sub_23EC83A5C();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 96);
  if (v4)
  {
    v31 = v3;
    v6 = *(_QWORD *)(v0 + 64);
    v7 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v32 = v30;
    *(_DWORD *)v7 = 136315650;
    v8 = sub_23EC8333C();
    v9 = MEMORY[0x24265C1C8](v8, v6);
    v11 = v10;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = sub_23EC79A04(v9, v11, &v32);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2048;
    v12 = *(_QWORD *)(v5 + 16);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 24) = v12;
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2080;
    v13 = MEMORY[0x24BEE4AF8];
    if (v12)
    {
      v28 = v7;
      v29 = v2;
      v14 = *(_QWORD *)(v0 + 96);
      v15 = *(_QWORD *)(v0 + 72);
      v16 = *(_QWORD *)(v0 + 48);
      v33 = MEMORY[0x24BEE4AF8];
      sub_23EC5EDD8(0, v12, 0);
      v17 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
      v18 = *(_QWORD *)(v16 + 72);
      v13 = v33;
      do
      {
        v19 = *(_QWORD *)(v0 + 80);
        v20 = *(_QWORD *)(v0 + 56);
        sub_23EC6522C(v17, v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
        sub_23EC6522C(v20, v19, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
        sub_23EC65E08(v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23EC5EDD8(0, *(_QWORD *)(v13 + 16) + 1, 1);
          v13 = v33;
        }
        v22 = *(_QWORD *)(v13 + 16);
        v21 = *(_QWORD *)(v13 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_23EC5EDD8(v21 > 1, v22 + 1, 1);
          v13 = v33;
        }
        v23 = *(_QWORD *)(v0 + 80);
        *(_QWORD *)(v13 + 16) = v22 + 1;
        sub_23EC65E88(v23, v13+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v22, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
        v17 += v18;
        --v12;
      }
      while (v12);
      v7 = v28;
      v2 = v29;
    }
    v24 = MEMORY[0x24265C1C8](v13, *(_QWORD *)(v0 + 64));
    v26 = v25;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_23EC79A04(v24, v26, &v32);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v2, v31, "entities for IDs: %s, found %ld elements = %s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v30, -1, -1);
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t HomeXLTileEntityQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[4] = a2;
  v4[5] = a3;
  v4[3] = a1;
  type metadata accessor for SelectedHomeEntity();
  v4[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v5 = swift_task_alloc();
  v6 = *v3;
  v4[7] = v5;
  v4[8] = v6;
  return swift_task_switch();
}

uint64_t sub_23EC597B4()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  if (qword_256DC7808 != -1)
    swift_once();
  v1 = sub_23EC83780();
  __swift_project_value_buffer(v1, (uint64_t)qword_256DC8528);
  swift_bridgeObjectRetain_n();
  v2 = sub_23EC83768();
  v3 = sub_23EC83A5C();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[5];
  if (v4)
  {
    v6 = v0[4];
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v18 = v8;
    *(_DWORD *)v7 = 136315138;
    sub_23EC8333C();
    v0[2] = sub_23EC79A04(v6, v5, &v18);
    sub_23EC83AF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v2, v3, "entities matching string: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v8, -1, -1);
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_23EC83348();
  v9 = sub_23EC8339C();
  v10 = v0[7];
  if (v9)
  {
    v11 = v0[6];
    swift_getKeyPath();
    sub_23EC6427C();
    sub_23EC8327C();
    sub_23EC83408();
    sub_23EC83408();
    sub_23EC6522C(v11, v10, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
    sub_23EC65E08(v11, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
    v12 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  v14 = v0[5];
  sub_23EC83408();
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256DC7B48 + dword_256DC7B48);
  v15 = (_QWORD *)swift_task_alloc();
  v0[9] = v15;
  *v15 = v0;
  v15[1] = sub_23EC59A68;
  return v17(v0[3], v0[4], v14, v0[7]);
}

uint64_t sub_23EC59A68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 56);
  v3 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_23EC563CC(v2, &qword_256DC7B40);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC59B08()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC59B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[29] = a3;
  v4[30] = a4;
  v4[27] = a1;
  v4[28] = a2;
  type metadata accessor for ElementID();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = type metadata accessor for TileElementInfo();
  v4[34] = swift_task_alloc();
  v5 = type metadata accessor for HomeXLTileEntity();
  v4[35] = v5;
  v4[36] = *(_QWORD *)(v5 - 8);
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  v4[41] = swift_task_alloc();
  sub_23EC8381C();
  v4[42] = swift_task_alloc();
  v6 = sub_23EC83444();
  v4[43] = v6;
  v4[44] = *(_QWORD *)(v6 - 8);
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7CB0);
  v4[47] = v7;
  v4[48] = *(_QWORD *)(v7 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v4[50] = swift_task_alloc();
  v8 = type metadata accessor for HomeID();
  v4[51] = v8;
  v4[52] = *(_QWORD *)(v8 - 8);
  v4[53] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC59D18()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  char *v10;

  v1 = v0[51];
  v2 = v0[52];
  v3 = v0[50];
  sub_23EC65E44(v0[30], v3, &qword_256DC7B40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23EC563CC(v0[50], &qword_256DC7B40);
    v4 = 1;
  }
  else
  {
    v6 = v0[52];
    v5 = v0[53];
    sub_23EC65E88(v0[50], v5, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BE8);
    v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23EC84640;
    sub_23EC65E88(v5, v4 + v7, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  }
  v0[54] = v4;
  v10 = (char *)&dword_256DC7B30 + dword_256DC7B30;
  v8 = (_QWORD *)swift_task_alloc();
  v0[55] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_23EC59E3C;
  return ((uint64_t (*)(uint64_t, _QWORD))v10)(v4, 0);
}

uint64_t sub_23EC59E3C(unint64_t a1)
{
  unint64_t v1;
  unint64_t **v2;
  unint64_t *v3;

  v3 = *v2;
  v3[56] = a1;
  v3[57] = v1;
  swift_task_dealloc();
  if (!v1)
    sub_23EC6521C(v3[54]);
  return swift_task_switch();
}

uint64_t sub_23EC59EB0()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(unint64_t, uint64_t);
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  char v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t result;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  int *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133[2];

  v1 = v0[56];
  v125 = *(_QWORD *)(v1 + 16);
  if (!v125)
  {
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_59:
    v68 = v5[2];
    if (v68 == 1)
    {
      v75 = (uint64_t)(v0 + 2);
      v76 = (uint64_t)(v0 + 7);
      if (qword_256DC7808 != -1)
        swift_once();
      v77 = sub_23EC83780();
      __swift_project_value_buffer(v77, (uint64_t)qword_256DC8528);
      v78 = sub_23EC83768();
      v79 = sub_23EC83A5C();
      if (os_log_type_enabled(v78, v79))
      {
        v131 = v0 + 2;
        v80 = (uint8_t *)swift_slowAlloc();
        v81 = swift_slowAlloc();
        v133[0] = v81;
        *(_DWORD *)v80 = 136315138;
        v74 = v129;
        v129[26] = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
        v75 = (uint64_t)v131;
        sub_23EC83AF8();
        _os_log_impl(&dword_23EC52000, v78, v79, "%s Only 1 group of accessories built. Returning as flat list.", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v81, -1, -1);
        MEMORY[0x24265CB1C](v80, -1, -1);

      }
      else
      {

        v74 = v129;
      }
      sub_23EC5CB38((uint64_t)v5, v76);
      result = sub_23EC65ECC(v76, v75, (uint64_t *)&unk_256DC7CB8);
      v100 = v74[6];
      if (!v100)
      {
        __break(1u);
        return result;
      }
      v101 = v74[57];
      v102 = v74[4];
      v103 = v74[5];
      sub_23EC65284(v74[2], v74[3]);
      sub_23EC65284(v102, v103);
      v133[0] = v100;
      sub_23EC8333C();
      sub_23EC5FAA8(v133, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(uint64_t))sub_23EC62C54);
      if (!v101)
      {
        v105 = v74[43];
        v104 = v74[44];
        v106 = v74[41];
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v106, 1, 1, v105);
        sub_23EC65F10(&qword_254341200, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
        sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
        sub_23EC832C4();
        goto LABEL_92;
      }
    }
    else
    {
      v2 = (unint64_t)(v0 + 25);
      if (!v68)
      {
        if (qword_256DC7808 != -1)
          goto LABEL_98;
        goto LABEL_62;
      }
      v82 = v0[57];
      v0[22] = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain_n();
      v83 = sub_23EC5F9B8((uint64_t)v5, &qword_256DC7CF0);
      swift_bridgeObjectRelease();
      v133[0] = (uint64_t)v83;
      sub_23EC5FB3C(v133, (uint64_t (*)(uint64_t))sub_23EC62C88, &qword_256DC7CF8);
      if (!v82)
      {
        swift_bridgeObjectRelease();
        v84 = v133[0];
        v85 = *(_QWORD *)(v133[0] + 16);
        if (v85)
        {
          v128 = v0[48];
          v126 = v0[44];
          sub_23EC83348();
          v86 = (uint64_t *)(v84 + 48);
          v87 = MEMORY[0x24BEE4AF8];
          do
          {
            v89 = *(v86 - 2);
            v88 = *(v86 - 1);
            v90 = *v86;
            v132 = v89;
            sub_23EC8333C();
            if (v88 > 1)
            {
              sub_23EC65270(v89, v88);
              sub_23EC83810();
              sub_23EC83804();
              sub_23EC837F8();
              sub_23EC83804();
              v0 = v129;
              sub_23EC83438();
            }
            else
            {
              sub_23EC83420();
            }
            v91 = v0[46];
            v92 = v0[35];
            (*(void (**)(uint64_t, _QWORD, _QWORD))(v126 + 32))(v91, v0[45], v0[43]);
            v93 = sub_23EC65298(v90);
            v94 = sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
            MEMORY[0x24265BB44](v91, v93, v92, v94);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v87 = sub_23EC5EB74(0, *(_QWORD *)(v87 + 16) + 1, 1, v87, &qword_256DC7CD8, &qword_256DC7CB0);
            v96 = *(_QWORD *)(v87 + 16);
            v95 = *(_QWORD *)(v87 + 24);
            if (v96 >= v95 >> 1)
              v87 = sub_23EC5EB74(v95 > 1, v96 + 1, 1, v87, &qword_256DC7CD8, &qword_256DC7CB0);
            v0 = v129;
            v97 = v129[49];
            v98 = v129[47];
            *(_QWORD *)(v87 + 16) = v96 + 1;
            (*(void (**)(unint64_t, uint64_t, uint64_t))(v128 + 32))(v87+ ((*(unsigned __int8 *)(v128 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80))+ *(_QWORD *)(v128 + 72) * v96, v97, v98);
            sub_23EC65284(v132, v88);
            swift_bridgeObjectRelease();
            v129[22] = v87;
            v86 += 3;
            --v85;
          }
          while (v85);
          sub_23EC83408();
        }
        sub_23EC83408();
        if (qword_256DC7808 != -1)
          swift_once();
        v107 = sub_23EC83780();
        __swift_project_value_buffer(v107, (uint64_t)qword_256DC8528);
        v108 = sub_23EC83768();
        v109 = sub_23EC83A5C();
        if (os_log_type_enabled(v108, v109))
        {
          v110 = swift_slowAlloc();
          v111 = swift_slowAlloc();
          v133[0] = v111;
          *(_DWORD *)v110 = 136315394;
          v0[24] = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
          sub_23EC83AF8();
          *(_WORD *)(v110 + 12) = 2048;
          swift_beginAccess();
          v0[23] = *(_QWORD *)(v0[22] + 16);
          v0 = v129;
          sub_23EC83AF8();
          _os_log_impl(&dword_23EC52000, v108, v109, "%s Multiple sections generated: %ld", (uint8_t *)v110, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24265CB1C](v111, -1, -1);
          MEMORY[0x24265CB1C](v110, -1, -1);
        }

        (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[44] + 56))(v0[41], 1, 1, v0[43]);
        swift_beginAccess();
        sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
        v74 = v129;
        sub_23EC832D0();
        goto LABEL_92;
      }
    }
    return sub_23EC83408();
  }
  v2 = 0;
  v123 = v0[35];
  v124 = v0[36];
  v3 = (int *)v0[33];
  v4 = v0[29];
  v121 = (*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80);
  v122 = v1 + v121;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  v117 = v4;
  v118 = v3;
  v119 = v0[56];
  while (v2 < *(_QWORD *)(v1 + 16))
  {
    v8 = v0[40];
    v9 = v0[34];
    v130 = *(_QWORD *)(v124 + 72);
    sub_23EC6522C(v122 + v130 * v2, v8, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    sub_23EC6522C(v8 + *(int *)(v123 + 24), v9, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    if (v4)
    {
      v10 = v0[28];
      v11 = (uint64_t *)(v0[34] + v3[5]);
      v13 = *v11;
      v12 = v11[1];
      v0[20] = v13;
      v0[21] = v12;
      v0[18] = v10;
      v0[19] = v4;
      sub_23EC65B48();
      if ((sub_23EC83B1C() & 1) == 0)
        goto LABEL_5;
    }
    v14 = v0[34];
    if ((*(_BYTE *)(v14 + v3[8]) & 1) != 0)
    {
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v17 = (uint64_t *)(v14 + v3[7]);
      v18 = v17[1];
      if (v18)
        v15 = *v17;
      else
        v15 = 0;
      if (v18 <= 1)
        v16 = 1;
      else
        v16 = v17[1];
      sub_23EC8333C();
    }
    v127 = v2;
    if (v5[2])
    {
      sub_23EC65270(v15, v16);
      v19 = sub_23EC5F488(v15, v16);
      if ((v20 & 1) != 0)
      {
        v21 = (uint64_t *)(v5[7] + 24 * v19);
        v22 = v21[2];
        v115 = *v21;
        v116 = v21[1];
        sub_23EC65270(*v21, v116);
        sub_23EC8333C();
        sub_23EC65284(v15, v16);
        v23 = *(_QWORD *)(v22 + 16);
        if (v23)
        {
          v112 = v16;
          v113 = v15;
          v114 = v5;
          v24 = v22;
          v25 = v22 + v121;
          v120 = v24;
          sub_23EC8333C();
          while (1)
          {
            v27 = v0[39];
            v26 = v0[40];
            v2 = v0[31];
            v28 = v0[32];
            sub_23EC6522C(v25, v27, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
            sub_23EC6522C(v27, v28, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            sub_23EC6522C(v26, v2, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            LOBYTE(v26) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
            v29 = sub_23EC834A4();
            v30 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8);
            v30(v2, v29);
            v30(v28, v29);
            sub_23EC65E08(v27, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
            if ((v26 & 1) != 0)
              break;
            v0 = v129;
            v25 += v130;
            if (!--v23)
            {
              v22 = v120;
              swift_bridgeObjectRelease();
              v15 = v113;
              v5 = v114;
              v16 = v112;
              goto LABEL_25;
            }
          }
          swift_bridgeObjectRelease();
          v15 = v113;
          v5 = v114;
          v0 = v129;
          v16 = v112;
        }
        else
        {
LABEL_25:
          sub_23EC6522C(v0[40], v0[38], (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v22 = sub_23EC5E85C(0, *(_QWORD *)(v22 + 16) + 1, 1, v22, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
          v2 = *(_QWORD *)(v22 + 16);
          v31 = *(_QWORD *)(v22 + 24);
          v120 = v22;
          if (v2 >= v31 >> 1)
            v120 = sub_23EC5E85C(v31 > 1, v2 + 1, 1, v22, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
          v32 = v0[38];
          *(_QWORD *)(v120 + 16) = v2 + 1;
          sub_23EC65E88(v32, v120 + v121 + v2 * v130, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v133[0] = (uint64_t)v5;
        v53 = v15;
        v54 = v16;
        v56 = sub_23EC5F488(v15, v16);
        v57 = v5[2];
        v58 = (v55 & 1) == 0;
        v59 = v57 + v58;
        if (__OFADD__(v57, v58))
          goto LABEL_96;
        v60 = v55;
        if (v5[3] >= v59)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            if ((v55 & 1) == 0)
              goto LABEL_54;
          }
          else
          {
            sub_23EC62274(&qword_256DC7CC8);
            v5 = (_QWORD *)v133[0];
            if ((v60 & 1) == 0)
              goto LABEL_54;
          }
        }
        else
        {
          sub_23EC61F08(v59, isUniquelyReferenced_nonNull_native, &qword_256DC7CC8);
          v5 = (_QWORD *)v133[0];
          v61 = sub_23EC5F488(v53, v54);
          if ((v60 & 1) != (v62 & 1))
            return sub_23EC83DBC();
          v56 = v61;
          if ((v60 & 1) == 0)
          {
LABEL_54:
            v5[(v56 >> 6) + 8] |= 1 << v56;
            v64 = (uint64_t *)(v5[6] + 16 * v56);
            *v64 = v53;
            v64[1] = v54;
            v65 = (uint64_t *)(v5[7] + 24 * v56);
            *v65 = v115;
            v65[1] = v116;
            v65[2] = v120;
            v66 = v5[2];
            v50 = __OFADD__(v66, 1);
            v67 = v66 + 1;
            if (v50)
              goto LABEL_97;
            v5[2] = v67;
            sub_23EC65270(v53, v54);
            goto LABEL_56;
          }
        }
        v63 = (uint64_t *)(v5[7] + 24 * v56);
        sub_23EC65284(*v63, v63[1]);
        swift_bridgeObjectRelease();
        *v63 = v115;
        v63[1] = v116;
        v63[2] = v120;
LABEL_56:
        swift_bridgeObjectRelease();
        sub_23EC65284(v53, v54);
        v2 = v127;
        v4 = v117;
        v3 = v118;
        v1 = v119;
        goto LABEL_5;
      }
      sub_23EC65284(v15, v16);
    }
    sub_23EC6522C(v0[40], v0[37], (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    sub_23EC65270(v15, v16);
    v33 = sub_23EC5E85C(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    v2 = *(_QWORD *)(v33 + 16);
    v34 = *(_QWORD *)(v33 + 24);
    if (v2 >= v34 >> 1)
      v33 = sub_23EC5E85C(v34 > 1, v2 + 1, 1, v33, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    v35 = v0[37];
    *(_QWORD *)(v33 + 16) = v2 + 1;
    sub_23EC65E88(v35, v33 + v121 + v2 * v130, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    v36 = swift_isUniquelyReferenced_nonNull_native();
    v133[0] = (uint64_t)v5;
    v37 = v15;
    v38 = v16;
    v40 = sub_23EC5F488(v15, v16);
    v41 = v5[2];
    v42 = (v39 & 1) == 0;
    v43 = v41 + v42;
    if (__OFADD__(v41, v42))
      goto LABEL_94;
    v44 = v39;
    if (v5[3] >= v43)
    {
      if ((v36 & 1) != 0)
      {
        if ((v39 & 1) == 0)
          goto LABEL_40;
      }
      else
      {
        sub_23EC62274(&qword_256DC7CC8);
        v5 = (_QWORD *)v133[0];
        if ((v44 & 1) == 0)
          goto LABEL_40;
      }
    }
    else
    {
      sub_23EC61F08(v43, v36, &qword_256DC7CC8);
      v5 = (_QWORD *)v133[0];
      v45 = sub_23EC5F488(v37, v38);
      if ((v44 & 1) != (v46 & 1))
        return sub_23EC83DBC();
      v40 = v45;
      if ((v44 & 1) == 0)
      {
LABEL_40:
        v5[(v40 >> 6) + 8] |= 1 << v40;
        v47 = (uint64_t *)(v5[6] + 16 * v40);
        *v47 = v37;
        v47[1] = v38;
        v48 = (uint64_t *)(v5[7] + 24 * v40);
        *v48 = v37;
        v48[1] = v38;
        v48[2] = v33;
        v49 = v5[2];
        v50 = __OFADD__(v49, 1);
        v51 = v49 + 1;
        if (v50)
          goto LABEL_95;
        v5[2] = v51;
        sub_23EC65270(v37, v38);
        goto LABEL_4;
      }
    }
    v6 = (uint64_t *)(v5[7] + 24 * v40);
    sub_23EC65284(*v6, v6[1]);
    swift_bridgeObjectRelease();
    *v6 = v37;
    v6[1] = v38;
    v6[2] = v33;
LABEL_4:
    swift_bridgeObjectRelease();
    sub_23EC65284(v37, v38);
    v2 = v127;
    v4 = v117;
    v3 = v118;
    v1 = v119;
LABEL_5:
    ++v2;
    v7 = v0[34];
    sub_23EC65E08(v0[40], (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
    sub_23EC65E08(v7, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    if (v2 == v125)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  swift_once();
LABEL_62:
  v69 = sub_23EC83780();
  __swift_project_value_buffer(v69, (uint64_t)qword_256DC8528);
  v70 = sub_23EC83768();
  v71 = sub_23EC83A5C();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    v73 = swift_slowAlloc();
    v133[0] = v73;
    *(_DWORD *)v72 = 136315138;
    *(_QWORD *)v2 = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
    sub_23EC83AF8();
    _os_log_impl(&dword_23EC52000, v70, v71, "%s No accessories found, returning empty collection", v72, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v73, -1, -1);
    MEMORY[0x24265CB1C](v72, -1, -1);
  }

  v74 = v129;
  sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
  sub_23EC832DC();
LABEL_92:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v74[1])();
}

uint64_t sub_23EC5AFF0()
{
  uint64_t v0;

  sub_23EC6521C(*(_QWORD *)(v0 + 432));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_23EC5B0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[29] = a3;
  v4[30] = a4;
  v4[27] = a1;
  v4[28] = a2;
  type metadata accessor for ElementID();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = type metadata accessor for TileElementInfo();
  v4[34] = swift_task_alloc();
  v5 = type metadata accessor for HomeSingleTileEntity();
  v4[35] = v5;
  v4[36] = *(_QWORD *)(v5 - 8);
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  v4[41] = swift_task_alloc();
  sub_23EC8381C();
  v4[42] = swift_task_alloc();
  v6 = sub_23EC83444();
  v4[43] = v6;
  v4[44] = *(_QWORD *)(v6 - 8);
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB8);
  v4[47] = v7;
  v4[48] = *(_QWORD *)(v7 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v4[50] = swift_task_alloc();
  v8 = type metadata accessor for HomeID();
  v4[51] = v8;
  v4[52] = *(_QWORD *)(v8 - 8);
  v4[53] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC5B2B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  char *v10;

  v1 = v0[51];
  v2 = v0[52];
  v3 = v0[50];
  sub_23EC65E44(v0[30], v3, &qword_256DC7B40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23EC563CC(v0[50], &qword_256DC7B40);
    v4 = 1;
  }
  else
  {
    v6 = v0[52];
    v5 = v0[53];
    sub_23EC65E88(v0[50], v5, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BE8);
    v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23EC84640;
    sub_23EC65E88(v5, v4 + v7, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  }
  v0[54] = v4;
  v10 = (char *)&dword_256DC7BC0 + dword_256DC7BC0;
  v8 = (_QWORD *)swift_task_alloc();
  v0[55] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_23EC5B3DC;
  return ((uint64_t (*)(uint64_t, _QWORD))v10)(v4, 0);
}

uint64_t sub_23EC5B3DC(unint64_t a1)
{
  unint64_t v1;
  unint64_t **v2;
  unint64_t *v3;

  v3 = *v2;
  v3[56] = a1;
  v3[57] = v1;
  swift_task_dealloc();
  if (!v1)
    sub_23EC6521C(v3[54]);
  return swift_task_switch();
}

uint64_t sub_23EC5B450()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(unint64_t, uint64_t);
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  char v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t result;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  int *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133[2];

  v1 = v0[56];
  v125 = *(_QWORD *)(v1 + 16);
  if (!v125)
  {
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_59:
    v68 = v5[2];
    if (v68 == 1)
    {
      v75 = (uint64_t)(v0 + 2);
      v76 = (uint64_t)(v0 + 7);
      if (qword_256DC7808 != -1)
        swift_once();
      v77 = sub_23EC83780();
      __swift_project_value_buffer(v77, (uint64_t)qword_256DC8528);
      v78 = sub_23EC83768();
      v79 = sub_23EC83A5C();
      if (os_log_type_enabled(v78, v79))
      {
        v131 = v0 + 2;
        v80 = (uint8_t *)swift_slowAlloc();
        v81 = swift_slowAlloc();
        v133[0] = v81;
        *(_DWORD *)v80 = 136315138;
        v74 = v129;
        v129[26] = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
        v75 = (uint64_t)v131;
        sub_23EC83AF8();
        _os_log_impl(&dword_23EC52000, v78, v79, "%s Only 1 group of accessories built. Returning as flat list.", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v81, -1, -1);
        MEMORY[0x24265CB1C](v80, -1, -1);

      }
      else
      {

        v74 = v129;
      }
      sub_23EC5CB38((uint64_t)v5, v76);
      result = sub_23EC65ECC(v76, v75, (uint64_t *)&unk_256DC7BD0);
      v100 = v74[6];
      if (!v100)
      {
        __break(1u);
        return result;
      }
      v101 = v74[57];
      v102 = v74[4];
      v103 = v74[5];
      sub_23EC65284(v74[2], v74[3]);
      sub_23EC65284(v102, v103);
      v133[0] = v100;
      sub_23EC8333C();
      sub_23EC5FAA8(v133, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(uint64_t))sub_23EC62CBC);
      if (!v101)
      {
        v105 = v74[43];
        v104 = v74[44];
        v106 = v74[41];
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v106, 1, 1, v105);
        sub_23EC65F10(&qword_254341258, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
        sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
        sub_23EC832C4();
        goto LABEL_92;
      }
    }
    else
    {
      v2 = (unint64_t)(v0 + 25);
      if (!v68)
      {
        if (qword_256DC7808 != -1)
          goto LABEL_98;
        goto LABEL_62;
      }
      v82 = v0[57];
      v0[22] = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain_n();
      v83 = sub_23EC5F9B8((uint64_t)v5, &qword_256DC7C28);
      swift_bridgeObjectRelease();
      v133[0] = (uint64_t)v83;
      sub_23EC5FB3C(v133, (uint64_t (*)(uint64_t))sub_23EC62CF0, &qword_256DC7C30);
      if (!v82)
      {
        swift_bridgeObjectRelease();
        v84 = v133[0];
        v85 = *(_QWORD *)(v133[0] + 16);
        if (v85)
        {
          v128 = v0[48];
          v126 = v0[44];
          sub_23EC83348();
          v86 = (uint64_t *)(v84 + 48);
          v87 = MEMORY[0x24BEE4AF8];
          do
          {
            v89 = *(v86 - 2);
            v88 = *(v86 - 1);
            v90 = *v86;
            v132 = v89;
            sub_23EC8333C();
            if (v88 > 1)
            {
              sub_23EC65270(v89, v88);
              sub_23EC83810();
              sub_23EC83804();
              sub_23EC837F8();
              sub_23EC83804();
              v0 = v129;
              sub_23EC83438();
            }
            else
            {
              sub_23EC83420();
            }
            v91 = v0[46];
            v92 = v0[35];
            (*(void (**)(uint64_t, _QWORD, _QWORD))(v126 + 32))(v91, v0[45], v0[43]);
            v93 = sub_23EC656F0(v90);
            v94 = sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
            MEMORY[0x24265BB44](v91, v93, v92, v94);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v87 = sub_23EC5EB74(0, *(_QWORD *)(v87 + 16) + 1, 1, v87, &qword_256DC7C08, &qword_256DC7BB8);
            v96 = *(_QWORD *)(v87 + 16);
            v95 = *(_QWORD *)(v87 + 24);
            if (v96 >= v95 >> 1)
              v87 = sub_23EC5EB74(v95 > 1, v96 + 1, 1, v87, &qword_256DC7C08, &qword_256DC7BB8);
            v0 = v129;
            v97 = v129[49];
            v98 = v129[47];
            *(_QWORD *)(v87 + 16) = v96 + 1;
            (*(void (**)(unint64_t, uint64_t, uint64_t))(v128 + 32))(v87+ ((*(unsigned __int8 *)(v128 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80))+ *(_QWORD *)(v128 + 72) * v96, v97, v98);
            sub_23EC65284(v132, v88);
            swift_bridgeObjectRelease();
            v129[22] = v87;
            v86 += 3;
            --v85;
          }
          while (v85);
          sub_23EC83408();
        }
        sub_23EC83408();
        if (qword_256DC7808 != -1)
          swift_once();
        v107 = sub_23EC83780();
        __swift_project_value_buffer(v107, (uint64_t)qword_256DC8528);
        v108 = sub_23EC83768();
        v109 = sub_23EC83A5C();
        if (os_log_type_enabled(v108, v109))
        {
          v110 = swift_slowAlloc();
          v111 = swift_slowAlloc();
          v133[0] = v111;
          *(_DWORD *)v110 = 136315394;
          v0[24] = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
          sub_23EC83AF8();
          *(_WORD *)(v110 + 12) = 2048;
          swift_beginAccess();
          v0[23] = *(_QWORD *)(v0[22] + 16);
          v0 = v129;
          sub_23EC83AF8();
          _os_log_impl(&dword_23EC52000, v108, v109, "%s Multiple sections generated: %ld", (uint8_t *)v110, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24265CB1C](v111, -1, -1);
          MEMORY[0x24265CB1C](v110, -1, -1);
        }

        (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[44] + 56))(v0[41], 1, 1, v0[43]);
        swift_beginAccess();
        sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
        v74 = v129;
        sub_23EC832D0();
        goto LABEL_92;
      }
    }
    return sub_23EC83408();
  }
  v2 = 0;
  v123 = v0[35];
  v124 = v0[36];
  v3 = (int *)v0[33];
  v4 = v0[29];
  v121 = (*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80);
  v122 = v1 + v121;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  v117 = v4;
  v118 = v3;
  v119 = v0[56];
  while (v2 < *(_QWORD *)(v1 + 16))
  {
    v8 = v0[40];
    v9 = v0[34];
    v130 = *(_QWORD *)(v124 + 72);
    sub_23EC6522C(v122 + v130 * v2, v8, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    sub_23EC6522C(v8 + *(int *)(v123 + 24), v9, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    if (v4)
    {
      v10 = v0[28];
      v11 = (uint64_t *)(v0[34] + v3[5]);
      v13 = *v11;
      v12 = v11[1];
      v0[20] = v13;
      v0[21] = v12;
      v0[18] = v10;
      v0[19] = v4;
      sub_23EC65B48();
      if ((sub_23EC83B1C() & 1) == 0)
        goto LABEL_5;
    }
    v14 = v0[34];
    if ((*(_BYTE *)(v14 + v3[8]) & 1) != 0)
    {
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v17 = (uint64_t *)(v14 + v3[7]);
      v18 = v17[1];
      if (v18)
        v15 = *v17;
      else
        v15 = 0;
      if (v18 <= 1)
        v16 = 1;
      else
        v16 = v17[1];
      sub_23EC8333C();
    }
    v127 = v2;
    if (v5[2])
    {
      sub_23EC65270(v15, v16);
      v19 = sub_23EC5F488(v15, v16);
      if ((v20 & 1) != 0)
      {
        v21 = (uint64_t *)(v5[7] + 24 * v19);
        v22 = v21[2];
        v115 = *v21;
        v116 = v21[1];
        sub_23EC65270(*v21, v116);
        sub_23EC8333C();
        sub_23EC65284(v15, v16);
        v23 = *(_QWORD *)(v22 + 16);
        if (v23)
        {
          v112 = v16;
          v113 = v15;
          v114 = v5;
          v24 = v22;
          v25 = v22 + v121;
          v120 = v24;
          sub_23EC8333C();
          while (1)
          {
            v27 = v0[39];
            v26 = v0[40];
            v2 = v0[31];
            v28 = v0[32];
            sub_23EC6522C(v25, v27, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
            sub_23EC6522C(v27, v28, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            sub_23EC6522C(v26, v2, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            LOBYTE(v26) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
            v29 = sub_23EC834A4();
            v30 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8);
            v30(v2, v29);
            v30(v28, v29);
            sub_23EC65E08(v27, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
            if ((v26 & 1) != 0)
              break;
            v0 = v129;
            v25 += v130;
            if (!--v23)
            {
              v22 = v120;
              swift_bridgeObjectRelease();
              v15 = v113;
              v5 = v114;
              v16 = v112;
              goto LABEL_25;
            }
          }
          swift_bridgeObjectRelease();
          v15 = v113;
          v5 = v114;
          v0 = v129;
          v16 = v112;
        }
        else
        {
LABEL_25:
          sub_23EC6522C(v0[40], v0[38], (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v22 = sub_23EC5E85C(0, *(_QWORD *)(v22 + 16) + 1, 1, v22, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
          v2 = *(_QWORD *)(v22 + 16);
          v31 = *(_QWORD *)(v22 + 24);
          v120 = v22;
          if (v2 >= v31 >> 1)
            v120 = sub_23EC5E85C(v31 > 1, v2 + 1, 1, v22, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
          v32 = v0[38];
          *(_QWORD *)(v120 + 16) = v2 + 1;
          sub_23EC65E88(v32, v120 + v121 + v2 * v130, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v133[0] = (uint64_t)v5;
        v53 = v15;
        v54 = v16;
        v56 = sub_23EC5F488(v15, v16);
        v57 = v5[2];
        v58 = (v55 & 1) == 0;
        v59 = v57 + v58;
        if (__OFADD__(v57, v58))
          goto LABEL_96;
        v60 = v55;
        if (v5[3] >= v59)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            if ((v55 & 1) == 0)
              goto LABEL_54;
          }
          else
          {
            sub_23EC62274(&qword_256DC7BF0);
            v5 = (_QWORD *)v133[0];
            if ((v60 & 1) == 0)
              goto LABEL_54;
          }
        }
        else
        {
          sub_23EC61F08(v59, isUniquelyReferenced_nonNull_native, &qword_256DC7BF0);
          v5 = (_QWORD *)v133[0];
          v61 = sub_23EC5F488(v53, v54);
          if ((v60 & 1) != (v62 & 1))
            return sub_23EC83DBC();
          v56 = v61;
          if ((v60 & 1) == 0)
          {
LABEL_54:
            v5[(v56 >> 6) + 8] |= 1 << v56;
            v64 = (uint64_t *)(v5[6] + 16 * v56);
            *v64 = v53;
            v64[1] = v54;
            v65 = (uint64_t *)(v5[7] + 24 * v56);
            *v65 = v115;
            v65[1] = v116;
            v65[2] = v120;
            v66 = v5[2];
            v50 = __OFADD__(v66, 1);
            v67 = v66 + 1;
            if (v50)
              goto LABEL_97;
            v5[2] = v67;
            sub_23EC65270(v53, v54);
            goto LABEL_56;
          }
        }
        v63 = (uint64_t *)(v5[7] + 24 * v56);
        sub_23EC65284(*v63, v63[1]);
        swift_bridgeObjectRelease();
        *v63 = v115;
        v63[1] = v116;
        v63[2] = v120;
LABEL_56:
        swift_bridgeObjectRelease();
        sub_23EC65284(v53, v54);
        v2 = v127;
        v4 = v117;
        v3 = v118;
        v1 = v119;
        goto LABEL_5;
      }
      sub_23EC65284(v15, v16);
    }
    sub_23EC6522C(v0[40], v0[37], (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    sub_23EC65270(v15, v16);
    v33 = sub_23EC5E85C(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    v2 = *(_QWORD *)(v33 + 16);
    v34 = *(_QWORD *)(v33 + 24);
    if (v2 >= v34 >> 1)
      v33 = sub_23EC5E85C(v34 > 1, v2 + 1, 1, v33, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    v35 = v0[37];
    *(_QWORD *)(v33 + 16) = v2 + 1;
    sub_23EC65E88(v35, v33 + v121 + v2 * v130, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    v36 = swift_isUniquelyReferenced_nonNull_native();
    v133[0] = (uint64_t)v5;
    v37 = v15;
    v38 = v16;
    v40 = sub_23EC5F488(v15, v16);
    v41 = v5[2];
    v42 = (v39 & 1) == 0;
    v43 = v41 + v42;
    if (__OFADD__(v41, v42))
      goto LABEL_94;
    v44 = v39;
    if (v5[3] >= v43)
    {
      if ((v36 & 1) != 0)
      {
        if ((v39 & 1) == 0)
          goto LABEL_40;
      }
      else
      {
        sub_23EC62274(&qword_256DC7BF0);
        v5 = (_QWORD *)v133[0];
        if ((v44 & 1) == 0)
          goto LABEL_40;
      }
    }
    else
    {
      sub_23EC61F08(v43, v36, &qword_256DC7BF0);
      v5 = (_QWORD *)v133[0];
      v45 = sub_23EC5F488(v37, v38);
      if ((v44 & 1) != (v46 & 1))
        return sub_23EC83DBC();
      v40 = v45;
      if ((v44 & 1) == 0)
      {
LABEL_40:
        v5[(v40 >> 6) + 8] |= 1 << v40;
        v47 = (uint64_t *)(v5[6] + 16 * v40);
        *v47 = v37;
        v47[1] = v38;
        v48 = (uint64_t *)(v5[7] + 24 * v40);
        *v48 = v37;
        v48[1] = v38;
        v48[2] = v33;
        v49 = v5[2];
        v50 = __OFADD__(v49, 1);
        v51 = v49 + 1;
        if (v50)
          goto LABEL_95;
        v5[2] = v51;
        sub_23EC65270(v37, v38);
        goto LABEL_4;
      }
    }
    v6 = (uint64_t *)(v5[7] + 24 * v40);
    sub_23EC65284(*v6, v6[1]);
    swift_bridgeObjectRelease();
    *v6 = v37;
    v6[1] = v38;
    v6[2] = v33;
LABEL_4:
    swift_bridgeObjectRelease();
    sub_23EC65284(v37, v38);
    v2 = v127;
    v4 = v117;
    v3 = v118;
    v1 = v119;
LABEL_5:
    ++v2;
    v7 = v0[34];
    sub_23EC65E08(v0[40], (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
    sub_23EC65E08(v7, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    if (v2 == v125)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  swift_once();
LABEL_62:
  v69 = sub_23EC83780();
  __swift_project_value_buffer(v69, (uint64_t)qword_256DC8528);
  v70 = sub_23EC83768();
  v71 = sub_23EC83A5C();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    v73 = swift_slowAlloc();
    v133[0] = v73;
    *(_DWORD *)v72 = 136315138;
    *(_QWORD *)v2 = sub_23EC79A04(0xD000000000000023, 0x800000023EC86EC0, v133);
    sub_23EC83AF8();
    _os_log_impl(&dword_23EC52000, v70, v71, "%s No accessories found, returning empty collection", v72, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v73, -1, -1);
    MEMORY[0x24265CB1C](v72, -1, -1);
  }

  v74 = v129;
  sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
  sub_23EC832DC();
LABEL_92:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v74[1])();
}

uint64_t HomeXLTileEntityQuery.suggestedEntities()(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v2[3] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v3 = swift_task_alloc();
  v4 = *v1;
  v2[4] = v3;
  v2[5] = v4;
  return swift_task_switch();
}

uint64_t sub_23EC5C610()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v8;

  sub_23EC83348();
  v1 = sub_23EC8339C();
  v2 = v0[4];
  if (v1)
  {
    v3 = v0[3];
    swift_getKeyPath();
    sub_23EC6427C();
    sub_23EC8327C();
    sub_23EC83408();
    sub_23EC83408();
    sub_23EC6522C(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
    sub_23EC65E08(v3, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
    v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_23EC83408();
  v8 = (char *)&dword_256DC7B48 + dword_256DC7B48;
  v6 = (_QWORD *)swift_task_alloc();
  v0[6] = v6;
  *v6 = v0;
  v6[1] = sub_23EC5C748;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v8)(v0[2], 0, 0, v0[4]);
}

uint64_t sub_23EC5C748()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 32);
  v3 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  swift_task_dealloc();
  sub_23EC563CC(v2, &qword_256DC7B40);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC5C7E8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC5C824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23EC55EF4;
  return HomeXLTileEntityQuery.entities(matching:)(a1, a2, a3);
}

uint64_t sub_23EC5C88C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B20);
  swift_getKeyPath();
  swift_getKeyPath();
  result = sub_23EC833A8();
  *a1 = result;
  return result;
}

uint64_t sub_23EC5C8EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC5C938;
  return HomeXLTileEntityQuery.entities(for:)(a1);
}

uint64_t sub_23EC5C938(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_23EC5C98C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC56630;
  return HomeXLTileEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_23EC5C9DC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23EC58044();
  *v1 = v0;
  v1[1] = sub_23EC56630;
  return sub_23EC83204();
}

uint64_t sub_23EC5CA48()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23EC55EF4;
  return sub_23EC83324();
}

uint64_t sub_23EC5CABC(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = sub_23EC62E68(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_23EC65DB0(result, v3, 0, a1);
  sub_23EC8333C();
  return v5;
}

uint64_t sub_23EC5CB38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  result = sub_23EC62D24(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
    result = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0uLL;
  }
  else
  {
    result = (uint64_t)sub_23EC62DAC((uint64_t *)&v10, result, v5, 0, a1);
    v9 = v10;
    v8 = v11;
  }
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v7;
  *(_OWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 32) = v8;
  return result;
}

uint64_t sub_23EC5CBD8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[8] = a1;
  v2[9] = a2;
  v3 = sub_23EC834A4();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC5CC38()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = sub_23EC8399C();
  *(_QWORD *)(v0 + 112) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC5CCA4()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC5CCE0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC5CD40()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_23EC5CDA4;
  return sub_23EC548B8();
}

uint64_t sub_23EC5CDA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC5CE20()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _QWORD *v49;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  _DWORD *v58;
  os_log_type_t type;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;

  if (qword_256DC7808 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 72);
  v2 = sub_23EC83780();
  __swift_project_value_buffer(v2, (uint64_t)qword_256DC8528);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  v3 = sub_23EC83768();
  v4 = sub_23EC83A2C();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 72);
  if (v5)
  {
    v7 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v63 = v60;
    *(_DWORD *)v7 = 136315394;
    type = v4;
    v8 = type metadata accessor for ElementID();
    v9 = sub_23EC8333C();
    v10 = MEMORY[0x24265C1C8](v9, v8);
    v12 = v11;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_23EC79A04(v10, v12, &v63);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    sub_23EC65CB0(v6);
    v13 = sub_23EC80FD4(v6);
    v15 = v14;
    sub_23EC6521C(v6);
    *(_QWORD *)(v0 + 56) = sub_23EC79A04(v13, v15, &v63);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v6);
    sub_23EC6521C(v6);
    _os_log_impl(&dword_23EC52000, v3, type, "entities for ids: [%s] in scope: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v60, -1, -1);
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_23EC6521C(v6);
    sub_23EC6521C(v6);
  }

  v16 = sub_23EC807A0(*(_QWORD *)(v0 + 72));
  *(_QWORD *)(v0 + 144) = v16;
  v17 = v16 >> 62;
  if (!(v16 >> 62))
  {
    v18 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v18 >= 1)
      goto LABEL_8;
LABEL_28:
    swift_bridgeObjectRelease();
    v51 = sub_23EC83768();
    v52 = sub_23EC83A44();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_23EC52000, v51, v52, "HMHomeManager.orderedHomes is empty", v53, 2u);
      MEMORY[0x24265CB1C](v53, -1, -1);
    }

    v46 = MEMORY[0x24BEE4AF8];
    goto LABEL_31;
  }
  sub_23EC8333C();
  v18 = sub_23EC83C90();
  swift_bridgeObjectRelease();
  if (v18 < 1)
    goto LABEL_28;
LABEL_8:
  v19 = (_QWORD *)(v0 + 16);
  v20 = *(_QWORD *)(v0 + 72);
  sub_23EC65CB0(v20);
  sub_23EC8333C();
  sub_23EC65CB0(v20);
  sub_23EC8333C();
  v21 = sub_23EC83768();
  v22 = sub_23EC83A2C();
  if (os_log_type_enabled(v21, v22))
  {
    v57 = v22;
    v54 = v0 + 32;
    v55 = v0 + 40;
    v23 = *(_QWORD *)(v0 + 88);
    v24 = (_DWORD *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v62 = v56;
    v58 = v24;
    *v24 = 136315394;
    v63 = MEMORY[0x24BEE4AF8];
    sub_23EC5ED80(0, v18, 0);
    v25 = 0;
    v26 = v63;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
        v27 = (id)MEMORY[0x24265C474](v25, v16);
      else
        v27 = *(id *)(v16 + 8 * v25 + 32);
      v28 = v27;
      v29 = objc_msgSend(v27, sel_uniqueIdentifier, v54, v55);
      sub_23EC8348C();

      v63 = v26;
      v31 = *(_QWORD *)(v26 + 16);
      v30 = *(_QWORD *)(v26 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_23EC5ED80(v30 > 1, v31 + 1, 1);
        v26 = v63;
      }
      v32 = *(_QWORD *)(v0 + 96);
      v33 = *(_QWORD *)(v0 + 80);
      ++v25;
      *(_QWORD *)(v26 + 16) = v31 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 32))(v26+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(_QWORD *)(v23 + 72) * v31, v32, v33);
    }
    while (v18 != v25);
    v35 = *(_QWORD *)(v0 + 72);
    v36 = MEMORY[0x24265C1C8](v26, *(_QWORD *)(v0 + 80));
    v38 = v37;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_23EC79A04(v36, v38, &v62);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *((_WORD *)v58 + 6) = 2080;
    sub_23EC65CB0(v35);
    v39 = sub_23EC80FD4(v35);
    v41 = v40;
    sub_23EC6521C(v35);
    *(_QWORD *)(v0 + 40) = sub_23EC79A04(v39, v41, &v62);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v35);
    sub_23EC6521C(v35);
    _os_log_impl(&dword_23EC52000, v21, v57, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v56, -1, -1);
    MEMORY[0x24265CB1C](v58, -1, -1);

    v19 = (_QWORD *)(v0 + 16);
    v17 = v16 >> 62;
  }
  else
  {
    v34 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease_n();
    sub_23EC6521C(v34);
    sub_23EC6521C(v34);

  }
  *v19 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    sub_23EC8333C();
    v42 = sub_23EC83C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v42 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(v0 + 152) = v42;
  v43 = *(_QWORD *)(v0 + 144);
  if (!v42)
  {
    v45 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

    v46 = *(_QWORD *)(v0 + 16);
LABEL_31:
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v46);
  }
  if ((v43 & 0xC000000000000001) != 0)
    v44 = (id)MEMORY[0x24265C474](0);
  else
    v44 = *(id *)(v43 + 32);
  v47 = (uint64_t)v44;
  *(_QWORD *)(v0 + 160) = v44;
  *(_QWORD *)(v0 + 168) = 1;
  v61 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC8030 + dword_256DC8030);
  v48 = v44;
  v49 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v49;
  *v49 = v0;
  v49[1] = sub_23EC5D580;
  return v61(*(_QWORD *)(v0 + 64), v47);
}

uint64_t sub_23EC5D580(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();

  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v4 + 192) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_23EC5D618()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 160);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_23EC5D65C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(id *)(v0 + 160);
  v5 = sub_23EC62F08(v1, v4, v0 + 24, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity, (void (*)(BOOL, unint64_t, uint64_t))sub_23EC5EDAC);

  swift_bridgeObjectRelease();
  sub_23EC5E6C4(v5, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);

  if (v2 == v3)
  {
    v6 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

    v7 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 144);
    if ((v10 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x24265C474](*(_QWORD *)(v0 + 168));
    else
      result = *(id *)(v10 + 8 * v9 + 32);
    v11 = (uint64_t)result;
    *(_QWORD *)(v0 + 160) = result;
    *(_QWORD *)(v0 + 168) = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
    }
    else
    {
      v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC8030 + dword_256DC8030);
      v12 = result;
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v13;
      *v13 = v0;
      v13[1] = sub_23EC5D580;
      return (id)v14(*(_QWORD *)(v0 + 64), v11);
    }
  }
  return result;
}

uint64_t sub_23EC5D7D8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[8] = a1;
  v2[9] = a2;
  v3 = sub_23EC834A4();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC5D838()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = sub_23EC8399C();
  *(_QWORD *)(v0 + 112) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC5D8A4()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC5D8E0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC5D940()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_23EC5D9A4;
  return sub_23EC548B8();
}

uint64_t sub_23EC5D9A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC5DA20()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _QWORD *v49;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  _DWORD *v58;
  os_log_type_t type;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;

  if (qword_256DC7808 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 72);
  v2 = sub_23EC83780();
  __swift_project_value_buffer(v2, (uint64_t)qword_256DC8528);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  v3 = sub_23EC83768();
  v4 = sub_23EC83A2C();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 72);
  if (v5)
  {
    v7 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v63 = v60;
    *(_DWORD *)v7 = 136315394;
    type = v4;
    v8 = type metadata accessor for ElementID();
    v9 = sub_23EC8333C();
    v10 = MEMORY[0x24265C1C8](v9, v8);
    v12 = v11;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_23EC79A04(v10, v12, &v63);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    sub_23EC65CB0(v6);
    v13 = sub_23EC80FD4(v6);
    v15 = v14;
    sub_23EC6521C(v6);
    *(_QWORD *)(v0 + 56) = sub_23EC79A04(v13, v15, &v63);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v6);
    sub_23EC6521C(v6);
    _os_log_impl(&dword_23EC52000, v3, type, "entities for ids: [%s] in scope: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v60, -1, -1);
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_23EC6521C(v6);
    sub_23EC6521C(v6);
  }

  v16 = sub_23EC807A0(*(_QWORD *)(v0 + 72));
  *(_QWORD *)(v0 + 144) = v16;
  v17 = v16 >> 62;
  if (!(v16 >> 62))
  {
    v18 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v18 >= 1)
      goto LABEL_8;
LABEL_28:
    swift_bridgeObjectRelease();
    v51 = sub_23EC83768();
    v52 = sub_23EC83A44();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_23EC52000, v51, v52, "HMHomeManager.orderedHomes is empty", v53, 2u);
      MEMORY[0x24265CB1C](v53, -1, -1);
    }

    v46 = MEMORY[0x24BEE4AF8];
    goto LABEL_31;
  }
  sub_23EC8333C();
  v18 = sub_23EC83C90();
  swift_bridgeObjectRelease();
  if (v18 < 1)
    goto LABEL_28;
LABEL_8:
  v19 = (_QWORD *)(v0 + 16);
  v20 = *(_QWORD *)(v0 + 72);
  sub_23EC65CB0(v20);
  sub_23EC8333C();
  sub_23EC65CB0(v20);
  sub_23EC8333C();
  v21 = sub_23EC83768();
  v22 = sub_23EC83A2C();
  if (os_log_type_enabled(v21, v22))
  {
    v57 = v22;
    v54 = v0 + 32;
    v55 = v0 + 40;
    v23 = *(_QWORD *)(v0 + 88);
    v24 = (_DWORD *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v62 = v56;
    v58 = v24;
    *v24 = 136315394;
    v63 = MEMORY[0x24BEE4AF8];
    sub_23EC5ED80(0, v18, 0);
    v25 = 0;
    v26 = v63;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
        v27 = (id)MEMORY[0x24265C474](v25, v16);
      else
        v27 = *(id *)(v16 + 8 * v25 + 32);
      v28 = v27;
      v29 = objc_msgSend(v27, sel_uniqueIdentifier, v54, v55);
      sub_23EC8348C();

      v63 = v26;
      v31 = *(_QWORD *)(v26 + 16);
      v30 = *(_QWORD *)(v26 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_23EC5ED80(v30 > 1, v31 + 1, 1);
        v26 = v63;
      }
      v32 = *(_QWORD *)(v0 + 96);
      v33 = *(_QWORD *)(v0 + 80);
      ++v25;
      *(_QWORD *)(v26 + 16) = v31 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 32))(v26+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(_QWORD *)(v23 + 72) * v31, v32, v33);
    }
    while (v18 != v25);
    v35 = *(_QWORD *)(v0 + 72);
    v36 = MEMORY[0x24265C1C8](v26, *(_QWORD *)(v0 + 80));
    v38 = v37;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_23EC79A04(v36, v38, &v62);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *((_WORD *)v58 + 6) = 2080;
    sub_23EC65CB0(v35);
    v39 = sub_23EC80FD4(v35);
    v41 = v40;
    sub_23EC6521C(v35);
    *(_QWORD *)(v0 + 40) = sub_23EC79A04(v39, v41, &v62);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v35);
    sub_23EC6521C(v35);
    _os_log_impl(&dword_23EC52000, v21, v57, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v56, -1, -1);
    MEMORY[0x24265CB1C](v58, -1, -1);

    v19 = (_QWORD *)(v0 + 16);
    v17 = v16 >> 62;
  }
  else
  {
    v34 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease_n();
    sub_23EC6521C(v34);
    sub_23EC6521C(v34);

  }
  *v19 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    sub_23EC8333C();
    v42 = sub_23EC83C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v42 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(v0 + 152) = v42;
  v43 = *(_QWORD *)(v0 + 144);
  if (!v42)
  {
    v45 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

    v46 = *(_QWORD *)(v0 + 16);
LABEL_31:
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v46);
  }
  if ((v43 & 0xC000000000000001) != 0)
    v44 = (id)MEMORY[0x24265C474](0);
  else
    v44 = *(id *)(v43 + 32);
  v47 = (uint64_t)v44;
  *(_QWORD *)(v0 + 160) = v44;
  *(_QWORD *)(v0 + 168) = 1;
  v61 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC8030 + dword_256DC8030);
  v48 = v44;
  v49 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v49;
  *v49 = v0;
  v49[1] = sub_23EC5E180;
  return v61(*(_QWORD *)(v0 + 64), v47);
}

uint64_t sub_23EC5E180(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();

  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v4 + 192) = a1;
  }
  return swift_task_switch();
}

id sub_23EC5E218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(id *)(v0 + 160);
  v5 = sub_23EC62F08(v1, v4, v0 + 24, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity, (void (*)(BOOL, unint64_t, uint64_t))sub_23EC5EE5C);

  swift_bridgeObjectRelease();
  sub_23EC5E6C4(v5, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);

  if (v2 == v3)
  {
    v6 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

    v7 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 144);
    if ((v10 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x24265C474](*(_QWORD *)(v0 + 168));
    else
      result = *(id *)(v10 + 8 * v9 + 32);
    v11 = (uint64_t)result;
    *(_QWORD *)(v0 + 160) = result;
    *(_QWORD *)(v0 + 168) = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
    }
    else
    {
      v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC8030 + dword_256DC8030);
      v12 = result;
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v13;
      *v13 = v0;
      v13[1] = sub_23EC5E180;
      return (id)v14(*(_QWORD *)(v0 + 64), v11);
    }
  }
  return result;
}

uint64_t sub_23EC5E394(unint64_t a1)
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
    sub_23EC8333C();
    v3 = sub_23EC83C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    sub_23EC8333C();
    v5 = sub_23EC83C90();
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
    sub_23EC8333C();
    v4 = MEMORY[0x24265C480](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23EC62654(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    sub_23EC8333C();
    v9 = sub_23EC83C90();
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
    return sub_23EC83930();
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC5E54C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_23EC5E85C(isUniquelyReferenced_nonNull_native, v23, 1, v3, (uint64_t *)&unk_256DC7C80, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for ElementID();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC5E6C4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = v6 + v4;
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v7 <= *(_QWORD *)(v5 + 24) >> 1)
  {
    v12 = *(_QWORD *)(a1 + 16);
    if (v12)
      goto LABEL_5;
LABEL_18:
    if (!v4)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v6 <= v7)
    v28 = v6 + v4;
  else
    v28 = v6;
  v5 = sub_23EC5E85C(isUniquelyReferenced_nonNull_native, v28, 1, v5, a2, a3);
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    goto LABEL_18;
LABEL_5:
  v13 = *(_QWORD *)(v5 + 16);
  v14 = (*(_QWORD *)(v5 + 24) >> 1) - v13;
  v15 = a3(0);
  if (v14 < (uint64_t)v12)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 72);
  v19 = v5 + v17 + v18 * v13;
  v20 = a1 + v17;
  v21 = v18 * v12;
  v22 = v19 + v21;
  v23 = v20 + v21;
  if (v20 < v22 && v19 < v23)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v12 < v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v25 = *(_QWORD *)(v5 + 16);
  v26 = __OFADD__(v25, v12);
  v27 = v25 + v12;
  if (!v26)
  {
    *(_QWORD *)(v5 + 16) = v27;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC5E848(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23EC5E85C(a1, a2, a3, a4, &qword_256DC7C48, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t sub_23EC5E85C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23EC83C84();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23EC64594(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_23EC5EA68(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C50);
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
    sub_23EC65CC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC5EB74(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23EC83C84();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23EC65B90(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23EC5ED80(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5EEB4(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7C40, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EDAC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5EEB4(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EDD8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5EEB4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_256DC7C80, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EE04(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5F094(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7CE8, &qword_256DC7CE0);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EE30(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5EEB4(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7CA8, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EE5C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5EEB4(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EE88(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EC5F094(a1, a2, a3, (_QWORD *)*v3, &qword_256DC7C20, &qword_256DC7C18);
  *v3 = result;
  return result;
}

uint64_t sub_23EC5EEB4(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    sub_23EC83408();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC5F094(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    sub_23EC83408();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC5F274(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 24);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = (unint64_t)(v13 + 4);
  v16 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= v16 + 24 * v11)
      memmove(v13 + 4, a4 + 4, 24 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 24 * v11 || v15 >= v16 + 24 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    sub_23EC83408();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

unint64_t sub_23EC5F41C(uint64_t a1)
{
  uint64_t v2;

  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_23EC837C8();
  return sub_23EC5F594(a1, v2);
}

unint64_t sub_23EC5F488(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_23EC83DF8();
  sub_23EC83E04();
  if (a2 > 1)
    sub_23EC83864();
  v4 = sub_23EC83E1C();
  return sub_23EC5F6D4(a1, a2, v4);
}

unint64_t sub_23EC5F518(char a1)
{
  uint64_t v2;

  sub_23EC83DF8();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  v2 = sub_23EC83E1C();
  return sub_23EC5F7B4(a1, v2);
}

unint64_t sub_23EC5F594(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_23EC834A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_23EC65F10(&qword_256DC7C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_23EC837E0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_23EC5F6D4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = ~v5;
    v10 = *(_QWORD *)(v3 + 48);
    do
    {
      v11 = (_QWORD *)(v10 + 16 * v6);
      v12 = v11[1];
      if (v12)
      {
        if (v12 == 1)
        {
          if (a2 == 1)
            return v6;
        }
        else if (a2 >= 2)
        {
          v13 = *v11 == a1 && v12 == a2;
          if (v13 || (sub_23EC83DA4() & 1) != 0)
            return v6;
        }
      }
      else if (!a2)
      {
        return v6;
      }
      v6 = (v6 + 1) & v9;
    }
    while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_23EC5F7B4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = a1;
    v7 = qword_23EC84828[v6];
    v8 = qword_23EC84840[v6];
    while (qword_23EC84828[*(char *)(*(_QWORD *)(v2 + 48) + v4)] != v7
         || qword_23EC84840[*(char *)(*(_QWORD *)(v2 + 48) + v4)] != v8)
    {
      v10 = sub_23EC83DA4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

_QWORD *sub_23EC5F8C4(unint64_t a1)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    sub_23EC8333C();
    sub_23EC62448((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    sub_23EC8333C();
    v2 = sub_23EC83C90();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t *sub_23EC5F9B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (uint64_t *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v4 = (uint64_t *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = v2;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
  v6 = sub_23EC62A24(&v8, v4 + 4, v2, a1);
  sub_23EC8333C();
  sub_23EC65CA8();
  if (v6 != (_QWORD *)v2)
  {
    __break(1u);
    return (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  return v4;
}

uint64_t sub_23EC5FAA8(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10[2];

  v6 = *(_QWORD *)(a2(0) - 8);
  v7 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = a3(v7);
  v8 = *(_QWORD *)(v7 + 16);
  v10[0] = v7 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v10[1] = v8;
  result = sub_23EC5FBB8(v10, a2);
  *a1 = v7;
  return result;
}

uint64_t sub_23EC5FB3C(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = sub_23EC606C8(v9, a3);
  *a1 = v6;
  return result;
}

uint64_t sub_23EC5FBB8(uint64_t *a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD);
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  BOOL v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(_QWORD);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  char v85;
  uint64_t v86;
  uint64_t v87;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  uint64_t v116;
  char v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;

  v168 = a2(0);
  v160 = *(_QWORD *)(v168 - 8);
  v4 = MEMORY[0x24BDAC7A8](v168);
  v157 = (uint64_t)&v149 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v169 = (uint64_t)&v149 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v149 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v149 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v149 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v149 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v155 = (uint64_t)&v149 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v154 = (uint64_t)&v149 - v22;
  v170 = a1;
  v23 = a1[1];
  result = sub_23EC83D74();
  if (result >= v23)
  {
    if (v23 < 0)
      goto LABEL_157;
    if (v23)
      return sub_23EC60F04(0, v23, 1, v170, a2);
    return result;
  }
  if (v23 >= 0)
    v25 = v23;
  else
    v25 = v23 + 1;
  if (v23 < -1)
    goto LABEL_165;
  v162 = v13;
  v163 = v10;
  v151 = result;
  if (v23 < 2)
  {
    v30 = (char *)MEMORY[0x24BEE4AF8];
    v159 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v160 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80));
    v29 = a2;
    v150 = MEMORY[0x24BEE4AF8];
    if (v23 != 1)
    {
      v32 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_124:
      v141 = v30;
      v142 = v161;
      if (v32 >= 2)
      {
        v143 = *v170;
        do
        {
          v144 = v32 - 2;
          if (v32 < 2)
            goto LABEL_152;
          if (!v143)
            goto LABEL_164;
          v145 = *(_QWORD *)&v141[16 * v144 + 32];
          v146 = *(_QWORD *)&v141[16 * v32 + 24];
          sub_23EC612BC(v143 + *(_QWORD *)(v160 + 72) * v145, v143 + *(_QWORD *)(v160 + 72) * *(_QWORD *)&v141[16 * v32 + 16], v143 + *(_QWORD *)(v160 + 72) * v146, v159, v29);
          if (v142)
            break;
          if (v146 < v145)
            goto LABEL_153;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v141 = sub_23EC61EF4((uint64_t)v141);
          if (v144 >= *((_QWORD *)v141 + 2))
            goto LABEL_154;
          v147 = &v141[16 * v144 + 32];
          *(_QWORD *)v147 = v145;
          *((_QWORD *)v147 + 1) = v146;
          v148 = *((_QWORD *)v141 + 2);
          if (v32 > v148)
            goto LABEL_155;
          memmove(&v141[16 * v32 + 16], &v141[16 * v32 + 32], 16 * (v148 - v32));
          *((_QWORD *)v141 + 2) = v148 - 1;
          v32 = v148 - 1;
        }
        while (v148 > 2);
      }
LABEL_135:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v150 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v26 = v25 >> 1;
    v27 = sub_23EC83954();
    *(_QWORD *)(v27 + 16) = v26;
    v28 = *(unsigned __int8 *)(v160 + 80);
    v150 = v27;
    v159 = v27 + ((v28 + 32) & ~v28);
    v29 = a2;
  }
  v31 = 0;
  v30 = (char *)MEMORY[0x24BEE4AF8];
  v152 = v19;
  v153 = v16;
  while (1)
  {
    v33 = v31;
    v158 = v31;
    if (v31 + 1 >= v23)
    {
      v46 = v31 + 1;
      v47 = v161;
      v48 = v31;
      goto LABEL_74;
    }
    v34 = *v170;
    v35 = *(_QWORD *)(v160 + 72);
    v149 = (char *)(v31 + 1);
    v36 = v154;
    sub_23EC6522C(v34 + v35 * (v31 + 1), v154, v29);
    v156 = v34;
    v166 = v35;
    v37 = v34 + v35 * v33;
    v38 = v155;
    sub_23EC6522C(v37, v155, v29);
    v39 = *(int *)(v168 + 24);
    v40 = v36 + v39;
    v164 = type metadata accessor for TileElementInfo();
    v41 = *(int *)(v164 + 20);
    v42 = *(_QWORD *)(v40 + v41);
    v43 = *(_QWORD *)(v40 + v41 + 8);
    v44 = (_QWORD *)(v38 + v39 + v41);
    if (v42 == *v44 && v43 == v44[1])
      LODWORD(v165) = 0;
    else
      LODWORD(v165) = sub_23EC83DA4();
    sub_23EC65E08(v155, v29);
    sub_23EC65E08(v154, v29);
    v167 = v158 + 2;
    if (v158 + 2 < v23)
    {
      v49 = v23;
      v50 = v166 * (_QWORD)v149;
      v51 = v156;
      v52 = v166 * (v158 + 2);
      while (1)
      {
        sub_23EC6522C(v51 + v52, (uint64_t)v19, v29);
        sub_23EC6522C(v51 + v50, (uint64_t)v16, v29);
        v53 = *(int *)(v168 + 24);
        v54 = *(int *)(v164 + 20);
        v55 = &v19[v53 + v54];
        v56 = &v16[v53 + v54];
        v57 = *(_QWORD *)v55 == *(_QWORD *)v56 && *((_QWORD *)v55 + 1) == *((_QWORD *)v56 + 1);
        v58 = v57 ? 0 : sub_23EC83DA4();
        sub_23EC65E08((uint64_t)v16, v29);
        sub_23EC65E08((uint64_t)v19, v29);
        if (((v165 ^ v58) & 1) != 0)
          break;
        v51 += v166;
        if (v49 == ++v167)
        {
          v23 = v49;
          v167 = v49;
          goto LABEL_35;
        }
      }
      v23 = v49;
    }
LABEL_35:
    v47 = v161;
    v48 = v158;
    if ((v165 & 1) == 0)
      break;
    v46 = v167;
    if (v167 < v158)
      goto LABEL_158;
    if (v158 >= v167)
      goto LABEL_49;
    v165 = v23;
    v149 = v30;
    v59 = 0;
    v60 = v166 * (v167 - 1);
    v61 = v167 * v166;
    v62 = v158;
    v63 = v158 * v166;
    do
    {
      if (v62 != v46 + v59 - 1)
      {
        v64 = v156;
        if (!v156)
          goto LABEL_163;
        v65 = v156 + v63;
        sub_23EC65E88(v156 + v63, v157, v29);
        if (v63 < v60 || v65 >= v64 + v61)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v63 != v60)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_23EC65E88(v157, v64 + v60, v29);
        v46 = v167;
      }
      ++v62;
      --v59;
      v60 -= v166;
      v61 -= v166;
      v63 += v166;
    }
    while (v62 < v46 + v59);
    v47 = v161;
    v30 = v149;
    v48 = v158;
    v23 = v165;
    if (v46 < v165)
      goto LABEL_50;
LABEL_74:
    if (v46 < v48)
      goto LABEL_151;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v167 = v46;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v30 = sub_23EC61B8C(0, *((_QWORD *)v30 + 2) + 1, 1, v30);
    v90 = *((_QWORD *)v30 + 2);
    v89 = *((_QWORD *)v30 + 3);
    v32 = v90 + 1;
    if (v90 >= v89 >> 1)
      v30 = sub_23EC61B8C((char *)(v89 > 1), v90 + 1, 1, v30);
    v161 = v47;
    *((_QWORD *)v30 + 2) = v32;
    v91 = v30 + 32;
    v92 = &v30[16 * v90 + 32];
    v93 = v167;
    *(_QWORD *)v92 = v48;
    *((_QWORD *)v92 + 1) = v93;
    if (v90)
    {
      while (1)
      {
        v94 = v32 - 1;
        if (v32 >= 4)
        {
          v99 = &v91[16 * v32];
          v100 = *((_QWORD *)v99 - 8);
          v101 = *((_QWORD *)v99 - 7);
          v105 = __OFSUB__(v101, v100);
          v102 = v101 - v100;
          if (v105)
            goto LABEL_140;
          v104 = *((_QWORD *)v99 - 6);
          v103 = *((_QWORD *)v99 - 5);
          v105 = __OFSUB__(v103, v104);
          v97 = v103 - v104;
          v98 = v105;
          if (v105)
            goto LABEL_141;
          v106 = v32 - 2;
          v107 = &v91[16 * v32 - 32];
          v109 = *(_QWORD *)v107;
          v108 = *((_QWORD *)v107 + 1);
          v105 = __OFSUB__(v108, v109);
          v110 = v108 - v109;
          if (v105)
            goto LABEL_143;
          v105 = __OFADD__(v97, v110);
          v111 = v97 + v110;
          if (v105)
            goto LABEL_146;
          if (v111 >= v102)
          {
            v129 = &v91[16 * v94];
            v131 = *(_QWORD *)v129;
            v130 = *((_QWORD *)v129 + 1);
            v105 = __OFSUB__(v130, v131);
            v132 = v130 - v131;
            if (v105)
              goto LABEL_150;
            v122 = v97 < v132;
            goto LABEL_111;
          }
        }
        else
        {
          if (v32 != 3)
          {
            v123 = *((_QWORD *)v30 + 4);
            v124 = *((_QWORD *)v30 + 5);
            v105 = __OFSUB__(v124, v123);
            v116 = v124 - v123;
            v117 = v105;
            goto LABEL_105;
          }
          v96 = *((_QWORD *)v30 + 4);
          v95 = *((_QWORD *)v30 + 5);
          v105 = __OFSUB__(v95, v96);
          v97 = v95 - v96;
          v98 = v105;
        }
        if ((v98 & 1) != 0)
          goto LABEL_142;
        v106 = v32 - 2;
        v112 = &v91[16 * v32 - 32];
        v114 = *(_QWORD *)v112;
        v113 = *((_QWORD *)v112 + 1);
        v115 = __OFSUB__(v113, v114);
        v116 = v113 - v114;
        v117 = v115;
        if (v115)
          goto LABEL_145;
        v118 = &v91[16 * v94];
        v120 = *(_QWORD *)v118;
        v119 = *((_QWORD *)v118 + 1);
        v105 = __OFSUB__(v119, v120);
        v121 = v119 - v120;
        if (v105)
          goto LABEL_148;
        if (__OFADD__(v116, v121))
          goto LABEL_149;
        if (v116 + v121 >= v97)
        {
          v122 = v97 < v121;
LABEL_111:
          if (v122)
            v94 = v106;
          goto LABEL_113;
        }
LABEL_105:
        if ((v117 & 1) != 0)
          goto LABEL_144;
        v125 = &v91[16 * v94];
        v127 = *(_QWORD *)v125;
        v126 = *((_QWORD *)v125 + 1);
        v105 = __OFSUB__(v126, v127);
        v128 = v126 - v127;
        if (v105)
          goto LABEL_147;
        if (v128 < v116)
          goto LABEL_14;
LABEL_113:
        v133 = v94 - 1;
        if (v94 - 1 >= v32)
        {
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
          goto LABEL_160;
        }
        if (!*v170)
          goto LABEL_162;
        v134 = v30;
        v135 = &v91[16 * v133];
        v136 = *(_QWORD *)v135;
        v137 = &v91[16 * v94];
        v138 = *((_QWORD *)v137 + 1);
        v139 = v161;
        sub_23EC612BC(*v170 + *(_QWORD *)(v160 + 72) * *(_QWORD *)v135, *v170 + *(_QWORD *)(v160 + 72) * *(_QWORD *)v137, *v170 + *(_QWORD *)(v160 + 72) * v138, v159, v29);
        v161 = v139;
        if (v139)
          goto LABEL_135;
        if (v138 < v136)
          goto LABEL_137;
        if (v94 > *((_QWORD *)v134 + 2))
          goto LABEL_138;
        *(_QWORD *)v135 = v136;
        *(_QWORD *)&v91[16 * v133 + 8] = v138;
        v140 = *((_QWORD *)v134 + 2);
        if (v94 >= v140)
          goto LABEL_139;
        v30 = v134;
        v32 = v140 - 1;
        memmove(&v91[16 * v94], v137 + 16, 16 * (v140 - 1 - v94));
        *((_QWORD *)v134 + 2) = v140 - 1;
        if (v140 <= 2)
          goto LABEL_14;
      }
    }
    v32 = 1;
LABEL_14:
    v23 = v170[1];
    v31 = v167;
    v19 = v152;
    v16 = v153;
    if (v167 >= v23)
      goto LABEL_124;
  }
  v46 = v167;
LABEL_49:
  if (v46 >= v23)
    goto LABEL_74;
LABEL_50:
  if (__OFSUB__(v46, v48))
    goto LABEL_156;
  if (v46 - v48 >= v151)
    goto LABEL_74;
  if (__OFADD__(v48, v151))
    goto LABEL_159;
  if (v48 + v151 >= v23)
    v66 = v23;
  else
    v66 = v48 + v151;
  if (v66 >= v48)
  {
    if (v46 != v66)
    {
      v149 = v30;
      v161 = v47;
      v67 = *(_QWORD *)(v160 + 72);
      v68 = v67 * (v46 - 1);
      v164 = v67;
      v69 = v46 * v67;
      v156 = v66;
      do
      {
        v71 = 0;
        v72 = v48;
        v166 = v68;
        v167 = v46;
        v165 = v69;
        while (1)
        {
          v73 = *v170;
          v74 = v69 + v71 + *v170;
          v75 = (uint64_t)v162;
          sub_23EC6522C(v74, (uint64_t)v162, v29);
          v76 = v68 + v71 + v73;
          v77 = v29;
          v78 = (uint64_t)v163;
          sub_23EC6522C(v76, (uint64_t)v163, v77);
          v79 = *(int *)(v168 + 24);
          v80 = *(int *)(type metadata accessor for TileElementInfo() + 20);
          v81 = *(_QWORD *)(v75 + v79 + v80);
          v82 = *(_QWORD *)(v75 + v79 + v80 + 8);
          v83 = (_QWORD *)(v78 + v79 + v80);
          if (v81 == *v83 && v82 == v83[1])
            break;
          v85 = sub_23EC83DA4();
          sub_23EC65E08(v78, v77);
          sub_23EC65E08(v75, v77);
          v29 = v77;
          if ((v85 & 1) == 0)
            goto LABEL_60;
          v86 = *v170;
          v69 = v165;
          v68 = v166;
          if (!*v170)
            goto LABEL_161;
          v87 = v86 + v166 + v71;
          sub_23EC65E88(v86 + v165 + v71, v169, v29);
          swift_arrayInitWithTakeFrontToBack();
          sub_23EC65E88(v169, v87, v29);
          v71 -= v164;
          ++v72;
          v70 = v167;
          if (v167 == v72)
            goto LABEL_61;
        }
        sub_23EC65E08(v78, v77);
        sub_23EC65E08(v75, v77);
        v29 = v77;
LABEL_60:
        v68 = v166;
        v70 = v167;
        v69 = v165;
LABEL_61:
        v46 = v70 + 1;
        v68 += v164;
        v69 += v164;
        v48 = v158;
      }
      while (v46 != v156);
      v46 = v156;
      v47 = v161;
      v30 = v149;
    }
    goto LABEL_74;
  }
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
  result = sub_23EC83C84();
  __break(1u);
  return result;
}

uint64_t sub_23EC606C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  int v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  char v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *__dst;
  uint64_t v117;
  uint64_t v118;

  v4 = v2;
  v6 = a1[1];
  result = sub_23EC83D74();
  if (result >= v6)
  {
    if (v6 < 0)
      goto LABEL_178;
    if (v6)
      return sub_23EC6117C(0, v6, 1, a1);
    return result;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_186;
  v113 = result;
  v110 = a1;
  if (v6 < 2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v6 != 1)
    {
      v15 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v14 = (char *)MEMORY[0x24BEE4AF8];
LABEL_144:
      v101 = v14;
      v112 = v11;
      v118 = v4;
      if (v15 >= 2)
      {
        v102 = *v110;
        do
        {
          v103 = v15 - 2;
          if (v15 < 2)
            goto LABEL_173;
          if (!v102)
            goto LABEL_185;
          v104 = v101;
          v105 = *(_QWORD *)&v101[16 * v103 + 32];
          v106 = *(_QWORD *)&v101[16 * v15 + 24];
          sub_23EC61800((char *)(v102 + 24 * v105), (char *)(v102 + 24 * *(_QWORD *)&v101[16 * v15 + 16]), (char *)(v102 + 24 * v106), __dst);
          if (v118)
            break;
          if (v106 < v105)
            goto LABEL_174;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v104 = sub_23EC61EF4((uint64_t)v104);
          if (v103 >= *((_QWORD *)v104 + 2))
            goto LABEL_175;
          v107 = &v104[16 * v103 + 32];
          *(_QWORD *)v107 = v105;
          *((_QWORD *)v107 + 1) = v106;
          v108 = *((_QWORD *)v104 + 2);
          if (v15 > v108)
            goto LABEL_176;
          memmove(&v104[16 * v15 + 16], &v104[16 * v15 + 32], 16 * (v108 - v15));
          v101 = v104;
          *((_QWORD *)v104 + 2) = v108 - 1;
          v15 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_141:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v112 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v112 = MEMORY[0x24BEE4AF8];
    v117 = v2;
  }
  else
  {
    v117 = v2;
    v9 = v8 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(a2);
    v10 = sub_23EC83954();
    *(_QWORD *)(v10 + 16) = v9;
    v112 = v10;
    __dst = (char *)(v10 + 32);
  }
  v12 = 0;
  v13 = *a1;
  v111 = *a1 + 56;
  v109 = *a1 - 24;
  v14 = (char *)MEMORY[0x24BEE4AF8];
  v114 = v6;
  v115 = *a1;
  while (2)
  {
    v16 = v12++;
    v17 = v16;
    if (v12 >= v6)
      goto LABEL_60;
    v18 = *(_QWORD *)(v13 + 24 * v12 + 8);
    v19 = *(_QWORD *)(v13 + 24 * v16 + 8);
    if (!v18)
      goto LABEL_22;
    if (v18 == 1)
    {
      v18 = 2;
LABEL_22:
      if (v19 == 1)
        v20 = 2;
      else
        v20 = 1;
      if (v19)
        v21 = v20 > v18;
      else
        v21 = 0;
      v22 = v21;
      goto LABEL_31;
    }
    if (v19 < 2)
    {
      v18 = 1;
      goto LABEL_22;
    }
    sub_23EC65B48();
    v22 = sub_23EC83B28() == -1;
LABEL_31:
    v12 = v17 + 2;
    if (v17 + 2 >= v6)
    {
LABEL_51:
      if (v22)
        goto LABEL_52;
      goto LABEL_60;
    }
    v23 = (unint64_t *)(v111 + 24 * v17);
    do
    {
      v24 = *v23;
      v25 = *(v23 - 3);
      if (*v23)
      {
        if (v24 == 1)
        {
          v24 = 2;
        }
        else
        {
          if (v25 >= 2)
          {
            sub_23EC65B48();
            if (v22 != (sub_23EC83B28() == -1))
              goto LABEL_51;
            goto LABEL_48;
          }
          v24 = 1;
        }
      }
      if (v25 == 1)
        v26 = 2;
      else
        v26 = 1;
      if (v25)
        v27 = v26 > v24;
      else
        v27 = 0;
      v28 = v27;
      if (v22 != v28)
        goto LABEL_51;
LABEL_48:
      v23 += 3;
      ++v12;
    }
    while (v6 != v12);
    v12 = v6;
    if (!v22)
      goto LABEL_60;
LABEL_52:
    if (v12 < v17)
      goto LABEL_179;
    v29 = v17;
    if (v17 < v12)
    {
      v30 = 24 * v12;
      v31 = 24 * v17;
      v32 = v12;
      do
      {
        if (v29 != --v32)
        {
          if (!v13)
            goto LABEL_184;
          v33 = v13 + v31;
          v34 = v13 + v30;
          v35 = *(_QWORD *)(v13 + v31 + 16);
          v36 = *(_OWORD *)(v13 + v31);
          v37 = *(_QWORD *)(v13 + v30 - 8);
          *(_OWORD *)v33 = *(_OWORD *)(v13 + v30 - 24);
          *(_QWORD *)(v33 + 16) = v37;
          *(_OWORD *)(v34 - 24) = v36;
          *(_QWORD *)(v34 - 8) = v35;
        }
        ++v29;
        v30 -= 24;
        v31 += 24;
      }
      while (v29 < v32);
    }
LABEL_60:
    if (v12 >= v6)
      goto LABEL_89;
    if (__OFSUB__(v12, v17))
      goto LABEL_177;
    if (v12 - v17 >= v113)
    {
LABEL_89:
      v39 = v17;
LABEL_90:
      if (v12 < v39)
        goto LABEL_172;
      goto LABEL_91;
    }
    if (__OFADD__(v17, v113))
      goto LABEL_180;
    if (v17 + v113 >= v6)
      v38 = v6;
    else
      v38 = v17 + v113;
    if (v38 >= v17)
    {
      v39 = v17;
      if (v12 == v38)
        goto LABEL_90;
      v40 = v109 + 24 * v12;
      while (2)
      {
        v41 = *(_QWORD *)(v13 + 24 * v12 + 8);
        v42 = v39;
        v43 = v40;
        while (2)
        {
          v44 = *(_QWORD *)(v43 + 8);
          if (!v41)
          {
            v45 = 1;
            goto LABEL_77;
          }
          if (v41 == 1)
            break;
          if (v44 >= 2)
          {
            sub_23EC65B48();
            if (sub_23EC83B28() != -1)
              break;
          }
          else
          {
            v45 = 0;
LABEL_77:
            if (v44 == 1)
              v45 = 1;
            if (v44)
              v46 = v45 == 0;
            else
              v46 = 1;
            if (v46)
              break;
          }
          if (!v13)
            goto LABEL_182;
          v41 = *(_QWORD *)(v43 + 32);
          v47 = *(_QWORD *)(v43 + 40);
          v49 = *(_QWORD *)(v43 + 16);
          v48 = *(_QWORD *)(v43 + 24);
          *(_OWORD *)(v43 + 24) = *(_OWORD *)v43;
          *(_QWORD *)(v43 + 40) = v49;
          *(_QWORD *)v43 = v48;
          *(_QWORD *)(v43 + 8) = v41;
          *(_QWORD *)(v43 + 16) = v47;
          v43 -= 24;
          if (v12 != ++v42)
            continue;
          break;
        }
        ++v12;
        v40 += 24;
        if (v12 != v38)
          continue;
        break;
      }
      v12 = v38;
      if (v38 < v39)
        goto LABEL_172;
LABEL_91:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_23EC61B8C(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
      v51 = *((_QWORD *)v14 + 2);
      v50 = *((_QWORD *)v14 + 3);
      v15 = v51 + 1;
      if (v51 >= v50 >> 1)
        v14 = sub_23EC61B8C((char *)(v50 > 1), v51 + 1, 1, v14);
      *((_QWORD *)v14 + 2) = v15;
      v52 = v14 + 32;
      v53 = &v14[16 * v51 + 32];
      *(_QWORD *)v53 = v39;
      *((_QWORD *)v53 + 1) = v12;
      if (v51)
      {
        v13 = v115;
        while (1)
        {
          v54 = v15 - 1;
          if (v15 >= 4)
          {
            v59 = &v52[16 * v15];
            v60 = *((_QWORD *)v59 - 8);
            v61 = *((_QWORD *)v59 - 7);
            v65 = __OFSUB__(v61, v60);
            v62 = v61 - v60;
            if (v65)
              goto LABEL_161;
            v64 = *((_QWORD *)v59 - 6);
            v63 = *((_QWORD *)v59 - 5);
            v65 = __OFSUB__(v63, v64);
            v57 = v63 - v64;
            v58 = v65;
            if (v65)
              goto LABEL_162;
            v66 = v15 - 2;
            v67 = &v52[16 * v15 - 32];
            v69 = *(_QWORD *)v67;
            v68 = *((_QWORD *)v67 + 1);
            v65 = __OFSUB__(v68, v69);
            v70 = v68 - v69;
            if (v65)
              goto LABEL_164;
            v65 = __OFADD__(v57, v70);
            v71 = v57 + v70;
            if (v65)
              goto LABEL_167;
            if (v71 >= v62)
            {
              v89 = &v52[16 * v54];
              v91 = *(_QWORD *)v89;
              v90 = *((_QWORD *)v89 + 1);
              v65 = __OFSUB__(v90, v91);
              v92 = v90 - v91;
              if (v65)
                goto LABEL_171;
              v82 = v57 < v92;
              goto LABEL_128;
            }
          }
          else
          {
            if (v15 != 3)
            {
              v83 = *((_QWORD *)v14 + 4);
              v84 = *((_QWORD *)v14 + 5);
              v65 = __OFSUB__(v84, v83);
              v76 = v84 - v83;
              v77 = v65;
              goto LABEL_122;
            }
            v56 = *((_QWORD *)v14 + 4);
            v55 = *((_QWORD *)v14 + 5);
            v65 = __OFSUB__(v55, v56);
            v57 = v55 - v56;
            v58 = v65;
          }
          if ((v58 & 1) != 0)
            goto LABEL_163;
          v66 = v15 - 2;
          v72 = &v52[16 * v15 - 32];
          v74 = *(_QWORD *)v72;
          v73 = *((_QWORD *)v72 + 1);
          v75 = __OFSUB__(v73, v74);
          v76 = v73 - v74;
          v77 = v75;
          if (v75)
            goto LABEL_166;
          v78 = &v52[16 * v54];
          v80 = *(_QWORD *)v78;
          v79 = *((_QWORD *)v78 + 1);
          v65 = __OFSUB__(v79, v80);
          v81 = v79 - v80;
          if (v65)
            goto LABEL_169;
          if (__OFADD__(v76, v81))
            goto LABEL_170;
          if (v76 + v81 >= v57)
          {
            v82 = v57 < v81;
LABEL_128:
            if (v82)
              v54 = v66;
            goto LABEL_130;
          }
LABEL_122:
          if ((v77 & 1) != 0)
            goto LABEL_165;
          v85 = &v52[16 * v54];
          v87 = *(_QWORD *)v85;
          v86 = *((_QWORD *)v85 + 1);
          v65 = __OFSUB__(v86, v87);
          v88 = v86 - v87;
          if (v65)
            goto LABEL_168;
          if (v88 < v76)
            goto LABEL_15;
LABEL_130:
          v93 = v54 - 1;
          if (v54 - 1 >= v15)
          {
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
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
LABEL_172:
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
            goto LABEL_181;
          }
          if (!v13)
            goto LABEL_183;
          v94 = v14;
          v95 = v13;
          v96 = &v52[16 * v93];
          v97 = *(_QWORD *)v96;
          v98 = &v52[16 * v54];
          v99 = *((_QWORD *)v98 + 1);
          sub_23EC61800((char *)(v95 + 24 * *(_QWORD *)v96), (char *)(v95 + 24 * *(_QWORD *)v98), (char *)(v95 + 24 * v99), __dst);
          if (v117)
            goto LABEL_141;
          if (v99 < v97)
            goto LABEL_158;
          if (v54 > *((_QWORD *)v94 + 2))
            goto LABEL_159;
          *(_QWORD *)v96 = v97;
          *(_QWORD *)&v52[16 * v93 + 8] = v99;
          v100 = *((_QWORD *)v94 + 2);
          if (v54 >= v100)
            goto LABEL_160;
          v14 = v94;
          v15 = v100 - 1;
          memmove(&v52[16 * v54], v98 + 16, 16 * (v100 - 1 - v54));
          *((_QWORD *)v94 + 2) = v100 - 1;
          v21 = v100 > 2;
          v13 = v115;
          if (!v21)
            goto LABEL_15;
        }
      }
      v15 = 1;
      v13 = v115;
LABEL_15:
      v6 = v114;
      if (v12 >= v114)
      {
        v4 = v117;
        v11 = v112;
        goto LABEL_144;
      }
      continue;
    }
    break;
  }
LABEL_181:
  __break(1u);
LABEL_182:
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  result = sub_23EC83C84();
  __break(1u);
  return result;
}

uint64_t sub_23EC60F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v37 = a4;
  v32 = a1;
  v35 = a5(0);
  v8 = MEMORY[0x24BDAC7A8](v35);
  v36 = (uint64_t)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  result = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v30 - v15;
  v34 = a3;
  v31 = a2;
  if (a3 != a2)
  {
    v17 = *(_QWORD *)(v14 + 72);
    v39 = v17 * (v34 - 1);
    v33 = v17;
    v38 = v17 * v34;
LABEL_6:
    v18 = 0;
    v19 = v32;
    while (1)
    {
      v20 = *v37;
      sub_23EC6522C(v38 + v18 + *v37, (uint64_t)v16, a5);
      sub_23EC6522C(v39 + v18 + v20, (uint64_t)v12, a5);
      v21 = *(int *)(v35 + 24);
      v22 = *(int *)(type metadata accessor for TileElementInfo() + 20);
      v23 = *(_QWORD *)&v16[v21 + v22];
      v24 = *(_QWORD *)&v16[v21 + 8 + v22];
      v25 = &v12[v21 + v22];
      if (v23 == *(_QWORD *)v25 && v24 == *((_QWORD *)v25 + 1))
      {
        sub_23EC65E08((uint64_t)v12, a5);
        result = sub_23EC65E08((uint64_t)v16, a5);
LABEL_5:
        v39 += v33;
        v38 += v33;
        if (++v34 == v31)
          return result;
        goto LABEL_6;
      }
      v27 = sub_23EC83DA4();
      sub_23EC65E08((uint64_t)v12, a5);
      result = sub_23EC65E08((uint64_t)v16, a5);
      if ((v27 & 1) == 0)
        goto LABEL_5;
      v28 = *v37;
      if (!*v37)
        break;
      v29 = v28 + v39 + v18;
      sub_23EC65E88(v28 + v38 + v18, v36, a5);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_23EC65E88(v36, v29, a5);
      v18 -= v33;
      if (v34 == ++v19)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23EC6117C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 24 * a3 - 24;
LABEL_5:
    v9 = *(_QWORD *)(v7 + 24 * v4 + 8);
    v10 = v6;
    v11 = v8;
    while (1)
    {
      v12 = *(_QWORD *)(v11 + 8);
      if (v9)
      {
        if (v9 == 1)
          goto LABEL_4;
        if (v12 >= 2)
        {
          sub_23EC65B48();
          result = sub_23EC83B28();
          if (result != -1)
            goto LABEL_4;
          goto LABEL_20;
        }
        v13 = 0;
      }
      else
      {
        v13 = 1;
      }
      if (v12 == 1)
        v13 = 1;
      if (v12)
        v14 = v13 == 0;
      else
        v14 = 1;
      if (v14)
      {
LABEL_4:
        ++v4;
        v8 += 24;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
LABEL_20:
      if (!v7)
      {
        __break(1u);
        return result;
      }
      v9 = *(_QWORD *)(v11 + 32);
      v15 = *(_QWORD *)(v11 + 40);
      v17 = *(_QWORD *)(v11 + 16);
      v16 = *(_QWORD *)(v11 + 24);
      *(_OWORD *)(v11 + 24) = *(_OWORD *)v11;
      *(_QWORD *)(v11 + 40) = v17;
      *(_QWORD *)v11 = v16;
      *(_QWORD *)(v11 + 8) = v9;
      *(_QWORD *)(v11 + 16) = v15;
      v11 -= 24;
      if (v4 == ++v10)
        goto LABEL_4;
    }
  }
  return result;
}

uint64_t sub_23EC612BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t result;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;

  v61 = a5(0);
  v10 = MEMORY[0x24BDAC7A8](v61);
  v60 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v59 = (uint64_t)&v57 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v57 - v18;
  v20 = *(_QWORD *)(v17 + 72);
  if (!v20)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v21 = *(_QWORD *)(v17 + 72);
  v22 = a1;
  if (a2 - a1 == 0x8000000000000000 && v21 == -1)
    goto LABEL_72;
  v23 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v20 == -1)
    goto LABEL_73;
  v24 = (uint64_t)(a2 - a1) / v20;
  v64 = a1;
  v63 = a4;
  v25 = v23 / v20;
  if (v24 >= v23 / v21)
  {
    if ((v25 & 0x8000000000000000) == 0)
    {
      v58 = a1;
      v27 = v25 * v21;
      if (a4 < a2 || a2 + v27 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v40 = a4 + v27;
      v62 = a4 + v27;
      v64 = a2;
      if (v27 >= 1 && v58 < a2)
      {
        v42 = -v21;
        v43 = v60;
        do
        {
          v44 = v59;
          sub_23EC6522C(v40 + v42, v59, a5);
          v45 = a2 + v42;
          sub_23EC6522C(a2 + v42, v43, a5);
          v46 = *(int *)(v61 + 24);
          v47 = v44 + v46;
          v48 = *(int *)(type metadata accessor for TileElementInfo() + 20);
          v49 = *(_QWORD *)(v47 + v48);
          v50 = *(_QWORD *)(v47 + v48 + 8);
          v51 = (_QWORD *)(v43 + v46 + v48);
          if (v49 == *v51 && v50 == v51[1])
            v53 = 0;
          else
            v53 = sub_23EC83DA4();
          v54 = a3 + v42;
          sub_23EC65E08(v60, a5);
          sub_23EC65E08(v59, a5);
          if ((v53 & 1) != 0)
          {
            if (a3 < a2 || v54 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v64 += v42;
          }
          else
          {
            v55 = v62;
            v62 += v42;
            if (a3 < v55 || v54 >= v55)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v55)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v45 = a2;
          }
          v40 = v62;
          if (v62 <= a4)
            break;
          a2 = v45;
          a3 += v42;
        }
        while (v45 > v58);
      }
LABEL_70:
      sub_23EC61D2C(&v64, &v63, (uint64_t *)&v62, a5);
      return 1;
    }
  }
  else if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24 * v21;
    if (a4 < v22 || v22 + v26 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v22)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v28 = a4 + v26;
    v62 = a4 + v26;
    if (v26 >= 1 && a2 < a3)
    {
      while (1)
      {
        sub_23EC6522C(a2, (uint64_t)v19, a5);
        sub_23EC6522C(a4, (uint64_t)v16, a5);
        v30 = *(int *)(v61 + 24);
        v31 = *(int *)(type metadata accessor for TileElementInfo() + 20);
        v32 = *(_QWORD *)&v19[v30 + v31];
        v33 = *(_QWORD *)&v19[v30 + 8 + v31];
        v34 = &v16[v30 + v31];
        if (v32 == *(_QWORD *)v34 && v33 == *((_QWORD *)v34 + 1))
          break;
        v36 = sub_23EC83DA4();
        sub_23EC65E08((uint64_t)v16, a5);
        sub_23EC65E08((uint64_t)v19, a5);
        if ((v36 & 1) == 0)
          goto LABEL_32;
        v37 = v64;
        v38 = a2 + v21;
        if (v64 < a2 || v64 >= v38)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v64 == a2)
        {
          v37 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_38:
        v64 = v37 + v21;
        a4 = v63;
        if (v63 < v28)
        {
          a2 = v38;
          if (v38 < a3)
            continue;
        }
        goto LABEL_70;
      }
      sub_23EC65E08((uint64_t)v16, a5);
      sub_23EC65E08((uint64_t)v19, a5);
LABEL_32:
      v37 = v64;
      v39 = v63 + v21;
      if (v64 < v63 || v64 >= v39)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v64 != v63)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v63 = v39;
      v38 = a2;
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_74:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC61800(char *__src, char *a2, char *a3, char *__dst)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  BOOL v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  BOOL v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t result;
  char *v32;
  char *v33;
  char *v34;

  v4 = __dst;
  v5 = a3;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - a2;
  v11 = (a3 - a2) / 24;
  v34 = __src;
  v33 = __dst;
  if (v9 >= v11)
  {
    if (v10 < -23)
      goto LABEL_63;
    if (__dst != a2 || &a2[24 * v11] <= __dst)
      memmove(__dst, a2, 24 * v11);
    v20 = &v4[24 * v11];
    v32 = v20;
    v34 = v6;
    if (v7 >= v6 || v10 < 24)
    {
LABEL_62:
      sub_23EC61E38((void **)&v34, (const void **)&v33, &v32);
      return 1;
    }
    v21 = v6;
    while (1)
    {
      v22 = *((_QWORD *)v20 - 2);
      v23 = *((_QWORD *)v21 - 2);
      v21 -= 24;
      if (v22)
      {
        if (v22 == 1)
        {
          v24 = (unint64_t)(v5 - 24);
LABEL_56:
          v32 = v20 - 24;
          if (v5 < v20 || v24 >= (unint64_t)v20 || v5 != v20)
          {
            v30 = *(_OWORD *)(v20 - 24);
            *(_QWORD *)(v24 + 16) = *((_QWORD *)v20 - 1);
            *(_OWORD *)v24 = v30;
          }
          v21 = v6;
          v20 -= 24;
          if (v6 <= v7)
            goto LABEL_62;
          goto LABEL_61;
        }
        if (v23 >= 2)
        {
          sub_23EC65B48();
          v29 = sub_23EC83B28();
          v24 = (unint64_t)(v5 - 24);
          if (v29 != -1)
            goto LABEL_56;
          goto LABEL_50;
        }
        v25 = 0;
      }
      else
      {
        v25 = 1;
      }
      if (v23 == 1)
        v26 = 1;
      else
        v26 = v25;
      v24 = (unint64_t)(v5 - 24);
      if (v23)
        v27 = v26 == 0;
      else
        v27 = 1;
      if (v27)
        goto LABEL_56;
LABEL_50:
      if (v5 != v6 || v24 >= (unint64_t)v6)
      {
        v28 = *(_OWORD *)v21;
        *(_QWORD *)(v24 + 16) = *((_QWORD *)v21 + 2);
        *(_OWORD *)v24 = v28;
      }
      v34 = v21;
      if (v21 <= v7)
        goto LABEL_62;
LABEL_61:
      v6 = v21;
      v5 = (char *)v24;
      if (v20 <= v4)
        goto LABEL_62;
    }
  }
  if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[24 * v9];
    v32 = v12;
    if (v6 < v5 && v8 >= 24)
    {
      while (1)
      {
        v13 = *((_QWORD *)v6 + 1);
        v14 = *((_QWORD *)v4 + 1);
        if (v13)
        {
          if (v13 == 1)
            goto LABEL_24;
          if (v14 >= 2)
          {
            sub_23EC65B48();
            if (sub_23EC83B28() != -1)
              goto LABEL_24;
            goto LABEL_19;
          }
          v15 = 0;
        }
        else
        {
          v15 = 1;
        }
        if (v14 == 1)
          v15 = 1;
        if (v14)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (v16)
        {
LABEL_24:
          if (v7 != v4)
          {
            v19 = *(_OWORD *)v4;
            *((_QWORD *)v7 + 2) = *((_QWORD *)v4 + 2);
            *(_OWORD *)v7 = v19;
          }
          v4 += 24;
          v33 = v4;
          v17 = v6;
          goto LABEL_27;
        }
LABEL_19:
        v17 = v6 + 24;
        if (v7 < v6 || v7 >= v17 || v7 != v6)
        {
          v18 = *(_OWORD *)v6;
          *((_QWORD *)v7 + 2) = *((_QWORD *)v6 + 2);
          *(_OWORD *)v7 = v18;
        }
LABEL_27:
        v7 += 24;
        if (v4 < v12)
        {
          v6 = v17;
          if (v17 < v5)
            continue;
        }
        v34 = v7;
        goto LABEL_62;
      }
    }
    goto LABEL_62;
  }
LABEL_63:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

char *sub_23EC61B8C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BF8);
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

char *sub_23EC61C84(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_23EC83CC0();
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

uint64_t sub_23EC61D2C(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = *a2;
  v6 = *a3;
  result = a4(0);
  v8 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1)
    goto LABEL_14;
  if (v9 / v8 < 0)
  {
LABEL_15:
    result = sub_23EC83CC0();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
    return swift_arrayInitWithTakeFrontToBack();
  if (v4 != v5)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_23EC61E38(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_23EC83CC0();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
      return (char *)memmove(result, v3, 24 * v6);
  }
  return result;
}

char *sub_23EC61EF4(uint64_t a1)
{
  return sub_23EC61B8C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23EC61F08(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v40 = a2;
  v7 = sub_23EC83CA8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_42;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v39 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v37 = v3;
  v38 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = sub_23EC83348();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_22;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v19 >= v38)
      break;
    v20 = (_QWORD *)(v6 + 64);
    v21 = *(_QWORD *)(v39 + 8 * v19);
    ++v14;
    if (!v21)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v38)
        goto LABEL_35;
      v21 = *(_QWORD *)(v39 + 8 * v14);
      if (!v21)
      {
        v22 = v19 + 2;
        if (v22 >= v38)
        {
LABEL_35:
          sub_23EC83408();
          v4 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_42;
          goto LABEL_38;
        }
        v21 = *(_QWORD *)(v39 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            v14 = v22 + 1;
            if (__OFADD__(v22, 1))
              goto LABEL_44;
            if (v14 >= v38)
              goto LABEL_35;
            v21 = *(_QWORD *)(v39 + 8 * v14);
            ++v22;
            if (v21)
              goto LABEL_21;
          }
        }
        v14 = v22;
      }
    }
LABEL_21:
    v11 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_22:
    v23 = *(_OWORD *)(*(_QWORD *)(v6 + 48) + 16 * v18);
    v24 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 24 * v18);
    v25 = *v24;
    v26 = v24[1];
    v27 = v24[2];
    v41 = v23;
    v28 = *((_QWORD *)&v23 + 1);
    if ((v40 & 1) == 0)
    {
      sub_23EC65270(v23, *((unint64_t *)&v23 + 1));
      sub_23EC65270(v25, v26);
      sub_23EC8333C();
    }
    sub_23EC83DF8();
    sub_23EC83E04();
    if (v28 > 1)
      sub_23EC83864();
    result = sub_23EC83E1C();
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v12 + 8 * (v30 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v12 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v12 + 8 * v31);
      }
      while (v35 == -1);
      v15 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15) = v41;
    v16 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 24 * v15);
    *v16 = v25;
    v16[1] = v26;
    v16[2] = v27;
    ++*(_QWORD *)(v8 + 16);
  }
  sub_23EC83408();
  v4 = v37;
  v20 = (_QWORD *)(v6 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_42;
LABEL_38:
  v36 = 1 << *(_BYTE *)(v6 + 32);
  if (v36 >= 64)
    bzero(v20, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v20 = -1 << v36;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_42:
  result = sub_23EC83408();
  *v4 = v8;
  return result;
}

void *sub_23EC62274(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23EC83C9C();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)sub_23EC83408();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v25 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v14)
      goto LABEL_26;
    v26 = *(_QWORD *)(v7 + 8 * v25);
    ++v10;
    if (!v26)
    {
      v10 = v25 + 1;
      if (v25 + 1 >= v14)
        goto LABEL_26;
      v26 = *(_QWORD *)(v7 + 8 * v10);
      if (!v26)
        break;
    }
LABEL_25:
    v13 = (v26 - 1) & v26;
    v16 = __clz(__rbit64(v26)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = 24 * v16;
    v19 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v18);
    v20 = *v19;
    v21 = v19[1];
    v22 = v19[2];
    v23 = *(_OWORD *)(*(_QWORD *)(v3 + 48) + v17);
    *(_OWORD *)(*(_QWORD *)(v5 + 48) + v17) = v23;
    v24 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v18);
    *v24 = v20;
    v24[1] = v21;
    v24[2] = v22;
    sub_23EC65270(v23, *((unint64_t *)&v23 + 1));
    sub_23EC65270(v20, v21);
    result = (void *)sub_23EC8333C();
  }
  v27 = v25 + 2;
  if (v27 >= v14)
    goto LABEL_26;
  v26 = *(_QWORD *)(v7 + 8 * v27);
  if (v26)
  {
    v10 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v26 = *(_QWORD *)(v7 + 8 * v10);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23EC62448(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    sub_23EC8333C();
    v7 = sub_23EC83C90();
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
    sub_23EC8333C();
    v10 = sub_23EC83C90();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23EC58F78(&qword_256DC7CA0, &qword_256DC7C98, MEMORY[0x24BEE12E0]);
        sub_23EC8333C();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C98);
          v12 = sub_23EC62864(v16, i, a3);
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
    sub_23EC58B7C();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC62654(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    sub_23EC8333C();
    v7 = sub_23EC83C90();
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
    sub_23EC8333C();
    v10 = sub_23EC83C90();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23EC58F78(&qword_256DC7C68, &qword_256DC7C60, MEMORY[0x24BEE12E0]);
        sub_23EC8333C();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C60);
          v12 = sub_23EC628BC(v16, i, a3);
          v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C58);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t (*sub_23EC62864(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23EC6293C(v6, a2, a3);
  return sub_23EC628B8;
}

uint64_t (*sub_23EC628BC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23EC629B0(v6, a2, a3);
  return sub_23EC628B8;
}

void sub_23EC62910(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23EC6293C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24265C474](a2, a3);
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
    return sub_23EC629A8;
  }
  __break(1u);
  return result;
}

void sub_23EC629A8(id *a1)
{

}

uint64_t (*sub_23EC629B0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x24265C474](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return sub_23EC62A1C;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC62A1C()
{
  return swift_unknownObjectRelease();
}

_QWORD *sub_23EC62A24(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  v24 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (uint64_t *)(*(_QWORD *)(a4 + 56) + 24 * v15);
    v20 = *v19;
    v21 = v19[1];
    v22 = v19[2];
    *v10 = *v19;
    v10[1] = v21;
    v10[2] = v22;
    if (v12 == v9)
    {
      sub_23EC65270(v20, v21);
      sub_23EC8333C();
      goto LABEL_38;
    }
    v10 += 3;
    sub_23EC65270(v20, v21);
    result = (_QWORD *)sub_23EC8333C();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v23;
      result = v24;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void sub_23EC62C40()
{
  JUMPOUT(0x24265C60CLL);
}

uint64_t sub_23EC62C54(_QWORD *a1)
{
  return sub_23EC5EEB4(0, a1[2], 0, a1, &qword_256DC7CD0, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_23EC62C88(_QWORD *a1)
{
  return sub_23EC5F274(0, a1[2], 0, a1, &qword_256DC7CF0, &qword_256DC7CF8);
}

uint64_t sub_23EC62CBC(_QWORD *a1)
{
  return sub_23EC5EEB4(0, a1[2], 0, a1, &qword_256DC7C00, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_23EC62CF0(_QWORD *a1)
{
  return sub_23EC5F274(0, a1[2], 0, a1, &qword_256DC7C28, &qword_256DC7C30);
}

uint64_t sub_23EC62D24(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 64);
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
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
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

uint64_t *sub_23EC62DAC(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = (uint64_t *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *v5;
    v7 = v5[1];
    v8 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 24 * a2);
    v9 = *v8;
    v10 = v8[1];
    v11 = v8[2];
    *result = *v8;
    result[1] = v10;
    result[2] = v11;
    sub_23EC65270(v6, v7);
    sub_23EC65270(v9, v10);
    sub_23EC8333C();
    return (uint64_t *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_23EC62E68(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

uint64_t sub_23EC62F08(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(_QWORD), void (*a5)(BOOL, unint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(BOOL, unint64_t, uint64_t);
  id v26;
  uint64_t (*v27)(_QWORD);
  uint64_t v28;

  v26 = a2;
  v8 = type metadata accessor for HomeID();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a4;
  v11 = a4(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    v28 = MEMORY[0x24BEE4AF8];
    a5(0, v15, 0);
    v17 = *(_QWORD *)(type metadata accessor for TileElementInfo() - 8);
    v18 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    v24 = *(_QWORD *)(v17 + 72);
    v25 = a5;
    do
    {
      v19 = objc_msgSend(v26, sel_uniqueIdentifier);
      sub_23EC8348C();

      sub_23EC6522C(v18, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
      sub_23EC6522C((uint64_t)v10, (uint64_t)&v14[*(int *)(v11 + 20)], (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
      sub_23EC6522C(v18, (uint64_t)&v14[*(int *)(v11 + 24)], (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
      sub_23EC65E08((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
      v16 = v28;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a5(0, *(_QWORD *)(v16 + 16) + 1, 1);
        v16 = v28;
      }
      v21 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      if (v21 >= v20 >> 1)
      {
        v25(v20 > 1, v21 + 1, 1);
        v16 = v28;
      }
      *(_QWORD *)(v16 + 16) = v21 + 1;
      sub_23EC65E88((uint64_t)v14, v16+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v21, v27);
      a5 = v25;
      v18 += v24;
      --v15;
    }
    while (v15);
  }
  return v16;
}

unint64_t sub_23EC63134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v24[2];
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v5 = type metadata accessor for ElementID();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v27 = (uint64_t)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v24 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v24 - v12;
  result = MEMORY[0x24BEE4AF8];
  v31 = MEMORY[0x24BEE4AF8];
  v30 = *(_QWORD *)(a1 + 16);
  if (v30)
  {
    v24[1] = v2;
    v15 = 0;
    v16 = *(_QWORD *)(v11 + 72);
    v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v28 = a2 + v25;
    v29 = a1 + v25;
    v26 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_23EC6522C(v29 + v16 * v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
      v17 = *(_QWORD *)(a2 + 16);
      if (v17)
      {
        sub_23EC8333C();
        v18 = v28;
        while (1)
        {
          sub_23EC6522C(v18, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
          if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
            && v10[*(int *)(v5 + 20)] == v13[*(int *)(v5 + 20)])
          {
            break;
          }
          sub_23EC65E08((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
          v18 += v16;
          if (!--v17)
          {
            swift_bridgeObjectRelease();
            goto LABEL_4;
          }
        }
        sub_23EC65E08((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
        swift_bridgeObjectRelease();
        sub_23EC65E88((uint64_t)v13, v27, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
        v19 = v26;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23EC5EDD8(0, *(_QWORD *)(v19 + 16) + 1, 1);
        v20 = v31;
        v22 = *(_QWORD *)(v31 + 16);
        v21 = *(_QWORD *)(v31 + 24);
        v23 = v22 + 1;
        if (v22 >= v21 >> 1)
        {
          v26 = v22 + 1;
          sub_23EC5EDD8(v21 > 1, v22 + 1, 1);
          v23 = v26;
          v20 = v31;
        }
        *(_QWORD *)(v20 + 16) = v23;
        v26 = v20;
        sub_23EC65E88(v27, v20 + v25 + v22 * v16, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
      }
      else
      {
LABEL_4:
        sub_23EC65E08((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
      }
      ++v15;
    }
    while (v15 != v30);
    return v31;
  }
  return result;
}

uint64_t sub_23EC633A0(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = type metadata accessor for ElementID();
  v32 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_23EC8333C();
  for (; v9; v9 = sub_23EC83C90())
  {
    v10 = 0;
    v37 = a1 & 0xC000000000000001;
    v28 = a1 + 32;
    v29 = v9;
    v30 = a2;
    v31 = a1;
    while (1)
    {
      v11 = v37 ? (id)MEMORY[0x24265C474](v10, a1) : *(id *)(v28 + 8 * v10);
      v12 = v11;
      if (__OFADD__(v10++, 1))
        break;
      if (a2 && *(_QWORD *)(a2 + 16))
      {
        v14 = sub_23EC69B58();
        sub_23EC8333C();
        v15 = sub_23EC63134(v14, a2);
        v16 = v12;
        v17 = v15;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v18 = sub_23EC69B58();
        v19 = *(_QWORD *)(v18 + 16);
        if (v19)
        {
          v34 = v12;
          v35 = v10;
          v36 = v3;
          v38 = MEMORY[0x24BEE4AF8];
          v20 = v18;
          sub_23EC5EDD8(0, v19, 0);
          v17 = v38;
          v21 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
          v33 = v20;
          v22 = v20 + v21;
          v23 = *(_QWORD *)(v32 + 72);
          do
          {
            sub_23EC6522C(v22, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            v38 = v17;
            v25 = *(_QWORD *)(v17 + 16);
            v24 = *(_QWORD *)(v17 + 24);
            if (v25 >= v24 >> 1)
            {
              sub_23EC5EDD8(v24 > 1, v25 + 1, 1);
              v17 = v38;
            }
            *(_QWORD *)(v17 + 16) = v25 + 1;
            sub_23EC65E88((uint64_t)v8, v17 + v21 + v25 * v23, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
            v22 += v23;
            --v19;
          }
          while (v19);

          swift_bridgeObjectRelease();
          v10 = v35;
          v3 = v36;
          a2 = v30;
          a1 = v31;
          v9 = v29;
        }
        else
        {

          swift_bridgeObjectRelease();
          v17 = MEMORY[0x24BEE4AF8];
        }
      }
      sub_23EC5E54C(v17);
      if (v10 == v9)
      {
        swift_bridgeObjectRelease();
        return v39;
      }
    }
    __break(1u);
LABEL_21:
    sub_23EC8333C();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23EC6365C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = a2;
  v3 = sub_23EC834A4();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v4 = sub_23EC83780();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC636E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = sub_23EC8399C();
  *(_QWORD *)(v0 + 136) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC63750()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC6378C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 144) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC637EC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_23EC63850;
  return sub_23EC548B8();
}

uint64_t sub_23EC63850(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC638D8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  os_log_type_t v60;
  uint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  _DWORD *v65;
  NSObject *log;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70[2];

  if (qword_256DC7808 != -1)
    swift_once();
  v2 = (unint64_t *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_256DC8528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  v7 = sub_23EC83768();
  v8 = sub_23EC83A5C();
  if (os_log_type_enabled(v7, v8))
  {
    v60 = v8;
    v9 = *(_QWORD *)(v0 + 64);
    v63 = *(_QWORD *)(v0 + 72);
    v10 = swift_slowAlloc();
    v67 = swift_slowAlloc();
    v70[0] = v67;
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)(v0 + 40) = sub_23EC79A04(0xD000000000000016, 0x800000023EC87080, v70);
    sub_23EC83AF8();
    *(_WORD *)(v10 + 12) = 2080;
    sub_23EC65CB0(v9);
    v11 = sub_23EC80FD4(v9);
    v13 = v12;
    sub_23EC6521C(v9);
    *(_QWORD *)(v0 + 48) = sub_23EC79A04(v11, v13, v70);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v9);
    sub_23EC6521C(v9);
    *(_WORD *)(v10 + 22) = 2080;
    if (v63)
    {
      v14 = type metadata accessor for ElementID();
      v15 = sub_23EC8333C();
      v16 = MEMORY[0x24265C1C8](v15, v14);
      v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = 0xE300000000000000;
      v16 = 7104878;
    }
    v23 = v60;
    v24 = *(_QWORD *)(v0 + 112);
    v61 = *(_QWORD *)(v0 + 104);
    v64 = *(_QWORD *)(v0 + 120);
    *(_QWORD *)(v0 + 56) = sub_23EC79A04(v16, v18, v70);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v7, v23, "%s scope=%s ids=%s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v67, -1, -1);
    MEMORY[0x24265CB1C](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v64, v61);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 120);
    v21 = *(_QWORD *)(v0 + 104);
    v22 = *(_QWORD *)(v0 + 64);
    sub_23EC6521C(v22);
    sub_23EC6521C(v22);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  v25 = sub_23EC807A0(*(_QWORD *)(v0 + 64));
  if (v25 >> 62)
  {
    sub_23EC8333C();
    v26 = sub_23EC83C90();
    swift_bridgeObjectRelease();
    if (v26 >= 1)
      goto LABEL_11;
  }
  else
  {
    v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v26 >= 1)
    {
LABEL_11:
      v27 = *v2;
      sub_23EC65CB0(*v2);
      sub_23EC8333C();
      sub_23EC65CB0(v27);
      sub_23EC8333C();
      v28 = sub_23EC83768();
      v29 = sub_23EC83A5C();
      if (os_log_type_enabled(v28, v29))
      {
        v62 = v29;
        log = v28;
        v30 = *(_QWORD *)(v0 + 88);
        v31 = (_DWORD *)swift_slowAlloc();
        v59 = swift_slowAlloc();
        v69 = v59;
        v65 = v31;
        *v31 = 136315394;
        v70[0] = MEMORY[0x24BEE4AF8];
        sub_23EC5ED80(0, v26, 0);
        v32 = 0;
        v33 = v70[0];
        do
        {
          if ((v25 & 0xC000000000000001) != 0)
            v34 = (id)MEMORY[0x24265C474](v32, v25);
          else
            v34 = *(id *)(v25 + 8 * v32 + 32);
          v35 = v34;
          v36 = objc_msgSend(v34, sel_uniqueIdentifier);
          sub_23EC8348C();

          v70[0] = v33;
          v38 = *(_QWORD *)(v33 + 16);
          v37 = *(_QWORD *)(v33 + 24);
          if (v38 >= v37 >> 1)
          {
            sub_23EC5ED80(v37 > 1, v38 + 1, 1);
            v33 = v70[0];
          }
          v39 = *(_QWORD *)(v0 + 96);
          v40 = *(_QWORD *)(v0 + 80);
          ++v32;
          *(_QWORD *)(v33 + 16) = v38 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v30 + 32))(v33+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(_QWORD *)(v30 + 72) * v38, v39, v40);
        }
        while (v26 != v32);
        v42 = *(_QWORD *)(v0 + 64);
        v43 = MEMORY[0x24265C1C8](v33, *(_QWORD *)(v0 + 80));
        v45 = v44;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v0 + 24) = sub_23EC79A04(v43, v45, &v69);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *((_WORD *)v65 + 6) = 2080;
        sub_23EC65CB0(v42);
        v46 = sub_23EC80FD4(v42);
        v48 = v47;
        sub_23EC6521C(v42);
        *(_QWORD *)(v0 + 32) = sub_23EC79A04(v46, v48, &v69);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        sub_23EC6521C(v42);
        sub_23EC6521C(v42);
        _os_log_impl(&dword_23EC52000, log, v62, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v65, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v59, -1, -1);
        MEMORY[0x24265CB1C](v65, -1, -1);

      }
      else
      {
        v41 = *v2;
        swift_bridgeObjectRelease_n();
        sub_23EC6521C(v41);
        sub_23EC6521C(v41);

      }
      v49 = *(_QWORD *)(v0 + 72);
      sub_23EC8333C();
      v50 = sub_23EC633A0(v25, v49);
      *(_QWORD *)(v0 + 176) = v50;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23EC8333C();
      v51 = sub_23EC83768();
      v52 = sub_23EC83A5C();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v53 = 134217984;
        *(_QWORD *)(v0 + 16) = *(_QWORD *)(v50 + 16);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23EC52000, v51, v52, "[findElements] Found %ld elements to show", v53, 0xCu);
        MEMORY[0x24265CB1C](v53, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v68 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC7D00 + dword_256DC7D00);
      v54 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v54;
      *v54 = v0;
      v54[1] = sub_23EC64158;
      return v68(v50, *(_QWORD *)(v0 + 64));
    }
  }
  swift_bridgeObjectRelease();
  v56 = sub_23EC83768();
  v57 = sub_23EC83A44();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_23EC52000, v56, v57, "HMHomeManager.orderedHomes is empty", v58, 2u);
    MEMORY[0x24265CB1C](v58, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_23EC64158(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  return swift_task_switch();
}

uint64_t sub_23EC641CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 160);
  swift_bridgeObjectRelease();

  v2 = *(_QWORD *)(v0 + 200);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23EC64224()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 160);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23EC6427C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256DC7B50;
  if (!qword_256DC7B50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC7A60);
    v2 = sub_23EC65F10(&qword_2543411A0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB6690], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256DC7B50);
  }
  return result;
}

unint64_t sub_23EC64300()
{
  unint64_t result;

  result = qword_2543412A0;
  if (!qword_2543412A0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLTileEntityQuery, &type metadata for HomeXLTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_2543412A0);
  }
  return result;
}

unint64_t sub_23EC64348()
{
  unint64_t result;

  result = qword_2543412A8;
  if (!qword_2543412A8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLTileEntityQuery, &type metadata for HomeXLTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_2543412A8);
  }
  return result;
}

uint64_t sub_23EC6438C()
{
  return sub_23EC65F10(qword_256DC7B70, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

unint64_t sub_23EC643BC()
{
  unint64_t result;

  result = qword_254341298;
  if (!qword_254341298)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeXLTileEntityQuery, &type metadata for HomeXLTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_254341298);
  }
  return result;
}

uint64_t sub_23EC64400()
{
  return sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6442C()
{
  return sub_23EC58F78(&qword_256DC7B88, qword_256DC7B90, MEMORY[0x24BDB5BC0]);
}

_QWORD *initializeBufferWithCopyOfBuffer for HomeXLTileEntityQuery(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_23EC83348();
  return a1;
}

uint64_t destroy for HomeXLTileEntityQuery()
{
  return sub_23EC83408();
}

_QWORD *assignWithCopy for HomeXLTileEntityQuery(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_23EC83348();
  sub_23EC83408();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for HomeXLTileEntityQuery(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_23EC83408();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLTileEntityQuery(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeXLTileEntityQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeXLTileEntityQuery()
{
  return &type metadata for HomeXLTileEntityQuery;
}

uint64_t sub_23EC64594(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC646AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = a2;
  v3 = sub_23EC834A4();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v4 = sub_23EC83780();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC64734()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = sub_23EC8399C();
  *(_QWORD *)(v0 + 136) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC647A0()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC647DC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 144) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC6483C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_23EC648A0;
  return sub_23EC548B8();
}

uint64_t sub_23EC648A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC64928()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  os_log_type_t v60;
  uint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  _DWORD *v65;
  NSObject *log;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70[2];

  if (qword_256DC7808 != -1)
    swift_once();
  v2 = (unint64_t *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_256DC8528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  sub_23EC65CB0(v1);
  sub_23EC8333C();
  v7 = sub_23EC83768();
  v8 = sub_23EC83A5C();
  if (os_log_type_enabled(v7, v8))
  {
    v60 = v8;
    v9 = *(_QWORD *)(v0 + 64);
    v63 = *(_QWORD *)(v0 + 72);
    v10 = swift_slowAlloc();
    v67 = swift_slowAlloc();
    v70[0] = v67;
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)(v0 + 40) = sub_23EC79A04(0xD000000000000016, 0x800000023EC87080, v70);
    sub_23EC83AF8();
    *(_WORD *)(v10 + 12) = 2080;
    sub_23EC65CB0(v9);
    v11 = sub_23EC80FD4(v9);
    v13 = v12;
    sub_23EC6521C(v9);
    *(_QWORD *)(v0 + 48) = sub_23EC79A04(v11, v13, v70);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    sub_23EC6521C(v9);
    sub_23EC6521C(v9);
    *(_WORD *)(v10 + 22) = 2080;
    if (v63)
    {
      v14 = type metadata accessor for ElementID();
      v15 = sub_23EC8333C();
      v16 = MEMORY[0x24265C1C8](v15, v14);
      v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = 0xE300000000000000;
      v16 = 7104878;
    }
    v23 = v60;
    v24 = *(_QWORD *)(v0 + 112);
    v61 = *(_QWORD *)(v0 + 104);
    v64 = *(_QWORD *)(v0 + 120);
    *(_QWORD *)(v0 + 56) = sub_23EC79A04(v16, v18, v70);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v7, v23, "%s scope=%s ids=%s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v67, -1, -1);
    MEMORY[0x24265CB1C](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v64, v61);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 120);
    v21 = *(_QWORD *)(v0 + 104);
    v22 = *(_QWORD *)(v0 + 64);
    sub_23EC6521C(v22);
    sub_23EC6521C(v22);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  v25 = sub_23EC807A0(*(_QWORD *)(v0 + 64));
  if (v25 >> 62)
  {
    sub_23EC8333C();
    v26 = sub_23EC83C90();
    swift_bridgeObjectRelease();
    if (v26 >= 1)
      goto LABEL_11;
  }
  else
  {
    v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v26 >= 1)
    {
LABEL_11:
      v27 = *v2;
      sub_23EC65CB0(*v2);
      sub_23EC8333C();
      sub_23EC65CB0(v27);
      sub_23EC8333C();
      v28 = sub_23EC83768();
      v29 = sub_23EC83A5C();
      if (os_log_type_enabled(v28, v29))
      {
        v62 = v29;
        log = v28;
        v30 = *(_QWORD *)(v0 + 88);
        v31 = (_DWORD *)swift_slowAlloc();
        v59 = swift_slowAlloc();
        v69 = v59;
        v65 = v31;
        *v31 = 136315394;
        v70[0] = MEMORY[0x24BEE4AF8];
        sub_23EC5ED80(0, v26, 0);
        v32 = 0;
        v33 = v70[0];
        do
        {
          if ((v25 & 0xC000000000000001) != 0)
            v34 = (id)MEMORY[0x24265C474](v32, v25);
          else
            v34 = *(id *)(v25 + 8 * v32 + 32);
          v35 = v34;
          v36 = objc_msgSend(v34, sel_uniqueIdentifier);
          sub_23EC8348C();

          v70[0] = v33;
          v38 = *(_QWORD *)(v33 + 16);
          v37 = *(_QWORD *)(v33 + 24);
          if (v38 >= v37 >> 1)
          {
            sub_23EC5ED80(v37 > 1, v38 + 1, 1);
            v33 = v70[0];
          }
          v39 = *(_QWORD *)(v0 + 96);
          v40 = *(_QWORD *)(v0 + 80);
          ++v32;
          *(_QWORD *)(v33 + 16) = v38 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v30 + 32))(v33+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(_QWORD *)(v30 + 72) * v38, v39, v40);
        }
        while (v26 != v32);
        v42 = *(_QWORD *)(v0 + 64);
        v43 = MEMORY[0x24265C1C8](v33, *(_QWORD *)(v0 + 80));
        v45 = v44;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v0 + 24) = sub_23EC79A04(v43, v45, &v69);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *((_WORD *)v65 + 6) = 2080;
        sub_23EC65CB0(v42);
        v46 = sub_23EC80FD4(v42);
        v48 = v47;
        sub_23EC6521C(v42);
        *(_QWORD *)(v0 + 32) = sub_23EC79A04(v46, v48, &v69);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        sub_23EC6521C(v42);
        sub_23EC6521C(v42);
        _os_log_impl(&dword_23EC52000, log, v62, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v65, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v59, -1, -1);
        MEMORY[0x24265CB1C](v65, -1, -1);

      }
      else
      {
        v41 = *v2;
        swift_bridgeObjectRelease_n();
        sub_23EC6521C(v41);
        sub_23EC6521C(v41);

      }
      v49 = *(_QWORD *)(v0 + 72);
      sub_23EC8333C();
      v50 = sub_23EC633A0(v25, v49);
      *(_QWORD *)(v0 + 176) = v50;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23EC8333C();
      v51 = sub_23EC83768();
      v52 = sub_23EC83A5C();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v53 = 134217984;
        *(_QWORD *)(v0 + 16) = *(_QWORD *)(v50 + 16);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23EC52000, v51, v52, "[findElements] Found %ld elements to show", v53, 0xCu);
        MEMORY[0x24265CB1C](v53, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v68 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC7C38 + dword_256DC7C38);
      v54 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v54;
      *v54 = v0;
      v54[1] = sub_23EC651A8;
      return v68(v50, *(_QWORD *)(v0 + 64));
    }
  }
  swift_bridgeObjectRelease();
  v56 = sub_23EC83768();
  v57 = sub_23EC83A44();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_23EC52000, v56, v57, "HMHomeManager.orderedHomes is empty", v58, 2u);
    MEMORY[0x24265CB1C](v58, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_23EC651A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  return swift_task_switch();
}

unint64_t sub_23EC6521C(unint64_t result)
{
  if (result >= 2)
    return sub_23EC83408();
  return result;
}

uint64_t sub_23EC6522C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EC65270(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return sub_23EC8333C();
  return result;
}

uint64_t sub_23EC65284(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23EC65298(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  int64_t v40;
  uint64_t v41;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC83444();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EC8381C();
  MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for HomeXLTileEntity();
  v10 = *(_QWORD *)(v34 - 8);
  v11 = MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v31 = (char *)&v27 - v13;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7CE0);
  v29 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  swift_bridgeObjectRetain_n();
  sub_23EC5FAA8(&v41, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(uint64_t))sub_23EC62C54);
  swift_bridgeObjectRelease();
  v16 = v41;
  v17 = *(_QWORD *)(v41 + 16);
  if (v17)
  {
    v41 = MEMORY[0x24BEE4AF8];
    sub_23EC5EE04(0, v17, 0);
    v18 = *(unsigned __int8 *)(v10 + 80);
    v27 = v16;
    v19 = v16 + ((v18 + 32) & ~v18);
    v28 = *(_QWORD *)(v10 + 72);
    v20 = (uint64_t)v31;
    v21 = (uint64_t)v33;
    do
    {
      v40 = v17;
      sub_23EC6522C(v19, v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
      sub_23EC6522C(v20, v21, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
      sub_23EC83810();
      sub_23EC83804();
      type metadata accessor for TileElementInfo();
      sub_23EC8333C();
      sub_23EC837F8();
      swift_bridgeObjectRelease();
      sub_23EC83804();
      sub_23EC83438();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v38, 1, 1, v37);
      v22 = sub_23EC832F4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v39, 1, 1, v22);
      sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
      sub_23EC831F8();
      sub_23EC65E08(v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeXLTileEntity);
      v23 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23EC5EE04(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v41;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_23EC5EE04(v24 > 1, v25 + 1, 1);
        v23 = v41;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v23+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v25, v15, v32);
      v19 += v28;
      v17 = v40 - 1;
    }
    while (v40 != 1);
    sub_23EC83408();
  }
  else
  {
    sub_23EC83408();
    return MEMORY[0x24BEE4AF8];
  }
  return v23;
}

uint64_t sub_23EC656F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  int64_t v40;
  uint64_t v41;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC83444();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EC8381C();
  MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for HomeSingleTileEntity();
  v10 = *(_QWORD *)(v34 - 8);
  v11 = MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v31 = (char *)&v27 - v13;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C18);
  v29 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  swift_bridgeObjectRetain_n();
  sub_23EC5FAA8(&v41, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(uint64_t))sub_23EC62CBC);
  swift_bridgeObjectRelease();
  v16 = v41;
  v17 = *(_QWORD *)(v41 + 16);
  if (v17)
  {
    v41 = MEMORY[0x24BEE4AF8];
    sub_23EC5EE88(0, v17, 0);
    v18 = *(unsigned __int8 *)(v10 + 80);
    v27 = v16;
    v19 = v16 + ((v18 + 32) & ~v18);
    v28 = *(_QWORD *)(v10 + 72);
    v20 = (uint64_t)v31;
    v21 = (uint64_t)v33;
    do
    {
      v40 = v17;
      sub_23EC6522C(v19, v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
      sub_23EC6522C(v20, v21, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
      sub_23EC83810();
      sub_23EC83804();
      type metadata accessor for TileElementInfo();
      sub_23EC8333C();
      sub_23EC837F8();
      swift_bridgeObjectRelease();
      sub_23EC83804();
      sub_23EC83438();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v38, 1, 1, v37);
      v22 = sub_23EC832F4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v39, 1, 1, v22);
      sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
      sub_23EC831F8();
      sub_23EC65E08(v20, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
      v23 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23EC5EE88(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v41;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_23EC5EE88(v24 > 1, v25 + 1, 1);
        v23 = v41;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v23+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v25, v15, v32);
      v19 += v28;
      v17 = v40 - 1;
    }
    while (v40 != 1);
    sub_23EC83408();
  }
  else
  {
    sub_23EC83408();
    return MEMORY[0x24BEE4AF8];
  }
  return v23;
}

unint64_t sub_23EC65B48()
{
  unint64_t result;

  result = qword_256DC7BE0;
  if (!qword_256DC7BE0)
  {
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256DC7BE0);
  }
  return result;
}

uint64_t sub_23EC65B90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC65CA8()
{
  return sub_23EC83408();
}

unint64_t sub_23EC65CB0(unint64_t result)
{
  if (result >= 2)
    return sub_23EC83348();
  return result;
}

uint64_t sub_23EC65CC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC65DB0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_23EC65E08(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EC65E44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EC65E88(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EC65ECC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EC65F10(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24265CA8C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SelectedHomeEntityQuery.suggestedEntities()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  v1[3] = swift_task_alloc();
  v2 = sub_23EC836FC();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC65FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  if (qword_256DC7810 != -1)
    swift_once();
  v1 = sub_23EC83720();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_256DC8540);
  sub_23EC836F0();
  v5 = (char *)&dword_256DC7D88 + dword_256DC7D88;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = sub_23EC660B0;
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, _QWORD, uint64_t))v5)("SelectedHomeEntityQuery.AllHomes", 32, 2, *(_QWORD *)(v0 + 48), v2);
}

uint64_t sub_23EC660B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 64) = v1;
  swift_task_dealloc();
  v6 = v4[5];
  v5 = v4[6];
  v7 = v4[4];
  if (!v1)
    v4[9] = a1;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return swift_task_switch();
}

uint64_t SelectedHomeEntityQuery.entities(for:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[4] = a1;
  v2 = type metadata accessor for HomeID();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v1[8] = swift_task_alloc();
  v3 = sub_23EC83780();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v4 = type metadata accessor for SelectedHomeEntity();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v5 = sub_23EC836FC();
  v1[16] = v5;
  v1[17] = *(_QWORD *)(v5 - 8);
  v1[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC66248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  if (qword_256DC7810 != -1)
    swift_once();
  v1 = sub_23EC83720();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_256DC8540);
  sub_23EC836F0();
  v5 = (char *)&dword_256DC7D88 + dword_256DC7D88;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v3;
  *v3 = v0;
  v3[1] = sub_23EC6630C;
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, _QWORD, uint64_t))v5)("SelectedHomeEntityQuery.AllHomes", 32, 2, *(_QWORD *)(v0 + 144), v2);
}

uint64_t sub_23EC6630C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 144);
  v5 = *(_QWORD *)(*v2 + 128);
  v6 = *(_QWORD *)(*v2 + 136);
  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_task_switch();
}

uint64_t sub_23EC66394()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC6640C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = MEMORY[0x24BEE4AF8];
  v49 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(v2 + 16);
  sub_23EC8333C();
  v45 = v4;
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 48);
    v47 = *(_QWORD *)(v6 + 72);
    v38 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v43 = v2 + v38;
    v40 = MEMORY[0x24BEE4AF8];
    v41 = v1;
    do
    {
      sub_23EC6522C(v43 + v5 * v47, *(_QWORD *)(v0 + 120), (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
      v10 = *(_QWORD *)(v1 + 16);
      if (v10)
      {
        v11 = *(_QWORD *)(v0 + 32)
            + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
        sub_23EC8333C();
        v12 = *(_QWORD *)(v7 + 72);
        while (1)
        {
          v13 = *(_QWORD *)(v0 + 64);
          v14 = *(_QWORD *)(v0 + 40);
          sub_23EC6522C(v11, v13, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
          v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
          v8(v13, 0, 1, v14);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v13, 1, v14) == 1)
            break;
          v15 = *(_QWORD *)(v0 + 56);
          sub_23EC65E88(*(_QWORD *)(v0 + 64), v15, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
          v16 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
          sub_23EC65E08(v15, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
          if ((v16 & 1) != 0)
          {
            v18 = *(_QWORD *)(v0 + 112);
            v17 = *(_QWORD *)(v0 + 120);
            swift_bridgeObjectRelease();
            sub_23EC65E88(v17, v18, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
            v19 = v40;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_23EC5EE30(0, *(_QWORD *)(v40 + 16) + 1, 1);
              v19 = v49;
            }
            v1 = v41;
            v21 = *(_QWORD *)(v19 + 16);
            v20 = *(_QWORD *)(v19 + 24);
            if (v21 >= v20 >> 1)
            {
              sub_23EC5EE30(v20 > 1, v21 + 1, 1);
              v19 = v49;
            }
            v22 = *(_QWORD *)(v0 + 112);
            *(_QWORD *)(v19 + 16) = v21 + 1;
            v40 = v19;
            sub_23EC65E88(v22, v19 + v38 + v21 * v47, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
            goto LABEL_6;
          }
          v11 += v12;
          if (!--v10)
            goto LABEL_4;
        }
      }
      else
      {
        sub_23EC8333C();
        v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
LABEL_4:
        v8(*(_QWORD *)(v0 + 64), 1, 1, *(_QWORD *)(v0 + 40));
      }
      v9 = *(_QWORD *)(v0 + 120);
      swift_bridgeObjectRelease();
      sub_23EC65E08(v9, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
      v1 = v41;
LABEL_6:
      ++v5;
    }
    while (v5 != v45);
  }
  else
  {
    v40 = v3;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_256DC7808 != -1)
    swift_once();
  v23 = *(_QWORD *)(v0 + 80);
  v24 = *(_QWORD *)(v0 + 88);
  v25 = *(_QWORD *)(v0 + 72);
  v26 = __swift_project_value_buffer(v25, (uint64_t)qword_256DC8528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v24, v26, v25);
  swift_bridgeObjectRetain_n();
  v27 = sub_23EC83768();
  v28 = sub_23EC83A5C();
  if (os_log_type_enabled(v27, v28))
  {
    v39 = *(_QWORD *)(v0 + 96);
    v44 = *(_QWORD *)(v0 + 80);
    v46 = *(_QWORD *)(v0 + 72);
    v48 = *(_QWORD *)(v0 + 88);
    v29 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v49 = v42;
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)(v0 + 16) = sub_23EC79A04(0x7365697469746E65, 0xEE00293A726F6628, &v49);
    sub_23EC83AF8();
    *(_WORD *)(v29 + 12) = 2080;
    v30 = sub_23EC8333C();
    v31 = MEMORY[0x24265C1C8](v30, v39);
    v33 = v32;
    sub_23EC83408();
    *(_QWORD *)(v0 + 24) = sub_23EC79A04(v31, v33, &v49);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_23EC52000, v27, v28, "%s matched homes %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v42, -1, -1);
    MEMORY[0x24265CB1C](v29, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v48, v46);
  }
  else
  {
    v34 = *(_QWORD *)(v0 + 80);
    v35 = *(_QWORD *)(v0 + 88);
    v36 = *(_QWORD *)(v0 + 72);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v40);
}

uint64_t SelectedHomeEntityQuery.results()()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_23EC836FC();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC66980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  if (qword_256DC7810 != -1)
    swift_once();
  v1 = sub_23EC83720();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_256DC8540);
  sub_23EC836F0();
  v5 = (char *)&dword_256DC7D88 + dword_256DC7D88;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v3;
  *v3 = v0;
  v3[1] = sub_23EC66A44;
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, _QWORD, uint64_t))v5)("SelectedHomeEntityQuery.AllHomes", 32, 2, *(_QWORD *)(v0 + 32), v2);
}

uint64_t sub_23EC66A44(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 48) = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 + 24) + 8))(*(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 16));
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23EC66AE0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SelectedHomeEntityQuery.defaultResult()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[5] = a1;
  v2 = sub_23EC83780();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC66B74()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = sub_23EC8399C();
  *(_QWORD *)(v0 + 80) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC66BE0()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC66C1C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC66C7C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_23EC66CE0;
  return sub_23EC548B8();
}

uint64_t sub_23EC66CE0(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 104) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_23EC66D4C()
{
  uint64_t v0;

  static SelectedHomeEntity.selectedHome.getter(*(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC66D84()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (qword_256DC7808 != -1)
    swift_once();
  v1 = *(void **)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_256DC8528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_23EC83768();
  v9 = sub_23EC83A44();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD *)(v0 + 48);
  if (v10)
  {
    v29 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 56);
    v15 = swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v30 = v17;
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v0 + 24) = sub_23EC79A04(0x52746C7561666564, 0xEF2928746C757365, &v30);
    sub_23EC83AF8();
    *(_WORD *)(v15 + 12) = 2112;
    v18 = v11;
    v27 = v12;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v19;
    sub_23EC83AF8();
    *v16 = v19;

    _os_log_impl(&dword_23EC52000, v8, v9, "%s Error loading HMHomeManager: %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7940);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v17, -1, -1);
    MEMORY[0x24265CB1C](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v20 = sub_23EC83768();
  v21 = sub_23EC83A5C();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v30 = v23;
    *(_DWORD *)v22 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_23EC79A04(0x52746C7561666564, 0xEF2928746C757365, &v30);
    sub_23EC83AF8();
    _os_log_impl(&dword_23EC52000, v20, v21, "%s Returning nil", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v23, -1, -1);
    MEMORY[0x24265CB1C](v22, -1, -1);
  }

  v24 = *(_QWORD *)(v0 + 40);
  v25 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC67160(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = a1;
  v2 = type metadata accessor for SelectedHomeEntity();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = sub_23EC83780();
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC671E8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = sub_23EC8399C();
  *(_QWORD *)(v0 + 96) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC67254()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC67290()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC672F0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_23EC67354;
  return sub_23EC548B8();
}

uint64_t sub_23EC67354(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v5 + 8))();
  }
  else
  {
    *(_QWORD *)(v4 + 120) = a1;
    return swift_task_switch();
  }
}

uint64_t sub_23EC673E4()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend(v1, sel_hf_orderedHomes);

  v3 = sub_23EC58B7C();
  v4 = sub_23EC83918();

  if (qword_256DC7808 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 64);
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_256DC8528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v8, v7);
  swift_bridgeObjectRetain_n();
  v9 = sub_23EC83768();
  v10 = sub_23EC83A5C();
  v11 = os_log_type_enabled(v9, v10);
  v13 = *(_QWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 64);
  v40 = v4;
  if (v11)
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v41 = v16;
    *(_DWORD *)v15 = 136315394;
    v37 = v13;
    *(_QWORD *)(v0 + 16) = sub_23EC79A04(0x69746E45656D6F68, 0xEE00292873656974, &v41);
    sub_23EC83AF8();
    *(_WORD *)(v15 + 12) = 2080;
    sub_23EC8333C();
    v17 = MEMORY[0x24265C1C8](v4, v3);
    v19 = v18;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 24) = sub_23EC79A04(v17, v19, &v41);
    sub_23EC83AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v9, v10, "%s found homes %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v16, -1, -1);
    MEMORY[0x24265CB1C](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v12, v14);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  if (!(v4 >> 62))
  {
    v20 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_8;
LABEL_18:
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x24BEE4AF8];
LABEL_19:
    **(_QWORD **)(v0 + 32) = v24;
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_23EC8333C();
  v20 = sub_23EC83C90();
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_18;
LABEL_8:
  v41 = MEMORY[0x24BEE4AF8];
  result = sub_23EC5EE30(0, v20 & ~(v20 >> 63), 0);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v22 = 0;
    v23 = *(_QWORD *)(v0 + 48);
    v38 = v4 & 0xC000000000000001;
    v39 = *(_QWORD *)(v0 + 40);
    v24 = v41;
    do
    {
      if (v38)
        v25 = (id)MEMORY[0x24265C474](v22, v4);
      else
        v25 = *(id *)(v4 + 8 * v22 + 32);
      v26 = v25;
      v27 = *(_QWORD *)(v0 + 56);
      v28 = objc_msgSend(v25, sel_uniqueIdentifier);
      sub_23EC8348C();

      v29 = objc_msgSend(v26, sel_name);
      v30 = sub_23EC83840();
      v32 = v31;

      v33 = (uint64_t *)(v27 + *(int *)(v39 + 20));
      *v33 = v30;
      v33[1] = v32;
      v41 = v24;
      v35 = *(_QWORD *)(v24 + 16);
      v34 = *(_QWORD *)(v24 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_23EC5EE30(v34 > 1, v35 + 1, 1);
        v24 = v41;
      }
      v36 = *(_QWORD *)(v0 + 56);
      ++v22;
      *(_QWORD *)(v24 + 16) = v35 + 1;
      sub_23EC65E88(v36, v24+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(_QWORD *)(v23 + 72) * v35, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
      v4 = v40;
    }
    while (v20 != v22);
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC67844(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC5C938;
  return SelectedHomeEntityQuery.entities(for:)(a1);
}

uint64_t sub_23EC67890(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC56630;
  return SelectedHomeEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_23EC678E0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23EC67E8C();
  *v1 = v0;
  v1[1] = sub_23EC56630;
  return sub_23EC83204();
}

uint64_t sub_23EC6794C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC55EF4;
  return SelectedHomeEntityQuery.defaultResult()(a1);
}

uint64_t SelectedHomeEntityQuery.allEntities()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  v1[3] = swift_task_alloc();
  v2 = sub_23EC836FC();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC67A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  if (qword_256DC7810 != -1)
    swift_once();
  v1 = sub_23EC83720();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_256DC8540);
  sub_23EC836F0();
  v5 = (char *)&dword_256DC7D88 + dword_256DC7D88;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = sub_23EC67AE4;
  return ((uint64_t (*)(const char *, uint64_t, uint64_t, _QWORD, uint64_t))v5)("SelectedHomeEntityQuery.AllHomes", 32, 2, *(_QWORD *)(v0 + 48), v2);
}

uint64_t sub_23EC67AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 64) = v1;
  swift_task_dealloc();
  v6 = v4[5];
  v5 = v4[6];
  v7 = v4[4];
  if (!v1)
    v4[9] = a1;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return swift_task_switch();
}

uint64_t sub_23EC67B70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = sub_23EC83444();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  type metadata accessor for SelectedHomeEntity();
  sub_23EC67D8C(&qword_2543411A8, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
  sub_23EC67D8C(&qword_2543411A0, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
  sub_23EC832C4();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC67C44()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC67C84(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC55EF4;
  return SelectedHomeEntityQuery.allEntities()(a1);
}

unint64_t sub_23EC67CDC()
{
  unint64_t result;

  result = qword_254341180;
  if (!qword_254341180)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for SelectedHomeEntityQuery, &type metadata for SelectedHomeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_254341180);
  }
  return result;
}

unint64_t sub_23EC67D24()
{
  unint64_t result;

  result = qword_254341188;
  if (!qword_254341188)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for SelectedHomeEntityQuery, &type metadata for SelectedHomeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_254341188);
  }
  return result;
}

uint64_t sub_23EC67D68()
{
  return sub_23EC67D8C((unint64_t *)&qword_256DC7A98, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC67D8C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SelectedHomeEntity();
    result = MEMORY[0x24265CA8C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23EC67DD0()
{
  unint64_t result;

  result = qword_254341178;
  if (!qword_254341178)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for SelectedHomeEntityQuery, &type metadata for SelectedHomeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_254341178);
  }
  return result;
}

uint64_t sub_23EC67E14()
{
  return sub_23EC67D8C(&qword_2543411A0, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

unint64_t sub_23EC67E3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7D48;
  if (!qword_256DC7D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256DC7D50);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB5BC0], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7D48);
  }
  return result;
}

unint64_t sub_23EC67E8C()
{
  unint64_t result;

  result = qword_256DC7D68;
  if (!qword_256DC7D68)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for SelectedHomeEntityQuery, &type metadata for SelectedHomeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_256DC7D68);
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectedHomeEntityQuery()
{
  return &type metadata for SelectedHomeEntityQuery;
}

uint64_t sub_23EC67EE8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 48) = a4;
  *(_QWORD *)(v5 + 56) = a5;
  *(_BYTE *)(v5 + 152) = a3;
  *(_QWORD *)(v5 + 40) = a1;
  v6 = sub_23EC8372C();
  *(_QWORD *)(v5 + 64) = v6;
  *(_QWORD *)(v5 + 72) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  v7 = sub_23EC836FC();
  *(_QWORD *)(v5 + 88) = v7;
  *(_QWORD *)(v5 + 96) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 104) = swift_task_alloc();
  *(_QWORD *)(v5 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC67F88()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  os_signpost_id_t v11;
  _QWORD *v12;

  v1 = sub_23EC83714();
  v2 = sub_23EC83A74();
  result = sub_23EC83AE0();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 40);
  if ((*(_BYTE *)(v0 + 152) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 96);

      v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16);
LABEL_11:
      *(_QWORD *)(v0 + 120) = v6;
      v6(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 88));
      sub_23EC83750();
      swift_allocObject();
      *(_QWORD *)(v0 + 128) = sub_23EC83744();
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 136) = v12;
      *v12 = v0;
      v12[1] = sub_23EC6812C;
      return sub_23EC67160(v0 + 32);
    }
LABEL_10:
    v7 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16);
    v6(v7, *(_QWORD *)(v0 + 48), v8);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_23EC836E4();
    _os_signpost_emit_with_name_impl(&dword_23EC52000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x24265CB1C](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_23EC6812C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC68190()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  os_signpost_type_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  os_signpost_id_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;

  v1 = sub_23EC83714();
  sub_23EC83738();
  v2 = sub_23EC83A68();
  result = sub_23EC83AE0();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 40);
  if ((*(_BYTE *)(v0 + 152) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v6 = *(_QWORD *)(v0 + 96);
      v5 = *(_QWORD *)(v0 + 104);
      v7 = *(_QWORD *)(v0 + 88);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      sub_23EC83408();
LABEL_14:
      v21 = *(_QWORD *)(v0 + 32);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
    }
LABEL_10:
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 64);
    sub_23EC83348();
    sub_23EC8375C();
    sub_23EC83408();
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v8, v10);
    v12 = v2;
    if (v11 == *MEMORY[0x24BEE7810])
    {
      v13 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
      v13 = "";
    }
    v14 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120))(v14, v16, v17);
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = sub_23EC836E4();
    _os_signpost_emit_with_name_impl(&dword_23EC52000, v1, v12, v19, v4, v13, v18, 2u);
    MEMORY[0x24265CB1C](v18, -1, -1);

    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v16, v17);
    sub_23EC83408();
    v20(v14, v17);
    goto LABEL_14;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 24);
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_23EC683B0()
{
  uint64_t v0;

  sub_23EC83408();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t OSSignposter.withInterval<A>(_:id:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v8 + 64) = a7;
  *(_QWORD *)(v8 + 72) = v7;
  *(_QWORD *)(v8 + 48) = a5;
  *(_QWORD *)(v8 + 56) = a6;
  *(_BYTE *)(v8 + 168) = a4;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  v9 = sub_23EC8372C();
  *(_QWORD *)(v8 + 80) = v9;
  *(_QWORD *)(v8 + 88) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 96) = swift_task_alloc();
  v10 = sub_23EC836FC();
  *(_QWORD *)(v8 + 104) = v10;
  *(_QWORD *)(v8 + 112) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 120) = swift_task_alloc();
  *(_QWORD *)(v8 + 128) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC684B0()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  os_signpost_id_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t (*v14)(_QWORD);

  v1 = sub_23EC83714();
  v2 = sub_23EC83A74();
  result = sub_23EC83AE0();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 40);
  if ((*(_BYTE *)(v0 + 168) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 112);

      v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16);
LABEL_11:
      *(_QWORD *)(v0 + 136) = v6;
      v12 = *(int **)(v0 + 56);
      v6(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 104));
      sub_23EC83750();
      swift_allocObject();
      *(_QWORD *)(v0 + 144) = sub_23EC83744();
      v14 = (uint64_t (*)(_QWORD))((char *)v12 + *v12);
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 152) = v13;
      *v13 = v0;
      v13[1] = sub_23EC68664;
      return v14(*(_QWORD *)(v0 + 32));
    }
LABEL_10:
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 112);
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16);
    v6(v7, *(_QWORD *)(v0 + 48), v8);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_23EC836E4();
    _os_signpost_emit_with_name_impl(&dword_23EC52000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x24265CB1C](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 24);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_23EC68664()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC686C8()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  os_signpost_type_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  os_signpost_id_t v19;
  void (*v20)(uint64_t, uint64_t);

  v1 = sub_23EC83714();
  sub_23EC83738();
  v2 = sub_23EC83A68();
  result = sub_23EC83AE0();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 40);
  if ((*(_BYTE *)(v0 + 168) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v6 = *(_QWORD *)(v0 + 112);
      v5 = *(_QWORD *)(v0 + 120);
      v7 = *(_QWORD *)(v0 + 104);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      sub_23EC83408();
LABEL_14:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
LABEL_10:
    v9 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 96);
    v10 = *(_QWORD *)(v0 + 80);
    sub_23EC83348();
    sub_23EC8375C();
    sub_23EC83408();
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v8, v10);
    v12 = v2;
    if (v11 == *MEMORY[0x24BEE7810])
    {
      v13 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
      v13 = "";
    }
    v14 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 112);
    v16 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136))(v14, v16, v17);
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = sub_23EC836E4();
    _os_signpost_emit_with_name_impl(&dword_23EC52000, v1, v12, v19, v4, v13, v18, 2u);
    MEMORY[0x24265CB1C](v18, -1, -1);

    v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v20(v16, v17);
    sub_23EC83408();
    v20(v14, v17);
    goto LABEL_14;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_23EC688E0()
{
  uint64_t v0;

  sub_23EC83408();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC6893C()
{
  uint64_t v0;

  v0 = sub_23EC83780();
  __swift_allocate_value_buffer(v0, qword_256DC8528);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC8528);
  return sub_23EC83774();
}

uint64_t sub_23EC689BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23EC83780();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC83720();
  __swift_allocate_value_buffer(v4, qword_256DC8540);
  __swift_project_value_buffer(v4, (uint64_t)qword_256DC8540);
  if (qword_256DC7808 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256DC8528);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_23EC83708();
}

BOOL sub_23EC68AA4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v1 = sub_23EC837B0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v19[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v19[-1] - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19[-1] - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19[-1] - v12;
  v20 = sub_23EC6AFC8(0, &qword_256DC7D90);
  v21 = MEMORY[0x24BE4CD88];
  v19[0] = v0;
  __swift_project_boxed_opaque_existential_1Tm(v19, v20);
  v14 = v0;
  sub_23EC83A98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7DA8);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23EC849C0;
  sub_23EC83798();
  sub_23EC8378C();
  sub_23EC837A4();
  v18 = v15;
  sub_23EC65F10(&qword_256DC7DB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCB8], MEMORY[0x24BE4CCC8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7DB8);
  sub_23EC6A18C();
  sub_23EC83B4C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v13, v1);
  sub_23EC83B34();
  LOBYTE(v15) = sub_23EC83B40();
  v16 = *(void (**)(char *, uint64_t))(v2 + 8);
  v16(v8, v1);
  v16(v11, v1);
  v16(v13, v1);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  return (v15 & 1) == 0;
}

id sub_23EC68CE4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id result;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _BYTE v11[32];
  id v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;
  unint64_t v16;

  v1 = sub_23EC8345C();
  v10 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v0, sel_hf_accessoryLikeObjects);
  if (result)
  {
    v16 = MEMORY[0x24BEE4AF8];
    v5 = result;
    sub_23EC83ABC();
    v9 = v5;

    sub_23EC65F10(&qword_256DC7DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCD520], MEMORY[0x24BDCD530]);
    sub_23EC83AEC();
    while (v15)
    {
      sub_23EC6AF04(&v14, v13);
      sub_23EC6AF14((uint64_t)v13, (uint64_t)v11);
      sub_23EC6AFC8(0, &qword_256DC7D90);
      if (!swift_dynamicCast()
        || (v12, sub_23EC6AF14((uint64_t)v13, (uint64_t)v11), (swift_dynamicCast() & 1) == 0))
      {
        v12 = 0;
      }
      v6 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
      if (v12)
      {
        MEMORY[0x24265C1B0](v6);
        if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_23EC8393C();
        sub_23EC83960();
        sub_23EC83930();
      }
      sub_23EC83AEC();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v1);
    v7 = v16;

    v8 = sub_23EC76A10(v7);
    swift_bridgeObjectRelease();
    return (id)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23EC68F24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  unint64_t v13;
  int64_t v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;

  v1 = a1;
  v25 = MEMORY[0x24BEE4AF8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_23EC8333C();
    sub_23EC83B64();
    sub_23EC6AFC8(0, &qword_256DC7D90);
    sub_23EC6B000((unint64_t *)&qword_256DC7D98, &qword_256DC7D90);
    sub_23EC839F0();
    v1 = v20;
    v18 = v21;
    v2 = v22;
    v3 = v23;
    v4 = v24;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v18 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    sub_23EC8333C();
    v3 = 0;
  }
  v17 = v2;
  v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_23EC83B88())
      goto LABEL_36;
    sub_23EC6AFC8(0, &qword_256DC7D90);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v19;
    swift_unknownObjectRelease();
    v11 = v3;
    v9 = v4;
    if (!v19)
      goto LABEL_36;
LABEL_26:
    v15 = objc_msgSend(v12, sel_homeKitObject, v17);

    v3 = v11;
    v4 = v9;
    if (v15)
    {
      MEMORY[0x24265C1B0]();
      if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23EC8393C();
      sub_23EC83960();
      sub_23EC83930();
      v3 = v11;
      v4 = v9;
    }
  }
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
LABEL_25:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v12)
      goto LABEL_36;
    goto LABEL_26;
  }
  v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 >= v8)
      goto LABEL_36;
    v13 = *(_QWORD *)(v18 + 8 * v11);
    if (!v13)
    {
      v14 = v3 + 2;
      if (v3 + 2 >= v8)
        goto LABEL_36;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
        goto LABEL_23;
      v14 = v3 + 3;
      if (v3 + 3 >= v8)
        goto LABEL_36;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
        goto LABEL_23;
      v14 = v3 + 4;
      if (v3 + 4 >= v8)
        goto LABEL_36;
      v13 = *(_QWORD *)(v18 + 8 * v14);
      if (v13)
      {
LABEL_23:
        v11 = v14;
      }
      else
      {
        v11 = v3 + 5;
        if (v3 + 5 >= v8)
          goto LABEL_36;
        v13 = *(_QWORD *)(v18 + 8 * v11);
        if (!v13)
        {
          v16 = v3 + 6;
          while (v8 != v16)
          {
            v13 = *(_QWORD *)(v18 + 8 * v16++);
            if (v13)
            {
              v11 = v16 - 1;
              goto LABEL_24;
            }
          }
LABEL_36:
          sub_23EC65CA8();
          return;
        }
      }
    }
LABEL_24:
    v9 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v11 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

uint64_t sub_23EC69260()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[8];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[48];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(v0, sel_accessories);
  sub_23EC6AFC8(0, &qword_256DC7DA0);
  v2 = sub_23EC83918();

  sub_23EC6AFC8(0, &qword_256DC7D90);
  sub_23EC6B000((unint64_t *)&qword_256DC7D98, &qword_256DC7D90);
  v3 = sub_23EC839E4();
  v17 = v3;
  v10 = (unint64_t)v2;
  *(_QWORD *)&v11 = sub_23EC69418;
  *((_QWORD *)&v11 + 1) = 0;
  memset(&v12[8], 0, 32);
  *(_QWORD *)v12 = 0xF000000000000007;
  *(_QWORD *)&v12[40] = sub_23EC69440;
  *(_QWORD *)&v13 = 0;
  *((_QWORD *)&v13 + 1) = sub_23EC6A0A0;
  *(_QWORD *)&v14 = 0;
  *((_QWORD *)&v14 + 1) = sub_23EC6A0B0;
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v15 + 1) = sub_23EC6944C;
  v16 = 0;
  sub_23EC69CFC();
  if (v4)
  {
    v5 = v4;
    do
    {
      if ((sub_23EC83AA4() & 1) != 0 && sub_23EC68AA4())
      {
        sub_23EC72E00(v8, v5);

      }
      else
      {

      }
      sub_23EC69CFC();
      v5 = v6;
    }
    while (v6);
    v3 = v17;
  }
  v8[6] = v14;
  v8[7] = v15;
  v9 = v16;
  v8[2] = *(_OWORD *)v12;
  v8[3] = *(_OWORD *)&v12[16];
  v8[4] = *(_OWORD *)&v12[32];
  v8[5] = v13;
  v8[0] = v10;
  v8[1] = v11;
  sub_23EC6A0C4((uint64_t)v8);
  return v3;
}

id sub_23EC69418@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_23EC68CE4();
  *a1 = result;
  return result;
}

id sub_23EC69440@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

BOOL sub_23EC6944C()
{
  sub_23EC6AFC8(0, &qword_256DC7D90);
  return (sub_23EC83AA4() & 1) != 0 && sub_23EC68AA4();
}

uint64_t sub_23EC69498(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v5 = sub_23EC83D98();
  __swift_project_boxed_opaque_existential_1Tm(a2, a2[3]);
  v6 = sub_23EC83D98();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v5, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_23EC69520(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD *, _QWORD *))
{
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v9[3] = swift_getObjectType();
  v9[0] = a1;
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = a3(v9, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  return v6;
}

uint64_t sub_23EC695A8()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const void *v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t result;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = objc_msgSend(v0, sel_hf_reorderableActionSetsList);
  v2 = objc_msgSend(v1, sel_sortedHomeKitObjectComparator);

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_23EC6AF94;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_msgSend(v0, sel_actionSets);
  sub_23EC6AFC8(0, &qword_256DC7DD0);
  v6 = sub_23EC83918();

  if (v6 >> 62)
    goto LABEL_42;
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  sub_23EC83348();
  while (1)
  {
    v35 = MEMORY[0x24BEE4AF8];
    if (!v7)
      break;
    v33 = 0;
    v8 = 0;
    v32 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      if ((v6 & 0xC000000000000001) != 0)
      {
        v9 = (id)MEMORY[0x24265C474](v8, v6);
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_40;
        if (v8 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_41;
        v9 = *(id *)(v6 + 8 * v8 + 32);
      }
      v10 = v9;
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
        break;
      v12 = objc_msgSend(v9, sel_actions);
      sub_23EC6AFC8(0, &qword_256DC7DD8);
      sub_23EC6B000(&qword_256DC7DE0, &qword_256DC7DD8);
      v13 = sub_23EC839D8();

      if ((v13 & 0xC000000000000001) != 0)
        v14 = sub_23EC83B70();
      else
        v14 = *(_QWORD *)(v13 + 16);
      swift_bridgeObjectRelease();
      if (v14 && !objc_msgSend(v10, sel_hf_isAnonymous))
      {
        v15 = v33;
        if (!v33)
        {
          v16 = *(_QWORD *)(v35 + 24);
          if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_45;
          v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
          if (v17 <= 1)
            v18 = 1;
          else
            v18 = v17;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
          v19 = (_QWORD *)swift_allocObject();
          v20 = _swift_stdlib_malloc_size(v19);
          v21 = v20 - 32;
          if (v20 < 32)
            v21 = v20 - 25;
          v22 = v21 >> 3;
          v19[2] = v18;
          v19[3] = (2 * (v21 >> 3)) | 1;
          v23 = (unint64_t)(v19 + 4);
          v24 = *(_QWORD *)(v35 + 24) >> 1;
          if (*(_QWORD *)(v35 + 16))
          {
            v25 = (const void *)(v35 + 32);
            if (v19 != (_QWORD *)v35 || v23 >= (unint64_t)v25 + 8 * v24)
            {
              v34 = v21 >> 3;
              memmove(v19 + 4, v25, 8 * v24);
              v23 = (unint64_t)(v19 + 4);
              v22 = v34;
            }
            *(_QWORD *)(v35 + 16) = 0;
          }
          v32 = (_QWORD *)(v23 + 8 * v24);
          v15 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
          sub_23EC83408();
          v35 = (uint64_t)v19;
        }
        v26 = __OFSUB__(v15, 1);
        v27 = v15 - 1;
        if (v26)
          goto LABEL_44;
        v33 = v27;
        *v32++ = v10;
        v8 = v11;
        if (v11 == v7)
          goto LABEL_35;
      }
      else
      {

        ++v8;
        if (v11 == v7)
          goto LABEL_35;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain_n();
    sub_23EC83348();
    v7 = sub_23EC83C90();
  }
  v33 = 0;
LABEL_35:
  swift_bridgeObjectRelease();
  v28 = *(_QWORD *)(v35 + 24);
  if (v28 < 2)
    goto LABEL_38;
  v29 = v28 >> 1;
  v26 = __OFSUB__(v29, v33);
  v30 = v29 - v33;
  if (!v26)
  {
    *(_QWORD *)(v35 + 16) = v30;
LABEL_38:
    swift_bridgeObjectRelease();
    v36 = v35;
    sub_23EC83348();
    sub_23EC6AE4C(&v36, (uint64_t (*)(id, id))sub_23EC6AFC0);
    swift_bridgeObjectRelease();
    swift_release_n();
    return v36;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  swift_release_n();
  result = sub_23EC83408();
  __break(1u);
  return result;
}

uint64_t sub_23EC699D4()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v0 = sub_23EC695A8();
  v1 = v0;
  v10 = MEMORY[0x24BEE4AF8];
  if (!(v0 >> 62))
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = sub_23EC8333C();
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v6 = MEMORY[0x24BEE4AF8];
LABEL_14:
    swift_bridgeObjectRelease();
    v7 = sub_23EC69260();
    sub_23EC68F24(v7);
    v9 = v8;
    swift_bridgeObjectRelease();
    sub_23EC5E394(v9);
    return v6;
  }
  sub_23EC8333C();
  result = sub_23EC83C90();
  v2 = result;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24265C474](i, v1);
      else
        v5 = *(id *)(v1 + 8 * i + 32);
      MEMORY[0x24265C1B0]();
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23EC8393C();
      sub_23EC83960();
      sub_23EC83930();
    }
    swift_bridgeObjectRelease();
    v6 = v10;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC69B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for ElementID();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC699D4();
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v5 = sub_23EC83C90();
  if (!v5)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_23EC5EDD8(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v8 = v12;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        MEMORY[0x24265C474](v7, v4);
      else
        swift_unknownObjectRetain();
      swift_getObjectType();
      sub_23EC7CE48((uint64_t)v3);
      swift_unknownObjectRelease();
      v12 = v8;
      v10 = *(_QWORD *)(v8 + 16);
      v9 = *(_QWORD *)(v8 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_23EC5EDD8(v9 > 1, v10 + 1, 1);
        v8 = v12;
      }
      ++v7;
      *(_QWORD *)(v8 + 16) = v10 + 1;
      sub_23EC6B064((uint64_t)v3, v8+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72) * v10);
    }
    while (v5 != v7);
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

void sub_23EC69CFC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void (*v20)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[6];

  v1 = v0;
  v2 = v0[4];
  while (1)
  {
    if ((~v2 & 0xF000000000000007) == 0)
      goto LABEL_13;
    if ((v2 & 0x8000000000000000) == 0)
    {
      v9 = v1[7];
      v8 = v1[8];
      if (v8)
      {
        v10 = (v8 - 1) & v8;
        v11 = __clz(__rbit64(v8)) | (v9 << 6);
LABEL_8:
        v12 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v11);
        v13 = v12;
        goto LABEL_9;
      }
      v24 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_54;
      v25 = (unint64_t)(v1[6] + 64) >> 6;
      if (v24 >= v25)
      {
        v12 = 0;
        v10 = 0;
        goto LABEL_9;
      }
      v26 = v1[5];
      v27 = *(_QWORD *)(v26 + 8 * v24);
      if (v27)
      {
LABEL_28:
        v10 = (v27 - 1) & v27;
        v11 = __clz(__rbit64(v27)) + (v24 << 6);
        v9 = v24;
        goto LABEL_8;
      }
      v28 = v9 + 2;
      if (v9 + 2 >= v25)
        goto LABEL_44;
      v27 = *(_QWORD *)(v26 + 8 * v28);
      if (v27)
      {
LABEL_32:
        v24 = v28;
        goto LABEL_28;
      }
      if (v9 + 3 < v25)
      {
        v27 = *(_QWORD *)(v26 + 8 * (v9 + 3));
        if (v27)
        {
          v24 = v9 + 3;
          goto LABEL_28;
        }
        v28 = v9 + 4;
        if (v9 + 4 >= v25)
        {
          v12 = 0;
          v10 = 0;
          v9 += 3;
LABEL_9:
          v1[7] = v9;
          v1[8] = v10;
          if (v12)
            return;
          goto LABEL_13;
        }
        v27 = *(_QWORD *)(v26 + 8 * v28);
        if (v27)
          goto LABEL_32;
        v24 = v9 + 5;
        if (v9 + 5 < v25)
        {
          v27 = *(_QWORD *)(v26 + 8 * v24);
          if (v27)
            goto LABEL_28;
          v24 = v25 - 1;
          v29 = v9 + 6;
          while (v25 != v29)
          {
            v27 = *(_QWORD *)(v26 + 8 * v29++);
            if (v27)
            {
              v24 = v29 - 1;
              goto LABEL_28;
            }
          }
LABEL_44:
          v12 = 0;
          v10 = 0;
          v9 = v24;
          goto LABEL_9;
        }
      }
      v12 = 0;
      v10 = 0;
      v9 = v28;
      goto LABEL_9;
    }
    v14 = sub_23EC83B88();
    if (v14)
    {
      v31 = v14;
      sub_23EC6AFC8(0, &qword_256DC7D90);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v32[0];
      swift_unknownObjectRelease();
      if (v15)
        return;
    }
LABEL_13:
    v17 = *v1;
    v16 = v1[1];
    if ((unint64_t)*v1 >> 62)
    {
      sub_23EC8333C();
      v30 = sub_23EC83C90();
      swift_bridgeObjectRelease();
      if (v16 == v30)
        return;
    }
    else if (v16 == *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      return;
    }
    if ((v17 & 0xC000000000000001) != 0)
    {
      v18 = (id)MEMORY[0x24265C474](v16, v17);
      goto LABEL_19;
    }
    if ((v16 & 0x8000000000000000) != 0)
      break;
    if (v16 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_52;
    v18 = *(id *)(v17 + 8 * v16 + 32);
LABEL_19:
    v19 = v18;
    if (__OFADD__(v16, 1))
      goto LABEL_53;
    v1[1] = v16 + 1;
    v20 = (void (*)(uint64_t *__return_ptr, _QWORD *))v1[2];
    v32[0] = v18;
    v20(&v31, v32);

    v2 = v31;
    if ((v31 & 0xC000000000000001) != 0)
    {
      sub_23EC8333C();
      sub_23EC83B64();
      sub_23EC6AFC8(0, &qword_256DC7D90);
      sub_23EC6B000((unint64_t *)&qword_256DC7D98, &qword_256DC7D90);
      sub_23EC839F0();
      v4 = v32[1];
      v3 = v32[2];
      v5 = v32[3];
      v6 = v32[4];
      v7 = v32[5];
      swift_bridgeObjectRelease();
      v2 = v4;
    }
    else
    {
      v6 = 0;
      v21 = -1 << *(_BYTE *)(v31 + 32);
      v3 = v31 + 56;
      v5 = ~v21;
      v22 = -v21;
      if (v22 < 64)
        v23 = ~(-1 << v22);
      else
        v23 = -1;
      v7 = v23 & *(_QWORD *)(v31 + 56);
    }
    sub_23EC6A178(v1[4]);
    v1[4] = v2;
    v1[5] = v3;
    v1[6] = v5;
    v1[7] = v6;
    v1[8] = v7;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
}

BOOL sub_23EC6A0A0(_QWORD *a1)
{
  return *a1 != 0;
}

id sub_23EC6A0B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = *a1;
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23EC6A0C4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  sub_23EC83408();
  swift_bridgeObjectRelease();
  sub_23EC6A178(v2);
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return a1;
}

uint64_t sub_23EC6A178(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_23EC65CA8();
  return result;
}

unint64_t sub_23EC6A18C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7DC0;
  if (!qword_256DC7DC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC7DB8);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7DC0);
  }
  return result;
}

uint64_t sub_23EC6A1D8(id *a1, id *__src, unint64_t a3, char *__dst, uint64_t (*a5)(id, id))
{
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  void **v15;
  unint64_t v16;
  void **v17;
  void *v18;
  id *v19;
  id v20;
  id v21;
  uint64_t v22;
  id *v23;
  char *v24;
  _QWORD *v25;
  id *v26;
  char *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t result;
  char *v33;
  id *v36;
  char *v37;
  void **v38;
  id *v39;

  v6 = __src;
  v7 = (char *)__src - (char *)a1;
  v8 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0)
    v8 = (char *)__src - (char *)a1;
  v9 = v8 >> 3;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 3;
  v39 = a1;
  v38 = (void **)__dst;
  if (v9 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != (char *)__src || &__src[v13] <= (id *)__dst)
        memmove(__dst, __src, 8 * v13);
      v33 = __dst;
      v24 = &__dst[8 * v13];
      v37 = v24;
      v39 = v6;
      if (a1 < v6 && v11 >= 8)
      {
        v25 = (_QWORD *)(a3 - 8);
        v26 = v6;
        do
        {
          v36 = v6;
          v27 = (char *)(v25 + 1);
          v28 = *--v26;
          v29 = *((id *)v24 - 1);
          v30 = v28;
          v31 = a5(v29, v30);

          if (v31 == -1)
          {
            if (v27 != (char *)v36 || v25 >= v36)
              *v25 = *v26;
            v39 = v26;
          }
          else
          {
            v37 = v24 - 8;
            v26 = v36;
            if (v27 < v24 || v25 >= (_QWORD *)v24 || v27 != v24)
              *v25 = *((_QWORD *)v24 - 1);
            v24 -= 8;
          }
          if (v26 <= a1)
            break;
          --v25;
          v6 = v26;
        }
        while (v24 > v33);
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (__dst != (char *)a1 || &a1[v9] <= (id *)__dst)
      memmove(__dst, a1, 8 * v9);
    v14 = (void **)&__dst[8 * v9];
    v37 = (char *)v14;
    if ((unint64_t)v6 < a3 && v7 >= 8)
    {
      v15 = (void **)__dst;
      v16 = a3;
      v17 = a1;
      do
      {
        v18 = *v15;
        v19 = v6;
        v20 = *v6;
        v21 = v18;
        v22 = a5(v20, v21);

        if (v22 == -1)
        {
          v23 = v19 + 1;
          if (v17 < v19 || v17 >= v23 || v17 != v19)
            *v17 = *v19;
        }
        else
        {
          if (v17 != v15)
            *v17 = *v15;
          v38 = ++v15;
          v23 = v19;
        }
        ++v17;
        if (v15 >= v14)
          break;
        v6 = v23;
      }
      while ((unint64_t)v23 < v16);
      v39 = v17;
    }
LABEL_43:
    sub_23EC61C84((void **)&v39, (const void **)&v38, &v37);
    return 1;
  }
  sub_23EC83408();
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

void sub_23EC6A4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(id, id))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v18;

  if (a3 != a2)
  {
    v6 = a3;
    v7 = *a4;
    v8 = *a4 + 8 * a3 - 8;
LABEL_5:
    v9 = *(void **)(v7 + 8 * v6);
    v10 = a1;
    v18 = v8;
    while (1)
    {
      v11 = *(void **)v8;
      v12 = v9;
      v13 = v11;
      v14 = a5(v12, v13);

      if (v14 != -1)
      {
LABEL_4:
        ++v6;
        v8 = v18 + 8;
        if (v6 == a2)
          return;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v15 = *(void **)v8;
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)v8 = v9;
      *(_QWORD *)(v8 + 8) = v15;
      v8 -= 8;
      if (v6 == ++v10)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_23EC6A5BC(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t (*v23)(id, id);
  uint64_t v24;
  uint64_t v25;
  id *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  char v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  id *v96;
  id *v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id *v104;
  id *v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t (*v117)(id, id);
  uint64_t v118;
  int v119[2];
  int v120[2];
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;

  v5 = a1[1];
  swift_retain_n();
  v6 = sub_23EC83D74();
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_135;
    if (v5)
    {
      sub_23EC83348();
      sub_23EC6A4D8(0, v5, 1, a1, a2);
    }
    return swift_release_n();
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_143;
  v8 = v6;
  v117 = a2;
  v121 = v2;
  v110 = a1;
  if (v5 < 2)
  {
    v12 = (char *)MEMORY[0x24BEE4AF8];
    v124 = MEMORY[0x24BEE4AF8];
    v116 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      v16 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_100:
      if (v16 >= 2)
      {
        v99 = *v110;
        v123 = *v110;
        do
        {
          v100 = v16 - 2;
          if (v16 < 2)
            goto LABEL_130;
          if (!v99)
            goto LABEL_142;
          v101 = (uint64_t)v12;
          v102 = *(_QWORD *)&v12[16 * v100 + 32];
          v103 = *(_QWORD *)&v12[16 * v16 + 24];
          v104 = (id *)(v99 + 8 * v102);
          v105 = (id *)(v99 + 8 * *(_QWORD *)&v12[16 * v16 + 16]);
          v106 = v99 + 8 * v103;
          sub_23EC83348();
          sub_23EC6A1D8(v104, v105, v106, v116, v117);
          if (v121)
            goto LABEL_97;
          sub_23EC83408();
          if (v103 < v102)
            goto LABEL_131;
          v12 = (char *)v101;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_23EC61EF4(v101);
          if (v100 >= *((_QWORD *)v12 + 2))
            goto LABEL_132;
          v107 = &v12[16 * v100 + 32];
          *(_QWORD *)v107 = v102;
          *((_QWORD *)v107 + 1) = v103;
          v108 = *((_QWORD *)v12 + 2);
          if (v16 > v108)
            goto LABEL_133;
          memmove(&v12[16 * v16 + 16], &v12[16 * v16 + 32], 16 * (v108 - v16));
          *((_QWORD *)v12 + 2) = v108 - 1;
          v16 = v108 - 1;
          v99 = v123;
        }
        while (v108 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)((v124 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23EC83930();
LABEL_112:
      swift_release_n();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v9 = v7 >> 1;
    sub_23EC6AFC8(0, &qword_256DC7DD0);
    v10 = sub_23EC83954();
    *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v116 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    v124 = v10;
  }
  v13 = 0;
  v14 = *a1;
  v112 = *a1 + 16;
  v113 = v8;
  v111 = *a1 - 8;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v15 = v5;
  v114 = v5;
  v122 = *a1;
  while (1)
  {
    v17 = v13;
    if (v13 + 1 >= v15)
    {
      v118 = v13 + 1;
      v23 = v117;
    }
    else
    {
      v18 = v12;
      v19 = *(void **)(v14 + 8 * (v13 + 1));
      v20 = *(void **)(v14 + 8 * v13);
      v21 = v19;
      v22 = v20;
      v23 = v117;
      v24 = v117(v21, v22);

      v25 = v17 + 2;
      if (v17 + 2 >= v15)
      {
        v118 = v17 + 2;
      }
      else
      {
        *(_QWORD *)v119 = v17;
        v26 = (id *)(v112 + 8 * v17);
        while (1)
        {
          v118 = v25;
          v27 = *(v26 - 1);
          v28 = *v26;
          v29 = v27;
          v30 = v117(v28, v29);

          if ((v24 == -1) == (v30 != -1))
            break;
          v25 = v118 + 1;
          ++v26;
          if (v114 == v118 + 1)
          {
            v118 = v114;
            break;
          }
        }
        v17 = *(_QWORD *)v119;
      }
      v12 = v18;
      v14 = v122;
      if (v24 == -1)
      {
        v31 = v118;
        if (v118 < v17)
          goto LABEL_138;
        if (v17 < v118)
        {
          v32 = (uint64_t *)(v111 + 8 * v118);
          v33 = v17;
          v34 = (uint64_t *)(v122 + 8 * v17);
          do
          {
            if (v33 != --v31)
            {
              if (!v122)
                goto LABEL_141;
              v35 = *v34;
              *v34 = *v32;
              *v32 = v35;
            }
            ++v33;
            --v32;
            ++v34;
          }
          while (v33 < v31);
        }
      }
    }
    if (v118 < v114)
    {
      if (__OFSUB__(v118, v17))
        goto LABEL_134;
      if (v118 - v17 < v113)
        break;
    }
LABEL_50:
    if (v118 < v17)
      goto LABEL_129;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_23EC61B8C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v48 = *((_QWORD *)v12 + 2);
    v47 = *((_QWORD *)v12 + 3);
    v16 = v48 + 1;
    if (v48 >= v47 >> 1)
      v12 = sub_23EC61B8C((char *)(v47 > 1), v48 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v16;
    v49 = v12 + 32;
    v50 = &v12[16 * v48 + 32];
    *(_QWORD *)v50 = v17;
    *((_QWORD *)v50 + 1) = v118;
    if (v48)
    {
      while (1)
      {
        v51 = v16 - 1;
        if (v16 >= 4)
        {
          v56 = &v49[16 * v16];
          v57 = *((_QWORD *)v56 - 8);
          v58 = *((_QWORD *)v56 - 7);
          v62 = __OFSUB__(v58, v57);
          v59 = v58 - v57;
          if (v62)
            goto LABEL_118;
          v61 = *((_QWORD *)v56 - 6);
          v60 = *((_QWORD *)v56 - 5);
          v62 = __OFSUB__(v60, v61);
          v54 = v60 - v61;
          v55 = v62;
          if (v62)
            goto LABEL_119;
          v63 = v16 - 2;
          v64 = &v49[16 * v16 - 32];
          v66 = *(_QWORD *)v64;
          v65 = *((_QWORD *)v64 + 1);
          v62 = __OFSUB__(v65, v66);
          v67 = v65 - v66;
          if (v62)
            goto LABEL_121;
          v62 = __OFADD__(v54, v67);
          v68 = v54 + v67;
          if (v62)
            goto LABEL_124;
          if (v68 >= v59)
          {
            v86 = &v49[16 * v51];
            v88 = *(_QWORD *)v86;
            v87 = *((_QWORD *)v86 + 1);
            v62 = __OFSUB__(v87, v88);
            v89 = v87 - v88;
            if (v62)
              goto LABEL_128;
            v79 = v54 < v89;
            goto LABEL_87;
          }
        }
        else
        {
          if (v16 != 3)
          {
            v80 = *((_QWORD *)v12 + 4);
            v81 = *((_QWORD *)v12 + 5);
            v62 = __OFSUB__(v81, v80);
            v73 = v81 - v80;
            v74 = v62;
            goto LABEL_81;
          }
          v53 = *((_QWORD *)v12 + 4);
          v52 = *((_QWORD *)v12 + 5);
          v62 = __OFSUB__(v52, v53);
          v54 = v52 - v53;
          v55 = v62;
        }
        if ((v55 & 1) != 0)
          goto LABEL_120;
        v63 = v16 - 2;
        v69 = &v49[16 * v16 - 32];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v72 = __OFSUB__(v70, v71);
        v73 = v70 - v71;
        v74 = v72;
        if (v72)
          goto LABEL_123;
        v75 = &v49[16 * v51];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v62 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v62)
          goto LABEL_126;
        if (__OFADD__(v73, v78))
          goto LABEL_127;
        if (v73 + v78 >= v54)
        {
          v79 = v54 < v78;
LABEL_87:
          if (v79)
            v51 = v63;
          goto LABEL_89;
        }
LABEL_81:
        if ((v74 & 1) != 0)
          goto LABEL_122;
        v82 = &v49[16 * v51];
        v84 = *(_QWORD *)v82;
        v83 = *((_QWORD *)v82 + 1);
        v62 = __OFSUB__(v83, v84);
        v85 = v83 - v84;
        if (v62)
          goto LABEL_125;
        if (v85 < v73)
          goto LABEL_15;
LABEL_89:
        v90 = v51 - 1;
        if (v51 - 1 >= v16)
        {
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
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
          goto LABEL_137;
        }
        if (!v14)
          goto LABEL_140;
        v91 = &v49[16 * v90];
        v92 = *(_QWORD *)v91;
        v93 = v51;
        v94 = &v49[16 * v51];
        v95 = *((_QWORD *)v94 + 1);
        v96 = (id *)(v14 + 8 * *(_QWORD *)v91);
        v97 = (id *)(v14 + 8 * *(_QWORD *)v94);
        sub_23EC83348();
        sub_23EC6A1D8(v96, v97, v14 + 8 * v95, v116, v117);
        if (v121)
        {
LABEL_97:
          swift_bridgeObjectRelease();
          sub_23EC83408();
          *(_QWORD *)((v124 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_23EC83930();
          goto LABEL_112;
        }
        sub_23EC83408();
        if (v95 < v92)
          goto LABEL_115;
        if (v93 > *((_QWORD *)v12 + 2))
          goto LABEL_116;
        *(_QWORD *)v91 = v92;
        *(_QWORD *)&v12[16 * v90 + 40] = v95;
        v98 = *((_QWORD *)v12 + 2);
        if (v93 >= v98)
          goto LABEL_117;
        v16 = v98 - 1;
        memmove(v94, v94 + 16, 16 * (v98 - 1 - v93));
        v49 = v12 + 32;
        *((_QWORD *)v12 + 2) = v98 - 1;
        v14 = v122;
        if (v98 <= 2)
          goto LABEL_15;
      }
    }
    v16 = 1;
LABEL_15:
    v15 = v114;
    v13 = v118;
    if (v118 >= v114)
      goto LABEL_100;
  }
  if (__OFADD__(v17, v113))
    goto LABEL_136;
  v36 = v114;
  if (v17 + v113 < v114)
    v36 = v17 + v113;
  if (v36 >= v17)
  {
    v37 = v118;
    if (v118 != v36)
    {
      *(_QWORD *)v120 = v17;
      v109 = v12;
      v38 = v111 + 8 * v118;
      v115 = v36;
      do
      {
        v39 = *(void **)(v14 + 8 * v37);
        v40 = *(_QWORD *)v120;
        v41 = v38;
        while (1)
        {
          v42 = *(void **)v41;
          v43 = v39;
          v44 = v42;
          v45 = v23(v43, v44);

          if (v45 != -1)
            break;
          v14 = v122;
          if (!v122)
            goto LABEL_139;
          v46 = *(void **)v41;
          v39 = *(void **)(v41 + 8);
          *(_QWORD *)v41 = v39;
          *(_QWORD *)(v41 + 8) = v46;
          v41 -= 8;
          if (v37 == ++v40)
            goto LABEL_43;
        }
        v14 = v122;
LABEL_43:
        ++v37;
        v38 += 8;
      }
      while (v37 != v115);
      v118 = v115;
      v12 = v109;
      v17 = *(_QWORD *)v120;
    }
    goto LABEL_50;
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  swift_release_n();
  __break(1u);
LABEL_140:
  swift_release_n();
  __break(1u);
LABEL_141:
  swift_release_n();
  __break(1u);
LABEL_142:
  swift_release_n();
  __break(1u);
LABEL_143:
  swift_release_n();
  result = sub_23EC83C84();
  __break(1u);
  return result;
}

uint64_t sub_23EC6AE4C(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8[2];

  v4 = *a1;
  swift_retain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_23EC62C40();
  v6 = *(_QWORD *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  sub_23EC83348();
  sub_23EC6A5BC(v8, a2);
  sub_23EC83408();
  sub_23EC83C24();
  return swift_release_n();
}

_OWORD *sub_23EC6AF04(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23EC6AF14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return sub_23EC83408();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23EC6AF70()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23EC6AF94(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_23EC69498(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23EC6AF9C()
{
  sub_23EC83408();
  return swift_deallocObject();
}

uint64_t sub_23EC6AFC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23EC69520(a1, a2, *(uint64_t (**)(_QWORD *, _QWORD *))(v2 + 16));
}

uint64_t sub_23EC6AFC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23EC6B000(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_23EC6AFC8(255, a2);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23EC6B064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EC6B0A8()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B20);
  swift_getKeyPath();
  swift_getKeyPath();
  result = sub_23EC833A8();
  qword_256DC7DE8 = result;
  return result;
}

uint64_t static HomeXLTileEntity.defaultQuery.getter@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256DC7818 != -1)
    swift_once();
  *a1 = qword_256DC7DE8;
  return sub_23EC83348();
}

uint64_t sub_23EC6B150()
{
  uint64_t v0;

  v0 = sub_23EC833CC();
  __swift_allocate_value_buffer(v0, qword_256DC7DF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC7DF0);
  return sub_23EC833C0();
}

uint64_t static HomeXLTileEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7820 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7DF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t HomeXLTileEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
}

uint64_t HomeXLTileEntity.homeID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for HomeXLTileEntity();
  return sub_23EC6522C(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
}

uint64_t type metadata accessor for HomeXLTileEntity()
{
  uint64_t result;

  result = qword_254341230;
  if (!qword_254341230)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t HomeXLTileEntity.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for HomeXLTileEntity();
  return sub_23EC6522C(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t HomeXLTileEntity.item.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for HomeXLTileEntity() + 24);
  return sub_23EC6B328(a1, v3);
}

uint64_t sub_23EC6B328(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TileElementInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*HomeXLTileEntity.item.modify())()
{
  type metadata accessor for HomeXLTileEntity();
  return nullsub_1;
}

uint64_t HomeXLTileEntity.displayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC83444();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23EC8381C();
  MEMORY[0x24BDAC7A8](v6);
  sub_23EC83810();
  sub_23EC83804();
  type metadata accessor for HomeXLTileEntity();
  type metadata accessor for TileElementInfo();
  sub_23EC837F8();
  sub_23EC83804();
  sub_23EC83438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  sub_23EC8333C();
  sub_23EC832E8();
  return sub_23EC83300();
}

uint64_t HomeXLTileEntity.hash(into:)()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  type metadata accessor for HomeXLTileEntity();
  sub_23EC837D4();
  return TileElementInfo.hash(into:)();
}

uint64_t static HomeXLTileEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
    && (v4 = type metadata accessor for ElementID(),
        *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    && (v5 = type metadata accessor for HomeXLTileEntity(), (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0))
  {
    return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + *(int *)(v5 + 24), a2 + *(int *)(v5 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t HomeXLTileEntity.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  type metadata accessor for HomeXLTileEntity();
  sub_23EC837D4();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6B780@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256DC7818 != -1)
    swift_once();
  *a1 = qword_256DC7DE8;
  return sub_23EC83348();
}

uint64_t sub_23EC6B7D0()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  sub_23EC837D4();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6B898()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  sub_23EC837D4();
  return TileElementInfo.hash(into:)();
}

uint64_t sub_23EC6B948()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  sub_23EC837D4();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6BA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
    && (v6 = type metadata accessor for ElementID(),
        *(unsigned __int8 *)(a1 + *(int *)(v6 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v6 + 20)))
    && (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0)
  {
    return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23EC6BA90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7820 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7DF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC6BB00()
{
  sub_23EC65F10(qword_256DC7B70, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
  return sub_23EC83168();
}

uint64_t sub_23EC6BB54()
{
  sub_23EC65F10(&qword_254341218, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
  return sub_23EC833FC();
}

uint64_t static HomeXLTileEntity.create(id:homeID:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;

  sub_23EC6522C(a1, a4, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  v7 = type metadata accessor for HomeXLTileEntity();
  sub_23EC6522C(a2, a4 + *(int *)(v7 + 20), (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  return sub_23EC6522C(a3, a4 + *(int *)(v7 + 24), (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t sub_23EC6BC1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
}

uint64_t sub_23EC6BC40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23EC6522C(v2 + *(int *)(a1 + 20), a2, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
}

uint64_t sub_23EC6BC68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23EC6522C(v2 + *(int *)(a1 + 24), a2, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t sub_23EC6BC90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_23EC6522C(a1, a5, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  sub_23EC6522C(a2, a5 + *(int *)(a4 + 20), (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  return sub_23EC6522C(a3, a5 + *(int *)(a4 + 24), (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

void sub_23EC6BD00()
{
  strcpy((char *)&qword_256DC7E08, "com.apple.Home");
  unk_256DC7E17 = -18;
}

uint64_t static HomeXLTileEntity.attributionBundleIdentifier.getter()
{
  uint64_t v0;

  if (qword_256DC7828 != -1)
    swift_once();
  v0 = qword_256DC7E08;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC6BD8C()
{
  uint64_t v0;

  if (qword_256DC7828 != -1)
    swift_once();
  v0 = qword_256DC7E08;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC6BDE8()
{
  return sub_23EC65F10(&qword_2543411E8, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BE14()
{
  return sub_23EC65F10(&qword_254341200, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BE40()
{
  return sub_23EC65F10(&qword_254341228, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BE6C()
{
  return sub_23EC65F10(&qword_256DC7E18, (uint64_t (*)(uint64_t))type metadata accessor for ElementID, (uint64_t)&protocol conformance descriptor for ElementID);
}

uint64_t sub_23EC6BE98()
{
  return sub_23EC65F10(&qword_256DC7E20, (uint64_t (*)(uint64_t))type metadata accessor for ElementID, (uint64_t)&protocol conformance descriptor for ElementID);
}

uint64_t sub_23EC6BEC4()
{
  return sub_23EC65F10(&qword_256DC7E28, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BEF0()
{
  return sub_23EC65F10(&qword_254341208, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BF1C()
{
  return sub_23EC65F10(&qword_254341210, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BF48()
{
  return sub_23EC65F10((unint64_t *)&unk_2543411F0, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6BF74()
{
  return sub_23EC65F10(&qword_254341218, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

unint64_t sub_23EC6BFA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7E30;
  if (!qword_256DC7E30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC7E38);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB6250], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7E30);
  }
  return result;
}

uint64_t sub_23EC6BFF0()
{
  return sub_23EC65F10(&qword_254341220, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

uint64_t sub_23EC6C01C(uint64_t a1)
{
  uint64_t result;

  result = sub_23EC65F10(qword_256DC7B70, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23EC6C058()
{
  return sub_23EC65F10(qword_256DC7B70, (uint64_t (*)(uint64_t))type metadata accessor for HomeXLTileEntity, (uint64_t)&protocol conformance descriptor for HomeXLTileEntity);
}

_QWORD *initializeBufferWithCopyOfBuffer for HomeXLTileEntity(_QWORD *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v27 = *(_QWORD *)a2;
    *a1 = *(_QWORD *)a2;
    a1 = (_QWORD *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    sub_23EC83348();
  }
  else
  {
    v7 = sub_23EC834A4();
    v8 = *(void (**)(_QWORD *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for ElementID();
    *((_BYTE *)a1 + *(int *)(v9 + 20)) = a2[*(int *)(v9 + 20)];
    v8((_QWORD *)((char *)a1 + *(int *)(a3 + 20)), &a2[*(int *)(a3 + 20)], v7);
    v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = &a2[v10];
    v8((_QWORD *)((char *)a1 + v10), v12, v7);
    v11[*(int *)(v9 + 20)] = v12[*(int *)(v9 + 20)];
    v13 = (int *)type metadata accessor for TileElementInfo();
    v14 = v13[5];
    v15 = &v11[v14];
    v16 = &v12[v14];
    v18 = *(_QWORD *)v16;
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = v18;
    *((_QWORD *)v15 + 1) = v17;
    v19 = v13[6];
    v20 = &v11[v19];
    v21 = &v12[v19];
    v22 = *((_QWORD *)v21 + 1);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = v13[7];
    v24 = &v11[v23];
    v25 = &v12[v23];
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *((_QWORD *)v24 + 1) = v26;
    v11[v13[8]] = v12[v13[8]];
    sub_23EC8333C();
    sub_23EC8333C();
    sub_23EC8333C();
  }
  return a1;
}

uint64_t destroy for HomeXLTileEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_23EC834A4();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  v5(a1 + *(int *)(a2 + 24), v4);
  type metadata accessor for TileElementInfo();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v6 = sub_23EC834A4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v8 + 20)) = *(_BYTE *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(_BYTE *)(v10 + *(int *)(v8 + 20)) = *(_BYTE *)(v11 + *(int *)(v8 + 20));
  v12 = (int *)type metadata accessor for TileElementInfo();
  v13 = v12[5];
  v14 = (_QWORD *)(v10 + v13);
  v15 = (uint64_t *)(v11 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  v18 = v12[6];
  v19 = (_QWORD *)(v10 + v18);
  v20 = (_QWORD *)(v11 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = v12[7];
  v23 = (_QWORD *)(v10 + v22);
  v24 = (_QWORD *)(v11 + v22);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  *(_BYTE *)(v10 + v12[8]) = *(_BYTE *)(v11 + v12[8]);
  sub_23EC8333C();
  sub_23EC8333C();
  sub_23EC8333C();
  return a1;
}

uint64_t assignWithCopy for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  v6 = sub_23EC834A4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v8 + 20)) = *(_BYTE *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(_BYTE *)(v10 + *(int *)(v8 + 20)) = *(_BYTE *)(v11 + *(int *)(v8 + 20));
  v12 = (int *)type metadata accessor for TileElementInfo();
  v13 = v12[5];
  v14 = (_QWORD *)(v10 + v13);
  v15 = (_QWORD *)(v11 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  v16 = v12[6];
  v17 = (_QWORD *)(v10 + v16);
  v18 = (_QWORD *)(v11 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  v19 = v12[7];
  v20 = (_QWORD *)(v10 + v19);
  v21 = (_QWORD *)(v11 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v10 + v12[8]) = *(_BYTE *)(v11 + v12[8]);
  return a1;
}

uint64_t initializeWithTake for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;

  v6 = sub_23EC834A4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v8 + 20)) = *(_BYTE *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(_BYTE *)(v10 + *(int *)(v8 + 20)) = *(_BYTE *)(v11 + *(int *)(v8 + 20));
  v12 = (int *)type metadata accessor for TileElementInfo();
  *(_OWORD *)(v10 + v12[5]) = *(_OWORD *)(v11 + v12[5]);
  *(_OWORD *)(v10 + v12[6]) = *(_OWORD *)(v11 + v12[6]);
  *(_OWORD *)(v10 + v12[7]) = *(_OWORD *)(v11 + v12[7]);
  *(_BYTE *)(v10 + v12[8]) = *(_BYTE *)(v11 + v12[8]);
  return a1;
}

uint64_t assignWithTake for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = sub_23EC834A4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v8 + 20)) = *(_BYTE *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(_BYTE *)(v10 + *(int *)(v8 + 20)) = *(_BYTE *)(v11 + *(int *)(v8 + 20));
  v12 = (int *)type metadata accessor for TileElementInfo();
  v13 = v12[5];
  v14 = (_QWORD *)(v10 + v13);
  v15 = (uint64_t *)(v11 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = v12[6];
  v19 = (_QWORD *)(v10 + v18);
  v20 = (uint64_t *)(v11 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = v12[7];
  v24 = (_QWORD *)(v10 + v23);
  v25 = (uint64_t *)(v11 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v10 + v12[8]) = *(_BYTE *)(v11 + v12[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLTileEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC6C6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for ElementID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for HomeID();
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for TileElementInfo();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for HomeXLTileEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC6C784(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for ElementID();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = type metadata accessor for HomeID();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for TileElementInfo();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23EC6C824()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for ElementID();
  if (v1 <= 0x3F)
  {
    result = sub_23EC834A4();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for TileElementInfo();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

double sub_23EC6C8D0()
{
  double result;

  result = 2.21366487e214;
  xmmword_256DC7E40 = xmmword_23EC843E0;
  return result;
}

uint64_t static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.getter()
{
  uint64_t v0;

  if (qword_256DC7830 != -1)
    swift_once();
  swift_beginAccess();
  v0 = xmmword_256DC7E40;
  sub_23EC8333C();
  return v0;
}

uint64_t static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  if (qword_256DC7830 != -1)
    swift_once();
  swift_beginAccess();
  *(_QWORD *)&xmmword_256DC7E40 = a1;
  *((_QWORD *)&xmmword_256DC7E40 + 1) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.modify())()
{
  if (qword_256DC7830 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23EC6CA4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_23EC8342C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23EC83444();
  __swift_allocate_value_buffer(v6, qword_256DC7E50);
  __swift_project_value_buffer(v6, (uint64_t)qword_256DC7E50);
  sub_23EC837EC();
  sub_23EC834B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD328], v0);
  return sub_23EC83450();
}

uint64_t static HomeSingleTileConfigurationIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23EC56BA8(&qword_256DC7838, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_256DC7E50, a1);
}

uint64_t sub_23EC6CBF4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_23EC8342C();
  v3 = *(_QWORD *)(v12[0] - 8);
  MEMORY[0x24BDAC7A8](v12[0]);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23EC83444();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = sub_23EC83288();
  __swift_allocate_value_buffer(v10, qword_256DC7E68);
  __swift_project_value_buffer(v10, (uint64_t)qword_256DC7E68);
  sub_23EC837EC();
  sub_23EC834B0();
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, *MEMORY[0x24BDCD328], v12[0]);
  sub_23EC83450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_23EC83294();
}

uint64_t static HomeSingleTileConfigurationIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23EC56BA8(&qword_256DC7840, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_256DC7E68, a1);
}

uint64_t HomeSingleTileConfigurationIntent.init(home:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t *v44;
  char *v45;
  unsigned int v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  unint64_t v52;
  unsigned int v53;
  void (*v54)(char *);
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  char *v65;
  uint64_t v66;

  v63 = a2;
  v64 = a3;
  v61 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v62 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v60 = (char *)&v45 - v6;
  v66 = sub_23EC83360();
  v58 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v57 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A68);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v65 = (char *)&v45 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v59 = (uint64_t)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23EC8342C();
  v21 = *(_QWORD *)(v20 - 8);
  v55 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v24);
  v25 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v25);
  v26 = sub_23EC83444();
  v27 = *(_QWORD *)(v26 - 8);
  v50 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v45 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A90);
  sub_23EC837EC();
  sub_23EC834B0();
  v53 = *MEMORY[0x24BDCD328];
  v54 = *(void (**)(char *))(v21 + 104);
  v47 = v23;
  v54(v23);
  v52 = 0x800000023EC84D00;
  sub_23EC83450();
  v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  v49(v19, 1, 1, v26);
  v30 = type metadata accessor for SelectedHomeEntity();
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v51 = v16;
  v31(v16, 1, 1, v30);
  v32 = sub_23EC83210();
  v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
  v33(v65, 1, 1, v32);
  v34 = v56;
  v33(v56, 1, 1, v32);
  v46 = *MEMORY[0x24BDB6090];
  v35 = v57;
  v58 = *(_QWORD *)(v58 + 104);
  ((void (*)(char *))v58)(v57);
  sub_23EC65F10((unint64_t *)&qword_256DC7A98, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
  v45 = v29;
  v36 = sub_23EC83258();
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E88);
  sub_23EC83348();
  sub_23EC837EC();
  sub_23EC834B0();
  ((void (*)(char *, _QWORD, uint64_t))v54)(v47, v53, v55);
  sub_23EC83450();
  v49(v19, 1, 1, v50);
  v37 = type metadata accessor for HomeSingleTileEntity();
  v38 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v60, 1, 1, v37);
  v33(v65, 1, 1, v32);
  v33(v34, 1, 1, v32);
  ((void (*)(char *, _QWORD, uint64_t))v58)(v35, v46, v66);
  sub_23EC65F10(&qword_256DC7E90, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
  v39 = sub_23EC83258();
  v40 = v61;
  v41 = (uint64_t)v51;
  sub_23EC65E44(v61, (uint64_t)v51, &qword_256DC7A60);
  sub_23EC65E44(v41, v59, &qword_256DC7A60);
  swift_retain_n();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC563CC(v41, &qword_256DC7A60);
  sub_23EC83408();
  sub_23EC83408();
  v42 = v63;
  sub_23EC65E44(v63, v38, &qword_256DC7E80);
  sub_23EC65E44(v38, v62, &qword_256DC7E80);
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC563CC(v38, &qword_256DC7E80);
  sub_23EC563CC(v42, &qword_256DC7E80);
  sub_23EC563CC(v40, &qword_256DC7A60);
  swift_release_n();
  result = swift_release_n();
  v44 = v64;
  *v64 = v36;
  v44[1] = v39;
  return result;
}

uint64_t HomeSingleTileConfigurationIntent.home.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8](v2);
  sub_23EC65E44(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256DC7A60);
  sub_23EC83234();
  return sub_23EC563CC(a1, &qword_256DC7A60);
}

uint64_t HomeSingleTileConfigurationIntent.item.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  MEMORY[0x24BDAC7A8](v2);
  sub_23EC65E44(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256DC7E80);
  sub_23EC83234();
  return sub_23EC563CC(a1, &qword_256DC7E80);
}

double HomeSingleTileConfigurationIntent.init()@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  __int128 v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v7, (uint64_t)v4, (uint64_t *)&v11);
  result = *(double *)&v11;
  *a1 = v11;
  return result;
}

uint64_t HomeSingleTileConfigurationIntent.home.getter()
{
  return sub_23EC83228();
}

uint64_t (*HomeSingleTileConfigurationIntent.home.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

uint64_t HomeSingleTileConfigurationIntent.$home.getter()
{
  return sub_23EC83240();
}

uint64_t HomeSingleTileConfigurationIntent.item.getter()
{
  return sub_23EC83228();
}

uint64_t sub_23EC6D7BC()
{
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t sub_23EC6D808(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_23EC65E44(a1, (uint64_t)&v9 - v6, &qword_256DC7E80);
  sub_23EC65E44((uint64_t)v7, (uint64_t)v5, &qword_256DC7E80);
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC563CC((uint64_t)v7, &qword_256DC7E80);
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t (*HomeSingleTileConfigurationIntent.item.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23EC8321C();
  return sub_23EC576AC;
}

uint64_t HomeSingleTileConfigurationIntent.$item.getter()
{
  return sub_23EC83240();
}

uint64_t static HomeSingleTileConfigurationIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_23EC833E4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6258], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E98);
  sub_23EC6DD28();
  sub_23EC58F78((unint64_t *)&unk_256DC7EA0, &qword_256DC7E98, MEMORY[0x24BDB5F68]);
  sub_23EC58F78((unint64_t *)&unk_256DC7B10, &qword_256DC7A90, MEMORY[0x24BDB55D8]);
  return sub_23EC83408();
}

uint64_t sub_23EC6DA7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

uint64_t sub_23EC6DAD4()
{
  return sub_23EC6DC04();
}

uint64_t sub_23EC6DAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_getKeyPath();
  sub_23EC6DD28();
  v0 = sub_23EC83348();
  sub_23EC83408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23EC84D10;
  *(_QWORD *)(v1 + 32) = v0;
  sub_23EC83930();
  sub_23EC83348();
  v2 = sub_23EC8333C();
  sub_23EC83408();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23EC6DBA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23EC83348();
  sub_23EC83348();
  v2 = sub_23EC83240();
  sub_23EC83408();
  result = sub_23EC83408();
  *a1 = v2;
  return result;
}

uint64_t sub_23EC6DBF8()
{
  return sub_23EC6DC04();
}

uint64_t sub_23EC6DC04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E98);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - v5;
  sub_23EC6DD28();
  sub_23EC83354();
  sub_23EC58F78((unint64_t *)&unk_256DC7EA0, &qword_256DC7E98, MEMORY[0x24BDB5F68]);
  sub_23EC8336C();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  sub_23EC8336C();
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

unint64_t sub_23EC6DD28()
{
  unint64_t result;

  result = qword_2543412E8;
  if (!qword_2543412E8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileConfigurationIntent, &type metadata for HomeSingleTileConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412E8);
  }
  return result;
}

uint64_t sub_23EC6DD6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  sub_23EC6DD28();
  v0 = sub_23EC83348();
  sub_23EC83408();
  swift_getKeyPath();
  sub_23EC83348();
  v1 = sub_23EC83348();
  sub_23EC83408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B08);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23EC84400;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  sub_23EC83930();
  sub_23EC83348();
  v3 = sub_23EC8333C();
  sub_23EC83408();
  sub_23EC83408();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23EC6DE68()
{
  uint64_t v0;

  if (qword_256DC7830 != -1)
    swift_once();
  swift_beginAccess();
  v0 = xmmword_256DC7E40;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC6DEE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7838 != -1)
    swift_once();
  v2 = sub_23EC83444();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7E50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC6DF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_23EC833E4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6258], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E98);
  sub_23EC58F78((unint64_t *)&unk_256DC7EA0, &qword_256DC7E98, MEMORY[0x24BDB5F68]);
  sub_23EC58F78((unint64_t *)&unk_256DC7B10, &qword_256DC7A90, MEMORY[0x24BDB55D8]);
  return sub_23EC83408();
}

uint64_t sub_23EC6E074()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23EC6E850();
  *v1 = v0;
  v1[1] = sub_23EC58914;
  return sub_23EC833D8();
}

double sub_23EC6E0D8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  __int128 v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v7, (uint64_t)v4, (uint64_t *)&v11);
  result = *(double *)&v11;
  *a1 = v11;
  return result;
}

uint64_t sub_23EC6E1D4()
{
  sub_23EC6DD28();
  return sub_23EC831B0();
}

double HomeSingleTileConfigurationIntent.init(item:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double result;
  __int128 v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HomeSingleTileEntity();
  sub_23EC6522C(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  v11 = type metadata accessor for SelectedHomeEntity();
  v12 = &v9[*(int *)(v11 + 20)];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0xE000000000000000;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  sub_23EC6522C(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HomeSingleTileEntity);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 0, 1, v10);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v9, (uint64_t)v6, (uint64_t *)&v14);
  sub_23EC6E350(a1);
  result = *(double *)&v14;
  *a2 = v14;
  return result;
}

uint64_t sub_23EC6E350(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static HomeSingleTileConfigurationIntent.defaultIntent.getter(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7E80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v20 - v9;
  v11 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v10, (uint64_t)v4, v20);
  v13 = v20[0];
  v14 = v20[1];
  v15 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v16 = objc_msgSend(v15, sel_homeManager);

  if (v16)
  {
    v17 = objc_msgSend(v16, sel_homes);
    sub_23EC58B7C();
    v18 = sub_23EC83918();

    if (v18 >> 62)
    {
      sub_23EC8333C();
      v19 = sub_23EC83C90();
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v19 >= 2)
    {
      sub_23EC83348();
      sub_23EC83348();
      static SelectedHomeEntity.selectedHome.getter((uint64_t)v10);
      sub_23EC65E44((uint64_t)v10, (uint64_t)v8, &qword_256DC7A60);
      sub_23EC83234();
      sub_23EC563CC((uint64_t)v10, &qword_256DC7A60);
      sub_23EC83408();
      sub_23EC83408();
    }

  }
  *a1 = v13;
  a1[1] = v14;
}

unint64_t sub_23EC6E5E0()
{
  unint64_t result;

  result = qword_2543412F0;
  if (!qword_2543412F0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileConfigurationIntent, &type metadata for HomeSingleTileConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412F0);
  }
  return result;
}

unint64_t sub_23EC6E628()
{
  unint64_t result;

  result = qword_2543412E0;
  if (!qword_2543412E0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileConfigurationIntent, &type metadata for HomeSingleTileConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_2543412E0);
  }
  return result;
}

uint64_t sub_23EC6E66C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for HomeSingleTileConfigurationIntent()
{
  sub_23EC83408();
  return sub_23EC83408();
}

_QWORD *_s17HomeWidgetIntents33HomeSingleTileConfigurationIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_23EC83348();
  sub_23EC83348();
  return a1;
}

_QWORD *assignWithCopy for HomeSingleTileConfigurationIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_23EC83348();
  sub_23EC83408();
  a1[1] = a2[1];
  sub_23EC83348();
  sub_23EC83408();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for HomeSingleTileConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  sub_23EC83408();
  *a1 = *a2;
  sub_23EC83408();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeSingleTileConfigurationIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeSingleTileConfigurationIntent(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeSingleTileConfigurationIntent()
{
  return &type metadata for HomeSingleTileConfigurationIntent;
}

uint64_t sub_23EC6E824()
{
  return sub_23EC58F78(&qword_256DC7EB0, &qword_256DC7EB8, MEMORY[0x24BDB6460]);
}

unint64_t sub_23EC6E850()
{
  unint64_t result;

  result = qword_256DC7EC0;
  if (!qword_256DC7EC0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileConfigurationIntent, &type metadata for HomeSingleTileConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_256DC7EC0);
  }
  return result;
}

uint64_t HomeID.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t HomeID.init(id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t HomeID.hash(into:)()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23EC837D4();
}

uint64_t sub_23EC6E968()
{
  return 1;
}

uint64_t sub_23EC6E970()
{
  sub_23EC83DF8();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6E9B0()
{
  return sub_23EC83E04();
}

uint64_t sub_23EC6E9D4()
{
  sub_23EC83DF8();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6EA14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC6F8F8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23EC6EA3C()
{
  return 0;
}

void sub_23EC6EA48(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23EC6EA54()
{
  sub_23EC6EBB4();
  return sub_23EC83E40();
}

uint64_t sub_23EC6EA7C()
{
  sub_23EC6EBB4();
  return sub_23EC83E4C();
}

uint64_t HomeID.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC6EBB4();
  sub_23EC83E34();
  sub_23EC834A4();
  sub_23EC65F10(&qword_256DC7ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23EC83D5C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23EC6EBB4()
{
  unint64_t result;

  result = qword_256DC7ED0;
  if (!qword_256DC7ED0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC8515C, &type metadata for HomeID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC7ED0);
  }
  return result;
}

uint64_t HomeID.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  return sub_23EC83E1C();
}

uint64_t HomeID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v15 = a2;
  v17 = sub_23EC834A4();
  v14 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v16 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for HomeID();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC6EBB4();
  sub_23EC83E28();
  if (!v2)
  {
    sub_23EC65F10(&qword_256DC7EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23EC83D14();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v16, v17);
    sub_23EC6EFC8((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_23EC6EE28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23EC6EE60()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6EECC()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23EC837D4();
}

uint64_t sub_23EC6EF24()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  return sub_23EC83E1C();
}

uint64_t type metadata accessor for HomeID()
{
  uint64_t result;

  result = qword_256DC7F58;
  if (!qword_256DC7F58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23EC6EFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EC6F00C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeID.init(from:)(a1, a2);
}

uint64_t sub_23EC6F020(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC6EBB4();
  sub_23EC83E34();
  sub_23EC834A4();
  sub_23EC65F10(&qword_256DC7ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23EC83D5C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t static HomeID.entityIdentifier(for:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EF0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EC834A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EC83468();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_23EC6F280((uint64_t)v4);
    v9 = type metadata accessor for HomeID();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    v11 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v11(v8, v4, v5);
    v11(a1, v8, v5);
    v12 = type metadata accessor for HomeID();
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
}

uint64_t sub_23EC6F280(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EC6F2C4@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23EC834A4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EC83468();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23EC6F280((uint64_t)v6);
    v11 = 1;
  }
  else
  {
    v12 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v12(v10, v6, v7);
    v12(a2, v10, v7);
    v11 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, v11, 1, a1);
}

uint64_t HomeID.debugDescription.getter()
{
  _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
  sub_23EC83870();
  swift_bridgeObjectRelease();
  return 0x3A4449656D6F48;
}

uint64_t sub_23EC6F450()
{
  return sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_23EC6F47C()
{
  return sub_23EC65F10(&qword_256DC7EF8, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, (uint64_t)&protocol conformance descriptor for HomeID);
}

uint64_t initializeBufferWithCopyOfBuffer for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for ElementID(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeID()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC6F634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HomeID()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC6F67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23EC6F6BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EC834A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HomeID.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for HomeID.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23EC6F7BC + 4 * byte_23EC84F00[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23EC6F7DC + 4 * byte_23EC84F05[v4]))();
}

_BYTE *sub_23EC6F7BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23EC6F7DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC6F7E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC6F7EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC6F7F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC6F7FC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23EC6F808()
{
  return 0;
}

ValueMetadata *type metadata accessor for HomeID.CodingKeys()
{
  return &type metadata for HomeID.CodingKeys;
}

unint64_t sub_23EC6F824()
{
  unint64_t result;

  result = qword_256DC7F90;
  if (!qword_256DC7F90)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85134, &type metadata for HomeID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC7F90);
  }
  return result;
}

unint64_t sub_23EC6F86C()
{
  unint64_t result;

  result = qword_256DC7F98;
  if (!qword_256DC7F98)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC850A4, &type metadata for HomeID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC7F98);
  }
  return result;
}

unint64_t sub_23EC6F8B4()
{
  unint64_t result;

  result = qword_256DC7FA0;
  if (!qword_256DC7FA0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC850CC, &type metadata for HomeID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC7FA0);
  }
  return result;
}

uint64_t sub_23EC6F8F8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23EC6F964()
{
  return 25705;
}

uint64_t sub_23EC6F978()
{
  uint64_t v0;

  v0 = sub_23EC833CC();
  __swift_allocate_value_buffer(v0, qword_256DC7FA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC7FA8);
  return sub_23EC833C0();
}

uint64_t static RecommendedMode.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7848 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7FA8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t RecommendedMode.id.getter(char a1)
{
  return *(_QWORD *)&aAll_2[8 * a1];
}

uint64_t RecommendedMode.rawValue.getter(char a1)
{
  return *(_QWORD *)&aAll_2[8 * a1];
}

unint64_t sub_23EC6FA94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FE0);
  v6 = sub_23EC83CB4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  sub_23EC83348();
  while (1)
  {
    sub_23EC70954(v12, (uint64_t)v5);
    v14 = *v5;
    result = sub_23EC5F518(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_23EC8330C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      sub_23EC83408();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *static RecommendedMode.allCases.getter()
{
  return &unk_250F580A8;
}

uint64_t sub_23EC6FC34(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = RecommendedMode.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == RecommendedMode.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23EC83DA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EC6FCBC()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23EC83DF8();
  RecommendedMode.rawValue.getter(v1);
  sub_23EC83864();
  swift_bridgeObjectRelease();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6FD1C()
{
  char *v0;

  RecommendedMode.rawValue.getter(*v0);
  sub_23EC83864();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EC6FD5C()
{
  char *v0;
  char v1;

  v1 = *v0;
  sub_23EC83DF8();
  RecommendedMode.rawValue.getter(v1);
  sub_23EC83864();
  swift_bridgeObjectRelease();
  return sub_23EC83E1C();
}

uint64_t sub_23EC6FDB8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s17HomeWidgetIntents15RecommendedModeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23EC6FDE4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = RecommendedMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23EC6FE0C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = RecommendedMode.id.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23EC6FE34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7848 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC7FA8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC6FEA4()
{
  sub_23EC5746C();
  return sub_23EC8315C();
}

uint64_t sub_23EC6FEE0()
{
  sub_23EC70630();
  return sub_23EC83384();
}

void sub_23EC6FF18(_QWORD *a1@<X8>)
{
  *a1 = &unk_250F580D0;
}

unint64_t _s17HomeWidgetIntents15RecommendedModeO26caseDisplayRepresentationsSDyAC03AppC00G14RepresentationVGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *);
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  char *v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE *v28;
  void (*v29)(char *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v0);
  v40 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23EC8342C();
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v8);
  v33 = sub_23EC83444();
  v9 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FD0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FD8);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v30 = v10;
  v31 = 2 * v12;
  v14 = swift_allocObject();
  v32 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_23EC849C0;
  v15 = (_BYTE *)(v14 + v13);
  v28 = &v15[*(int *)(v10 + 48)];
  *v15 = 0;
  sub_23EC837EC();
  sub_23EC834B0();
  v36 = *MEMORY[0x24BDCD328];
  v29 = *(void (**)(char *))(v4 + 104);
  v26 = v6;
  v16 = v37;
  v29(v6);
  v38 = 0x800000023EC85470;
  sub_23EC83450();
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v17 = v33;
  v27(v39, 1, 1, v33);
  v18 = sub_23EC832F4();
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v35 = v18;
  v34(v40, 1, 1, v18);
  sub_23EC83300();
  v28 = &v15[v12 + *(int *)(v30 + 48)];
  v15[v12] = 1;
  sub_23EC837EC();
  sub_23EC834B0();
  v19 = v26;
  v20 = v29;
  ((void (*)(char *, _QWORD, uint64_t))v29)(v26, v36, v16);
  sub_23EC83450();
  v21 = v39;
  v22 = v17;
  v23 = v27;
  v27(v39, 1, 1, v22);
  v24 = v40;
  v34(v40, 1, 1, v35);
  sub_23EC83300();
  v15[v31] = 2;
  sub_23EC837EC();
  sub_23EC834B0();
  ((void (*)(char *, _QWORD, uint64_t))v20)(v19, v36, v37);
  sub_23EC83450();
  v23(v21, 1, 1, v33);
  v34(v24, 1, 1, v35);
  sub_23EC83300();
  return sub_23EC6FA94(v32);
}

uint64_t _s17HomeWidgetIntents15RecommendedModeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23EC83CCC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_23EC70420()
{
  unint64_t result;

  result = qword_254341338;
  if (!qword_254341338)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341338);
  }
  return result;
}

unint64_t sub_23EC70468()
{
  unint64_t result;

  result = qword_2543412F8;
  if (!qword_2543412F8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_2543412F8);
  }
  return result;
}

unint64_t sub_23EC704B0()
{
  unint64_t result;

  result = qword_254341320;
  if (!qword_254341320)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341320);
  }
  return result;
}

unint64_t sub_23EC704F8()
{
  unint64_t result;

  result = qword_254341340;
  if (!qword_254341340)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341340);
  }
  return result;
}

uint64_t sub_23EC7053C()
{
  return MEMORY[0x24BEE0D78];
}

uint64_t sub_23EC70548()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_23EC70558()
{
  unint64_t result;

  result = qword_254341310;
  if (!qword_254341310)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341310);
  }
  return result;
}

unint64_t sub_23EC705A0()
{
  unint64_t result;

  result = qword_254341318;
  if (!qword_254341318)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341318);
  }
  return result;
}

unint64_t sub_23EC705E8()
{
  unint64_t result;

  result = qword_254341300;
  if (!qword_254341300)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341300);
  }
  return result;
}

unint64_t sub_23EC70630()
{
  unint64_t result;

  result = qword_254341308;
  if (!qword_254341308)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341308);
  }
  return result;
}

uint64_t sub_23EC70674()
{
  sub_23EC5746C();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23EC706B8()
{
  unint64_t result;

  result = qword_254341328;
  if (!qword_254341328)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341328);
  }
  return result;
}

unint64_t sub_23EC70700()
{
  unint64_t result;

  result = qword_254341348;
  if (!qword_254341348)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341348);
  }
  return result;
}

unint64_t sub_23EC70748()
{
  unint64_t result;

  result = qword_254341330;
  if (!qword_254341330)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for RecommendedMode, &type metadata for RecommendedMode);
    atomic_store(result, (unint64_t *)&qword_254341330);
  }
  return result;
}

unint64_t sub_23EC70790()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7FC0;
  if (!qword_256DC7FC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC7FC8);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7FC0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecommendedMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RecommendedMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC708C4 + 4 * byte_23EC851B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23EC708F8 + 4 * byte_23EC851B0[v4]))();
}

uint64_t sub_23EC708F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC70900(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC70908);
  return result;
}

uint64_t sub_23EC70914(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC7091CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23EC70920(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC70928(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC70934(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23EC7093C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecommendedMode()
{
  return &type metadata for RecommendedMode;
}

uint64_t sub_23EC70954(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23EC7099C(void (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t *);
  uint64_t v29;
  uint64_t v30;

  v28 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8038);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for TileElementInfo();
  v29 = *(_QWORD *)(v27 - 8);
  v8 = MEMORY[0x24BDAC7A8](v27);
  v26 = (uint64_t)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v24 = (uint64_t)&v22 - v10;
  if (a3 >> 62)
  {
LABEL_21:
    sub_23EC8333C();
    v11 = sub_23EC83C90();
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v11 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_23EC8333C();
    if (v11)
    {
LABEL_3:
      v12 = MEMORY[0x24BEE4AF8];
      v25 = a3 & 0xC000000000000001;
      v13 = 4;
      v23 = a3;
      while (1)
      {
        v14 = v13 - 4;
        if (v25)
        {
          v15 = MEMORY[0x24265C474](v13 - 4, a3);
          v16 = __OFADD__(v14, 1);
          v17 = v13 - 3;
          if (v16)
            goto LABEL_20;
        }
        else
        {
          v15 = *(_QWORD *)(a3 + 8 * v13);
          swift_unknownObjectRetain();
          v16 = __OFADD__(v14, 1);
          v17 = v13 - 3;
          if (v16)
          {
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
        }
        v30 = v15;
        v28(&v30);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          return v12;
        }
        swift_unknownObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v7, 1, v27) == 1)
        {
          sub_23EC563CC((uint64_t)v7, &qword_256DC8038);
        }
        else
        {
          v18 = v24;
          sub_23EC65E88((uint64_t)v7, v24, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
          sub_23EC65E88(v18, v26, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_23EC5E848(0, *(_QWORD *)(v12 + 16) + 1, 1, v12);
          v20 = *(_QWORD *)(v12 + 16);
          v19 = *(_QWORD *)(v12 + 24);
          if (v20 >= v19 >> 1)
            v12 = sub_23EC5E848(v19 > 1, v20 + 1, 1, v12);
          *(_QWORD *)(v12 + 16) = v20 + 1;
          sub_23EC65E88(v26, v12+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v20, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
          a3 = v23;
        }
        ++v13;
        if (v17 == v11)
        {
          swift_bridgeObjectRelease();
          return v12;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t TileElementInfo.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
}

uint64_t TileElementInfo.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 20));
  sub_23EC8333C();
  return v1;
}

uint64_t TileElementInfo.iconSymbol.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 24));
  sub_23EC8333C();
  return v1;
}

uint64_t TileElementInfo.roomName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 28));
  sub_23EC8333C();
  return v1;
}

uint64_t TileElementInfo.isScene.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 32));
}

uint64_t sub_23EC70D80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = a2;
  v3 = sub_23EC836CC();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC836D8();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8048);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23EC836A8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (int *)type metadata accessor for TileElementInfo();
  v40 = *((_QWORD *)v16 - 1);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  sub_23EC65E44(a1, (uint64_t)v11, &qword_256DC8048);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23EC563CC(v41, &qword_256DC8048);
    sub_23EC563CC((uint64_t)v11, &qword_256DC8048);
    v19 = 1;
    v20 = v42;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_23EC83678();
    v18[*(int *)(type metadata accessor for ElementID() + 20)] = 5;
    v21 = sub_23EC83684();
    v22 = (uint64_t *)&v18[v16[5]];
    *v22 = v21;
    v22[1] = v23;
    sub_23EC8369C();
    sub_23EC836B4();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    v24 = sub_23EC836C0();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    v27 = (uint64_t *)&v18[v16[6]];
    *v27 = v24;
    v27[1] = v26;
    v28 = sub_23EC83690();
    v30 = v29;
    sub_23EC563CC(v41, &qword_256DC8048);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v31 = (uint64_t *)&v18[v16[7]];
    *v31 = v28;
    v31[1] = v30;
    v18[v16[8]] = 0;
    v32 = (uint64_t)v18;
    v33 = v42;
    sub_23EC65E88(v32, v42, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    v19 = 0;
    v20 = v33;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v40 + 56))(v20, v19, 1, v16);
}

uint64_t sub_23EC71050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = a2;
  v3 = sub_23EC836CC();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC836D8();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8050);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23EC835AC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (int *)type metadata accessor for TileElementInfo();
  v40 = *((_QWORD *)v16 - 1);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  sub_23EC65E44(a1, (uint64_t)v11, &qword_256DC8050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23EC563CC(v41, &qword_256DC8050);
    sub_23EC563CC((uint64_t)v11, &qword_256DC8050);
    v19 = 1;
    v20 = v42;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_23EC8357C();
    v18[*(int *)(type metadata accessor for ElementID() + 20)] = 4;
    v21 = sub_23EC83588();
    v22 = (uint64_t *)&v18[v16[5]];
    *v22 = v21;
    v22[1] = v23;
    sub_23EC835A0();
    sub_23EC836B4();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    v24 = sub_23EC836C0();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    v27 = (uint64_t *)&v18[v16[6]];
    *v27 = v24;
    v27[1] = v26;
    v28 = sub_23EC83594();
    v30 = v29;
    sub_23EC563CC(v41, &qword_256DC8050);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v31 = (uint64_t *)&v18[v16[7]];
    *v31 = v28;
    v31[1] = v30;
    v18[v16[8]] = 0;
    v32 = (uint64_t)v18;
    v33 = v42;
    sub_23EC65E88(v32, v42, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    v19 = 0;
    v20 = v33;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v40 + 56))(v20, v19, 1, v16);
}

uint64_t sub_23EC71320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = a2;
  v3 = sub_23EC836CC();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC836D8();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8058);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23EC835E8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (int *)type metadata accessor for TileElementInfo();
  v40 = *((_QWORD *)v16 - 1);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = a1;
  sub_23EC65E44(a1, (uint64_t)v11, &qword_256DC8058);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23EC563CC(v41, &qword_256DC8058);
    sub_23EC563CC((uint64_t)v11, &qword_256DC8058);
    v19 = 1;
    v20 = v42;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_23EC835B8();
    v18[*(int *)(type metadata accessor for ElementID() + 20)] = 0;
    v21 = sub_23EC835C4();
    v22 = (uint64_t *)&v18[v16[5]];
    *v22 = v21;
    v22[1] = v23;
    sub_23EC835DC();
    sub_23EC836B4();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    v24 = sub_23EC836C0();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    v27 = (uint64_t *)&v18[v16[6]];
    *v27 = v24;
    v27[1] = v26;
    v28 = sub_23EC835D0();
    v30 = v29;
    sub_23EC563CC(v41, &qword_256DC8058);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v31 = (uint64_t *)&v18[v16[7]];
    *v31 = v28;
    v31[1] = v30;
    v18[v16[8]] = 0;
    v32 = (uint64_t)v18;
    v33 = v42;
    sub_23EC65E88(v32, v42, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    v19 = 0;
    v20 = v33;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v40 + 56))(v20, v19, 1, v16);
}

uint64_t sub_23EC715EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v31;
  uint64_t v32;

  v32 = a2;
  v7 = (int *)type metadata accessor for TileElementInfo();
  v8 = *((_QWORD *)v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_uniqueIdentifier);
  sub_23EC8348C();

  v10[*(int *)(type metadata accessor for ElementID() + 20)] = 3;
  v12 = objc_msgSend(a1, sel_configuredName);
  v13 = sub_23EC83840();
  v15 = v14;

  swift_bridgeObjectRelease();
  v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v16 = v13 & 0xFFFFFFFFFFFFLL;
  if (v16)
  {
    v17 = objc_msgSend(a1, sel_configuredName);
  }
  else
  {
    v18 = objc_msgSend(a1, sel_category);
    v19 = objc_msgSend(v18, sel_categoryType);

    if (!v19)
    {
      sub_23EC83840();
      v19 = (id)sub_23EC83834();
      swift_bridgeObjectRelease();
    }
    v17 = objc_msgSend((id)objc_opt_self(), sel_hf_userFriendlyLocalizedCapitalizedDescription_, v19);

  }
  v20 = sub_23EC83840();
  v22 = v21;

  v23 = (uint64_t *)&v10[v7[5]];
  *v23 = v20;
  v23[1] = v22;
  v24 = sub_23EC71824(a1);
  v25 = (uint64_t *)&v10[v7[7]];
  *v25 = v24;
  v25[1] = v26;

  v27 = v32;
  if (!a3)
    v27 = 0;
  v28 = 0xE000000000000000;
  if (a3)
    v28 = a3;
  v29 = &v10[v7[6]];
  *(_QWORD *)v29 = v27;
  *((_QWORD *)v29 + 1) = v28;
  v10[v7[8]] = 0;
  sub_23EC65E88((uint64_t)v10, a4, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(v8 + 56))(a4, 0, 1, v7);
}

uint64_t sub_23EC71824(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  char **v8;
  char **v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  char **v16;
  char **v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = objc_msgSend(a1, sel_components);
  sub_23EC6AFC8(0, &qword_256DC8060);
  v2 = sub_23EC83918();

  if (v2 >> 62)
  {
    sub_23EC8333C();
    result = sub_23EC83C90();
    v3 = result;
    if (result)
      goto LABEL_3;
LABEL_19:
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_20;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = sub_23EC8333C();
  if (!v3)
    goto LABEL_19;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  v5 = 0;
  v6 = v2 & 0xC000000000000001;
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v8 = &off_250F5A000;
  v9 = &off_250F5A000;
  do
  {
    if (v6)
      v10 = (id)MEMORY[0x24265C474](v5, v2);
    else
      v10 = *(id *)(v2 + 8 * v5 + 32);
    v11 = v10;
    v12 = objc_msgSend(v10, v8[47]);
    if (v12
      && (v13 = v12, v14 = objc_msgSend(v12, v9[48]), v13, v14)
      && (v15 = objc_msgSend(v14, sel_room), v14, v15))
    {
      v16 = v8;
      v17 = v9;
      v18 = objc_msgSend(v15, sel_name);

      v19 = sub_23EC83840();
      v21 = v20;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_23EC5EA68(0, v7[2] + 1, 1, v7);
      v23 = v7[2];
      v22 = v7[3];
      if (v23 >= v22 >> 1)
        v7 = sub_23EC5EA68((_QWORD *)(v22 > 1), v23 + 1, 1, v7);
      v7[2] = v23 + 1;
      v24 = &v7[2 * v23];
      v24[4] = v19;
      v24[5] = v21;
      v9 = v17;
      v8 = v16;
      v6 = v2 & 0xC000000000000001;
    }
    else
    {

    }
    ++v5;
  }
  while (v3 != v5);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v25 = sub_23EC76B68((uint64_t)v7);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v25 + 16) == 1)
  {
    v26 = sub_23EC5CABC(v25);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v26;
}

uint64_t sub_23EC71AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8040);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23EC8366C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for TileElementInfo();
  v12 = *((_QWORD *)v11 - 1);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EC65E44(a1, (uint64_t)v6, &qword_256DC8040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23EC563CC(a1, &qword_256DC8040);
    sub_23EC563CC((uint64_t)v6, &qword_256DC8040);
    v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_23EC83648();
    v14[*(int *)(type metadata accessor for ElementID() + 20)] = 2;
    v16 = sub_23EC83654();
    v17 = (uint64_t *)&v14[v11[5]];
    *v17 = v16;
    v17[1] = v18;
    v19 = sub_23EC8363C();
    v20 = (uint64_t *)&v14[v11[6]];
    *v20 = v19;
    v20[1] = v21;
    v22 = sub_23EC83660();
    v24 = v23;
    sub_23EC563CC(a1, &qword_256DC8040);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v25 = (uint64_t *)&v14[v11[7]];
    *v25 = v22;
    v25[1] = v24;
    v14[v11[8]] = 0;
    sub_23EC65E88((uint64_t)v14, a2, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
    v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v12 + 56))(a2, v15, 1, v11);
}

void sub_23EC71CC0(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t *v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;

  v4 = objc_msgSend(a1, sel_uniqueIdentifier);
  sub_23EC8348C();

  *(_BYTE *)(a2 + *(int *)(type metadata accessor for ElementID() + 20)) = 1;
  v5 = objc_msgSend(a1, sel_name);
  v6 = sub_23EC83840();
  v8 = v7;

  v9 = (int *)type metadata accessor for TileElementInfo();
  v10 = (uint64_t *)(a2 + v9[5]);
  *v10 = v6;
  v10[1] = v8;
  v11 = (_QWORD *)(a2 + v9[7]);
  *v11 = 0;
  v11[1] = 0;
  v12 = objc_msgSend(a1, sel_hf_iconDescriptor);
  v13 = objc_msgSend(v12, sel_imageIdentifier);

  v14 = sub_23EC83840();
  v16 = v15;

  v17 = (uint64_t *)(a2 + v9[6]);
  *v17 = v14;
  v17[1] = v16;
  *(_BYTE *)(a2 + v9[8]) = 1;
}

uint64_t sub_23EC71DE4@<X0>(void **a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;

  v97 = a4;
  v93 = a3;
  v98 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8040);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8048);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8050);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8058);
  MEMORY[0x24BDAC7A8](v14);
  v94 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23EC834A4();
  v95 = *(_QWORD *)(v16 - 8);
  v96 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v91 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v91 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v91 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v91 - v29;
  v31 = *a1;
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v32 = objc_msgSend(v31, sel_uniqueIdentifier);
    sub_23EC8348C();

    v33 = v98[4];
    if (*(_QWORD *)(v33 + 16) && (v34 = sub_23EC5F41C((uint64_t)v30), (v35 & 1) != 0))
    {
      v36 = v34;
      v37 = *(_QWORD *)(v33 + 56);
      v38 = sub_23EC835E8();
      v39 = *(_QWORD *)(v38 - 8);
      v40 = v37 + *(_QWORD *)(v39 + 72) * v36;
      v41 = (uint64_t)v94;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v94, v40, v38);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v41, 0, 1, v38);
    }
    else
    {
      v42 = sub_23EC835E8();
      v41 = (uint64_t)v94;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v94, 1, 1, v42);
    }
    v43 = v97;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v30, v96);
    return sub_23EC71320(v41, v43);
  }
  else
  {
    v91 = v19;
    v92 = v7;
    v45 = (uint64_t)v22;
    v94 = v13;
    v46 = v98;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      v47 = objc_msgSend(v31, sel_uniqueIdentifier);
      sub_23EC8348C();

      v48 = v46[3];
      if (*(_QWORD *)(v48 + 16) && (v49 = sub_23EC5F41C((uint64_t)v28), (v50 & 1) != 0))
      {
        v51 = v49;
        v52 = *(_QWORD *)(v48 + 56);
        v53 = sub_23EC835AC();
        v54 = *(_QWORD *)(v53 - 8);
        v55 = v52 + *(_QWORD *)(v54 + 72) * v51;
        v56 = (uint64_t)v94;
        (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v94, v55, v53);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v56, 0, 1, v53);
      }
      else
      {
        v57 = sub_23EC835AC();
        v56 = (uint64_t)v94;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v94, 1, 1, v57);
      }
      v58 = v97;
      (*(void (**)(char *, uint64_t))(v95 + 8))(v28, v96);
      return sub_23EC71050(v56, v58);
    }
    else
    {
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        v59 = objc_msgSend(v31, sel_uniqueIdentifier);
        sub_23EC8348C();

        v60 = *v46;
        if (*(_QWORD *)(*v46 + 16) && (v61 = sub_23EC5F41C((uint64_t)v25), (v62 & 1) != 0))
        {
          v63 = v61;
          v64 = *(_QWORD *)(v60 + 56);
          v65 = sub_23EC836A8();
          v66 = *(_QWORD *)(v65 - 8);
          (*(void (**)(char *, unint64_t, uint64_t))(v66 + 16))(v10, v64 + *(_QWORD *)(v66 + 72) * v63, v65);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v10, 0, 1, v65);
        }
        else
        {
          v67 = sub_23EC836A8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v10, 1, 1, v67);
        }
        v68 = v97;
        (*(void (**)(char *, uint64_t))(v95 + 8))(v25, v96);
        return sub_23EC70D80((uint64_t)v10, v68);
      }
      else
      {
        objc_opt_self();
        if (swift_dynamicCastObjCClass())
        {
          v69 = objc_msgSend(v31, sel_uniqueIdentifier);
          sub_23EC8348C();

          v70 = v46[6];
          if (*(_QWORD *)(v70 + 16) && (v71 = sub_23EC5F41C(v45), (v72 & 1) != 0))
          {
            v73 = v71;
            v74 = *(_QWORD *)(v70 + 56);
            v75 = sub_23EC8366C();
            v76 = *(_QWORD *)(v75 - 8);
            v77 = v74 + *(_QWORD *)(v76 + 72) * v73;
            v78 = (uint64_t)v92;
            (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v92, v77, v75);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v76 + 56))(v78, 0, 1, v75);
          }
          else
          {
            v79 = sub_23EC8366C();
            v78 = (uint64_t)v92;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56))(v92, 1, 1, v79);
          }
          v80 = v97;
          (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v45, v96);
          return sub_23EC71AC0(v78, v80);
        }
        else
        {
          objc_opt_self();
          if (swift_dynamicCastObjCClass())
          {
            objc_opt_self();
            v81 = (void *)swift_dynamicCastObjCClassUnconditional();
            v82 = objc_msgSend((id)swift_unknownObjectRetain(), sel_uniqueIdentifier);
            v83 = (uint64_t)v91;
            sub_23EC8348C();

            v84 = sub_23EC7AB70(v83);
            v86 = v85;
            (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v83, v96);
            return sub_23EC715EC(v81, v84, v86, v97);
          }
          else
          {
            objc_opt_self();
            if (swift_dynamicCastObjCClass())
            {
              objc_opt_self();
              v87 = (void *)swift_dynamicCastObjCClassUnconditional();
              swift_unknownObjectRetain();
              v88 = v97;
              sub_23EC71CC0(v87, v97);
              v89 = type metadata accessor for TileElementInfo();
              return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88, 0, 1, v89);
            }
            else
            {
              v90 = type metadata accessor for TileElementInfo();
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v97, 1, 1, v90);
            }
          }
        }
      }
    }
  }
}

uint64_t TileElementInfo.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  v1 = type metadata accessor for TileElementInfo();
  sub_23EC8333C();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  sub_23EC8333C();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 28) + 8))
  {
    sub_23EC83E10();
    sub_23EC8333C();
    sub_23EC83864();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23EC83E10();
  }
  return sub_23EC83E10();
}

uint64_t sub_23EC72638(char a1)
{
  return qword_23EC85798[a1];
}

BOOL sub_23EC72658(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23EC7266C()
{
  sub_23EC83DF8();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC726B0()
{
  return sub_23EC83E04();
}

uint64_t sub_23EC726D8()
{
  sub_23EC83DF8();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC72718()
{
  char *v0;

  return sub_23EC72638(*v0);
}

uint64_t sub_23EC72720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC76BFC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23EC72744(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23EC72750()
{
  sub_23EC75448();
  return sub_23EC83E40();
}

uint64_t sub_23EC72778()
{
  sub_23EC75448();
  return sub_23EC83E4C();
}

uint64_t TileElementInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7FE8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC75448();
  sub_23EC83E34();
  v8[15] = 0;
  type metadata accessor for ElementID();
  sub_23EC65F10(&qword_256DC7FF8, (uint64_t (*)(uint64_t))type metadata accessor for ElementID, (uint64_t)&protocol conformance descriptor for ElementID);
  sub_23EC83D5C();
  if (!v1)
  {
    type metadata accessor for TileElementInfo();
    v8[14] = 1;
    sub_23EC83D44();
    v8[13] = 2;
    sub_23EC83D44();
    v8[12] = 3;
    sub_23EC83D38();
    v8[11] = 4;
    sub_23EC83D50();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TileElementInfo.hashValue.getter()
{
  sub_23EC83DF8();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t TileElementInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v29 = a2;
  v3 = type metadata accessor for ElementID();
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8000);
  v5 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for TileElementInfo();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC75448();
  v31 = v7;
  v11 = (uint64_t)v33;
  sub_23EC83E28();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v12 = v5;
  v33 = a1;
  v13 = (uint64_t)v10;
  v38 = 0;
  sub_23EC65F10(&qword_256DC8008, (uint64_t (*)(uint64_t))type metadata accessor for ElementID, (uint64_t)&protocol conformance descriptor for ElementID);
  v15 = (uint64_t)v30;
  v14 = v31;
  v16 = v32;
  sub_23EC83D14();
  sub_23EC65E88(v15, v13, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  v37 = 1;
  v17 = sub_23EC83CFC();
  v18 = (uint64_t *)(v13 + v8[5]);
  *v18 = v17;
  v18[1] = v19;
  v36 = 2;
  v20 = sub_23EC83CFC();
  v21 = (uint64_t *)(v13 + v8[6]);
  *v21 = v20;
  v21[1] = v22;
  v35 = 3;
  v23 = sub_23EC83CF0();
  v24 = (uint64_t *)(v13 + v8[7]);
  *v24 = v23;
  v24[1] = v25;
  v34 = 4;
  v26 = sub_23EC83D08();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  *(_BYTE *)(v13 + v8[8]) = v26 & 1;
  sub_23EC6522C(v13, v29, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  return sub_23EC65E08(v13, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t sub_23EC72D5C()
{
  sub_23EC83DF8();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC72D9C()
{
  sub_23EC83DF8();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC72DD8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TileElementInfo.init(from:)(a1, a2);
}

uint64_t sub_23EC72DEC(_QWORD *a1)
{
  return TileElementInfo.encode(to:)(a1);
}

uint64_t sub_23EC72E00(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    sub_23EC8333C();
    v8 = a2;
    v9 = sub_23EC83B7C();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23EC6AFC8(0, &qword_256DC7D90);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_23EC83B70();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_23EC734A4(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_23EC73698();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_23EC73F7C((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    sub_23EC8333C();
    v11 = sub_23EC83AC8();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_23EC6AFC8(0, &qword_256DC7D90);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_23EC83AD4();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_23EC83AD4();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_23EC73FFC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23EC7309C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23EC83DF8();
  sub_23EC8333C();
  sub_23EC83864();
  v8 = sub_23EC83E1C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23EC83DA4() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      sub_23EC8333C();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23EC83DA4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  sub_23EC8333C();
  sub_23EC74180(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23EC73248(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23EC834A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, v11, MEMORY[0x24BDCEA88]);
  sub_23EC8333C();
  v31 = a2;
  v12 = sub_23EC837C8();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23EC65F10(&qword_256DC7C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v21 = sub_23EC837E0();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23EC74318((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23EC734A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_256DC8078);
    v2 = sub_23EC83BAC();
    v14 = v2;
    sub_23EC83B64();
    if (sub_23EC83B88())
    {
      sub_23EC6AFC8(0, &qword_256DC7D90);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_23EC73698();
          v2 = v14;
        }
        result = sub_23EC83AC8();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23EC83B88());
    }
    sub_23EC83408();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_23EC73698()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256DC8078);
  v3 = sub_23EC83BA0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = sub_23EC83348();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                sub_23EC83408();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_23EC83AC8();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = sub_23EC83408();
  *v1 = v4;
  return result;
}

uint64_t sub_23EC73934()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8068);
  v3 = sub_23EC83BA0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = sub_23EC83348();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                sub_23EC83408();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_23EC83DF8();
      sub_23EC83864();
      result = sub_23EC83E1C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = sub_23EC83408();
  *v1 = v4;
  return result;
}

uint64_t sub_23EC73C10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23EC834A4();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8070);
  v6 = sub_23EC83BA0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = sub_23EC83348();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
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
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                sub_23EC83408();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
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
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      result = sub_23EC837C8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = sub_23EC83408();
  *v1 = v7;
  return result;
}

unint64_t sub_23EC73F7C(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_23EC83AC8();
  result = sub_23EC83B58();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_23EC73FFC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23EC73698();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23EC7451C();
      goto LABEL_14;
    }
    sub_23EC74A98();
  }
  v8 = *v3;
  v9 = sub_23EC83AC8();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_23EC6AFC8(0, &qword_256DC7D90);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_23EC83AD4();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_23EC83DB0();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_23EC83AD4();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_23EC74180(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23EC73934();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23EC746C4();
      goto LABEL_22;
    }
    sub_23EC74D10();
  }
  v11 = *v4;
  sub_23EC83DF8();
  sub_23EC83864();
  result = sub_23EC83E1C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23EC83DA4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23EC83DB0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23EC83DA4();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_23EC74318(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23EC834A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23EC73C10();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23EC74874();
      goto LABEL_12;
    }
    sub_23EC74FBC();
  }
  v12 = *v3;
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v13 = sub_23EC837C8();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23EC65F10(&qword_256DC7C78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v18 = sub_23EC837E0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23EC83DB0();
  __break(1u);
  return result;
}

id sub_23EC7451C()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256DC8078);
  v2 = *v0;
  v3 = sub_23EC83B94();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)sub_23EC83408();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23EC746C4()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8068);
  v2 = *v0;
  v3 = sub_23EC83B94();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)sub_23EC83408();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)sub_23EC8333C();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23EC74874()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23EC834A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8070);
  v6 = *v0;
  v7 = sub_23EC83B94();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)sub_23EC83408();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)sub_23EC83408();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23EC74A98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_256DC8078);
  v3 = sub_23EC83BA0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = sub_23EC83408();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = sub_23EC83348();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_23EC83AC8();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23EC74D10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8068);
  v3 = sub_23EC83BA0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = sub_23EC83408();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = sub_23EC83348();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23EC83DF8();
    sub_23EC8333C();
    sub_23EC83864();
    result = sub_23EC83E1C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23EC74FBC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23EC834A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8070);
  v7 = sub_23EC83BA0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = sub_23EC83408();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = sub_23EC83348();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_23EC837C8();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  char v25;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
    goto LABEL_22;
  v4 = type metadata accessor for ElementID();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    goto LABEL_22;
  v5 = (int *)type metadata accessor for TileElementInfo();
  v6 = v5[5];
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 != *v9 || v8 != v9[1])
  {
    v11 = sub_23EC83DA4();
    v12 = 0;
    if ((v11 & 1) == 0)
      return v12 & 1;
  }
  v13 = v5[6];
  v14 = *(_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(a1 + v13 + 8);
  v16 = (_QWORD *)(a2 + v13);
  if (v14 != *v16 || v15 != v16[1])
  {
    v18 = sub_23EC83DA4();
    v12 = 0;
    if ((v18 & 1) == 0)
      return v12 & 1;
  }
  v19 = v5[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = *(_QWORD *)(a1 + v19 + 8);
  v22 = (_QWORD *)(a2 + v19);
  v23 = v22[1];
  if (!v21)
  {
    if (!v23)
    {
LABEL_24:
      v12 = *(_BYTE *)(a1 + v5[8]) ^ *(_BYTE *)(a2 + v5[8]) ^ 1;
      return v12 & 1;
    }
    goto LABEL_22;
  }
  if (!v23)
  {
LABEL_22:
    v12 = 0;
    return v12 & 1;
  }
  if (*v20 == *v22 && v21 == v23)
    goto LABEL_24;
  v25 = sub_23EC83DA4();
  v12 = 0;
  if ((v25 & 1) != 0)
    goto LABEL_24;
  return v12 & 1;
}

uint64_t type metadata accessor for TileElementInfo()
{
  uint64_t result;

  result = qword_254341350;
  if (!qword_254341350)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23EC75448()
{
  unint64_t result;

  result = qword_256DC7FF0;
  if (!qword_256DC7FF0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85744, &type metadata for TileElementInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC7FF0);
  }
  return result;
}

uint64_t sub_23EC7548C()
{
  return sub_23EC65F10(&qword_256DC8010, (uint64_t (*)(uint64_t))type metadata accessor for TileElementInfo, (uint64_t)&protocol conformance descriptor for TileElementInfo);
}

_QWORD *initializeBufferWithCopyOfBuffer for TileElementInfo(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    sub_23EC83348();
  }
  else
  {
    v7 = sub_23EC834A4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for ElementID();
    *((_BYTE *)a1 + *(int *)(v8 + 20)) = *((_BYTE *)a2 + *(int *)(v8 + 20));
    v9 = a3[5];
    v10 = a3[6];
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (_QWORD *)((char *)a1 + v10);
    v15 = (_QWORD *)((char *)a2 + v10);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[7];
    v18 = a3[8];
    v19 = (_QWORD *)((char *)a1 + v17);
    v20 = (_QWORD *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    *((_BYTE *)a1 + v18) = *((_BYTE *)a2 + v18);
    sub_23EC8333C();
    sub_23EC8333C();
    sub_23EC8333C();
  }
  return a1;
}

uint64_t destroy for TileElementInfo(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = a3[5];
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(a1 + v9);
  v14 = (_QWORD *)(a2 + v9);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[7];
  v17 = a3[8];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  sub_23EC8333C();
  sub_23EC8333C();
  sub_23EC8333C();
  return a1;
}

uint64_t assignWithCopy for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for ElementID();
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for TileElementInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC7590C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for ElementID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for TileElementInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC75998(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for ElementID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23EC75A14()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ElementID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TileElementInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TileElementInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC75B78 + 4 * byte_23EC854F5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23EC75BAC + 4 * byte_23EC854F0[v4]))();
}

uint64_t sub_23EC75BAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC75BB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC75BBCLL);
  return result;
}

uint64_t sub_23EC75BC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC75BD0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23EC75BD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC75BDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TileElementInfo.CodingKeys()
{
  return &type metadata for TileElementInfo.CodingKeys;
}

unint64_t sub_23EC75BFC()
{
  unint64_t result;

  result = qword_256DC8018;
  if (!qword_256DC8018)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC8571C, &type metadata for TileElementInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8018);
  }
  return result;
}

unint64_t sub_23EC75C44()
{
  unint64_t result;

  result = qword_256DC8020;
  if (!qword_256DC8020)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC8568C, &type metadata for TileElementInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8020);
  }
  return result;
}

unint64_t sub_23EC75C8C()
{
  unint64_t result;

  result = qword_256DC8028;
  if (!qword_256DC8028)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC856B4, &type metadata for TileElementInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8028);
  }
  return result;
}

uint64_t sub_23EC75CD0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void (*v20)(char *, uint64_t);
  id v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = v3;
  v26 = a3;
  v7 = sub_23EC834A4();
  v33 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v25 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - v10;
  v34 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_23:
    v12 = sub_23EC83C90();
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
    {
LABEL_3:
      v24 = v4;
      v4 = 0;
      v31 = a1 & 0xFFFFFFFFFFFFFF8;
      v32 = a1 & 0xC000000000000001;
      v29 = a2;
      v30 = a1 + 32;
      v27 = v12;
      v28 = a1;
      while (1)
      {
        if (v32)
        {
          v13 = (void *)MEMORY[0x24265C474](v4, a1);
          v14 = __OFADD__(v4++, 1);
          if (v14)
          {
LABEL_20:
            __break(1u);
            return v34;
          }
        }
        else
        {
          if (v4 >= *(_QWORD *)(v31 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          v13 = *(void **)(v30 + 8 * v4);
          swift_unknownObjectRetain();
          v14 = __OFADD__(v4++, 1);
          if (v14)
            goto LABEL_20;
        }
        v15 = *(_QWORD *)(a2 + 16);
        if (v15)
        {
          v16 = *(_QWORD *)(type metadata accessor for ElementID() - 8);
          v17 = a2 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
          v18 = *(_QWORD *)(v16 + 72);
          sub_23EC8333C();
          while (1)
          {
            v19 = objc_msgSend(v13, sel_uniqueIdentifier, v24);
            sub_23EC8348C();

            LOBYTE(v19) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
            v20 = *(void (**)(char *, uint64_t))(v33 + 8);
            v20(v11, v7);
            if ((v19 & 1) != 0)
              break;
            v17 += v18;
            if (!--v15)
            {
              swift_unknownObjectRelease();
              a2 = v29;
              swift_bridgeObjectRelease();
              goto LABEL_17;
            }
          }
          a2 = v29;
          swift_bridgeObjectRelease();
          v21 = objc_msgSend(v13, sel_uniqueIdentifier);
          v22 = v25;
          sub_23EC8348C();

          LOBYTE(v21) = sub_23EC73248((uint64_t)v11, v22);
          v20(v11, v7);
          if ((v21 & 1) != 0)
          {
            sub_23EC83C0C();
            sub_23EC83C48();
            a2 = v29;
            sub_23EC83C54();
            sub_23EC83C24();
          }
          else
          {
            swift_unknownObjectRelease();
          }
LABEL_17:
          v12 = v27;
          a1 = v28;
        }
        else
        {
          swift_unknownObjectRelease();
        }
        if (v4 == v12)
          return v34;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23EC75F90(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[12] = a1;
  v2[13] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7988);
  v2[14] = swift_task_alloc();
  v3 = sub_23EC834A4();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v4 = sub_23EC83570();
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EC7603C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 168) = sub_23EC8399C();
  *(_QWORD *)(v0 + 176) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC760A8()
{
  sub_23EC83408();
  return swift_task_switch();
}

uint64_t sub_23EC760E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC76144()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23EC83408();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_23EC761A8;
  return sub_23EC548B8();
}

uint64_t sub_23EC761A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 200) = a1;
  *(_QWORD *)(v3 + 208) = v1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC76248()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t result;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(*(_QWORD *)(v0 + 96) + 16))
    goto LABEL_12;
  v1 = *(void **)(v0 + 104);
  v2 = v1;
  if (v1)
  {
LABEL_9:
    *(_QWORD *)(v0 + 216) = v2;
    *(_QWORD *)(v0 + 224) = sub_23EC83510();
    v6 = v1;
    *(_QWORD *)(v0 + 232) = sub_23EC83990();
    sub_23EC83984();
    return swift_task_switch();
  }
  v3 = sub_23EC807A0(0);
  if (v3 >> 62)
  {
    result = sub_23EC83C90();
    if (result)
      goto LABEL_5;
    goto LABEL_11;
  }
  result = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!result)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    if (qword_256DC7808 != -1)
      swift_once();
    v7 = sub_23EC83780();
    __swift_project_value_buffer(v7, (uint64_t)qword_256DC8528);
    v8 = sub_23EC83768();
    v9 = sub_23EC83A44();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v12 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v0 + 72) = sub_23EC79A04(0xD000000000000012, 0x800000023EC87240, &v12);
      sub_23EC83AF8();
      _os_log_impl(&dword_23EC52000, v8, v9, "%s no elements to build", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v11, -1, -1);
      MEMORY[0x24265CB1C](v10, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
LABEL_5:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x24265C474](0, v3);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v3 + 32);
LABEL_8:
    v2 = v5;
    swift_bridgeObjectRelease();
    v1 = *(void **)(v0 + 104);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC764F8()
{
  uint64_t v0;

  sub_23EC83408();
  *(_QWORD *)(v0 + 240) = sub_23EC83504();
  return swift_task_switch();
}

uint64_t sub_23EC7653C()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(*(id *)(v0 + 216), sel_uniqueIdentifier);
  sub_23EC8348C();

  *(_QWORD *)(v0 + 248) = sub_23EC83990();
  sub_23EC83984();
  return swift_task_switch();
}

uint64_t sub_23EC765D0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 240);
  sub_23EC83408();
  *(_QWORD *)(v0 + 256) = sub_23EC834F8();

  return swift_task_switch();
}

uint64_t sub_23EC76618()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33[2];

  if (*(_QWORD *)(*(_QWORD *)(v0 + 256) + 16) && (v1 = sub_23EC5F41C(*(_QWORD *)(v0 + 136)), (v2 & 1) != 0))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 16))(*(_QWORD *)(v0 + 112), *(_QWORD *)(*(_QWORD *)(v0 + 256) + 56) + *(_QWORD *)(*(_QWORD *)(v0 + 152) + 72) * v1, *(_QWORD *)(v0 + 144));
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 136);
  v9 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 120);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v9, v3, 1, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
  {
    sub_23EC563CC(*(_QWORD *)(v0 + 112), &qword_256DC7988);
    if (qword_256DC7808 != -1)
      swift_once();
    v10 = *(void **)(v0 + 216);
    v11 = sub_23EC83780();
    __swift_project_value_buffer(v11, (uint64_t)qword_256DC8528);
    v12 = v10;
    v13 = sub_23EC83768();
    v14 = sub_23EC83A44();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(void **)(v0 + 216);
    if (v15)
    {
      v17 = swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v33[0] = v31;
      *(_DWORD *)v17 = 136315394;
      *(_QWORD *)(v0 + 80) = sub_23EC79A04(0xD000000000000012, 0x800000023EC87240, v33);
      sub_23EC83AF8();
      *(_WORD *)(v17 + 12) = 2112;
      *(_QWORD *)(v0 + 88) = v16;
      v18 = v16;
      sub_23EC83AF8();
      *v30 = v16;

      _os_log_impl(&dword_23EC52000, v13, v14, "%s home=%@ not found in DataModel StateSnapshot", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7940);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v30, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v31, -1, -1);
      MEMORY[0x24265CB1C](v17, -1, -1);

    }
    else
    {

    }
    v28 = *(void **)(v0 + 216);

    v27 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v19 = *(void **)(v0 + 216);
    v32 = *(void **)(v0 + 200);
    v21 = *(_QWORD *)(v0 + 152);
    v20 = *(_QWORD *)(v0 + 160);
    v22 = *(_QWORD *)(v0 + 144);
    v23 = *(_QWORD *)(v0 + 96);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 32))(v20, *(_QWORD *)(v0 + 112), v22);
    sub_23EC7A9F0((uint64_t *)(v0 + 16));
    v33[0] = MEMORY[0x24BEE4B08];
    v24 = sub_23EC699D4();
    sub_23EC8333C();
    v25 = sub_23EC75CD0(v24, v23, (uint64_t)v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = swift_task_alloc();
    *(_QWORD *)(v26 + 16) = v0 + 16;
    *(_QWORD *)(v26 + 24) = v20;
    v27 = sub_23EC7099C((void (*)(uint64_t *))sub_23EC76DF8, v26, v25);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    swift_bridgeObjectRelease();
    sub_23EC76E10(v0 + 16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v27);
}

uint64_t sub_23EC76A10(unint64_t a1)
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
    sub_23EC8333C();
    sub_23EC83C90();
    swift_bridgeObjectRelease();
  }
  sub_23EC6AFC8(0, &qword_256DC7D90);
  sub_23EC76E8C();
  result = sub_23EC839E4();
  v10 = result;
  if (v2)
  {
    sub_23EC8333C();
    v4 = sub_23EC83C90();
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
        v6 = (void *)MEMORY[0x24265C474](i, a1);
        sub_23EC72E00(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_23EC72E00(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC76B68(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23EC839E4();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      sub_23EC8333C();
      sub_23EC7309C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23EC76BFC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x626D79536E6F6369 && a2 == 0xEA00000000006C6FLL || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E6563537369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23EC76DF8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23EC71DE4(a1, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_23EC76E10(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_23EC76E8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7D98;
  if (!qword_256DC7D98)
  {
    v1 = sub_23EC6AFC8(255, &qword_256DC7D90);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7D98);
  }
  return result;
}

uint64_t dispatch thunk of TileEntity.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TileEntity.homeID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TileEntity.item.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static TileEntity.create(id:homeID:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t sub_23EC76F04()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for HomeItemInfoCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HomeItemInfoCollection);
}

uint64_t sub_23EC76F18(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_23EC83A08();
  if (!v20)
    return sub_23EC83948();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_23EC83C6C();
  v34 = sub_23EC83C78();
  sub_23EC83C30();
  v37 = v8;
  result = sub_23EC839FC();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_23EC83A20();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        sub_23EC83408();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_23EC83C60();
      result = sub_23EC83A14();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23EC77208()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23EC83DF8();
  sub_23EC83E04();
  if (v1 > 1)
    sub_23EC83864();
  return sub_23EC83E1C();
}

uint64_t sub_23EC77284()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 1uLL)
    return sub_23EC83E04();
  sub_23EC83E04();
  return sub_23EC83864();
}

uint64_t sub_23EC772F8()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23EC83DF8();
  sub_23EC83E04();
  if (v1 > 1)
    sub_23EC83864();
  return sub_23EC83E1C();
}

BOOL sub_23EC77370(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      v2 = 2;
    }
    else
    {
      if (v3 >= 2)
      {
        sub_23EC65B48();
        return sub_23EC83B28() == -1;
      }
      v2 = 1;
    }
  }
  v4 = 1;
  if (v3 == 1)
    v4 = 2;
  return v3 && v4 > v2;
}

BOOL sub_23EC77410(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    if (v3 == 1)
    {
      v3 = 2;
    }
    else
    {
      if (v2 >= 2)
      {
        sub_23EC65B48();
        v6 = sub_23EC83B28() == -1;
        return !v6;
      }
      v3 = 1;
    }
  }
  v4 = 1;
  if (v2 == 1)
    v4 = 2;
  if (v2)
    v5 = v4 > v3;
  else
    v5 = 0;
  v6 = v5;
  return !v6;
}

BOOL sub_23EC774B4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      v2 = 2;
    }
    else
    {
      if (v3 >= 2)
      {
        sub_23EC65B48();
        v6 = sub_23EC83B28() == -1;
        return !v6;
      }
      v2 = 1;
    }
  }
  v4 = 1;
  if (v3 == 1)
    v4 = 2;
  if (v3)
    v5 = v4 > v2;
  else
    v5 = 0;
  v6 = v5;
  return !v6;
}

BOOL sub_23EC77558(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    if (v3 == 1)
    {
      v3 = 2;
    }
    else
    {
      if (v2 >= 2)
      {
        sub_23EC65B48();
        return sub_23EC83B28() == -1;
      }
      v3 = 1;
    }
  }
  v4 = 1;
  if (v2 == 1)
    v4 = 2;
  return v2 && v4 > v3;
}

uint64_t sub_23EC775F8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (!v3)
    return !v4;
  if (v3 == 1)
    return v4 == 1;
  if (v4 < 2)
    return 0;
  if (*a1 != *a2 || v3 != v4)
    return sub_23EC83DA4();
  return 1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24265CA14](a1, v6, a5);
}

uint64_t sub_23EC77684()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23EC77690(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8) >= 2uLL)
    swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23EC776C0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (v4 >= 2)
  {
    *a1 = *a2;
    a1[1] = v4;
    sub_23EC8333C();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  a1[2] = a2[2];
  sub_23EC8333C();
  return a1;
}

_QWORD *sub_23EC77714(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] >= 2uLL)
  {
    if (v4 >= 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_23EC8333C();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_23EC777C0((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 < 2)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  sub_23EC8333C();
LABEL_8:
  a1[2] = a2[2];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23EC777C0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *sub_23EC77808(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  if (a1[1] >= 2uLL)
  {
    v4 = a2[1];
    if (v4 >= 2)
    {
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_23EC777C0((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23EC77874(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23EC778BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for HomeItemInfoCollection.HomeCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HomeItemInfoCollection.HomeCollection);
}

unint64_t destroy for CollectionType(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s17HomeWidgetIntents14CollectionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    sub_23EC8333C();
  }
  return a1;
}

_QWORD *assignWithCopy for CollectionType(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_23EC8333C();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CollectionType(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollectionType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CollectionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_23EC77B1C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23EC77B34(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectionType()
{
  return &type metadata for CollectionType;
}

unint64_t sub_23EC77B68()
{
  unint64_t result;

  result = qword_256DC8180;
  if (!qword_256DC8180)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85868, &type metadata for CollectionType);
    atomic_store(result, (unint64_t *)&qword_256DC8180);
  }
  return result;
}

uint64_t sub_23EC77BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  char v5;
  uint64_t v6;

  if (!a2)
  {
    if (!a5)
      goto LABEL_12;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    if (a5 == 1)
    {
LABEL_12:
      MEMORY[0x24BDAC7A8](a1);
      v6 = sub_23EC8396C();
      sub_23EC8333C();
      sub_23EC8333C();
      MEMORY[0x24265CA8C](MEMORY[0x24BEE12C8], v6);
      v5 = sub_23EC838E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5 & 1;
    }
    goto LABEL_8;
  }
  if (a5 < 2)
  {
LABEL_8:
    v5 = 0;
    return v5 & 1;
  }
  if (a1 == a4 && a2 == a5)
    goto LABEL_12;
  a1 = sub_23EC83DA4();
  v5 = 0;
  if ((a1 & 1) != 0)
    goto LABEL_12;
  return v5 & 1;
}

uint64_t sub_23EC77CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t, uint64_t);
  char v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v6 = type metadata accessor for ElementID();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - v10;
  v12 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v12(a3, a4);
  v12(a3, a4);
  v13 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
  v14 = sub_23EC834A4();
  v15 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
  v15(v9, v14);
  v15(v11, v14);
  return v13 & 1;
}

uint64_t sub_23EC77DF0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[8];

  if (a3 && a3 != 1)
  {
    sub_23EC83E04();
    sub_23EC8333C();
    sub_23EC83864();
    v13 = sub_23EC65284(a2, a3);
  }
  else
  {
    v13 = sub_23EC83E04();
  }
  v21[7] = a4;
  MEMORY[0x24BDAC7A8](v13);
  v21[2] = a5;
  v21[3] = a6;
  v21[4] = a7;
  v15 = sub_23EC8396C();
  v16 = type metadata accessor for ElementID();
  sub_23EC8333C();
  v17 = MEMORY[0x24265CA8C](MEMORY[0x24BEE12E0], v15);
  v19 = sub_23EC76F18((void (*)(char *, char *))sub_23EC780F4, (uint64_t)v21, v15, v16, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  swift_bridgeObjectRelease();
  sub_23EC78128(a1, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EC77F50(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BYTE v13[72];

  sub_23EC83DF8();
  sub_23EC77DF0((uint64_t)v13, a1, a2, a3, a4, a5, a6);
  return sub_23EC83E1C();
}

uint64_t sub_23EC77FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23EC65270(v2, v3);
}

uint64_t sub_23EC77FD8(uint64_t *a1)
{
  uint64_t v1;

  return sub_23EC77F50(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), a1[2], a1[3], a1[4]);
}

uint64_t sub_23EC77FF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_23EC77DF0(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16), a2[2], a2[3], a2[4]);
}

uint64_t sub_23EC78008(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _BYTE v5[72];

  sub_23EC83DF8();
  sub_23EC77DF0((uint64_t)v5, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16), a2[2], a2[3], a2[4]);
  return sub_23EC83E1C();
}

uint64_t sub_23EC78054(uint64_t *a1, uint64_t a2)
{
  return sub_23EC77BAC(*a1, a1[1], a1[2], *(_QWORD *)a2, *(_QWORD *)(a2 + 8)) & 1;
}

void sub_23EC7809C()
{
  JUMPOUT(0x24265CA8CLL);
}

unint64_t sub_23EC780B0()
{
  unint64_t result;

  result = qword_256DC8188;
  if (!qword_256DC8188)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC858D8, &type metadata for CollectionType);
    atomic_store(result, (unint64_t *)&qword_256DC8188);
  }
  return result;
}

uint64_t sub_23EC780F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 16))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23EC78128(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for ElementID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 + 16);
  result = sub_23EC83E04();
  if (v7)
  {
    v9 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v10 = *(_QWORD *)(v4 + 72);
    do
    {
      sub_23EC78218(v9, (uint64_t)v6);
      sub_23EC834A4();
      sub_23EC7825C();
      sub_23EC837D4();
      sub_23EC83E04();
      result = sub_23EC782A4((uint64_t)v6);
      v9 += v10;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_23EC78218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23EC7825C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC7C70;
  if (!qword_256DC7C70)
  {
    v1 = sub_23EC834A4();
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_256DC7C70);
  }
  return result;
}

uint64_t sub_23EC782A4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EC782E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23EC77CEC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24)) & 1;
}

uint64_t static SelectedHomeEntity.selectedHome.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  os_log_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = sub_23EC83780();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v7 = objc_msgSend(v6, sel_home);

  if (v7)
  {
    if (qword_256DC7808 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC8528);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = v7;
    v10 = sub_23EC83768();
    v11 = sub_23EC83A5C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v32 = v10;
      v13 = v12;
      v30 = (_QWORD *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v36 = v33;
      *(_DWORD *)v13 = 136315394;
      v34 = v2;
      v35 = sub_23EC79A04(0x64657463656C6573, 0xEC000000656D6F48, &v36);
      sub_23EC83AF8();
      *(_WORD *)(v13 + 12) = 2112;
      v35 = (uint64_t)v9;
      v14 = v9;
      v31 = v3;
      v15 = a1;
      v16 = v14;
      sub_23EC83AF8();
      v17 = v30;
      *v30 = v7;

      a1 = v15;
      v18 = v32;
      _os_log_impl(&dword_23EC52000, v32, v11, "%s HFHomeKitDispatcher.home=%@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7940);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v17, -1, -1);
      v19 = v33;
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v19, -1, -1);
      MEMORY[0x24265CB1C](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v34);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    v22 = objc_msgSend(v9, sel_uniqueIdentifier);
    sub_23EC8348C();

    v23 = objc_msgSend(v9, sel_name);
    v24 = sub_23EC83840();
    v26 = v25;

    v27 = type metadata accessor for SelectedHomeEntity();
    v28 = (uint64_t *)(a1 + *(int *)(v27 + 20));
    *v28 = v24;
    v28[1] = v26;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a1, 0, 1, v27);
  }
  else
  {
    v20 = type metadata accessor for SelectedHomeEntity();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a1, 1, 1, v20);
  }
}

uint64_t SelectedHomeEntity.init(id:name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  _QWORD *v8;

  sub_23EC6EFC8(a1, a4);
  result = type metadata accessor for SelectedHomeEntity();
  v8 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_23EC786E8()
{
  uint64_t v0;

  v0 = sub_23EC833CC();
  __swift_allocate_value_buffer(v0, qword_256DC8190);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC8190);
  return sub_23EC833C0();
}

uint64_t static SelectedHomeEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7850 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC8190);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void SelectedHomeEntity.displayRepresentation.getter(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_23EC8342C();
  v26 = *(_QWORD *)(v2 - 8);
  v27 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC834BC();
  MEMORY[0x24BDAC7A8](v4);
  v25[1] = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC83828();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23EC83444();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = sub_23EC8381C();
  MEMORY[0x24BDAC7A8](v15);
  v16 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v17 = objc_msgSend(v16, sel_homeManager);

  if (v17)
  {
    v29 = v13;
    v30 = a1;
    v18 = objc_msgSend(v17, sel_hf_orderedHomes);
    sub_23EC58B7C();
    v19 = sub_23EC83918();

    MEMORY[0x24BDAC7A8](v20);
    v25[-2] = v31;
    v21 = sub_23EC798A8(sub_23EC79FE0, (uint64_t)&v25[-4], v19);
    swift_bridgeObjectRelease();
    sub_23EC83810();
    sub_23EC83804();
    if (v21)
    {
      v22 = objc_msgSend(v21, sel_name);
      sub_23EC83840();

      sub_23EC837F8();
      swift_bridgeObjectRelease();
      sub_23EC83804();
      sub_23EC83438();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v29);
      v23 = sub_23EC832F4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v9, 1, 1, v23);
      sub_23EC83300();

    }
    else
    {
      type metadata accessor for SelectedHomeEntity();
      sub_23EC837F8();
      sub_23EC83804();
      sub_23EC83438();
      sub_23EC837EC();
      sub_23EC834B0();
      (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v28, *MEMORY[0x24BDCD328], v27);
      sub_23EC83450();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v29);
      sub_23EC832E8();
      sub_23EC83300();

    }
  }
  else
  {
    sub_23EC83810();
    sub_23EC83804();
    type metadata accessor for SelectedHomeEntity();
    sub_23EC837F8();
    sub_23EC83804();
    sub_23EC83438();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    v24 = sub_23EC832F4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
    sub_23EC83300();
  }
}

uint64_t SelectedHomeEntity.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  _QWORD *v3;

  sub_23EC83498();
  result = type metadata accessor for SelectedHomeEntity();
  v3 = (_QWORD *)(a1 + *(int *)(result + 20));
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  return result;
}

uint64_t SelectedHomeEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
}

uint64_t SelectedHomeEntity.id.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_23EC79FFC(a1, v1);
}

uint64_t (*SelectedHomeEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t SelectedHomeEntity.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SelectedHomeEntity() + 20));
  sub_23EC8333C();
  return v1;
}

uint64_t SelectedHomeEntity.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for SelectedHomeEntity() + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SelectedHomeEntity.name.modify())()
{
  type metadata accessor for SelectedHomeEntity();
  return nullsub_1;
}

uint64_t SelectedHomeEntity.hash(into:)()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for SelectedHomeEntity();
  sub_23EC8333C();
  sub_23EC83864();
  return swift_bridgeObjectRelease();
}

uint64_t static SelectedHomeEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
    return 0;
  v4 = *(int *)(type metadata accessor for SelectedHomeEntity() + 20);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = (_QWORD *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1])
    return 1;
  else
    return sub_23EC83DA4();
}

uint64_t sub_23EC78F08(char a1)
{
  if ((a1 & 1) != 0)
    return 1701667182;
  else
    return 25705;
}

BOOL sub_23EC78F2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23EC78F44()
{
  char *v0;

  return sub_23EC78F08(*v0);
}

uint64_t sub_23EC78F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC7A930(a1, a2);
  *a3 = result;
  return result;
}

void sub_23EC78F70(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23EC78F7C()
{
  sub_23EC7A040();
  return sub_23EC83E40();
}

uint64_t sub_23EC78FA4()
{
  sub_23EC7A040();
  return sub_23EC83E4C();
}

uint64_t SelectedHomeEntity.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC81B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC7A040();
  sub_23EC83E34();
  v8[15] = 0;
  type metadata accessor for HomeID();
  sub_23EC65F10(&qword_256DC81C8, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, (uint64_t)&protocol conformance descriptor for HomeID);
  sub_23EC83D5C();
  if (!v1)
  {
    type metadata accessor for SelectedHomeEntity();
    v8[14] = 1;
    sub_23EC83D44();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SelectedHomeEntity.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for SelectedHomeEntity();
  sub_23EC8333C();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  return sub_23EC83E1C();
}

uint64_t SelectedHomeEntity.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  char v25;

  v20 = a2;
  v21 = type metadata accessor for HomeID();
  MEMORY[0x24BDAC7A8](v21);
  v22 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC81D0);
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SelectedHomeEntity();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC7A040();
  sub_23EC83E28();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v11 = v5;
  v12 = (uint64_t)v10;
  v25 = 0;
  sub_23EC65F10(&qword_256DC81D8, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, (uint64_t)&protocol conformance descriptor for HomeID);
  v13 = (uint64_t)v22;
  v14 = v23;
  sub_23EC83D14();
  sub_23EC6EFC8(v13, v12);
  v24 = 1;
  v15 = sub_23EC83CFC();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v14);
  v18 = (uint64_t *)(v12 + *(int *)(v8 + 20));
  *v18 = v15;
  v18[1] = v17;
  sub_23EC6522C(v12, v20, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return sub_23EC65E08(v12, (uint64_t (*)(_QWORD))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_23EC79420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
}

uint64_t sub_23EC79444()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  sub_23EC8333C();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  return sub_23EC83E1C();
}

uint64_t sub_23EC794E8()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  sub_23EC8333C();
  sub_23EC83864();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EC79570()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  sub_23EC8333C();
  sub_23EC83864();
  swift_bridgeObjectRelease();
  return sub_23EC83E1C();
}

uint64_t sub_23EC79610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
    return 0;
  v6 = *(int *)(a3 + 20);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1])
    return 1;
  else
    return sub_23EC83DA4();
}

uint64_t sub_23EC79684@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SelectedHomeEntity.init(from:)(a1, a2);
}

uint64_t sub_23EC79698(_QWORD *a1)
{
  return SelectedHomeEntity.encode(to:)(a1);
}

uint64_t sub_23EC796AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7850 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC8190);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC7971C()
{
  sub_23EC65F10((unint64_t *)&qword_256DC7A98, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
  return sub_23EC83168();
}

uint64_t sub_23EC79770()
{
  sub_23EC65F10(&qword_2543411C0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
  return sub_23EC833FC();
}

void sub_23EC797C0()
{
  strcpy((char *)&qword_256DC81A8, "com.apple.Home");
  unk_256DC81B7 = -18;
}

uint64_t static SelectedHomeEntity.attributionBundleIdentifier.getter()
{
  uint64_t v0;

  if (qword_256DC7858 != -1)
    swift_once();
  v0 = qword_256DC81A8;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC7984C()
{
  uint64_t v0;

  if (qword_256DC7858 != -1)
    swift_once();
  v0 = qword_256DC81A8;
  sub_23EC8333C();
  return v0;
}

void *sub_23EC798A8(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_23EC8333C();
  for (; v6; v6 = sub_23EC83C90())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24265C474](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    sub_23EC8333C();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for SelectedHomeEntity()
{
  uint64_t result;

  result = qword_2543411D8;
  if (!qword_2543411D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23EC79A04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23EC79AD4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23EC6AF14((uint64_t)v12, *a3);
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
      sub_23EC6AF14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_23EC8333C();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23EC79AD4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23EC83B04();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23EC79C8C(a5, a6);
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
  v8 = sub_23EC83C00();
  if (!v8)
  {
    sub_23EC83C84();
    __break(1u);
LABEL_17:
    result = sub_23EC83CC0();
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

uint64_t sub_23EC79C8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23EC79D20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23EC79E94(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23EC79E94(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23EC79D20(uint64_t a1, unint64_t a2)
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
      v3 = sub_23EC7E324(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23EC83BC4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23EC83C84();
      __break(1u);
LABEL_10:
      v2 = sub_23EC8387C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23EC83CC0();
    __break(1u);
LABEL_14:
    result = sub_23EC83C84();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_23EC79E94(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8220);
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
  result = sub_23EC83CC0();
  __break(1u);
  return result;
}

uint64_t sub_23EC79FE0(id *a1)
{
  return sub_23EC81040(a1) & 1;
}

uint64_t sub_23EC79FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_23EC7A040()
{
  unint64_t result;

  result = qword_256DC81C0;
  if (!qword_256DC81C0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85DD4, &type metadata for SelectedHomeEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC81C0);
  }
  return result;
}

uint64_t sub_23EC7A084()
{
  return sub_23EC65F10((unint64_t *)&unk_254341190, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A0B0()
{
  return sub_23EC65F10(&qword_2543411A8, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A0DC()
{
  return sub_23EC65F10(&qword_2543411D0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A108()
{
  return sub_23EC65F10(&qword_256DC81E0, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, (uint64_t)&protocol conformance descriptor for HomeID);
}

uint64_t sub_23EC7A134()
{
  return sub_23EC65F10(&qword_256DC81E8, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, (uint64_t)&protocol conformance descriptor for HomeID);
}

uint64_t sub_23EC7A160()
{
  return sub_23EC65F10(&qword_256DC81F0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A18C()
{
  return sub_23EC65F10(&qword_2543411B0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A1B8()
{
  return sub_23EC65F10(&qword_2543411B8, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A1E4()
{
  return sub_23EC65F10(&qword_2543411A0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A210()
{
  return sub_23EC65F10(&qword_2543411C0, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

unint64_t sub_23EC7A240()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC81F8;
  if (!qword_256DC81F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC8200);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB6250], v1);
    atomic_store(result, (unint64_t *)&qword_256DC81F8);
  }
  return result;
}

uint64_t sub_23EC7A28C()
{
  return sub_23EC65F10(&qword_2543411C8, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t sub_23EC7A2B8()
{
  return sub_23EC65F10((unint64_t *)&qword_256DC7A98, (uint64_t (*)(uint64_t))type metadata accessor for SelectedHomeEntity, (uint64_t)&protocol conformance descriptor for SelectedHomeEntity);
}

uint64_t *initializeBufferWithCopyOfBuffer for SelectedHomeEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    sub_23EC83348();
  }
  else
  {
    v7 = sub_23EC834A4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    sub_23EC8333C();
  }
  return a1;
}

uint64_t destroy for SelectedHomeEntity(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  sub_23EC8333C();
  return a1;
}

uint64_t assignWithCopy for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelectedHomeEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC7A578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for HomeID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SelectedHomeEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC7A604(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for HomeID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23EC7A680()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EC834A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SelectedHomeEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SelectedHomeEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC7A7CC + 4 * byte_23EC859C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23EC7A800 + 4 * byte_23EC859C0[v4]))();
}

uint64_t sub_23EC7A800(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7A808(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC7A810);
  return result;
}

uint64_t sub_23EC7A81C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC7A824);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23EC7A828(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7A830(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23EC7A83C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SelectedHomeEntity.CodingKeys()
{
  return &type metadata for SelectedHomeEntity.CodingKeys;
}

unint64_t sub_23EC7A85C()
{
  unint64_t result;

  result = qword_256DC8208;
  if (!qword_256DC8208)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85DAC, &type metadata for SelectedHomeEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8208);
  }
  return result;
}

unint64_t sub_23EC7A8A4()
{
  unint64_t result;

  result = qword_256DC8210;
  if (!qword_256DC8210)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85D1C, &type metadata for SelectedHomeEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8210);
  }
  return result;
}

unint64_t sub_23EC7A8EC()
{
  unint64_t result;

  result = qword_256DC8218;
  if (!qword_256DC8218)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC85D44, &type metadata for SelectedHomeEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8218);
  }
  return result;
}

uint64_t sub_23EC7A930(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23EC7A9F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v2 = sub_23EC834D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EC83564();
  v7 = sub_23EC83534();
  v8 = sub_23EC83534();
  v9 = sub_23EC7AD08(v8);
  v15 = sub_23EC7AF70(v9);
  sub_23EC8351C();
  sub_23EC834C8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8230);
  sub_23EC7B114();
  sub_23EC7B8E8(&qword_256DC8240, MEMORY[0x24BE4DF08]);
  v10 = sub_23EC838DC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = sub_23EC83528();
  v12 = sub_23EC83540();
  v13 = sub_23EC8354C();
  result = sub_23EC83558();
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v10;
  a1[3] = v11;
  a1[4] = v12;
  a1[5] = v13;
  a1[6] = result;
  return result;
}

uint64_t sub_23EC7AB70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8228);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EC8354C();
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_23EC5F41C(a1), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(v5 + 56);
    v10 = sub_23EC83630();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v4, v9 + *(_QWORD *)(v11 + 72) * v8, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v4, 0, 1, v10);
  }
  else
  {
    v10 = sub_23EC83630();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_23EC83630();
  v12 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1, v10) == 1)
  {
    sub_23EC7ACC8((uint64_t)v4);
    return 0;
  }
  else
  {
    v13 = sub_23EC83624();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v10);
  }
  return v13;
}

uint64_t sub_23EC7ACC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8228);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EC7AD08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_23EC83618();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v24 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
  result = sub_23EC839E4();
  v13 = 0;
  v14 = *(_QWORD *)(a1 + 64);
  v24 = a1 + 64;
  v25 = result;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_5;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v21 >= v18)
      goto LABEL_24;
    v22 = *(_QWORD *)(v24 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_24;
      v22 = *(_QWORD *)(v24 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_24;
        v22 = *(_QWORD *)(v24 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v18)
            goto LABEL_24;
          v22 = *(_QWORD *)(v24 + 8 * v13);
          if (!v22)
          {
            v13 = v21 + 4;
            if (v21 + 4 >= v18)
              goto LABEL_24;
            v22 = *(_QWORD *)(v24 + 8 * v13);
            if (!v22)
            {
              v13 = v21 + 5;
              if (v21 + 5 >= v18)
              {
LABEL_24:
                sub_23EC83408();
                return v25;
              }
              v22 = *(_QWORD *)(v24 + 8 * v13);
              v23 = v21 + 5;
              if (!v22)
                break;
            }
          }
        }
      }
    }
LABEL_23:
    v17 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v11, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v20, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
    sub_23EC7B160((uint64_t)v9, v6);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_24;
    v22 = *(_QWORD *)(v24 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23EC7AF70(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_23EC7B3B4((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    sub_23EC83408();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_23EC7B3B4((unint64_t *)v7, v4, v2);
    sub_23EC83408();
    MEMORY[0x24265CB1C](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_23EC7B0CC()
{
  return sub_23EC83600();
}

uint64_t sub_23EC7B0EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23EC8360C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_23EC7B114()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC8238;
  if (!qword_256DC8238)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC8230);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BEE1718], v1);
    atomic_store(result, (unint64_t *)&qword_256DC8238);
  }
  return result;
}

uint64_t sub_23EC7B160(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_23EC83618();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
  sub_23EC8333C();
  v30 = a2;
  v11 = sub_23EC837C8();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v29 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_23EC7B8E8(&qword_256DC8240, MEMORY[0x24BE4DF08]);
      v21 = sub_23EC837E0();
      v22 = *(void (**)(char *, uint64_t))(v29 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v30, v6);
    v20(v27, *(_QWORD *)(*v26 + 48) + v17 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v30;
    v18(v9, v30, v6);
    v31 = *v3;
    *v3 = 0x8000000000000000;
    sub_23EC7B928((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v31;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_23EC7B3B4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a2;
  v23 = a1;
  v4 = sub_23EC83618();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = 0;
  v9 = 0;
  v10 = *(_QWORD *)(a3 + 56);
  v25 = a3 + 56;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v9 << 6);
      goto LABEL_5;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v25 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v25 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v14)
          goto LABEL_26;
        v19 = *(_QWORD *)(v25 + 8 * v9);
        if (!v19)
        {
          v9 = v18 + 3;
          if (v18 + 3 >= v14)
            goto LABEL_26;
          v19 = *(_QWORD *)(v25 + 8 * v9);
          if (!v19)
            break;
        }
      }
    }
LABEL_22:
    v13 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v8, *(_QWORD *)(a3 + 48) + *(_QWORD *)(v5 + 72) * v16, v4);
    v17 = sub_23EC835F4();
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v23 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_26:
        sub_23EC83348();
        return sub_23EC7B5E0(v23, v22, v24, a3);
      }
    }
  }
  v20 = v18 + 4;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v25 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v25 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_22;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23EC7B5E0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = sub_23EC83618();
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    sub_23EC83408();
    return MEMORY[0x24BEE4B08];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v38 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8248);
  result = sub_23EC83BB8();
  v12 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v38;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_41;
      if (v20 >= v37)
      {
LABEL_38:
        sub_23EC83408();
        return v12;
      }
      v21 = v36[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v37)
          goto LABEL_38;
        v21 = v36[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v37)
            goto LABEL_38;
          v21 = v36[v15];
          if (!v21)
          {
            v15 = v20 + 3;
            if (v20 + 3 >= v37)
              goto LABEL_38;
            v21 = v36[v15];
            if (!v21)
            {
              v15 = v20 + 4;
              if (v20 + 4 >= v37)
                goto LABEL_38;
              v21 = v36[v15];
              for (i = v20 + 4; !v21; ++i)
              {
                v15 = i + 1;
                if (__OFADD__(i, 1))
                  goto LABEL_42;
                if (v15 >= v37)
                  goto LABEL_38;
                v21 = v36[v15];
              }
            }
          }
        }
      }
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
    result = sub_23EC837C8();
    v26 = -1 << *(_BYTE *)(v12 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      v17 = v38;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      v17 = v38;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v16 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v16 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v29 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_38;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23EC7B8E8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23EC83618();
    result = MEMORY[0x24265CA8C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23EC7B928(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23EC83618();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 <= v10)
  {
    if ((a3 & 1) != 0)
      sub_23EC7C080();
    else
      sub_23EC7BD48();
    v12 = *v3;
    sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
    v13 = sub_23EC837C8();
    v14 = -1 << *(_BYTE *)(v12 + 32);
    a2 = v13 & ~v14;
    if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v15 = ~v14;
      v16 = *(_QWORD *)(v7 + 72);
      v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      do
      {
        v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
        sub_23EC7B8E8(&qword_256DC8240, MEMORY[0x24BE4DF08]);
        v18 = sub_23EC837E0();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        if ((v18 & 1) != 0)
          goto LABEL_14;
        a2 = (a2 + 1) & v15;
      }
      while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
  else if ((a3 & 1) == 0)
  {
    sub_23EC7BB14();
  }
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_14:
  result = sub_23EC83DB0();
  __break(1u);
  return result;
}

void *sub_23EC7BB14()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23EC83618();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8248);
  v6 = *v0;
  v7 = sub_23EC83B94();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)sub_23EC83408();
LABEL_31:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v21 >= v17)
      goto LABEL_29;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_29;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_29;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v17)
            goto LABEL_29;
          v22 = *(_QWORD *)(v10 + 8 * v13);
          if (!v22)
          {
            v13 = v21 + 4;
            if (v21 + 4 >= v17)
            {
LABEL_29:
              result = (void *)sub_23EC83408();
              v1 = v25;
              goto LABEL_31;
            }
            v22 = *(_QWORD *)(v10 + 8 * v13);
            v23 = v21 + 4;
            if (!v22)
              break;
          }
        }
      }
    }
LABEL_28:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_29;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_28;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23EC7BD48()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23EC83618();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8248);
  v7 = sub_23EC83BA0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = sub_23EC83408();
LABEL_36:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = sub_23EC83348();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_25;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v19 >= v33)
      goto LABEL_34;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_34;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_34;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
        {
          v15 = v19 + 3;
          if (v19 + 3 >= v33)
            goto LABEL_34;
          v20 = *(_QWORD *)(v32 + 8 * v15);
          if (!v20)
          {
            v15 = v19 + 4;
            if (v19 + 4 >= v33)
            {
LABEL_34:
              result = swift_release_n();
              v1 = v31;
              goto LABEL_36;
            }
            v20 = *(_QWORD *)(v32 + 8 * v15);
            v21 = v19 + 4;
            if (!v20)
              break;
          }
        }
      }
    }
LABEL_24:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_25:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
    result = sub_23EC837C8();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_34;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_24;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_23EC7C080()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t i;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23EC83618();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8248);
  v6 = sub_23EC83BA0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = sub_23EC83348();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_34;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_34;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_34;
            v19 = v35[v14];
            if (!v19)
            {
              v14 = v18 + 3;
              if (v18 + 3 >= v34)
                goto LABEL_34;
              v19 = v35[v14];
              if (!v19)
              {
                v14 = v18 + 4;
                if (v18 + 4 >= v34)
                {
LABEL_34:
                  sub_23EC83408();
                  v1 = v33;
                  v32 = 1 << *(_BYTE *)(v5 + 32);
                  if (v32 >= 64)
                    bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  else
                    *v35 = -1 << v32;
                  *(_QWORD *)(v5 + 16) = 0;
                  break;
                }
                v19 = v35[v14];
                for (i = v18 + 4; !v19; ++i)
                {
                  v14 = i + 1;
                  if (__OFADD__(i, 1))
                    goto LABEL_40;
                  if (v14 >= v34)
                    goto LABEL_34;
                  v19 = v35[v14];
                }
              }
            }
          }
        }
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(_QWORD *)(v5 + 48) + v22 * v17;
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v23, v2);
      sub_23EC7B8E8(&qword_256DC8250, MEMORY[0x24BE4DF00]);
      result = sub_23EC837C8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = sub_23EC83408();
  *v1 = v7;
  return result;
}

uint64_t sub_23EC7C3FC()
{
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83228();
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t sub_23EC7C448(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7A60);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_23EC580CC(a1, (uint64_t)&v9 - v6);
  sub_23EC580CC((uint64_t)v7, (uint64_t)v5);
  sub_23EC83348();
  sub_23EC83348();
  sub_23EC83234();
  sub_23EC563CC((uint64_t)v7, &qword_256DC7A60);
  sub_23EC83408();
  return sub_23EC83408();
}

uint64_t HomeSingleTileEntityQuery.moduleConfiguration.getter()
{
  return sub_23EC8339C();
}

uint64_t HomeSingleTileEntityQuery.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8258);
  swift_getKeyPath();
  result = sub_23EC833B4();
  *a1 = result;
  return result;
}

uint64_t HomeSingleTileEntityQuery.entities(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC7BC0 + dword_256DC7BC0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC7CE44;
  return v5(1, a1);
}

uint64_t HomeSingleTileEntityQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v4[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v5 = swift_task_alloc();
  v6 = *v3;
  v4[6] = v5;
  v4[7] = v6;
  return swift_task_switch();
}

uint64_t sub_23EC7C670()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v9;

  sub_23EC83348();
  v1 = sub_23EC8339C();
  v2 = v0[6];
  if (v1)
  {
    v3 = v0[5];
    swift_getKeyPath();
    sub_23EC6427C();
    sub_23EC8327C();
    sub_23EC83408();
    sub_23EC83408();
    sub_23EC7CBEC(v3, v2);
    sub_23EC7CC30(v3);
    v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  v6 = v0[4];
  sub_23EC83408();
  v9 = (char *)&dword_256DC7BA8 + dword_256DC7BA8;
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = sub_23EC7C798;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))v9)(v0[2], v0[3], v6, v0[6]);
}

uint64_t sub_23EC7C798()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *v1;
  *(_QWORD *)(v3 + 72) = v0;
  swift_task_dealloc();
  sub_23EC563CC(v2, &qword_256DC7B40);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23EC7C838()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeSingleTileEntityQuery.suggestedEntities()(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v2[3] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  v3 = swift_task_alloc();
  v4 = *v1;
  v2[4] = v3;
  v2[5] = v4;
  return swift_task_switch();
}

uint64_t sub_23EC7C8F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v8;

  sub_23EC83348();
  v1 = sub_23EC8339C();
  v2 = v0[4];
  if (v1)
  {
    v3 = v0[3];
    swift_getKeyPath();
    sub_23EC6427C();
    sub_23EC8327C();
    sub_23EC83408();
    sub_23EC83408();
    sub_23EC7CBEC(v3, v2);
    sub_23EC7CC30(v3);
    v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_23EC83408();
  v8 = (char *)&dword_256DC7BA8 + dword_256DC7BA8;
  v6 = (_QWORD *)swift_task_alloc();
  v0[6] = v6;
  *v6 = v0;
  v6[1] = sub_23EC5C748;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v8)(v0[2], 0, 0, v0[4]);
}

uint64_t sub_23EC7CA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23EC55EF4;
  return HomeSingleTileEntityQuery.entities(matching:)(a1, a2, a3);
}

uint64_t sub_23EC7CA84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8258);
  swift_getKeyPath();
  result = sub_23EC833B4();
  *a1 = result;
  return result;
}

uint64_t sub_23EC7CAC4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256DC7BC0 + dword_256DC7BC0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC5C938;
  return v5(1, a1);
}

uint64_t sub_23EC7CB28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EC56630;
  return HomeSingleTileEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_23EC7CB78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23EC7CC70();
  *v1 = v0;
  v1[1] = sub_23EC56630;
  return sub_23EC83204();
}

uint64_t sub_23EC7CBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EC7CC30(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23EC7CC70()
{
  unint64_t result;

  result = qword_256DC8278[0];
  if (!qword_256DC8278[0])
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileEntityQuery, &type metadata for HomeSingleTileEntityQuery);
    atomic_store(result, qword_256DC8278);
  }
  return result;
}

unint64_t sub_23EC7CCB8()
{
  unint64_t result;

  result = qword_2543412B8;
  if (!qword_2543412B8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileEntityQuery, &type metadata for HomeSingleTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_2543412B8);
  }
  return result;
}

unint64_t sub_23EC7CD00()
{
  unint64_t result;

  result = qword_2543412C0;
  if (!qword_2543412C0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileEntityQuery, &type metadata for HomeSingleTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_2543412C0);
  }
  return result;
}

uint64_t sub_23EC7CD44()
{
  return sub_23EC65F10(&qword_256DC7E90, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

unint64_t sub_23EC7CD74()
{
  unint64_t result;

  result = qword_2543412B0;
  if (!qword_2543412B0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for HomeSingleTileEntityQuery, &type metadata for HomeSingleTileEntityQuery);
    atomic_store(result, (unint64_t *)&qword_2543412B0);
  }
  return result;
}

uint64_t sub_23EC7CDB8()
{
  return sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

unint64_t sub_23EC7CDE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC8298;
  if (!qword_256DC8298)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_256DC82A0);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB5BC0], v1);
    atomic_store(result, (unint64_t *)&qword_256DC8298);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeSingleTileEntityQuery()
{
  return &type metadata for HomeSingleTileEntityQuery;
}

uint64_t sub_23EC7CE48@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v3 = objc_msgSend(v1, sel_uniqueIdentifier);
    sub_23EC8348C();

    result = type metadata accessor for ElementID();
    v5 = *(int *)(result + 20);
LABEL_3:
    *(_BYTE *)(a1 + v5) = 0;
    return result;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v6 = objc_msgSend(v1, sel_uniqueIdentifier);
    sub_23EC8348C();

    result = type metadata accessor for ElementID();
    v5 = *(int *)(result + 20);
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      v8 = objc_msgSend(v1, sel_uniqueIdentifier);
      sub_23EC8348C();

      result = type metadata accessor for ElementID();
      v5 = *(int *)(result + 20);
      v7 = 3;
    }
    else
    {
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        v9 = objc_msgSend(v1, sel_uniqueIdentifier);
        sub_23EC8348C();

        result = type metadata accessor for ElementID();
        v5 = *(int *)(result + 20);
        v7 = 4;
      }
      else
      {
        objc_opt_self();
        if (swift_dynamicCastObjCClass())
        {
          v10 = objc_msgSend(v1, sel_uniqueIdentifier);
          sub_23EC8348C();

          result = type metadata accessor for ElementID();
          v5 = *(int *)(result + 20);
          v7 = 5;
        }
        else
        {
          objc_opt_self();
          v11 = swift_dynamicCastObjCClass();
          v12 = objc_msgSend(v1, sel_uniqueIdentifier);
          sub_23EC8348C();

          result = type metadata accessor for ElementID();
          v5 = *(int *)(result + 20);
          if (!v11)
            goto LABEL_3;
          v7 = 2;
        }
      }
    }
  }
  *(_BYTE *)(a1 + v5) = v7;
  return result;
}

BOOL static ElementID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
    return 0;
  v4 = type metadata accessor for ElementID();
  return *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20));
}

uint64_t type metadata accessor for ElementID()
{
  uint64_t result;

  result = qword_254341360;
  if (!qword_254341360)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ElementID.Kind.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_23EC7D114@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s17HomeWidgetIntents9ElementIDV4KindO8rawValueAESgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_23EC7D13C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23EC7D148()
{
  sub_23EC7F49C();
  return sub_23EC83900();
}

uint64_t sub_23EC7D1A4()
{
  sub_23EC7F49C();
  return sub_23EC838F4();
}

uint64_t ElementID.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EC834A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ElementID.kind.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ElementID() + 20));
}

uint64_t ElementID.init(id:kind:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for ElementID();
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t ElementID.hash(into:)()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  return sub_23EC83E04();
}

uint64_t sub_23EC7D318(char a1)
{
  if ((a1 & 1) != 0)
    return 1684957547;
  else
    return 25705;
}

uint64_t sub_23EC7D33C()
{
  char *v0;

  return sub_23EC7D318(*v0);
}

uint64_t sub_23EC7D344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC7F3DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23EC7D368()
{
  sub_23EC7EC2C();
  return sub_23EC83E40();
}

uint64_t sub_23EC7D390()
{
  sub_23EC7EC2C();
  return sub_23EC83E4C();
}

uint64_t ElementID.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC82B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC7EC2C();
  sub_23EC83E34();
  v10[15] = 0;
  sub_23EC834A4();
  sub_23EC65F10(&qword_256DC7ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23EC83D5C();
  if (!v2)
  {
    v10[14] = *(_BYTE *)(v3 + *(int *)(type metadata accessor for ElementID() + 20));
    v10[13] = 1;
    sub_23EC7EC70();
    sub_23EC83D5C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ElementID.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t ElementID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v20 = a2;
  v24 = sub_23EC834A4();
  v21 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v22 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC82D0);
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ElementID();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC7EC2C();
  sub_23EC83E28();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v18 = a1;
  v19 = v5;
  v11 = (uint64_t)v10;
  v12 = v21;
  v27 = 0;
  sub_23EC65F10(&qword_256DC7EE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v14 = v22;
  v13 = v23;
  v15 = v24;
  sub_23EC83D14();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v14, v15);
  v25 = 1;
  sub_23EC7ECB4();
  sub_23EC83D14();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v13);
  *(_BYTE *)(v11 + *(int *)(v8 + 20)) = v26;
  sub_23EC78218(v11, v20);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  return sub_23EC782A4(v11);
}

uint64_t sub_23EC7D82C()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC7D8B4()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  return sub_23EC83E04();
}

uint64_t sub_23EC7D924()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

uint64_t sub_23EC7D9A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ElementID.init(from:)(a1, a2);
}

uint64_t sub_23EC7D9BC(_QWORD *a1)
{
  return ElementID.encode(to:)(a1);
}

BOOL sub_23EC7D9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20));
}

uint64_t ElementID.entityIdentifierString.getter()
{
  uint64_t v1;

  type metadata accessor for ElementID();
  v1 = sub_23EC83D80();
  sub_23EC83870();
  _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
  sub_23EC83870();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static ElementID.entityIdentifier(for:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v20;
  char v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
  unsigned int v48;
  uint64_t v49;
  char v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7EF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23EC834A4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = a1;
  v57 = a2;
  v54 = 58;
  v55 = 0xE100000000000000;
  sub_23EC65B48();
  v13 = (_QWORD *)sub_23EC83B10();
  v14 = v13;
  if (v13[2] != 2)
    goto LABEL_40;
  v16 = v13[4];
  v15 = v13[5];
  v17 = HIBYTE(v15) & 0xF;
  v18 = v16 & 0xFFFFFFFFFFFFLL;
  if (!((v15 & 0x2000000000000000) != 0 ? HIBYTE(v15) & 0xF : v16 & 0xFFFFFFFFFFFFLL))
    goto LABEL_40;
  if ((v15 & 0x1000000000000000) != 0)
  {
    v53 = v13[5];
    sub_23EC8333C();
    v15 = (uint64_t)sub_23EC7E400(v16, v15, 10);
    LOBYTE(v16) = v50;
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  if ((v15 & 0x2000000000000000) != 0)
  {
    v56 = v13[4];
    v57 = v15 & 0xFFFFFFFFFFFFFFLL;
    if (v16 == 43)
    {
      if (!v17)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      if (v17 == 1 || (BYTE1(v16) - 48) > 9u)
        goto LABEL_32;
      v15 = (BYTE1(v16) - 48);
      if (v17 == 2)
        goto LABEL_34;
      if ((BYTE2(v16) - 48) <= 9u)
      {
        v15 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
        v22 = v17 - 3;
        if (v17 != 3)
        {
          v23 = (unsigned __int8 *)&v56 + 3;
          while (1)
          {
            v24 = *v23 - 48;
            if (v24 > 9)
              goto LABEL_32;
            v25 = 10 * v15;
            if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63)
              goto LABEL_32;
            v15 = v25 + v24;
            if (__OFADD__(v25, v24))
              goto LABEL_32;
            LOBYTE(v16) = 0;
            ++v23;
            if (!--v22)
              goto LABEL_35;
          }
        }
        goto LABEL_34;
      }
    }
    else if (v16 == 45)
    {
      if (!v17)
      {
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      if (v17 != 1 && (BYTE1(v16) - 48) <= 9u)
      {
        if (v17 == 2)
        {
          LOBYTE(v16) = 0;
          v15 = -(uint64_t)(BYTE1(v16) - 48);
          goto LABEL_35;
        }
        if ((BYTE2(v16) - 48) <= 9u)
        {
          v15 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
          v46 = v17 - 3;
          if (v17 != 3)
          {
            v47 = (unsigned __int8 *)&v56 + 3;
            while (1)
            {
              v48 = *v47 - 48;
              if (v48 > 9)
                goto LABEL_32;
              v49 = 10 * v15;
              if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63)
                goto LABEL_32;
              v15 = v49 - v48;
              if (__OFSUB__(v49, v48))
                goto LABEL_32;
              LOBYTE(v16) = 0;
              ++v47;
              if (!--v46)
                goto LABEL_35;
            }
          }
LABEL_34:
          LOBYTE(v16) = 0;
          goto LABEL_35;
        }
      }
    }
    else if (v17 && (v16 - 48) <= 9u)
    {
      v15 = (v16 - 48);
      if (v17 == 1)
        goto LABEL_34;
      if ((BYTE1(v16) - 48) <= 9u)
      {
        v15 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
        v42 = v17 - 2;
        if (v17 != 2)
        {
          v43 = (unsigned __int8 *)&v56 + 2;
          while (1)
          {
            v44 = *v43 - 48;
            if (v44 > 9)
              goto LABEL_32;
            v45 = 10 * v15;
            if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63)
              goto LABEL_32;
            v15 = v45 + v44;
            if (__OFADD__(v45, v44))
              goto LABEL_32;
            LOBYTE(v16) = 0;
            ++v43;
            if (!--v42)
              goto LABEL_35;
          }
        }
        goto LABEL_34;
      }
    }
LABEL_32:
    v15 = 0;
    LOBYTE(v16) = 1;
    goto LABEL_35;
  }
  if ((v16 & 0x1000000000000000) != 0)
    v20 = (unsigned __int8 *)((v15 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v20 = (unsigned __int8 *)sub_23EC83C00();
  v15 = (uint64_t)sub_23EC7E4E4(v20, v18, 10);
  LOBYTE(v16) = v21 & 1;
LABEL_35:
  if ((v16 & 1) != 0 || (unint64_t)v15 >= 6)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v53 = v15;
  if (v14[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_71;
  }
  v26 = v14[6];
  v27 = v14[7];
  sub_23EC8333C();
  swift_bridgeObjectRelease();
  v56 = v26;
  v57 = v27;
  sub_23EC838C4();
  sub_23EC83468();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    v15 = *(_QWORD *)(v10 + 32);
    ((void (*)(char *, char *, uint64_t))v15)(v12, v8, v9);
    if (qword_256DC7808 == -1)
    {
LABEL_48:
      v35 = sub_23EC83780();
      __swift_project_value_buffer(v35, (uint64_t)qword_256DC8528);
      swift_bridgeObjectRetain_n();
      v36 = sub_23EC83768();
      v37 = sub_23EC83A38();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        v52 = swift_slowAlloc();
        v56 = v52;
        *(_DWORD *)v38 = 136315138;
        v51 = v38 + 4;
        sub_23EC8333C();
        v54 = sub_23EC79A04(a1, a2, &v56);
        sub_23EC83AF8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EC52000, v36, v37, "[entityIdentifier] Converting String: '%s' to ElementID", v38, 0xCu);
        v39 = v52;
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v39, -1, -1);
        MEMORY[0x24265CB1C](v38, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v40 = v53;
      ((void (*)(uint64_t, char *, uint64_t))v15)(a3, v12, v9);
      v41 = type metadata accessor for ElementID();
      *(_BYTE *)(a3 + *(int *)(v41 + 20)) = v40;
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(a3, 0, 1, v41);
    }
LABEL_73:
    swift_once();
    goto LABEL_48;
  }
  sub_23EC6F280((uint64_t)v8);
LABEL_41:
  if (qword_256DC7808 != -1)
    swift_once();
  v28 = sub_23EC83780();
  __swift_project_value_buffer(v28, (uint64_t)qword_256DC8528);
  swift_bridgeObjectRetain_n();
  v29 = sub_23EC83768();
  v30 = sub_23EC83A38();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v56 = v32;
    *(_DWORD *)v31 = 136315138;
    sub_23EC8333C();
    v54 = sub_23EC79A04(a1, a2, &v56);
    sub_23EC83AF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EC52000, v29, v30, "[entityIdentifier] Failed to convert string: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24265CB1C](v32, -1, -1);
    MEMORY[0x24265CB1C](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v33 = type metadata accessor for ElementID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a3, 1, 1, v33);
}

uint64_t ElementID.Kind.debugDescription.getter(char a1)
{
  return *(_QWORD *)&aAccessorscene[8 * a1];
}

uint64_t sub_23EC7E234()
{
  char *v0;

  return ElementID.Kind.debugDescription.getter(*v0);
}

uint64_t ElementID.Kind.description.getter(char a1)
{
  return *(_QWORD *)&aAccessorscene[8 * a1];
}

uint64_t sub_23EC7E25C()
{
  char *v0;

  return ElementID.Kind.description.getter(*v0);
}

uint64_t ElementID.debugDescription.getter()
{
  type metadata accessor for ElementID();
  sub_23EC83870();
  swift_bridgeObjectRelease();
  sub_23EC83870();
  _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
  sub_23EC83870();
  swift_bridgeObjectRelease();
  return 0x49746E656D656C45;
}

_QWORD *sub_23EC7E324(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8220);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23EC7E388(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_23EC838B8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24265C138](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_23EC7E400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  sub_23EC8333C();
  v5 = sub_23EC838C4();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_23EC7E760();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_23EC83C00();
  }
LABEL_7:
  v11 = sub_23EC7E4E4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_23EC7E4E4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

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
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_23EC7E760()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23EC838D0();
  v4 = sub_23EC7E7DC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23EC7E7DC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_23EC7E920(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23EC7E324(v9, 0);
      v12 = sub_23EC7EA0C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      sub_23EC8333C();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x24265C0FC](v11 + 4, v11[2]);
    sub_23EC83408();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24265C0FCLL);
LABEL_9:
      sub_23EC83C00();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24265C0FC]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_23EC7E920(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_23EC7E388(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_23EC7E388(a2, a3, a4);
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
    return sub_23EC838A0();
  }
  __break(1u);
  return result;
}

unint64_t sub_23EC7EA0C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_23EC7E388(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_23EC838AC();
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
          result = sub_23EC83C00();
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
    result = sub_23EC7E388(v12, a6, a7);
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
    v12 = sub_23EC83888();
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

unint64_t _s17HomeWidgetIntents9ElementIDV4KindO8rawValueAESgSi_tcfC_0(unint64_t result)
{
  if (result >= 6)
    return 6;
  return result;
}

unint64_t sub_23EC7EC2C()
{
  unint64_t result;

  result = qword_256DC82C0;
  if (!qword_256DC82C0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC863A0, &type metadata for ElementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC82C0);
  }
  return result;
}

unint64_t sub_23EC7EC70()
{
  unint64_t result;

  result = qword_256DC82C8;
  if (!qword_256DC82C8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for ElementID.Kind, &type metadata for ElementID.Kind);
    atomic_store(result, (unint64_t *)&qword_256DC82C8);
  }
  return result;
}

unint64_t sub_23EC7ECB4()
{
  unint64_t result;

  result = qword_256DC82D8;
  if (!qword_256DC82D8)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for ElementID.Kind, &type metadata for ElementID.Kind);
    atomic_store(result, (unint64_t *)&qword_256DC82D8);
  }
  return result;
}

unint64_t sub_23EC7ECFC()
{
  unint64_t result;

  result = qword_256DC82E0;
  if (!qword_256DC82E0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for ElementID.Kind, &type metadata for ElementID.Kind);
    atomic_store(result, (unint64_t *)&qword_256DC82E0);
  }
  return result;
}

uint64_t sub_23EC7ED40()
{
  return sub_23EC65F10(&qword_256DC82E8, (uint64_t (*)(uint64_t))type metadata accessor for ElementID, (uint64_t)&protocol conformance descriptor for ElementID);
}

_QWORD *initializeBufferWithCopyOfBuffer for ElementID(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_23EC83348();
  }
  else
  {
    v7 = sub_23EC834A4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t initializeWithCopy for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23EC834A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementID()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC7EF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_23EC834A4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 6)
    return v9 - 5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ElementID()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC7EFF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23EC834A4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 5;
  return result;
}

uint64_t sub_23EC7F06C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EC834A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ElementID.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ElementID.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC7F1B8 + 4 * byte_23EC85FD5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23EC7F1EC + 4 * asc_23EC85FD0[v4]))();
}

uint64_t sub_23EC7F1EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7F1F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC7F1FCLL);
  return result;
}

uint64_t sub_23EC7F208(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC7F210);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23EC7F214(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7F21C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ElementID.Kind()
{
  return &type metadata for ElementID.Kind;
}

uint64_t storeEnumTagSinglePayload for ElementID.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC7F284 + 4 * byte_23EC85FDF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23EC7F2B8 + 4 * byte_23EC85FDA[v4]))();
}

uint64_t sub_23EC7F2B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7F2C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC7F2C8);
  return result;
}

uint64_t sub_23EC7F2D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC7F2DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23EC7F2E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC7F2E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ElementID.CodingKeys()
{
  return &type metadata for ElementID.CodingKeys;
}

unint64_t sub_23EC7F308()
{
  unint64_t result;

  result = qword_256DC82F0;
  if (!qword_256DC82F0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86378, &type metadata for ElementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC82F0);
  }
  return result;
}

unint64_t sub_23EC7F350()
{
  unint64_t result;

  result = qword_256DC82F8;
  if (!qword_256DC82F8)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC862E8, &type metadata for ElementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC82F8);
  }
  return result;
}

unint64_t sub_23EC7F398()
{
  unint64_t result;

  result = qword_256DC8300;
  if (!qword_256DC8300)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86310, &type metadata for ElementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8300);
  }
  return result;
}

uint64_t sub_23EC7F3DC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_23EC7F49C()
{
  unint64_t result;

  result = qword_256DC8308;
  if (!qword_256DC8308)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for ElementID.Kind, &type metadata for ElementID.Kind);
    atomic_store(result, (unint64_t *)&qword_256DC8308);
  }
  return result;
}

void sub_23EC7F4E0()
{
  uint64_t inited;

  type metadata accessor for AppIntentSupport();
  inited = swift_initStaticObject();
  sub_23EC7FF90();
  qword_256DC8558 = inited;
}

uint64_t sub_23EC7F518(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = a2;
  sub_23EC8399C();
  v2[18] = sub_23EC83990();
  v2[19] = sub_23EC83984();
  v2[20] = v3;
  return swift_task_switch();
}

uint64_t sub_23EC7F584()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  char v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;

  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = *(id *)(v0 + 136);
  }
  else
  {
    v12 = (id)INTypedIntentWithIntent();
    if (!v12)
    {
      sub_23EC83408();
      v1 = 0;
      goto LABEL_13;
    }
    v13 = v12;
    objc_opt_self();
    v1 = (void *)swift_dynamicCastObjCClass();
    if (!v1)
    {

      sub_23EC83408();
LABEL_13:
      if (qword_256DC7808 != -1)
        swift_once();
      v14 = sub_23EC83780();
      __swift_project_value_buffer(v14, (uint64_t)qword_256DC8528);
      v15 = v1;
      v16 = sub_23EC83768();
      v17 = sub_23EC83A44();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v19 = swift_slowAlloc();
        v30 = v19;
        *(_DWORD *)v18 = 136315138;
        *(_QWORD *)(v0 + 112) = v1;
        v20 = v15;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256DC83C8);
        v21 = sub_23EC8384C();
        *(_QWORD *)(v0 + 120) = sub_23EC79A04(v21, v22, &v30);
        sub_23EC83AF8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_23EC52000, v16, v17, "Failed to lazily load link for: %s", v18, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24265CB1C](v19, -1, -1);
        MEMORY[0x24265CB1C](v18, -1, -1);
      }
      else
      {

      }
      sub_23EC8066C();
      swift_allocError();
      swift_willThrow();

      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  *(_QWORD *)(v0 + 168) = v1;
  v3 = objc_msgSend(v1, sel_linkAction);
  *(_QWORD *)(v0 + 176) = v3;
  if (!v3)
  {
    sub_23EC83408();
    goto LABEL_13;
  }
  v4 = v3;
  v5 = objc_msgSend(v3, sel_identifier);
  v6 = sub_23EC83840();
  v8 = v7;

  if (v6 == 0xD00000000000001FLL && v8 == 0x800000023EC874B0 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v9 = *(uint64_t **)(v0 + 128);
    *(_QWORD *)(v0 + 104) = sub_23EC806B0();
    *(_QWORD *)(v0 + 80) = v4;
    v9[3] = (uint64_t)&type metadata for HomeXLModuleConfigurationIntent;
    v9[4] = sub_23EC58468();
    *v9 = swift_allocObject();
    v10 = v4;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v11;
    *v11 = v0;
    v11[1] = sub_23EC7FA74;
    return sub_23EC831BC();
  }
  if (v6 == 0xD000000000000021 && v8 == 0x800000023EC874D0)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    v25 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 72) = sub_23EC806B0();
    *(_QWORD *)(v0 + 48) = v4;
    *(_QWORD *)(v25 + 24) = &type metadata for HomeSingleTileConfigurationIntent;
    *(_QWORD *)(v25 + 32) = sub_23EC6DD28();
    v26 = v4;
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v27;
    *v27 = v0;
    v27[1] = sub_23EC7FB18;
    return sub_23EC831BC();
  }
  v24 = sub_23EC83DA4();
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
    goto LABEL_23;
  *(_QWORD *)(v0 + 40) = sub_23EC806B0();
  *(_QWORD *)(v0 + 16) = v4;
  v28 = v4;
  v29 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v29;
  *v29 = v0;
  v29[1] = sub_23EC7FB7C;
  return sub_23EC8312C();
}

uint64_t sub_23EC7FA74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC7FAD8()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 176);
  sub_23EC83408();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC7FB18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC7FB7C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_23EC806EC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_23EC7FBE8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 128);

  sub_23EC83408();
  __swift_deallocate_boxed_opaque_existential_1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC7FC40()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 128);

  sub_23EC83408();
  __swift_deallocate_boxed_opaque_existential_1(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC7FC98()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 176);

  sub_23EC83408();
  sub_23EC806EC(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC7FCF0()
{
  return swift_deallocClassInstance();
}

uint64_t static INIntent.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t INIntent.Error.hash(into:)()
{
  return sub_23EC83E04();
}

uint64_t INIntent.Error.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC83E04();
  return sub_23EC83E1C();
}

id static INIntentUtils.typeErasedAppIntent<A>(_:)()
{
  if (qword_256DC7860 != -1)
    swift_once();
  return sub_23EC8024C();
}

uint64_t static INIntentUtils.fromTypeErasedAppIntent(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  sub_23EC8399C();
  v2[4] = sub_23EC83990();
  v2[5] = sub_23EC83984();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_23EC7FE54()
{
  uint64_t *v0;
  _QWORD *v1;

  if (qword_256DC7860 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23EC7FEC8;
  return sub_23EC7F518(v0[2], v0[3]);
}

uint64_t sub_23EC7FEC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EC7FF28()
{
  uint64_t v0;

  sub_23EC83408();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EC7FF5C()
{
  uint64_t v0;

  sub_23EC83408();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23EC7FF90()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  if (qword_256DC7808 != -1)
    swift_once();
  v0 = sub_23EC83780();
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC8528);
  v1 = sub_23EC83768();
  v2 = sub_23EC83A5C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23EC52000, v1, v2, "AppIntentSupport.registerAppIntents() called", v3, 2u);
    MEMORY[0x24265CB1C](v3, -1, -1);
  }

  sub_23EC831EC();
  sub_23EC831D4();
  type metadata accessor for IntentsService();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23EC831E0();
  sub_23EC83408();

}

id sub_23EC8024C()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v15[4];
  uint64_t v16[4];

  sub_23EC83138();
  sub_23EC831C8();
  sub_23EC83180();
  v0 = objc_allocWithZone(MEMORY[0x24BDD9BE8]);
  v1 = (void *)sub_23EC83834();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1Tm(v16, v16[3]);
  v2 = sub_23EC83D98();
  __swift_project_boxed_opaque_existential_1Tm(v15, v15[3]);
  v3 = objc_msgSend(v0, sel_initWithAppBundleIdentifier_linkAction_linkActionMetadata_, v1, v2, sub_23EC83D98());
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  v4 = v3;
  v5 = (void *)sub_23EC83834();
  objc_msgSend(v4, sel__setExtensionBundleId_, v5);

  v6 = (id)INIntentWithTypedIntent();
  if (!v6)
  {
    if (qword_256DC7808 != -1)
      swift_once();
    v7 = sub_23EC83780();
    __swift_project_value_buffer(v7, (uint64_t)qword_256DC8528);
    v8 = sub_23EC83768();
    v9 = sub_23EC83A44();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v16[0] = v11;
      *(_DWORD *)v10 = 136315138;
      swift_getMetatypeMetadata();
      v12 = sub_23EC83E58();
      v15[0] = sub_23EC79A04(v12, v13, v16);
      sub_23EC83AF8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23EC52000, v8, v9, "Failed to build INIntent using INIntentWithTypedIntent with %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24265CB1C](v11, -1, -1);
      MEMORY[0x24265CB1C](v10, -1, -1);
    }

    sub_23EC8066C();
    swift_allocError();
    swift_willThrow();
  }

  return v6;
}

unint64_t sub_23EC8055C()
{
  unint64_t result;

  result = qword_256DC8320;
  if (!qword_256DC8320)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for INIntent.Error, &type metadata for INIntent.Error);
    atomic_store(result, (unint64_t *)&qword_256DC8320);
  }
  return result;
}

uint64_t type metadata accessor for AppIntentSupport()
{
  return objc_opt_self();
}

uint64_t _s5ErrorOwst(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23EC80600 + 4 * byte_23EC86460[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23EC80620 + 4 * byte_23EC86465[v4]))();
}

_BYTE *sub_23EC80600(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23EC80620(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC80628(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC80630(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC80638(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC80640(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for INIntent.Error()
{
  return &type metadata for INIntent.Error;
}

ValueMetadata *type metadata accessor for INIntentUtils()
{
  return &type metadata for INIntentUtils;
}

unint64_t sub_23EC8066C()
{
  unint64_t result;

  result = qword_256DC83C0;
  if (!qword_256DC83C0)
  {
    result = MEMORY[0x24265CA8C](&protocol conformance descriptor for INIntent.Error, &type metadata for INIntent.Error);
    atomic_store(result, (unint64_t *)&qword_256DC83C0);
  }
  return result;
}

unint64_t sub_23EC806B0()
{
  unint64_t result;

  result = qword_256DC83D0;
  if (!qword_256DC83D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DC83D0);
  }
  return result;
}

uint64_t sub_23EC806EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC83D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x24265CB1CLL);
  return result;
}

uint64_t sub_23EC80760()
{
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  sub_23EC83408();
  return swift_deallocObject();
}

uint64_t sub_23EC807A0(unint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v10;

  if (a1)
  {
    if (a1 != 1)
    {
      v7 = objc_msgSend(v1, sel_hf_orderedHomes);
      sub_23EC58B7C();
      v8 = sub_23EC83918();

      sub_23EC65CB0(a1);
      v4 = sub_23EC81370(v8, a1);
      sub_23EC6521C(a1);
      swift_bridgeObjectRelease();
      return v4;
    }
    v3 = objc_msgSend(v1, sel_hf_orderedHomes);
    sub_23EC58B7C();
    v4 = sub_23EC83918();
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
    v3 = objc_msgSend(v5, sel_home);

    v4 = MEMORY[0x24BEE4AF8];
    v10 = MEMORY[0x24BEE4AF8];
    if (v3)
    {
      v6 = v3;
      MEMORY[0x24265C1B0]();
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23EC8393C();
      sub_23EC83960();
      sub_23EC83930();
      v4 = v10;
    }
  }

  return v4;
}

uint64_t sub_23EC80930(char a1)
{
  return *(_QWORD *)&aCurrent_0[8 * a1];
}

uint64_t sub_23EC80950(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;

  v25 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8440);
  v23 = *(_QWORD *)(v3 - 8);
  v24 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8448);
  v20 = *(_QWORD *)(v5 - 8);
  v21 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8450);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8458);
  v26 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_23EC81EB8();
  v15 = v25;
  sub_23EC83E34();
  if (!v15)
  {
    v28 = 0;
    sub_23EC81F84();
    sub_23EC83D2C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  }
  if (v15 == 1)
  {
    v29 = 1;
    sub_23EC81F40();
    sub_23EC83D2C();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  }
  v30 = 2;
  sub_23EC81EFC();
  v17 = v22;
  sub_23EC83D2C();
  v27 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8420);
  sub_23EC81FC8(&qword_256DC8460, &qword_256DC81C8, (uint64_t)&protocol conformance descriptor for HomeID, MEMORY[0x24BEE2A30]);
  v18 = v24;
  sub_23EC83D5C();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
}

uint64_t sub_23EC80C30()
{
  return 0;
}

uint64_t sub_23EC80C3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23EC80C68()
{
  sub_23EC81F40();
  return sub_23EC83E40();
}

uint64_t sub_23EC80C90()
{
  sub_23EC81F40();
  return sub_23EC83E4C();
}

uint64_t sub_23EC80CB8()
{
  char *v0;

  return sub_23EC80930(*v0);
}

uint64_t sub_23EC80CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC818C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23EC80CE4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23EC80CF0()
{
  sub_23EC81EB8();
  return sub_23EC83E40();
}

uint64_t sub_23EC80D18()
{
  sub_23EC81EB8();
  return sub_23EC83E4C();
}

uint64_t sub_23EC80D40()
{
  sub_23EC81F84();
  return sub_23EC83E40();
}

uint64_t sub_23EC80D68()
{
  sub_23EC81F84();
  return sub_23EC83E4C();
}

uint64_t sub_23EC80D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EC819EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23EC80DBC()
{
  sub_23EC81EFC();
  return sub_23EC83E40();
}

uint64_t sub_23EC80DE4()
{
  sub_23EC81EFC();
  return sub_23EC83E4C();
}

uint64_t sub_23EC80E0C(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a1;
  v3 = *a2;
  if (!v2)
    return !v3;
  if (v2 == 1)
    return v3 == 1;
  if (v3 < 2)
    return 0;
  return sub_23EC81100(v2, v3);
}

uint64_t sub_23EC80E4C()
{
  unint64_t *v0;
  unint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23EC83DF8();
  sub_23EC83E04();
  if (v1 > 1)
    sub_23EC811D8((uint64_t)v3, v1);
  return sub_23EC83E1C();
}

uint64_t sub_23EC80EBC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  if (!*v1 || v3 == 1)
    return sub_23EC83E04();
  sub_23EC83E04();
  return sub_23EC811D8(a1, v3);
}

uint64_t sub_23EC80F28()
{
  unint64_t *v0;
  unint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23EC83DF8();
  sub_23EC83E04();
  if (v1 > 1)
    sub_23EC811D8((uint64_t)v3, v1);
  return sub_23EC83E1C();
}

uint64_t sub_23EC80F94@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23EC81A64(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23EC80FBC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_23EC80950(a1, *v1);
}

uint64_t sub_23EC80FD4(uint64_t a1)
{
  if (!a1)
    return 0x746E6572727563;
  if (a1 == 1)
    return 7105633;
  type metadata accessor for HomeID();
  return sub_23EC83C18();
}

uint64_t sub_23EC81038()
{
  uint64_t *v0;

  return sub_23EC80FD4(*v0);
}

uint64_t sub_23EC81040(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  char v7;
  uint64_t v9;

  v2 = sub_23EC834A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(*a1, sel_uniqueIdentifier);
  sub_23EC8348C();

  v7 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_23EC81100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for HomeID();
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8 == *(_QWORD *)(a2 + 16))
  {
    if (!v8 || a1 == a2)
      return 1;
    v9 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v10 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      sub_23EC7CBEC(a1 + v9, (uint64_t)v7);
      if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
        break;
      sub_23EC56564((uint64_t)v7);
      v9 += v10;
      if (!--v8)
        return 1;
    }
    sub_23EC56564((uint64_t)v7);
  }
  return 0;
}

uint64_t sub_23EC811D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v16[2];

  v4 = type metadata accessor for HomeID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 16);
  v16[1] = a1;
  sub_23EC83E04();
  if (v11)
  {
    v12 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v13 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      sub_23EC7CBEC(v12, (uint64_t)v10);
      v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v14(v10, 0, 1, v4);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
      if ((_DWORD)result == 1)
        break;
      sub_23EC6EFC8((uint64_t)v10, (uint64_t)v7);
      sub_23EC834A4();
      sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23EC837D4();
      sub_23EC56564((uint64_t)v7);
      v12 += v13;
      if (!--v11)
        return v14(v10, 1, 1, v4);
    }
  }
  else
  {
    v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v14(v10, 1, 1, v4);
  }
  return result;
}

uint64_t sub_23EC81370(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  id v16;
  BOOL v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7B40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for HomeID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v34 = (uint64_t)&v25 - v12;
  v35 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_23:
    v13 = sub_23EC83C90();
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
LABEL_3:
      v14 = 0;
      v30 = a1 & 0xFFFFFFFFFFFFFF8;
      v31 = a1 & 0xC000000000000001;
      v26 = a1 + 32;
      v27 = v13;
      v28 = a1;
      v29 = a2;
      while (1)
      {
        if (v31)
        {
          v16 = (id)MEMORY[0x24265C474](v14, a1);
          v17 = __OFADD__(v14, 1);
          v18 = v14 + 1;
          if (v17)
          {
LABEL_20:
            __break(1u);
            return v35;
          }
        }
        else
        {
          if (v14 >= *(_QWORD *)(v30 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          v16 = *(id *)(v26 + 8 * v14);
          v17 = __OFADD__(v14, 1);
          v18 = v14 + 1;
          if (v17)
            goto LABEL_20;
        }
        v32 = v16;
        v19 = objc_msgSend(v16, sel_uniqueIdentifier);
        sub_23EC8348C();

        v20 = *(_QWORD *)(a2 + 16);
        v33 = v18;
        if (v20)
        {
          v21 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
          sub_23EC83348();
          v22 = *(_QWORD *)(v8 + 72);
          while (1)
          {
            sub_23EC7CBEC(v21, (uint64_t)v6);
            v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
            v15(v6, 0, 1, v7);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
              break;
            sub_23EC6EFC8((uint64_t)v6, (uint64_t)v11);
            v23 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
            sub_23EC56564((uint64_t)v11);
            if ((v23 & 1) != 0)
            {
              a2 = v29;
              sub_23EC83408();
              sub_23EC56564(v34);
              sub_23EC83C0C();
              sub_23EC83C48();
              sub_23EC83C54();
              sub_23EC83C24();
              goto LABEL_7;
            }
            v21 += v22;
            if (!--v20)
              goto LABEL_5;
          }
        }
        else
        {
          sub_23EC83348();
          v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
LABEL_5:
          v15(v6, 1, 1, v7);
        }
        a2 = v29;
        sub_23EC83408();
        sub_23EC56564(v34);

LABEL_7:
        a1 = v28;
        v14 = v33;
        if (v33 == v27)
          return v35;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeScope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = sub_23EC83348();
  *a1 = v3;
  return a1;
}

unint64_t destroy for HomeScope(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return sub_23EC83408();
  return result;
}

unint64_t *assignWithCopy for HomeScope(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      sub_23EC83348();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    sub_23EC83408();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    sub_23EC83348();
    sub_23EC83408();
  }
  return a1;
}

unint64_t *assignWithTake for HomeScope(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    sub_23EC83408();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  sub_23EC83408();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeScope(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HomeScope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_23EC81838(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23EC81850(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for HomeScope()
{
  return &type metadata for HomeScope;
}

unint64_t sub_23EC81884()
{
  unint64_t result;

  result = qword_256DC83E0;
  if (!qword_256DC83E0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC8662C, &type metadata for HomeScope);
    atomic_store(result, (unint64_t *)&qword_256DC83E0);
  }
  return result;
}

uint64_t sub_23EC818C8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746E6572727563 && a2 == 0xE700000000000000;
  if (v3 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7105633 && a2 == 0xE300000000000000 || (sub_23EC83DA4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2037149295 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23EC819EC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23EC83DA4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23EC81A58()
{
  return 12383;
}

uint64_t sub_23EC81A64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC83E8);
  v3 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  v31 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v33 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC83F0);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC83F8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8400);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v34 = a1;
  v16 = (uint64_t)__swift_project_boxed_opaque_existential_1Tm(a1, v15);
  sub_23EC81EB8();
  v17 = v35;
  sub_23EC83E28();
  if (!v17)
  {
    v35 = v8;
    v18 = v12;
    v19 = sub_23EC83D20();
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      if (*(_BYTE *)(v19 + 32))
      {
        if (*(_BYTE *)(v19 + 32) == 1)
        {
          v38 = 1;
          sub_23EC81F40();
          v20 = v32;
          sub_23EC83CD8();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
          v16 = 1;
        }
        else
        {
          v39 = 2;
          sub_23EC81EFC();
          v24 = v33;
          sub_23EC83CD8();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8420);
          sub_23EC81FC8(&qword_256DC8428, &qword_256DC81D8, (uint64_t)&protocol conformance descriptor for HomeID, MEMORY[0x24BEE2A50]);
          v26 = v30;
          sub_23EC83D14();
          (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
          v16 = v36;
        }
      }
      else
      {
        v37 = 0;
        sub_23EC81F84();
        sub_23EC83CD8();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v7);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        v16 = 0;
      }
    }
    else
    {
      v16 = (uint64_t)v14;
      v21 = sub_23EC83BF4();
      swift_allocError();
      v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8410);
      *v23 = &type metadata for HomeScope;
      sub_23EC83CE4();
      sub_23EC83BE8();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
    }
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  return v16;
}

unint64_t sub_23EC81EB8()
{
  unint64_t result;

  result = qword_256DC8408;
  if (!qword_256DC8408)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86990, &type metadata for HomeScope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8408);
  }
  return result;
}

unint64_t sub_23EC81EFC()
{
  unint64_t result;

  result = qword_256DC8418;
  if (!qword_256DC8418)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86940, &type metadata for HomeScope.OnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8418);
  }
  return result;
}

unint64_t sub_23EC81F40()
{
  unint64_t result;

  result = qword_256DC8430;
  if (!qword_256DC8430)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC868F0, &type metadata for HomeScope.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8430);
  }
  return result;
}

unint64_t sub_23EC81F84()
{
  unint64_t result;

  result = qword_256DC8438;
  if (!qword_256DC8438)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC868A0, &type metadata for HomeScope.CurrentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8438);
  }
  return result;
}

uint64_t sub_23EC81FC8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC8420);
    v10 = sub_23EC65F10(a2, (uint64_t (*)(uint64_t))type metadata accessor for HomeID, a3);
    result = MEMORY[0x24265CA8C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for HomeScope.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EC82098 + 4 * byte_23EC86555[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23EC820CC + 4 * asc_23EC86550[v4]))();
}

uint64_t sub_23EC820CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC820D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EC820DCLL);
  return result;
}

uint64_t sub_23EC820E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EC820F0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23EC820F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EC820FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeScope.CodingKeys()
{
  return &type metadata for HomeScope.CodingKeys;
}

ValueMetadata *type metadata accessor for HomeScope.CurrentCodingKeys()
{
  return &type metadata for HomeScope.CurrentCodingKeys;
}

ValueMetadata *type metadata accessor for HomeScope.AllCodingKeys()
{
  return &type metadata for HomeScope.AllCodingKeys;
}

uint64_t storeEnumTagSinglePayload for HomeScope.OnlyCodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23EC82178 + 4 * byte_23EC8655A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23EC82198 + 4 * byte_23EC8655F[v4]))();
}

_BYTE *sub_23EC82178(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23EC82198(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC821A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC821A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EC821B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EC821B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HomeScope.OnlyCodingKeys()
{
  return &type metadata for HomeScope.OnlyCodingKeys;
}

unint64_t sub_23EC821D8()
{
  unint64_t result;

  result = qword_256DC8468;
  if (!qword_256DC8468)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86720, &type metadata for HomeScope.OnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8468);
  }
  return result;
}

unint64_t sub_23EC82220()
{
  unint64_t result;

  result = qword_256DC8470;
  if (!qword_256DC8470)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86878, &type metadata for HomeScope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8470);
  }
  return result;
}

unint64_t sub_23EC82268()
{
  unint64_t result;

  result = qword_256DC8478;
  if (!qword_256DC8478)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86798, &type metadata for HomeScope.CurrentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8478);
  }
  return result;
}

unint64_t sub_23EC822B0()
{
  unint64_t result;

  result = qword_256DC8480;
  if (!qword_256DC8480)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC867C0, &type metadata for HomeScope.CurrentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8480);
  }
  return result;
}

unint64_t sub_23EC822F8()
{
  unint64_t result;

  result = qword_256DC8488;
  if (!qword_256DC8488)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86748, &type metadata for HomeScope.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8488);
  }
  return result;
}

unint64_t sub_23EC82340()
{
  unint64_t result;

  result = qword_256DC8490;
  if (!qword_256DC8490)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86770, &type metadata for HomeScope.AllCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8490);
  }
  return result;
}

unint64_t sub_23EC82388()
{
  unint64_t result;

  result = qword_256DC8498;
  if (!qword_256DC8498)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86690, &type metadata for HomeScope.OnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC8498);
  }
  return result;
}

unint64_t sub_23EC823D0()
{
  unint64_t result;

  result = qword_256DC84A0;
  if (!qword_256DC84A0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC866B8, &type metadata for HomeScope.OnlyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC84A0);
  }
  return result;
}

unint64_t sub_23EC82418()
{
  unint64_t result;

  result = qword_256DC84A8;
  if (!qword_256DC84A8)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC867E8, &type metadata for HomeScope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC84A8);
  }
  return result;
}

unint64_t sub_23EC82460()
{
  unint64_t result;

  result = qword_256DC84B0;
  if (!qword_256DC84B0)
  {
    result = MEMORY[0x24265CA8C](&unk_23EC86810, &type metadata for HomeScope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DC84B0);
  }
  return result;
}

uint64_t sub_23EC824AC()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DC8258);
  swift_getKeyPath();
  result = sub_23EC833B4();
  qword_256DC84B8 = result;
  return result;
}

uint64_t static HomeSingleTileEntity.defaultQuery.getter@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256DC7868 != -1)
    swift_once();
  *a1 = qword_256DC84B8;
  return sub_23EC83348();
}

uint64_t sub_23EC8253C()
{
  uint64_t v0;

  v0 = sub_23EC833CC();
  __swift_allocate_value_buffer(v0, qword_256DC84C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DC84C0);
  return sub_23EC833C0();
}

uint64_t static HomeSingleTileEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7870 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC84C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t HomeSingleTileEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EC6522C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
}

uint64_t HomeSingleTileEntity.homeID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for HomeSingleTileEntity();
  return sub_23EC6522C(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
}

uint64_t type metadata accessor for HomeSingleTileEntity()
{
  uint64_t result;

  result = qword_254341288;
  if (!qword_254341288)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t HomeSingleTileEntity.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for HomeSingleTileEntity();
  return sub_23EC6522C(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

uint64_t HomeSingleTileEntity.displayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7C10);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DC7BB0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EC83444();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23EC8381C();
  MEMORY[0x24BDAC7A8](v6);
  sub_23EC83810();
  sub_23EC83804();
  type metadata accessor for HomeSingleTileEntity();
  type metadata accessor for TileElementInfo();
  sub_23EC837F8();
  sub_23EC83804();
  sub_23EC83438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  sub_23EC8333C();
  sub_23EC832E8();
  return sub_23EC83300();
}

uint64_t HomeSingleTileEntity.hash(into:)()
{
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  type metadata accessor for HomeSingleTileEntity();
  sub_23EC837D4();
  return TileElementInfo.hash(into:)();
}

uint64_t static HomeSingleTileEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
    && (v4 = type metadata accessor for ElementID(),
        *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    && (v5 = type metadata accessor for HomeSingleTileEntity(),
        (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0))
  {
    return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + *(int *)(v5 + 24), a2 + *(int *)(v5 + 24));
  }
  else
  {
    return 0;
  }
}

uint64_t HomeSingleTileEntity.hashValue.getter()
{
  sub_23EC83DF8();
  sub_23EC834A4();
  sub_23EC65F10((unint64_t *)&qword_256DC7C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EC837D4();
  type metadata accessor for ElementID();
  sub_23EC83E04();
  type metadata accessor for HomeSingleTileEntity();
  sub_23EC837D4();
  TileElementInfo.hash(into:)();
  return sub_23EC83E1C();
}

uint64_t sub_23EC82AD0@<X0>(_QWORD *a1@<X8>)
{
  if (qword_256DC7868 != -1)
    swift_once();
  *a1 = qword_256DC84B8;
  return sub_23EC83348();
}

uint64_t sub_23EC82B20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DC7870 != -1)
    swift_once();
  v2 = sub_23EC833CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DC84C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EC82B90()
{
  sub_23EC65F10(&qword_256DC7E90, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
  return sub_23EC83168();
}

uint64_t sub_23EC82BE4()
{
  sub_23EC65F10(&qword_254341270, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
  return sub_23EC833FC();
}

uint64_t static HomeSingleTileEntity.create(id:homeID:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;

  sub_23EC6522C(a1, a4, (uint64_t (*)(_QWORD))type metadata accessor for ElementID);
  v7 = type metadata accessor for HomeSingleTileEntity();
  sub_23EC6522C(a2, a4 + *(int *)(v7 + 20), (uint64_t (*)(_QWORD))type metadata accessor for HomeID);
  return sub_23EC6522C(a3, a4 + *(int *)(v7 + 24), (uint64_t (*)(_QWORD))type metadata accessor for TileElementInfo);
}

void sub_23EC82CAC()
{
  strcpy((char *)&qword_256DC84D8, "com.apple.Home");
  unk_256DC84E7 = -18;
}

uint64_t static HomeSingleTileEntity.attributionBundleIdentifier.getter()
{
  uint64_t v0;

  if (qword_256DC7878 != -1)
    swift_once();
  v0 = qword_256DC84D8;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC82D38()
{
  uint64_t v0;

  if (qword_256DC7878 != -1)
    swift_once();
  v0 = qword_256DC84D8;
  sub_23EC8333C();
  return v0;
}

uint64_t sub_23EC82D94()
{
  return sub_23EC65F10(&qword_254341240, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82DC0()
{
  return sub_23EC65F10(&qword_254341258, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82DEC()
{
  return sub_23EC65F10(&qword_254341280, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82E18()
{
  return sub_23EC65F10(&qword_256DC84E8, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82E44()
{
  return sub_23EC65F10(&qword_254341260, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82E70()
{
  return sub_23EC65F10(&qword_254341268, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82E9C()
{
  return sub_23EC65F10((unint64_t *)&unk_254341248, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82EC8()
{
  return sub_23EC65F10(&qword_254341270, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

unint64_t sub_23EC82EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DC84F0;
  if (!qword_256DC84F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DC84F8);
    result = MEMORY[0x24265CA8C](MEMORY[0x24BDB6250], v1);
    atomic_store(result, (unint64_t *)&qword_256DC84F0);
  }
  return result;
}

uint64_t sub_23EC82F44()
{
  return sub_23EC65F10(&qword_254341278, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t sub_23EC82F70(uint64_t a1)
{
  uint64_t result;

  result = sub_23EC65F10(&qword_256DC7E90, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23EC82FAC()
{
  return sub_23EC65F10(&qword_256DC7E90, (uint64_t (*)(uint64_t))type metadata accessor for HomeSingleTileEntity, (uint64_t)&protocol conformance descriptor for HomeSingleTileEntity);
}

uint64_t getEnumTagSinglePayload for HomeSingleTileEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC82FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for ElementID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for HomeID();
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for TileElementInfo();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for HomeSingleTileEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EC83088(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for ElementID();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = type metadata accessor for HomeID();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for TileElementInfo();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23EC8312C()
{
  return MEMORY[0x24BDB4B40]();
}

uint64_t sub_23EC83138()
{
  return MEMORY[0x24BDB4BE0]();
}

uint64_t sub_23EC83144()
{
  return MEMORY[0x24BDB4BE8]();
}

uint64_t sub_23EC83150()
{
  return MEMORY[0x24BDB4BF0]();
}

uint64_t sub_23EC8315C()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_23EC83168()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_23EC83174()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_23EC83180()
{
  return MEMORY[0x24BDB4DE8]();
}

uint64_t sub_23EC8318C()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_23EC83198()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_23EC831A4()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_23EC831B0()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_23EC831BC()
{
  return MEMORY[0x24BDB4E78]();
}

uint64_t sub_23EC831C8()
{
  return MEMORY[0x24BDB4E88]();
}

uint64_t sub_23EC831D4()
{
  return MEMORY[0x24BDB4EC0]();
}

uint64_t sub_23EC831E0()
{
  return MEMORY[0x24BDB4EC8]();
}

uint64_t sub_23EC831EC()
{
  return MEMORY[0x24BDB4ED8]();
}

uint64_t sub_23EC831F8()
{
  return MEMORY[0x24BDB4F50]();
}

uint64_t sub_23EC83204()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_23EC83210()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_23EC8321C()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_23EC83228()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_23EC83234()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_23EC83240()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_23EC8324C()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_23EC83258()
{
  return MEMORY[0x24BDB5518]();
}

uint64_t sub_23EC83264()
{
  return MEMORY[0x24BDB5588]();
}

uint64_t sub_23EC83270()
{
  return MEMORY[0x24BDB55A0]();
}

uint64_t sub_23EC8327C()
{
  return MEMORY[0x24BDB5690]();
}

uint64_t sub_23EC83288()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_23EC83294()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_23EC832A0()
{
  return MEMORY[0x24BDB5838]();
}

uint64_t sub_23EC832AC()
{
  return MEMORY[0x24BDB5B78]();
}

uint64_t sub_23EC832B8()
{
  return MEMORY[0x24BDB5B80]();
}

uint64_t sub_23EC832C4()
{
  return MEMORY[0x24BDB5BA0]();
}

uint64_t sub_23EC832D0()
{
  return MEMORY[0x24BDB5BA8]();
}

uint64_t sub_23EC832DC()
{
  return MEMORY[0x24BDB5BB0]();
}

uint64_t sub_23EC832E8()
{
  return MEMORY[0x24BDFBB98]();
}

uint64_t sub_23EC832F4()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_23EC83300()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_23EC8330C()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_23EC83318()
{
  return MEMORY[0x24BDB5E20]();
}

uint64_t sub_23EC83324()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_23EC83330()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_23EC8333C()
{
  return MEMORY[0x24BDB5F38]();
}

uint64_t sub_23EC83348()
{
  return MEMORY[0x24BDB5F40]();
}

uint64_t sub_23EC83354()
{
  return MEMORY[0x24BDB5F60]();
}

uint64_t sub_23EC83360()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_23EC8336C()
{
  return MEMORY[0x24BDB60A0]();
}

uint64_t sub_23EC83378()
{
  return MEMORY[0x24BDB60A8]();
}

uint64_t sub_23EC83384()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_23EC83390()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_23EC8339C()
{
  return MEMORY[0x24BDB61D0]();
}

uint64_t sub_23EC833A8()
{
  return MEMORY[0x24BDB61E0]();
}

uint64_t sub_23EC833B4()
{
  return MEMORY[0x24BDB61E8]();
}

uint64_t sub_23EC833C0()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_23EC833CC()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_23EC833D8()
{
  return MEMORY[0x24BDB6208]();
}

uint64_t sub_23EC833E4()
{
  return MEMORY[0x24BDB6260]();
}

uint64_t sub_23EC833F0()
{
  return MEMORY[0x24BDB6310]();
}

uint64_t sub_23EC833FC()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_23EC83408()
{
  return MEMORY[0x24BDB6448]();
}

uint64_t sub_23EC83414()
{
  return MEMORY[0x24BDB6458]();
}

uint64_t sub_23EC83420()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_23EC8342C()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_23EC83438()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t sub_23EC83444()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_23EC83450()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_23EC8345C()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_23EC83468()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23EC8348C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23EC83498()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23EC834A4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23EC834B0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23EC834BC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23EC834C8()
{
  return MEMORY[0x24BE4D398]();
}

uint64_t sub_23EC834D4()
{
  return MEMORY[0x24BE4D3B8]();
}

uint64_t sub_23EC834E0()
{
  return MEMORY[0x24BE4D3E8]();
}

uint64_t sub_23EC834EC()
{
  return MEMORY[0x24BE4D3F0]();
}

uint64_t sub_23EC834F8()
{
  return MEMORY[0x24BE4D410]();
}

uint64_t sub_23EC83504()
{
  return MEMORY[0x24BE4D428]();
}

uint64_t sub_23EC83510()
{
  return MEMORY[0x24BE4D430]();
}

uint64_t sub_23EC8351C()
{
  return MEMORY[0x24BE4DAB8]();
}

uint64_t sub_23EC83528()
{
  return MEMORY[0x24BE4DAC0]();
}

uint64_t sub_23EC83534()
{
  return MEMORY[0x24BE4DAC8]();
}

uint64_t sub_23EC83540()
{
  return MEMORY[0x24BE4DAD0]();
}

uint64_t sub_23EC8354C()
{
  return MEMORY[0x24BE4DAD8]();
}

uint64_t sub_23EC83558()
{
  return MEMORY[0x24BE4DAE0]();
}

uint64_t sub_23EC83564()
{
  return MEMORY[0x24BE4DAE8]();
}

uint64_t sub_23EC83570()
{
  return MEMORY[0x24BE4DAF0]();
}

uint64_t sub_23EC8357C()
{
  return MEMORY[0x24BE4DBE8]();
}

uint64_t sub_23EC83588()
{
  return MEMORY[0x24BE4DC00]();
}

uint64_t sub_23EC83594()
{
  return MEMORY[0x24BE4DC10]();
}

uint64_t sub_23EC835A0()
{
  return MEMORY[0x24BE4DC18]();
}

uint64_t sub_23EC835AC()
{
  return MEMORY[0x24BE4DC28]();
}

uint64_t sub_23EC835B8()
{
  return MEMORY[0x24BE4DE90]();
}

uint64_t sub_23EC835C4()
{
  return MEMORY[0x24BE4DEA0]();
}

uint64_t sub_23EC835D0()
{
  return MEMORY[0x24BE4DEB0]();
}

uint64_t sub_23EC835DC()
{
  return MEMORY[0x24BE4DEB8]();
}

uint64_t sub_23EC835E8()
{
  return MEMORY[0x24BE4DEC0]();
}

uint64_t sub_23EC835F4()
{
  return MEMORY[0x24BE4DED8]();
}

uint64_t sub_23EC83600()
{
  return MEMORY[0x24BE4DEE0]();
}

uint64_t sub_23EC8360C()
{
  return MEMORY[0x24BE4DEE8]();
}

uint64_t sub_23EC83618()
{
  return MEMORY[0x24BE4DEF0]();
}

uint64_t sub_23EC83624()
{
  return MEMORY[0x24BE4E180]();
}

uint64_t sub_23EC83630()
{
  return MEMORY[0x24BE4E1E8]();
}

uint64_t sub_23EC8363C()
{
  return MEMORY[0x24BE4E408]();
}

uint64_t sub_23EC83648()
{
  return MEMORY[0x24BE4E440]();
}

uint64_t sub_23EC83654()
{
  return MEMORY[0x24BE4E450]();
}

uint64_t sub_23EC83660()
{
  return MEMORY[0x24BE4E468]();
}

uint64_t sub_23EC8366C()
{
  return MEMORY[0x24BE4E470]();
}

uint64_t sub_23EC83678()
{
  return MEMORY[0x24BE4E4D8]();
}

uint64_t sub_23EC83684()
{
  return MEMORY[0x24BE4E4E8]();
}

uint64_t sub_23EC83690()
{
  return MEMORY[0x24BE4E4F8]();
}

uint64_t sub_23EC8369C()
{
  return MEMORY[0x24BE4E500]();
}

uint64_t sub_23EC836A8()
{
  return MEMORY[0x24BE4E508]();
}

uint64_t sub_23EC836B4()
{
  return MEMORY[0x24BE4EAD8]();
}

uint64_t sub_23EC836C0()
{
  return MEMORY[0x24BE4EAE0]();
}

uint64_t sub_23EC836CC()
{
  return MEMORY[0x24BE4EAE8]();
}

uint64_t sub_23EC836D8()
{
  return MEMORY[0x24BE4EAF0]();
}

uint64_t sub_23EC836E4()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23EC836F0()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_23EC836FC()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23EC83708()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_23EC83714()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23EC83720()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23EC8372C()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23EC83738()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23EC83744()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23EC83750()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23EC8375C()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23EC83768()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23EC83774()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23EC83780()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23EC8378C()
{
  return MEMORY[0x24BE4CCA0]();
}

uint64_t sub_23EC83798()
{
  return MEMORY[0x24BE4CCA8]();
}

uint64_t sub_23EC837A4()
{
  return MEMORY[0x24BE4CCB0]();
}

uint64_t sub_23EC837B0()
{
  return MEMORY[0x24BE4CCB8]();
}

uint64_t sub_23EC837BC()
{
  return MEMORY[0x24BE4CD50]();
}

uint64_t sub_23EC837C8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23EC837D4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23EC837E0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23EC837EC()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23EC837F8()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_23EC83804()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_23EC83810()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23EC8381C()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_23EC83828()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23EC83834()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23EC83840()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23EC8384C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23EC83858()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23EC83864()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23EC83870()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23EC8387C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23EC83888()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23EC83894()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23EC838A0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23EC838AC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23EC838B8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23EC838C4()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23EC838D0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23EC838DC()
{
  return MEMORY[0x24BE4EB68]();
}

uint64_t sub_23EC838E8()
{
  return MEMORY[0x24BEE0E58]();
}

uint64_t sub_23EC838F4()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23EC83900()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23EC8390C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23EC83918()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23EC83924()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23EC83930()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23EC8393C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23EC83948()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23EC83954()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23EC83960()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23EC8396C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23EC83978()
{
  return MEMORY[0x24BDB6650]();
}

uint64_t sub_23EC83984()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23EC83990()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23EC8399C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23EC839A8()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23EC839B4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23EC839C0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23EC839CC()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23EC839D8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23EC839E4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23EC839F0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23EC839FC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23EC83A08()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23EC83A14()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23EC83A20()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23EC83A2C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23EC83A38()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23EC83A44()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23EC83A50()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23EC83A5C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23EC83A68()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23EC83A74()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23EC83A80()
{
  return MEMORY[0x24BE4CD58]();
}

uint64_t sub_23EC83A8C()
{
  return MEMORY[0x24BE4CD78]();
}

uint64_t sub_23EC83A98()
{
  return MEMORY[0x24BE4CD90]();
}

uint64_t sub_23EC83AA4()
{
  return MEMORY[0x24BE4CD98]();
}

uint64_t sub_23EC83AB0()
{
  return MEMORY[0x24BE4CDA0]();
}

uint64_t sub_23EC83ABC()
{
  return MEMORY[0x24BDD00F0]();
}

uint64_t sub_23EC83AC8()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23EC83AD4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23EC83AE0()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23EC83AEC()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23EC83AF8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23EC83B04()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23EC83B10()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23EC83B1C()
{
  return MEMORY[0x24BDD05B8]();
}

uint64_t sub_23EC83B28()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_23EC83B34()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_23EC83B40()
{
  return MEMORY[0x24BEE2250]();
}

uint64_t sub_23EC83B4C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23EC83B58()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23EC83B64()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23EC83B70()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23EC83B7C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23EC83B88()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23EC83B94()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23EC83BA0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23EC83BAC()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23EC83BB8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23EC83BC4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23EC83BD0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23EC83BDC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23EC83BE8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23EC83BF4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23EC83C00()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23EC83C0C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23EC83C18()
{
  return MEMORY[0x24BEE2930]();
}

uint64_t sub_23EC83C24()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23EC83C30()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23EC83C3C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23EC83C48()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23EC83C54()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23EC83C60()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23EC83C6C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23EC83C78()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23EC83C84()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23EC83C90()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23EC83C9C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23EC83CA8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23EC83CB4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23EC83CC0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23EC83CCC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23EC83CD8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23EC83CE4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23EC83CF0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23EC83CFC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23EC83D08()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23EC83D14()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23EC83D20()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23EC83D2C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23EC83D38()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23EC83D44()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23EC83D50()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23EC83D5C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23EC83D68()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23EC83D74()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23EC83D80()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23EC83D8C()
{
  return MEMORY[0x24BEE7058]();
}

uint64_t sub_23EC83D98()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23EC83DA4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23EC83DB0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23EC83DBC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23EC83DC8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23EC83DD4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23EC83DE0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23EC83DEC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23EC83DF8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23EC83E04()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23EC83E10()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23EC83E1C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23EC83E28()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23EC83E34()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23EC83E40()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23EC83E4C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23EC83E58()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x24BDD9950]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x24BDD9AF0]();
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

