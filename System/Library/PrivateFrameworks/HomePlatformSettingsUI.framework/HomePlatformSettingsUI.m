void sub_224D908AC(void *a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, a1);
  v3 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD380);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_224DA4C00;
  v5 = objc_msgSend(a1, sel_centerXAnchor);
  v6 = objc_msgSend(v1, sel_centerXAnchor);
  v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v6);

  *(_QWORD *)(v4 + 32) = v7;
  v8 = objc_msgSend(a1, sel_centerYAnchor);
  v9 = objc_msgSend(v1, sel_centerYAnchor);
  v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  *(_QWORD *)(v4 + 40) = v10;
  sub_224DA416C();
  sub_224D90AB8();
  v11 = (id)sub_224DA4148();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v11);

}

BOOL sub_224D90A48(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_224D90A5C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_224D90A6C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22768D208]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_224D90AB8()
{
  unint64_t result;

  result = qword_2557DD388;
  if (!qword_2557DD388)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557DD388);
  }
  return result;
}

void type metadata accessor for SDBetaManagerErrorType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2557DD390)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2557DD390);
  }
}

uint64_t sub_224D90B48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id sub_224D90B50(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  (*(void (**)(void))(a2 + 8))();
  swift_getMetatypeMetadata();
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  return v5;
}

unint64_t sub_224D90C1C()
{
  return 0xD000000000000020;
}

void sub_224D90C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  id v7;

  v6 = sub_224D90B50(a4, a5);
  v7 = (id)sub_224DA410C();
  objc_msgSend(v6, sel_ulog_message_, a1, v7);

}

void sub_224D90CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_224D90C38(40, a1, a2, a3, a4);
}

unint64_t sub_224D90CC4()
{
  sub_224D90C1C();
  return 0xD000000000000020;
}

unint64_t sub_224D90CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for Loader(0, *(_QWORD *)(a1 + 80), a3, a4);
  sub_224D90C1C();
  return 0xD000000000000020;
}

uint64_t sub_224D90D0C(double a1)
{
  id v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  objc_msgSend(v2, sel_setMaximumFractionDigits_, 3);
  if (a1 >= 0.001)
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, a1);
    v5 = objc_msgSend(v2, sel_stringFromNumber_, v4);

    if (v5)
    {
      v6 = sub_224DA4118();

      v7 = v6;
      sub_224DA413C();
    }
    else
    {
      v7 = 0;
      sub_224DA41CC();
    }

    return v7;
  }
  else
  {

    return 0x736D31203CLL;
  }
}

uint64_t sub_224D90E34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_224D90E4C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = v0;
  *(_QWORD *)(v1 + 96) = *v0;
  return swift_task_switch();
}

void sub_224D90E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  sub_224DA4238();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_224DA413C();
  v3 = *(_BYTE *)(v2 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 128);
  *(_BYTE *)(v0 + 32) = v3;
  sub_224DA4250();
  sub_224D90C38(60, *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), v1, (uint64_t)&off_24ECF0710);
  swift_bridgeObjectRelease();
  __asm { BR              X12 }
}

uint64_t sub_224D90F68@<X0>(unint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  void *v4;
  _BYTE *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 168);
  if ((v2 & 0x8000000000000000) != 0 || v2 < a1)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 120) = v3;
    *v3 = v1;
    v3[1] = sub_224D9125C;
    v3[3] = *(_QWORD *)(v1 + 88);
    return swift_task_switch();
  }
  else
  {
    sub_224D92614();
    v4 = (void *)swift_allocError();
    *v5 = 2;
    swift_willThrow();
    sub_224DA4238();
    *(_QWORD *)(v1 + 56) = 0;
    *(_QWORD *)(v1 + 64) = 0xE000000000000000;
    sub_224DA413C();
    *(_QWORD *)(v1 + 72) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
    sub_224DA4250();
    *(_QWORD *)(v1 + 80) = type metadata accessor for XPCConnectionManager();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD550);
    sub_224DA4124();
    v6 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v7 = (void *)sub_224DA410C();
    v8 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v6, sel_initWithSubsystem_category_, v7, v8);

    v10 = (void *)sub_224DA410C();
    objc_msgSend(v9, sel_ulog_message_, 60, v10);

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_224D911F0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D9125C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D912C8()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v1 = *(void **)(v0 + 112);
  sub_224DA4238();
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 72) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 80) = type metadata accessor for XPCConnectionManager();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD550);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D91464()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v1 = *(void **)(v0 + 128);
  sub_224DA4238();
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 72) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 80) = type metadata accessor for XPCConnectionManager();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD550);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D91600()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_224D91618()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0[3];
  sub_224DA4238();
  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v1 + 168);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v6 = v0[3];
    v0[2] = v5;
    sub_224DA4280();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA413C();
    sub_224D9F258(0xD000000000000015, 0x8000000224DA5FC0);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v6 + 160) = 0;
    swift_release();
    sub_224DA4190();
    v0[4] = sub_224DA4184();
    sub_224DA4178();
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_224D91738()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release();
  v2 = *(void **)(v1 + 152);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    v3 = *(void **)(v1 + 152);
    *(_QWORD *)(v1 + 152) = 0;

  }
  return swift_task_switch();
}

void sub_224D91794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 + 168);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 168) = v4;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v5;
    *v5 = v0;
    v5[1] = sub_224D917F4;
    sub_224D91D64();
  }
}

uint64_t sub_224D917F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D9183C(double a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_224DA4238();
  sub_224DA413C();
  sub_224DA41CC();
  sub_224DA413C();
  sub_224D9F258(v8, v9);
  swift_bridgeObjectRelease();
  v4 = sub_224DA41A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = swift_allocObject();
  swift_weakInit();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(double *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = v5;
  return sub_224D91C38((uint64_t)v3, (uint64_t)&unk_2557DD540, v6);
}

uint64_t sub_224D919A8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 48) = a5;
  *(double *)(v5 + 40) = a1;
  return swift_task_switch();
}

void sub_224D919C4()
{
  uint64_t v0;
  double v1;
  _QWORD *v2;

  v1 = *(double *)(v0 + 40) * 1000000000.0;
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 1.84467441e19)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *v2 = v0;
    v2[1] = sub_224D91A60;
    sub_224DA41C0();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_224D91A60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_224D91ACC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t Strong;
  _QWORD *v5;

  v1 = v0[8];
  sub_224DA41B4();
  if (v1)
  {
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  v0[9] = Strong;
  if (!Strong)
  {
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  v5 = (_QWORD *)swift_task_alloc();
  v0[10] = v5;
  *v5 = v0;
  v5[1] = sub_224D91B90;
  v5[3] = Strong;
  return swift_task_switch();
}

uint64_t sub_224D91B90()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D91C04()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D91C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_224DA41A8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_224DA419C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_224D927F0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_224DA4178();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_224D91D64()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1[8] = v0;
  v1[9] = *v0;
  sub_224DA4190();
  v1[10] = sub_224DA4184();
  v1[11] = sub_224DA4178();
  v1[12] = v2;
  return swift_task_switch();
}

uint64_t sub_224D91DD8()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 64) + 152))
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_224D9F258(0x676E697472617453, 0xE800000000000000);
    return swift_task_switch();
  }
}

uint64_t sub_224D91E50()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[8];
  v0[13] = *(_QWORD *)(v1 + 112);
  v0[14] = *(_QWORD *)(v1 + 120);
  swift_unknownObjectRetain();
  return swift_task_switch();
}

uint64_t sub_224D91EA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE *v12;

  v1 = v0[13];
  swift_release();
  if (v1)
  {
    v2 = v0[14];
    ObjectType = swift_getObjectType();
    v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
    swift_unknownObjectRelease();
    v5 = v0[8];
    v6 = v0[9];
    v0[6] = sub_224D9259C;
    v0[7] = v5;
    v7 = MEMORY[0x24BDAC760];
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_224D92358;
    v0[5] = &block_descriptor;
    v8 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v6;
    v0[6] = sub_224D925CC;
    v0[7] = v9;
    v0[2] = v7;
    v0[3] = 1107296256;
    v0[4] = sub_224D92358;
    v0[5] = &block_descriptor_5;
    v10 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v4, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v4, sel_resume);
    sub_224D9F258(0xD000000000000012, 0x8000000224DA5F80);
    v11 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v4;

  }
  else
  {
    sub_224D92614();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
  }
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_224D92084()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_224DA41A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = swift_allocObject();
  swift_weakInit();
  sub_224DA4190();
  swift_retain();
  v4 = sub_224DA4184();
  v5 = (_QWORD *)swift_allocObject();
  v6 = MEMORY[0x24BEE6930];
  v5[2] = v4;
  v5[3] = v6;
  v5[4] = v3;
  swift_release();
  sub_224D984A8((uint64_t)v1, (uint64_t)&unk_2557DD530, (uint64_t)v5);
  return swift_release();
}

uint64_t sub_224D92190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a1;
  v4[6] = a4;
  sub_224DA4190();
  v4[7] = sub_224DA4184();
  v4[8] = sub_224DA4178();
  v4[9] = v5;
  return swift_task_switch();
}

uint64_t sub_224D921FC()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  _QWORD *v3;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 80) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)Strong;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v3;
    *v3 = v0;
    v3[1] = sub_224D922C0;
    v3[11] = v2;
    v3[12] = *v2;
    return swift_task_switch();
  }
  else
  {
    swift_release();
    **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 80) == 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D922C0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_224D92314()
{
  uint64_t v0;

  swift_release();
  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 80) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D92358(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_224D92384()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for XPCConnectionManager()
{
  return objc_opt_self();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCConnectionManager.ReconnectPolicy(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCConnectionManager.ReconnectPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_224D9247C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_224D92498(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCConnectionManager.ReconnectPolicy()
{
  return &type metadata for XPCConnectionManager.ReconnectPolicy;
}

uint64_t sub_224D924C0()
{
  uint64_t v0;

  return v0;
}

BOOL sub_224D924CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_224D924E0()
{
  sub_224DA42EC();
  sub_224DA42F8();
  return sub_224DA4304();
}

uint64_t sub_224D92524()
{
  return sub_224DA42F8();
}

uint64_t sub_224D9254C()
{
  sub_224DA42EC();
  sub_224DA42F8();
  return sub_224DA4304();
}

uint64_t sub_224D9259C()
{
  return sub_224D92084();
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

uint64_t sub_224D925BC()
{
  return swift_deallocObject();
}

void sub_224D925CC()
{
  uint64_t v0;

  sub_224D90CAC(0x6164696C61766E49, 0xEB00000000646574, *(_QWORD *)(v0 + 16), (uint64_t)&off_24ECF0710);
}

unint64_t sub_224D92614()
{
  unint64_t result;

  result = qword_2557DD518;
  if (!qword_2557DD518)
  {
    result = MEMORY[0x22768D220](&unk_224DA4E18, &type metadata for XPCConnectionManager.ManagerError);
    atomic_store(result, (unint64_t *)&qword_2557DD518);
  }
  return result;
}

uint64_t sub_224D92658()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_224D9267C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D926A8(uint64_t a1)
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
  v7[1] = sub_224D92714;
  return sub_224D92190(a1, v4, v5, v6);
}

uint64_t sub_224D92714()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D9275C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D92788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_224D92714;
  v4[6] = v3;
  v4[5] = v2;
  return swift_task_switch();
}

uint64_t sub_224D927F0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCConnectionManager.ManagerError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCConnectionManager.ManagerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D92918 + 4 * byte_224DA4CD9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_224D9294C + 4 * byte_224DA4CD4[v4]))();
}

uint64_t sub_224D9294C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D92954(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D9295CLL);
  return result;
}

