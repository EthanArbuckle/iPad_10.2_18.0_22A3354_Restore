uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17B5FD8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17B5FCC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1CCD44D94(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v8 = a4(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v16 - v10;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1E0C80A78]();
  v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1CCD473B4(a1, (uint64_t)v13, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v13;
    MEMORY[0x1D17B5FA8](*v13);
    a2(0, v14);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 32))(v11, v13, v8);
    v15 = (void *)sub_1CCD474B0();
    a2(v15, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1CCD44EEC(_QWORD *a1, void (*a2)(_QWORD, void *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  uint64_t v45;
  _QWORD v46[3];
  id v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = sub_1CCD47540();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1[2]
    || (v10 = sub_1CCD461C0(99, 0xE100000000000000), (v11 & 1) == 0)
    || (sub_1CCD46268(a1[7] + 32 * v10, (uint64_t)&v47), (swift_dynamicCast() & 1) == 0))
  {
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v26 = (void *)sub_1CCD475A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CD8);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_1CCD478C0;
    v47 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CE0);
    v28 = sub_1CCD47528();
    v30 = v29;
    *(_QWORD *)(v27 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v27 + 64) = sub_1CCD46224();
    *(_QWORD *)(v27 + 32) = v28;
    *(_QWORD *)(v27 + 40) = v30;
    sub_1CCD4745C();

    swift_bridgeObjectRelease();
LABEL_12:
    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v32, v9, v6);
    a2(0, v31);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v12 = (void *)v46[2];
  v13 = sub_1CCD474BC();
  if ((v14 & 1) != 0)
  {
    v13 = sub_1CCD474BC();
    if ((v15 & 1) != 0)
    {
      sub_1CCD47570();
      sub_1CCD463D4(0, &qword_1EFA20CD0);
      v37 = (void *)sub_1CCD475A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CD8);
      v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = xmmword_1CCD478C0;
      v47 = v12;
      v48 = 0;
      v39 = sub_1CCD47528();
      v41 = v40;
      *(_QWORD *)(v38 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v38 + 64) = sub_1CCD46224();
      *(_QWORD *)(v38 + 32) = v39;
      *(_QWORD *)(v38 + 40) = v41;
      sub_1CCD4745C();

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  v16 = v13;
  v17 = (void *)objc_opt_self();
  v18 = (void *)sub_1CCD4754C();
  v47 = 0;
  v19 = objc_msgSend(v17, sel_dataWithPropertyList_format_options_error_, v18, 200, 0, &v47);

  if (!v19)
  {
    v34 = v47;
    v35 = (void *)sub_1CCD47444();

    swift_willThrow();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v36 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    goto LABEL_12;
  }
  v20 = v47;
  v21 = sub_1CCD47450();
  v23 = v22;

  if (v16 == 97)
  {
    sub_1CCD4751C();
    v42 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03108];
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = a2;
    *(_QWORD *)(v43 + 24) = a3;
    sub_1CCD4640C(&qword_1ED8AFF20, v42, MEMORY[0x1E0D03100]);
    swift_retain();
  }
  else
  {
    if (v16 == 255)
    {
      sub_1CCD474E0();
      v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E68];
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = a2;
      *(_QWORD *)(v25 + 24) = a3;
      sub_1CCD4640C(&qword_1ED8AFF18, v24, MEMORY[0x1E0D02E60]);
    }
    else
    {
      sub_1CCD474D4();
      v44 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C00];
      v45 = swift_allocObject();
      *(_QWORD *)(v45 + 16) = a2;
      *(_QWORD *)(v45 + 24) = a3;
      sub_1CCD4640C(&qword_1ED8AFEE8, v44, MEMORY[0x1E0D02BF8]);
    }
    swift_retain();
  }
  sub_1CCD47498();
  swift_release();
  return sub_1CCD462F8(v21, v23);
}

