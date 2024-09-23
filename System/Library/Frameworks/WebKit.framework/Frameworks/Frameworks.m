unint64_t GroupSessionState.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

BOOL sub_235497C64(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235497C78()
{
  sub_2354A3C30();
  sub_2354A3C3C();
  return sub_2354A3C48();
}

uint64_t sub_235497CBC()
{
  return sub_2354A3C3C();
}

uint64_t sub_235497CE4()
{
  sub_2354A3C30();
  sub_2354A3C3C();
  return sub_2354A3C48();
}

uint64_t *sub_235497D24@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_235497D40(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id sub_235497D4C(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR___WKURLActivity_urlActivity];
  v5 = sub_2354A3864();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

uint64_t URLActivityWrapper.fallbackURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  swift_beginAccess();
  sub_2354A3858();
  swift_endAccess();
  v2 = sub_2354A37A4();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

id URLActivityWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void URLActivityWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t variable initialization expression of GroupSessionWrapper.cancellables()
{
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2354A3BE8())
    return sub_235499D28(MEMORY[0x24BEE4AF8]);
  else
    return MEMORY[0x24BEE4B08];
}

id sub_235498070(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_2354980A0(a1);
}

id sub_2354980A0(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  char *v15;
  char *v16;
  objc_class *v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *ObjectType;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  objc_super v31;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236110);
  v28 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&ObjectType - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236118);
  v26 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&ObjectType - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2354A3864();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&ObjectType - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1;
  v29 = v3;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2354A3BE8())
    v14 = sub_235499D28(MEMORY[0x24BEE4AF8]);
  else
    v14 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v13[OBJC_IVAR___WKGroupSession_cancellables] = v14;
  v15 = &v13[OBJC_IVAR___WKGroupSession_newActivityCallback];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v13[OBJC_IVAR___WKGroupSession_stateChangedCallback];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  *(_QWORD *)&v13[OBJC_IVAR___WKGroupSession_groupSession] = a1;
  swift_retain();
  sub_2354A3834();
  v17 = (objc_class *)type metadata accessor for URLActivityWrapper();
  v18 = (char *)objc_allocWithZone(v17);
  v27 = a1;
  v19 = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v18[OBJC_IVAR___WKURLActivity_urlActivity], v12, v9);
  v31.receiver = v19;
  v31.super_class = v17;
  v20 = objc_msgSendSuper2(&v31, sel_init);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(_QWORD *)&v13[OBJC_IVAR___WKGroupSession_activityWrapper] = v20;

  v30.receiver = v13;
  v30.super_class = ObjectType;
  v21 = objc_msgSendSuper2(&v30, sel_init);
  swift_retain();
  sub_2354A3840();
  swift_release();
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  v22 = MEMORY[0x24BDB9EE8];
  sub_23549A580(&qword_256236148, &qword_256236118, MEMORY[0x24BDB9EE8]);
  sub_2354A3A44();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
  swift_beginAccess();
  sub_2354A3A2C();
  swift_endAccess();
  swift_release();
  swift_retain();
  sub_2354A381C();
  swift_release();
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  sub_23549A580(&qword_256236150, &qword_256236110, v22);
  v23 = v29;
  sub_2354A3A44();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v23);
  swift_beginAccess();
  sub_2354A3A2C();
  swift_endAccess();
  swift_release();

  swift_release();
  return v21;
}

uint64_t variable initialization expression of GroupSessionWrapper.newActivityCallback()
{
  return 0;
}

uint64_t variable initialization expression of GroupSessionWrapper.stateChangedCallback()
{
  return 0;
}

uint64_t sub_235498488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void);
  uint64_t result;
  void (*v13)(void);
  void *v14;
  id v15;
  uint64_t v16;
  objc_super v17;

  v1 = v0;
  v2 = sub_2354A3864();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_2354A3834();
  swift_release();
  v6 = (objc_class *)type metadata accessor for URLActivityWrapper();
  v7 = objc_allocWithZone(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))((uint64_t)v7 + OBJC_IVAR___WKURLActivity_urlActivity, v5, v2);
  v17.receiver = v7;
  v17.super_class = v6;
  v8 = objc_msgSendSuper2(&v17, sel_init);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = OBJC_IVAR___WKGroupSession_activityWrapper;
  v10 = *(void **)(v1 + OBJC_IVAR___WKGroupSession_activityWrapper);
  *(_QWORD *)(v1 + OBJC_IVAR___WKGroupSession_activityWrapper) = v8;

  v11 = (void (**)(void))(v1 + OBJC_IVAR___WKGroupSession_newActivityCallback);
  result = swift_beginAccess();
  v13 = *v11;
  if (*v11)
  {
    v14 = *(void **)(v1 + v9);
    sub_23549A0E0((uint64_t)v13);
    v15 = v14;
    v13();

    return sub_23549A0F0((uint64_t)v13);
  }
  return result;
}

void sub_2354985DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  char *Strong;
  char *v7;
  void (*v8)(uint64_t);
  int v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void **, uint64_t);
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236158);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (void **)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  v7 = &Strong[OBJC_IVAR___WKGroupSession_stateChangedCallback];
  swift_beginAccess();
  v8 = *(void (**)(uint64_t))v7;
  if (*(_QWORD *)v7)
  {
    (*(void (**)(void **, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    v9 = (*(uint64_t (**)(void **, uint64_t))(v3 + 88))(v5, v2);
    if (v9 == *MEMORY[0x24BDD1E20])
    {
      (*(void (**)(void **, uint64_t))(v3 + 96))(v5, v2);
      v10 = *v5;
      swift_retain();

LABEL_9:
      v11 = 2;
      goto LABEL_10;
    }
    if (v9 == *MEMORY[0x24BDD1E38])
    {
      swift_retain();
      v11 = 0;
    }
    else
    {
      if (v9 != *MEMORY[0x24BDD1E30])
      {
        v12 = *(void (**)(void **, uint64_t))(v3 + 8);
        swift_retain();
        v12(v5, v2);
        goto LABEL_9;
      }
      swift_retain();
      v11 = 1;
    }
LABEL_10:
    v8(v11);
    sub_23549A0F0((uint64_t)v8);
  }

}

id GroupSessionWrapper.activity.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___WKGroupSession_activityWrapper);
}

uint64_t GroupSessionWrapper.uuid.getter()
{
  swift_retain();
  sub_2354A3804();
  return swift_release();
}

uint64_t GroupSessionWrapper.state.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236158);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (id *)((char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  swift_retain();
  sub_2354A3810();
  swift_release();
  (*(void (**)(id *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v7 = (*(uint64_t (**)(id *, uint64_t))(v1 + 88))(v4, v0);
  if (v7 == *MEMORY[0x24BDD1E20])
  {
    (*(void (**)(id *, uint64_t))(v1 + 96))(v4, v0);

LABEL_8:
    v8 = 2;
    goto LABEL_9;
  }
  if (v7 == *MEMORY[0x24BDD1E38])
  {
    v8 = 0;
  }
  else
  {
    if (v7 != *MEMORY[0x24BDD1E30])
    {
      (*(void (**)(id *, uint64_t))(v1 + 8))(v4, v0);
      goto LABEL_8;
    }
    v8 = 1;
  }
LABEL_9:
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v8;
}

uint64_t GroupSessionWrapper.newActivityCallback.getter()
{
  return sub_235499048(&OBJC_IVAR___WKGroupSession_newActivityCallback, (void (*)(_QWORD, _QWORD))sub_23549A600);
}

uint64_t GroupSessionWrapper.newActivityCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_2354991A0(a1, a2, &OBJC_IVAR___WKGroupSession_newActivityCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23549A604);
}

uint64_t (*GroupSessionWrapper.newActivityCallback.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t GroupSessionWrapper.stateChangedCallback.getter()
{
  return sub_235499048(&OBJC_IVAR___WKGroupSession_stateChangedCallback, (void (*)(_QWORD, _QWORD))sub_23549A0E0);
}

uint64_t sub_235498BF0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t GroupSessionWrapper.stateChangedCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_2354991A0(a1, a2, &OBJC_IVAR___WKGroupSession_stateChangedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23549A0F0);
}

uint64_t (*GroupSessionWrapper.stateChangedCallback.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall GroupSessionWrapper.join()()
{
  sub_235498D3C(MEMORY[0x24BDD1E18]);
}

Swift::Void __swiftcall GroupSessionWrapper.leave()()
{
  sub_235498D3C(MEMORY[0x24BDD1E50]);
}

uint64_t sub_235498D3C(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = swift_retain();
  a1(v2);
  return swift_release();
}

uint64_t sub_235498D80(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v4;
  uint64_t v5;

  v4 = a1;
  v5 = swift_retain();
  a3(v5);

  return swift_release();
}

Swift::Void __swiftcall GroupSessionWrapper.coordinate(coordinator:)(AVPlaybackCoordinator coordinator)
{
  swift_retain();
  sub_2354A3B64();
  swift_release();
}

void GroupSessionWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s14libWebKitSwift18URLActivityWrapperCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of GroupSessionObserver.newSessionCallback()
{
  return 0;
}

void *sub_235498F90(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v7 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  v8 = *v7;
  if (!*v7)
    return 0;
  v9 = v7[1];
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = a4;
  aBlock[3] = a5;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v10;
}

uint64_t GroupSessionObserver.newSessionCallback.getter()
{
  return sub_235499048(&OBJC_IVAR___WKGroupSessionObserver_newSessionCallback, (void (*)(_QWORD, _QWORD))sub_23549A600);
}

uint64_t sub_235499048(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

void sub_2354990A8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t GroupSessionObserver.newSessionCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_2354991A0(a1, a2, &OBJC_IVAR___WKGroupSessionObserver_newSessionCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23549A604);
}

uint64_t sub_2354991A0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*GroupSessionObserver.newSessionCallback.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of GroupSessionObserver.incomingSessionsTask()
{
  return 0;
}

char *GroupSessionObserver.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  objc_class *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  objc_super v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = &v0[OBJC_IVAR___WKGroupSessionObserver_newSessionCallback];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask] = 0;
  v5 = (objc_class *)type metadata accessor for GroupSessionObserver();
  v12.receiver = v0;
  v12.super_class = v5;
  v6 = (char *)objc_msgSendSuper2(&v12, sel_init);
  v7 = sub_2354A3B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v10 = sub_235499994((uint64_t)v3, (uint64_t)&unk_256236180, (uint64_t)v9);
  sub_23549A204((uint64_t)v3);
  *(_QWORD *)&v6[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask] = v10;
  swift_release();
  return v6;
}

uint64_t sub_235499378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[14] = a4;
  v5 = sub_2354A3A50();
  v4[15] = v5;
  v4[16] = *(_QWORD *)(v5 - 8);
  v4[17] = swift_task_alloc();
  v6 = sub_2354A3A68();
  v4[18] = v6;
  v4[19] = *(_QWORD *)(v6 - 8);
  v4[20] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236220);
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 - 8);
  v4[23] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236228);
  v4[24] = v8;
  v4[25] = *(_QWORD *)(v8 - 8);
  v4[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235499458()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[22];
  v1 = v0[23];
  v3 = v0[21];
  sub_2354A3864();
  sub_23549A5C0(&qword_256236230, (uint64_t (*)(uint64_t))MEMORY[0x24BDD1F30], MEMORY[0x24BDD1F28]);
  sub_2354A384C();
  sub_2354A3828();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[27] = sub_23549A580(&qword_256236238, &qword_256236228, MEMORY[0x24BDD1E78]);
  v4 = (_QWORD *)swift_task_alloc();
  v0[28] = v4;
  *v4 = v0;
  v4[1] = sub_235499578;
  return sub_2354A3AE0();
}

