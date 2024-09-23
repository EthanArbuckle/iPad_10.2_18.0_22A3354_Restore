uint64_t sub_21DE743E8()
{
  return swift_weakInit();
}

uint64_t sub_21DE743F8(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  id v12;
  _QWORD v14[3];

  v3 = v2;
  v6 = sub_21DE81C80();
  v14[1] = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_21DE81C14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE81E24();
  v11 = (_QWORD *)(v3
                 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)(v3 + 16) = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  sub_21DE7575C();
  v12 = a1;
  sub_21DE81C44();
  sub_21DE7460C();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
  return v3;
}

uint64_t sub_21DE7460C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  uint8_t *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  char v33;
  char *v34;
  char v35;
  char v36;
  char *v37;
  char *v38;
  char v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  _QWORD v44[2];
  char *v45;
  char *v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  uint64_t v56[3];

  v53 = sub_21DE81C80();
  v51 = *(_QWORD *)(v53 - 8);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v44 - v3;
  v5 = sub_21DE81E3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v52 = (char *)v44 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v44 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v44 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v44 - v17;
  v19 = v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_config;
  swift_beginAccess();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v20(v18, v19, v5);
  sub_21DE81E0C();
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 24))(v19, v16, v5);
  swift_endAccess();
  v47 = sub_21DE75914();
  sub_21DE81F98();
  v54 = (void (*)(char *, char *, uint64_t))v20;
  v20(v13, (uint64_t)v16, v5);
  v50 = v4;
  v21 = sub_21DE81C74();
  v22 = sub_21DE81F2C();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc();
    v45 = v18;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc();
    v44[1] = v0;
    v26 = v25;
    v56[0] = v25;
    v46 = v16;
    *(_DWORD *)v24 = 136446210;
    v44[0] = v24 + 4;
    v27 = sub_21DE81E30();
    v55 = sub_21DE75A24(v27, v28, v56);
    v16 = v46;
    sub_21DE81FB0();
    swift_bridgeObjectRelease();
    v29 = *(void (**)(char *, uint64_t))(v6 + 8);
    v29(v13, v5);
    _os_log_impl(&dword_21DE73000, v21, v22, "PlaygroundLoggerProbePoint config updated: (%{public}s)", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v26, -1, -1);
    v30 = v24;
    v18 = v45;
    MEMORY[0x2207A5858](v30, -1, -1);
  }
  else
  {
    v29 = *(void (**)(char *, uint64_t))(v6 + 8);
    v29(v13, v5);
  }

  v31 = *(void (**)(char *, uint64_t))(v51 + 8);
  v32 = v53;
  v31(v50, v53);
  swift_beginAccess();
  v33 = sub_21DE81E18();
  swift_endAccess();
  v34 = v52;
  v54(v52, v18, v5);
  if ((v33 & 1) != 0)
  {
    v35 = sub_21DE81E18();
    v29(v34, v5);
    if ((v35 & 1) == 0)
    {
      sub_21DE750DC();
      if (qword_2553AE7E0 != -1)
        swift_once();
      swift_weakAssign();
      *MEMORY[0x24BE60400] = sub_21DE74FE4;
      goto LABEL_19;
    }
  }
  else
  {
    v29(v34, v5);
  }
  swift_beginAccess();
  v36 = sub_21DE81E18();
  swift_endAccess();
  v37 = v48;
  v54(v48, v18, v5);
  if ((v36 & 1) != 0)
  {
    v29(v37, v5);
    v38 = v49;
LABEL_16:
    sub_21DE81F98();
    v40 = sub_21DE81C74();
    v41 = sub_21DE81F2C();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_21DE73000, v40, v41, "PlaygroundLoggerProbePoint config was updated but nothing changed", v42, 2u);
      MEMORY[0x2207A5858](v42, -1, -1);
    }

    v31(v38, v32);
    goto LABEL_19;
  }
  v39 = sub_21DE81E18();
  v29(v37, v5);
  v38 = v49;
  if ((v39 & 1) == 0)
    goto LABEL_16;
  *MEMORY[0x24BE60400] = 0;
  if (qword_2553AE7E0 != -1)
    swift_once();
  swift_weakAssign();
  sub_21DE82040();
LABEL_19:
  v29(v16, v5);
  return ((uint64_t (*)(char *, uint64_t))v29)(v18, v5);
}

uint64_t sub_21DE74B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD v12[2];
  _BYTE v13[32];

  v2 = sub_21DE81C80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE76094(a1, (uint64_t)v13);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = v12[0];
    v6 = v12[1];
    if (qword_2553AE7E0 != -1)
      swift_once();
    if (swift_weakLoadStrong())
    {
      sub_21DE74D24(v7, v6);
      sub_21DE76114(v7, v6);
      return swift_release();
    }
    else
    {
      return sub_21DE76114(v7, v6);
    }
  }
  else
  {
    sub_21DE75914();
    sub_21DE81F98();
    v9 = sub_21DE81C74();
    v10 = sub_21DE81F38();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21DE73000, v9, v10, "Error: Received non-Data result from _ler_send_log_data.", v11, 2u);
      MEMORY[0x2207A5858](v11, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_21DE74D24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v3 = v2;
  v30 = a1;
  v31 = a2;
  v4 = sub_21DE81E78();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21DE81E90();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81C80();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE75914();
  sub_21DE81F98();
  v15 = sub_21DE81C74();
  v16 = sub_21DE81F2C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v29 = v10;
    v18 = v7;
    v19 = v4;
    v20 = v3;
    v21 = v5;
    v22 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21DE73000, v15, v16, "PlaygroundLoggerProbePoint did receive logger data.", v17, 2u);
    v23 = v22;
    v5 = v21;
    v3 = v20;
    v4 = v19;
    v7 = v18;
    v10 = v29;
    MEMORY[0x2207A5858](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v24 = (_QWORD *)swift_allocObject();
  v26 = v30;
  v25 = v31;
  v24[2] = v30;
  v24[3] = v25;
  v24[4] = v3;
  aBlock[4] = sub_21DE76184;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DE750B0;
  aBlock[3] = &block_descriptor;
  v27 = _Block_copy(aBlock);
  sub_21DE761A8(v26, v25);
  swift_retain();
  sub_21DE81E84();
  v34 = MEMORY[0x24BEE4AF8];
  sub_21DE761EC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE940);
  sub_21DE76234();
  sub_21DE81FEC();
  MEMORY[0x2207A5420](0, v10, v7, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
  return swift_release();
}

uint64_t sub_21DE74FE4()
{
  _BYTE v1[32];

  swift_unknownObjectRetain();
  sub_21DE81FC8();
  swift_unknownObjectRelease();
  sub_21DE74B7C((uint64_t)v1);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v1);
}

uint64_t sub_21DE7502C(uint64_t result, unint64_t a2, uint64_t a3)
{
  void (*v3)(uint64_t, unint64_t, _QWORD);
  uint64_t v5;

  v3 = *(void (**)(uint64_t, unint64_t, _QWORD))(a3
                                                                + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  if (v3)
  {
    v5 = result;
    sub_21DE761A8(result, a2);
    sub_21DE762C4((uint64_t)v3);
    v3(v5, a2, 0);
    sub_21DE762D4((uint64_t)v3);
    return sub_21DE76114(v5, a2);
  }
  return result;
}

uint64_t sub_21DE750B0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21DE750DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_21DE81C80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21DE82034();
  v8 = v7;
  sub_21DE75914();
  sub_21DE81F98();
  sub_21DE762C4(v6);
  sub_21DE762C4(v6);
  v9 = sub_21DE81C74();
  v10 = sub_21DE81F2C();
  if (os_log_type_enabled(v9, v10))
  {
    v22 = v1;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v25 = v12;
    *(_DWORD *)v11 = 136315138;
    v21 = v2;
    if (v6)
    {
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = v6;
      *(_QWORD *)(v13 + 24) = v8;
      v14 = sub_21DE76348;
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    v23 = (uint64_t)v14;
    v24 = v13;
    sub_21DE762C4(v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE950);
    v15 = sub_21DE81EF0();
    v23 = sub_21DE75A24(v15, v16, &v25);
    sub_21DE81FB0();
    swift_bridgeObjectRelease();
    sub_21DE762D4(v6);
    sub_21DE762D4(v6);
    _os_log_impl(&dword_21DE73000, v9, v10, "setupPlaygroundPrintHook() existing playgroundPrintHook: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v12, -1, -1);
    MEMORY[0x2207A5858](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  }
  else
  {
    sub_21DE762D4(v6);
    sub_21DE762D4(v6);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v17 = swift_allocObject();
  swift_weakInit();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v6;
  v18[3] = v8;
  v18[4] = v17;
  return sub_21DE82040();
}

uint64_t sub_21DE75384(_QWORD *a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  return a2(*a1, a1[1]);
}

void sub_21DE753B0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void (**v14)(void);
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  void (*v20)(void);
  void *v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];

  v6 = sub_21DE81C80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3(a1, a2);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    v10 = sub_21DE81E18();
    swift_endAccess();
    swift_release();
    if ((v10 & 1) != 0)
    {
      sub_21DE75914();
      sub_21DE81F98();
      v11 = sub_21DE81C74();
      v12 = sub_21DE81F2C();
      v13 = os_log_type_enabled(v11, v12);
      v14 = (void (**)(void))MEMORY[0x24BE603F8];
      if (v13)
      {
        v15 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v25[0] = v23;
        *(_DWORD *)v15 = 136315138;
        v22[1] = v15 + 4;
        v24 = *MEMORY[0x24BE603F8];
        __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE958);
        v16 = sub_21DE81EF0();
        v24 = sub_21DE75A24(v16, v17, v25);
        sub_21DE81FB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21DE73000, v11, v12, "setupPlaygroundPrintHook() sending printed string to _ler_print_hook: %s", v15, 0xCu);
        v18 = v23;
        swift_arrayDestroy();
        MEMORY[0x2207A5858](v18, -1, -1);
        v19 = v15;
        v14 = (void (**)(void))MEMORY[0x24BE603F8];
        MEMORY[0x2207A5858](v19, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v20 = *v14;
      if (*v14)
      {
        v21 = (void *)sub_21DE81EC0();
        v20();

      }
    }
  }
}

uint64_t sub_21DE75624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_config;
  v2 = sub_21DE81E3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_21DE762D4(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler));
  return swift_deallocClassInstance();
}

uint64_t sub_21DE75690()
{
  return type metadata accessor for PlaygroundLoggerProbePoint();
}

uint64_t type metadata accessor for PlaygroundLoggerProbePoint()
{
  uint64_t result;

  result = qword_2553AE820;
  if (!qword_2553AE820)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21DE756D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DE81E3C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_21DE7575C()
{
  unint64_t result;

  result = qword_2553AE8B8;
  if (!qword_2553AE8B8)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82BD4, &type metadata for PlaygroundLoggerProbePointConfiguration_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AE8B8);
  }
  return result;
}

unint64_t sub_21DE757A4()
{
  unint64_t result;

  result = qword_2553AE8C0;
  if (!qword_2553AE8C0)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE825D4, &type metadata for PlaygroundLoggerSample_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AE8C0);
  }
  return result;
}

unint64_t sub_21DE757E8()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21DE75804(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_21DE743F8(a1, a2);
  return v4;
}

uint64_t sub_21DE75850()
{
  *MEMORY[0x24BE60400] = 0;
  if (qword_2553AE7E0 != -1)
    swift_once();
  return swift_weakAssign();
}

uint64_t sub_21DE758A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, char);
  uint64_t (**v6)(uint64_t, uint64_t, char);
  uint64_t v7;

  if (a1)
  {
    v4 = a1;
    a1 = swift_allocObject();
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = a2;
    v5 = sub_21DE76394;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t (**)(uint64_t, uint64_t, char))(v2
                                                       + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  v7 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC25LiveExecutionResultsProbe26PlaygroundLoggerProbePoint_probeSampleGenerationHandler);
  *v6 = v5;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t, char))a1;
  return sub_21DE762D4(v7);
}

uint64_t sub_21DE7590C()
{
  return sub_21DE7460C();
}

unint64_t sub_21DE75914()
{
  unint64_t result;

  result = qword_2553AE928;
  if (!qword_2553AE928)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553AE928);
  }
  return result;
}

