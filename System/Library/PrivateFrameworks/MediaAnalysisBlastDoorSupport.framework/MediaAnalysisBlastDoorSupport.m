id MediaAnalysisBlastDoorInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MediaAnalysisBlastDoorInterface.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  char *v6;
  objc_class *v7;
  _QWORD v9[3];
  objc_super v10;
  uint64_t v11;

  v1 = sub_241254F78();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241254F6C();
  MEMORY[0x24BDAC7A8]();
  sub_241254DF8();
  MEMORY[0x24BDAC7A8]();
  v9[2] = sub_241254E34();
  v5 = (void *)*MEMORY[0x24BE0F908];
  sub_2412536F0(0, &qword_2571040E8);
  v6 = v0;
  v9[1] = v5;
  sub_241254DEC();
  v11 = MEMORY[0x24BEE4AF8];
  sub_241253CB4(&qword_2571040F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571040F8);
  sub_241252A00();
  sub_241254FA8();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  sub_241254F84();
  *(_QWORD *)&v6[OBJC_IVAR___IMMediaAnalysisBlastDoorInterfaceInternal_bd] = sub_241254E04();

  v7 = (objc_class *)type metadata accessor for MediaAnalysisBlastDoorInterface();
  v10.receiver = v6;
  v10.super_class = v7;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426911CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_241252A00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257104100;
  if (!qword_257104100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571040F8);
    result = MEMORY[0x2426911E4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257104100);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426911D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for MediaAnalysisBlastDoorInterface()
{
  return objc_opt_self();
}

uint64_t sub_241252AD0(uint64_t a1, uint64_t a2)
{
  char v5;
  BOOL v6;
  BOOL v7;

  if (a1 == 0x6572506567616D69 && a2 == 0xED00007377656976)
    return 1;
  v5 = sub_241254FC0();
  v6 = a1 == 0x6572506F65646976 && a2 == 0xED00007377656976;
  v7 = v6;
  if ((v5 & 1) != 0 || v7)
    return 1;
  else
    return sub_241254FC0();
}

uint64_t sub_241252CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a3;
  v4 = sub_241254EDC();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_241254F0C();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257104110);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_241254F24();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v22 - v17;
  sub_241254D8C();
  sub_241254F18();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_241254F00();
  sub_241254ED0();
  sub_241254EE8();
  v19 = (uint64_t (*)(uint64_t))MEMORY[0x24BE0D438];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = v27;
  sub_241253CB4(&qword_257104128, v19, MEMORY[0x24BE0D430]);
  swift_retain();
  sub_241254E1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_24125305C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257104110);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24125309C(uint64_t a1, void (*a2)(void *, void *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = sub_241254EE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257104188);
  MEMORY[0x24BDAC7A8]();
  v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2412548D8(a1, (uint64_t)v9, &qword_257104188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = (void *)*v9;
    MEMORY[0x2426911A8](*v9);
    a2(0, v10);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v5 + 32))(v7, v9, v4);
    v11 = (void *)sub_241254EC4();
    a2(v11, 0);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2412531F0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_241253214(uint64_t a1)
{
  uint64_t v1;

  sub_24125309C(a1, *(void (**)(void *, void *))(v1 + 16));
}