uint64_t sub_235499578()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 248) = v0;
  return swift_task_switch();
}

uint64_t sub_2354995DC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 232) = *(_QWORD *)(v0 + 88);
  return swift_task_switch();
}

uint64_t sub_2354995F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0[29];
  if (v1)
  {
    v2 = v0[20];
    v15 = v0[18];
    v12 = v0[17];
    v3 = v0[15];
    v13 = v0[16];
    v14 = v0[19];
    v4 = v0[14] + 16;
    sub_23549A458();
    v11 = (void *)sub_2354A3B4C();
    v5 = swift_allocObject();
    v6 = (void *)MEMORY[0x23B7CD374](v4);
    swift_unknownObjectWeakInit();

    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    *(_QWORD *)(v7 + 24) = v1;
    v0[6] = sub_23549A4C0;
    v0[7] = v7;
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_235499968;
    v0[5] = &block_descriptor_36;
    v8 = _Block_copy(v0 + 2);
    swift_retain();
    swift_retain();
    sub_2354A3A5C();
    v0[13] = MEMORY[0x24BEE4AF8];
    sub_23549A5C0(&qword_256236250, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256236258);
    sub_23549A580(&qword_256236260, &qword_256236258, MEMORY[0x24BEE12C8]);
    sub_2354A3B94();
    MEMORY[0x23B7CCE58](0, v2, v12, v8);
    _Block_release(v8);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v3);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
    swift_release();
    swift_release();
    v9 = (_QWORD *)swift_task_alloc();
    v0[30] = v9;
    *v9 = v0;
    v9[1] = sub_2354998A4;
    return sub_2354A3AE0();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[25] + 8))(v0[26], v0[24]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v0[1])();
  }
}

uint64_t sub_2354998A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 248) = v0;
  return swift_task_switch();
}

uint64_t sub_235499908()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256236240);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

uint64_t sub_235499968(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_235499994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23549A37C(a1, (uint64_t)v8);
  v9 = sub_2354A3B10();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23549A204((uint64_t)v8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_2354A3AD4();
      v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2354A3B04();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v11 = 0;
  v13 = 0;
LABEL_6:
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

id GroupSessionObserver.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  if (*(_QWORD *)&v0[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask])
  {
    swift_retain();
    sub_2354A3B1C();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235499C78(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235499CDC;
  return v6(a1);
}

uint64_t sub_235499CDC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_235499D28(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(uint64_t);
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2354A3BE8();
    result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_256236268);
      result = sub_2354A3BAC();
      v3 = result;
      v19 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2354A3BE8();
      result = swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  v19 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
  v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x23B7CCEC4](v6, v19);
    v9 = __OFADD__(v6++, 1);
    if (v9)
      goto LABEL_26;
LABEL_18:
    v20 = result;
    sub_2354A3A38();
    sub_23549A5C0(&qword_256236270, v8, MEMORY[0x24BDB9B70]);
    result = sub_2354A3A74();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      sub_23549A5C0(&qword_256236278, v8, MEMORY[0x24BDB9B78]);
      do
      {
        result = sub_2354A3A8C();
        if ((result & 1) != 0)
        {
          result = swift_release();
          v4 = v18;
          goto LABEL_11;
        }
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
      v4 = v18;
    }
    *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v20;
    v16 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v16, 1);
    v17 = v16 + 1;
    if (v9)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v17;
LABEL_11:
    v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
    if (v6 == v4)
      return v3;
  }
  if (v6 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_28;
  result = swift_retain();
  v9 = __OFADD__(v6++, 1);
  if (!v9)
    goto LABEL_18;
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CD260]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for URLActivityWrapper()
{
  uint64_t result;

  result = qword_2562368F0;
  if (!qword_2562368F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23549A038()
{
  swift_unknownObjectUnownedDestroy();
  return swift_deallocObject();
}

void sub_23549A05C()
{
  id Strong;

  Strong = (id)swift_unknownObjectUnownedLoadStrong();
  sub_235498488();

}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CD26C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23549A0D8(uint64_t a1)
{
  sub_2354985DC(a1);
}

uint64_t sub_23549A0E0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23549A0F0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for GroupSessionObserver()
{
  return objc_opt_self();
}

uint64_t sub_23549A120()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23549A144()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23549A170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23549A1BC;
  return sub_235499378((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_23549A1BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23549A204(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23549A248()
{
  unint64_t result;

  result = qword_256236188;
  if (!qword_256236188)
  {
    result = MEMORY[0x23B7CD278](&protocol conformance descriptor for GroupSessionState, &type metadata for GroupSessionState);
    atomic_store(result, (unint64_t *)&qword_256236188);
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupSessionState()
{
  return &type metadata for GroupSessionState;
}

uint64_t sub_23549A29C()
{
  return type metadata accessor for URLActivityWrapper();
}

uint64_t sub_23549A2A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2354A3864();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for GroupSessionWrapper()
{
  return objc_opt_self();
}

uint64_t sub_23549A330()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
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

uint64_t sub_23549A36C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23549A37C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23549A3C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23549A3E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23549A1BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256236210 + dword_256236210))(a1, v4);
}

unint64_t sub_23549A458()
{
  unint64_t result;

  result = qword_256236248;
  if (!qword_256236248)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256236248);
  }
  return result;
}

uint64_t sub_23549A494()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23549A4C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void (*v5)(void);
  id v6;
  uint64_t v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x23B7CD374](v1);
  if (v2)
  {
    v3 = v2;
    v4 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x60))();
    if (v4)
    {
      v5 = (void (*)(void))v4;
      v6 = objc_allocWithZone((Class)type metadata accessor for GroupSessionWrapper());
      v7 = swift_retain();
      v8 = sub_2354980A0(v7);
      v5();

      sub_23549A0F0((uint64_t)v5);
    }

  }
}