uint64_t sub_224D92968(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D92970);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_224D92974(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9297C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D92988(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_224D92990(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCConnectionManager.ManagerError()
{
  return &type metadata for XPCConnectionManager.ManagerError;
}

unint64_t sub_224D929AC()
{
  unint64_t result;

  result = qword_2557DD558;
  if (!qword_2557DD558)
  {
    result = MEMORY[0x22768D220](&unk_224DA4DF0, &type metadata for XPCConnectionManager.ManagerError);
    atomic_store(result, (unint64_t *)&qword_2557DD558);
  }
  return result;
}

id sub_224D929F8()
{
  return sub_224D92A0C();
}

id sub_224D92A0C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);
  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_224DA3F68();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_224D92AC0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_224D92AC8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_224D92AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_224D92AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_224D92AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t initializeBufferWithCopyOfBuffer for AnalyticsString(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnalyticsString()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AnalyticsString(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AnalyticsString(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for AnalyticsString(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsString(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsString(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsString()
{
  return &type metadata for AnalyticsString;
}

uint64_t destroy for AnalyticsFloat()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22HomePlatformSettingsUI14AnalyticsFloatVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AnalyticsFloat(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_QWORD *)(a1 + 13) = *(_QWORD *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AnalyticsFloat(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsFloat(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 21))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsFloat(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 21) = 1;
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
    *(_BYTE *)(result + 21) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsFloat()
{
  return &type metadata for AnalyticsFloat;
}

uint64_t sub_224D92E78()
{
  return MEMORY[0x24BEE1558];
}

uint64_t sub_224D92E84()
{
  return MEMORY[0x24BEE0D70];
}

uint64_t sub_224D92E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  uint64_t result;

  if (a2)
  {
    v5 = a5;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_224D92ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, void (*a12)(void))
{
  uint64_t (*v12)(void);
  uint64_t result;

  v12 = (uint64_t (*)(void))a12;
  if (a11 == 1)
  {
    a12();
    v12 = (uint64_t (*)(void))a12;
    return v12();
  }
  if (!a11)
    return v12();
  return result;
}

void sub_224D92F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

ValueMetadata *type metadata accessor for StatusInfoView()
{
  return &type metadata for StatusInfoView;
}

uint64_t sub_224D92FE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_224D92FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
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
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t KeyPath;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v137 = a2;
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD5F8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v136 = (uint64_t)&v101 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD600);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (uint64_t *)((char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD608);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD610);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v119 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_224DA404C();
  v10 = *(_QWORD *)(v9 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD618);
  v14 = *(_QWORD *)(v13 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD620);
  v17 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v101 - v21;
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD *)(a1 + 8);
  v26 = *(_QWORD *)(a1 + 16);
  v25 = *(_QWORD *)(a1 + 24);
  v27 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 80))
  {
    if (*(_BYTE *)(a1 + 80) == 1)
    {
      v113 = *(_QWORD *)a1;
      v114 = v27;
      v115 = v25;
      v28 = *(_QWORD *)(a1 + 48);
      v104 = *(_QWORD *)(a1 + 40);
      v29 = *(_QWORD *)(a1 + 56);
      v30 = *(_QWORD *)(a1 + 64);
      v31 = *(void **)(a1 + 72);
      v116 = v24;
      v107 = v26;
      v105 = v30;
      if (v24)
      {
        v32 = v26;
        sub_224D94290(a1, (void (*)(void))sub_224D92E90);
        v33 = v32;
        v34 = v31;
        v35 = v28;
        v36 = v114;
        sub_224D92E90(v113, v24, v33, v115, v114);
        v37 = v36;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v28 = v35;
        v31 = v34;
        v125 = sub_224DA407C();
        v126 = v38;
        v132 = v39 & 1;
        v133 = v40;
        KeyPath = swift_getKeyPath();
        v130 = sub_224DA4070();
        v129 = swift_getKeyPath();
        v138 = sub_224DA40B8();
        v128 = (char *)swift_getKeyPath();

        v30 = v105;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v127 = 1;
      }
      else
      {
        sub_224D94290(a1, (void (*)(void))sub_224D92E90);
        v125 = 0;
        v126 = 0;
        v132 = 0;
        v133 = 0;
        v130 = 0;
        KeyPath = 0;
        v127 = 0;
        v128 = 0;
        v129 = 0;
        v138 = 0;
      }
      v108 = v5;
      v103 = v28;
      v102 = v29;
      v101 = v31;
      if (v28)
      {
        sub_224D92E90(v104, v28, v29, v30, v31);
        v53 = v31;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v121 = sub_224DA407C();
        v112 = v54;
        v111 = v55;
        v110 = v56 & 1;
        v124 = swift_getKeyPath();
        v123 = sub_224DA4064();
        v122 = swift_getKeyPath();
        v109 = sub_224DA40B8();
        v57 = swift_getKeyPath();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v120 = 1;
      }
      else
      {
        v121 = 0;
        v112 = 0;
        v110 = 0;
        v111 = 0;
        v123 = 0;
        v124 = 0;
        v120 = 0;
        v122 = 0;
        v57 = 0;
        v109 = 0;
      }
      v106 = v57;
      v76 = v125;
      v75 = v126;
      v77 = v132;
      sub_224D93FCC(v125, v126, v132, v133);
      v78 = v120;
      sub_224D93FCC(v121, v112, v110, v111);
      sub_224D93FCC(v76, v75, v77, v133);
      v79 = v121;
      v80 = v112;
      v81 = v110;
      v82 = v111;
      v120 = v78;
      sub_224D93FCC(v121, v112, v110, v111);
      sub_224D94054(v79, v80, v81, v82);
      v83 = (uint64_t)v128;
      v84 = v125;
      v85 = v126;
      v86 = v132;
      v87 = v133;
      v88 = v130;
      v89 = KeyPath;
      v90 = v127;
      v91 = v129;
      sub_224D94054(v125, v126, v132, v133);
      v92 = v108;
      *v108 = v84;
      v92[1] = v85;
      v92[2] = v86;
      v92[3] = v87;
      v92[4] = v89;
      v92[5] = v90;
      v92[6] = v91;
      v92[7] = v88;
      v93 = v138;
      v92[8] = v83;
      v92[9] = v93;
      v94 = v112;
      v92[10] = v121;
      v92[11] = v94;
      LOBYTE(v89) = v110;
      v95 = v111;
      v92[12] = v110;
      v92[13] = v95;
      v96 = v120;
      v92[14] = v124;
      v92[15] = v96;
      v97 = v123;
      v92[16] = v122;
      v92[17] = v97;
      v98 = v109;
      v92[18] = v106;
      v92[19] = v98;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD640);
      v99 = MEMORY[0x24BDF5428];
      sub_224D946E0(&qword_2557DD630, &qword_2557DD608, MEMORY[0x24BDF5428]);
      sub_224D946E0(&qword_2557DD638, &qword_2557DD640, v99);
      v100 = (uint64_t)v119;
      sub_224DA4034();
      sub_224D94210(v100, v136, &qword_2557DD610);
      swift_storeEnumTagMultiPayload();
      sub_224D93EE4();
      sub_224DA4034();
      sub_224D92F58(v104, v103, v102, v105, v101);
      sub_224D92F58(v113, v116, v107, v115, v114);
      sub_224D94054(v121, v94, v89, v95);
      sub_224D94054(v125, v126, v132, v133);
      return sub_224D94254(v100, &qword_2557DD610);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_224D93EE4();
      return sub_224DA4034();
    }
  }
  else
  {
    v108 = v5;
    v128 = v7;
    v133 = v18;
    v113 = v23;
    v116 = v24;
    v129 = (uint64_t)v22;
    v41 = v20;
    v107 = v26;
    v115 = v25;
    v114 = v27;
    v42 = v19;
    sub_224D92E90(v23, v116, v26, v25, v27);
    sub_224DA3FB0();
    sub_224DA4040();
    sub_224D946E0(&qword_2557DD648, &qword_2557DD618, MEMORY[0x24BDEBC00]);
    sub_224D941C8();
    sub_224DA40A0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32);
    v127 = v41;
    v43(v129, v41, v133);
    v123 = a1;
    if (v116)
    {
      sub_224D94290(a1, (void (*)(void))sub_224D92E90);
      v44 = v114;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45 = sub_224DA407C();
      v132 = v46;
      v130 = v48;
      KeyPath = v47 & 1;
      v49 = swift_getKeyPath();
      v138 = sub_224DA4064();
      v125 = swift_getKeyPath();
      v124 = sub_224DA40B8();
      v50 = swift_getKeyPath();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v51 = 1;
    }
    else
    {
      v45 = 0;
      v130 = 0;
      KeyPath = 0;
      v132 = 0;
      v49 = 0;
      v51 = 0;
      v124 = 0;
      v125 = 0;
      v138 = 0;
      v50 = 0;
    }
    v59 = v127;
    v58 = (uint64_t)v128;
    v122 = v42;
    v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
    v61 = v133;
    v60(v127, v129, v133);
    v60(v58, v59, v61);
    v62 = (uint64_t *)(v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557DD658) + 48));
    v63 = v45;
    v126 = v45;
    v64 = v130;
    *v62 = v45;
    v62[1] = v64;
    v65 = v64;
    v67 = KeyPath;
    v66 = v132;
    v62[2] = KeyPath;
    v62[3] = v66;
    v62[4] = v49;
    v62[5] = v51;
    v68 = v124;
    v69 = v138;
    v62[6] = v125;
    v62[7] = v69;
    v138 = v69;
    v70 = v50;
    v62[8] = v50;
    v62[9] = v68;
    v71 = v65;
    v132 = v66;
    sub_224D93FCC(v63, v65, v67, v66);
    v120 = v70;
    v121 = v49;
    v130 = v71;
    KeyPath = v67;
    sub_224D93FCC(v63, v71, v67, v66);
    sub_224D94054(v126, v71, v67, v66);
    v122 = *(_QWORD *)(v122 + 8);
    ((void (*)(uint64_t, uint64_t))v122)(v127, v133);
    v72 = (uint64_t)v128;
    sub_224D94210((uint64_t)v128, (uint64_t)v108, &qword_2557DD608);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD640);
    v73 = MEMORY[0x24BDF5428];
    sub_224D946E0(&qword_2557DD630, &qword_2557DD608, MEMORY[0x24BDF5428]);
    sub_224D946E0(&qword_2557DD638, &qword_2557DD640, v73);
    v74 = (uint64_t)v119;
    sub_224DA4034();
    sub_224D94254(v72, &qword_2557DD608);
    sub_224D94210(v74, v136, &qword_2557DD610);
    swift_storeEnumTagMultiPayload();
    sub_224D93EE4();
    sub_224DA4034();
    sub_224D94290(v123, (void (*)(void))sub_224D92F58);
    sub_224D94054(v126, v130, KeyPath, v132);
    sub_224D94254(v74, &qword_2557DD610);
    return ((uint64_t (*)(uint64_t, uint64_t))v122)(v129, v133);
  }
}

uint64_t sub_224D93DA4()
{
  return sub_224DA40AC();
}

uint64_t sub_224D93DBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v20[5];
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD5E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_OWORD *)(v1 + 48);
  v20[2] = *(_OWORD *)(v1 + 32);
  v20[3] = v6;
  v20[4] = *(_OWORD *)(v1 + 64);
  v21 = *(_BYTE *)(v1 + 80);
  v7 = *(_OWORD *)(v1 + 16);
  v20[0] = *(_OWORD *)v1;
  v20[1] = v7;
  *(_QWORD *)v5 = sub_224DA4010();
  *((_QWORD *)v5 + 1) = 0x4020000000000000;
  v5[16] = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD5E8);
  sub_224D92FF4((uint64_t)v20, (uint64_t)&v5[*(int *)(v8 + 44)]);
  v9 = sub_224DA4058();
  sub_224DA3FA4();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  sub_224D94210((uint64_t)v5, a1, &qword_2557DD5E0);
  v18 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557DD5F0) + 36);
  *(_BYTE *)v18 = v9;
  *(_QWORD *)(v18 + 8) = v11;
  *(_QWORD *)(v18 + 16) = v13;
  *(_QWORD *)(v18 + 24) = v15;
  *(_QWORD *)(v18 + 32) = v17;
  *(_BYTE *)(v18 + 40) = 0;
  return sub_224D94254((uint64_t)v5, &qword_2557DD5E0);
}

unint64_t sub_224D93EE4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2557DD628;
  if (!qword_2557DD628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557DD610);
    v2 = MEMORY[0x24BDF5428];
    v3[0] = sub_224D946E0(&qword_2557DD630, &qword_2557DD608, MEMORY[0x24BDF5428]);
    v3[1] = sub_224D946E0(&qword_2557DD638, &qword_2557DD640, v2);
    result = MEMORY[0x22768D220](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2557DD628);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22768D214](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_224D93FCC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_224D94044(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_224D94044(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_224D94054(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_224D940CC(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_224D940CC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_224D940DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224DA3FD4();
  *a1 = result;
  return result;
}

uint64_t sub_224D94104()
{
  return sub_224DA3FE0();
}

uint64_t sub_224D94128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_224DA3FEC();
  *a1 = result;
  return result;
}

uint64_t sub_224D94150()
{
  swift_retain();
  return sub_224DA3FF8();
}

uint64_t sub_224D94178@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_224DA3FBC();
  *a1 = result;
  return result;
}

uint64_t sub_224D941A0()
{
  swift_retain();
  return sub_224DA3FC8();
}

unint64_t sub_224D941C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557DD650;
  if (!qword_2557DD650)
  {
    v1 = sub_224DA404C();
    result = MEMORY[0x22768D220](MEMORY[0x24BDF07A8], v1);
    atomic_store(result, (unint64_t *)&qword_2557DD650);
  }
  return result;
}

uint64_t sub_224D94210(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_224D94254(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_224D94290(uint64_t a1, void (*a2)(void))
{
  sub_224D92ECC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80), a2);
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwxx_0(uint64_t a1)
{
  return sub_224D92ECC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80), (void (*)(void))sub_224D92F58);
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwcp_0(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v14 = *(_BYTE *)(a2 + 80);
  v13 = *(_QWORD *)(a2 + 72);
  sub_224D92ECC(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, (void (*)(void))sub_224D92E90);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwca_0(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v25 = *(_BYTE *)(a2 + 80);
  v24 = *(_QWORD *)(a2 + 72);
  sub_224D92ECC(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, (void (*)(void))sub_224D92E90);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_224D92ECC(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, (void (*)(void))sub_224D92F58);
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
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
  char v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_224D92ECC(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14, (void (*)(void))sub_224D92F58);
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_224D94600(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 1u)
    return *(unsigned __int8 *)(a1 + 80);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_224D94618(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)(result + 72) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StatusInfoView.Status()
{
  return &type metadata for StatusInfoView.Status;
}

unint64_t sub_224D9465C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2557DD660;
  if (!qword_2557DD660)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557DD5F0);
    v2[0] = sub_224D946E0(&qword_2557DD668, &qword_2557DD5E0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22768D220](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2557DD660);
  }
  return result;
}

uint64_t sub_224D946E0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22768D220](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_224D94724()
{
  return sub_224D94DFC(&qword_2557DD670, &qword_2557DD678);
}

BOOL sub_224D94748(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_224D94760(_QWORD *a1@<X8>)
{
  *a1 = &unk_24ECF02C8;
}

char *sub_224D94770@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_224D9497C();
  *a1 = result;
  return result;
}

char *sub_224D94794(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD688);
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

char *sub_224D94894(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD680);
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
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_224D9497C()
{
  char *v0;
  unint64_t v1;
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_224D94894(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v2 = *((_QWORD *)v0 + 2);
  v1 = *((_QWORD *)v0 + 3);
  v3 = v1 >> 1;
  v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    v0 = sub_224D94894((char *)(v1 > 1), v2 + 1, 1, v0);
    v1 = *((_QWORD *)v0 + 3);
    v3 = v1 >> 1;
  }
  *((_QWORD *)v0 + 2) = v4;
  v0[v2 + 32] = 0;
  v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    v0 = sub_224D94894((char *)(v1 > 1), v2 + 2, 1, v0);
    v1 = *((_QWORD *)v0 + 3);
    v3 = v1 >> 1;
  }
  *((_QWORD *)v0 + 2) = v5;
  v0[v4 + 32] = 0x80;
  v6 = v2 + 3;
  if (v3 < (uint64_t)(v2 + 3))
  {
    v0 = sub_224D94894((char *)(v1 > 1), v2 + 3, 1, v0);
    v1 = *((_QWORD *)v0 + 3);
    v3 = v1 >> 1;
  }
  *((_QWORD *)v0 + 2) = v6;
  v0[v5 + 32] = 1;
  if (v3 < (uint64_t)(v2 + 4))
    v0 = sub_224D94894((char *)(v1 > 1), v2 + 4, 1, v0);
  *((_QWORD *)v0 + 2) = v2 + 4;
  v0[v6 + 32] = -127;
  return v0;
}

ValueMetadata *type metadata accessor for DeviceModel()
{
  return &type metadata for DeviceModel;
}

uint64_t getEnumTagSinglePayload for DeviceModel.Configuration(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7F)
    goto LABEL_17;
  if (a2 + 129 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 129) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 129;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 129;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 129;
  }
LABEL_17:
  v6 = (*a1 & 0x7E | (*a1 >> 7)) ^ 0x7F;
  if (v6 >= 0x7E)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for DeviceModel.Configuration(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 129 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 129) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7F)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7E)
    return ((uint64_t (*)(void))((char *)&loc_224D94BB4 + 4 * byte_224DA5015[v4]))();
  *a1 = a2 - 127;
  return ((uint64_t (*)(void))((char *)sub_224D94BE8 + 4 * byte_224DA5010[v4]))();
}

uint64_t sub_224D94BE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D94BF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D94BF8);
  return result;
}

uint64_t sub_224D94C10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D94C18);
  *(_BYTE *)result = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
  return result;
}

uint64_t sub_224D94C1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D94C24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D94C30(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

_BYTE *sub_224D94C3C(_BYTE *result)
{
  *result &= ~0x80u;
  return result;
}

_BYTE *sub_224D94C4C(_BYTE *result, char a2)
{
  *result = *result & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for DeviceModel.Configuration()
{
  return &type metadata for DeviceModel.Configuration;
}

uint64_t getEnumTagSinglePayload for DeviceModel.Size(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DeviceModel.Size(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D94D4C + 4 * byte_224DA501F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D94D80 + 4 * byte_224DA501A[v4]))();
}

uint64_t sub_224D94D80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D94D88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D94D90);
  return result;
}

uint64_t sub_224D94D9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D94DA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D94DA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D94DB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_224D94DBC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceModel.Size()
{
  return &type metadata for DeviceModel.Size;
}

uint64_t sub_224D94DD8()
{
  return sub_224D94DFC(&qword_2557DD690, &qword_2557DD698);
}

uint64_t sub_224D94DFC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22768D220](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_224D94E40()
{
  unint64_t result;

  result = qword_2557DD6A0;
  if (!qword_2557DD6A0)
  {
    result = MEMORY[0x22768D220](&unk_224DA5110, &type metadata for DeviceModel.Size);
    atomic_store(result, &qword_2557DD6A0);
  }
  return result;
}

uint64_t sub_224D94E84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = v0;
  return swift_task_switch();
}

uint64_t sub_224D94E9C()
{
  uint64_t v0;

  sub_224DA4190();
  *(_QWORD *)(v0 + 96) = sub_224DA4184();
  sub_224DA4178();
  return swift_task_switch();
}

uint64_t sub_224D94F04()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  v2 = *(void **)(v1 + 152);
  *(_QWORD *)(v0 + 104) = v2;
  v3 = v2;
  return swift_task_switch();
}

uint64_t sub_224D94F4C()
{
  uint64_t v0;
  void *v1;
  id v2;
  int v3;
  void *v4;
  uint64_t v5;
  _BYTE *v7;
  _BYTE *v8;

  v1 = *(void **)(v0 + 104);
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_remoteObjectProxy);
    sub_224DA4220();
    swift_unknownObjectRelease();
    sub_224D95A28(v0 + 16, v0 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD6C8);
    v3 = swift_dynamicCast();
    v4 = *(void **)(v0 + 104);
    if (v3)
    {

      v5 = *(_QWORD *)(v0 + 80);
      __swift_destroy_boxed_opaque_existential_0(v0 + 16);
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
    }
    sub_224D959E4();
    swift_allocError();
    *v8 = 4;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }
  else
  {
    sub_224D959E4();
    swift_allocError();
    *v7 = 3;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D950A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[15] = a1;
  v2[16] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[17] = v3;
  *v3 = v2;
  v3[1] = sub_224D95104;
  v3[11] = v1;
  return swift_task_switch();
}