uint64_t sub_21DE75950(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21DE75960(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21DE75994(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DE759B4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21DE75A24(v6, v7, a3);
  v8 = *a1 + 8;
  sub_21DE81FB0();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21DE75A24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21DE75AF4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21DE76094((uint64_t)v12, *a3);
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
      sub_21DE76094((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21DE75AF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21DE81FBC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21DE75CAC(a5, a6);
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
  v8 = sub_21DE82010();
  if (!v8)
  {
    sub_21DE8201C();
    __break(1u);
LABEL_17:
    result = sub_21DE82028();
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

uint64_t sub_21DE75CAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21DE75D40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21DE75F18(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21DE75F18(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DE75D40(uint64_t a1, unint64_t a2)
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
      v3 = sub_21DE75EB4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21DE81FF8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21DE8201C();
      __break(1u);
LABEL_10:
      v2 = sub_21DE81F08();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21DE82028();
    __break(1u);
LABEL_14:
    result = sub_21DE8201C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21DE75EB4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE930);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21DE75F18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE930);
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
  result = sub_21DE82028();
  __break(1u);
  return result;
}

_BYTE **sub_21DE76064(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
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

uint64_t sub_21DE76094(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207A57D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DE76114(uint64_t a1, unint64_t a2)
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

uint64_t sub_21DE76158()
{
  uint64_t v0;

  sub_21DE76114(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE76184()
{
  uint64_t v0;

  return sub_21DE7502C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
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

uint64_t sub_21DE761A8(uint64_t a1, unint64_t a2)
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

unint64_t sub_21DE761EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AE938;
  if (!qword_2553AE938)
  {
    v1 = sub_21DE81E78();
    result = MEMORY[0x2207A57EC](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2553AE938);
  }
  return result;
}

unint64_t sub_21DE76234()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AE948;
  if (!qword_2553AE948)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2553AE940);
    result = MEMORY[0x2207A57EC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2553AE948);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207A57E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DE762C4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21DE762D4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21DE762E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21DE76308()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21DE7633C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21DE753B0(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_21DE76348(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_21DE76370()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE76394(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];
  char v7;

  v4 = *(uint64_t (**)(_QWORD *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_21DE763D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_21DE81C14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = sub_21DE77DC0((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t sub_21DE76480()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = off_2553AED60;
  off_2553AED60 = 0;
  qword_2553AED68 = 0;
  sub_21DE762D4((uint64_t)v1);

  sub_21DE765B4(v0 + qword_2553AEC58);
  v2 = v0 + qword_2553AEC60;
  v3 = sub_21DE81BD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  sub_21DE762D4(*(_QWORD *)(v0 + qword_2553AEFA8));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LoggingStreamAgent()
{
  uint64_t result;

  result = qword_2553AE988;
  if (!qword_2553AE988)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21DE76580()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21DE765B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEAB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DE765F8(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return sub_21DE761A8(a1, a2);
}

uint64_t sub_21DE76608(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return sub_21DE76114(a1, a2);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport()
{
  return &type metadata for PlaygroundLoggerSample_Transport;
}

uint64_t sub_21DE7664C()
{
  return MEMORY[0x24BE76520];
}

uint64_t sub_21DE76658(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD00000000000001DLL;
  else
    return 0x6144726567676F6CLL;
}

uint64_t sub_21DE76698(char *a1, char *a2)
{
  return sub_21DE766A4(*a1, *a2);
}

uint64_t sub_21DE766A4(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD00000000000001DLL;
  else
    v3 = 0x6144726567676F6CLL;
  if (v2)
    v4 = 0xEA00000000006174;
  else
    v4 = 0x800000021DE835B0;
  if ((a2 & 1) != 0)
    v5 = 0xD00000000000001DLL;
  else
    v5 = 0x6144726567676F6CLL;
  if ((a2 & 1) != 0)
    v6 = 0x800000021DE835B0;
  else
    v6 = 0xEA00000000006174;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21DE82064();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21DE7674C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6F4C656372756F73;
    else
      v3 = 0xD000000000000011;
    if (v2 == 1)
      v4 = 0xEE006E6F69746163;
    else
      v4 = 0x800000021DE836A0;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6F4C656372756F73;
      else
        v6 = 0xD000000000000011;
      if (v5 == 1)
        v7 = 0xEE006E6F69746163;
      else
        v7 = 0x800000021DE836A0;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v3 = 0x696D697263736964;
    v4 = 0xEC000000746E616ELL;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    v8 = sub_21DE82064();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21DE76880(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000011;
  else
    v3 = 0x6F4C656372756F73;
  if (v2)
    v4 = 0xEE006E6F69746163;
  else
    v4 = 0x800000021DE836A0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000011;
  else
    v5 = 0x6F4C656372756F73;
  if ((a2 & 1) != 0)
    v6 = 0x800000021DE836A0;
  else
    v6 = 0xEE006E6F69746163;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21DE82064();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_21DE76930(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21DE7697C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21DE769E0 + 4 * byte_21DE82574[a2]))(0x68746150656C6966);
}

uint64_t sub_21DE769E0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x68746150656C6966 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_21DE82064();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_21DE76A88(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aString_1[8 * a1] == *(_QWORD *)&aString_1[8 * a2]
    && *(_QWORD *)&aTimestamlogsou[8 * a1 + 24] == *(_QWORD *)&aTimestamlogsou[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_21DE82064();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_21DE76B0C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD00000000000001CLL;
  else
    v3 = 0xD000000000000010;
  if (v2)
    v4 = 0x800000021DE83620;
  else
    v4 = 0x800000021DE83640;
  if ((a2 & 1) != 0)
    v5 = 0xD00000000000001CLL;
  else
    v5 = 0xD000000000000010;
  if ((a2 & 1) != 0)
    v6 = 0x800000021DE83640;
  else
    v6 = 0x800000021DE83620;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21DE82064();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21DE76BB4()
{
  return sub_21DE76BBC();
}

uint64_t sub_21DE76BBC()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE76C44()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE76CAC()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

void sub_21DE76D30(char a1)
{
  sub_21DE8207C();
  __asm { BR              X10 }
}

uint64_t sub_21DE76D84()
{
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE76DF4()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE76E84()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE76F3C()
{
  return sub_21DE76F44();
}

uint64_t sub_21DE76F44()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE76FA4()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE77034()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

void sub_21DE7709C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21DE770E0()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE7713C()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE7717C()
{
  return sub_21DE77468();
}

uint64_t sub_21DE77184()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE77204()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

void sub_21DE77268(uint64_t a1, char a2)
{
  sub_21DE8207C();
  __asm { BR              X10 }
}

uint64_t sub_21DE772B8()
{
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE77328()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE773B4()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE77468()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  swift_bridgeObjectRelease();
  return sub_21DE82094();
}

uint64_t sub_21DE774EC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21DE8204C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_21DE77548@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21DE76658(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21DE77570()
{
  char *v0;

  return sub_21DE76658(*v0);
}

uint64_t sub_21DE77578(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;

  v3 = *(_QWORD *)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(unsigned __int8 *)(v1 + 16);
  MEMORY[0x24BDAC7A8](a1);
  if (v4 == 1)
    sub_21DE765F8(v3, v2, 1);
  else
    sub_21DE765F8(v3, v2, 0);
  sub_21DE77750();
  sub_21DE81C08();
  return sub_21DE76608(v3, v2, v4);
}

double sub_21DE77684@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  double result;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  __int128 v10;

  v8 = &type metadata for PlaygroundLoggerSample_Transport.Key;
  v9 = sub_21DE77750();
  v7[0] = 0;
  sub_21DE81BF0();
  v5 = sub_21DE81C14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if (!v2)
  {
    result = *(double *)&v10;
    *(_OWORD *)a2 = v10;
    *(_BYTE *)(a2 + 16) = 0;
  }
  return result;
}

unint64_t sub_21DE77750()
{
  unint64_t result;

  result = qword_2553AEAC0;
  if (!qword_2553AEAC0)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE826C0, &type metadata for PlaygroundLoggerSample_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEAC0);
  }
  return result;
}

uint64_t sub_21DE77794(_BYTE *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  *a1 = 1;
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21DE777AC(_BYTE *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  *a1 = 0;
  *a2 = v3;
  a2[1] = v4;
  return sub_21DE761A8(v3, v4);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerSample_Transport.Key(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlaygroundLoggerSample_Transport.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE778B0 + 4 * byte_21DE82589[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DE778E4 + 4 * byte_21DE82584[v4]))();
}

uint64_t sub_21DE778E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE778EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE778F4);
  return result;
}

uint64_t sub_21DE77900(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE77908);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DE7790C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE77914(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE77920(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21DE7792C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport.Key()
{
  return &type metadata for PlaygroundLoggerSample_Transport.Key;
}

uint64_t destroy for PlaygroundLoggerSample_Transport.Payload(uint64_t a1)
{
  return sub_21DE76608(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21DE765F8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21DE765F8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_21DE76608(v6, v7, v8);
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_21DE76608(v4, v5, v6);
  return a1;
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s25LiveExecutionResultsProbe32PlaygroundLoggerSample_TransportV7PayloadOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21DE77AC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_21DE77ACC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample_Transport.Payload()
{
  return &type metadata for PlaygroundLoggerSample_Transport.Payload;
}

unint64_t sub_21DE77AEC()
{
  unint64_t result;

  result = qword_2553AEAC8[0];
  if (!qword_2553AEAC8[0])
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82698, &type metadata for PlaygroundLoggerSample_Transport.Key);
    atomic_store(result, qword_2553AEAC8);
  }
  return result;
}

uint64_t sub_21DE77B34(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)(v1 + qword_2553AEC68);
  if (*(_QWORD *)(v1 + qword_2553AEC68 + 8))
  {
    v3 = *v2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a1);
    v3 = sub_21DE81EF0();
    *v2 = v3;
    v2[1] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_21DE77BCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_21DE81C14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = sub_21DE78204((uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t sub_21DE77C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *MEMORY[0x24BE60400] = 0;
  v1 = qword_2553AE7E0;
  swift_retain();
  if (v1 != -1)
    swift_once();
  swift_weakAssign();
  swift_release();

  sub_21DE765B4(v0 + qword_2553AEC58);
  v2 = v0 + qword_2553AEC60;
  v3 = sub_21DE81BD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  sub_21DE762D4(*(_QWORD *)(v0 + qword_2553AEFA8));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PlaygroundLoggerStreamAgent()
{
  uint64_t result;

  result = qword_2553AEAF8;
  if (!qword_2553AEAF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21DE77DC0(uint64_t a1)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v30 = a1;
  v3 = sub_21DE81C80();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21DE81C14();
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21DE81F5C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81F50();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_21DE81E90();
  MEMORY[0x24BDAC7A8](v12);
  sub_21DE786DC(0, &qword_2553AEC28);
  sub_21DE81E84();
  v37 = MEMORY[0x24BEE4AF8];
  sub_21DE78648();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEC38);
  sub_21DE78690();
  v14 = v29;
  v13 = v30;
  sub_21DE81FEC();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5750], v7);
  *(_QWORD *)(v1 + 16) = sub_21DE81F80();
  v15 = v1 + qword_2553AEC58;
  v16 = sub_21DE81BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_21DE81BCC();
  v17 = (_QWORD *)(v2 + qword_2553AEC68);
  *v17 = 0;
  v17[1] = 0;
  v18 = (_QWORD *)(v2 + qword_2553AEFA8);
  *v18 = 0;
  v18[1] = 0;
  v19 = *(void **)(v2 + 16);
  v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v31, v13, v35);
  type metadata accessor for LoggingProbePoint();
  swift_allocObject();
  *(_QWORD *)(v2 + qword_2553AEFB0) = sub_21DE7BC30(v19, v20);
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F8C();
  swift_retain_n();
  v21 = sub_21DE81C74();
  v22 = sub_21DE81F20();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v37 = v24;
    *(_DWORD *)v23 = 136446210;
    v25 = sub_21DE77B34(&qword_2553AEC50);
    v36 = sub_21DE75A24(v25, v26, &v37);
    sub_21DE81FB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE73000, v21, v22, "Initialize agent: %{public}s)", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v24, -1, -1);
    MEMORY[0x2207A5858](v23, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v13, v35);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
  return v2;
}

uint64_t sub_21DE78204(uint64_t a1)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v30 = a1;
  v3 = sub_21DE81C80();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21DE81C14();
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21DE81F5C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81F50();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_21DE81E90();
  MEMORY[0x24BDAC7A8](v12);
  sub_21DE786DC(0, &qword_2553AEC28);
  sub_21DE81E84();
  v37 = MEMORY[0x24BEE4AF8];
  sub_21DE78648();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEC38);
  sub_21DE78690();
  v14 = v29;
  v13 = v30;
  sub_21DE81FEC();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5750], v7);
  *(_QWORD *)(v1 + 16) = sub_21DE81F80();
  v15 = v1 + qword_2553AEC58;
  v16 = sub_21DE81BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_21DE81BCC();
  v17 = (_QWORD *)(v2 + qword_2553AEC68);
  *v17 = 0;
  v17[1] = 0;
  v18 = (_QWORD *)(v2 + qword_2553AEFA8);
  *v18 = 0;
  v18[1] = 0;
  v19 = *(void **)(v2 + 16);
  v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v31, v13, v35);
  type metadata accessor for PlaygroundLoggerProbePoint();
  swift_allocObject();
  *(_QWORD *)(v2 + qword_2553AEFB0) = sub_21DE743F8(v19, v20);
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F8C();
  swift_retain_n();
  v21 = sub_21DE81C74();
  v22 = sub_21DE81F20();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v37 = v24;
    *(_DWORD *)v23 = 136446210;
    v25 = sub_21DE77B34(&qword_2553AEC48);
    v36 = sub_21DE75A24(v25, v26, &v37);
    sub_21DE81FB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE73000, v21, v22, "Initialize agent: %{public}s)", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v24, -1, -1);
    MEMORY[0x2207A5858](v23, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v13, v35);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
  return v2;
}

unint64_t sub_21DE78648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AEC30;
  if (!qword_2553AEC30)
  {
    v1 = sub_21DE81F50();
    result = MEMORY[0x2207A57EC](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2553AEC30);
  }
  return result;
}

unint64_t sub_21DE78690()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AEC40;
  if (!qword_2553AEC40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2553AEC38);
    result = MEMORY[0x2207A57EC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2553AEC40);
  }
  return result;
}

uint64_t sub_21DE786DC(uint64_t a1, unint64_t *a2)
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

void sub_21DE78718()
{
  unint64_t v0;
  unint64_t v1;

  sub_21DE78F50();
  if (v0 <= 0x3F)
  {
    sub_21DE81BD8();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

id *sub_21DE787C4()
{
  id *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  char *v5;
  uint64_t v6;

  v1 = v0;
  v3 = *((_QWORD *)*v0 + 10);
  v2 = *((_QWORD *)*v0 + 11);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 56);
  swift_unknownObjectRetain();
  v4(v3, v2);
  swift_unknownObjectRelease();

  sub_21DE7AACC((uint64_t)v0 + qword_2553AEC58, &qword_2553AEAB8);
  v5 = (char *)v0 + qword_2553AEC60;
  v6 = sub_21DE81BD8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_21DE762D4(*(uint64_t *)((char *)v1 + qword_2553AEFA8));
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_21DE788A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (uint64_t *)(v4 + qword_2553AEC68);
  if (*(_QWORD *)(v4 + qword_2553AEC68 + 8))
  {
    v6 = *v5;
  }
  else
  {
    type metadata accessor for AbstractProbePointStreamAgent(255, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
    swift_getMetatypeMetadata();
    v6 = sub_21DE81EF0();
    *v5 = v6;
    v5[1] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_21DE7893C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);

  v3 = *v2;
  v4 = (uint64_t *)((char *)v2 + qword_2553AEFA8);
  v5 = *(uint64_t *)((char *)v2 + qword_2553AEFA8);
  *v4 = a1;
  v4[1] = a2;
  swift_retain();
  sub_21DE762D4(v5);
  v6 = swift_allocObject();
  swift_weakInit();
  v7 = (_QWORD *)swift_allocObject();
  v8 = *(_QWORD *)(v3 + 80);
  v7[2] = v8;
  v9 = *(_QWORD *)(v3 + 88);
  v7[3] = v9;
  v7[4] = v6;
  v10 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v9 + 72);
  swift_unknownObjectRetain();
  swift_retain();
  v10(sub_21DE7AB6C, v7, v8, v9);
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_21DE78A24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 88);
  swift_unknownObjectRetain();
  v5(a1, v4, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_21DE78A84(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_21DE78AC0(a1);
  return v2;
}

_QWORD *sub_21DE78AC0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  char *v22;
  uint64_t (*v23)(id, char *, uint64_t, uint64_t);
  id v24;
  uint64_t v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v2 = v1;
  v40 = a1;
  v3 = *v1;
  v4 = sub_21DE81C80();
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21DE81C14();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21DE81F5C();
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81F50();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v11);
  v13 = sub_21DE81E90();
  MEMORY[0x24BDAC7A8](v13);
  v37[2] = sub_21DE786DC(0, &qword_2553AEC28);
  v14 = *(_QWORD *)(v3 + 80);
  v15 = *(_QWORD *)(v3 + 88);
  v37[1] = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 40))(v14, v15);
  sub_21DE81E84();
  v48 = MEMORY[0x24BEE4AF8];
  sub_21DE7AB08((unint64_t *)&qword_2553AEC30, v12, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEC38);
  sub_21DE78690();
  sub_21DE81FEC();
  (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v10, *MEMORY[0x24BEE5750], v39);
  v16 = v40;
  v2[2] = sub_21DE81F80();
  v17 = (char *)v2 + qword_2553AEC58;
  v18 = sub_21DE81BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_21DE81BCC();
  v19 = (_QWORD *)((char *)v2 + qword_2553AEC68);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)((char *)v2 + qword_2553AEFA8);
  *v20 = 0;
  v20[1] = 0;
  v21 = (void *)v2[2];
  v22 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v41, v16, v46);
  v23 = *(uint64_t (**)(id, char *, uint64_t, uint64_t))(v15 + 48);
  v24 = v21;
  v25 = v15;
  v26 = v42;
  *(_QWORD *)((char *)v2 + qword_2553AEFB0) = v23(v24, v22, v14, v25);
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F8C();
  swift_retain_n();
  v27 = sub_21DE81C74();
  v28 = sub_21DE81F20();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v48 = v30;
    *(_DWORD *)v29 = 136446210;
    v34 = sub_21DE788A0(v30, v31, v32, v33);
    v47 = sub_21DE75A24(v34, v35, &v48);
    sub_21DE81FB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE73000, v27, v28, "Initialize agent: %{public}s)", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v30, -1, -1);
    MEMORY[0x2207A5858](v29, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v16, v46);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
  return v2;
}

uint64_t sub_21DE78F20()
{
  sub_21DE787C4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AbstractProbePointStreamAgent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AbstractProbePointStreamAgent);
}

void sub_21DE78F50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2553AECF0)
  {
    sub_21DE81BD8();
    v0 = sub_21DE81FA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2553AECF0);
  }
}