uint64_t sub_23549A580(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7CD278](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23549A5C0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7CD278](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23549A638()
{
  uint64_t v0;

  v0 = sub_2354A396C();
  __swift_allocate_value_buffer(v0, qword_256236908);
  __swift_project_value_buffer(v0, (uint64_t)qword_256236908);
  return sub_2354A3960();
}

uint64_t static MarketplaceKitWrapper.requestAppInstallation(topOrigin:url:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a3;
  v29 = a4;
  v6 = sub_2354A37A4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2354A3B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(v11, a2, v6);
  v16((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  sub_2354A3AF8();
  swift_retain();
  v17 = sub_2354A3AEC();
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (v8 + v18 + v19) & ~v18;
  v21 = (v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  v23 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v22 + 16) = v17;
  *(_QWORD *)(v22 + 24) = v23;
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v24(v22 + v19, v11, v6);
  v24(v22 + v20, v30, v6);
  v25 = v32;
  *(_QWORD *)(v22 + v21) = v31;
  v26 = (_QWORD *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8));
  v27 = v29;
  *v26 = v25;
  v26[1] = v27;
  sub_23549B0F8((uint64_t)v14, (uint64_t)&unk_256236288, v22);
  return swift_release();
}

uint64_t sub_23549A894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a4;
  v8[8] = a5;
  v9 = sub_2354A37A4();
  v8[11] = v9;
  v8[12] = *(_QWORD *)(v9 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  sub_2354A3AF8();
  v8[17] = sub_2354A3AEC();
  v8[18] = sub_2354A3AD4();
  v8[19] = v10;
  return swift_task_switch();
}

uint64_t sub_23549A954()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2354A37F8();
  *(_QWORD *)(v0 + 160) = sub_2354A37EC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v1;
  *v1 = v0;
  v1[1] = sub_23549A9BC;
  return sub_2354A37E0();
}

uint64_t sub_23549A9BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23549AA28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
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
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  swift_release();
  if (qword_256236900 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = sub_2354A396C();
  __swift_project_value_buffer(v7, (uint64_t)qword_256236908);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v2, v6, v4);
  v8(v3, v1, v4);
  v9 = sub_2354A3954();
  v10 = sub_2354A3B34();
  v11 = os_log_type_enabled(v9, v10);
  v13 = *(_QWORD *)(v0 + 120);
  v12 = *(_QWORD *)(v0 + 128);
  v14 = *(_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 96);
  if (v11)
  {
    v24 = *(_QWORD *)(v0 + 120);
    v16 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = v25;
    *(_DWORD *)v16 = 136643075;
    sub_23549BE18();
    v17 = sub_2354A3C18();
    *(_QWORD *)(v0 + 40) = sub_23549B7D8(v17, v18, &v26);
    sub_2354A3B7C();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v19(v12, v14);
    *(_WORD *)(v16 + 12) = 2085;
    v20 = sub_2354A3C18();
    *(_QWORD *)(v0 + 48) = sub_23549B7D8(v20, v21, &v26);
    sub_2354A3B7C();
    swift_bridgeObjectRelease();
    v19(v24, v14);
    _os_log_impl(&dword_235496000, v9, v10, "WKMarketplaceKit.requestAppInstallation with top origin %{sensitive}s for %{sensitive}s succeeded", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7CD2D8](v25, -1, -1);
    MEMORY[0x23B7CD2D8](v16, -1, -1);

  }
  else
  {
    v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v22(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 88));
    v22(v13, v14);

  }
  (*(void (**)(_QWORD))(v0 + 72))(0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23549ACCC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  void (*v30)(void *);
  id v31;
  os_log_type_t type;
  _QWORD *v34;
  NSObject *log;
  uint64_t v36;
  uint64_t v37;

  swift_release();
  swift_release();
  if (qword_256236900 != -1)
    swift_once();
  v1 = *(void **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 64);
  v8 = sub_2354A396C();
  __swift_project_value_buffer(v8, (uint64_t)qword_256236908);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v9(v2, v6, v4);
  v9(v3, v7, v4);
  v10 = v1;
  v11 = v1;
  v12 = sub_2354A3954();
  v13 = sub_2354A3B40();
  v14 = os_log_type_enabled(v12, v13);
  v15 = *(void **)(v0 + 176);
  v17 = *(_QWORD *)(v0 + 104);
  v16 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 88);
  v18 = *(_QWORD *)(v0 + 96);
  if (v14)
  {
    log = v12;
    v20 = swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v37 = v36;
    *(_DWORD *)v20 = 136643331;
    sub_23549BE18();
    v21 = sub_2354A3C18();
    type = v13;
    *(_QWORD *)(v0 + 16) = sub_23549B7D8(v21, v22, &v37);
    sub_2354A3B7C();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v16, v19);
    *(_WORD *)(v20 + 12) = 2085;
    v24 = sub_2354A3C18();
    *(_QWORD *)(v0 + 24) = sub_23549B7D8(v24, v25, &v37);
    sub_2354A3B7C();
    swift_bridgeObjectRelease();
    v23(v17, v19);
    *(_WORD *)(v20 + 22) = 2114;
    v26 = v15;
    v27 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v27;
    sub_2354A3B7C();
    *v34 = v27;

    _os_log_impl(&dword_235496000, log, type, "WKMarketplaceKit.requestAppInstallation with top origin %{sensitive}s for %{sensitive}s failed: %{public}@", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562362D0);
    swift_arrayDestroy();
    MEMORY[0x23B7CD2D8](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B7CD2D8](v36, -1, -1);
    MEMORY[0x23B7CD2D8](v20, -1, -1);

  }
  else
  {
    v28 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v28(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
    v28(v17, v19);

  }
  v29 = *(void **)(v0 + 176);
  v30 = *(void (**)(void *))(v0 + 72);
  v31 = v29;
  v30(v29);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23549B050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(sub_2354A37A4() - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (v5 + v3 + v4) & ~v3;
  v7 = v0 + v4;
  v8 = v0 + v6;
  v9 = (uint64_t *)(v0 + ((((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v12;
  *v12 = v1;
  v12[1] = sub_23549BF00;
  return sub_23549A894((uint64_t)v12, v13, v14, v7, v8, v15, v10, v11);
}

uint64_t sub_23549B0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2354A3B10();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2354A3B04();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23549A204(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2354A3AD4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_23549B4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_2354A3780();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id MarketplaceKitWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MarketplaceKitWrapper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MarketplaceKitWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MarketplaceKitWrapper()
{
  return objc_opt_self();
}

uint64_t sub_23549B610()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23549B634(uint64_t a1)
{
  uint64_t v1;

  sub_23549B4DC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = sub_2354A37A4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  swift_unknownObjectRelease();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23549B6F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(sub_2354A37A4() - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (v5 + v3 + v4) & ~v3;
  v7 = v0 + v4;
  v8 = v0 + v6;
  v9 = (uint64_t *)(v0 + ((((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v12;
  *v12 = v1;
  v12[1] = sub_23549A1BC;
  return sub_23549A894((uint64_t)v12, v13, v14, v7, v8, v15, v10, v11);
}

uint64_t sub_23549B79C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23549B7D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23549B8A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23549BE80((uint64_t)v12, *a3);
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
      sub_23549BE80((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23549B8A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2354A3B88();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23549BA60(a5, a6);
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
  v8 = sub_2354A3BD0();
  if (!v8)
  {
    sub_2354A3BDC();
    __break(1u);
LABEL_17:
    result = sub_2354A3C0C();
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

uint64_t sub_23549BA60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23549BAF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23549BCCC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23549BCCC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23549BAF4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23549BC68(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2354A3BB8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2354A3BDC();
      __break(1u);
LABEL_10:
      v2 = sub_2354A3AB0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2354A3C0C();
    __break(1u);
LABEL_14:
    result = sub_2354A3BDC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23549BC68(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562362D8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23549BCCC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562362D8);
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
  result = sub_2354A3C0C();
  __break(1u);
  return result;
}

unint64_t sub_23549BE18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2562362C8;
  if (!qword_2562362C8)
  {
    v1 = sub_2354A37A4();
    result = MEMORY[0x23B7CD278](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2562362C8);
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

uint64_t sub_23549BE80(uint64_t a1, uint64_t a2)
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

unint64_t WKTextAnimationType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t sub_23549BF18()
{
  uint64_t v0;

  v0 = sub_2354A396C();
  __swift_allocate_value_buffer(v0, qword_256236928);
  __swift_project_value_buffer(v0, (uint64_t)qword_256236928);
  return sub_2354A3960();
}

id sub_23549BF94(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[qword_256236D10];
  v5 = sub_2354A37C8();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

id _s14libWebKitSwift20TextAnimationManagerCACycfC_0()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_23549C050()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23549C07C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_256236D10;
  v2 = sub_2354A37C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_23549C0BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + qword_256236D10;
  v2 = sub_2354A37C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t variable initialization expression of TextAnimationManager.currentEffect@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_2354A39E4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

id sub_23549C134()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  id v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView;
  v2 = *(void **)&v0[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView];
  }
  else
  {
    v4 = v0;
    v5 = objc_allocWithZone((Class)sub_2354A39FC());
    v6 = v0;
    v7 = (void *)sub_2354A39F0();
    v8 = *(void **)&v0[v1];
    *(_QWORD *)&v4[v1] = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

uint64_t variable initialization expression of TextAnimationManager.$__lazy_storage_$_effectView()
{
  return 0;
}

uint64_t variable initialization expression of TextAnimationManager.chunkToEffect()
{
  return MEMORY[0x24BEE4B00];
}

uint64_t variable initialization expression of TextAnimationManager.delegate()
{
  return 0;
}

uint64_t TextAnimationManager.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  return MEMORY[0x23B7CD374](v1);
}

uint64_t TextAnimationManager.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*TextAnimationManager.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___WKSTextAnimationManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x23B7CD374](v5);
  return sub_23549C36C;
}

void sub_23549C36C(void **a1, char a2)
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

id TextAnimationManager.__allocating_init(with:)(void *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR___WKSTextAnimationManager_currentEffect];
  v5 = sub_2354A39E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___WKSTextAnimationManager_chunkToEffect] = MEMORY[0x24BEE4B00];
  swift_unknownObjectWeakInit();
  v11.receiver = v3;
  v11.super_class = v1;
  v6 = objc_msgSendSuper2(&v11, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v7 = v6;
  v8 = objc_msgSend(a1, sel_containingViewForTextAnimationType);
  v9 = sub_23549C134();
  objc_msgSend(v8, sel_addSubview_, v9);

  swift_unknownObjectRelease();
  return v7;
}

id TextAnimationManager.init(with:)(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[OBJC_IVAR___WKSTextAnimationManager_currentEffect];
  v5 = sub_2354A39E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v1[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___WKSTextAnimationManager_chunkToEffect] = MEMORY[0x24BEE4B00];
  swift_unknownObjectWeakInit();
  v11.receiver = v1;
  v11.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v11, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v7 = v6;
  v8 = objc_msgSend(a1, sel_containingViewForTextAnimationType);
  v9 = sub_23549C134();
  objc_msgSend(v8, sel_addSubview_, v9);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t TextAnimationManager.beginEffect(for:style:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  uint64_t v17;
  id v18;
  void (*v19)(char *, uint64_t, uint64_t);
  objc_class *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t, uint64_t);
  objc_class *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  uint64_t ObjectType;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;
  objc_super v46;
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;

  v3 = v2;
  ObjectType = swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562362E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2354A3A20();
  v9 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2354A37C8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2354A39E4();
  v43 = *(_QWORD *)(v16 - 8);
  v44 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v42 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23549C134();
  v40 = a1;
  v41 = v18;
  if (a2)
  {
    v37 = v8;
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v19(v15, a1, v12);
    v20 = (objc_class *)type metadata accessor for TextAnimationManager.TextEffectChunk(0);
    v21 = (char *)objc_allocWithZone(v20);
    v19(&v21[qword_256236D10], (uint64_t)v15, v12);
    v46.receiver = v21;
    v46.super_class = v20;
    objc_msgSendSuper2(&v46, sel_init);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    sub_23549C134();
    v48 = ObjectType;
    v49 = sub_23549A5C0(&qword_2562362E8, type metadata accessor for TextAnimationManager, (uint64_t)"9\n \x1Bt\x1B");
    v47[0] = v3;
    v3;
    sub_2354A3A14();
    sub_2354A3A08();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v39);
    v22 = sub_2354A399C();
    swift_allocObject();
    v23 = sub_2354A3984();
    v48 = v22;
    v49 = MEMORY[0x24BEBC198];
    v47[0] = v23;
    v24 = v41;
    v25 = v42;
    sub_2354A39A8();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
    v19(v15, v40, v12);
    v26 = v43;
    v27 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
    v8 = v37;
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v28(v15, a1, v12);
    v29 = (objc_class *)type metadata accessor for TextAnimationManager.TextEffectChunk(0);
    v30 = (char *)objc_allocWithZone(v29);
    v28(&v30[qword_256236D10], (uint64_t)v15, v12);
    v45.receiver = v30;
    v45.super_class = v29;
    objc_msgSendSuper2(&v45, sel_init);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    sub_23549C134();
    sub_2354A3A14();
    v31 = sub_2354A39CC();
    swift_allocObject();
    v32 = sub_2354A39C0();
    v48 = v31;
    v49 = MEMORY[0x24BEBC1C0];
    v47[0] = v32;
    v33 = v41;
    v25 = v42;
    sub_2354A39A8();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
    v28(v15, v40, v12);
    v26 = v43;
    v27 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  }
  v34 = v44;
  v27(v8, v25, v44);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v8, 0, 1, v34);
  swift_beginAccess();
  sub_23549CAC4((uint64_t)v8, (uint64_t)v15);
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v25, v34);
}

uint64_t type metadata accessor for TextAnimationManager.TextEffectChunk(uint64_t a1)
{
  return sub_23549CA90(a1, qword_256236B70);
}

uint64_t type metadata accessor for TextAnimationManager(uint64_t a1)
{
  return sub_23549CA90(a1, (uint64_t *)&unk_256236B60);
}

uint64_t sub_23549CA90(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23549CAC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562362E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2354A39E4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2354A04BC(a1, &qword_2562362E0);
    sub_23549EC34(a2, (uint64_t)v8);
    v13 = sub_2354A37C8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_2354A04BC((uint64_t)v8, &qword_2562362E0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_23549F4CC((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_2354A37C8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t TextAnimationManager.endEffect(for:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562362E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2354A39E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_23549EC34(a1, (uint64_t)v4);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_2354A04BC((uint64_t)v4, &qword_2562362E0);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v10 = sub_23549C134();
  sub_2354A39B4();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void TextAnimationManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t TextAnimationManager.targetedPreview(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[19] = a1;
  v2[20] = v1;
  sub_2354A3AF8();
  v2[21] = sub_2354A3AEC();
  v2[22] = sub_2354A3AD4();
  v2[23] = v3;
  return swift_task_switch();
}

uint64_t sub_23549D00C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;

  v1 = *(_QWORD *)(v0 + 160) + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  v2 = MEMORY[0x23B7CD374](v1);
  *(_QWORD *)(v0 + 192) = v2;
  if (!v2)
  {
    swift_release();
    if (qword_256236920 != -1)
      swift_once();
    v19 = sub_2354A396C();
    __swift_project_value_buffer(v19, (uint64_t)qword_256236928);
    v20 = sub_2354A3954();
    v21 = sub_2354A3B34();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_235496000, v20, v21, "Can't obtain Targeted Preview. Missing delegate.", v22, 2u);
      MEMORY[0x23B7CD2D8](v22, -1, -1);
    }

    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA30]), sel_initWithView_, v23);
    goto LABEL_14;
  }
  v3 = (void *)v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD888]), sel_init);
  v6 = objc_msgSend(v3, sel_containingViewForTextAnimationType);
  v7 = objc_msgSend(v3, sel_containingViewForTextAnimationType);
  objc_msgSend(v7, sel_center);
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD890]), sel_initWithContainer_center_, v6, v9, v11);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA30]), sel_initWithView_parameters_target_, v4, v5, v12);
  *(_QWORD *)(v0 + 200) = v13;

  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  if (swift_dynamicCastClass())
  {
    v14 = *(id *)(v0 + 152);
    v15 = sub_2354A37B0();
    *(_QWORD *)(v0 + 208) = v15;
    *(_QWORD *)(v0 + 56) = v0 + 144;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_23549D418;
    v16 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v17 = (_QWORD *)(v0 + 80);
    v17[1] = 0x40000000;
    v17[2] = sub_23549D5A8;
    v17[3] = &block_descriptor_0;
    v17[4] = v16;
    objc_msgSend(v3, sel_targetedPreviewForID_completionHandler_, v15, v17);
    return swift_continuation_await();
  }
  swift_release();
  if (qword_256236920 != -1)
    swift_once();
  v24 = sub_2354A396C();
  __swift_project_value_buffer(v24, (uint64_t)qword_256236928);
  v23 = sub_2354A3954();
  v25 = sub_2354A3B34();
  if (!os_log_type_enabled(v23, v25))
  {
    swift_unknownObjectRelease();
LABEL_14:

    return (*(uint64_t (**)(id))(v0 + 8))(v13);
  }
  v26 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v26 = 0;
  _os_log_impl(&dword_235496000, v23, v25, "Can't get text preview. Incorrect UITextEffectTextChunk subclass", v26, 2u);
  MEMORY[0x23B7CD2D8](v26, -1, -1);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(id))(v0 + 8))(v13);
}