uint64_t sub_224D95104(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 144) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_224D95178()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[18];
  v2 = sub_224DA3F74();
  v0[19] = v2;
  v0[2] = v0;
  v0[3] = sub_224D95220;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_224D9C8F4;
  v4[3] = &block_descriptor_30;
  v4[4] = v3;
  objc_msgSend(v1, sel_receiveWithCarrySettingsHomeID_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_224D95220()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_224D95280()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D952B8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_willThrow();
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D95438(uint64_t a1, const void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v3[2] = a3;
  v5 = sub_224DA3F8C();
  v3[3] = v5;
  v3[4] = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v3[5] = v6;
  v3[6] = _Block_copy(a2);
  sub_224DA3F80();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v3[7] = v7;
  *v7 = v3;
  v7[1] = sub_224D954E8;
  return sub_224D950A4(v6);
}

uint64_t sub_224D954E8()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(*v1 + 32);
  v2 = *(_QWORD *)(*v1 + 40);
  v4 = *(_QWORD *)(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  v6 = *(_QWORD *)(v5 + 48);
  if (v0)
  {
    v7 = (void *)sub_224DA3F5C();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 48), 0);
  }
  _Block_release(*(const void **)(v5 + 48));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_224D955B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[18] = v4;
  *v4 = v3;
  v4[1] = sub_224D95614;
  v4[11] = v2;
  return swift_task_switch();
}

uint64_t sub_224D95614(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_224D95688()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)v0[19];
  v2 = sub_224DA3F74();
  v0[20] = v2;
  sub_224DA3F8C();
  sub_224D9599C();
  v3 = sub_224DA41E4();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_224D95768;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_224D9C8F4;
  v0[13] = &block_descriptor_0;
  v0[14] = v4;
  objc_msgSend(v1, sel_receiveWithCarrySettingsHomeID_identifiers_completionHandler_, v2, v3, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_224D95768()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_224D957C8()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 168);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D95808()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 160);
  swift_willThrow();
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_224D9599C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557DD6B8;
  if (!qword_2557DD6B8)
  {
    v1 = sub_224DA3F8C();
    result = MEMORY[0x22768D220](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_2557DD6B8);
  }
  return result;
}

unint64_t sub_224D959E4()
{
  unint64_t result;

  result = qword_2557DD6C0;
  if (!qword_2557DD6C0)
  {
    result = MEMORY[0x22768D220](&unk_224DA535C, &type metadata for ClientError);
    atomic_store(result, (unint64_t *)&qword_2557DD6C0);
  }
  return result;
}

uint64_t sub_224D95A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_224D95A84(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4[2] = a4;
  v6 = sub_224DA3F8C();
  v4[3] = v6;
  v4[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v4[5] = v7;
  v4[6] = _Block_copy(a3);
  sub_224DA3F80();
  sub_224D9599C();
  v8 = sub_224DA41F0();
  v4[7] = v8;
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  v4[8] = v9;
  *v9 = v4;
  v9[1] = sub_224D95B64;
  return sub_224D955B0(v7, v8);
}

uint64_t sub_224D95B64()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(*v1 + 32);
  v2 = *(_QWORD *)(*v1 + 40);
  v4 = *(_QWORD *)(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v5 + 48);
  if (v0)
  {
    v7 = (void *)sub_224DA3F5C();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 48), 0);
  }
  _Block_release(*(const void **)(v5 + 48));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_224D95C3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D95C78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = (const void *)v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_224D92714;
  return ((uint64_t (*)(uint64_t, uint64_t, const void *, uint64_t))((char *)&dword_2557DD6D0 + dword_2557DD6D0))(v2, v3, v5, v4);
}

uint64_t sub_224D95CF4()
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
  v5[1] = sub_224D95EC8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2557DDBA8 + dword_2557DDBA8))(v2, v3, v4);
}

uint64_t sub_224D95D70(uint64_t a1)
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
  v7[1] = sub_224D95EC8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2557DDBB0 + dword_2557DDBB0))(a1, v4, v5, v6);
}

uint64_t sub_224D95DF4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D95E28()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (const void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_224D95EC8;
  return ((uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_2557DD6F0 + dword_2557DD6F0))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D95ECC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[24] = v0;
  sub_224DA4190();
  v1[25] = sub_224DA4184();
  v1[26] = sub_224DA4178();
  v1[27] = v2;
  return swift_task_switch();
}

uint64_t sub_224D95F38()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[24];
  sub_224DA4238();
  sub_224DA413C();
  swift_bridgeObjectRetain();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D9F270(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  type metadata accessor for Stopwatch();
  inited = swift_initStackObject();
  v0[28] = inited;
  *(_BYTE *)(inited + 16) = 1;
  *(_QWORD *)(inited + 24) = 0;
  *(_BYTE *)(inited + 32) = 1;
  *(_QWORD *)(inited + 40) = 0;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 24) = mach_absolute_time();
  *(_BYTE *)(inited + 32) = 0;
  *(_BYTE *)(inited + 16) = 0;
  v3 = (void *)objc_opt_self();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query);
  v0[7] = v0 + 22;
  v0[2] = v0;
  v0[3] = sub_224D960CC;
  v5 = swift_continuation_init();
  v0[17] = MEMORY[0x24BDAC760];
  v0[18] = 0x40000000;
  v0[19] = sub_224D964A8;
  v0[20] = &block_descriptor_1;
  v0[21] = v5;
  objc_msgSend(v3, sel_executeQuery_completionHandler_, v4, v0 + 17);
  return swift_continuation_await();
}

uint64_t sub_224D960CC()
{
  return swift_task_switch();
}

uint64_t sub_224D96110()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  result = swift_release();
  v2 = *(_QWORD *)(v0 + 176);
  if (!(v2 >> 62))
  {
    if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    sub_224DA4238();
    swift_bridgeObjectRelease();
    sub_224D97600();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 184) = type metadata accessor for RemoteViewControllerClient();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD7D8);
    sub_224DA4124();
    v11 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v12 = (void *)sub_224DA410C();
    v13 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_initWithSubsystem_category_, v12, v13);

    v15 = (void *)sub_224DA410C();
    objc_msgSend(v14, sel_ulog_message_, 60, v15);

    swift_bridgeObjectRelease();
    sub_224D9701C();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  v10 = sub_224DA425C();
  result = swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_10;
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    v3 = (id)MEMORY[0x22768CD58](0, v2);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v3 = *(id *)(v2 + 32);
  }
  v4 = v3;
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB8]), sel_initWithExtensionIdentity_, v4);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB0]), sel_initWithConfiguration_, v5);
  v7 = sub_224D964EC();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, sel_setPlaceholderView_, v7);

  }
  objc_msgSend(v6, sel_setDelegate_, *(_QWORD *)(v0 + 192));
  sub_224DA4238();
  swift_bridgeObjectRelease();
  sub_224D97600();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  v9 = objc_msgSend(v6, sel_description);
  sub_224DA4118();

  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D9F270(0xD000000000000023, 0x8000000224DA6300);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(id))(v0 + 8))(v6);
}

uint64_t sub_224D964A8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_224D97060();
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_224DA4154();
  return swift_continuation_resume();
}

id sub_224D964EC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id result;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void (*v18)(_OWORD *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  _OWORD v31[5];
  char v32;

  v1 = v0;
  memset(v31, 0, sizeof(v31));
  v32 = 2;
  v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2557DD7E0));
  v3 = (void *)sub_224DA401C();
  result = objc_msgSend(v3, sel_view);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);

    v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl;
    v8 = *(void **)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl) = v3;

    v9 = *(void **)(v1 + v7);
    if (v9)
    {
      v10 = qword_2557DD358;
      v11 = v9;
      if (v10 != -1)
        swift_once();
      v13 = qword_2557DEE88;
      v12 = unk_2557DEE90;
      v14 = byte_2557DEE98;
      v15 = qword_2557DEEA0;
      v16 = qword_2557DEEA8;
      v17 = qword_2557DEEA8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = (void (*)(_OWORD *, _QWORD))sub_224DA4028();
      v20 = *(_QWORD *)v19;
      v21 = *(_QWORD *)(v19 + 8);
      v22 = *(_QWORD *)(v19 + 16);
      v23 = *(_QWORD *)(v19 + 24);
      v24 = *(void **)(v19 + 32);
      v25 = *(_QWORD *)(v19 + 40);
      v26 = *(_QWORD *)(v19 + 48);
      v27 = *(_QWORD *)(v19 + 56);
      v28 = *(_QWORD *)(v19 + 64);
      v29 = *(void **)(v19 + 72);
      v30 = *(_BYTE *)(v19 + 80);
      *(_QWORD *)v19 = v13;
      *(_QWORD *)(v19 + 8) = v12;
      *(_QWORD *)(v19 + 16) = v14;
      *(_QWORD *)(v19 + 24) = v15;
      *(_QWORD *)(v19 + 32) = v16;
      *(_OWORD *)(v19 + 40) = 0u;
      *(_OWORD *)(v19 + 56) = 0u;
      *(_OWORD *)(v19 + 65) = 0u;
      sub_224D96FA8(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
      v18(v31, 0);

      result = *(id *)(v1 + v7);
      if (result)
        return objc_msgSend(result, sel_view);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_224D966E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewControllerClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteViewControllerClient()
{
  return objc_opt_self();
}

uint64_t sub_224D9693C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;

  v1 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock))
  {
    swift_retain();
    sub_224D97600();
    swift_release();
  }
  *(_QWORD *)(v0 + v1) = 0;
  swift_release();
  sub_224DA4238();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D9F270(0xD000000000000035, 0x8000000224DA6260);
  swift_bridgeObjectRelease();
  v2 = v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate;
  result = MEMORY[0x22768D304](v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate);
  if (result)
  {
    v4 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_224D96A68(uint64_t a1)
{
  if (a1)
  {
    swift_getErrorValue();
    sub_224DA42B0();
  }
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D9F270(0xD00000000000002FLL, 0x8000000224DA6230);
  return swift_bridgeObjectRelease();
}

void sub_224D96AFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void (*v24)(_QWORD *, _QWORD);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];

  v2 = v1;
  v4 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock))
  {
    swift_retain();
    sub_224D97600();
    swift_release();
  }
  *(_QWORD *)(v1 + v4) = 0;
  swift_release();
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v43[0] = 0xD00000000000002FLL;
  v43[1] = 0x8000000224DA6170;
  if (a1)
  {
    swift_getErrorValue();
    sub_224DA42B0();
  }
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for RemoteViewControllerClient();
  v43[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD7D8);
  sub_224DA4124();
  v6 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v7 = (void *)sub_224DA410C();
  v8 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithSubsystem_category_, v7, v8);

  v10 = (void *)sub_224DA410C();
  objc_msgSend(v9, sel_ulog_message_, 90, v10);
  swift_bridgeObjectRelease();

  v11 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl);
  if (v11)
  {
    v12 = v11;
    sub_224D9F270(0xD000000000000020, 0x8000000224DA6200);
    if (qword_2557DD360 != -1)
      swift_once();
    v13 = *(_QWORD *)algn_2557DEEB8;
    v41 = byte_2557DEEC0;
    v42 = qword_2557DEEB0;
    v14 = qword_2557DEEC8;
    v15 = (void *)unk_2557DEED0;
    v16 = qword_2557DD368;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = v15;
    if (v16 != -1)
      swift_once();
    v19 = qword_2557DEED8;
    v18 = unk_2557DEEE0;
    v20 = byte_2557DEEE8;
    v21 = qword_2557DEEF0;
    v22 = qword_2557DEEF8;
    v23 = qword_2557DEEF8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = (void (*)(_QWORD *, _QWORD))sub_224DA4028();
    v26 = *(_QWORD *)v25;
    v27 = *(_QWORD *)(v25 + 8);
    v28 = *(_QWORD *)(v25 + 16);
    v29 = *(_QWORD *)(v25 + 24);
    v30 = *(void **)(v25 + 32);
    v31 = *(_QWORD *)(v25 + 40);
    v32 = *(_QWORD *)(v25 + 48);
    v33 = *(_QWORD *)(v25 + 56);
    v34 = *(_QWORD *)(v25 + 64);
    v35 = *(void **)(v25 + 72);
    v36 = *(_BYTE *)(v25 + 80);
    *(_QWORD *)v25 = v42;
    *(_QWORD *)(v25 + 8) = v13;
    *(_QWORD *)(v25 + 16) = v41;
    *(_QWORD *)(v25 + 24) = v14;
    *(_QWORD *)(v25 + 32) = v15;
    *(_QWORD *)(v25 + 40) = v19;
    *(_QWORD *)(v25 + 48) = v18;
    *(_QWORD *)(v25 + 56) = v20;
    *(_QWORD *)(v25 + 64) = v21;
    *(_QWORD *)(v25 + 72) = v22;
    *(_BYTE *)(v25 + 80) = 1;
    sub_224D96FA8(v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
    v24(v43, 0);
  }
  else
  {
    v43[0] = v5;
    sub_224DA4124();
    v37 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v38 = (void *)sub_224DA410C();
    v39 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v40 = objc_msgSend(v37, sel_initWithSubsystem_category_, v38, v39);

    v12 = (id)sub_224DA410C();
    objc_msgSend(v40, sel_ulog_message_, 90, v12);

  }
}

uint64_t sub_224D96F24()
{
  uint64_t v0;
  uint64_t v1;

  sub_224D9F270(0xD000000000000027, 0x8000000224DA6140);
  type metadata accessor for Stopwatch();
  v1 = swift_allocObject();
  *(_BYTE *)(v1 + 16) = 1;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  *(_QWORD *)(v1 + 40) = 0;
  *(_BYTE *)(v1 + 48) = 1;
  *(_QWORD *)(v1 + 24) = mach_absolute_time();
  *(_BYTE *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 16) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock) = v1;
  return swift_release();
}

void sub_224D96FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, char a11)
{
  if (a11 == 1)
  {
    sub_224D92F58(a1, a2, a3, a4, a5);
    a1 = a6;
    a2 = a7;
    a3 = a8;
    a4 = a9;
    a5 = a10;
    goto LABEL_5;
  }
  if (!a11)
LABEL_5:
    sub_224D92F58(a1, a2, a3, a4, a5);
}

unint64_t sub_224D9701C()
{
  unint64_t result;

  result = qword_2557DD7E8;
  if (!qword_2557DD7E8)
  {
    result = MEMORY[0x22768D220](&unk_224DA5924, &type metadata for RemoteViewControllerError);
    atomic_store(result, (unint64_t *)&qword_2557DD7E8);
  }
  return result;
}

unint64_t sub_224D97060()
{
  unint64_t result;

  result = qword_2557DD7F0;
  if (!qword_2557DD7F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557DD7F0);
  }
  return result;
}

uint64_t sub_224D9709C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

Swift::Void __swiftcall UIViewController.wrap(subViewController:)(UIViewController *subViewController)
{
  void *v1;
  UIView *v3;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  id v7;
  void *v8;
  id v9;

  v3 = -[UIViewController view](subViewController, sel_view);
  if (v3)
  {
    v4 = v3;
    -[UIView removeFromSuperview](v3, sel_removeFromSuperview);

    -[UIViewController removeFromParentViewController](subViewController, sel_removeFromParentViewController);
    -[UIViewController willMoveToParentViewController:](subViewController, sel_willMoveToParentViewController_, v1);
    objc_msgSend(v1, sel_addChildViewController_, subViewController);
    v5 = -[UIViewController view](subViewController, sel_view);
    if (!v5)
    {
LABEL_5:
      -[UIViewController didMoveToParentViewController:](subViewController, sel_didMoveToParentViewController_, v1);
      return;
    }
    v6 = v5;
    v7 = objc_msgSend(v1, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_addSubviewToBounds_with_, v6, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));

      v9 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
      -[UIView setBackgroundColor:](v6, sel_setBackgroundColor_, v9);

      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_224D971FC(void *a1, uint64_t a2, void *a3)
{
  UIViewController *v4;
  id v5;

  v4 = a3;
  v5 = a1;
  UIViewController.wrap(subViewController:)(v4);

}

id sub_224D97250(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v6;
  void *v7;
  id v14;
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
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;

  v7 = v6;
  v14 = a2;
  if (!a2)
    v14 = v7;
  v15 = a2;
  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v7, sel_addSubview_, a1);
  v16 = objc_msgSend(a1, sel_topAnchor);
  v17 = objc_msgSend(v14, sel_topAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, a3);

  v19 = objc_msgSend(v14, sel_rightAnchor);
  v20 = objc_msgSend(a1, sel_rightAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, a6);

  v22 = objc_msgSend(v14, sel_bottomAnchor);
  v23 = objc_msgSend(a1, sel_bottomAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, a5);

  v25 = objc_msgSend(a1, sel_leftAnchor);
  v26 = objc_msgSend(v14, sel_leftAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, a4);

  v28 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD380);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_224DA51A0;
  *(_QWORD *)(v29 + 32) = v18;
  *(_QWORD *)(v29 + 40) = v21;
  *(_QWORD *)(v29 + 48) = v24;
  *(_QWORD *)(v29 + 56) = v27;
  sub_224DA416C();
  sub_224D90AB8();
  v30 = v18;
  v31 = v21;
  v32 = v24;
  v33 = v27;
  v34 = v30;
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v38 = (void *)sub_224DA4148();
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_activateConstraints_, v38);

  return v34;
}