uint64_t sub_21DE78FA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  id v13;
  void (*v14)(uint64_t);
  NSObject *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;

  v2 = sub_21DE81C80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21DE81E9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v11 = result;
    v12 = *(void **)(result + 16);
    *v9 = v12;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
    v13 = v12;
    LOBYTE(v12) = sub_21DE81EA8();
    result = (*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
    if ((v12 & 1) != 0)
    {
      v14 = *(void (**)(uint64_t))(v11 + qword_2553AEFA8);
      if (v14)
      {
        swift_retain();
        v14(a1);
        sub_21DE762D4((uint64_t)v14);
        return swift_release();
      }
      else
      {
        sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
        sub_21DE81F8C();
        v15 = sub_21DE81C74();
        v16 = sub_21DE81F38();
        if (os_log_type_enabled(v15, (os_log_type_t)v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_21DE73000, v15, (os_log_type_t)v16, "Error: Unable to send probe sample without stream.", v17, 2u);
          MEMORY[0x2207A5858](v17, -1, -1);
          swift_release();

        }
        else
        {

          swift_release();
        }
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_21DE791D0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;

  v46 = a1;
  v2 = *v1;
  v44 = sub_21DE81BD8();
  v47 = *(_QWORD *)(v44 - 8);
  v3 = MEMORY[0x24BDAC7A8](v44);
  v42 = v4;
  v43 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v37 - v5;
  v6 = sub_21DE81C80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F8C();
  swift_retain_n();
  v10 = sub_21DE81C74();
  v11 = sub_21DE81F44();
  if (os_log_type_enabled(v10, v11))
  {
    v41 = v6;
    v12 = swift_slowAlloc();
    v45 = v2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v50 = v14;
    *(_DWORD *)v13 = 136315138;
    v18 = sub_21DE788A0(v14, v15, v16, v17);
    v49 = sub_21DE75A24(v18, v19, &v50);
    sub_21DE81FB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE73000, v10, v11, "%s handleMessageStream", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v14, -1, -1);
    v20 = v13;
    v2 = v45;
    MEMORY[0x2207A5858](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v41);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v22 = *(_QWORD *)(v2 + 80);
  v21 = *(_QWORD *)(v2 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  v23 = swift_allocObject();
  swift_weakInit();
  v24 = (_QWORD *)swift_allocObject();
  v40 = v1;
  v24[2] = v22;
  v24[3] = v21;
  v24[4] = v23;
  v41 = v21;
  swift_getAssociatedConformanceWitness();
  v38 = v22;
  swift_getAssociatedConformanceWitness();
  swift_retain();
  v45 = sub_21DE81B84();
  swift_release();
  swift_release();
  v25 = v48;
  sub_21DE81BCC();
  v26 = swift_allocObject();
  swift_weakInit();
  v27 = v47;
  v39 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  v29 = v43;
  v28 = v44;
  v39(v43, v25, v44);
  v30 = (*(unsigned __int8 *)(v27 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v31 = (char *)swift_allocObject();
  *((_QWORD *)v31 + 2) = v22;
  v32 = v41;
  *((_QWORD *)v31 + 3) = v41;
  *((_QWORD *)v31 + 4) = v26;
  v33 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v33(&v31[v30], v29, v28);
  sub_21DE81C68();
  swift_release();
  v34 = swift_allocObject();
  swift_weakInit();
  v39(v29, v48, v28);
  v35 = (char *)swift_allocObject();
  *((_QWORD *)v35 + 2) = v38;
  *((_QWORD *)v35 + 3) = v32;
  *((_QWORD *)v35 + 4) = v34;
  v33(&v35[v30], v29, v28);
  sub_21DE81BC0();
  sub_21DE7AB08(&qword_2553AECF8, (uint64_t (*)(uint64_t))MEMORY[0x24BE77240], MEMORY[0x24BE771D8]);
  swift_retain();
  sub_21DE81C20();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v28);
  return swift_release();
}

uint64_t sub_21DE796F4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
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
  char *v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  int v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v48 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v41 - v8;
  v10 = sub_21DE81C80();
  v49 = *(_QWORD *)(v10 - 8);
  v50 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED18);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v41 - v17;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
    sub_21DE81F8C();
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v47(v9, a1, AssociatedTypeWitness);
    swift_retain_n();
    v19 = sub_21DE81C74();
    v20 = sub_21DE81F2C();
    v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v22 = swift_slowAlloc();
      v46 = a2;
      v23 = v22;
      v24 = swift_slowAlloc();
      v44 = v24;
      v52 = v24;
      *(_DWORD *)v23 = 136446722;
      v43 = v19;
      v42 = v21;
      v28 = sub_21DE788A0(v24, v25, v26, v27);
      v51 = sub_21DE75A24(v28, v29, &v52);
      v45 = a1;
      sub_21DE81FB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      v41[1] = v23 + 14;
      sub_21DE81BD8();
      sub_21DE7AB08(&qword_2553AED10, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], MEMORY[0x24BE76218]);
      v30 = sub_21DE82058();
      v51 = sub_21DE75A24(v30, v31, &v52);
      sub_21DE81FB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 22) = 2082;
      v47(v48, (uint64_t)v9, AssociatedTypeWitness);
      v32 = sub_21DE81EF0();
      v51 = sub_21DE75A24(v32, v33, &v52);
      a1 = v45;
      sub_21DE81FB0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v9, AssociatedTypeWitness);
      v19 = v43;
      _os_log_impl(&dword_21DE73000, v43, (os_log_type_t)v42, "%{public}s-%{public}s received message: %{public}s.", (uint8_t *)v23, 0x20u);
      v34 = v44;
      swift_arrayDestroy();
      MEMORY[0x2207A5858](v34, -1, -1);
      v35 = v23;
      a2 = v46;
      MEMORY[0x2207A5858](v35, -1, -1);
    }
    else
    {
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v9, AssociatedTypeWitness);
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v50);
    sub_21DE78A24(a1);
    sub_21DE7AA88(a2, (uint64_t)v16, &qword_2553AED18);
    v39 = sub_21DE81BB4();
    v40 = *(_QWORD *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v16, 1, v39) == 1)
    {
      swift_release();
      return sub_21DE7AACC((uint64_t)v16, &qword_2553AED18);
    }
    else
    {
      sub_21DE81BA8();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v16, v39);
    }
  }
  else
  {
    sub_21DE7AA88(a2, (uint64_t)v18, &qword_2553AED18);
    v36 = sub_21DE81BB4();
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v18, 1, v36) == 1)
    {
      return sub_21DE7AACC((uint64_t)v18, &qword_2553AED18);
    }
    else
    {
      sub_21DE81BA8();
      return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v18, v36);
    }
  }
}

uint64_t sub_21DE79BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t result;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[12];
  int v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE *v51;
  void (*v52)(_BYTE *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[3];

  v58 = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEAB8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = &v46[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v46[-v12];
  swift_getAssociatedTypeWitness();
  v59 = a4;
  v60 = a5;
  swift_getAssociatedConformanceWitness();
  v57 = sub_21DE81B9C();
  v14 = *(_QWORD *)(v57 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v57);
  v56 = &v46[-v16];
  v17 = sub_21DE81BD8();
  v61 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = &v46[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = sub_21DE81C80();
  v54 = *(_QWORD *)(v20 - 8);
  v55 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = &v46[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v24 = result;
    v53 = v15;
    sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
    sub_21DE81F8C();
    v52 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v61 + 16);
    v52(v19, a3, v17);
    swift_retain_n();
    v25 = sub_21DE81C74();
    v26 = sub_21DE81F44();
    v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v28 = swift_slowAlloc();
      v49 = v13;
      v29 = v28;
      v30 = swift_slowAlloc();
      v48 = v30;
      v63[0] = v30;
      *(_DWORD *)v29 = 136446466;
      v50 = a3;
      v47 = v27;
      v34 = sub_21DE788A0(v30, v31, v32, v33);
      v62 = sub_21DE75A24(v34, v35, v63);
      v51 = v11;
      sub_21DE81FB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      sub_21DE7AB08(&qword_2553AED10, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], MEMORY[0x24BE76218]);
      v36 = sub_21DE82058();
      v62 = sub_21DE75A24(v36, v37, v63);
      a3 = v50;
      v11 = v51;
      sub_21DE81FB0();
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v19, v17);
      _os_log_impl(&dword_21DE73000, v25, (os_log_type_t)v47, "%{public}s-%{public}s messageStream.open success", (uint8_t *)v29, 0x16u);
      v38 = v48;
      swift_arrayDestroy();
      MEMORY[0x2207A5858](v38, -1, -1);
      v39 = v29;
      v13 = v49;
      MEMORY[0x2207A5858](v39, -1, -1);
    }
    else
    {
      swift_release_n();
      (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v19, v17);
    }

    (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v22, v55);
    v41 = v56;
    v40 = v57;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v56, v58, v57);
    v42 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v43 = swift_allocObject();
    v44 = v60;
    *(_QWORD *)(v43 + 16) = v59;
    *(_QWORD *)(v43 + 24) = v44;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v14 + 32))(v43 + v42, v41, v40);
    sub_21DE7893C((uint64_t)sub_21DE7A954, v43);
    swift_release();
    v52(v13, a3, v17);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v13, 0, 1, v17);
    sub_21DE7A9F8((uint64_t)v13, (uint64_t)v11);
    v45 = v24 + qword_2553AEC58;
    swift_beginAccess();
    sub_21DE7AA40((uint64_t)v11, v45);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_21DE7A0C4()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_21DE81B9C();
  return sub_21DE81B90();
}

uint64_t sub_21DE7A15C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(uint64_t, uint64_t, uint64_t);
  _BYTE *v46;
  _BYTE *v47;
  char v48;
  _BYTE *v49;
  void (*v50)(_BYTE *, uint64_t);
  _QWORD *v51;
  uint64_t v52;
  _BYTE v53[12];
  int v54;
  uint64_t v55;
  _BYTE *v56;
  _BYTE *v57;
  void (*v58)(_BYTE *, uint64_t);
  void (*v59)(_BYTE *, uint64_t, uint64_t);
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68[3];

  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED00);
  MEMORY[0x24BDAC7A8](v65);
  v4 = &v53[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEAB8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v66 = &v53[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v53[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v53[-v11];
  v13 = sub_21DE81BD8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v53[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v19 = &v53[-v18];
  v20 = sub_21DE81C80();
  v63 = *(_QWORD *)(v20 - 8);
  v64 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = &v53[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v24 = result;
    v57 = v17;
    v61 = v12;
    v62 = v10;
    sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
    sub_21DE81F8C();
    v59 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16);
    v60 = a2;
    v59(v19, a2, v13);
    swift_retain_n();
    v25 = v24;
    v26 = sub_21DE81C74();
    v27 = sub_21DE81F44();
    v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = swift_slowAlloc();
      v56 = v4;
      v30 = v29;
      v31 = swift_slowAlloc();
      v55 = v31;
      v68[0] = v31;
      *(_DWORD *)v30 = 136446466;
      v54 = v28;
      v35 = sub_21DE788A0(v31, v32, v33, v34);
      v67 = sub_21DE75A24(v35, v36, v68);
      sub_21DE81FB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      sub_21DE7AB08(&qword_2553AED10, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], MEMORY[0x24BE76218]);
      v37 = sub_21DE82058();
      v67 = sub_21DE75A24(v37, v38, v68);
      sub_21DE81FB0();
      swift_bridgeObjectRelease();
      v58 = *(void (**)(_BYTE *, uint64_t))(v14 + 8);
      v58(v19, v13);
      _os_log_impl(&dword_21DE73000, v26, (os_log_type_t)v54, "%{public}s-%{public}s messageStream invalidating", (uint8_t *)v30, 0x16u);
      v39 = v55;
      swift_arrayDestroy();
      MEMORY[0x2207A5858](v39, -1, -1);
      v40 = v30;
      v4 = v56;
      MEMORY[0x2207A5858](v40, -1, -1);
    }
    else
    {
      swift_release_n();
      v58 = *(void (**)(_BYTE *, uint64_t))(v14 + 8);
      v58(v19, v13);
    }

    (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v22, v64);
    v41 = v25 + qword_2553AEC58;
    swift_beginAccess();
    v42 = (uint64_t)v61;
    sub_21DE7AA88(v41, (uint64_t)v61, &qword_2553AEAB8);
    v43 = (uint64_t)v62;
    v59(v62, v60, v13);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v43, 0, 1, v13);
    v44 = (uint64_t)&v4[*(int *)(v65 + 48)];
    sub_21DE7AA88(v42, (uint64_t)v4, &qword_2553AEAB8);
    sub_21DE7AA88(v43, v44, &qword_2553AEAB8);
    v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    if (v45((uint64_t)v4, 1, v13) == 1)
    {
      sub_21DE7AACC(v43, &qword_2553AEAB8);
      sub_21DE7AACC(v42, &qword_2553AEAB8);
      if (v45(v44, 1, v13) == 1)
      {
        sub_21DE7AACC((uint64_t)v4, &qword_2553AEAB8);
LABEL_12:
        v51 = (_QWORD *)(v25 + qword_2553AEFA8);
        v52 = *(_QWORD *)(v25 + qword_2553AEFA8);
        *v51 = 0;
        v51[1] = 0;
        sub_21DE762D4(v52);
        return swift_release();
      }
    }
    else
    {
      sub_21DE7AA88((uint64_t)v4, (uint64_t)v66, &qword_2553AEAB8);
      if (v45(v44, 1, v13) != 1)
      {
        v46 = v57;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 32))(v57, v44, v13);
        sub_21DE7AB08(&qword_2553AED08, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], MEMORY[0x24BE76210]);
        v47 = v66;
        v48 = sub_21DE81EB4();
        v49 = v46;
        v50 = v58;
        v58(v49, v13);
        sub_21DE7AACC((uint64_t)v62, &qword_2553AEAB8);
        sub_21DE7AACC(v42, &qword_2553AEAB8);
        v50(v47, v13);
        sub_21DE7AACC((uint64_t)v4, &qword_2553AEAB8);
        if ((v48 & 1) != 0)
          goto LABEL_12;
        return swift_release();
      }
      sub_21DE7AACC((uint64_t)v62, &qword_2553AEAB8);
      sub_21DE7AACC(v42, &qword_2553AEAB8);
      v58(v66, v13);
    }
    sub_21DE7AACC((uint64_t)v4, &qword_2553AED00);
    return swift_release();
  }
  return result;
}