void sub_1CCD455BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1CCD47438();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1CCD45614(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  unint64_t v29;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  unint64_t v41;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  id v47[5];

  v47[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = sub_1CCD47540();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CCD47510();
  v43 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  MEMORY[0x1E0C80A78]();
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_1CCD4754C();
  v47[0] = 0;
  v16 = objc_msgSend(v14, sel_dataWithPropertyList_format_options_error_, v15, 200, 0, v47);

  v17 = v47[0];
  if (!v16)
  {
    v34 = v17;
    v35 = (void *)sub_1CCD47444();

    swift_willThrow();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v36 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v32 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v37, v10, v7);
    a3(0, v32);
    goto LABEL_16;
  }
  v18 = a4;
  v19 = sub_1CCD47450();
  v45 = v20;

  if (!*(_QWORD *)(a2 + 16)
    || (v21 = sub_1CCD461C0(0x6369706F74, 0xE500000000000000), (v22 & 1) == 0)
    || (sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v21, (uint64_t)v47), (swift_dynamicCast() & 1) == 0))
  {
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v31 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

LABEL_14:
    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v32 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v33, v10, v7);
    a3(0, v32);
    sub_1CCD462F8(v19, v45);
LABEL_16:

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v42[1] = v46, v23 = sub_1CCD461C0(0x646E616D6D6F63, 0xE700000000000000), (v24 & 1) == 0)
    || (sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v23, (uint64_t)v47), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v38 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    goto LABEL_14;
  }
  if (*(_QWORD *)(a2 + 16)
    && (v25 = sub_1CCD461C0(0xD000000000000015, 0x80000001CCD47A60), (v26 & 1) != 0)
    && (sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v25, (uint64_t)v47), swift_dynamicCast())
    && (v46 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_1CCD474C8();
    v27 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B70];
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = a3;
    *(_QWORD *)(v28 + 24) = v18;
    sub_1CCD4640C(&qword_1EFA20D08, v27, MEMORY[0x1E0D02B68]);
    swift_retain();
    v29 = v45;
    sub_1CCD47498();
    swift_release();
    return sub_1CCD462F8(v19, v29);
  }
  else
  {
    sub_1CCD47504();
    sub_1CCD474F8();
    v39 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F50];
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = a3;
    *(_QWORD *)(v40 + 24) = v18;
    sub_1CCD4640C(&qword_1EFA20D00, v39, MEMORY[0x1E0D02F48]);
    swift_retain();
    v41 = v45;
    sub_1CCD4748C();
    sub_1CCD462F8(v19, v41);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v13, v44);
  }
}

void sub_1CCD45CD0(uint64_t a1, void (*a2)(void *, void *))
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

  v4 = sub_1CCD474F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20D18);
  MEMORY[0x1E0C80A78]();
  v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1CCD473B4(a1, (uint64_t)v9, &qword_1EFA20D18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = (void *)*v9;
    MEMORY[0x1D17B5FA8](*v9);
    a2(0, v10);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v5 + 32))(v7, v9, v4);
    v11 = (void *)sub_1CCD474EC();
    a2(v11, 0);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id IDSBlastDoorInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IDSBlastDoorInterface.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  void *v5;
  id v6;
  objc_class *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v11 = sub_1CCD47588();
  v1 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CCD4757C();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1CCD47474();
  MEMORY[0x1E0C80A78]();
  v10 = OBJC_IVAR___IDSBlastDoorInterfaceInternal_bd;
  v9[2] = sub_1CCD474A4();
  v5 = (void *)*MEMORY[0x1E0D032D0];
  sub_1CCD463D4(0, &qword_1ED8AFF08);
  v6 = v0;
  v9[0] = v5;
  sub_1CCD47468();
  v13 = MEMORY[0x1E0DEE9D8];
  sub_1CCD4640C(&qword_1ED8AFF00, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8AFEF0);
  sub_1CCD4644C();
  sub_1CCD475AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v11);
  sub_1CCD47594();
  *(_QWORD *)(v9[1] + v10) = sub_1CCD47480();

  v7 = (objc_class *)type metadata accessor for IDSBlastDoorInterface();
  v12.receiver = v6;
  v12.super_class = v7;
  return objc_msgSendSuper2(&v12, sel_init);
}

id IDSBlastDoorInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDSBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1CCD461C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1CCD475C4();
  sub_1CCD47564();
  v4 = sub_1CCD475D0();
  return sub_1CCD464FC(a1, a2, v4);
}

unint64_t sub_1CCD46224()
{
  unint64_t result;

  result = qword_1EFA20CE8;
  if (!qword_1EFA20CE8)
  {
    result = MEMORY[0x1D17B5FE4](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFA20CE8);
  }
  return result;
}

uint64_t sub_1CCD46268(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CCD462A4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1CCD462C8(uint64_t a1)
{
  uint64_t v1;

  sub_1CCD44D94(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02C00], &qword_1ED8AFF10);
}

uint64_t sub_1CCD462F8(uint64_t a1, unint64_t a2)
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

void sub_1CCD4633C(uint64_t a1)
{
  uint64_t v1;

  sub_1CCD44D94(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03108], &qword_1ED8AFF30);
}

void sub_1CCD4636C(uint64_t a1)
{
  uint64_t v1;

  sub_1CCD44D94(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02E68], &qword_1ED8AFF28);
}

void sub_1CCD4639C(uint64_t a1)
{
  uint64_t v1;

  sub_1CCD45CD0(a1, *(void (**)(void *, void *))(v1 + 16));
}

void sub_1CCD463A4(uint64_t a1)
{
  uint64_t v1;

  sub_1CCD44D94(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02B70], &qword_1EFA20D10);
}

uint64_t sub_1CCD463D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1CCD4640C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D17B5FE4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1CCD4644C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED8AFEF8;
  if (!qword_1ED8AFEF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED8AFEF0);
    result = MEMORY[0x1D17B5FE4](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED8AFEF8);
  }
  return result;
}