void sub_224D97558(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v12 = a7;
  v13 = a1;
  v14 = sub_224D97250(v12, 0, a2, a3, a4, a5);
  v16 = v15;
  v18 = v17;
  v20 = v19;

}

uint64_t sub_224D97600()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  double v5;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    return 0;
  v2 = mach_absolute_time();
  *(_QWORD *)(v0 + 40) = v2;
  *(_BYTE *)(v0 + 48) = 0;
  *(_BYTE *)(v0 + 16) = 1;
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
    return 0x646570706F7473;
  v3 = *(_QWORD *)(v0 + 24);
  v4 = v2 >= v3;
  result = v2 - v3;
  if (v4)
  {
    UpTicksToSecondsF();
    return sub_224D90D0C(v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_224D97678()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  double v4;

  if ((*(_BYTE *)(v0 + 32) & 1) != 0 || (*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    if (*(_BYTE *)(v0 + 16))
      return 0x646570706F7473;
    else
      return 0x676E696E6E7572;
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 24);
    v3 = *(_QWORD *)(v0 + 40);
    result = v3 - v2;
    if (v3 < v2)
    {
      __break(1u);
    }
    else
    {
      UpTicksToSecondsF();
      return sub_224D90D0C(v4);
    }
  }
  return result;
}

uint64_t sub_224D976EC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Stopwatch()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for Stopwatch.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D97768 + 4 * byte_224DA51B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D9779C + 4 * byte_224DA51B0[v4]))();
}

uint64_t sub_224D9779C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D977A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D977ACLL);
  return result;
}

uint64_t sub_224D977B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D977C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D977C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D977CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Stopwatch.State()
{
  return &type metadata for Stopwatch.State;
}

uint64_t sub_224D977E8()
{
  _BYTE *v0;

  if (*v0)
    return 0x646570706F7473;
  else
    return 0x676E696E6E7572;
}

unint64_t sub_224D97820()
{
  unint64_t result;

  result = qword_2557DD978;
  if (!qword_2557DD978)
  {
    result = MEMORY[0x22768D220](&unk_224DA5270, &type metadata for Stopwatch.State);
    atomic_store(result, (unint64_t *)&qword_2557DD978);
  }
  return result;
}

uint64_t sub_224D97864()
{
  return sub_224D97678();
}

uint64_t getEnumTagSinglePayload for ClientError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D97960 + 4 * byte_224DA52C5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_224D97994 + 4 * byte_224DA52C0[v4]))();
}

uint64_t sub_224D97994(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9799C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D979A4);
  return result;
}

uint64_t sub_224D979B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D979B8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_224D979BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D979C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClientError()
{
  return &type metadata for ClientError;
}

unint64_t sub_224D979E4()
{
  unint64_t result;

  result = qword_2557DD980;
  if (!qword_2557DD980)
  {
    result = MEMORY[0x22768D220](&unk_224DA5334, &type metadata for ClientError);
    atomic_store(result, (unint64_t *)&qword_2557DD980);
  }
  return result;
}

uint64_t sub_224D97A28()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  _BYTE v23[32];
  _BYTE v24[32];
  _BYTE v25[32];
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  unint64_t v29;

  v28 = 574451054;
  v29 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  v1 = sub_224D94794(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v3 = *((_QWORD *)v1 + 2);
  v2 = *((_QWORD *)v1 + 3);
  if (v3 >= v2 >> 1)
    v1 = sub_224D94794((char *)(v2 > 1), v3 + 1, 1, v1);
  *((_QWORD *)v1 + 2) = v3 + 1;
  v4 = &v1[16 * v3];
  *((_QWORD *)v4 + 4) = 574451054;
  *((_QWORD *)v4 + 5) = 0xE400000000000000;
  sub_224D97E18(v0, (uint64_t)v25);
  sub_224D97E18((uint64_t)v25, (uint64_t)v26);
  if (v26[1])
  {
    v28 = 0x223D70756F7267;
    v29 = 0xE700000000000000;
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    v5 = v28;
    v6 = v29;
    v8 = *((_QWORD *)v1 + 2);
    v7 = *((_QWORD *)v1 + 3);
    if (v8 >= v7 >> 1)
      v1 = sub_224D94794((char *)(v7 > 1), v8 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v8 + 1;
    v9 = &v1[16 * v8];
    *((_QWORD *)v9 + 4) = v5;
    *((_QWORD *)v9 + 5) = v6;
  }
  sub_224D97E18(v0 + 64, (uint64_t)v24);
  sub_224D97E18((uint64_t)v24, (uint64_t)v27);
  if (v27[1])
  {
    v28 = 0x223D72696170;
    v29 = 0xE600000000000000;
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    v10 = v28;
    v11 = v29;
    v13 = *((_QWORD *)v1 + 2);
    v12 = *((_QWORD *)v1 + 3);
    if (v13 >= v12 >> 1)
      v1 = sub_224D94794((char *)(v12 > 1), v13 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v13 + 1;
    v14 = &v1[16 * v13];
    *((_QWORD *)v14 + 4) = v10;
    *((_QWORD *)v14 + 5) = v11;
  }
  sub_224D97E18(v0 + 96, (uint64_t)v23);
  sub_224D97E18((uint64_t)v23, (uint64_t)&v28);
  if (v29)
  {
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    sub_224DA413C();
    v16 = *((_QWORD *)v1 + 2);
    v15 = *((_QWORD *)v1 + 3);
    if (v16 >= v15 >> 1)
      v1 = sub_224D94794((char *)(v15 > 1), v16 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v16 + 1;
    v17 = &v1[16 * v16];
    *((_QWORD *)v17 + 4) = 0x223D6D6F6F72;
    *((_QWORD *)v17 + 5) = 0xE600000000000000;
  }
  swift_bridgeObjectRetain();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  v19 = *((_QWORD *)v1 + 2);
  v18 = *((_QWORD *)v1 + 3);
  if (v19 >= v18 >> 1)
    v1 = sub_224D94794((char *)(v18 > 1), v19 + 1, 1, v1);
  *((_QWORD *)v1 + 2) = v19 + 1;
  v20 = &v1[16 * v19];
  *((_QWORD *)v20 + 4) = 1030513773;
  *((_QWORD *)v20 + 5) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD990);
  sub_224D97E60();
  v21 = sub_224DA4100();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_224D97DD0()
{
  return sub_224D97A28();
}

uint64_t sub_224D97E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_224D97E60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557DD998;
  if (!qword_2557DD998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557DD990);
    result = MEMORY[0x22768D220](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2557DD998);
  }
  return result;
}

uint64_t destroy for DisplayInfo(_QWORD *a1)
{
  uint64_t result;

  if (a1[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = a1[13];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DisplayInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v9)
  {
    v14 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v14;
    v11 = *(_QWORD *)(a2 + 104);
    if (v11)
      goto LABEL_6;
LABEL_8:
    v15 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v15;
    return a1;
  }
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = *(_QWORD *)(a2 + 104);
  if (!v11)
    goto LABEL_8;
LABEL_6:
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v11;
  v12 = *(_QWORD *)(a2 + 112);
  v13 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v12;
  *(_QWORD *)(a1 + 120) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DisplayInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_224D98270((uint64_t)a1);
      v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v5;
    }
  }
  else if (v4)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v6;
  }
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a1 + 8;
  v8 = a2 + 8;
  v9 = a2[9];
  if (a1[9])
  {
    if (v9)
    {
      a1[8] = a2[8];
      a1[9] = a2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[10] = a2[10];
      a1[11] = a2[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_224D98270((uint64_t)(a1 + 8));
      v10 = *((_OWORD *)a2 + 5);
      *v7 = *v8;
      *((_OWORD *)a1 + 5) = v10;
    }
  }
  else if (v9)
  {
    a1[8] = a2[8];
    a1[9] = a2[9];
    a1[10] = a2[10];
    a1[11] = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v11 = *((_OWORD *)a2 + 5);
    *v7 = *v8;
    *((_OWORD *)a1 + 5) = v11;
  }
  v12 = a1 + 12;
  v13 = a2 + 12;
  v14 = a2[13];
  if (a1[13])
  {
    if (v14)
    {
      a1[12] = a2[12];
      a1[13] = a2[13];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[14] = a2[14];
      a1[15] = a2[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_224D98270((uint64_t)(a1 + 12));
      v15 = *((_OWORD *)a2 + 7);
      *v12 = *v13;
      *((_OWORD *)a1 + 7) = v15;
    }
  }
  else if (v14)
  {
    a1[12] = a2[12];
    a1[13] = a2[13];
    a1[14] = a2[14];
    a1[15] = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v16 = *((_OWORD *)a2 + 7);
    *v12 = *v13;
    *((_OWORD *)a1 + 7) = v16;
  }
  return a1;
}

uint64_t sub_224D98270(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD9A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for DisplayInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (*(_QWORD *)(a1 + 8))
  {
    v4 = *(_QWORD *)(a2 + 8);
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = v5;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_224D98270(a1);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_6:
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 72))
  {
    v9 = *(_QWORD *)(a2 + 72);
    if (v9)
    {
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      v10 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = v10;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_224D98270(a1 + 64);
  }
  v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v11;
LABEL_11:
  if (!*(_QWORD *)(a1 + 104))
  {
LABEL_15:
    v14 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v14;
    return a1;
  }
  v12 = *(_QWORD *)(a2 + 104);
  if (!v12)
  {
    sub_224D98270(a1 + 96);
    goto LABEL_15;
  }
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayInfo()
{
  return &type metadata for DisplayInfo;
}

uint64_t sub_224D984A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_224DA41A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_224DA419C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_224D927F0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_224DA4178();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA20);
  return swift_task_create();
}

uint64_t sub_224D985F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_224DA41A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_224DA419C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_224D927F0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_224DA4178();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

char *CarrySettingsViewController.__allocating_init(withHomeID:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CarrySettingsViewController.init(withHomeID:)(a1);
}

char *CarrySettingsViewController.init(withHomeID:)(uint64_t a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  objc_class *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  char *v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = 0;
  v40 = 0xE000000000000000;
  v6 = v1;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v39 = 0xD000000000000011;
  v40 = 0x8000000224DA6450;
  v7 = sub_224DA3F8C();
  sub_224D9B66C(&qword_2557DD9A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v34 = a1;
  sub_224DA4280();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(v39, v40, (uint64_t)ObjectType, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  v36 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(&v6[OBJC_IVAR____HPSUICarrySettingsViewController_homeID], a1, v7);
  *(_QWORD *)&v6[OBJC_IVAR____HPSUICarrySettingsViewController_identifiers] = MEMORY[0x24BEE4B08];

  v41.receiver = v6;
  v41.super_class = ObjectType;
  v9 = (char *)objc_msgSendSuper2(&v41, sel_init);
  v10 = &v9[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  v11 = *(_QWORD *)v10;
  v12 = *((_QWORD *)v10 + 1);
  v33 = *((_QWORD *)v10 + 5);
  v32 = *((_OWORD *)v10 + 4);
  *(_OWORD *)v10 = xmmword_224DA5400;
  *((_OWORD *)v10 + 1) = xmmword_224DA5410;
  *((_OWORD *)v10 + 2) = xmmword_224DA5420;
  *((_OWORD *)v10 + 3) = xmmword_224DA5430;
  *((_OWORD *)v10 + 4) = xmmword_224DA5440;
  *((_QWORD *)v10 + 10) = 0xED000073676E6974;
  v13 = v9;
  sub_224D98BB4(v11, v12);
  v14 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  v15 = (char *)objc_allocWithZone(v14);
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  v16 = swift_unknownObjectWeakInit();
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(_QWORD *)(v16 + 8) = &off_24ECF1160;
  swift_unknownObjectWeakAssign();
  v17 = &v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(_QWORD *)v17 = 0xD00000000000002CLL;
  *((_QWORD *)v17 + 1) = 0x8000000224DA6470;
  v18 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  v19 = v13;
  v20 = v15;
  v21 = (void *)sub_224DA410C();
  v22 = objc_msgSend(v18, sel_initWithExtensionPointIdentifier_, v21);

  *(_QWORD *)&v20[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v22;
  v38.receiver = v20;
  v38.super_class = v14;
  v23 = objc_msgSendSuper2(&v38, sel_init);

  v24 = *(void **)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(_QWORD *)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v23;

  v25 = sub_224DA41A8();
  v26 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v37, 1, 1, v25);
  v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v28 = sub_224DA4184();
  v29 = (_QWORD *)swift_allocObject();
  v30 = MEMORY[0x24BEE6930];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v27;
  swift_release();
  sub_224D985F4(v26, (uint64_t)&unk_2557DD9B8, (uint64_t)v29);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  return v19;
}

uint64_t sub_224D98BB4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_224D98BF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

char *CarrySettingsViewController.__allocating_init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)(a1, a2);
}

char *CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  char *v22;
  char *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = 0;
  v43 = 0xE000000000000000;
  v8 = v2;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v42 = 0xD000000000000011;
  v43 = 0x8000000224DA6450;
  v9 = sub_224DA3F8C();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_224D9B66C(&qword_2557DD9A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v37 = a1;
  sub_224DA4280();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  sub_224D9B66C((unint64_t *)&qword_2557DD6B8, v10, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  sub_224DA41FC();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(v42, v43, (uint64_t)ObjectType, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  v39 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(&v8[OBJC_IVAR____HPSUICarrySettingsViewController_homeID], a1, v9);
  *(_QWORD *)&v8[OBJC_IVAR____HPSUICarrySettingsViewController_identifiers] = a2;

  v44.receiver = v8;
  v44.super_class = ObjectType;
  v12 = (char *)objc_msgSendSuper2(&v44, sel_init);
  v13 = &v12[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  v14 = *(_QWORD *)v13;
  v15 = *((_QWORD *)v13 + 1);
  v36 = *((_QWORD *)v13 + 5);
  v35 = *((_OWORD *)v13 + 4);
  *(_OWORD *)v13 = xmmword_224DA5400;
  *((_OWORD *)v13 + 1) = xmmword_224DA5410;
  *((_OWORD *)v13 + 2) = xmmword_224DA5420;
  *((_OWORD *)v13 + 3) = xmmword_224DA5430;
  *((_OWORD *)v13 + 4) = xmmword_224DA5440;
  *((_QWORD *)v13 + 10) = 0xED000073676E6974;
  v16 = v12;
  sub_224D98BB4(v14, v15);
  v17 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  v18 = (char *)objc_allocWithZone(v17);
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  v19 = swift_unknownObjectWeakInit();
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(_QWORD *)(v19 + 8) = &off_24ECF1160;
  swift_unknownObjectWeakAssign();
  v20 = &v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(_QWORD *)v20 = 0xD00000000000002CLL;
  *((_QWORD *)v20 + 1) = 0x8000000224DA6470;
  v21 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  v22 = v16;
  v23 = v18;
  v24 = (void *)sub_224DA410C();
  v25 = objc_msgSend(v21, sel_initWithExtensionPointIdentifier_, v24);

  *(_QWORD *)&v23[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v25;
  v41.receiver = v23;
  v41.super_class = v17;
  v26 = objc_msgSendSuper2(&v41, sel_init);

  v27 = *(void **)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(_QWORD *)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v26;

  v28 = sub_224DA41A8();
  v29 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v40, 1, 1, v28);
  v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v31 = sub_224DA4184();
  v32 = (_QWORD *)swift_allocObject();
  v33 = MEMORY[0x24BEE6930];
  v32[2] = v31;
  v32[3] = v33;
  v32[4] = v30;
  swift_release();
  sub_224D985F4(v29, (uint64_t)&unk_2557DD9C0, (uint64_t)v32);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
  return v22;
}

Swift::Void __swiftcall CarrySettingsViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1);
  v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_navigationBar);

    v6 = objc_msgSend(v5, sel_standardAppearance);
    objc_msgSend(v5, sel_setScrollEdgeAppearance_, v6);

  }
}