uint64_t sub_21DE7A744()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_21DE7A750()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21DE7A774(uint64_t a1, uint64_t a2)
{
  return sub_21DE796F4(a1, a2);
}

uint64_t sub_21DE7A784(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1[2];
  v4 = v1[3];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_21DE81BD8() - 8) + 80);
  return sub_21DE79BE0(a1, v1[4], (uint64_t)v1 + ((v5 + 40) & ~v5), v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21DE81BD8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21DE7A850()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_21DE81BD8() - 8) + 80);
  return sub_21DE7A15C(*(_QWORD *)(v0 + 32), v0 + ((v1 + 40) & ~v1));
}

uint64_t sub_21DE7A89C()
{
  uint64_t v0;
  uint64_t v1;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v1 = sub_21DE81B9C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_21DE7A954()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_21DE81B9C();
  return sub_21DE7A0C4();
}

uint64_t sub_21DE7A9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE7AA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE7AA88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21DE7AACC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21DE7AB08(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207A57EC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21DE7AB48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE7AB6C(uint64_t a1)
{
  return sub_21DE78FA4(a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207A5798](a1, v6, a5);
}

uint64_t initializeBufferWithCopyOfBuffer for SourceLocation_Transport(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21DE7ABD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for PrintSample_Transport(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = swift_bridgeObjectRelease();
  v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
    return sub_21DE7AC34(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v3 & 1);
  return result;
}

uint64_t sub_21DE7AC34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if ((a6 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    v7 = v5 & 1;
    v8 = *(_QWORD *)(a2 + 32);
    v9 = *(_QWORD *)(a2 + 40);
    v10 = *(_QWORD *)(a2 + 48);
    v11 = *(_QWORD *)(a2 + 56);
    v12 = *(_QWORD *)(a2 + 64);
    sub_21DE7ABD8(v8, v9, v10, v11, v12, v7);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = v10;
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v12;
    *(_BYTE *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  __int128 *v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;
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
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = (__int128 *)(a1 + 32);
  v5 = (__int128 *)(a2 + 32);
  v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      v9 = *v5;
      v10 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *v4 = v9;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      v23 = v6 & 1;
      v24 = *(_QWORD *)(a2 + 32);
      v25 = *(_QWORD *)(a2 + 40);
      v26 = *(_QWORD *)(a2 + 48);
      v27 = *(_QWORD *)(a2 + 56);
      v28 = *(_QWORD *)(a2 + 64);
      sub_21DE7ABD8(v24, v25, v26, v27, v28, v6 & 1);
      *(_QWORD *)(a1 + 32) = v24;
      *(_QWORD *)(a1 + 40) = v25;
      *(_QWORD *)(a1 + 48) = v26;
      *(_QWORD *)(a1 + 56) = v27;
      *(_QWORD *)(a1 + 64) = v28;
      *(_BYTE *)(a1 + 72) = v23;
    }
  }
  else if (v6 == 255)
  {
    sub_21DE7AE54(a1 + 32);
    v7 = *(_OWORD *)(a2 + 57);
    v8 = *(_OWORD *)(a2 + 48);
    *v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 57) = v7;
  }
  else
  {
    v11 = v6 & 1;
    v12 = *(_QWORD *)(a2 + 32);
    v13 = *(_QWORD *)(a2 + 40);
    v14 = *(_QWORD *)(a2 + 48);
    v15 = *(_QWORD *)(a2 + 56);
    v16 = *(_QWORD *)(a2 + 64);
    sub_21DE7ABD8(v12, v13, v14, v15, v16, v6 & 1);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_BYTE *)(a1 + 72);
    *(_QWORD *)(a1 + 32) = v12;
    *(_QWORD *)(a1 + 40) = v13;
    *(_QWORD *)(a1 + 48) = v14;
    *(_QWORD *)(a1 + 56) = v15;
    *(_QWORD *)(a1 + 64) = v16;
    *(_BYTE *)(a1 + 72) = v11;
    sub_21DE7AC34(v17, v18, v19, v20, v21, v22);
  }
  return a1;
}

uint64_t sub_21DE7AE54(uint64_t a1)
{
  destroy for SourceLocationInfo_Transport(a1);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PrintSample_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(unsigned __int8 *)(a1 + 72);
  if (v5 != 255)
  {
    v6 = *(unsigned __int8 *)(a2 + 72);
    if (v6 != 255)
    {
      v8 = v5 & 1;
      v9 = *(_QWORD *)(a2 + 64);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v15;
      *(_QWORD *)(a1 + 64) = v9;
      *(_BYTE *)(a1 + 72) = v6 & 1;
      sub_21DE7AC34(v10, v11, v12, v13, v14, v8);
      return a1;
    }
    sub_21DE7AE54(a1 + 32);
  }
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintSample_Transport(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 73))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintSample_Transport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 73) = 1;
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
    *(_BYTE *)(result + 73) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintSample_Transport()
{
  return &type metadata for PrintSample_Transport;
}

BOOL sub_21DE7B00C(char *a1, char *a2)
{
  return qword_21DE82AB8[*a1] == qword_21DE82AB8[*a2];
}

uint64_t sub_21DE7B030()
{
  sub_21DE8207C();
  sub_21DE82088();
  return sub_21DE82094();
}

uint64_t sub_21DE7B07C()
{
  return sub_21DE82088();
}

uint64_t sub_21DE7B0B0()
{
  sub_21DE8207C();
  sub_21DE82088();
  return sub_21DE82094();
}

uint64_t sub_21DE7B0F8@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_21DE7B5DC(*a1);
  *a2 = result;
  return result;
}

void sub_21DE7B120(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_21DE82AB8[*v1];
}

uint64_t sub_21DE7B138()
{
  sub_21DE7BBE4();
  return sub_21DE81C50();
}

uint64_t sub_21DE7B180()
{
  sub_21DE7BBE4();
  return sub_21DE81C5C();
}

uint64_t sub_21DE7B1E8(char a1)
{
  return *(_QWORD *)&aString_2[8 * a1];
}

uint64_t sub_21DE7B208(char *a1, char *a2)
{
  return sub_21DE76A88(*a1, *a2);
}

uint64_t sub_21DE7B214()
{
  return sub_21DE76C44();
}

uint64_t sub_21DE7B21C()
{
  return sub_21DE7713C();
}

uint64_t sub_21DE7B224()
{
  return sub_21DE77204();
}

uint64_t sub_21DE7B22C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21DE7B640();
  *a1 = result;
  return result;
}

uint64_t sub_21DE7B258@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21DE7B1E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21DE7B280()
{
  char *v0;

  return sub_21DE7B1E8(*v0);
}

uint64_t sub_21DE7B288(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _BYTE v6[48];
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _BYTE v13[48];

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = *((_BYTE *)a1 + 24);
  sub_21DE7B984((uint64_t)(a1 + 4), (uint64_t)v13);
  v12 = 0;
  v10 = v1;
  v11 = v2;
  v9 = 1;
  v7 = v3;
  v8 = 0;
  v6[47] = 2;
  v6[46] = v4;
  v6[45] = 3;
  sub_21DE7B984((uint64_t)v13, (uint64_t)v6);
  sub_21DE7B8B0();
  sub_21DE7B8F4();
  sub_21DE7B938();
  return sub_21DE81C2C();
}

uint64_t sub_21DE7B398()
{
  return sub_21DE81BFC();
}

__n128 sub_21DE7B3E0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[3];
  _OWORD v7[2];

  sub_21DE7B688(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_21DE7B428@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  __int128 v19;
  char v20;
  __int128 v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];
  uint64_t v26;
  char v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21DE81CBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21DE81CA4();
  v11 = v10;
  sub_21DE81CD4();
  v13 = v12;
  sub_21DE81CC8();
  v14 = sub_21DE81CB0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_21DE81C8C();
  v15 = sub_21DE81D28();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v4, 1, v15) == 1)
  {
    result = sub_21DE7B600((uint64_t)v4);
    v18 = 0;
    v19 = 0uLL;
    v20 = -1;
    v21 = 0uLL;
  }
  else
  {
    sub_21DE80838((uint64_t)v25);
    v23 = v25[1];
    v24 = v25[0];
    v18 = v26;
    v20 = v27;
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v4, v15);
    v21 = v23;
    v19 = v24;
  }
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = v11;
  v22 = 0x300020100uLL >> (8 * v14);
  if (v14 >= 5)
    LOBYTE(v22) = 0;
  *(_QWORD *)(a1 + 16) = v13;
  *(_BYTE *)(a1 + 24) = v22;
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)(a1 + 48) = v21;
  *(_QWORD *)(a1 + 64) = v18;
  *(_BYTE *)(a1 + 72) = v20;
  return result;
}

uint64_t sub_21DE7B5DC(unint64_t a1)
{
  if (a1 >= 5)
    return 4;
  else
    return (0x304020100uLL >> (8 * a1));
}

uint64_t sub_21DE7B600(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DE7B640()
{
  unint64_t v0;

  v0 = sub_21DE8204C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_21DE7B688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  char v17[24];
  ValueMetadata *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  *((_QWORD *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
  v5 = sub_21DE7B8B0();
  v22 = v5;
  LOBYTE(v20) = 0;
  sub_21DE81BF0();
  if (v2)
  {
    v6 = sub_21DE81C14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    v8 = v25;
    v7 = v26;
    *((_QWORD *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
    v22 = v5;
    LOBYTE(v20) = 1;
    sub_21DE81BF0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    v9 = v27;
    *((_QWORD *)&v21 + 1) = &type metadata for PrintSample_Transport.Key;
    v22 = v5;
    LOBYTE(v20) = 2;
    sub_21DE7B8F4();
    sub_21DE81BF0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    v11 = v24;
    v18 = &type metadata for PrintSample_Transport.Key;
    v19 = v5;
    v17[0] = 3;
    sub_21DE7B938();
    sub_21DE81BF0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    v15 = v21;
    v16 = v20;
    v12 = v22;
    v13 = v23;
    v14 = sub_21DE81C14();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
    *(_QWORD *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v9;
    *(_BYTE *)(a2 + 24) = v11;
    *(_OWORD *)(a2 + 32) = v16;
    *(_OWORD *)(a2 + 48) = v15;
    *(_QWORD *)(a2 + 64) = v12;
    *(_BYTE *)(a2 + 72) = v13;
  }
  return result;
}

unint64_t sub_21DE7B8B0()
{
  unint64_t result;

  result = qword_2553AED28;
  if (!qword_2553AED28)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82A88, &type metadata for PrintSample_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AED28);
  }
  return result;
}

unint64_t sub_21DE7B8F4()
{
  unint64_t result;

  result = qword_2553AED30;
  if (!qword_2553AED30)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82A48, &type metadata for PrintSample_Transport.LogSource);
    atomic_store(result, (unint64_t *)&qword_2553AED30);
  }
  return result;
}

unint64_t sub_21DE7B938()
{
  unint64_t result;

  result = qword_2553AED38;
  if (!qword_2553AED38)
  {
    result = MEMORY[0x2207A57EC]("\tp500\r", &type metadata for SourceLocationInfo_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AED38);
  }
  return result;
}

uint64_t sub_21DE7B97C()
{
  uint64_t v0;

  return sub_21DE7B288(*(uint64_t **)(v0 + 16));
}

uint64_t sub_21DE7B984(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_BYTE *sub_21DE7B9D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintSample_Transport.Key()
{
  return &type metadata for PrintSample_Transport.Key;
}

uint64_t getEnumTagSinglePayload for SourceLocation_Transport.Key(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s25LiveExecutionResultsProbe21PrintSample_TransportV9LogSourceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE7BAC8 + 4 * byte_21DE82875[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21DE7BAFC + 4 * byte_21DE82870[v4]))();
}

uint64_t sub_21DE7BAFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE7BB04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE7BB0CLL);
  return result;
}

uint64_t sub_21DE7BB18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE7BB20);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21DE7BB24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE7BB2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrintSample_Transport.LogSource()
{
  return &type metadata for PrintSample_Transport.LogSource;
}

unint64_t sub_21DE7BB4C()
{
  unint64_t result;

  result = qword_2553AED48;
  if (!qword_2553AED48)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82980, &type metadata for PrintSample_Transport.LogSource);
    atomic_store(result, (unint64_t *)&qword_2553AED48);
  }
  return result;
}

unint64_t sub_21DE7BB94()
{
  unint64_t result;

  result = qword_2553AED50;
  if (!qword_2553AED50)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82A20, &type metadata for PrintSample_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AED50);
  }
  return result;
}