uint64_t type metadata accessor for IDSBlastDoorInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for IDSBlastDoorInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IDSBlastDoorInterface.unpack(payloadDictionary:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of IDSBlastDoorInterface.unpack(clientMessage:context:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

unint64_t sub_1CCD464FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1CCD475B8() & 1) == 0)
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
      while (!v14 && (sub_1CCD475B8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1CCD465DC(_QWORD *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  uint64_t v47;
  _QWORD v48[3];
  id v49;
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = sub_1CCD47540();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  v10 = a1[2];
  _Block_copy(a3);
  if (!v10
    || (v11 = sub_1CCD461C0(99, 0xE100000000000000), (v12 & 1) == 0)
    || (sub_1CCD46268(a1[7] + 32 * v11, (uint64_t)&v49), !swift_dynamicCast()))
  {
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v27 = (void *)sub_1CCD475A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CD8);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1CCD478C0;
    v49 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CE0);
    v29 = sub_1CCD47528();
    v31 = v30;
    *(_QWORD *)(v28 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v28 + 64) = sub_1CCD46224();
    *(_QWORD *)(v28 + 32) = v29;
    *(_QWORD *)(v28 + 40) = v31;
    sub_1CCD4745C();

    swift_bridgeObjectRelease();
LABEL_12:
    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v32 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v33, v8, v5);
    v34 = (void *)sub_1CCD47438();
    ((void (**)(_QWORD, _QWORD, void *))a3)[2](a3, 0, v34);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_release();
  }
  v13 = (void *)v48[2];
  v14 = sub_1CCD474BC();
  if ((v15 & 1) != 0)
  {
    v14 = sub_1CCD474BC();
    if ((v16 & 1) != 0)
    {
      sub_1CCD47570();
      sub_1CCD463D4(0, &qword_1EFA20CD0);
      v39 = (void *)sub_1CCD475A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA20CD8);
      v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_1CCD478C0;
      v49 = v13;
      v50 = 0;
      v41 = sub_1CCD47528();
      v43 = v42;
      *(_QWORD *)(v40 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v40 + 64) = sub_1CCD46224();
      *(_QWORD *)(v40 + 32) = v41;
      *(_QWORD *)(v40 + 40) = v43;
      sub_1CCD4745C();

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  v17 = v14;
  v18 = (void *)objc_opt_self();
  v19 = (void *)sub_1CCD4754C();
  v49 = 0;
  v20 = objc_msgSend(v18, sel_dataWithPropertyList_format_options_error_, v19, 200, 0, &v49);

  if (!v20)
  {
    v36 = v49;
    v37 = (void *)sub_1CCD47444();

    swift_willThrow();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v38 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    goto LABEL_12;
  }
  v21 = v49;
  v22 = sub_1CCD47450();
  v24 = v23;

  if (v17 == 97)
  {
    sub_1CCD4751C();
    v44 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03108];
    v45 = swift_allocObject();
    *(_QWORD *)(v45 + 16) = sub_1CCD473F8;
    *(_QWORD *)(v45 + 24) = v9;
    sub_1CCD4640C(&qword_1ED8AFF20, v44, MEMORY[0x1E0D03100]);
    swift_retain();
  }
  else
  {
    if (v17 == 255)
    {
      sub_1CCD474E0();
      v25 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E68];
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = sub_1CCD473F8;
      *(_QWORD *)(v26 + 24) = v9;
      sub_1CCD4640C(&qword_1ED8AFF18, v25, MEMORY[0x1E0D02E60]);
    }
    else
    {
      sub_1CCD474D4();
      v46 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C00];
      v47 = swift_allocObject();
      *(_QWORD *)(v47 + 16) = sub_1CCD473F8;
      *(_QWORD *)(v47 + 24) = v9;
      sub_1CCD4640C(&qword_1ED8AFEE8, v46, MEMORY[0x1E0D02BF8]);
    }
    swift_retain();
  }
  sub_1CCD47498();
  swift_release();
  sub_1CCD462F8(v22, v24);
  return swift_release();
}

uint64_t sub_1CCD46C6C(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v40;
  uint64_t (*v41)(uint64_t);
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49[5];

  v45 = a3;
  v49[4] = *(id *)MEMORY[0x1E0C80C00];
  v44 = sub_1CCD47510();
  v6 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CCD47540();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = a4;
  v13 = (void *)objc_opt_self();
  _Block_copy(a4);
  v14 = (void *)sub_1CCD4754C();
  v49[0] = 0;
  v15 = objc_msgSend(v13, sel_dataWithPropertyList_format_options_error_, v14, 200, 0, v49);

  v16 = v49[0];
  if (!v15)
  {
    v34 = v16;
    v35 = (void *)sub_1CCD47444();

    swift_willThrow();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v36 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v37, v12, v9);
    v38 = (void *)sub_1CCD47438();
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v38);

    goto LABEL_16;
  }
  v17 = sub_1CCD47450();
  v19 = v18;

  if (!*(_QWORD *)(a2 + 16)
    || (v20 = sub_1CCD461C0(0x6369706F74, 0xE500000000000000), (v21 & 1) == 0)
    || (sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v20, (uint64_t)v49), !swift_dynamicCast()))
  {
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v30 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

LABEL_14:
    sub_1CCD47534();
    sub_1CCD4640C(&qword_1EFA20CF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v32, v12, v9);
    v33 = (void *)sub_1CCD47438();
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v33);

    sub_1CCD462F8(v17, v19);