void sub_2412532E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_241254D74();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_241253340(uint64_t a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  _QWORD v26[4];
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  float v35;
  char v36;
  float v37;
  char v38;

  v26[2] = a1;
  v33 = sub_241254E64();
  v26[0] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v32 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_241254F24();
  MEMORY[0x24BDAC7A8](v6);
  v26[1] = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_241254F0C();
  v29 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v28 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_241254E4C();
  v27 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_241254F60();
  sub_2412536F0(0, &qword_257104130);
  v11 = (void *)sub_241254F90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257104138);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_241255350;
  v37 = a2;
  v38 = 0;
  v13 = sub_241254EF4();
  v15 = v14;
  v16 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE0D00];
  v17 = sub_241253728();
  *(_QWORD *)(v12 + 64) = v17;
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v15;
  v35 = a3;
  v36 = 0;
  v18 = sub_241254EF4();
  *(_QWORD *)(v12 + 96) = v16;
  *(_QWORD *)(v12 + 104) = v17;
  *(_QWORD *)(v12 + 72) = v18;
  *(_QWORD *)(v12 + 80) = v19;
  sub_241254DE0();

  swift_bridgeObjectRelease();
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (a2 >= 9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_241254E40();
  sub_241254D8C();
  v20 = v26[3];
  sub_241254F18();
  if (!v20)
  {
    v21 = v28;
    sub_241254F00();
    sub_241253CB4(&qword_257104148, (uint64_t (*)(uint64_t))MEMORY[0x24BE0D3C8], MEMORY[0x24BE0D3C0]);
    v23 = v32;
    v22 = v33;
    sub_241254E28();
    v24 = sub_241254E58();
    (*(void (**)(char *, uint64_t))(v26[0] + 8))(v23, v22);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v31);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v30);
    return v24;
  }
LABEL_9:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_2412536F0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_241253728()
{
  unint64_t result;

  result = qword_257104140;
  if (!qword_257104140)
  {
    result = MEMORY[0x2426911E4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257104140);
  }
  return result;
}

uint64_t sub_241253890(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
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
  char *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a4;
  v6 = sub_241254DB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_241254F24();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_241254F0C();
  v24 = *(_QWORD *)(v11 - 8);
  v25 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_241254E88();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    v22 = v7;
    v23 = v6;
    sub_241254E7C();
    sub_241254D8C();
    sub_241254F18();
    sub_241254F00();
    sub_241254EB8();
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BE0D408];
    sub_241254DA4();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a3;
    *(_QWORD *)(v19 + 24) = v26;
    sub_241253CB4(&qword_257104150, v18, MEMORY[0x24BE0D400]);
    swift_retain();
    sub_241254E10();
    swift_release();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_241253B58(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = sub_241254EB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257104180);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2412548D8(a1, (uint64_t)v12, &qword_257104180);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = (void *)*v12;
    MEMORY[0x2426911A8](*v12);
    a4(0, v13);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v7 + 32))(v9, v12, v6);
    v14 = (void *)sub_241254E94();
    a4(v14, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_241253CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_241253B58(a1, a2, a3, *(void (**)(void *, void *))(v3 + 16));
}

uint64_t sub_241253CB4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426911E4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241253E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v39 = a8;
  LODWORD(v34) = a7;
  v32 = a6;
  v33 = a1;
  v31 = a5;
  v30 = a4;
  v9 = sub_241254DB0();
  v40 = *(_QWORD *)(v9 - 8);
  v41 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_241254F24();
  MEMORY[0x24BDAC7A8](v12);
  v13 = sub_241254F0C();
  v37 = *(_QWORD *)(v13 - 8);
  v38 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_241254E88();
  v35 = *(_QWORD *)(v16 - 8);
  v36 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_241254EAC();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v30 - v24;
  sub_241254EA0();
  v26 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v34 = v19;
  v26(v23, v25, v19);
  sub_241254E70();
  sub_241254D8C();
  sub_241254F18();
  sub_241254F00();
  sub_241254EB8();
  v27 = (uint64_t (*)(uint64_t))MEMORY[0x24BE0D408];
  sub_241254DA4();
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v39;
  *(_QWORD *)(v28 + 24) = a9;
  sub_241253CB4(&qword_257104150, v27, MEMORY[0x24BE0D400]);
  swift_retain();
  sub_241254E10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v38);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v25, v34);
}

void sub_241254100(uint64_t a1, uint64_t a2, char a3, void (*a4)(void *, void *, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = sub_241254EB8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257104180);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2412548D8(a1, (uint64_t)v13, &qword_257104180);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v13;
    MEMORY[0x2426911A8](*v13);
    a4(0, v14, a3 & 1);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v8 + 32))(v10, v13, v7);
    v15 = (void *)sub_241254E94();
    a4(v15, 0, a3 & 1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_241254260(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_241254100(a1, a2, a3, *(void (**)(void *, void *, _QWORD))(v3 + 16));
}

void sub_241254390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  if (a2)
    v6 = sub_241254D74();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1);

}

id MediaAnalysisBlastDoorInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaAnalysisBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MediaAnalysisBlastDoorInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static MediaAnalysisBlastDoorInterface.supports(feature:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMetadata(forAttachmentWith:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateImagePreview(for:maxPixelDimension:scale:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MediaAnalysisBlastDoorInterface.generateMovieFrames(forAttachmentWith:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

void sub_2412544D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_241254390(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_2412544DC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_241254500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2412532E8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_241254508(uint64_t a1, uint64_t a2, const void *a3)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v24[1] = a2;
  v4 = sub_241254EDC();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_241254F0C();
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257104110);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_241254F24();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v24 - v18;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a3;
  _Block_copy(a3);
  sub_241254D8C();
  sub_241254F18();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  sub_241254F00();
  sub_241254ED0();
  sub_241254EE8();
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BE0D438];
  v21 = swift_allocObject();
  v22 = v29;
  *(_QWORD *)(v21 + 16) = sub_24125491C;
  *(_QWORD *)(v21 + 24) = v22;
  sub_241253CB4(&qword_257104128, v20, MEMORY[0x24BE0D430]);
  swift_retain();
  sub_241254E1C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  return swift_release();
}

uint64_t sub_2412548D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t MessageType.init(rawValue:)(unsigned __int8 a1)
{
  return sub_241254AC8(a1) & 0x1FF;
}

BOOL sub_24125495C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_241254974()
{
  return sub_241254FD8();
}

uint64_t sub_2412549A0@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_241254AC8(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

void sub_2412549D0(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t PreviewType.init(rawValue:)(unsigned __int8 a1)
{
  unsigned __int8 v1;
  int v2;

  v1 = a1;
  if (a1)
  {
    if (a1 == 1)
      v1 = a1;
    else
      v1 = 0;
    v2 = a1 != 1;
  }
  else
  {
    v2 = 0;
  }
  return v1 | (v2 << 8);
}

uint64_t sub_241254A14()
{
  sub_241254FCC();
  sub_241254FD8();
  return sub_241254FE4();
}

uint64_t sub_241254A58()
{
  sub_241254FCC();
  sub_241254FD8();
  return sub_241254FE4();
}

char *sub_241254A98@<X0>(char *result@<X0>, char *a2@<X8>)
{
  int v2;
  char v3;
  BOOL v4;
  BOOL v5;
  char v6;
  BOOL v7;

  v2 = *result;
  if (*result)
    v3 = 0;
  else
    v3 = *result;
  v4 = v2 != 0;
  v5 = v2 == 1;
  if (v2 == 1)
    v6 = 1;
  else
    v6 = v3;
  v7 = !v5 && v4;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_241254AC8(unsigned __int8 a1)
{
  int v1;

  v1 = 0;
  switch(a1)
  {
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x74u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x83u:
    case 0x86u:
    case 0x87u:
    case 0x8Bu:
    case 0xAAu:
    case 0xB4u:
    case 0xB5u:
    case 0xBEu:
    case 0xC3u:
    case 0xC4u:
      return a1 | (v1 << 8);
    default:
      a1 = 0;
      v1 = 1;
      break;
  }
  return a1 | (v1 << 8);
}

unint64_t sub_241254B18()
{
  unint64_t result;

  result = qword_257104190;
  if (!qword_257104190)
  {
    result = MEMORY[0x2426911E4](&protocol conformance descriptor for MessageType, &type metadata for MessageType);
    atomic_store(result, (unint64_t *)&qword_257104190);
  }
  return result;
}

unint64_t sub_241254B60()
{
  unint64_t result;

  result = qword_257104198;
  if (!qword_257104198)
  {
    result = MEMORY[0x2426911E4](&protocol conformance descriptor for PreviewType, &type metadata for PreviewType);
    atomic_store(result, (unint64_t *)&qword_257104198);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

ValueMetadata *type metadata accessor for PreviewType()
{
  return &type metadata for PreviewType;
}

uint64_t NSUserDefaults.isMessagesLockdownModeEnabled.getter()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v5;
  id v6;
  unsigned __int8 v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = v0;
  sub_241254DD4();
  v2 = (void *)sub_241254DBC();
  v3 = MEMORY[0x242690DC4]();

  if ((v3 & 1) != 0)
    return 1;
  v5 = (void *)sub_241254F48();
  v6 = objc_msgSend(v1, sel_objectForKey_inDomain_, v5, *MEMORY[0x24BDD0D70]);

  if (v6)
  {
    sub_241254F9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_241254CEC((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v7;
  }
  else
  {
    sub_241254D34((uint64_t)v9);
  }
  return 0;
}

uint64_t sub_241254CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2571041A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_241254D34(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2571041A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_241254D74()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_241254D80()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_241254D8C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_241254D98()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_241254DA4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_241254DB0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_241254DBC()
{
  return MEMORY[0x24BE60C08]();
}

uint64_t sub_241254DC8()
{
  return MEMORY[0x24BE60C10]();
}

uint64_t sub_241254DD4()
{
  return MEMORY[0x24BE60C18]();
}

uint64_t sub_241254DE0()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_241254DEC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_241254DF8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_241254E04()
{
  return MEMORY[0x24BE0CF88]();
}

uint64_t sub_241254E10()
{
  return MEMORY[0x24BE0CF90]();
}

uint64_t sub_241254E1C()
{
  return MEMORY[0x24BE0CF98]();
}

uint64_t sub_241254E28()
{
  return MEMORY[0x24BE0CFA0]();
}

uint64_t sub_241254E34()
{
  return MEMORY[0x24BE0CFB0]();
}

uint64_t sub_241254E40()
{
  return MEMORY[0x24BE0D3A8]();
}

uint64_t sub_241254E4C()
{
  return MEMORY[0x24BE0D3B0]();
}

uint64_t sub_241254E58()
{
  return MEMORY[0x24BE0D3B8]();
}

uint64_t sub_241254E64()
{
  return MEMORY[0x24BE0D3C8]();
}

uint64_t sub_241254E70()
{
  return MEMORY[0x24BE0D3D0]();
}

uint64_t sub_241254E7C()
{
  return MEMORY[0x24BE0D3D8]();
}

uint64_t sub_241254E88()
{
  return MEMORY[0x24BE0D3E0]();
}

uint64_t sub_241254E94()
{
  return MEMORY[0x24BE0D3E8]();
}

uint64_t sub_241254EA0()
{
  return MEMORY[0x24BE0D3F0]();
}

uint64_t sub_241254EAC()
{
  return MEMORY[0x24BE0D3F8]();
}

uint64_t sub_241254EB8()
{
  return MEMORY[0x24BE0D408]();
}

uint64_t sub_241254EC4()
{
  return MEMORY[0x24BE0D418]();
}

uint64_t sub_241254ED0()
{
  return MEMORY[0x24BE0D420]();
}

uint64_t sub_241254EDC()
{
  return MEMORY[0x24BE0D428]();
}

uint64_t sub_241254EE8()
{
  return MEMORY[0x24BE0D438]();
}

uint64_t sub_241254EF4()
{
  return MEMORY[0x24BE0E4C0]();
}

uint64_t sub_241254F00()
{
  return MEMORY[0x24BE0E6D0]();
}

uint64_t sub_241254F0C()
{
  return MEMORY[0x24BE0E6D8]();
}

uint64_t sub_241254F18()
{
  return MEMORY[0x24BE0E6E0]();
}

uint64_t sub_241254F24()
{
  return MEMORY[0x24BE0E6E8]();
}

uint64_t sub_241254F30()
{
  return MEMORY[0x24BE0F8B0]();
}

uint64_t sub_241254F3C()
{
  return MEMORY[0x24BE0F8D8]();
}

uint64_t sub_241254F48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_241254F54()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_241254F60()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_241254F6C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_241254F78()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_241254F84()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_241254F90()
{
  return MEMORY[0x24BE0F900]();
}

uint64_t sub_241254F9C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_241254FA8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_241254FB4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_241254FC0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_241254FCC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_241254FD8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_241254FE4()
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