uint64_t sub_21DE7BBD8()
{
  return MEMORY[0x24BE76DA8];
}

unint64_t sub_21DE7BBE4()
{
  unint64_t result;

  result = qword_2553AED58;
  if (!qword_2553AED58)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82908, &type metadata for PrintSample_Transport.LogSource);
    atomic_store(result, (unint64_t *)&qword_2553AED58);
  }
  return result;
}

uint64_t sub_21DE7BC30(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FILE *v13;
  int v14;
  uint64_t v15;
  FILE *v16;
  int v17;
  _QWORD *v18;
  id v19;
  uint64_t v21[3];
  unsigned __int8 v22;

  v3 = v2;
  v6 = sub_21DE81C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE81D7C();
  v10 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdOutFileHandle;
  *(_QWORD *)(v3 + v10) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1578]), sel_initWithFileDescriptor_, posix_openpt(2));
  v11 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdErrFileHandle;
  *(_QWORD *)(v3 + v11) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1578]), sel_initWithFileDescriptor_, posix_openpt(2));
  v12 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD;
  v13 = (FILE *)sub_21DE81E6C();
  v14 = fileno(v13);
  *(_DWORD *)(v3 + v12) = dup(v14);
  v15 = OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD;
  v16 = (FILE *)sub_21DE81E60();
  v17 = fileno(v16);
  *(_DWORD *)(v3 + v15) = dup(v17);
  v18 = (_QWORD *)(v3 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  *v18 = 0;
  v18[1] = 0;
  *(_QWORD *)(v3 + 16) = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  sub_21DE7E994();
  v19 = a1;
  sub_21DE81C44();
  sub_21DE7BDE8(v21[2], (void (*)(char *, char *, uint64_t))v22);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v3;
}

uint64_t sub_21DE7BDE8(uint64_t a1, void (*a2)(char *, char *, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(uint64_t, char *, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  os_log_type_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char v50;
  void (*v51)(char *, uint64_t);
  char *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  char *v57;
  char v58;
  char *v59;
  FILE *v60;
  int v61;
  int v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  char v69;
  char *v70;
  char *v71;
  char v72;
  int v73;
  FILE *v74;
  int v75;
  char v76;
  char v77;
  char *v78;
  void (*v79)(_QWORD, _QWORD);
  FILE *v80;
  int v81;
  int v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void (*v86)(_QWORD, _QWORD);
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  char *v91;
  char v92;
  char v93;
  int v94;
  FILE *v95;
  int v96;
  _QWORD v98[2];
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  _QWORD *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, char *, uint64_t);
  char *v118;
  uint64_t v119;
  uint64_t v120[3];

  v116 = a1;
  v117 = a2;
  v101 = sub_21DE81CBC();
  v100 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)v98 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = (_QWORD *)sub_21DE81C80();
  v105 = *(v109 - 1);
  MEMORY[0x24BDAC7A8](v109);
  v103 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_21DE81D40();
  v112 = *(char **)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v104 = (char *)v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_21DE81DC4();
  v115 = *(_QWORD *)(v102 - 8);
  v6 = MEMORY[0x24BDAC7A8](v102);
  v8 = (char *)v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v98 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = sub_21DE81E00();
  v13 = *(char **)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v111 = (char *)v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v110 = (char *)v98 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v108 = (char *)v98 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v107 = (char *)v98 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v106 = (char *)v98 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v98 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v98 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v98 - v30;
  v113 = v2;
  v32 = v2 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_config;
  swift_beginAccess();
  v33 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v13 + 2);
  v118 = v31;
  v33(v31, v32, v12);
  sub_21DE81DAC();
  (*((void (**)(char *, _QWORD, uint64_t))v112 + 13))(v104, **((unsigned int **)&unk_24E1D9AC8 + (char)v117), v114);
  sub_21DE81DDC();
  swift_beginAccess();
  v104 = v13;
  v34 = (void (*)(uint64_t, char *, uint64_t))*((_QWORD *)v13 + 3);
  v116 = v32;
  v34(v32, v29, v12);
  swift_endAccess();
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  v35 = v103;
  sub_21DE81F98();
  v36 = v26;
  v112 = v29;
  v114 = v12;
  v37 = v12;
  v38 = v35;
  v117 = (void (*)(char *, char *, uint64_t))v33;
  v33(v26, (uint64_t)v29, v37);
  v39 = sub_21DE81C74();
  v40 = sub_21DE81F2C();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v120[0] = v42;
    *(_DWORD *)v41 = 136446210;
    v98[1] = v41 + 4;
    v43 = sub_21DE81DD0();
    v119 = sub_21DE75A24(v43, v44, v120);
    sub_21DE81FB0();
    swift_bridgeObjectRelease();
    v45 = (void (*)(char *, uint64_t))*((_QWORD *)v104 + 1);
    v45(v36, v114);
    v46 = v40;
    v47 = v45;
    _os_log_impl(&dword_21DE73000, v39, v46, "LoggingProbePoint config updated: (%{public}s)", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v42, -1, -1);
    MEMORY[0x2207A5858](v41, -1, -1);
  }
  else
  {
    v47 = (void (*)(char *, uint64_t))*((_QWORD *)v104 + 1);
    v47(v36, v114);
  }

  (*(void (**)(char *, _QWORD *))(v105 + 8))(v38, v109);
  swift_beginAccess();
  sub_21DE81DE8();
  swift_endAccess();
  sub_21DE81DB8();
  v48 = sub_21DE7AB08(&qword_2553AEEE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE60378], MEMORY[0x24BE60380]);
  v49 = v102;
  v50 = sub_21DE81FD4();
  v51 = *(void (**)(char *, uint64_t))(v115 + 8);
  v51(v8, v49);
  v51(v11, v49);
  v52 = v106;
  v53 = v114;
  v117(v106, v118, v114);
  v115 = v48;
  if ((v50 & 1) != 0)
  {
    sub_21DE81DE8();
    sub_21DE81DB8();
    v54 = sub_21DE81FD4();
    v51(v8, v49);
    v51(v11, v49);
    v47(v52, v53);
    if ((v54 & 1) == 0 && !off_2553AED60)
    {
      v55 = v113;
      swift_retain();
      sub_21DE7C938((uint64_t)sub_21DE7EB3C, v55);
      swift_release();
    }
  }
  else
  {
    v47(v52, v53);
  }
  swift_beginAccess();
  sub_21DE81DE8();
  swift_endAccess();
  sub_21DE81D94();
  v56 = sub_21DE81FD4();
  v51(v8, v49);
  v51(v11, v49);
  v57 = v107;
  v117(v107, v118, v53);
  v109 = v47;
  if ((v56 & 1) != 0)
  {
    sub_21DE81DE8();
    sub_21DE81D94();
    v58 = sub_21DE81FD4();
    v51(v8, v49);
    v51(v11, v49);
    v47(v57, v53);
    v59 = v108;
    if ((v58 & 1) == 0)
    {
      v60 = (FILE *)sub_21DE81E6C();
      v61 = fileno(v60);
      v62 = dup(v61);
      v63 = v113;
      *(_DWORD *)(v113 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD) = v62;
      v64 = *(void **)(v63 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdOutFileHandle);
      v65 = v100;
      v66 = (uint64_t)v99;
      v67 = v101;
      (*(void (**)(char *, _QWORD, uint64_t))(v100 + 104))(v99, *MEMORY[0x24BE60260], v101);
      v68 = v64;
      sub_21DE7DE90(1, v68, v66);

      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v67);
LABEL_15:
      v71 = v110;
      v70 = v111;
      goto LABEL_18;
    }
  }
  else
  {
    v47(v57, v53);
    v59 = v108;
  }
  swift_beginAccess();
  sub_21DE81DE8();
  swift_endAccess();
  sub_21DE81D94();
  v69 = sub_21DE81FD4();
  v51(v8, v49);
  v51(v11, v49);
  v117(v59, v118, v53);
  if ((v69 & 1) != 0)
  {
    v47(v59, v53);
    goto LABEL_15;
  }
  sub_21DE81DE8();
  sub_21DE81D94();
  v72 = sub_21DE81FD4();
  v51(v8, v49);
  v51(v11, v49);
  v47(v59, v53);
  v71 = v110;
  v70 = v111;
  if ((v72 & 1) != 0)
  {
    v73 = *(_DWORD *)(v113 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdOutFD);
    v74 = (FILE *)sub_21DE81E6C();
    v75 = fileno(v74);
    dup2(v73, v75);
  }
LABEL_18:
  swift_beginAccess();
  sub_21DE81DE8();
  swift_endAccess();
  sub_21DE81DA0();
  v76 = sub_21DE81FD4();
  v51(v8, v49);
  v51(v11, v49);
  v117(v71, v118, v53);
  if ((v76 & 1) != 0)
  {
    sub_21DE81DE8();
    sub_21DE81DA0();
    v77 = sub_21DE81FD4();
    v51(v8, v49);
    v51(v11, v49);
    v78 = v71;
    v79 = (void (*)(_QWORD, _QWORD))v109;
    ((void (*)(char *, uint64_t))v109)(v78, v53);
    if ((v77 & 1) == 0)
    {
      v80 = (FILE *)sub_21DE81E60();
      v81 = fileno(v80);
      v82 = dup(v81);
      v83 = v113;
      *(_DWORD *)(v113 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD) = v82;
      v84 = *(void **)(v83 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_stdErrFileHandle);
      v85 = v100;
      v86 = v79;
      v87 = (uint64_t)v99;
      v88 = v101;
      (*(void (**)(char *, _QWORD, uint64_t))(v100 + 104))(v99, *MEMORY[0x24BE60268], v101);
      v89 = v84;
      sub_21DE7DE90(2, v89, v87);

      v90 = v87;
      v79 = v86;
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v90, v88);
      goto LABEL_26;
    }
  }
  else
  {
    v91 = v71;
    v79 = (void (*)(_QWORD, _QWORD))v109;
    ((void (*)(char *, uint64_t))v109)(v91, v53);
  }
  swift_beginAccess();
  sub_21DE81DE8();
  swift_endAccess();
  sub_21DE81DA0();
  v92 = sub_21DE81FD4();
  v51(v8, v49);
  v51(v11, v49);
  v117(v70, v118, v53);
  if ((v92 & 1) != 0)
  {
    v79(v70, v53);
  }
  else
  {
    sub_21DE81DE8();
    sub_21DE81DA0();
    v93 = sub_21DE81FD4();
    v51(v8, v49);
    v51(v11, v49);
    v79(v70, v53);
    if ((v93 & 1) != 0)
    {
      v94 = *(_DWORD *)(v113 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_originalStdErrFD);
      v95 = (FILE *)sub_21DE81E60();
      v96 = fileno(v95);
      dup2(v94, v96);
    }
  }
LABEL_26:
  v79(v112, v53);
  return ((uint64_t (*)(char *, uint64_t))v79)(v118, v53);
}

uint64_t sub_21DE7C938(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v6 = sub_21DE81C80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21DE82034();
  v12 = v11;
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F98();
  sub_21DE762C4(v10);
  sub_21DE762C4(v10);
  v13 = sub_21DE81C74();
  v14 = sub_21DE81F2C();
  if (os_log_type_enabled(v13, v14))
  {
    v27 = v7;
    v31 = v3;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v34 = v16;
    *(_DWORD *)v15 = 136315138;
    v29 = a1;
    v30 = a2;
    v28 = v6;
    if (v10)
    {
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v10;
      *(_QWORD *)(v17 + 24) = v12;
      v18 = sub_21DE7EBE4;
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    v32 = (uint64_t)v18;
    v33 = v17;
    sub_21DE762C4(v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE950);
    v19 = sub_21DE81EF0();
    v32 = sub_21DE75A24(v19, v20, &v34);
    sub_21DE81FB0();
    swift_bridgeObjectRelease();
    sub_21DE762D4(v10);
    sub_21DE762D4(v10);
    _os_log_impl(&dword_21DE73000, v13, v14, "setupPrintHook() existing playgroundPrintHook: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207A5858](v16, -1, -1);
    MEMORY[0x2207A5858](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
    a2 = v30;
    a1 = v29;
  }
  else
  {
    sub_21DE762D4(v10);
    sub_21DE762D4(v10);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v21 = swift_allocObject();
  swift_weakInit();
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v21;
  v22[3] = a1;
  v22[4] = a2;
  v23 = off_2553AED60;
  off_2553AED60 = sub_21DE7EB94;
  qword_2553AED68 = (uint64_t)v22;
  swift_retain();
  sub_21DE762D4((uint64_t)v23);
  v24 = swift_allocObject();
  swift_weakInit();
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = v10;
  v25[3] = v12;
  v25[4] = v24;
  return sub_21DE82040();
}

uint64_t sub_21DE7CC70(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, _QWORD), uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, _QWORD);

  v21 = a7;
  v22 = a6;
  v11 = sub_21DE81DC4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v21 - v16;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    sub_21DE81DE8();
    swift_endAccess();
    sub_21DE81DB8();
    sub_21DE7AB08(&qword_2553AEEE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE60378], MEMORY[0x24BE60380]);
    v19 = sub_21DE81FD4();
    v20 = *(void (**)(char *, uint64_t))(v12 + 8);
    v20(v15, v11);
    v20(v17, v11);
    result = swift_release();
    if ((v19 & 1) != 0)
      return v22(a1, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_21DE7CDF0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, BOOL);
  uint64_t v24;
  uint64_t v25;

  v6 = sub_21DE81D40();
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21DE81DC4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  if (a3)
    a3(a1, a2);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    sub_21DE81DE8();
    swift_endAccess();
    sub_21DE81DB8();
    sub_21DE7AB08(&qword_2553AEEE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE60378], MEMORY[0x24BE60380]);
    v17 = sub_21DE81FD4();
    v18 = *(void (**)(char *, uint64_t))(v10 + 8);
    v18(v13, v9);
    v18(v15, v9);
    if ((v17 & 1) != 0)
    {
      v19 = a2;
      swift_beginAccess();
      sub_21DE81DF4();
      swift_endAccess();
      v20 = sub_21DE81D34();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
      v21 = 0;
      if ((v20 & 1) != 0)
      {
        sub_21DE7EE90();
        v21 = v22;
      }
      v23 = (void (*)(uint64_t, uint64_t, uint64_t, BOOL))off_2553AED60;
      if (off_2553AED60)
      {
        swift_retain();
        v23(a1, v19, v21, (v20 & 1) == 0);
        sub_21DE762D4((uint64_t)v23);
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_21DE7D03C(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t aBlock[7];

  v35 = a3;
  v40 = a1;
  v6 = sub_21DE81E78();
  v39 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21DE81E90();
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81C80();
  v34 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21DE81B78();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE81B6C();
  sub_21DE81B60();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F98();
  swift_bridgeObjectRetain_n();
  v20 = sub_21DE81C74();
  v21 = sub_21DE81F2C();
  if (os_log_type_enabled(v20, v21))
  {
    v32 = v11;
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v33 = v6;
    v24 = v23;
    aBlock[0] = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    v41 = sub_21DE75A24(v40, a2, aBlock);
    sub_21DE81FB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21DE73000, v20, v21, "Print hook received: \"%s\"", v22, 0xCu);
    swift_arrayDestroy();
    v25 = v24;
    v6 = v33;
    MEMORY[0x2207A5858](v25, -1, -1);
    MEMORY[0x2207A5858](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v11);
  }
  v26 = swift_allocObject();
  swift_weakInit();
  v27 = swift_allocObject();
  v28 = v35;
  *(_QWORD *)(v27 + 16) = v26;
  *(_QWORD *)(v27 + 24) = v28;
  *(_BYTE *)(v27 + 32) = a4 & 1;
  *(_QWORD *)(v27 + 40) = v40;
  *(_QWORD *)(v27 + 48) = a2;
  *(_QWORD *)(v27 + 56) = v19;
  aBlock[4] = (uint64_t)sub_21DE7EF88;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21DE750B0;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  v29 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21DE81E84();
  v41 = MEMORY[0x24BEE4AF8];
  sub_21DE7AB08((unint64_t *)&qword_2553AE938, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553AE940);
  sub_21DE76234();
  v30 = v38;
  sub_21DE81FEC();
  MEMORY[0x2207A5420](0, v10, v30, v29);
  _Block_release(v29);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v30, v6);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v37);
  swift_release();
  return swift_release();
}