uint64_t sub_23549D418()
{
  return swift_task_switch();
}

uint64_t sub_23549D45C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;

  v1 = *(void **)(v0 + 208);
  swift_release();
  v2 = *(_QWORD *)(v0 + 144);

  if (v2)
  {
    v3 = *(void **)(v0 + 152);

    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_256236920 != -1)
      swift_once();
    v4 = sub_2354A396C();
    __swift_project_value_buffer(v4, (uint64_t)qword_256236928);
    v5 = sub_2354A3954();
    v6 = sub_2354A3B34();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(void **)(v0 + 152);
    if (v7)
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_235496000, v5, v6, "Could not generate a UITargetedPreview", v9, 2u);
      MEMORY[0x23B7CD2D8](v9, -1, -1);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    v2 = *(_QWORD *)(v0 + 200);
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23549D5A8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_2354A04F8((uint64_t)&v6, v3, &qword_256236480);
  return swift_continuation_resume();
}

uint64_t sub_23549D728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_2354A3AF8();
  v3[5] = sub_2354A3AEC();
  sub_2354A3AD4();
  return swift_task_switch();
}

uint64_t sub_23549D798()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_23549D814;
  return TextAnimationManager.targetedPreview(for:)(v0[2]);
}

uint64_t sub_23549D814(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 48);
  v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t TextAnimationManager.updateTextChunkVisibilityForAnimation(_:visible:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 200) = a2;
  *(_QWORD *)(v3 + 144) = a1;
  *(_QWORD *)(v3 + 152) = v2;
  sub_2354A3AF8();
  *(_QWORD *)(v3 + 160) = sub_2354A3AEC();
  *(_QWORD *)(v3 + 168) = sub_2354A3AD4();
  *(_QWORD *)(v3 + 176) = v4;
  return swift_task_switch();
}

uint64_t sub_23549D904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;

  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  if (swift_dynamicCastClass())
  {
    v1 = *(_QWORD *)(v0 + 152) + OBJC_IVAR___WKSTextAnimationManager_delegate;
    swift_beginAccess();
    v2 = MEMORY[0x23B7CD374](v1);
    *(_QWORD *)(v0 + 184) = v2;
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(unsigned __int8 *)(v0 + 200);
      v5 = *(id *)(v0 + 144);
      v6 = sub_2354A37B0();
      *(_QWORD *)(v0 + 192) = v6;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_23549DBB8;
      v7 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v8 = (_QWORD *)(v0 + 80);
      v8[1] = 0x40000000;
      v8[2] = sub_23549DC4C;
      v8[3] = &block_descriptor_1;
      v8[4] = v7;
      objc_msgSend(v3, sel_updateUnderlyingTextVisibilityForTextAnimationID_visible_completionHandler_, v6, v4, v8);
      return swift_continuation_await();
    }
    v14 = *(id *)(v0 + 144);
    swift_release();
    if (qword_256236920 != -1)
      swift_once();
    v15 = sub_2354A396C();
    __swift_project_value_buffer(v15, (uint64_t)qword_256236928);
    v16 = sub_2354A3954();
    v17 = sub_2354A3B34();
    v18 = os_log_type_enabled(v16, v17);
    v11 = *(NSObject **)(v0 + 144);
    if (v18)
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_235496000, v16, v17, "Can't update Chunk Visibility. Missing delegate.", v19, 2u);
      MEMORY[0x23B7CD2D8](v19, -1, -1);

    }
    else
    {

      v11 = v16;
    }
  }
  else
  {
    swift_release();
    if (qword_256236920 != -1)
      swift_once();
    v10 = sub_2354A396C();
    __swift_project_value_buffer(v10, (uint64_t)qword_256236928);
    v11 = sub_2354A3954();
    v12 = sub_2354A3B34();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_235496000, v11, v12, "Can't update text visibility. Incorrect UITextEffectTextChunk subclass", v13, 2u);
      MEMORY[0x23B7CD2D8](v13, -1, -1);
    }
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23549DBB8()
{
  return swift_task_switch();
}

uint64_t sub_23549DBFC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 192);
  v2 = *(void **)(v0 + 144);
  swift_release();

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23549DC4C()
{
  return swift_continuation_resume();
}

uint64_t sub_23549DD8C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = a4;
  *(_BYTE *)(v4 + 64) = a2;
  *(_QWORD *)(v4 + 16) = a1;
  sub_2354A3AF8();
  *(_QWORD *)(v4 + 40) = sub_2354A3AEC();
  sub_2354A3AD4();
  return swift_task_switch();
}

uint64_t sub_23549DE00()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = *(void **)(v0 + 32);
  v3 = *(void **)(v0 + 16);
  v2 = *(const void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 48) = _Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_23549DE80;
  return TextAnimationManager.updateTextChunkVisibilityForAnimation(_:visible:)(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 64));
}

uint64_t sub_23549DE80()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 48);
  v2 = *(void **)(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t TextAnimationManager.performReplacementAndGeneratePreview(for:effect:animation:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256236308 + dword_256236308);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23549DF64;
  return v5(a1);
}

uint64_t sub_23549DF64(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t TextAnimationManager.replacementEffectDidComplete(_:)()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562362E0);
  MEMORY[0x24BDAC7A8](v1);
  v45 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236310);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236318);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_2354A37C8();
  v9 = *(_QWORD *)(v48 - 8);
  v10 = MEMORY[0x24BDAC7A8](v48);
  v44 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v47 = (char *)&v42 - v12;
  v13 = sub_2354A39E4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23549C134();
  sub_2354A3978();
  sub_2354A39B4();

  v43 = *(void (**)(char *, uint64_t))(v14 + 8);
  v43(v16, v13);
  v46 = v0;
  swift_beginAccess();
  v18 = swift_bridgeObjectRetain();
  sub_23549E514(v18, (uint64_t (*)(uint64_t, uint64_t))sub_23549FFD8, (uint64_t)v5);
  swift_bridgeObjectRelease();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236320);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v5, 1, v19) == 1)
  {
    sub_2354A04BC((uint64_t)v5, &qword_256236310);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236328);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, 1, 1, v20);
    return sub_2354A04BC((uint64_t)v8, &qword_256236318);
  }
  v21 = &v5[*(int *)(v19 + 48)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236328);
  v23 = &v8[*(int *)(v22 + 48)];
  v42 = v9;
  v24 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v25 = v48;
  v24(v8, v5, v48);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v23, v21, v13);
  v26 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v8, 0, 1, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v8, 1, v22) == 1)
    return sub_2354A04BC((uint64_t)v8, &qword_256236318);
  v28 = v25;
  v29 = &v8[*(int *)(v22 + 48)];
  v30 = v47;
  v24(v47, v8, v25);
  v43(v29, v13);
  v31 = v42;
  v32 = (uint64_t)v44;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v44, v30, v28);
  v33 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v45, 1, 1, v13);
  swift_beginAccess();
  sub_23549CAC4(v33, v32);
  swift_endAccess();
  v34 = v46 + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  v35 = MEMORY[0x23B7CD374](v34);
  if (v35)
  {
    v36 = (void *)v35;
    v37 = (void *)sub_2354A37B0();
    objc_msgSend(v36, sel_callCompletionHandlerForAnimationID_, v37);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_256236920 != -1)
      swift_once();
    v38 = sub_2354A396C();
    __swift_project_value_buffer(v38, (uint64_t)qword_256236928);
    v39 = sub_2354A3954();
    v40 = sub_2354A3B34();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_235496000, v39, v40, "Can't obtain Targeted Preview. Missing delegate.", v41, 2u);
      MEMORY[0x23B7CD2D8](v41, -1, -1);
    }

  }
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v28);
}