LABEL_16:

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return swift_release();
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v43[1] = v47, v43[2] = v48, v22 = sub_1CCD461C0(0x646E616D6D6F63, 0xE700000000000000), (v23 & 1) == 0)
    || (sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v22, (uint64_t)v49), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_1CCD47570();
    sub_1CCD463D4(0, &qword_1EFA20CD0);
    v40 = (void *)sub_1CCD475A0();
    sub_1CCD4745C();

    goto LABEL_14;
  }
  if (!*(_QWORD *)(a2 + 16) || (v24 = sub_1CCD461C0(0xD000000000000015, 0x80000001CCD47A60), (v25 & 1) == 0))
  {
    v27 = v46;
LABEL_20:
    sub_1CCD47504();
    sub_1CCD474F8();
    v41 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F50];
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = sub_1CCD473AC;
    *(_QWORD *)(v42 + 24) = v27;
    sub_1CCD4640C(&qword_1EFA20D00, v41, MEMORY[0x1E0D02F48]);
    swift_retain();
    sub_1CCD4748C();
    sub_1CCD462F8(v17, v19);
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v44);
    return swift_release();
  }
  sub_1CCD46268(*(_QWORD *)(a2 + 56) + 32 * v24, (uint64_t)v49);
  v26 = swift_dynamicCast();
  v27 = v46;
  if (!v26 || (v47 & 1) == 0)
    goto LABEL_20;
  swift_bridgeObjectRelease();
  sub_1CCD474C8();
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B70];
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_1CCD473AC;
  *(_QWORD *)(v29 + 24) = v27;
  sub_1CCD4640C(&qword_1EFA20D08, v28, MEMORY[0x1E0D02B68]);
  swift_retain();
  sub_1CCD47498();
  swift_release();
  sub_1CCD462F8(v17, v19);
  return swift_release();
}

uint64_t sub_1CCD47388()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1CCD473AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1CCD455BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1CCD473B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CCD47438()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CCD47444()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CCD47450()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CCD4745C()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1CCD47468()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CCD47474()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CCD47480()
{
  return MEMORY[0x1E0D02898]();
}

uint64_t sub_1CCD4748C()
{
  return MEMORY[0x1E0D028B0]();
}

uint64_t sub_1CCD47498()
{
  return MEMORY[0x1E0D028D0]();
}

uint64_t sub_1CCD474A4()
{
  return MEMORY[0x1E0D028E8]();
}

uint64_t sub_1CCD474B0()
{
  return MEMORY[0x1E0D028F8]();
}

uint64_t sub_1CCD474BC()
{
  return MEMORY[0x1E0D029A0]();
}

uint64_t sub_1CCD474C8()
{
  return MEMORY[0x1E0D02B70]();
}

uint64_t sub_1CCD474D4()
{
  return MEMORY[0x1E0D02C00]();
}

uint64_t sub_1CCD474E0()
{
  return MEMORY[0x1E0D02E68]();
}

uint64_t sub_1CCD474EC()
{
  return MEMORY[0x1E0D02F40]();
}

uint64_t sub_1CCD474F8()
{
  return MEMORY[0x1E0D02F50]();
}

uint64_t sub_1CCD47504()
{
  return MEMORY[0x1E0D02FC0]();
}

uint64_t sub_1CCD47510()
{
  return MEMORY[0x1E0D02FC8]();
}

uint64_t sub_1CCD4751C()
{
  return MEMORY[0x1E0D03108]();
}

uint64_t sub_1CCD47528()
{
  return MEMORY[0x1E0D03150]();
}

uint64_t sub_1CCD47534()
{
  return MEMORY[0x1E0D03280]();
}

uint64_t sub_1CCD47540()
{
  return MEMORY[0x1E0D03288]();
}

uint64_t sub_1CCD4754C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CCD47558()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CCD47564()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CCD47570()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CCD4757C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CCD47588()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CCD47594()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CCD475A0()
{
  return MEMORY[0x1E0D032B0]();
}

uint64_t sub_1CCD475AC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CCD475B8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CCD475C4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CCD475D0()
{
  return MEMORY[0x1E0DEDF40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