uint64_t sub_21DE7D498(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
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
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t result;
  uint64_t v19;
  void (**v20)(_BYTE *);
  void (*v21)(_BYTE *);
  uint64_t v22[2];
  uint64_t v23;
  _BYTE v24[80];

  v22[0] = a2;
  v22[1] = a4;
  v5 = sub_21DE81CBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_21DE81CE0();
  v9 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED20);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)v22 - v16);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v19 = result;
    sub_21DE7D704(v22[0], a3 & 1, v17);
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE60278], v5);
    sub_21DE7EFB4((uint64_t)v17, (uint64_t)v15);
    swift_bridgeObjectRetain();
    sub_21DE81C98();
    v20 = (void (**)(_BYTE *))(v19
                                        + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
    swift_beginAccess();
    v21 = *v20;
    if (*v20)
    {
      swift_endAccess();
      swift_retain();
      sub_21DE7B428((uint64_t)v24);
      v21(v24);
      sub_21DE7EFFC((uint64_t)v24);
      sub_21DE762D4((uint64_t)v21);
      swift_release();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
      return sub_21DE7AACC((uint64_t)v17, &qword_2553AED20);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v23);
      sub_21DE7AACC((uint64_t)v17, &qword_2553AED20);
      swift_endAccess();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_21DE7D704@<X0>(uint64_t a1@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t (*v27)(_QWORD *, uint64_t, uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  unsigned int *v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;

  v57 = a3;
  LODWORD(v58) = a2;
  v55 = a1;
  v52 = sub_21DE81C80();
  v54 = *(_QWORD *)(v52 - 8);
  v3 = MEMORY[0x24BDAC7A8](v52);
  v53 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)v45 - v5;
  v56 = sub_21DE81D58();
  v51 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v7 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21DE81D1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEEF0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v45 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v45 - v19;
  v21 = sub_21DE81D40();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v58 & 1) != 0)
  {
    v29 = sub_21DE81D28();
    return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v57, 1, 1, v29);
  }
  v48 = v18;
  v45[1] = v7;
  v49 = v20;
  v46 = v15;
  v58 = v9;
  v47 = v11;
  swift_beginAccess();
  sub_21DE81DF4();
  swift_endAccess();
  v25 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v25 != *MEMORY[0x24BE60308])
  {
    if (v25 == *MEMORY[0x24BE602F8])
    {
      v31 = v58;
      v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56);
      v33 = (uint64_t)v49;
      v32(v49, 1, 1, v8);
      sub_21DE81D70();
      sub_21DE81D64();
      v34 = (uint64_t)v48;
      sub_21DE81D4C();
      sub_21DE7AACC(v33, &qword_2553AEEF0);
      swift_release();
      v32((char *)v34, 0, 1, v8);
      sub_21DE7F080(v34, v33);
      v37 = v57;
      v38 = v47;
      v39 = (uint64_t)v46;
      sub_21DE7F080(v33, (uint64_t)v46);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v39, 1, v8) == 1)
      {
        sub_21DE7AACC(v39, &qword_2553AEEF0);
        v26 = sub_21DE81D28();
        v27 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
        v28 = v37;
        goto LABEL_12;
      }
      v41 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 32);
      v41(v38, v39, v8);
      v41((char *)v37, (uint64_t)v38, v8);
      v35 = (unsigned int *)MEMORY[0x24BE602D8];
    }
    else
    {
      if (v25 != *MEMORY[0x24BE60300])
      {
        v36 = sub_21DE81D28();
        (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v57, 1, 1, v36);
        return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      }
      v37 = v57;
      *v57 = v55;
      v35 = (unsigned int *)MEMORY[0x24BE602E0];
    }
    v42 = *v35;
    v43 = sub_21DE81D28();
    v44 = *(_QWORD *)(v43 - 8);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v44 + 104))(v37, v42, v43);
    v27 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v44 + 56);
    v28 = v37;
    v40 = 0;
    v26 = v43;
    return v27(v28, v40, 1, v26);
  }
  v26 = sub_21DE81D28();
  v27 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v28 = v57;
LABEL_12:
  v40 = 1;
  return v27(v28, v40, 1, v26);
}

char *sub_21DE7DE90(int a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *result;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v17 = a3;
  v5 = sub_21DE81CBC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = objc_msgSend(a2, sel_fileDescriptor);
  grantpt(v8);
  unlockpt(v8);
  result = ptsname(v8);
  if (result)
  {
    v10 = sub_21DE81E48();
    sub_21DE7EBEC(v8);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1578]), sel_initWithFileDescriptor_closeOnDealloc_, v10, 1);
    dup2((int)objc_msgSend(v11, sel_fileDescriptor), a1);
    v12 = swift_allocObject();
    swift_weakInit();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v5);
    v13 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v12;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    aBlock[4] = sub_21DE7F13C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21DE7E590;
    aBlock[3] = &block_descriptor_21;
    v15 = _Block_copy(aBlock);
    swift_retain();
    sub_21DE762C4((uint64_t)sub_21DE7F13C);
    swift_release();
    objc_msgSend(a2, sel_setReadabilityHandler_, v15);

    _Block_release(v15);
    swift_release();
    return (char *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DE7E094(void *a1, uint64_t a2, uint64_t a3)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  char v18;
  uint64_t result;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;

  v33 = a1;
  v34 = a3;
  v3 = sub_21DE81E78();
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21DE81E90();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v27 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21DE81CBC();
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  v8 = *(_QWORD *)(v25 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v24[2] = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21DE81EE4();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_21DE81DC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21DE81E9C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (_QWORD *)((char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21DE786DC(0, &qword_2553AEC28);
  *v17 = sub_21DE81F68();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BEE5608], v14);
  v18 = sub_21DE81EA8();
  (*(void (**)(uint64_t *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x21DE7E580);
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    sub_21DE81DE8();
    swift_endAccess();
    v20 = sub_21DE81D88();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    if ((v20 & 1) != 0)
    {
      v21 = objc_msgSend(v33, sel_availableData);
      sub_21DE81B54();
      v23 = v22;

      __asm { BR              X10 }
    }
    return swift_release();
  }
  return result;
}

void sub_21DE7E590(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21DE7E5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (**v19)(_BYTE *);
  void (*v20)(_BYTE *);
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[80];

  v24 = a4;
  v22[0] = a3;
  v22[1] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21DE81CBC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21DE81B78();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_21DE81CE0();
  v15 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_21DE81B6C();
  sub_21DE81B60();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 16))(v10, v22[0], v7);
  v18 = sub_21DE81D28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_21DE81C98();
  v19 = (void (**)(_BYTE *))(v24
                                      + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  swift_beginAccess();
  v20 = *v19;
  if (*v19)
  {
    swift_endAccess();
    swift_retain();
    sub_21DE7B428((uint64_t)v25);
    v20(v25);
    sub_21DE7EFFC((uint64_t)v25);
    sub_21DE762D4((uint64_t)v20);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v23);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v23);
    return swift_endAccess();
  }
}

uint64_t sub_21DE7E828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_config;
  v2 = sub_21DE81E00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_21DE762D4(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler));
  return swift_deallocClassInstance();
}

uint64_t sub_21DE7E8B4()
{
  return type metadata accessor for LoggingProbePoint();
}

uint64_t type metadata accessor for LoggingProbePoint()
{
  uint64_t result;

  result = qword_2553AEDB8;
  if (!qword_2553AEDB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21DE7E8F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DE81E00();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_21DE7E994()
{
  unint64_t result;

  result = qword_2553AEE70;
  if (!qword_2553AEE70)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82DC4, &type metadata for LoggingProbePointConfiguration_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEE70);
  }
  return result;
}

unint64_t sub_21DE7E9DC()
{
  unint64_t result;

  result = qword_2553AEE78;
  if (!qword_2553AEE78)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE828B8, &type metadata for PrintSample_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEE78);
  }
  return result;
}

unint64_t sub_21DE7EA20()
{
  return 0xD000000000000013;
}

uint64_t sub_21DE7EA3C(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_21DE7BC30(a1, a2);
  return v4;
}

uint64_t sub_21DE7EA88()
{
  void *v0;

  v0 = off_2553AED60;
  off_2553AED60 = 0;
  qword_2553AED68 = 0;
  return sub_21DE762D4((uint64_t)v0);
}

uint64_t sub_21DE7EA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t (*v6)(_OWORD *);
  uint64_t *v7;
  uint64_t v8;

  if (a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = sub_21DE7F274;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC25LiveExecutionResultsProbe17LoggingProbePoint_probeSampleGenerationHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  return sub_21DE762D4(v8);
}

uint64_t sub_21DE7EB2C(uint64_t a1)
{
  return sub_21DE7BDE8(*(_QWORD *)a1, (void (*)(char *, char *, uint64_t))*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_21DE7EB3C(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  return sub_21DE7D03C(a1, a2, a3, a4 & 1);
}

uint64_t sub_21DE7EB44()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21DE7EB68()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE7EB94(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return sub_21DE7CC70(a1, a2, a3, a4 & 1, *(_QWORD *)(v4 + 16), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_21DE7EBA4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE7EBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21DE7CDF0(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_21DE7EBE4(_QWORD *a1)
{
  uint64_t v1;

  return sub_21DE75384(a1, *(uint64_t (**)(_QWORD, _QWORD))(v1 + 16));
}

uint64_t sub_21DE7EBEC(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t result;
  os_log_type_t v13;
  _BYTE v14[12];
  int v15;
  termios v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = sub_21DE81C80();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v14[-v7];
  memset(&v16, 0, 52);
  v16.c_ispeed = 0;
  v16.c_ospeed = 0;
  if (!tcgetattr(a1, &v16))
  {
    *(int8x16_t *)&v16.c_iflag = vandq_s8(*(int8x16_t *)&v16.c_iflag, (int8x16_t)xmmword_21DE82B30);
    result = tcsetattr(a1, 0, &v16);
    if (!(_DWORD)result)
      return result;
    sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
    sub_21DE81F98();
    v9 = sub_21DE81C74();
    v13 = sub_21DE81F38();
    if (!os_log_type_enabled(v9, v13))
    {
      v6 = v8;
      goto LABEL_9;
    }
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67240192;
    v15 = MEMORY[0x2207A5300]();
    sub_21DE81FB0();
    _os_log_impl(&dword_21DE73000, v9, v13, "Error: Could not set tty settings: %{public}d", v11, 8u);
    v6 = v8;
    goto LABEL_7;
  }
  sub_21DE786DC(0, (unint64_t *)&qword_2553AE928);
  sub_21DE81F98();
  v9 = sub_21DE81C74();
  v10 = sub_21DE81F38();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67240192;
    v15 = MEMORY[0x2207A5300]();
    sub_21DE81FB0();
    _os_log_impl(&dword_21DE73000, v9, v10, "Error: Could not get tty settings: %{public}d", v11, 8u);
LABEL_7:
    MEMORY[0x2207A5858](v11, -1, -1);
  }
LABEL_9:

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_21DE7EE90()
{
  id v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_callStackReturnAddresses);
  sub_21DE786DC(0, &qword_2553AEEE8);
  v1 = sub_21DE81F14();

  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x2207A54B0](3, v1);
  }
  else
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) < 4uLL)
    {
      __break(1u);
      goto LABEL_8;
    }
    v2 = *(id *)(v1 + 56);
  }
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v3, sel_unsignedLongLongValue);

  if (!v4)
LABEL_8:
    __break(1u);
}

uint64_t sub_21DE7EF5C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DE7EF88()
{
  uint64_t v0;

  return sub_21DE7D498(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40));
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

uint64_t sub_21DE7EFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AED20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE7EFFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_BYTE *)(a1 + 72);
  swift_bridgeObjectRelease();
  sub_21DE7F068(v2, v3, v4, v5, v6, v7);
  return a1;
}

uint64_t sub_21DE7F068(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255)
    return sub_21DE7AC34(result, a2, a3, a4, a5, a6 & 1);
  return result;
}

uint64_t sub_21DE7F080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553AEEF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE7F0C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21DE81CBC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21DE7F13C(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_21DE81CBC() - 8) + 80);
  return sub_21DE7E094(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_21DE7F17C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21DE81CBC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE7F20C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_21DE81CBC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_21DE7E5E0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_21DE7F250()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DE7F274(_OWORD *a1)
{
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[2];

  v2 = *(uint64_t (**)(_OWORD *))(v1 + 16);
  v3 = a1[3];
  v6[2] = a1[2];
  v7[0] = v3;
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)a1 + 57);
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return v2(v6);
}

uint64_t sub_21DE7F2CC()
{
  return 1;
}

uint64_t sub_21DE7F2D4()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  return sub_21DE82094();
}

uint64_t sub_21DE7F328()
{
  return sub_21DE81EFC();
}

uint64_t sub_21DE7F344()
{
  sub_21DE8207C();
  sub_21DE81EFC();
  return sub_21DE82094();
}