uint64_t sub_23549E47C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_2354A39E4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2354A3978();
  v4 = sub_2354A39D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_23549E514@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  unint64_t v16;
  uint64_t result;
  int64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t i;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;

  v42 = a3;
  v46 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236320);
  v55 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2354A39E4();
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2354A37C8();
  v49 = *(_QWORD *)(v8 - 8);
  v50 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236310);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 64);
  v43 = a1 + 64;
  v14 = 1 << *(_BYTE *)(a1 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v56 = a1;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  v51 = v4;
  v47 = v12;
  v19 = v48;
  v20 = v50;
  v21 = v52;
  if (!v16)
    goto LABEL_5;
LABEL_4:
  v57 = (v16 - 1) & v16;
  v58 = v18;
  for (i = __clz(__rbit64(v16)) | (v18 << 6); ; i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    v27 = v56;
    v28 = v49;
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, *(_QWORD *)(v56 + 48) + *(_QWORD *)(v49 + 72) * i, v20);
    v29 = *(_QWORD *)(v27 + 56);
    v30 = v53;
    v31 = v54;
    (*(void (**)(char *, unint64_t, uint64_t))(v53 + 16))(v21, v29 + *(_QWORD *)(v53 + 72) * i, v54);
    v4 = v51;
    v32 = &v47[*(int *)(v51 + 48)];
    v33 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v12 = v47;
    v33(v47, v19, v20);
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v32, v21, v31);
    v34 = v55;
    v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
    v35((uint64_t)v12, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v12, 1, v4) == 1)
      goto LABEL_27;
    v36 = v45;
    sub_2354A04F8((uint64_t)v12, v45, &qword_256236320);
    if ((v46(v36, v36 + *(int *)(v4 + 48)) & 1) != 0)
    {
      swift_release();
      v37 = v36;
      v38 = v42;
      sub_2354A04F8(v37, v42, &qword_256236320);
      v39 = v38;
      v40 = 0;
      return v35(v39, v40, 1, v4);
    }
    result = sub_2354A04BC(v36, &qword_256236320);
    v18 = v58;
    v16 = v57;
    if (v57)
      goto LABEL_4;
LABEL_5:
    v23 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v23 >= v44)
      goto LABEL_26;
    v24 = *(_QWORD *)(v43 + 8 * v23);
    v25 = v18 + 1;
    if (v24)
      goto LABEL_20;
    v25 = v18 + 2;
    if (v18 + 2 >= v44)
      goto LABEL_26;
    v24 = *(_QWORD *)(v43 + 8 * v25);
    if (v24)
      goto LABEL_20;
    v25 = v18 + 3;
    if (v18 + 3 >= v44)
      goto LABEL_26;
    v24 = *(_QWORD *)(v43 + 8 * v25);
    if (v24)
      goto LABEL_20;
    v25 = v18 + 4;
    if (v18 + 4 >= v44)
      goto LABEL_26;
    v24 = *(_QWORD *)(v43 + 8 * v25);
    if (v24)
      goto LABEL_20;
    v26 = v18 + 5;
    if (v18 + 5 >= v44)
    {
LABEL_26:
      v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
      v35((uint64_t)v12, 1, 1, v4);
LABEL_27:
      swift_release();
      v39 = v42;
      v40 = 1;
      return v35(v39, v40, 1, v4);
    }
    v24 = *(_QWORD *)(v43 + 8 * v26);
    if (!v24)
    {
      while (1)
      {
        v25 = v26 + 1;
        if (__OFADD__(v26, 1))
          goto LABEL_30;
        if (v25 >= v44)
          goto LABEL_26;
        v24 = *(_QWORD *)(v43 + 8 * v25);
        ++v26;
        if (v24)
          goto LABEL_20;
      }
    }
    v25 = v18 + 5;
LABEL_20:
    v57 = (v24 - 1) & v24;
    v58 = v25;
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23549E92C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256236308 + dword_256236308);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2354A053C;
  return v5(a1);
}

uint64_t sub_23549E9A0()
{
  return TextAnimationManager.replacementEffectDidComplete(_:)();
}

uint64_t sub_23549E9C0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23549BF00;
  return sub_2354A3990();
}

uint64_t sub_23549EA40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23549BF00;
  return v6();
}

uint64_t sub_23549EA94(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23549BF00;
  return v7();
}

uint64_t sub_23549EAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2354A3B10();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2354A3B04();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2354A04BC(a1, &qword_256236168);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2354A3AD4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23549EC34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23549ED94(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23549F84C();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_2354A37C8();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = sub_2354A39E4();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_23549F1F8(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = sub_2354A39E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_23549ED70(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_23549ED94(uint64_t a1)
{
  uint64_t v2;

  sub_2354A37C8();
  sub_23549A5C0(&qword_256236488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_2354A3A74();
  return sub_23549F70C(a1, v2);
}

uint64_t sub_23549EE00(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = sub_2354A39E4();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_2354A37C8();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256236490);
  v11 = sub_2354A3C00();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_23549A5C0(&qword_256236488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_2354A3A74();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

unint64_t sub_23549F1F8(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_2354A37C8();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_2354A3BA0();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_23549A5C0(&qword_256236488, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_2354A3A74();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(sub_2354A39E4() - 8) + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23549F4CC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_2354A37C8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23549ED94(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = sub_2354A39E4();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_23549F84C();
      goto LABEL_7;
    }
    sub_23549EE00(v17, a3 & 1);
    v24 = sub_23549ED94(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_23549F654(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_2354A3C24();
  __break(1u);
  return result;
}

uint64_t sub_23549F654(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2354A37C8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_2354A39E4();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_23549F70C(uint64_t a1, uint64_t a2)
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
  v5 = sub_2354A37C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      sub_23549A5C0(&qword_256236498, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_2354A3A8C();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

char *sub_23549F84C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = sub_2354A39E4();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2354A37C8();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256236490);
  v33 = v0;
  v3 = *v0;
  v4 = sub_2354A3BF4();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23549FB2C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[19] = a1;
  v2[20] = v1;
  sub_2354A3AF8();
  v2[21] = sub_2354A3AEC();
  v2[22] = sub_2354A3AD4();
  v2[23] = v3;
  return swift_task_switch();
}

uint64_t sub_23549FB98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint8_t *v18;

  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  if (swift_dynamicCastClass())
  {
    v1 = *(_QWORD *)(v0 + 160) + OBJC_IVAR___WKSTextAnimationManager_delegate;
    swift_beginAccess();
    v2 = MEMORY[0x23B7CD374](v1);
    *(_QWORD *)(v0 + 192) = v2;
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(id *)(v0 + 152);
      v5 = sub_2354A37B0();
      *(_QWORD *)(v0 + 200) = v5;
      *(_QWORD *)(v0 + 56) = v0 + 144;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_23549FE50;
      v6 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v7 = (_QWORD *)(v0 + 80);
      v7[1] = 0x40000000;
      v7[2] = sub_23549D5A8;
      v7[3] = &block_descriptor_37;
      v7[4] = v6;
      objc_msgSend(v3, sel_targetedPreviewForID_completionHandler_, v5, v7);
      return swift_continuation_await();
    }
    v13 = *(id *)(v0 + 152);
    swift_release();
    if (qword_256236920 != -1)
      swift_once();
    v14 = sub_2354A396C();
    __swift_project_value_buffer(v14, (uint64_t)qword_256236928);
    v15 = sub_2354A3954();
    v16 = sub_2354A3B34();
    v17 = os_log_type_enabled(v15, v16);
    v10 = *(NSObject **)(v0 + 152);
    if (v17)
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_235496000, v15, v16, "Can't obtain Targeted Preview. Missing delegate.", v18, 2u);
      MEMORY[0x23B7CD2D8](v18, -1, -1);

    }
    else
    {

      v10 = v15;
    }
  }
  else
  {
    swift_release();
    if (qword_256236920 != -1)
      swift_once();
    v9 = sub_2354A396C();
    __swift_project_value_buffer(v9, (uint64_t)qword_256236928);
    v10 = sub_2354A3954();
    v11 = sub_2354A3B34();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_235496000, v10, v11, "Can't get text preview. Incorrect UITextEffectTextChunk subclass", v12, 2u);
      MEMORY[0x23B7CD2D8](v12, -1, -1);
    }
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23549FE50()
{
  return swift_task_switch();
}

uint64_t sub_23549FE94()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;

  v1 = *(void **)(v0 + 200);
  swift_release();
  v2 = *(_QWORD *)(v0 + 144);

  if (v2)
  {

    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_256236920 != -1)
      swift_once();
    v3 = sub_2354A396C();
    __swift_project_value_buffer(v3, (uint64_t)qword_256236928);
    v4 = sub_2354A3954();
    v5 = sub_2354A3B34();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 152);
    if (v6)
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_235496000, v4, v5, "Could not generate a UITargetedPreview", v8, 2u);
      MEMORY[0x23B7CD2D8](v8, -1, -1);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23549FFD8()
{
  return sub_23549E47C();
}

unint64_t sub_23549FFE8()
{
  unint64_t result;

  result = qword_256236330[0];
  if (!qword_256236330[0])
  {
    result = MEMORY[0x23B7CD278](&protocol conformance descriptor for WKTextAnimationType, &type metadata for WKTextAnimationType);
    atomic_store(result, qword_256236330);
  }
  return result;
}

ValueMetadata *type metadata accessor for WKTextAnimationType()
{
  return &type metadata for WKTextAnimationType;
}

uint64_t sub_2354A003C()
{
  return type metadata accessor for TextAnimationManager(0);
}

void sub_2354A0044()
{
  unint64_t v0;

  sub_2354A00D0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2354A00D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256236370)
  {
    sub_2354A39E4();
    v0 = sub_2354A3B70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256236370);
  }
}

uint64_t sub_2354A0124()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2354A37C8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2354A0198()
{
  return type metadata accessor for TextAnimationManager.TextEffectChunk(0);
}

uint64_t sub_2354A01A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_2354A01D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23549A1BC;
  return ((uint64_t (*)(uint64_t, char, uint64_t, uint64_t))((char *)&dword_256236420 + dword_256236420))(v2, v3, v5, v4);
}

uint64_t sub_2354A0254()
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
  v5[1] = sub_23549BF00;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256236430 + dword_256236430))(v2, v3, v4);
}

uint64_t sub_2354A02D0(uint64_t a1)
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
  v7[1] = sub_23549BF00;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256236440 + dword_256236440))(a1, v4, v5, v6);
}

uint64_t sub_2354A0354()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2354A0378(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23549A1BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256236450 + dword_256236450))(a1, v4);
}