Swift::Void __swiftcall CarrySettingsViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_navigationBar);

    objc_msgSend(v5, sel_setScrollEdgeAppearance_, 0);
  }
}

uint64_t sub_224D99524()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[3] = v0;
  v1[4] = swift_getObjectType();
  v2 = sub_224DA3F8C();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_224DA4190();
  v1[8] = sub_224DA4184();
  v1[9] = sub_224DA4178();
  v1[10] = v3;
  return swift_task_switch();
}

uint64_t sub_224D995C4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 40, v6);

  v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc))
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(void **)(v0 + 24);
    type metadata accessor for XPCConnectionManager();
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 88) = v10;
    v11 = v9;
    swift_defaultActor_initialize();
    *(_QWORD *)(v10 + 152) = 0;
    *(_QWORD *)(v10 + 160) = 0;
    *(_QWORD *)(v10 + 168) = 0;
    *(_QWORD *)(v10 + 112) = v11;
    *(_QWORD *)(v10 + 120) = &off_24ECF1170;
    *(_OWORD *)(v10 + 128) = xmmword_224DA5450;
    *(_BYTE *)(v10 + 144) = 2;
    *(_QWORD *)(v1 + v7) = v10;
    swift_retain();
    swift_release();
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v12;
    *v12 = v0;
    v12[1] = sub_224D997AC;
    return sub_224D91D64();
  }
}

uint64_t sub_224D997AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D9980C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[6] + 16))(v0[7], v1 + OBJC_IVAR____HPSUICarrySettingsViewController_homeID, v0[5]);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____HPSUICarrySettingsViewController_identifiers);
  v0[14] = v2;
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[15] = v3;
  *v3 = v0;
  v3[1] = sub_224D998A4;
  return sub_224D955B0(v0[7], v2);
}

uint64_t sub_224D998A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_224D99934()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9997C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D999CC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D99A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____HPSUICarrySettingsViewController_homeID;
  v2 = sub_224DA3F8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

id CarrySettingsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static CarrySettingsViewController.shouldShowCarrySettingsButton(forHomeID:homeKitIdentifiers:withCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(a1, a3, a4);
}

void sub_224D99CF0()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_224D9E584(0x6E69676542646964, 0xEF676E6974736F48);
  sub_224DA1184();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  if (v1)
  {
    v2 = v1;
    sub_224D9E584(0xD00000000000001CLL, 0x8000000224DA6540);
    sub_224D9EB58(v2);

  }
}

char *sub_224D99D84()
{
  char *v0;
  void *v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  _BYTE *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
  if (!v1)
  {
    sub_224D959E4();
    swift_allocError();
    *v7 = 2;
LABEL_6:
    swift_willThrow();
    return v0;
  }
  v9[0] = 0;
  v2 = (char *)objc_msgSend(v1, sel_makeXPCConnectionWithError_, v9);
  v3 = v9[0];
  if (!v2)
  {
    v0 = (char *)v9[0];
    sub_224DA3F68();

    goto LABEL_6;
  }
  v0 = v2;
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2557E8FE8);
  objc_msgSend(v0, sel_setRemoteObjectInterface_, v6);

  return v0;
}

char *sub_224D99ED0()
{
  return sub_224D99D84();
}

uint64_t sub_224D99EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_224DA4190();
  v4[10] = sub_224DA4184();
  v4[11] = sub_224DA4178();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_224D99F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v5;
  _BYTE *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 72) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22768D304](v1);
  *(_QWORD *)(v0 + 104) = v2;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_224D9A18C;
    return sub_224D9A99C();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    v5 = (void *)swift_allocError();
    *v6 = 0;
    swift_willThrow();
    sub_224DA4238();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_224DA413C();
    *(_QWORD *)(v0 + 56) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
    sub_224DA4250();
    *(_QWORD *)(v0 + 64) = type metadata accessor for CarrySettingsViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
    sub_224DA4124();
    v7 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v8 = (void *)sub_224DA410C();
    v9 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    v11 = (void *)sub_224DA410C();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);
    swift_bridgeObjectRelease();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D9A18C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D9A1EC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  swift_release();
  v1 = *(void **)(v0 + 120);
  sub_224DA4238();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 64) = type metadata accessor for CarrySettingsViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9A3A4(uint64_t a1)
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
  v7[1] = sub_224D95EC8;
  return sub_224D99EE4(a1, v4, v5, v6);
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9A440(uint64_t a1)
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
  v7[1] = sub_224D92714;
  return sub_224D99EE4(a1, v4, v5, v6);
}

uint64_t sub_224D9A4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_224DA4190();
  v4[10] = sub_224DA4184();
  v4[11] = sub_224DA4178();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_224D9A518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v5;
  _BYTE *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 72) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22768D304](v1);
  *(_QWORD *)(v0 + 104) = v2;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_224D9A754;
    return sub_224D9ACB4();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    v5 = (void *)swift_allocError();
    *v6 = 0;
    swift_willThrow();
    sub_224DA4238();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_224DA413C();
    *(_QWORD *)(v0 + 56) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
    sub_224DA4250();
    *(_QWORD *)(v0 + 64) = type metadata accessor for BetaEnrollmentViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA30);
    sub_224DA4124();
    v7 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v8 = (void *)sub_224DA410C();
    v9 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    v11 = (void *)sub_224DA410C();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D9A754()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D9A7B4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 104);
  swift_release();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9A7EC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v1 = *(void **)(v0 + 104);
  swift_release();

  v2 = *(void **)(v0 + 120);
  sub_224DA4238();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 56) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 64) = type metadata accessor for BetaEnrollmentViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA30);
  sub_224DA4124();
  v3 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v4 = (void *)sub_224DA410C();
  v5 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithSubsystem_category_, v4, v5);

  v7 = (void *)sub_224DA410C();
  objc_msgSend(v6, sel_ulog_message_, 60, v7);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9A99C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_224DA4190();
  v1[7] = sub_224DA4184();
  v1[8] = sub_224DA4178();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_224D9AA08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 48);
  sub_224D9E584(0xD00000000000001ELL, 0x8000000224DA6580);
  v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner), sel_setHidden_, 0);
  objc_msgSend(*(id *)(v1 + v2), sel_startAnimating);
  type metadata accessor for BaseExtensionViewController();
  v4 = sub_224D9EB10();
  if (*(_QWORD *)(v3 + 8))
  {
    v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224D9E580(0x7472617453, 0xE500000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 24) = mach_absolute_time();
    *(_BYTE *)(v5 + 32) = 0;
  }
  ((void (*)(uint64_t, _QWORD))v4)(v0 + 16, 0);
  v6 = *(void **)(*(_QWORD *)(v0 + 48)
                + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient);
  *(_QWORD *)(v0 + 80) = v6;
  if (v6)
  {
    v6;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = sub_224D9ABCC;
    return sub_224D95ECC();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D9ABCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
  {

    *(_QWORD *)(v4 + 104) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_224D9AC48()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 48);
  swift_release();
  v3 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC) = v1;
  v4 = v1;

  sub_224D9EB58(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9ACB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_224DA4190();
  v1[7] = sub_224DA4184();
  v1[8] = sub_224DA4178();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_224D9AD20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 48);
  sub_224D9F388(0xD00000000000001ELL, 0x8000000224DA6580);
  v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner), sel_setHidden_, 0);
  objc_msgSend(*(id *)(v1 + v2), sel_startAnimating);
  type metadata accessor for BaseExtensionViewController();
  v4 = sub_224D9EB10();
  if (*(_QWORD *)(v3 + 8))
  {
    v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224D9E580(0x7472617453, 0xE500000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 24) = mach_absolute_time();
    *(_BYTE *)(v5 + 32) = 0;
  }
  ((void (*)(uint64_t, _QWORD))v4)(v0 + 16, 0);
  v6 = *(void **)(*(_QWORD *)(v0 + 48)
                + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient);
  *(_QWORD *)(v0 + 80) = v6;
  if (v6)
  {
    v6;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = sub_224D9AEE4;
    return sub_224D95ECC();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D9AEE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
  {

    *(_QWORD *)(v4 + 104) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_224D9AF60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 48);
  swift_release();
  v3 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC) = v1;
  v4 = v1;

  sub_224D9F0DC(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9AFCC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_release();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9B008(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_224D9B06C;
  return v6(a1);
}

uint64_t sub_224D9B06C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D9B0B8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_224D9B120;
  return v5(v2 + 32);
}

uint64_t sub_224D9B120()
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

uint64_t _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t aBlock;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t (*v27)();
  uint64_t v28;

  v4 = v3;
  v20 = a2;
  v6 = sub_224DA40C4();
  v21 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_224DA40DC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void *)sub_224DA410C();
  v14 = MGGetBoolAnswer();

  aBlock = 0;
  v24 = 0xE000000000000000;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  aBlock = 0xD00000000000002DLL;
  v24 = 0x8000000224DA65A0;
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(aBlock, v24, v4, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  sub_224D9B5C8();
  v15 = (void *)sub_224DA4208();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v20;
  *(_QWORD *)(v16 + 24) = a3;
  *(_BYTE *)(v16 + 32) = v14;
  v27 = sub_224D9B628;
  v28 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v24 = 1107296256;
  v25 = sub_224D92358;
  v26 = &block_descriptor_2;
  v17 = _Block_copy(&aBlock);
  swift_retain();
  sub_224DA40D0();
  v22 = MEMORY[0x24BEE4AF8];
  sub_224D9B66C(&qword_2557DDA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA50);
  sub_224D9B6AC();
  sub_224DA422C();
  MEMORY[0x22768CD28](0, v12, v8, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_224D9B430()
{
  return type metadata accessor for CarrySettingsViewController();
}

uint64_t type metadata accessor for CarrySettingsViewController()
{
  uint64_t result;

  result = qword_2557DD9F0;
  if (!qword_2557DD9F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_224D9B474()
{
  uint64_t result;
  unint64_t v1;

  result = sub_224DA3F8C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CarrySettingsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarrySettingsViewController.__allocating_init(withHomeID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of CarrySettingsViewController.__allocating_init(withHomeID:homeKitIdentifiers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_224D9B508()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_224D9B52C(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_224DA116C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_224D9B534()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9B558(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_224D92714;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2557DDA10 + dword_2557DDA10))(a1, v4);
}

unint64_t sub_224D9B5C8()
{
  unint64_t result;

  result = qword_2557DDA40;
  if (!qword_2557DDA40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557DDA40);
  }
  return result;
}

uint64_t sub_224D9B604()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9B628()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), 0);
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

uint64_t sub_224D9B66C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22768D220](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_224D9B6AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557DDA58;
  if (!qword_2557DDA58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557DDA50);
    result = MEMORY[0x22768D220](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2557DDA58);
  }
  return result;
}

uint64_t sub_224D9B6F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_224D95EC8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2557DDA60 + dword_2557DDA60))(a1, v4);
}

uint64_t sub_224D9B780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for Loader.CacheEntry(319, *(_QWORD *)(a1 + 80), a3, a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *sub_224D9B804()
{
  uint64_t *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  sub_224D9C438(v0[14]);
  v2 = (char *)v0 + *(_QWORD *)(*v0 + 104);
  v5 = type metadata accessor for Loader.CacheEntry(0, *(_QWORD *)(v1 + 80), v3, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_224D9B868()
{
  sub_224D9B804();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for Loader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Loader);
}

uint64_t type metadata accessor for Loader.CacheEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Loader.CacheEntry);
}

uint64_t sub_224D9B898()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_224D9B8A0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_224D9B918(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X14 }
    }
    if (v9 == 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v5) = 1;
      return v3;
    }
    *__dst = *a2;
    *((_BYTE *)__dst + v5) = 0;
  }
  swift_retain();
  return v3;
}

uint64_t sub_224D9BA40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
    else
      return swift_release();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_224D9BA88 + 4 * byte_224DA5515[v5]))();
  }
}

_BYTE *sub_224D9BAE8(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
    swift_retain();
  }
  return __dst;
}

unsigned __int8 *sub_224D9BBD4(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
      swift_retain();
    }
  }
  return __dst;
}

_BYTE *sub_224D9BD80(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_224D9BE68(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = __dst[v7];
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    else
      swift_release();
    v10 = __src[v7];
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_224D9C010(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 8uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_224D9C0D4 + 4 * byte_224DA5538[(v4 - 1)]))();
}

void sub_224D9C120(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_224D9C2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_224D9C310 + 4 * byte_224DA5546[v3]))();
}

void sub_224D9C358(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_224D9C420()
{
  return sub_224D924C0();
}

uint64_t sub_224D9C438(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22768D1A8](a1, v6, a5);
}

void sub_224D9C474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];

  sub_224D90CAC(0xD000000000000036, 0x8000000224DA66B0, v2, (uint64_t)&off_24ECF13E0);
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedManager);
  if (v5)
  {
    v6 = v5;
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = a1;
    v7[3] = a2;
    v7[4] = v2;
    v9[4] = sub_224D9C894;
    v9[5] = v7;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 1107296256;
    v9[2] = sub_224D9C808;
    v9[3] = &block_descriptor_3;
    v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_queryProgramsForSystemAccountsWithPlatforms_completion_, 16, v8);
    _Block_release(v8);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_224D9C58C(unint64_t a1, uint64_t a2, uint64_t (*a3)(_BOOL8), uint64_t a4, uint64_t a5)
{
  unint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  if (a2)
  {
    sub_224DA4238();
    sub_224DA413C();
    type metadata accessor for SDBetaManagerErrorType();
    sub_224DA4250();
    sub_224D90C38(60, 0, 0xE000000000000000, a5, (uint64_t)&off_24ECF13E0);
    swift_bridgeObjectRelease();
  }
  if (a1)
  {
    swift_bridgeObjectRetain();
    sub_224DA4238();
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_224DA425C();
      swift_bridgeObjectRelease();
    }
    sub_224DA4280();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA413C();
    v8 = sub_224D9C8B8();
    MEMORY[0x22768CC74](a1, v8);
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224D90CAC(0x20646E756F46, 0xE600000000000000, a5, (uint64_t)&off_24ECF13E0);
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v9 = sub_224DA425C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v10 = v9 != 0;
  }
  else
  {
    sub_224D90C38(60, 0xD00000000000001ELL, 0x8000000224DA6740, a5, (uint64_t)&off_24ECF13E0);
    v10 = 0;
  }
  return a3(v10);
}

uint64_t sub_224D9C808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = a2;
  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    sub_224D9C8B8();
    v4 = sub_224DA4154();
  }
  swift_retain();
  v5(v4, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D9C870()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9C894(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_224D9C58C(a1, a2, *(uint64_t (**)(_BOOL8))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_224D9C8B8()
{
  unint64_t result;

  result = qword_2557DDB78;
  if (!qword_2557DDB78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2557DDB78);
  }
  return result;
}

uint64_t sub_224D9C8F4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_224D9C968()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = v0;
  return swift_task_switch();
}

uint64_t sub_224D9C980()
{
  uint64_t v0;

  sub_224DA4190();
  *(_QWORD *)(v0 + 96) = sub_224DA4184();
  sub_224DA4178();
  return swift_task_switch();
}

uint64_t sub_224D9C9E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  v2 = *(void **)(v1 + 152);
  *(_QWORD *)(v0 + 104) = v2;
  v3 = v2;
  return swift_task_switch();
}

uint64_t sub_224D9CA30()
{
  uint64_t v0;
  void *v1;
  id v2;
  int v3;
  void *v4;
  uint64_t v5;
  _BYTE *v7;
  _BYTE *v8;

  v1 = *(void **)(v0 + 104);
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_remoteObjectProxy);
    sub_224DA4220();
    swift_unknownObjectRelease();
    sub_224D95A28(v0 + 16, v0 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDB90);
    v3 = swift_dynamicCast();
    v4 = *(void **)(v0 + 104);
    if (v3)
    {

      v5 = *(_QWORD *)(v0 + 80);
      __swift_destroy_boxed_opaque_existential_0(v0 + 16);
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
    }
    sub_224D959E4();
    swift_allocError();
    *v8 = 4;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }
  else
  {
    sub_224D959E4();
    swift_allocError();
    *v7 = 3;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D9CB88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[15] = a1;
  v2[16] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[17] = v3;
  *v3 = v2;
  v3[1] = sub_224D9CBE8;
  v3[11] = v1;
  return swift_task_switch();
}