uint64_t sub_21DE7F394@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21DE8204C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_21DE7F3E4(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x800000021DE83600;
}

unint64_t sub_21DE7F404()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_21DE7F420()
{
  sub_21DE7F544();
  return sub_21DE81C08();
}

uint64_t sub_21DE7F480@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  char v10;

  v8 = &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key;
  v9 = sub_21DE7F544();
  sub_21DE81BF0();
  v5 = sub_21DE81C14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if (!v2)
    *a2 = v10;
  return result;
}

unint64_t sub_21DE7F544()
{
  unint64_t result;

  result = qword_2553AEF00;
  if (!qword_2553AEF00)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82D14, &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF00);
  }
  return result;
}

void sub_21DE7F588(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + 16);
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport.Key(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport.Key(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21DE7F628 + 4 * byte_21DE82BC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21DE7F648 + 4 * byte_21DE82BC5[v4]))();
}

_BYTE *sub_21DE7F628(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21DE7F648(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DE7F650(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DE7F658(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DE7F660(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DE7F668(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21DE7F674()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration_Transport.Key()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration_Transport(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE7F778 + 4 * byte_21DE82BCF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DE7F7AC + 4 * byte_21DE82BCA[v4]))();
}

uint64_t sub_21DE7F7AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE7F7B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE7F7BCLL);
  return result;
}

uint64_t sub_21DE7F7C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE7F7D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DE7F7D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE7F7DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration_Transport()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration_Transport;
}

unint64_t sub_21DE7F7FC()
{
  unint64_t result;

  result = qword_2553AEF08;
  if (!qword_2553AEF08)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82CEC, &type metadata for PlaygroundLoggerProbePointConfiguration_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF08);
  }
  return result;
}

uint64_t sub_21DE7F840(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_21DE7F848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_21DE7F850(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_21DE7F858(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_21DE7F860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t sub_21DE7F868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t sub_21DE7F870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

BOOL sub_21DE7F878(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21DE7F88C()
{
  sub_21DE8207C();
  sub_21DE82088();
  return sub_21DE82094();
}

uint64_t sub_21DE7F8D0()
{
  return sub_21DE82088();
}

uint64_t sub_21DE7F8F8()
{
  sub_21DE8207C();
  sub_21DE82088();
  return sub_21DE82094();
}

uint64_t *sub_21DE7F938@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_21DE7F950(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_21DE7F95C()
{
  sub_21DE805BC();
  return sub_21DE81C50();
}

uint64_t sub_21DE7F9A4()
{
  sub_21DE805BC();
  return sub_21DE81C5C();
}

_QWORD *sub_21DE7FA0C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21DE7FA18()
{
  sub_21DE804E8();
  return sub_21DE81C50();
}

uint64_t sub_21DE7FA60()
{
  sub_21DE804E8();
  return sub_21DE81C5C();
}

void sub_21DE7FAC8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_21DE7FAD0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_21DE7FAE4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_21DE7FAF8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_21DE7FB0C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_21DE7FB3C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_21DE7FB68@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_21DE7FB8C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_21DE7FBA0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_21DE7FBB4(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_21DE7FBC8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_21DE7FBDC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_21DE7FBF0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_21DE7FC04(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_21DE7FC18()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_21DE7FC28()
{
  return sub_21DE81FE0();
}

_QWORD *sub_21DE7FC40(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_21DE7FC54@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21DE7FC64(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_21DE7FC70(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21DE7FC84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_21DE7FF04(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_21DE7FCC0(char *a1, char *a2)
{
  return sub_21DE76B0C(*a1, *a2);
}

uint64_t sub_21DE7FCCC()
{
  return sub_21DE76CAC();
}

uint64_t sub_21DE7FCD4()
{
  sub_21DE81EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE7FD34()
{
  return sub_21DE77184();
}

uint64_t sub_21DE7FD3C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21DE8204C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_21DE7FD98(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD00000000000001CLL;
  else
    v2 = 0xD000000000000010;
  v3 = 0x800000021DE83620;
  if (*v1)
    v3 = 0x800000021DE83640;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_21DE7FDDC()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001CLL;
  else
    return 0xD000000000000010;
}

uint64_t sub_21DE7FE1C()
{
  sub_21DE80050();
  sub_21DE80094();
  sub_21DE800D8();
  return sub_21DE81C38();
}

uint64_t sub_21DE7FEA0()
{
  return sub_21DE81BFC();
}

uint64_t sub_21DE7FED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;

  result = sub_21DE7FF3C(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_21DE7FF04(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_21DE7FF3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  uint64_t v10;

  v8 = &type metadata for LoggingProbePointConfiguration_Transport.Key;
  v4 = sub_21DE80050();
  v9 = v4;
  v7[0] = 0;
  sub_21DE80094();
  sub_21DE81BF0();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    v2 = v10;
    v8 = &type metadata for LoggingProbePointConfiguration_Transport.Key;
    v9 = v4;
    v7[0] = 1;
    sub_21DE800D8();
    sub_21DE81BF0();
  }
  v5 = sub_21DE81C14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v2;
}

unint64_t sub_21DE80050()
{
  unint64_t result;

  result = qword_2553AEF10;
  if (!qword_2553AEF10)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE831EC, &type metadata for LoggingProbePointConfiguration_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF10);
  }
  return result;
}

unint64_t sub_21DE80094()
{
  unint64_t result;

  result = qword_2553AEF18;
  if (!qword_2553AEF18)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE831AC, &type metadata for LoggingProbePointConfiguration_Transport.LogSources);
    atomic_store(result, (unint64_t *)&qword_2553AEF18);
  }
  return result;
}

unint64_t sub_21DE800D8()
{
  unint64_t result;

  result = qword_2553AEF20;
  if (!qword_2553AEF20)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE8316C, &type metadata for SourceLocationCollectionMode_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEF20);
  }
  return result;
}

uint64_t sub_21DE8011C()
{
  return sub_21DE7FE1C();
}

uint64_t getEnumTagSinglePayload for SourceLocationCollectionMode_Transport(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SourceLocationCollectionMode_Transport(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE80204 + 4 * byte_21DE82DB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21DE80238 + 4 * asc_21DE82DB0[v4]))();
}

uint64_t sub_21DE80238(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE80240(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE80248);
  return result;
}

uint64_t sub_21DE80254(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE8025CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21DE80260(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE80268(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationCollectionMode_Transport()
{
  return &type metadata for SourceLocationCollectionMode_Transport;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport.LogSources()
{
  return &type metadata for LoggingProbePointConfiguration_Transport.LogSources;
}

uint64_t storeEnumTagSinglePayload for LoggingProbePointConfiguration_Transport.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE802E0 + 4 * byte_21DE82DBF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DE80314 + 4 * byte_21DE82DBA[v4]))();
}

uint64_t sub_21DE80314(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE8031C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE80324);
  return result;
}

uint64_t sub_21DE80330(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE80338);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DE8033C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE80344(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport.Key()
{
  return &type metadata for LoggingProbePointConfiguration_Transport.Key;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggingProbePointConfiguration_Transport(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggingProbePointConfiguration_Transport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration_Transport()
{
  return &type metadata for LoggingProbePointConfiguration_Transport;
}

unint64_t sub_21DE80410()
{
  unint64_t result;

  result = qword_2553AEF28;
  if (!qword_2553AEF28)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82F14, &type metadata for LoggingProbePointConfiguration_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF28);
  }
  return result;
}

unint64_t sub_21DE80458()
{
  unint64_t result;

  result = qword_2553AEF30;
  if (!qword_2553AEF30)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82F6C, &type metadata for LoggingProbePointConfiguration_Transport.LogSources);
    atomic_store(result, (unint64_t *)&qword_2553AEF30);
  }
  return result;
}

unint64_t sub_21DE804A0()
{
  unint64_t result;

  result = qword_2553AEF38;
  if (!qword_2553AEF38)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82F3C, &type metadata for LoggingProbePointConfiguration_Transport.LogSources);
    atomic_store(result, (unint64_t *)&qword_2553AEF38);
  }
  return result;
}

unint64_t sub_21DE804E8()
{
  unint64_t result;

  result = qword_2553AEF40;
  if (!qword_2553AEF40)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82F94, &type metadata for LoggingProbePointConfiguration_Transport.LogSources);
    atomic_store(result, (unint64_t *)&qword_2553AEF40);
  }
  return result;
}

unint64_t sub_21DE80530()
{
  unint64_t result;

  result = qword_2553AEF48;
  if (!qword_2553AEF48)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE82FCC, &type metadata for LoggingProbePointConfiguration_Transport.LogSources);
    atomic_store(result, (unint64_t *)&qword_2553AEF48);
  }
  return result;
}

unint64_t sub_21DE80578()
{
  unint64_t result;

  result = qword_2553AEF50;
  if (!qword_2553AEF50)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE83144, &type metadata for SourceLocationCollectionMode_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEF50);
  }
  return result;
}

unint64_t sub_21DE805BC()
{
  unint64_t result;

  result = qword_2553AEF58;
  if (!qword_2553AEF58)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE830CC, &type metadata for SourceLocationCollectionMode_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEF58);
  }
  return result;
}

uint64_t destroy for SourceLocationInfo_Transport(uint64_t a1)
{
  return sub_21DE7AC34(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_21DE7ABD8(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_21DE7ABD8(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_21DE7AC34(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocationInfo_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  sub_21DE7AC34(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocationInfo_Transport(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo_Transport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_21DE80814(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_21DE8081C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport()
{
  return &type metadata for SourceLocationInfo_Transport;
}

uint64_t sub_21DE80838@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  _BYTE v22[12];
  int v23;

  v2 = v1;
  v4 = sub_21DE81D1C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_21DE81D28();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)&v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v11, v2, v8);
  v12 = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 88))(v11, v8);
  v13 = v12;
  v23 = *MEMORY[0x24BE602D8];
  if (v12 == v23)
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v5 + 32))(v7, v11, v4);
    v19 = sub_21DE81D10();
    v15 = v20;
    v16 = sub_21DE81CEC();
    v17 = sub_21DE81D04();
    v18 = sub_21DE81CF8();
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
  else if (v12 == *MEMORY[0x24BE602E0])
  {
    result = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 96))(v11, v8);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = *v11;
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
    v19 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  v21 = v13 != v23;
  *(_QWORD *)a1 = v19;
  *(_QWORD *)(a1 + 8) = v15;
  *(_QWORD *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v17;
  *(_QWORD *)(a1 + 32) = v18;
  *(_BYTE *)(a1 + 40) = v21;
  return result;
}

uint64_t sub_21DE80A08(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21DE80A40 + 4 * byte_21DE83220[a1]))(0xD000000000000010, 0x800000021DE83680);
}

uint64_t sub_21DE80A40()
{
  return 0x68746150656C6966;
}

uint64_t sub_21DE80A58()
{
  return 0x6E6D756C6F63;
}

uint64_t sub_21DE80A6C()
{
  return 0x626D754E656E696CLL;
}

void sub_21DE80A88(char *a1)
{
  sub_21DE76930(*a1);
}

void sub_21DE80A94()
{
  char *v0;

  sub_21DE76D30(*v0);
}

void sub_21DE80A9C(uint64_t a1)
{
  char *v1;

  sub_21DE7709C(a1, *v1);
}

void sub_21DE80AA4(uint64_t a1)
{
  char *v1;

  sub_21DE77268(a1, *v1);
}

uint64_t sub_21DE80AAC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21DE81090();
  *a1 = result;
  return result;
}

uint64_t sub_21DE80AD8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21DE80A08(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21DE80B00()
{
  unsigned __int8 *v0;

  return sub_21DE80A08(*v0);
}

uint64_t sub_21DE80B08()
{
  sub_21DE819F0();
  return sub_21DE81C2C();
}

uint64_t sub_21DE80BE4(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000011;
  else
    return 0x6F4C656372756F73;
}

uint64_t sub_21DE80C2C()
{
  return sub_21DE81BFC();
}

double sub_21DE80C6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_21DE810D8(a1, v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_21DE80CB0(char *a1, char *a2)
{
  return sub_21DE76880(*a1, *a2);
}

uint64_t sub_21DE80CBC()
{
  return sub_21DE76DF4();
}

uint64_t sub_21DE80CC4()
{
  return sub_21DE77034();
}

uint64_t sub_21DE80CCC()
{
  return sub_21DE77328();
}

uint64_t sub_21DE80CD4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21DE8204C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_21DE80D30@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21DE80BE4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21DE80D58()
{
  sub_21DE819AC();
  return sub_21DE81C50();
}

uint64_t sub_21DE80DA0()
{
  sub_21DE819AC();
  return sub_21DE81C5C();
}

uint64_t sub_21DE80E04(char a1)
{
  if (!a1)
    return 0x696D697263736964;
  if (a1 == 1)
    return 0x6F4C656372756F73;
  return 0xD000000000000011;
}

uint64_t sub_21DE80E74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21DE7674C(*a1, *a2);
}

uint64_t sub_21DE80E80()
{
  return sub_21DE76E84();
}

uint64_t sub_21DE80E88()
{
  return sub_21DE76FA4();
}

uint64_t sub_21DE80E90()
{
  return sub_21DE773B4();
}

uint64_t sub_21DE80E98@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21DE812B0();
  *a1 = result;
  return result;
}