uint64_t sub_2354A03E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2354A041C()
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
  v5[1] = sub_23549BF00;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256236460 + dword_256236460))(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2354A04BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2354A04F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double WKTextExtractionItem.rectInWebView.getter()
{
  return sub_2354A18B8(&OBJC_IVAR___WKTextExtractionItem_rectInWebView);
}

uint64_t WKTextExtractionItem.children.getter()
{
  return swift_bridgeObjectRetain();
}

id WKTextExtractionItem.__allocating_init(with:children:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  char *v11;
  double *v12;
  objc_super v14;

  v11 = (char *)objc_allocWithZone(v5);
  v12 = (double *)&v11[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v12 = a2;
  v12[1] = a3;
  v12[2] = a4;
  v12[3] = a5;
  *(_QWORD *)&v11[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v14.receiver = v11;
  v14.super_class = v5;
  return objc_msgSendSuper2(&v14, sel_init);
}

id WKTextExtractionItem.init(with:children:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  double *v6;
  objc_super v8;

  v6 = (double *)&v5[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(_QWORD *)&v5[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for WKTextExtractionItem()
{
  return objc_opt_self();
}

id WKTextExtractionItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WKTextExtractionItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WKTextExtractionItem.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionItem);
}

unint64_t WKTextExtractionContainer.init(rawValue:)(unint64_t a1)
{
  return sub_2354A1C10(a1);
}

unint64_t sub_2354A0720@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2354A1C10(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t WKTextExtractionContainerItem.container.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionContainerItem_container);
}

id WKTextExtractionContainerItem.__allocating_init(container:rectInWebView:children:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  objc_class *v6;
  char *v13;
  double *v14;
  objc_super v16;

  v13 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v13[OBJC_IVAR___WKTextExtractionContainerItem_container] = a1;
  v14 = (double *)&v13[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v14 = a3;
  v14[1] = a4;
  v14[2] = a5;
  v14[3] = a6;
  *(_QWORD *)&v13[OBJC_IVAR___WKTextExtractionItem_children] = a2;
  v16.receiver = v13;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v16, sel_init);
}

id WKTextExtractionContainerItem.init(container:rectInWebView:children:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  double *v7;
  objc_super v9;

  *(_QWORD *)&v6[OBJC_IVAR___WKTextExtractionContainerItem_container] = a1;
  v7 = (double *)&v6[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v7 = a3;
  v7[1] = a4;
  v7[2] = a5;
  v7[3] = a6;
  *(_QWORD *)&v6[OBJC_IVAR___WKTextExtractionItem_children] = a2;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v9, sel_init);
}

void WKTextExtractionContainerItem.__allocating_init(with:children:)()
{
  sub_2354A17C4();
}

void WKTextExtractionContainerItem.init(with:children:)()
{
  sub_2354A17C4();
}

id WKTextExtractionContainerItem.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionContainerItem);
}

uint64_t WKTextExtractionEditable.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionEditable_label);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionEditable.placeholder.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionEditable_placeholder);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionEditable.isSecure.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WKTextExtractionEditable_isSecure);
}

uint64_t WKTextExtractionEditable.isFocused.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WKTextExtractionEditable_isFocused);
}

id WKTextExtractionEditable.__allocating_init(label:placeholder:isSecure:isFocused:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  objc_class *v6;
  _BYTE *v13;
  _QWORD *v14;
  _QWORD *v15;
  objc_super v17;

  v13 = objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___WKTextExtractionEditable_label];
  *v14 = a1;
  v14[1] = a2;
  v15 = &v13[OBJC_IVAR___WKTextExtractionEditable_placeholder];
  *v15 = a3;
  v15[1] = a4;
  v13[OBJC_IVAR___WKTextExtractionEditable_isSecure] = a5;
  v13[OBJC_IVAR___WKTextExtractionEditable_isFocused] = a6;
  v17.receiver = v13;
  v17.super_class = v6;
  return objc_msgSendSuper2(&v17, sel_init);
}

id WKTextExtractionEditable.init(label:placeholder:isSecure:isFocused:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  _BYTE *v6;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  v7 = &v6[OBJC_IVAR___WKTextExtractionEditable_label];
  *v7 = a1;
  v7[1] = a2;
  v8 = &v6[OBJC_IVAR___WKTextExtractionEditable_placeholder];
  *v8 = a3;
  v8[1] = a4;
  v6[OBJC_IVAR___WKTextExtractionEditable_isSecure] = a5;
  v6[OBJC_IVAR___WKTextExtractionEditable_isFocused] = a6;
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for WKTextExtractionEditable();
  return objc_msgSendSuper2(&v10, sel_init);
}

void WKTextExtractionEditable.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WKTextExtractionEditable.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionEditable);
}

id WKTextExtractionLink.url.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___WKTextExtractionLink_url);
}

uint64_t WKTextExtractionLink.range.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionLink_range);
}

id WKTextExtractionLink.__allocating_init(url:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR___WKTextExtractionLink_url] = a1;
  v8 = &v7[OBJC_IVAR___WKTextExtractionLink_range];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id WKTextExtractionLink.init(url:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_super v6;

  *(_QWORD *)&v3[OBJC_IVAR___WKTextExtractionLink_url] = a1;
  v4 = &v3[OBJC_IVAR___WKTextExtractionLink_range];
  *(_QWORD *)v4 = a2;
  *((_QWORD *)v4 + 1) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for WKTextExtractionLink();
  return objc_msgSendSuper2(&v6, sel_init);
}

void WKTextExtractionLink.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WKTextExtractionLink.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionLink);
}

uint64_t WKTextExtractionTextItem.content.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionTextItem_content);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionTextItem.selectedRange.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
}

id sub_2354A0E9C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  void *v4;

  a4();
  swift_bridgeObjectRetain();
  v4 = (void *)sub_2354A3ABC();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t WKTextExtractionTextItem.links.getter()
{
  return swift_bridgeObjectRetain();
}

void *WKTextExtractionTextItem.editable.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___WKTextExtractionTextItem_editable);
  v2 = v1;
  return v1;
}

id WKTextExtractionTextItem.__allocating_init(content:selectedRange:links:editable:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  objc_class *v11;
  char *v23;
  char *v24;
  char *v25;
  double *v26;
  objc_super v28;

  v23 = (char *)objc_allocWithZone(v11);
  v24 = &v23[OBJC_IVAR___WKTextExtractionTextItem_content];
  *(_QWORD *)v24 = a1;
  *((_QWORD *)v24 + 1) = a2;
  v25 = &v23[OBJC_IVAR___WKTextExtractionTextItem_selectedRange];
  *(_QWORD *)v25 = a3;
  *((_QWORD *)v25 + 1) = a4;
  *(_QWORD *)&v23[OBJC_IVAR___WKTextExtractionTextItem_links] = a5;
  *(_QWORD *)&v23[OBJC_IVAR___WKTextExtractionTextItem_editable] = a6;
  v26 = (double *)&v23[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v26 = a8;
  v26[1] = a9;
  v26[2] = a10;
  v26[3] = a11;
  *(_QWORD *)&v23[OBJC_IVAR___WKTextExtractionItem_children] = a7;
  v28.receiver = v23;
  v28.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v28, sel_init);
}

id WKTextExtractionTextItem.init(content:selectedRange:links:editable:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  char *v11;
  char *v12;
  char *v13;
  double *v14;
  objc_super v16;

  v12 = &v11[OBJC_IVAR___WKTextExtractionTextItem_content];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v11[OBJC_IVAR___WKTextExtractionTextItem_selectedRange];
  *(_QWORD *)v13 = a3;
  *((_QWORD *)v13 + 1) = a4;
  *(_QWORD *)&v11[OBJC_IVAR___WKTextExtractionTextItem_links] = a5;
  *(_QWORD *)&v11[OBJC_IVAR___WKTextExtractionTextItem_editable] = a6;
  v14 = (double *)&v11[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v14 = a8;
  v14[1] = a9;
  v14[2] = a10;
  v14[3] = a11;
  *(_QWORD *)&v11[OBJC_IVAR___WKTextExtractionItem_children] = a7;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v16, sel_init);
}

void WKTextExtractionTextItem.__allocating_init(with:children:)()
{
  sub_2354A17C4();
}

void WKTextExtractionTextItem.init(with:children:)()
{
  sub_2354A17C4();
}

void sub_2354A11FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

id WKTextExtractionTextItem.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionTextItem);
}

double WKTextExtractionScrollableItem.contentSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
}

id WKTextExtractionScrollableItem.__allocating_init(contentSize:rectInWebView:children:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  objc_class *v7;
  char *v15;
  double *v16;
  double *v17;
  objc_super v19;

  v15 = (char *)objc_allocWithZone(v7);
  v16 = (double *)&v15[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  *v16 = a2;
  v16[1] = a3;
  v17 = (double *)&v15[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v17 = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  *(_QWORD *)&v15[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v19.receiver = v15;
  v19.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v19, sel_init);
}

id WKTextExtractionScrollableItem.init(contentSize:rectInWebView:children:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  char *v7;
  double *v8;
  double *v9;
  objc_super v11;

  v8 = (double *)&v7[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  *v8 = a2;
  v8[1] = a3;
  v9 = (double *)&v7[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v9 = a4;
  v9[1] = a5;
  v9[2] = a6;
  v9[3] = a7;
  *(_QWORD *)&v7[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v11, sel_init);
}

void WKTextExtractionScrollableItem.__allocating_init(with:children:)()
{
  sub_2354A17C4();
}

void WKTextExtractionScrollableItem.init(with:children:)()
{
  sub_2354A17C4();
}

id WKTextExtractionScrollableItem.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionScrollableItem);
}

uint64_t WKTextExtractionImageItem.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionImageItem_name);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_2354A1508()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_2354A3A98();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WKTextExtractionImageItem.altText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WKTextExtractionImageItem_altText);
  swift_bridgeObjectRetain();
  return v1;
}

id WKTextExtractionImageItem.__allocating_init(name:altText:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  objc_class *v9;
  char *v19;
  char *v20;
  char *v21;
  double *v22;
  objc_super v24;

  v19 = (char *)objc_allocWithZone(v9);
  v20 = &v19[OBJC_IVAR___WKTextExtractionImageItem_name];
  *(_QWORD *)v20 = a1;
  *((_QWORD *)v20 + 1) = a2;
  v21 = &v19[OBJC_IVAR___WKTextExtractionImageItem_altText];
  *(_QWORD *)v21 = a3;
  *((_QWORD *)v21 + 1) = a4;
  v22 = (double *)&v19[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v22 = a6;
  v22[1] = a7;
  v22[2] = a8;
  v22[3] = a9;
  *(_QWORD *)&v19[OBJC_IVAR___WKTextExtractionItem_children] = a5;
  v24.receiver = v19;
  v24.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v24, sel_init);
}

id WKTextExtractionImageItem.init(name:altText:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  char *v9;
  char *v10;
  char *v11;
  double *v12;
  objc_super v14;

  v10 = &v9[OBJC_IVAR___WKTextExtractionImageItem_name];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR___WKTextExtractionImageItem_altText];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v12 = (double *)&v9[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *v12 = a6;
  v12[1] = a7;
  v12[2] = a8;
  v12[3] = a9;
  *(_QWORD *)&v9[OBJC_IVAR___WKTextExtractionItem_children] = a5;
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v14, sel_init);
}

void WKTextExtractionImageItem.__allocating_init(with:children:)()
{
  sub_2354A17C4();
}