uint64_t sub_224D9CBE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 144) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_224D9CC5C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[18];
  v2 = sub_224DA3F74();
  v0[19] = v2;
  v0[2] = v0;
  v0[3] = sub_224D95220;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_224D9C8F4;
  v4[3] = &block_descriptor_37;
  v4[4] = v3;
  objc_msgSend(v1, sel_receiveWithBetaEnrollmentHomeID_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_224D9CE38(uint64_t a1, const void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v3[2] = a3;
  v5 = sub_224DA3F8C();
  v3[3] = v5;
  v3[4] = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v3[5] = v6;
  v3[6] = _Block_copy(a2);
  sub_224DA3F80();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v3[7] = v7;
  *v7 = v3;
  v7[1] = sub_224D954E8;
  return sub_224D9CB88(v6);
}

uint64_t sub_224D9CEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[18] = v4;
  *v4 = v3;
  v4[1] = sub_224D9CF4C;
  v4[11] = v2;
  return swift_task_switch();
}

uint64_t sub_224D9CF4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_224D9CFC0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)v0[19];
  v2 = sub_224DA3F74();
  v0[20] = v2;
  sub_224DA3F8C();
  sub_224D9599C();
  v3 = sub_224DA41E4();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_224D95768;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_224D9C8F4;
  v0[13] = &block_descriptor_4;
  v0[14] = v4;
  objc_msgSend(v1, sel_receiveWithBetaEnrollmentHomeID_identifiers_completionHandler_, v2, v3, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_224D9D1DC(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4[2] = a4;
  v6 = sub_224DA3F8C();
  v4[3] = v6;
  v4[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v4[5] = v7;
  v4[6] = _Block_copy(a3);
  sub_224DA3F80();
  sub_224D9599C();
  v8 = sub_224DA41F0();
  v4[7] = v8;
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  v4[8] = v9;
  *v9 = v4;
  v9[1] = sub_224D95B64;
  return sub_224D9CEE8(v7, v8);
}

uint64_t sub_224D9D2BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9D2F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = (const void *)v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_224D92714;
  return ((uint64_t (*)(uint64_t, uint64_t, const void *, uint64_t))((char *)&dword_2557DDB98 + dword_2557DDB98))(v2, v3, v5, v4);
}

uint64_t sub_224D9D370(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_224D95EC8;
  return v6();
}

uint64_t sub_224D9D3C8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_224D95EC8;
  return v7();
}

uint64_t sub_224D9D420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_224DA41A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_224DA419C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_224D927F0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_224DA4178();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_224D9D564()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9D588(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_224D92714;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2557DDBB8 + dword_2557DDBB8))(a1, v4);
}

uint64_t sub_224D9D5F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D9D62C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (const void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_224D95EC8;
  return ((uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_2557DDBC8 + dword_2557DDBC8))(v2, v3, v4);
}

uint64_t initializeWithCopy for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_BYTE *)(a1 + 59) = *(_BYTE *)(a2 + 59);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_BYTE *)(a1 + 59) = *(_BYTE *)(a2 + 59);
  return a1;
}

__n128 __swift_memcpy60_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 44) = *(_OWORD *)(a2 + 44);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_BYTE *)(a1 + 59) = *(_BYTE *)(a2 + 59);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceGestalt(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 60))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceGestalt(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 60) = 1;
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
    *(_BYTE *)(result + 60) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceGestalt()
{
  return &type metadata for DeviceGestalt;
}

uint64_t getEnumTagSinglePayload for DeviceIcon(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEC)
    goto LABEL_17;
  if (a2 + 20 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 20) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 20;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 20;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 20;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x15;
  v8 = v6 - 21;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceIcon(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 20 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 20) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEB)
    return ((uint64_t (*)(void))((char *)&loc_224D9D9C8 + 4 * byte_224DA5665[v4]))();
  *a1 = a2 + 20;
  return ((uint64_t (*)(void))((char *)sub_224D9D9FC + 4 * byte_224DA5660[v4]))();
}

uint64_t sub_224D9D9FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9DA04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D9DA0CLL);
  return result;
}

uint64_t sub_224D9DA18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D9DA20);
  *(_BYTE *)result = a2 + 20;
  return result;
}

uint64_t sub_224D9DA24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9DA2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceIcon()
{
  return &type metadata for DeviceIcon;
}

uint64_t getEnumTagSinglePayload for DeviceClass(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceClass(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_224D9DB24 + 4 * byte_224DA566F[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_224D9DB58 + 4 * byte_224DA566A[v4]))();
}

uint64_t sub_224D9DB58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9DB60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D9DB68);
  return result;
}

uint64_t sub_224D9DB74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D9DB7CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_224D9DB80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9DB88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceClass()
{
  return &type metadata for DeviceClass;
}

uint64_t initializeWithCopy for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceModelIdentifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceModelIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceModelIdentifier()
{
  return &type metadata for DeviceModelIdentifier;
}

unint64_t sub_224D9DDB8()
{
  unint64_t result;

  result = qword_2557DDBF0;
  if (!qword_2557DDBF0)
  {
    result = MEMORY[0x22768D220](&unk_224DA5738, &type metadata for DeviceClass);
    atomic_store(result, (unint64_t *)&qword_2557DDBF0);
  }
  return result;
}

uint64_t sub_224D9DDFC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_224D9DE3C + 4 * byte_224DA5674[a1]))(0x6F6C2E656C707061, 0xEA00000000006F67);
}

uint64_t sub_224D9DE3C()
{
  return 0x7674656C707061;
}

uint64_t sub_224D9DE54()
{
  return 0x63756F74646F7069;
}

uint64_t sub_224D9DE74()
{
  return 0x656E6F687069;
}

unint64_t sub_224D9DE88()
{
  return 0xD000000000000010;
}

uint64_t sub_224D9DEA4()
{
  return 1684107369;
}

uint64_t sub_224D9DEB4()
{
  return 0x6D6F682E64617069;
}

uint64_t sub_224D9DED8()
{
  return 0x63706F746B736564;
}

uint64_t sub_224D9DEFC()
{
  return 0x696E696D63616DLL;
}

uint64_t sub_224D9DF14()
{
  return 0x696475747363616DLL;
}

uint64_t sub_224D9DF34()
{
  return 0x672E6F727063616DLL;
}

uint64_t sub_224D9DF54()
{
  return 0x672E6F727063616DLL;
}

uint64_t sub_224D9DF78()
{
  return 0x672E6F727063616DLL;
}

uint64_t sub_224D9DF9C()
{
  return 0x6F63706F7470616CLL;
}

uint64_t sub_224D9DFC0()
{
  return 0x746177656C707061;
}

uint64_t sub_224D9DFDC()
{
  return 0x646F70656D6F68;
}

uint64_t sub_224D9DFF4()
{
  return 0x2E646F70656D6F68;
}

uint64_t sub_224D9E010()
{
  return 0x6D646F70656D6F68;
}

unint64_t sub_224D9E044()
{
  return 0xD000000000000017;
}

uint64_t sub_224D9E064()
{
  return 0x6165707369666968;
}

uint64_t sub_224D9E084(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_224D9DDFC(*a1);
  v5 = v4;
  if (v3 == sub_224D9DDFC(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_224DA428C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_224D9E10C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_224DA42EC();
  sub_224D9DDFC(v1);
  sub_224DA4130();
  swift_bridgeObjectRelease();
  return sub_224DA4304();
}

uint64_t sub_224D9E16C()
{
  unsigned __int8 *v0;

  sub_224D9DDFC(*v0);
  sub_224DA4130();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D9E1AC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_224DA42EC();
  sub_224D9DDFC(v1);
  sub_224DA4130();
  swift_bridgeObjectRelease();
  return sub_224DA4304();
}

uint64_t sub_224D9E208@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D9E2A4();
  *a1 = result;
  return result;
}

uint64_t sub_224D9E234@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D9DDFC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_224D9E260()
{
  unint64_t result;

  result = qword_2557DDBF8;
  if (!qword_2557DDBF8)
  {
    result = MEMORY[0x22768D220](&unk_224DA57D8, &type metadata for DeviceIcon);
    atomic_store(result, (unint64_t *)&qword_2557DDBF8);
  }
  return result;
}

uint64_t sub_224D9E2A4()
{
  unint64_t v0;

  v0 = sub_224DA4298();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15)
    return 21;
  else
    return v0;
}

ValueMetadata *type metadata accessor for AnalyticsEvent()
{
  return &type metadata for AnalyticsEvent;
}

void sub_224D9E30C()
{
  void *v0;
  id v1;

  v0 = (void *)sub_224DA410C();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  qword_2557DEE80 = (uint64_t)v1;
}

uint64_t sub_224D9E378(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_224D9E380(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t getEnumTagSinglePayload for RemoteViewControllerError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteViewControllerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_224D9E42C + 4 * asc_224DA5870[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_224D9E44C + 4 * byte_224DA5875[v4]))();
}

_BYTE *sub_224D9E42C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_224D9E44C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_224D9E454(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_224D9E45C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_224D9E464(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_224D9E46C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_224D9E478()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteViewControllerError()
{
  return &type metadata for RemoteViewControllerError;
}

unint64_t sub_224D9E494()
{
  unint64_t result;

  result = qword_2557DDC00;
  if (!qword_2557DDC00)
  {
    result = MEMORY[0x22768D220](&unk_224DA58FC, &type metadata for RemoteViewControllerError);
    atomic_store(result, (unint64_t *)&qword_2557DDC00);
  }
  return result;
}

uint64_t sub_224D9E4D8()
{
  return 1;
}

uint64_t sub_224D9E4E0()
{
  sub_224DA42EC();
  sub_224DA42F8();
  return sub_224DA4304();
}

uint64_t sub_224D9E520()
{
  return sub_224DA42F8();
}

uint64_t sub_224D9E544()
{
  sub_224DA42EC();
  sub_224DA42F8();
  return sub_224DA4304();
}

void sub_224D9E584(uint64_t a1, uint64_t a2)
{
  sub_224D9F3A0(a1, a2, 0, (void (*)(uint64_t))type metadata accessor for CarrySettingsViewController, &qword_2557DDA08);
}

id sub_224D9E59C()
{
  _BYTE *v0;
  char *v1;
  uint64_t v2;
  id v3;
  _BYTE *v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  v1 = &v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_QWORD *)v1 + 10) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  v3 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, sel_init);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

id sub_224D9E68C(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  char *v6;
  uint64_t v7;
  id v8;
  _BYTE *v9;
  void *v10;
  id v11;
  objc_super v13;

  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  v6 = &v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_QWORD *)v6 + 10) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  v8 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v9 = v3;
  *(_QWORD *)&v3[v7] = objc_msgSend(v8, sel_init);

  if (a2)
  {
    v10 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

id sub_224D9E808(void *a1)
{
  _BYTE *v1;
  char *v3;
  uint64_t v4;
  id v5;
  _BYTE *v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  v3 = &v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_QWORD *)v3 + 10) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  v4 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  v5 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, sel_init);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_224D9E910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  id result;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  objc_super v11;

  v4 = v3;
  sub_224D9F3A0(0x4C64694477656956, 0xEB0000000064616FLL, a3, (void (*)(uint64_t))type metadata accessor for BaseExtensionViewController, &qword_2557DDC68);
  result = objc_msgSend(v3, sel_view);
  if (result)
  {
    v6 = result;
    v7 = *(id *)&v4[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner];
    sub_224D908AC(v7);

    v8 = *(void **)&v4[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
    if (v8)
    {
      v9 = v8;
      sub_224D9F3A0(0xD00000000000001CLL, 0x8000000224DA6540, v10, (void (*)(uint64_t))type metadata accessor for BaseExtensionViewController, &qword_2557DDC68);
      sub_224D9EE1C(v9);

    }
    v11.receiver = v4;
    v11.super_class = (Class)type metadata accessor for BaseExtensionViewController();
    return objc_msgSendSuper2(&v11, sel_viewDidLoad);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id BaseExtensionViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_224D9EB10())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_224D9EB58(id result)
{
  char *v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t inited;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v2 = v1;
  v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    v4 = result;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
    sub_224DA4124();
    v5 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v6 = (void *)sub_224DA410C();
    v7 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v5, sel_initWithSubsystem_category_, v6, v7);

    v9 = (void *)sub_224DA410C();
    objc_msgSend(v8, sel_ulog_message_, 40, v9);

    type metadata accessor for Stopwatch();
    inited = swift_initStackObject();
    *(_BYTE *)(inited + 16) = 1;
    *(_QWORD *)(inited + 24) = 0;
    *(_BYTE *)(inited + 32) = 1;
    *(_QWORD *)(inited + 40) = 0;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 24) = mach_absolute_time();
    *(_BYTE *)(inited + 32) = 0;
    *(_BYTE *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_224DA4238();
    swift_bridgeObjectRelease();
    sub_224D97600();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA4124();
    v11 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v12 = (void *)sub_224DA410C();
    v13 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_initWithSubsystem_category_, v12, v13);

    v15 = (void *)sub_224DA410C();
    objc_msgSend(v14, sel_ulog_message_, 40, v15);
    swift_bridgeObjectRelease();

    v16 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v16], sel_stopAnimating);
  }
  return result;
}

id sub_224D9EE1C(id result)
{
  char *v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t inited;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v2 = v1;
  v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    v4 = result;
    type metadata accessor for BaseExtensionViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDC68);
    sub_224DA4124();
    v5 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v6 = (void *)sub_224DA410C();
    v7 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v5, sel_initWithSubsystem_category_, v6, v7);

    v9 = (void *)sub_224DA410C();
    objc_msgSend(v8, sel_ulog_message_, 40, v9);

    type metadata accessor for Stopwatch();
    inited = swift_initStackObject();
    *(_BYTE *)(inited + 16) = 1;
    *(_QWORD *)(inited + 24) = 0;
    *(_BYTE *)(inited + 32) = 1;
    *(_QWORD *)(inited + 40) = 0;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 24) = mach_absolute_time();
    *(_BYTE *)(inited + 32) = 0;
    *(_BYTE *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_224DA4238();
    swift_bridgeObjectRelease();
    sub_224D97600();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA4124();
    v11 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v12 = (void *)sub_224DA410C();
    v13 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_initWithSubsystem_category_, v12, v13);

    v15 = (void *)sub_224DA410C();
    objc_msgSend(v14, sel_ulog_message_, 40, v15);
    swift_bridgeObjectRelease();

    v16 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v16], sel_stopAnimating);
  }
  return result;
}

id sub_224D9F0DC(id result)
{
  char *v1;
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t inited;
  uint64_t v6;

  v2 = v1;
  v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    v4 = result;
    sub_224D9F3A0(0xD000000000000014, 0x8000000224DA6890, 0, (void (*)(uint64_t))type metadata accessor for BetaEnrollmentViewController, &qword_2557DDA30);
    type metadata accessor for Stopwatch();
    inited = swift_initStackObject();
    *(_BYTE *)(inited + 16) = 1;
    *(_QWORD *)(inited + 24) = 0;
    *(_BYTE *)(inited + 32) = 1;
    *(_QWORD *)(inited + 40) = 0;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 24) = mach_absolute_time();
    *(_BYTE *)(inited + 32) = 0;
    *(_BYTE *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_224DA4238();
    swift_bridgeObjectRelease();
    sub_224D97600();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224D9F3A0(0xD000000000000014, 0x8000000224DA68B0, 0, (void (*)(uint64_t))type metadata accessor for BetaEnrollmentViewController, &qword_2557DDA30);
    swift_bridgeObjectRelease();
    v6 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v6], sel_stopAnimating);
  }
  return result;
}

void sub_224D9F258(uint64_t a1, uint64_t a2)
{
  sub_224D9F3A0(a1, a2, 0, (void (*)(uint64_t))type metadata accessor for XPCConnectionManager, &qword_2557DD550);
}

void sub_224D9F270(uint64_t a1, uint64_t a2)
{
  sub_224D9F3A0(a1, a2, 0, (void (*)(uint64_t))type metadata accessor for RemoteViewControllerClient, &qword_2557DD7D8);
}

void sub_224D9F288()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDC60);
  sub_224DA4124();
  v0 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v1 = (void *)sub_224DA410C();
  v2 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithSubsystem_category_, v1, v2);

  v4 = (void *)sub_224DA410C();
  objc_msgSend(v3, sel_ulog_message_, 40, v4);

}

void sub_224D9F388(uint64_t a1, uint64_t a2)
{
  sub_224D9F3A0(a1, a2, 0, (void (*)(uint64_t))type metadata accessor for BetaEnrollmentViewController, &qword_2557DDA30);
}