uint64_t sub_21DE80EC4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21DE80E04(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21DE80EEC()
{
  char *v0;

  return sub_21DE80E04(*v0);
}

uint64_t sub_21DE80EF4()
{
  __int128 *v0;
  unint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  char v5;
  ValueMetadata *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  unint64_t v10;
  __int128 v11[3];
  _OWORD v12[2];
  unint64_t v13;
  char v14;

  sub_21DE814B4(v0, v11);
  v1 = sub_21DE814CC();
  sub_21DE81510();
  sub_21DE81C08();
  sub_21DE814B4(v0, v12);
  if ((v14 & 1) != 0)
  {
    v4 = *(_QWORD *)&v12[0];
    v5 = 0;
    *((_QWORD *)&v9 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
    v10 = v1;
    LOBYTE(v8) = 2;
    sub_21DE81BE4();
    v2 = (uint64_t *)&v8;
  }
  else
  {
    v8 = v12[0];
    v9 = v12[1];
    v10 = v13;
    v6 = &type metadata for SourceLocationInfo_Transport.Key;
    v7 = v1;
    LOBYTE(v4) = 1;
    sub_21DE81554();
    sub_21DE81BE4();
    v2 = &v4;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_21DE81010()
{
  __int128 *v0;
  _OWORD v2[3];

  sub_21DE814B4(v0, v2);
  return sub_21DE80EF4();
}

_OWORD *sub_21DE8104C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v5[3];

  result = (_OWORD *)sub_21DE812F8(a1, (uint64_t)v5);
  if (!v2)
    return sub_21DE814B4(v5, a2);
  return result;
}

uint64_t sub_21DE81090()
{
  unint64_t v0;

  v0 = sub_21DE8204C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_21DE810D8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v15 = &type metadata for SourceLocation_Transport.Key;
  v5 = sub_21DE819F0();
  v16 = v5;
  v14[0] = 0;
  sub_21DE81BF0();
  if (v2)
  {
    v6 = sub_21DE81C14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    v8 = v17;
    v7 = v18;
    v15 = &type metadata for SourceLocation_Transport.Key;
    v16 = v5;
    v14[0] = 1;
    sub_21DE81BF0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    v9 = v19;
    v15 = &type metadata for SourceLocation_Transport.Key;
    v16 = v5;
    v14[0] = 2;
    sub_21DE81BF0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    v15 = &type metadata for SourceLocation_Transport.Key;
    v16 = v5;
    v14[0] = 3;
    sub_21DE81BF0();
    v11 = sub_21DE81C14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v9;
    a2[3] = v13;
    a2[4] = v12;
  }
  return result;
}

uint64_t sub_21DE812B0()
{
  unint64_t v0;

  v0 = sub_21DE8204C();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_21DE812F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[2];
  __int128 v17;
  unint64_t v18;

  *((_QWORD *)&v17 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
  v5 = sub_21DE814CC();
  v18 = v5;
  LOBYTE(v16[0]) = 0;
  sub_21DE81510();
  sub_21DE81BF0();
  if (v2)
  {
    v6 = sub_21DE81C14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    v8 = v15[0];
    if ((v15[0] & 1) != 0)
    {
      *((_QWORD *)&v17 + 1) = &type metadata for SourceLocationInfo_Transport.Key;
      v18 = v5;
      LOBYTE(v16[0]) = 2;
      sub_21DE81BF0();
      v9 = sub_21DE81C14();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
      result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
      v10 = 0;
      v11 = 0;
      v12 = v15[0];
      v13 = 0uLL;
    }
    else
    {
      v15[3] = &type metadata for SourceLocationInfo_Transport.Key;
      v15[4] = v5;
      LOBYTE(v15[0]) = 1;
      sub_21DE81554();
      sub_21DE81BF0();
      v14 = sub_21DE81C14();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
      result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
      v12 = v16[0];
      v10 = v16[1];
      v13 = v17;
      v11 = v18;
    }
    *(_QWORD *)a2 = v12;
    *(_QWORD *)(a2 + 8) = v10;
    *(_OWORD *)(a2 + 16) = v13;
    *(_QWORD *)(a2 + 32) = v11;
    *(_BYTE *)(a2 + 40) = v8;
  }
  return result;
}

_OWORD *sub_21DE814B4(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

unint64_t sub_21DE814CC()
{
  unint64_t result;

  result = qword_2553AEF60;
  if (!qword_2553AEF60)
  {
    result = MEMORY[0x2207A57EC]("Mn50<\v", &type metadata for SourceLocationInfo_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF60);
  }
  return result;
}

unint64_t sub_21DE81510()
{
  unint64_t result;

  result = qword_2553AEF68;
  if (!qword_2553AEF68)
  {
    result = MEMORY[0x2207A57EC]("\rn50X\v", &type metadata for SourceLocationInfo_Transport.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2553AEF68);
  }
  return result;
}

unint64_t sub_21DE81554()
{
  unint64_t result;

  result = qword_2553AEF70;
  if (!qword_2553AEF70)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE8344C, &type metadata for SourceLocation_Transport);
    atomic_store(result, (unint64_t *)&qword_2553AEF70);
  }
  return result;
}

_OWORD *sub_21DE81598(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  __int128 *v4;
  _OWORD *result;
  __int128 v6;
  char v7;

  v4 = *(__int128 **)(v2 + 16);
  *a1 = 0;
  result = sub_21DE814B4(v4, &v6);
  *a2 = v7;
  return result;
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo_Transport.Discriminant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE81624 + 4 * byte_21DE83229[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DE81658 + 4 * byte_21DE83224[v4]))();
}

uint64_t sub_21DE81658(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE81660(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE81668);
  return result;
}

uint64_t sub_21DE81674(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE8167CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DE81680(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE81688(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport.Discriminant()
{
  return &type metadata for SourceLocationInfo_Transport.Discriminant;
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo_Transport.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE816F0 + 4 * byte_21DE83233[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21DE81724 + 4 * byte_21DE8322E[v4]))();
}

uint64_t sub_21DE81724(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE8172C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE81734);
  return result;
}

uint64_t sub_21DE81740(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE81748);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21DE8174C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE81754(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo_Transport.Key()
{
  return &type metadata for SourceLocationInfo_Transport.Key;
}

uint64_t destroy for SourceLocation_Transport()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SourceLocation_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SourceLocation_Transport(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SourceLocation_Transport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocation_Transport(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocation_Transport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SourceLocation_Transport()
{
  return &type metadata for SourceLocation_Transport;
}

unint64_t sub_21DE81914()
{
  unint64_t result;

  result = qword_2553AEF78;
  if (!qword_2553AEF78)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE83384, &type metadata for SourceLocationInfo_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF78);
  }
  return result;
}

unint64_t sub_21DE8195C()
{
  unint64_t result;

  result = qword_2553AEF80;
  if (!qword_2553AEF80)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE83424, &type metadata for SourceLocationInfo_Transport.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2553AEF80);
  }
  return result;
}

uint64_t sub_21DE819A0()
{
  return MEMORY[0x24BE76CB8];
}

unint64_t sub_21DE819AC()
{
  unint64_t result;

  result = qword_2553AEF88;
  if (!qword_2553AEF88)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE833AC, &type metadata for SourceLocationInfo_Transport.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2553AEF88);
  }
  return result;
}

unint64_t sub_21DE819F0()
{
  unint64_t result;

  result = qword_2553AEF90;
  if (!qword_2553AEF90)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE83594, &type metadata for SourceLocation_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF90);
  }
  return result;
}

uint64_t sub_21DE81A34()
{
  return sub_21DE80B08();
}

uint64_t storeEnumTagSinglePayload for SourceLocation_Transport.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DE81A88 + 4 * byte_21DE8323D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21DE81ABC + 4 * byte_21DE83238[v4]))();
}

uint64_t sub_21DE81ABC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE81AC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DE81ACCLL);
  return result;
}

uint64_t sub_21DE81AD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DE81AE0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21DE81AE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DE81AEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocation_Transport.Key()
{
  return &type metadata for SourceLocation_Transport.Key;
}

unint64_t sub_21DE81B0C()
{
  unint64_t result;

  result = qword_2553AEF98;
  if (!qword_2553AEF98)
  {
    result = MEMORY[0x2207A57EC](&unk_21DE8356C, &type metadata for SourceLocation_Transport.Key);
    atomic_store(result, (unint64_t *)&qword_2553AEF98);
  }
  return result;
}

uint64_t sub_21DE81B54()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21DE81B60()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_21DE81B6C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21DE81B78()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21DE81B84()
{
  return MEMORY[0x24BE771F0]();
}

uint64_t sub_21DE81B90()
{
  return MEMORY[0x24BE77200]();
}

uint64_t sub_21DE81B9C()
{
  return MEMORY[0x24BE77208]();
}

uint64_t sub_21DE81BA8()
{
  return MEMORY[0x24BE77228]();
}

uint64_t sub_21DE81BB4()
{
  return MEMORY[0x24BE77230]();
}

uint64_t sub_21DE81BC0()
{
  return MEMORY[0x24BE77240]();
}

uint64_t sub_21DE81BCC()
{
  return MEMORY[0x24BE761F0]();
}

uint64_t sub_21DE81BD8()
{
  return MEMORY[0x24BE761F8]();
}

uint64_t sub_21DE81BE4()
{
  return MEMORY[0x24BE764C0]();
}

uint64_t sub_21DE81BF0()
{
  return MEMORY[0x24BE764C8]();
}

uint64_t sub_21DE81BFC()
{
  return MEMORY[0x24BE76500]();
}

uint64_t sub_21DE81C08()
{
  return MEMORY[0x24BE76510]();
}

uint64_t sub_21DE81C14()
{
  return MEMORY[0x24BE76530]();
}

uint64_t sub_21DE81C20()
{
  return MEMORY[0x24BE765C0]();
}

uint64_t sub_21DE81C2C()
{
  return MEMORY[0x24BE76838]();
}

uint64_t sub_21DE81C38()
{
  return MEMORY[0x24BE76848]();
}

uint64_t sub_21DE81C44()
{
  return MEMORY[0x24BE769B0]();
}

uint64_t sub_21DE81C50()
{
  return MEMORY[0x24BE769C8]();
}

uint64_t sub_21DE81C5C()
{
  return MEMORY[0x24BE769D0]();
}

uint64_t sub_21DE81C68()
{
  return MEMORY[0x24BE76AE8]();
}

uint64_t sub_21DE81C74()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21DE81C80()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21DE81C8C()
{
  return MEMORY[0x24BE60248]();
}

uint64_t sub_21DE81C98()
{
  return MEMORY[0x24BE60250]();
}

uint64_t sub_21DE81CA4()
{
  return MEMORY[0x24BE60258]();
}

uint64_t sub_21DE81CB0()
{
  return MEMORY[0x24BE60270]();
}

uint64_t sub_21DE81CBC()
{
  return MEMORY[0x24BE60280]();
}

uint64_t sub_21DE81CC8()
{
  return MEMORY[0x24BE60290]();
}

uint64_t sub_21DE81CD4()
{
  return MEMORY[0x24BE60298]();
}

uint64_t sub_21DE81CE0()
{
  return MEMORY[0x24BE602A0]();
}

uint64_t sub_21DE81CEC()
{
  return MEMORY[0x24BE602A8]();
}

uint64_t sub_21DE81CF8()
{
  return MEMORY[0x24BE602B0]();
}

uint64_t sub_21DE81D04()
{
  return MEMORY[0x24BE602B8]();
}

uint64_t sub_21DE81D10()
{
  return MEMORY[0x24BE602C0]();
}

uint64_t sub_21DE81D1C()
{
  return MEMORY[0x24BE602C8]();
}

uint64_t sub_21DE81D28()
{
  return MEMORY[0x24BE602E8]();
}

uint64_t sub_21DE81D34()
{
  return MEMORY[0x24BE60310]();
}

uint64_t sub_21DE81D40()
{
  return MEMORY[0x24BE60318]();
}

uint64_t sub_21DE81D4C()
{
  return MEMORY[0x24BE60320]();
}

uint64_t sub_21DE81D58()
{
  return MEMORY[0x24BE60330]();
}

uint64_t sub_21DE81D64()
{
  return MEMORY[0x24BE60338]();
}

uint64_t sub_21DE81D70()
{
  return MEMORY[0x24BE60340]();
}

uint64_t sub_21DE81D7C()
{
  return MEMORY[0x24BE60348]();
}

uint64_t sub_21DE81D88()
{
  return MEMORY[0x24BE60350]();
}

uint64_t sub_21DE81D94()
{
  return MEMORY[0x24BE60358]();
}

uint64_t sub_21DE81DA0()
{
  return MEMORY[0x24BE60360]();
}

uint64_t sub_21DE81DAC()
{
  return MEMORY[0x24BE60368]();
}

uint64_t sub_21DE81DB8()
{
  return MEMORY[0x24BE60370]();
}

uint64_t sub_21DE81DC4()
{
  return MEMORY[0x24BE60378]();
}

uint64_t sub_21DE81DD0()
{
  return MEMORY[0x24BE60388]();
}

uint64_t sub_21DE81DDC()
{
  return MEMORY[0x24BE60390]();
}

uint64_t sub_21DE81DE8()
{
  return MEMORY[0x24BE60398]();
}

uint64_t sub_21DE81DF4()
{
  return MEMORY[0x24BE603A0]();
}

uint64_t sub_21DE81E00()
{
  return MEMORY[0x24BE603A8]();
}

uint64_t sub_21DE81E0C()
{
  return MEMORY[0x24BE603B8]();
}

uint64_t sub_21DE81E18()
{
  return MEMORY[0x24BE603C0]();
}

uint64_t sub_21DE81E24()
{
  return MEMORY[0x24BE603C8]();
}

uint64_t sub_21DE81E30()
{
  return MEMORY[0x24BE603D0]();
}

uint64_t sub_21DE81E3C()
{
  return MEMORY[0x24BE603D8]();
}

uint64_t sub_21DE81E48()
{
  return MEMORY[0x24BEE5358]();
}

uint64_t sub_21DE81E54()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_21DE81E60()
{
  return MEMORY[0x24BEE76D8]();
}

uint64_t sub_21DE81E6C()
{
  return MEMORY[0x24BEE76E0]();
}

uint64_t sub_21DE81E78()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21DE81E84()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21DE81E90()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21DE81E9C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_21DE81EA8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_21DE81EB4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21DE81EC0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21DE81ECC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21DE81ED8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21DE81EE4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21DE81EF0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21DE81EFC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21DE81F08()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21DE81F14()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21DE81F20()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21DE81F2C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21DE81F38()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21DE81F44()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21DE81F50()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21DE81F5C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21DE81F68()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21DE81F74()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21DE81F80()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21DE81F8C()
{
  return MEMORY[0x24BE603E8]();
}

uint64_t sub_21DE81F98()
{
  return MEMORY[0x24BE603F0]();
}

uint64_t sub_21DE81FA4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21DE81FB0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21DE81FBC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21DE81FC8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21DE81FD4()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_21DE81FE0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21DE81FEC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21DE81FF8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21DE82004()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21DE82010()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21DE8201C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21DE82028()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21DE82034()
{
  return MEMORY[0x24BEE3200]();
}

uint64_t sub_21DE82040()
{
  return MEMORY[0x24BEE3208]();
}

uint64_t sub_21DE8204C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21DE82058()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21DE82064()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21DE82070()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21DE8207C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21DE82088()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21DE82094()
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

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

int grantpt(int a1)
{
  return MEMORY[0x24BDAE7C0](*(_QWORD *)&a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int posix_openpt(int a1)
{
  return MEMORY[0x24BDAF5F8](*(_QWORD *)&a1);
}

char *__cdecl ptsname(int a1)
{
  return (char *)MEMORY[0x24BDAF9E0](*(_QWORD *)&a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