void sub_2354A17C4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void WKTextExtractionImageItem.init(with:children:)()
{
  sub_2354A17C4();
}

uint64_t sub_2354A1808()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id WKTextExtractionImageItem.__deallocating_deinit()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionImageItem);
}

uint64_t sub_2354A185C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_2354A18A4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return *(double *)(a1 + *a3);
}

double sub_2354A18B8(_QWORD *a1)
{
  uint64_t v1;

  return *(double *)(v1 + *a1);
}

id sub_2354A18CC(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  objc_class *v6;
  char *v13;
  uint64_t *v14;
  double *v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = (uint64_t *)&v13[OBJC_IVAR___WKTextExtractionRequest_completionHandler];
  *v14 = 0;
  v14[1] = 0;
  v15 = (double *)&v13[OBJC_IVAR___WKTextExtractionRequest_rectInWebView];
  *v15 = a3;
  v15[1] = a4;
  v15[2] = a5;
  v15[3] = a6;
  v16 = *v14;
  *v14 = a1;
  v14[1] = a2;
  swift_retain();
  sub_23549A0F0(v16);
  v19.receiver = v13;
  v19.super_class = v6;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  swift_release();
  return v17;
}

uint64_t sub_2354A1A74(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)(v1 + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  v3 = *(void (**)(uint64_t))(v1 + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  if (v3)
  {
    v4 = result;
    swift_retain();
    v3(v4);
    v5 = *v2;
    *v2 = 0;
    v2[1] = 0;
    sub_23549A0F0(v5);
    return sub_23549A0F0((uint64_t)v3);
  }
  return result;
}

id sub_2354A1BC0()
{
  return sub_2354A1BCC(type metadata accessor for WKTextExtractionRequest);
}

id sub_2354A1BCC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2354A1C10(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t type metadata accessor for WKTextExtractionContainerItem()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionEditable()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionLink()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionTextItem()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionScrollableItem()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionImageItem()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WKTextExtractionRequest()
{
  return objc_opt_self();
}

unint64_t sub_2354A1D04()
{
  unint64_t result;

  result = qword_256236590;
  if (!qword_256236590)
  {
    result = MEMORY[0x23B7CD278](&protocol conformance descriptor for WKTextExtractionContainer, &type metadata for WKTextExtractionContainer);
    atomic_store(result, (unint64_t *)&qword_256236590);
  }
  return result;
}

ValueMetadata *type metadata accessor for WKTextExtractionContainer()
{
  return &type metadata for WKTextExtractionContainer;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2354A1D68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2354A1D88(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_2354A1EAC(a1, &qword_2562366D8);
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_2354A1EAC(a1, &qword_2562366E0);
}

uint64_t sub_2354A1DD8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_2354A1E14(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2354A1E34(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_2354A1EAC(a1, &qword_2562366E8);
}

uint64_t sub_2354A1E74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_2354A1EAC(a1, &qword_2562366F0);
}

void sub_2354A1EAC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2354A1F00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t KeyPath;
  void (*v44)(_BYTE *, _QWORD);
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void (*v59)(_BYTE *, _QWORD);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  char *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  void (*v84)(char *, char *, uint64_t);
  unint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  _BYTE v93[40];

  v78 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236708);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236710);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236208);
  MEMORY[0x24BDAC7A8](v9);
  v81 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236718);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v72 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236720);
  v89 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v80 = (uint64_t)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v82 = (uint64_t)&v72 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v72 - v22;
  v24 = sub_2354A375C();
  MEMORY[0x24BDAC7A8](v24);
  v25 = sub_2354A372C();
  v90 = *(_QWORD *)(v25 - 8);
  v91 = v25;
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v72 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v26);
  v88 = (char *)&v72 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v72 - v31;
  type metadata accessor for WKTextExtractionTextItem();
  v33 = swift_dynamicCastClass();
  if (!v33)
  {
    type metadata accessor for WKTextExtractionImageItem();
    if (swift_dynamicCastClass())
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v38 = v78;
      sub_2354A38DC();
      v39 = *MEMORY[0x24BEBB958];
      v40 = sub_2354A38E8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v38, v39, v40);
    }
    else
    {
      v61 = *MEMORY[0x24BEBB940];
      v62 = sub_2354A38E8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104))(v78, v61, v62);
    }
  }
  v74 = v28;
  v75 = v8;
  v76 = v5;
  v34 = v33;
  v73 = a1;
  swift_bridgeObjectRetain();
  sub_2354A3750();
  sub_2354A3738();
  v77 = v34;
  v35 = *(_QWORD *)(v34 + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
  if (v35 != sub_2354A3720())
  {
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v88, v32, v91);
    sub_23549A5C0(&qword_256236728, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC588]);
    sub_2354A3B28();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48))(v16, 1, v17) == 1)
    {
      v36 = &qword_256236718;
      v37 = (uint64_t)v16;
    }
    else
    {
      sub_2354A358C((uint64_t)v16, (uint64_t)v23);
      v42 = v82;
      sub_2354A35D4((uint64_t)v23, v82);
      KeyPath = swift_getKeyPath();
      *(&v72 - 2) = MEMORY[0x24BDAC7A8](KeyPath);
      swift_getKeyPath();
      v92 = 1;
      sub_2354A3690();
      v44 = (void (*)(_BYTE *, _QWORD))sub_2354A3744();
      sub_23549A5C0(&qword_256236740, MEMORY[0x24BEBB878], MEMORY[0x24BEBB870]);
      sub_2354A3768();
      v44(v93, 0);
      sub_2354A04BC(v42, &qword_256236720);
      v37 = (uint64_t)v23;
      v36 = &qword_256236720;
    }
    sub_2354A04BC(v37, v36);
  }
  v83 = *(_QWORD *)(v77 + OBJC_IVAR___WKTextExtractionTextItem_links);
  if (v83 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2354A3BE8();
    v45 = result;
    v87 = v32;
    if (result)
      goto LABEL_11;
  }
  else
  {
    v45 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v87 = v32;
    if (v45)
    {
LABEL_11:
      if (v45 < 1)
      {
        __break(1u);
        return result;
      }
      v46 = 0;
      v47 = v83;
      v85 = v83 & 0xC000000000000001;
      v86 = v45;
      v79 = v14;
      do
      {
        if (v85)
          v50 = (id)MEMORY[0x23B7CCEC4](v46, v47);
        else
          v50 = *(id *)(v47 + 8 * v46 + 32);
        v51 = v50;
        v84 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
        v84(v88, v32, v91);
        sub_23549A5C0(&qword_256236728, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC588]);
        sub_2354A3B28();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v89 + 48))(v14, 1, v17) == 1)
        {

          v48 = (uint64_t)v14;
          v49 = &qword_256236718;
        }
        else
        {
          v52 = (uint64_t)v14;
          v53 = v80;
          sub_2354A358C(v52, v80);
          v54 = v82;
          sub_2354A35D4(v53, v82);
          v55 = swift_getKeyPath();
          *(&v72 - 2) = MEMORY[0x24BDAC7A8](v55);
          swift_getKeyPath();
          v56 = v17;
          v57 = v81;
          sub_2354A3798();
          v58 = sub_2354A37A4();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v57, 0, 1, v58);
          sub_2354A3690();
          v59 = (void (*)(_BYTE *, _QWORD))sub_2354A3744();
          sub_2354A3620();
          v17 = v56;
          sub_2354A3768();
          v59(v93, 0);

          v60 = v54;
          v47 = v83;
          sub_2354A04BC(v60, &qword_256236720);
          v48 = v53;
          v14 = v79;
          v49 = &qword_256236720;
        }
        sub_2354A04BC(v48, v49);
        ++v46;
        v32 = v87;
      }
      while (v86 != v46);
      swift_bridgeObjectRelease();
      v84(v74, v32, v91);
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v74, v32, v91);
LABEL_25:
  v63 = *(void **)(v77 + OBJC_IVAR___WKTextExtractionTextItem_editable);
  v64 = v75;
  if (v63)
  {
    v65 = v63;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32 = v87;
    sub_2354A38C4();
    v66 = sub_2354A38D0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v64, 0, 1, v66);

  }
  else
  {
    v67 = sub_2354A38D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v64, 1, 1, v67);
  }
  v68 = v78;
  v69 = sub_2354A390C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v76, 1, 1, v69);
  sub_2354A38A0();

  (*(void (**)(char *, uint64_t))(v90 + 8))(v32, v91);
  v70 = *MEMORY[0x24BEBB950];
  v71 = sub_2354A38E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 104))(v68, v70, v71);
}

uint64_t sub_2354A288C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354A2918(a1, a2, a3, &qword_256236748);
}

uint64_t sub_2354A2898(uint64_t a1, uint64_t a2)
{
  return sub_2354A2978(a1, a2, &qword_256236748);
}

uint64_t sub_2354A28A4()
{
  sub_23549A5C0(&qword_256236740, MEMORY[0x24BEBB878], MEMORY[0x24BEBB870]);
  return sub_2354A3774();
}

uint64_t sub_2354A28EC()
{
  return sub_2354A38B8();
}

uint64_t sub_2354A290C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2354A2918(a1, a2, a3, &qword_256236750);
}

uint64_t sub_2354A2918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_2354A3A8C() & 1;
}

uint64_t sub_2354A296C(uint64_t a1, uint64_t a2)
{
  return sub_2354A2978(a1, a2, &qword_256236750);
}

uint64_t sub_2354A2978(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_2354A3A80();
}

void sub_2354A29B8()
{
  sub_2354A3620();
  sub_2354A3774();
  __break(1u);
}

void sub_2354A29DC()
{
  sub_2354A38AC();
  __break(1u);
}

size_t sub_2354A29F4@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t result;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = sub_2354A38F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2354A38E8();
  MEMORY[0x24BDAC7A8](v8);
  sub_2354A1F00(a1, (uint64_t)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BEE4AF8];
  sub_2354A3888();
  v11 = *(_QWORD *)&a1[OBJC_IVAR___WKTextExtractionItem_children];
  if (!(v11 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return sub_2354A3894();
  }
  swift_bridgeObjectRetain();
  v12 = sub_2354A3BE8();
  if (!v12)
    goto LABEL_13;
LABEL_3:
  v21 = v10;
  result = sub_2354A33FC(0, v12 & ~(v12 >> 63), 0);
  if ((v12 & 0x8000000000000000) == 0)
  {
    v20 = a2;
    v14 = 0;
    v15 = v21;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
        v16 = (id)MEMORY[0x23B7CCEC4](v14, v11);
      else
        v16 = *(id *)(v11 + 8 * v14 + 32);
      v17 = v16;
      sub_2354A29F4();

      v21 = v15;
      v19 = *(_QWORD *)(v15 + 16);
      v18 = *(_QWORD *)(v15 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2354A33FC(v18 > 1, v19 + 1, 1);
        v15 = v21;
      }
      ++v14;
      *(_QWORD *)(v15 + 16) = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v19, v7, v4);
    }
    while (v12 != v14);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2354A2C50()
{
  sub_2354A2C70();
  return swift_getObjCClassFromMetadata();
}