void sub_224D9F3A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t *a5)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  a4(a3);
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_224DA4124();
  v6 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v7 = (void *)sub_224DA410C();
  v8 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithSubsystem_category_, v7, v8);

  v10 = (void *)sub_224DA410C();
  objc_msgSend(v9, sel_ulog_message_, 40, v10);

}

uint64_t type metadata accessor for BaseExtensionViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for BaseExtensionViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for Feature(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D9F518 + 4 * byte_224DA59E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D9F54C + 4 * byte_224DA59E0[v4]))();
}

uint64_t sub_224D9F54C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9F554(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D9F55CLL);
  return result;
}

uint64_t sub_224D9F568(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D9F570);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D9F574(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D9F57C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

unint64_t sub_224D9F59C()
{
  unint64_t result;

  result = qword_2557DDC70;
  if (!qword_2557DDC70)
  {
    result = MEMORY[0x22768D220](&unk_224DA5A50, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_2557DDC70);
  }
  return result;
}

const char *sub_224D9F5E0()
{
  return "HomePlatformSettingsUI";
}

const char *sub_224D9F5F4()
{
  _BYTE *v0;

  if (*v0)
    return "HomePodCarrySettings";
  else
    return "HomePodBetaEnrollment";
}

uint64_t sub_224D9F620()
{
  uint64_t v0;
  id v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (qword_2557DD350 != -1)
    swift_once();
  v0 = qword_2557DEE80;
  v1 = (id)qword_2557DEE80;
  result = sub_224DA4004();
  qword_2557DEE88 = result;
  unk_2557DEE90 = v3;
  byte_2557DEE98 = v4 & 1;
  qword_2557DEEA0 = v5;
  unk_2557DEEA8 = v0;
  return result;
}

uint64_t sub_224D9F69C()
{
  uint64_t v0;
  id v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (qword_2557DD350 != -1)
    swift_once();
  v0 = qword_2557DEE80;
  v1 = (id)qword_2557DEE80;
  result = sub_224DA4004();
  qword_2557DEEB0 = result;
  *(_QWORD *)algn_2557DEEB8 = v3;
  byte_2557DEEC0 = v4 & 1;
  qword_2557DEEC8 = v5;
  unk_2557DEED0 = v0;
  return result;
}

uint64_t sub_224D9F724()
{
  uint64_t v0;
  id v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (qword_2557DD350 != -1)
    swift_once();
  v0 = qword_2557DEE80;
  v1 = (id)qword_2557DEE80;
  result = sub_224DA4004();
  qword_2557DEED8 = result;
  unk_2557DEEE0 = v3;
  byte_2557DEEE8 = v4 & 1;
  qword_2557DEEF0 = v5;
  unk_2557DEEF8 = v0;
  return result;
}

uint64_t sub_224D9F7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_224D9F7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_224D9F7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(_OWORD *);
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(uint64_t (**)(_OWORD *))(a3 + 40);
  v5 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v5;
  v6 = *(_OWORD *)(a1 + 48);
  v8[2] = *(_OWORD *)(a1 + 32);
  v8[3] = v6;
  v8[4] = *(_OWORD *)(a1 + 64);
  v9 = v3;
  return v4(v8);
}

uint64_t sub_224D9F7F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_224D9F800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_224D9F808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_224D9F810(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_224D9F818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t sub_224D9F820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t sub_224D9F828(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_224D9F830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t sub_224D9F838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t sub_224D9F840(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_224D9F848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t sub_224D9F850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t sub_224D9F858(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 152) + *(_QWORD *)(a2 + 152));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_224D92714;
  return v7(a1, a2);
}

uint64_t _s17ViewServiceLaunchVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s17ViewServiceLaunchVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17ViewServiceLaunchVwca(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s17ViewServiceLaunchVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ViewServiceLaunchVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s17ViewServiceLaunchVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s17ViewServiceLaunchVMa()
{
  return &_s17ViewServiceLaunchVN;
}

BOOL sub_224D9FB88(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

void sub_224D9FBE8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  uint64_t (*v19)();
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v1 = v0;
  if (sub_224D9FB88(0, (uint64_t)&unk_24ECF02F0))
  {
    sub_224DA4238();
    swift_bridgeObjectRelease();
    v21 = 0x3D746E657645;
    v22 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA413C();
    sub_224DA0144();
    sub_224DA0598();
    sub_224DA40F4();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDC60);
    sub_224DA4124();
    v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v3 = (void *)sub_224DA410C();
    v4 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4, &_s17ViewServiceLaunchVN, 0xE800000000000000);

    v6 = (void *)sub_224DA410C();
    objc_msgSend(v5, sel_ulog_message_, 40, v6);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRetain();
    v7 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v8 = swift_allocObject();
    v9 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v8 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v8 + 64) = v9;
    *(_OWORD *)(v8 + 80) = *(_OWORD *)(v1 + 64);
    *(_QWORD *)(v8 + 96) = *(_QWORD *)(v1 + 80);
    v10 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v8 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v8 + 32) = v10;
    v19 = sub_224DA0E3C;
    v20 = v8;
    v15 = MEMORY[0x24BDAC760];
    v16 = 1107296256;
    v17 = sub_224D9FFD8;
    v18 = &block_descriptor_5;
    v11 = _Block_copy(&v15);
    sub_224DA0E74(v1);
    swift_release();
    v12 = AnalyticsSendEventLazy();
    _Block_release(v11);

    if ((v12 & 1) != 0)
      return;
    sub_224DA0DC4();
    swift_allocError();
    v14 = 2;
  }
  else
  {
    sub_224DA4238();
    swift_bridgeObjectRelease();
    v15 = 0xD000000000000010;
    v16 = 0x8000000224DA69B0;
    swift_bridgeObjectRetain();
    sub_224DA413C();
    swift_bridgeObjectRelease();
    sub_224DA413C();
    sub_224D9E580(0xD000000000000010, 0x8000000224DA69B0);
    swift_bridgeObjectRelease();
    sub_224DA0DC4();
    swift_allocError();
    v14 = 3;
  }
  *v13 = 0;
  v13[1] = v14;
  swift_willThrow();
}

id sub_224D9FFD8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_224DA0598();
    v4 = (void *)sub_224DA40E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_224DA004C()
{
  sub_224DA4238();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  sub_224DA0144();
  sub_224DA0598();
  sub_224DA40F4();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x3D746E657645;
}

uint64_t sub_224DA0144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  id v4;
  double v5;
  id v6;
  char isUniquelyReferenced_nonNull_native;
  id v8;
  void *v9;
  id v10;
  char v11;
  __int128 v13;
  __int128 v14;
  _BYTE v15[16];
  uint64_t v16[4];
  _BYTE v17[8];
  int v18;
  char v19;
  _QWORD v20[2];

  v1 = v0;
  *(_OWORD *)v16 = *(_OWORD *)v0;
  *(uint64_t *)((char *)&v16[1] + 5) = *(_QWORD *)(v0 + 13);
  sub_224DA05D4((uint64_t)&v16[2], (uint64_t)v17, &qword_2557DDCA0);
  sub_224DA05D4((uint64_t)v17, (uint64_t)&v18, &qword_2557DDCA0);
  v2 = MEMORY[0x24BEE4B00];
  if ((v19 & 1) == 0)
  {
    v3 = v18;
    v4 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    swift_bridgeObjectRetain();
    LODWORD(v5) = v3;
    v6 = objc_msgSend(v4, sel_initWithFloat_, v5);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_224DA09D8((uint64_t)v6, v16[0], v16[1], isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_224DA0640((uint64_t)v16);
  }
  v13 = *(_OWORD *)(v1 + 56);
  v14 = *(_OWORD *)(v1 + 72);
  sub_224DA05D4((uint64_t)&v14, (uint64_t)v15, &qword_2557DDCA8);
  sub_224DA05D4((uint64_t)v15, (uint64_t)v20, &qword_2557DDCA8);
  if (v20[1])
  {
    v8 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
    sub_224DA0618((uint64_t)v15);
    swift_bridgeObjectRetain();
    v9 = (void *)sub_224DA410C();
    sub_224DA0640((uint64_t)v15);
    v10 = objc_msgSend(v8, sel_initWithString_, v9);

    v11 = swift_isUniquelyReferenced_nonNull_native();
    sub_224DA09D8((uint64_t)v10, v13, *((uint64_t *)&v13 + 1), v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_224DA0314()
{
  uint64_t v0;
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  double v5;
  float v6;

  if ((*(_BYTE *)(v0 + 32) & 1) != 0 || (*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    *(_DWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 20) = 1;
    *(_QWORD *)(v0 + 24) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    v1 = (_BYTE *)(v0 + 48);
LABEL_6:
    *(_QWORD *)(v0 + 40) = 0;
    *v1 = 1;
    return result;
  }
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 40);
  result = v3 - v2;
  if (v3 >= v2)
  {
    v1 = (_BYTE *)(v0 + 48);
    UpTicksToSecondsF();
    v6 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224DA413C();
    sub_224DA41D8();
    sub_224DA413C();
    sub_224D9E580(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(float *)(v0 + 16) = v6;
    *(_BYTE *)(v0 + 20) = 0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224D9FBE8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 20) = 1;
    *(_QWORD *)(v0 + 24) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_224DA04E8()
{
  return sub_224DA004C();
}

unint64_t sub_224DA0530(uint64_t a1)
{
  unint64_t result;

  result = sub_224DA0554();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_224DA0554()
{
  unint64_t result;

  result = qword_2557DDC90;
  if (!qword_2557DDC90)
  {
    result = MEMORY[0x22768D220](&unk_224DA5B04, &_s17ViewServiceLaunchVN);
    atomic_store(result, (unint64_t *)&qword_2557DDC90);
  }
  return result;
}

unint64_t sub_224DA0598()
{
  unint64_t result;

  result = qword_2557DDC98;
  if (!qword_2557DDC98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557DDC98);
  }
  return result;
}

uint64_t sub_224DA05D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_224DA0618(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_224DA0640(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_224DA0668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_224DA42EC();
  sub_224DA4130();
  v4 = sub_224DA4304();
  return sub_224DA0B34(a1, a2, v4);
}

uint64_t sub_224DA06CC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDCB0);
  v38 = a2;
  v6 = sub_224DA4274();
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
    sub_224DA42EC();
    sub_224DA4130();
    result = sub_224DA4304();
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

void sub_224DA09D8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_224DA0668(a2, a3);
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
    sub_224DA0C14();
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
  sub_224DA06CC(v15, a4 & 1);
  v20 = sub_224DA0668(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_224DA42A4();
  __break(1u);
}

unint64_t sub_224DA0B34(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_224DA428C() & 1) == 0)
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
      while (!v14 && (sub_224DA428C() & 1) == 0);
    }
  }
  return v6;
}

id sub_224DA0C14()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDCB0);
  v2 = *v0;
  v3 = sub_224DA4268();
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

unint64_t sub_224DA0DC4()
{
  unint64_t result;

  result = qword_2557DDCB8;
  if (!qword_2557DDCB8)
  {
    result = MEMORY[0x22768D220](&unk_224DA5B88, &type metadata for AnalyticsError);
    atomic_store(result, (unint64_t *)&qword_2557DDCB8);
  }
  return result;
}

uint64_t sub_224DA0E08()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_224DA0E3C()
{
  return sub_224DA0144();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_224DA0E74(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t destroy for AnalyticsError(uint64_t a1)
{
  unint64_t result;
  int v2;

  result = *(_QWORD *)(a1 + 8);
  v2 = -1;
  if (result < 0xFFFFFFFF)
    v2 = result;
  if (v2 - 1 < 0)
    return swift_bridgeObjectRelease();
  return result;
}

_QWORD *_s22HomePlatformSettingsUI14AnalyticsErrorOwCP_0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = a2[1];
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

_QWORD *assignWithCopy for AnalyticsError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL)
    LODWORD(v5) = -1;
  else
    v5 = a1[1];
  v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL)
    v4 = a2[1];
  v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AnalyticsError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if (v5 - 1 < 0)
  {
    v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF)
      v7 = a2[1];
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  v5 = v4 + 1;
  v6 = v4 - 2;
  if (v5 >= 4)
    return v6;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AnalyticsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 3;
  }
  return result;
}

uint64_t sub_224DA110C(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_224DA1130(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsError()
{
  return &type metadata for AnalyticsError;
}

uint64_t sub_224DA116C(char a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, a1 & 1, a2);
}

uint64_t sub_224DA1184()
{
  uint64_t ObjectType;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v18[4];

  ObjectType = swift_getObjectType();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = ObjectType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
  sub_224DA4124();
  v4 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v5 = (void *)sub_224DA410C();
  v6 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithSubsystem_category_, v5, v6);

  v8 = (void *)sub_224DA410C();
  objc_msgSend(v7, sel_ulog_message_, 40, v8);

  type metadata accessor for BaseExtensionViewController();
  v10 = sub_224D9EB10();
  if (*(_QWORD *)(v9 + 8))
  {
    v11 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224D9E580(1886352467, 0xE400000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v11 + 40) = mach_absolute_time();
    *(_BYTE *)(v11 + 48) = 0;
    sub_224DA0314();
  }
  ((void (*)(_QWORD *, _QWORD))v10)(v18, 0);
  v12 = sub_224DA41A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v3, 1, 1, v12);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v14 = sub_224DA4184();
  v15 = (_QWORD *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  swift_release();
  sub_224D985F4((uint64_t)v3, (uint64_t)&unk_2557DDD30, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_224DA141C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v12[32];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_224D9F388(0x6E69676542646964, 0xEF676E6974736F48);
  type metadata accessor for BaseExtensionViewController();
  v4 = sub_224D9EB10();
  if (*(_QWORD *)(v3 + 8))
  {
    v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_224D9E580(1886352467, 0xE400000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 40) = mach_absolute_time();
    *(_BYTE *)(v5 + 48) = 0;
    sub_224DA0314();
  }
  ((void (*)(_BYTE *, _QWORD))v4)(v12, 0);
  v6 = sub_224DA41A8();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 1, 1, v6);
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v8 = sub_224DA4184();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  swift_release();
  sub_224D985F4((uint64_t)v2, (uint64_t)&unk_2557DDD20, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_224DA15F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_224DA4190();
  v4[10] = sub_224DA4184();
  v4[11] = sub_224DA4178();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_224DA165C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v5;
  _BYTE *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 72) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22768D304](v1);
  *(_QWORD *)(v0 + 104) = v2;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_224DA1898;
    return sub_224D99524();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    v5 = (void *)swift_allocError();
    *v6 = 0;
    swift_willThrow();
    sub_224DA4238();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_224DA413C();
    *(_QWORD *)(v0 + 56) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
    sub_224DA4250();
    *(_QWORD *)(v0 + 64) = type metadata accessor for CarrySettingsViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
    sub_224DA4124();
    v7 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v8 = (void *)sub_224DA410C();
    v9 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    v11 = (void *)sub_224DA410C();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224DA1898()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224DA18F8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v1 = *(void **)(v0 + 104);
  swift_release();

  v2 = *(void **)(v0 + 120);
  sub_224DA4238();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 56) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 64) = type metadata accessor for CarrySettingsViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA08);
  sub_224DA4124();
  v3 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v4 = (void *)sub_224DA410C();
  v5 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithSubsystem_category_, v4, v5);

  v7 = (void *)sub_224DA410C();
  objc_msgSend(v6, sel_ulog_message_, 60, v7);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224DA1AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  sub_224DA4190();
  v4[10] = sub_224DA4184();
  v4[11] = sub_224DA4178();
  v4[12] = v5;
  return swift_task_switch();
}

uint64_t sub_224DA1B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v5;
  _BYTE *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 72) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22768D304](v1);
  *(_QWORD *)(v0 + 104) = v2;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_224DA1D50;
    return sub_224DA30D4();
  }
  else
  {
    swift_release();
    sub_224D959E4();
    v5 = (void *)swift_allocError();
    *v6 = 0;
    swift_willThrow();
    sub_224DA4238();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_224DA413C();
    *(_QWORD *)(v0 + 56) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
    sub_224DA4250();
    *(_QWORD *)(v0 + 64) = type metadata accessor for BetaEnrollmentViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA30);
    sub_224DA4124();
    v7 = objc_allocWithZone(MEMORY[0x24BE297C8]);
    v8 = (void *)sub_224DA410C();
    v9 = (void *)sub_224DA410C();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    v11 = (void *)sub_224DA410C();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);
    swift_bridgeObjectRelease();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224DA1D50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224DA1DB0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  swift_release();
  v1 = *(void **)(v0 + 120);
  sub_224DA4238();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_224DA413C();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD548);
  sub_224DA4250();
  *(_QWORD *)(v0 + 64) = type metadata accessor for BetaEnrollmentViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA30);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *BetaEnrollmentViewController.__allocating_init(withHomeID:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return BetaEnrollmentViewController.init(withHomeID:)(a1);
}