unint64_t WKWebView._intelligenceBaseClass.getter()
{
  return sub_2354A2C70();
}

unint64_t sub_2354A2C70()
{
  unint64_t result;

  result = qword_2562366F8;
  if (!qword_2562366F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2562366F8);
  }
  return result;
}

uint64_t WKWebView._intelligenceCollectContent(in:collector:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v6[4];

  v0 = sub_2354A38E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2354A387C();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_2354A3900();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEBB960], v0);
  sub_2354A3870();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_2354A2DB4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  _QWORD v12[4];

  v5 = sub_2354A38E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = a1;
  sub_2354A387C();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_2354A3900();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEBB960], v5);
  sub_2354A3870();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

}

uint64_t WKWebView._intelligenceCollectRemoteContent(in:remoteContextWrapper:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = v4;
  sub_2354A3948();
  v10 = sub_2354A393C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v5;
  *(double *)(v11 + 24) = a1;
  *(double *)(v11 + 32) = a2;
  *(double *)(v11 + 40) = a3;
  *(double *)(v11 + 48) = a4;
  *(_QWORD *)(v11 + 56) = v10;
  v12 = v5;
  swift_retain();
  sub_2354A3930();
  swift_release();
  return swift_release();
}

uint64_t sub_2354A2F64(uint64_t result, void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];

  if (result)
  {
    v13 = result;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    *(_QWORD *)(v14 + 24) = a3;
    v16[4] = sub_2354A33DC;
    v16[5] = v14;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_2354A3128;
    v16[3] = &block_descriptor_1;
    v15 = _Block_copy(v16);
    swift_retain_n();
    swift_retain();
    swift_release();
    objc_msgSend(a2, sel__requestTextExtractionIn_completionHandler_, v15, a4, a5, a6, a7);
    _Block_release(v15);
    return swift_release();
  }
  return result;
}

uint64_t sub_2354A307C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v8;

  v2 = sub_2354A38F4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v6 = a1;
    sub_2354A29F4(v6, (uint64_t)v5);
    sub_2354A3918();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_2354A3924();
}

void sub_2354A3128(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_2354A317C(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  sub_2354A3948();
  v13 = a7;
  v14 = a1;
  v15 = sub_2354A393C();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  *(double *)(v16 + 24) = a2;
  *(double *)(v16 + 32) = a3;
  *(double *)(v16 + 40) = a4;
  *(double *)(v16 + 48) = a5;
  *(_QWORD *)(v16 + 56) = v15;
  v17 = v14;
  swift_retain();
  sub_2354A3930();

  swift_release();
  return swift_release();
}

uint64_t sub_2354A324C(void *a1, int a2, void *aBlock, double a4, double a5, double a6, double a7)
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v12 = _Block_copy(aBlock);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  type metadata accessor for WKTextExtractionRequest();
  v14 = a1;
  swift_retain();
  v15 = sub_2354A18CC((uint64_t)sub_23549A36C, v13, a4, a5, a6, a7);
  v16 = sub_2354A37D4();
  v17 = objc_retainAutorelease(v14);
  objc_msgSend(v17, sel_performSelector_withObject_, v16, v15);

  return swift_release();
}

uint64_t sub_2354A3348()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2354A339C(uint64_t a1)
{
  uint64_t v1;

  return sub_2354A2F64(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 56), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_2354A33B0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2354A33DC(void *a1)
{
  return sub_2354A307C(a1);
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

size_t sub_2354A33FC(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_2354A3418(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_2354A3418(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256236700);
  v10 = *(_QWORD *)(sub_2354A38F4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_2354A38F4() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2354A358C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2354A35D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2354A3620()
{
  unint64_t result;

  result = qword_256236730;
  if (!qword_256236730)
  {
    result = MEMORY[0x23B7CD278](MEMORY[0x24BDCC090], MEMORY[0x24BDCC0A0]);
    atomic_store(result, (unint64_t *)&qword_256236730);
  }
  return result;
}

uint64_t sub_2354A3664()
{
  return 8;
}

uint64_t sub_2354A3670()
{
  return swift_release();
}

uint64_t sub_2354A3678(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_2354A3684(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_2354A3690()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256236738;
  if (!qword_256236738)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256236720);
    result = MEMORY[0x23B7CD278](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_256236738);
  }
  return result;
}

uint64_t sub_2354A36DC()
{
  return sub_23549A5C0(&qword_256236740, MEMORY[0x24BEBB878], MEMORY[0x24BEBB870]);
}

uint64_t sub_2354A3708()
{
  return 8;
}

uint64_t sub_2354A3720()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_2354A372C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_2354A3738()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_2354A3744()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_2354A3750()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_2354A375C()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_2354A3768()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_2354A3774()
{
  return MEMORY[0x24BEBB648]();
}

uint64_t sub_2354A3780()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2354A378C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2354A3798()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2354A37A4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2354A37B0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2354A37BC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2354A37C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2354A37D4()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_2354A37E0()
{
  return MEMORY[0x24BDDB240]();
}

uint64_t sub_2354A37EC()
{
  return MEMORY[0x24BDDB288]();
}

uint64_t sub_2354A37F8()
{
  return MEMORY[0x24BDDB290]();
}

uint64_t sub_2354A3804()
{
  return MEMORY[0x24BDD1E10]();
}

uint64_t sub_2354A3810()
{
  return MEMORY[0x24BDD1E58]();
}

uint64_t sub_2354A381C()
{
  return MEMORY[0x24BDD1E60]();
}

uint64_t sub_2354A3828()
{
  return MEMORY[0x24BDD1E68]();
}

uint64_t sub_2354A3834()
{
  return MEMORY[0x24BDD1E88]();
}

uint64_t sub_2354A3840()
{
  return MEMORY[0x24BDD1E90]();
}

uint64_t sub_2354A384C()
{
  return MEMORY[0x24BDD1EE8]();
}

uint64_t sub_2354A3858()
{
  return MEMORY[0x24BDD1F20]();
}

uint64_t sub_2354A3864()
{
  return MEMORY[0x24BDD1F30]();
}

uint64_t sub_2354A3870()
{
  return MEMORY[0x24BEBB670]();
}

uint64_t sub_2354A387C()
{
  return MEMORY[0x24BEBB678]();
}

uint64_t sub_2354A3888()
{
  return MEMORY[0x24BEBB7A8]();
}

uint64_t sub_2354A3894()
{
  return MEMORY[0x24BEBB7E0]();
}

uint64_t sub_2354A38A0()
{
  return MEMORY[0x24BEBB858]();
}

uint64_t sub_2354A38AC()
{
  return MEMORY[0x24BEBB868]();
}

uint64_t sub_2354A38B8()
{
  return MEMORY[0x24BEBB888]();
}

uint64_t sub_2354A38C4()
{
  return MEMORY[0x24BEBB8B0]();
}

uint64_t sub_2354A38D0()
{
  return MEMORY[0x24BEBB8B8]();
}

uint64_t sub_2354A38DC()
{
  return MEMORY[0x24BEBB8D0]();
}

uint64_t sub_2354A38E8()
{
  return MEMORY[0x24BEBB988]();
}

uint64_t sub_2354A38F4()
{
  return MEMORY[0x24BEBB9B8]();
}

uint64_t sub_2354A3900()
{
  return MEMORY[0x24BEBBAD0]();
}

uint64_t sub_2354A390C()
{
  return MEMORY[0x24BEBBAE0]();
}

uint64_t sub_2354A3918()
{
  return MEMORY[0x24BEBBC48]();
}

uint64_t sub_2354A3924()
{
  return MEMORY[0x24BEBBC90]();
}

uint64_t sub_2354A3930()
{
  return MEMORY[0x24BEBBC98]();
}

uint64_t sub_2354A393C()
{
  return MEMORY[0x24BEBBCA0]();
}

uint64_t sub_2354A3948()
{
  return MEMORY[0x24BEBBCA8]();
}

uint64_t sub_2354A3954()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2354A3960()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2354A396C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2354A3978()
{
  return MEMORY[0x24BEBC178]();
}

uint64_t sub_2354A3984()
{
  return MEMORY[0x24BEBC180]();
}

uint64_t sub_2354A3990()
{
  return MEMORY[0x24BEBC188]();
}

uint64_t sub_2354A399C()
{
  return MEMORY[0x24BEBC1A0]();
}

uint64_t sub_2354A39A8()
{
  return MEMORY[0x24BEBC1A8]();
}

uint64_t sub_2354A39B4()
{
  return MEMORY[0x24BEBC1B0]();
}

uint64_t sub_2354A39C0()
{
  return MEMORY[0x24BEBC1B8]();
}

uint64_t sub_2354A39CC()
{
  return MEMORY[0x24BEBC1C8]();
}

uint64_t sub_2354A39D8()
{
  return MEMORY[0x24BEBC1D0]();
}

uint64_t sub_2354A39E4()
{
  return MEMORY[0x24BEBC1D8]();
}

uint64_t sub_2354A39F0()
{
  return MEMORY[0x24BEBC1E8]();
}

uint64_t sub_2354A39FC()
{
  return MEMORY[0x24BEBC1F0]();
}

uint64_t sub_2354A3A08()
{
  return MEMORY[0x24BEBC758]();
}

uint64_t sub_2354A3A14()
{
  return MEMORY[0x24BEBC760]();
}

uint64_t sub_2354A3A20()
{
  return MEMORY[0x24BEBC768]();
}

uint64_t sub_2354A3A2C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2354A3A38()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_2354A3A44()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2354A3A50()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2354A3A5C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2354A3A68()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2354A3A74()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2354A3A80()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_2354A3A8C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2354A3A98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2354A3AA4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2354A3AB0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2354A3ABC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2354A3AC8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2354A3AD4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2354A3AE0()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2354A3AEC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2354A3AF8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2354A3B04()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2354A3B10()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2354A3B1C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2354A3B28()
{
  return MEMORY[0x24BDCFD58]();
}

uint64_t sub_2354A3B34()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2354A3B40()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2354A3B4C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2354A3B58()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2354A3B64()
{
  return MEMORY[0x24BDD2010]();
}

uint64_t sub_2354A3B70()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2354A3B7C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2354A3B88()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2354A3B94()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2354A3BA0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2354A3BAC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2354A3BB8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2354A3BC4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2354A3BD0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2354A3BDC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2354A3BE8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2354A3BF4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2354A3C00()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2354A3C0C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2354A3C18()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2354A3C24()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2354A3C30()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2354A3C3C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2354A3C48()
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
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