char *BetaEnrollmentViewController.init(withHomeID:)(uint64_t a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  objc_class *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  char *v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = 0;
  v40 = 0xE000000000000000;
  v6 = v1;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v39 = 0xD000000000000011;
  v40 = 0x8000000224DA6A20;
  v7 = sub_224DA3F8C();
  sub_224D9B66C(&qword_2557DD9A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v34 = a1;
  sub_224DA4280();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(v39, v40, (uint64_t)ObjectType, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  v36 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(&v6[OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID], a1, v7);
  *(_QWORD *)&v6[OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers] = MEMORY[0x24BEE4B08];

  v41.receiver = v6;
  v41.super_class = ObjectType;
  v9 = (char *)objc_msgSendSuper2(&v41, sel_init);
  v10 = &v9[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  v11 = *(_QWORD *)v10;
  v12 = *((_QWORD *)v10 + 1);
  v33 = *((_QWORD *)v10 + 5);
  v32 = *((_OWORD *)v10 + 4);
  *(_OWORD *)v10 = xmmword_224DA5400;
  *((_OWORD *)v10 + 1) = xmmword_224DA5410;
  *((_OWORD *)v10 + 2) = xmmword_224DA5420;
  *((_OWORD *)v10 + 3) = xmmword_224DA5430;
  *((_OWORD *)v10 + 4) = xmmword_224DA5BD0;
  *((_QWORD *)v10 + 10) = 0xEE00746E656D6C6CLL;
  v13 = v9;
  sub_224D98BB4(v11, v12);
  v14 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  v15 = (char *)objc_allocWithZone(v14);
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  v16 = swift_unknownObjectWeakInit();
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(_QWORD *)(v16 + 8) = &off_24ECF1D80;
  swift_unknownObjectWeakAssign();
  v17 = &v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(_QWORD *)v17 = 0xD00000000000002CLL;
  *((_QWORD *)v17 + 1) = 0x8000000224DA6470;
  v18 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  v19 = v13;
  v20 = v15;
  v21 = (void *)sub_224DA410C();
  v22 = objc_msgSend(v18, sel_initWithExtensionPointIdentifier_, v21);

  *(_QWORD *)&v20[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v22;
  v38.receiver = v20;
  v38.super_class = v14;
  v23 = objc_msgSendSuper2(&v38, sel_init);

  v24 = *(void **)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(_QWORD *)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v23;

  v25 = sub_224DA41A8();
  v26 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v37, 1, 1, v25);
  v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v28 = sub_224DA4184();
  v29 = (_QWORD *)swift_allocObject();
  v30 = MEMORY[0x24BEE6930];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v27;
  swift_release();
  sub_224D985F4(v26, (uint64_t)&unk_2557DDCC0, (uint64_t)v29);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  return v19;
}

uint64_t sub_224DA23E0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_224DA2408(uint64_t a1)
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
  v7[1] = sub_224D95EC8;
  return sub_224D9A4AC(a1, v4, v5, v6);
}

char *BetaEnrollmentViewController.__allocating_init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return BetaEnrollmentViewController.init(withHomeID:homeKitIdentifiers:)(a1, a2);
}

char *BetaEnrollmentViewController.init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  char *v22;
  char *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557DD520);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = 0;
  v43 = 0xE000000000000000;
  v8 = v2;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v42 = 0xD000000000000011;
  v43 = 0x8000000224DA6A20;
  v9 = sub_224DA3F8C();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_224D9B66C(&qword_2557DD9A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v37 = a1;
  sub_224DA4280();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  sub_224D9B66C((unint64_t *)&qword_2557DD6B8, v10, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  sub_224DA41FC();
  swift_bridgeObjectRelease();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(v42, v43, (uint64_t)ObjectType, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  v39 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(&v8[OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID], a1, v9);
  *(_QWORD *)&v8[OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers] = a2;

  v44.receiver = v8;
  v44.super_class = ObjectType;
  v12 = (char *)objc_msgSendSuper2(&v44, sel_init);
  v13 = &v12[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  v14 = *(_QWORD *)v13;
  v15 = *((_QWORD *)v13 + 1);
  v36 = *((_QWORD *)v13 + 5);
  v35 = *((_OWORD *)v13 + 4);
  *(_OWORD *)v13 = xmmword_224DA5400;
  *((_OWORD *)v13 + 1) = xmmword_224DA5410;
  *((_OWORD *)v13 + 2) = xmmword_224DA5420;
  *((_OWORD *)v13 + 3) = xmmword_224DA5430;
  *((_OWORD *)v13 + 4) = xmmword_224DA5BD0;
  *((_QWORD *)v13 + 10) = 0xEE00746E656D6C6CLL;
  v16 = v12;
  sub_224D98BB4(v14, v15);
  v17 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  v18 = (char *)objc_allocWithZone(v17);
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  v19 = swift_unknownObjectWeakInit();
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(_QWORD *)(v19 + 8) = &off_24ECF1D80;
  swift_unknownObjectWeakAssign();
  v20 = &v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(_QWORD *)v20 = 0xD00000000000002CLL;
  *((_QWORD *)v20 + 1) = 0x8000000224DA6470;
  v21 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  v22 = v16;
  v23 = v18;
  v24 = (void *)sub_224DA410C();
  v25 = objc_msgSend(v21, sel_initWithExtensionPointIdentifier_, v24);

  *(_QWORD *)&v23[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v25;
  v41.receiver = v23;
  v41.super_class = v17;
  v26 = objc_msgSendSuper2(&v41, sel_init);

  v27 = *(void **)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(_QWORD *)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v26;

  v28 = sub_224DA41A8();
  v29 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v40, 1, 1, v28);
  v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_224DA4190();
  swift_retain();
  v31 = sub_224DA4184();
  v32 = (_QWORD *)swift_allocObject();
  v33 = MEMORY[0x24BEE6930];
  v32[2] = v31;
  v32[3] = v33;
  v32[4] = v30;
  swift_release();
  sub_224D985F4(v29, (uint64_t)&unk_2557DDCC8, (uint64_t)v32);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
  return v22;
}

uint64_t sub_224DA29F4(uint64_t a1)
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
  v7[1] = sub_224D92714;
  return sub_224D9A4AC(a1, v4, v5, v6);
}

char *sub_224DA2B1C()
{
  char *v0;
  void *v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  _BYTE *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
  if (!v1)
  {
    sub_224D959E4();
    swift_allocError();
    *v7 = 2;
LABEL_6:
    swift_willThrow();
    return v0;
  }
  v9[0] = 0;
  v2 = (char *)objc_msgSend(v1, sel_makeXPCConnectionWithError_, v9);
  v3 = v9[0];
  if (!v2)
  {
    v0 = (char *)v9[0];
    sub_224DA3F68();

    goto LABEL_6;
  }
  v0 = v2;
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_2557E8F10);
  objc_msgSend(v0, sel_setRemoteObjectInterface_, v6);

  return v0;
}

Swift::Void __swiftcall BetaEnrollmentViewController.willMove(toParent:)(UIViewController_optional *toParent)
{
  void *v1;
  void *v2;
  UIViewController_optional *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = v1;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  v4 = toParent;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDCD0);
  sub_224DA4124();
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D9F388(0xD000000000000014, 0x8000000224DA6A40);
  swift_bridgeObjectRelease();
  if (toParent)
  {
    v5 = -[UIViewController_optional view](v4, sel_view);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v2, sel_view);
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend(v6, sel_backgroundColor);
        objc_msgSend(v8, sel_setBackgroundColor_, v9);

      }
      else
      {
        __break(1u);
      }
    }
  }
}

Swift::Void __swiftcall BetaEnrollmentViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1);
  v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_navigationBar);

    v6 = objc_msgSend(v5, sel_standardAppearance);
    objc_msgSend(v5, sel_setScrollEdgeAppearance_, v6);

  }
}

Swift::Void __swiftcall BetaEnrollmentViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_navigationBar);

    objc_msgSend(v5, sel_setScrollEdgeAppearance_, 0);
  }
}

uint64_t sub_224DA30D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[3] = v0;
  v1[4] = swift_getObjectType();
  v2 = sub_224DA3F8C();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_224DA4190();
  v1[8] = sub_224DA4184();
  v1[9] = sub_224DA4178();
  v1[10] = v3;
  return swift_task_switch();
}

uint64_t sub_224DA3174()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA30);
  sub_224DA4124();
  v2 = objc_allocWithZone(MEMORY[0x24BE297C8]);
  v3 = (void *)sub_224DA410C();
  v4 = (void *)sub_224DA410C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  v6 = (void *)sub_224DA410C();
  objc_msgSend(v5, sel_ulog_message_, 40, v6);

  v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc))
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(void **)(v0 + 24);
    type metadata accessor for XPCConnectionManager();
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 88) = v10;
    v11 = v9;
    swift_defaultActor_initialize();
    *(_QWORD *)(v10 + 152) = 0;
    *(_QWORD *)(v10 + 160) = 0;
    *(_QWORD *)(v10 + 168) = 0;
    *(_QWORD *)(v10 + 112) = v11;
    *(_QWORD *)(v10 + 120) = &off_24ECF1D70;
    *(_OWORD *)(v10 + 128) = xmmword_224DA5450;
    *(_BYTE *)(v10 + 144) = 2;
    *(_QWORD *)(v1 + v7) = v10;
    swift_retain();
    swift_release();
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v12;
    *v12 = v0;
    v12[1] = sub_224DA335C;
    return sub_224D91D64();
  }
}

uint64_t sub_224DA335C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224DA33BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[6] + 16))(v0[7], v1 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID, v0[5]);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers);
  v0[14] = v2;
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[15] = v3;
  *v3 = v0;
  v3[1] = sub_224D998A4;
  return sub_224D9CEE8(v0[7], v2);
}

uint64_t sub_224DA3480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID;
  v2 = sub_224DA3F8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

id BetaEnrollmentViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_224DA3550()
{
  return sub_224DA2B1C();
}

uint64_t static BetaEnrollmentViewController.shouldShowBetaEnrollmentButton(forHomeID:homeKitIdentifiers:withCompletion:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  return _s22HomePlatformSettingsUI28BetaEnrollmentViewControllerC010shouldShoweF6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(a1, a3, a4);
}

uint64_t sub_224DA3658(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t (*v26)();
  uint64_t v27;

  v19 = a2;
  v7 = sub_224DA40C4();
  v20 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_224DA40DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = 0;
  v23 = 0xE000000000000000;
  sub_224DA4238();
  swift_bridgeObjectRelease();
  aBlock = 0xD00000000000002CLL;
  v23 = 0x8000000224DA6B40;
  sub_224DA413C();
  swift_bridgeObjectRelease();
  sub_224D90CAC(aBlock, v23, a4, (uint64_t)&off_24ECF19F0);
  swift_bridgeObjectRelease();
  sub_224DA3CD4(0, (unint64_t *)&qword_2557DDA40);
  v14 = (void *)sub_224DA4208();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v19;
  *(_QWORD *)(v15 + 24) = a3;
  *(_BYTE *)(v15 + 32) = a1;
  v26 = sub_224D9B628;
  v27 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v24 = sub_224D92358;
  v25 = &block_descriptor_6;
  v16 = _Block_copy(&aBlock);
  swift_retain();
  sub_224DA40D0();
  v21 = MEMORY[0x24BEE4AF8];
  sub_224D9B66C(&qword_2557DDA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557DDA50);
  sub_224D9B6AC();
  sub_224DA422C();
  MEMORY[0x22768CD28](0, v13, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t _s22HomePlatformSettingsUI28BetaEnrollmentViewControllerC010shouldShoweF6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  char v6;
  _QWORD *v7;
  _BYTE v9[24];
  ValueMetadata *v10;
  unint64_t v11;

  v10 = &type metadata for Feature;
  v11 = sub_224DA3C60();
  v9[0] = 0;
  v6 = sub_224DA3F98();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  if ((v6 & 1) != 0)
  {
    sub_224DA3CD4(0, (unint64_t *)&unk_2557DDD40);
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = a2;
    v7[3] = a3;
    v7[4] = v3;
    swift_retain();
    sub_224D9C474((uint64_t)sub_224DA3CC8, (uint64_t)v7);
    return swift_release();
  }
  else
  {
    sub_224D90CAC(0xD000000000000039, 0x8000000224DA6B00, v3, (uint64_t)&off_24ECF19F0);
    return a2(0, 0);
  }
}

uint64_t sub_224DA3AE4()
{
  return type metadata accessor for BetaEnrollmentViewController();
}

uint64_t type metadata accessor for BetaEnrollmentViewController()
{
  uint64_t result;

  result = qword_2557DDD00;
  if (!qword_2557DDD00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t method lookup function for BetaEnrollmentViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BetaEnrollmentViewController.__allocating_init(withHomeID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of BetaEnrollmentViewController.__allocating_init(withHomeID:homeKitIdentifiers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_224DA3B44()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_224DA3B68(char a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), a1 & 1, a2);
}

uint64_t sub_224DA3B84(uint64_t a1)
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
  v7[1] = sub_224D95EC8;
  return sub_224DA1AA8(a1, v4, v5, v6);
}

uint64_t sub_224DA3BF4(uint64_t a1)
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
  v7[1] = sub_224D95EC8;
  return sub_224DA15F0(a1, v4, v5, v6);
}

unint64_t sub_224DA3C60()
{
  unint64_t result;

  result = qword_2557DDD38;
  if (!qword_2557DDD38)
  {
    result = MEMORY[0x22768D220](&unk_224DA5A78, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_2557DDD38);
  }
  return result;
}

uint64_t sub_224DA3CA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224DA3CC8(char a1)
{
  uint64_t *v1;

  return sub_224DA3658(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_224DA3CD4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_224DA3D0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void destroy for LocalizedString(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for LocalizedString(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for LocalizedString(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = v5;

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

uint64_t assignWithTake for LocalizedString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizedString(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizedString(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocalizedString()
{
  return &type metadata for LocalizedString;
}

uint64_t sub_224DA3F5C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_224DA3F68()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_224DA3F74()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_224DA3F80()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_224DA3F8C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_224DA3F98()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_224DA3FA4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_224DA3FB0()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_224DA3FBC()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_224DA3FC8()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_224DA3FD4()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_224DA3FE0()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_224DA3FEC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_224DA3FF8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_224DA4004()
{
  return MEMORY[0x24BDEEAA0]();
}

uint64_t sub_224DA4010()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_224DA401C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_224DA4028()
{
  return MEMORY[0x24BDEF1D8]();
}

uint64_t sub_224DA4034()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_224DA4040()
{
  return MEMORY[0x24BDF07B8]();
}

uint64_t sub_224DA404C()
{
  return MEMORY[0x24BDF07C8]();
}

uint64_t sub_224DA4058()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_224DA4064()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_224DA4070()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_224DA407C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_224DA4088()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_224DA4094()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_224DA40A0()
{
  return MEMORY[0x24BDF20B0]();
}

uint64_t sub_224DA40AC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_224DA40B8()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_224DA40C4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_224DA40D0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_224DA40DC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_224DA40E8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_224DA40F4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_224DA4100()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_224DA410C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_224DA4118()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_224DA4124()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_224DA4130()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_224DA413C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_224DA4148()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_224DA4154()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_224DA4160()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_224DA416C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_224DA4178()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_224DA4184()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_224DA4190()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_224DA419C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_224DA41A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_224DA41B4()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_224DA41C0()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_224DA41CC()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_224DA41D8()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_224DA41E4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_224DA41F0()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_224DA41FC()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_224DA4208()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_224DA4214()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_224DA4220()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_224DA422C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_224DA4238()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_224DA4244()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_224DA4250()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_224DA425C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_224DA4268()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_224DA4274()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_224DA4280()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_224DA428C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_224DA4298()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_224DA42A4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_224DA42B0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_224DA42BC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_224DA42C8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_224DA42D4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_224DA42E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_224DA42EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_224DA42F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_224DA4304()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

