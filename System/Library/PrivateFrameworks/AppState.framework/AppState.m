uint64_t dispatch thunk of AccountFamily.primaryAccount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AccountFamily.fetchFamilyMemberIDs()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A70BFC;
  return v7(a1, a2);
}

uint64_t sub_222A70BFC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

void type metadata accessor for ASDPurchaseHistoryContext(uint64_t a1)
{
  sub_222A7155C(a1, &qword_2540C75D0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_222A7155C(a1, &qword_2540C8198);
}

uint64_t sub_222A70C74@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_222A70C7C()
{
  sub_222A71270(&qword_255768758, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE494);
  return sub_222AADB2C();
}

uint64_t sub_222A70CBC()
{
  sub_222A71270(&qword_255768758, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE494);
  return sub_222AADB20();
}

uint64_t sub_222A70D00()
{
  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  return sub_222AAD418();
}

id sub_222A70D40()
{
  id *v0;

  return *v0;
}

uint64_t sub_222A70D48()
{
  return sub_222AAD7B4();
}

uint64_t sub_222A70D58()
{
  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  return sub_222AAD454();
}

uint64_t sub_222A70D98()
{
  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  return sub_222AAD430();
}

uint64_t sub_222A70DD8(void *a1)
{
  id v2;

  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  v2 = a1;
  return sub_222AAD424();
}

uint64_t sub_222A70E3C()
{
  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  return sub_222AAD448();
}

uint64_t sub_222A70E90()
{
  return sub_222AAD7B4();
}

uint64_t sub_222A70EA0()
{
  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  return sub_222AAD454();
}

uint64_t sub_222A70EE0()
{
  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  return sub_222AAD430();
}

uint64_t sub_222A70F20(void *a1)
{
  id v2;

  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  v2 = a1;
  return sub_222AAD424();
}

uint64_t sub_222A70F84()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_222AAD97C();

  return v2;
}

uint64_t sub_222A70FB8()
{
  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  return sub_222AAD448();
}

uint64_t sub_222A71008()
{
  sub_222AADB80();
  sub_222AAD790();
  return sub_222AADBB0();
}

_QWORD *sub_222A71064@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_222A71074(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_222A7155C(a1, &qword_2557686E8);
}

void type metadata accessor for ASDError(uint64_t a1)
{
  sub_222A7155C(a1, &qword_2557686F0);
}

uint64_t sub_222A710A8()
{
  sub_222A71270(&qword_255768718, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE6D0);
  return sub_222AADB2C();
}

uint64_t sub_222A710E8()
{
  sub_222A71270(&qword_255768718, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE6D0);
  return sub_222AADB20();
}

uint64_t sub_222A71128()
{
  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  return sub_222AAD418();
}

uint64_t sub_222A71168()
{
  sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
  return sub_222AAD43C();
}

uint64_t sub_222A711C0()
{
  sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
  return sub_222AAD43C();
}

uint64_t sub_222A71218()
{
  return sub_222A71270(&qword_2557686F8, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE3AC);
}

uint64_t sub_222A71244()
{
  return sub_222A71270(&qword_255768700, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE3D8);
}

uint64_t sub_222A71270(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x227677FFC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_222A712B0()
{
  return sub_222A71270(&qword_255768708, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_222AAE4D8);
}

uint64_t sub_222A712DC()
{
  return sub_222A71270(&qword_255768710, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE57C);
}

void type metadata accessor for ASDServerError(uint64_t a1)
{
  sub_222A7155C(a1, &qword_255768798);
}

uint64_t sub_222A7131C()
{
  return sub_222A71270(&qword_255768718, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE6D0);
}

uint64_t sub_222A71348()
{
  return sub_222A71270(&qword_255768720, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE658);
}

uint64_t sub_222A71374()
{
  return sub_222A71270(&qword_255768728, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE5E8);
}

uint64_t sub_222A713A0()
{
  return sub_222A71270((unint64_t *)&qword_255768730, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_222AAE540);
}

uint64_t sub_222A713CC()
{
  return sub_222A71270(&qword_255768738, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_222AAE504);
}

unint64_t sub_222A713FC()
{
  unint64_t result;

  result = qword_255768740;
  if (!qword_255768740)
  {
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255768740);
  }
  return result;
}

uint64_t sub_222A71440()
{
  return sub_222A71270(&qword_255768748, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE62C);
}

uint64_t sub_222A7146C()
{
  return sub_222A71270(&qword_255768750, (uint64_t (*)(uint64_t))type metadata accessor for ASDServerError, (uint64_t)&unk_222AAE68C);
}

uint64_t sub_222A71498()
{
  return sub_222A71270(&qword_255768758, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE494);
}

uint64_t sub_222A714C4()
{
  return sub_222A71270(&qword_255768760, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE460);
}

uint64_t sub_222A714F0()
{
  return sub_222A71270(&qword_255768768, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE41C);
}

uint64_t sub_222A7151C()
{
  return sub_222A71270(&qword_255768770, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_222AAE7BC);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_222A7155C(a1, &qword_255768790);
}

void sub_222A7155C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_222A715A0()
{
  return sub_222A71270(&qword_255768778, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_222AAE780);
}

uint64_t sub_222A715CC()
{
  return sub_222A71270(&qword_255768780, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_222AAE7F8);
}

uint64_t sub_222A715F8()
{
  return sub_222A71270((unint64_t *)&qword_255768788, (uint64_t (*)(uint64_t))type metadata accessor for ASDError, (uint64_t)&unk_222AAE714);
}

BOOL sub_222A71624(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t AdamID.Error.errorDescription.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_222A71678()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_222A716BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t *v12;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14;
  uint64_t v15[3];
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v6 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v6);
  if (a1 < 0)
  {
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_222AADA00();
    swift_bridgeObjectRelease();
    v17 = 0xD00000000000001DLL;
    v18 = 0x8000000222AB0610;
    v15[0] = a1;
    sub_222AADACC();
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    v9 = v17;
    v10 = v18;
    sub_222A71A40();
    v11 = (void *)swift_allocError();
    *v12 = v9;
    v12[1] = v10;
    swift_willThrow();
    sub_222A723C0(a2, (uint64_t)&v17);
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
    sub_222AAD5B0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
    sub_222AAD58C();
    sub_222AAD580();
    v16 = MEMORY[0x24BEE4008];
    v15[0] = a1;
    sub_222AAD55C();
    sub_222A72468((uint64_t)v15);
    sub_222AAD580();
    swift_getErrorValue();
    v16 = v14;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v15);
    (*(void (**)(uint64_t *))(*(_QWORD *)(v14 - 8) + 16))(boxed_opaque_existential_0);
    sub_222AAD55C();
    sub_222A72468((uint64_t)v15);
    sub_222AAD580();
    sub_222AAD5A4();
    sub_222AAD6A0();
    swift_bridgeObjectRelease();

    sub_222A7239C(a2);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
    v8 = 0;
  }
  else
  {
    result = sub_222A7239C(a2);
    v8 = a1;
  }
  *(_QWORD *)a3 = v8;
  *(_BYTE *)(a3 + 8) = a1 < 0;
  return result;
}

uint64_t AdamID.init(value:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;

  if (result < 0)
  {
    sub_222AADA00();
    swift_bridgeObjectRelease();
    sub_222AADACC();
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    sub_222A71A40();
    swift_allocError();
    *v2 = 0xD00000000000001DLL;
    v2[1] = 0x8000000222AB0610;
    return swift_willThrow();
  }
  else
  {
    *a2 = result;
  }
  return result;
}

unint64_t sub_222A71A40()
{
  unint64_t result;

  result = qword_2557687A0;
  if (!qword_2557687A0)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AdamID.Error, &type metadata for AdamID.Error);
    atomic_store(result, (unint64_t *)&qword_2557687A0);
  }
  return result;
}

void AdamID.init(value:)(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4;
  _QWORD *v5;

  v4 = (unint64_t)objc_msgSend(a1, sel_longLongValue);
  if ((v4 & 0x8000000000000000) != 0)
  {
    sub_222AADA00();
    swift_bridgeObjectRelease();
    sub_222AADACC();
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    sub_222A71A40();
    swift_allocError();
    *v5 = 0xD00000000000001DLL;
    v5[1] = 0x8000000222AB0610;
    swift_willThrow();

  }
  else
  {

    *a2 = v4;
  }
}

uint64_t AdamID.init(value:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned __int8 *v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = HIBYTE(a2) & 0xF;
  v6 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v7 = v5;
  else
    v7 = result & 0xFFFFFFFFFFFFLL;
  if (!v7)
    goto LABEL_57;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v24 = sub_222A7210C(result, a2, 10);
    if ((v25 & 1) == 0)
    {
      v11 = (uint64_t)v24;
      goto LABEL_36;
    }
    goto LABEL_57;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v8 = (unsigned __int8 *)sub_222AADA24();
    v9 = sub_222A72504(v8, v6, 10);
    if ((v10 & 1) == 0)
    {
      v11 = (uint64_t)v9;
LABEL_36:
      result = swift_bridgeObjectRelease();
      if ((v11 & 0x8000000000000000) == 0)
      {
        *a3 = v11;
        return result;
      }
      v29 = 0;
      v30 = 0xE000000000000000;
      sub_222AADA00();
      swift_bridgeObjectRelease();
      v29 = 0xD00000000000001DLL;
      v30 = 0x8000000222AB0610;
      v31 = v11;
      sub_222AADACC();
      sub_222AAD7D8();
      goto LABEL_58;
    }
LABEL_57:
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_222AADA00();
    swift_bridgeObjectRelease();
    v29 = 0xD000000000000020;
    v30 = 0x8000000222AB0630;
    sub_222AAD7D8();
LABEL_58:
    swift_bridgeObjectRelease();
    v27 = v29;
    v26 = v30;
    sub_222A71A40();
    swift_allocError();
    *v28 = v27;
    v28[1] = v26;
    return swift_willThrow();
  }
  v29 = result;
  v30 = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v5)
      goto LABEL_62;
    if (v5 == 1)
      goto LABEL_60;
    if ((BYTE1(result) - 48) <= 9u)
    {
      v11 = (BYTE1(result) - 48);
      if (v5 == 2)
        goto LABEL_34;
      if ((BYTE2(result) - 48) <= 9u)
      {
        v11 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
        v12 = v5 - 3;
        if (v5 != 3)
        {
          v13 = (unsigned __int8 *)&v29 + 3;
          while (1)
          {
            v14 = *v13 - 48;
            if (v14 > 9)
              goto LABEL_32;
            v15 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
              goto LABEL_32;
            v11 = v15 + v14;
            if (__OFADD__(v15, v14))
              goto LABEL_32;
            LOBYTE(v5) = 0;
            ++v13;
            if (!--v12)
              goto LABEL_35;
          }
        }
        goto LABEL_34;
      }
    }
LABEL_32:
    v11 = 0;
    LOBYTE(v5) = 1;
    goto LABEL_35;
  }
  if (result != 45)
  {
    if (!v5 || (result - 48) > 9u)
      goto LABEL_32;
    v11 = (result - 48);
    if (v5 == 1)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      goto LABEL_35;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      v11 = 10 * (result - 48) + (BYTE1(result) - 48);
      v16 = v5 - 2;
      if (v5 != 2)
      {
        v17 = (unsigned __int8 *)&v29 + 2;
        while (1)
        {
          v18 = *v17 - 48;
          if (v18 > 9)
            goto LABEL_32;
          v19 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
            goto LABEL_32;
          v11 = v19 + v18;
          if (__OFADD__(v19, v18))
            goto LABEL_32;
          LOBYTE(v5) = 0;
          ++v17;
          if (!--v16)
            goto LABEL_35;
        }
      }
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v5)
  {
    if (v5 != 1)
    {
      if ((BYTE1(result) - 48) > 9u)
        goto LABEL_32;
      if (v5 == 2)
      {
        LOBYTE(v5) = 0;
        v11 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_35;
      }
      if ((BYTE2(result) - 48) > 9u)
        goto LABEL_32;
      v11 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
      v20 = v5 - 3;
      if (v5 != 3)
      {
        v21 = (unsigned __int8 *)&v29 + 3;
        while (1)
        {
          v22 = *v21 - 48;
          if (v22 > 9)
            goto LABEL_32;
          v23 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
            goto LABEL_32;
          v11 = v23 - v22;
          if (__OFSUB__(v23, v22))
            goto LABEL_32;
          LOBYTE(v5) = 0;
          ++v21;
          if (!--v20)
            goto LABEL_35;
        }
      }
      goto LABEL_34;
    }
LABEL_60:
    v11 = 0;
LABEL_35:
    if ((v5 & 1) == 0)
      goto LABEL_36;
    goto LABEL_57;
  }
  __break(1u);
LABEL_62:
  __break(1u);
  return result;
}

uint64_t AdamID.int64Value.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

id AdamID.numberValue.getter()
{
  _QWORD *v0;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithLongLong_, *v0);
}

uint64_t AdamID.stringValue.getter()
{
  return sub_222AADACC();
}

uint64_t AdamID.hash(into:)()
{
  return sub_222AADBA4();
}

BOOL static AdamID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t AdamID.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADBA4();
  return sub_222AADBB0();
}

uint64_t sub_222A7204C()
{
  sub_222AADB80();
  sub_222AADBA4();
  return sub_222AADBB0();
}

uint64_t sub_222A72090()
{
  return sub_222AADBA4();
}

uint64_t sub_222A720B8()
{
  sub_222AADB80();
  sub_222AADBA4();
  return sub_222AADBB0();
}

unsigned __int8 *sub_222A720F8(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_222A72504(a1, a2, a3);
}

unsigned __int8 *sub_222A7210C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  swift_bridgeObjectRetain();
  v5 = sub_222AAD82C();
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
  v5 = sub_222A72780();
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
    v7 = (unsigned __int8 *)sub_222AADA24();
  }
LABEL_7:
  v11 = sub_222A72504(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_222A721F8()
{
  unint64_t result;

  result = qword_2540C80C0;
  if (!qword_2540C80C0)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AdamID, &type metadata for AdamID);
    atomic_store(result, (unint64_t *)&qword_2540C80C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AdamID()
{
  return &type metadata for AdamID;
}

_QWORD *initializeBufferWithCopyOfBuffer for AdamID.Error(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AdamID.Error()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AdamID.Error(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AdamID.Error(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AdamID.Error(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AdamID.Error(uint64_t result, int a2, int a3)
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

uint64_t sub_222A72380()
{
  return 0;
}

ValueMetadata *type metadata accessor for AdamID.Error()
{
  return &type metadata for AdamID.Error;
}

uint64_t sub_222A7239C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t sub_222A723C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227677FE4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_222A72468(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C8268);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unsigned __int8 *sub_222A72504(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_222A72780()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_222AAD838();
  v4 = sub_222A727FC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_222A727FC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_222A72940(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_222A72A2C(v9, 0);
      v12 = sub_222A72A90((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
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
    v13 = MEMORY[0x227677804](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x227677804);
LABEL_9:
      sub_222AADA24();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x227677804]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_222A72940(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_222A72CA0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_222A72CA0(a2, a3, a4);
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
    return sub_222AAD7FC();
  }
  __break(1u);
  return result;
}

_QWORD *sub_222A72A2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557687A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_222A72A90(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_222A72CA0(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_222AAD808();
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
          result = sub_222AADA24();
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
    result = sub_222A72CA0(v12, a6, a7);
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
    v12 = sub_222AAD7E4();
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

uint64_t sub_222A72CA0(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_222AAD814();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x227677834](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AdamID.Context(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for AdamID.Context(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AdamID.Context(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for AdamID.Context(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdamID.Context(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdamID.Context(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdamID.Context()
{
  return &type metadata for AdamID.Context;
}

uint64_t AMSAccountFamily.__allocating_init(primaryAccount:bag:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v11[40];

  v4 = sub_222AAD658();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_222A723C0(a1, (uint64_t)v11);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  swift_allocObject();
  v8 = sub_222A73DEC((uint64_t)v11, (uint64_t)v7, (uint64_t)sub_222A730E0, 0);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

id sub_222A730E0(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE08198]), sel_initWithAccount_bag_, v1, sub_222AAD634());

  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_222A73148(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_222AAD52C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  v8 = *MEMORY[0x24BE5C3B8];
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((_DWORD)a1 == v8)
  {
    v10 = *(_QWORD *)(a2 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 24));
    swift_bridgeObjectRelease();
    *(_QWORD *)(v10 + 16) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
    return swift_release();
  }
  return result;
}

uint64_t (*sub_222A7323C())(uint64_t a1)
{
  swift_retain();
  return sub_222A741C4;
}

uint64_t AMSAccountFamily.primaryAccount.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222A723C0(v1 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount, a1);
}

uint64_t AMSAccountFamily.fetchFamilyMemberIDs()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  v1[4] = swift_task_alloc();
  v2 = sub_222AAD6D0();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A73304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t (*v10)(void *, uint64_t);
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount), *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount + 24));
  sub_222AAD5EC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_222A73FA8(*(_QWORD *)(v0 + 32));
    v4 = MEMORY[0x24BEE4AF8];
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
  }
  v5 = *(_QWORD *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 32))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  v6 = OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache;
  *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache;
  v7 = *(_QWORD *)(v5 + v6);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  v4 = *(_QWORD *)(v7 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  swift_release();
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    goto LABEL_5;
  }
  v9 = *(_QWORD *)(v0 + 24);
  v10 = *(uint64_t (**)(void *, uint64_t))(v9 + 16);
  v11 = (void *)sub_222AAD6B8();
  v12 = (void *)v10(v11, v9 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag);

  v13 = objc_msgSend(v12, sel_performFamilyInfoLookup);
  *(_QWORD *)(v0 + 72) = v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557687C8);
  v14 = v13;
  *(_QWORD *)(v0 + 80) = sub_222AAD70C();
  sub_222A73FE8();
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v15;
  *v15 = v0;
  v15[1] = sub_222A734F4;
  return sub_222AAD670();
}

uint64_t sub_222A734F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  swift_release();
  if (!v0)
    *(_QWORD *)(v2 + 104) = *(_QWORD *)(v2 + 16);
  return swift_task_switch();
}

void sub_222A73568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = objc_msgSend(*(id *)(v0 + 104), sel_familyMembers);
  sub_222A7418C(0, &qword_2557687D8);
  v6 = sub_222AAD850();

  v7 = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v3;
  v8 = sub_222A73910(sub_222A74078, v7, v6);
  swift_task_dealloc();
  v9 = sub_222A73AB4(v8);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v4 + v2);
  v11 = swift_task_alloc();
  *(_QWORD *)(v11 + 16) = v9;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 24));
  v12 = *(_QWORD *)(v11 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v10 + 16) = v12;
  swift_bridgeObjectRetain();
  if (v1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
  }
  else
  {
    v13 = *(void **)(v0 + 104);
    v14 = *(void **)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 48);
    v15 = *(_QWORD *)(v0 + 56);
    v17 = *(_QWORD *)(v0 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
    swift_release();

    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(char *))(v0 + 8))(v9);
  }
}

uint64_t sub_222A73708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A7376C(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unsigned int v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  void *v16;

  v4 = sub_222AAD6D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v9 = objc_msgSend(v8, sel_isSharingPurchases);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  if (v9)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v10 = 1;
  }
  else
  {
    v11 = objc_msgSend(v8, sel_iTunesDSID);
    swift_getKeyPath();
    sub_222AAD6C4();
    swift_release();
    v12 = v16;
    if (v11)
    {
      if (v16)
      {
        sub_222A7418C(0, (unint64_t *)&qword_2540C81B8);
        v13 = v11;
        v10 = sub_222AAD964();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

        v11 = v12;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        v10 = 0;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if (!v12)
      {
        v10 = 1;
        return v10 & 1;
      }
      v10 = 0;
      v11 = v12;
    }

  }
  return v10 & 1;
}

uint64_t sub_222A73910(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x227677A50](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_222AADA3C();
          sub_222AADA60();
          v4 = v15;
          sub_222AADA6C();
          sub_222AADA48();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_222AADA84();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

char *sub_222A73AB4(unint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;

  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v2 = sub_222AADA84();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = (char *)MEMORY[0x24BEE4AF8];
      v4 = 4;
      while (1)
      {
        v5 = v4 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (id)MEMORY[0x227677A50](v4 - 4, a1);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_17;
        }
        else
        {
          v6 = *(id *)(a1 + 8 * v4);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        v8 = v6;
        v9 = objc_msgSend(v8, sel_iTunesDSID);
        if (v9)
        {
          v10 = v9;
          v11 = objc_msgSend(v9, sel_longLongValue);

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v3 = sub_222AA4C64(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
          v13 = *((_QWORD *)v3 + 2);
          v12 = *((_QWORD *)v3 + 3);
          if (v13 >= v12 >> 1)
            v3 = sub_222AA4C64((char *)(v12 > 1), v13 + 1, 1, v3);
          *((_QWORD *)v3 + 2) = v13 + 1;
          *(_QWORD *)&v3[8 * v13 + 32] = v11;
        }
        else
        {

        }
        ++v4;
        if (v7 == v2)
          goto LABEL_20;
      }
    }
  }
  v3 = (char *)MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t AMSAccountFamily.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  v2 = sub_222AAD658();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  return v0;
}

uint64_t AMSAccountFamily.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  v2 = sub_222AAD658();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  return swift_deallocClassInstance();
}

uint64_t sub_222A73D38@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_222A723C0(*v1 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount, a1);
}

uint64_t sub_222A73D50()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A73D98;
  return AMSAccountFamily.fetchFamilyMemberIDs()();
}

uint64_t sub_222A73D98(uint64_t a1)
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

uint64_t sub_222A73DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[40];

  v17 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7550);
  v18 = *(_QWORD *)(v9 - 8);
  v19 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A723C0(a1, v4 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  v12 = v4 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  v13 = sub_222AAD658();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, a2, v13);
  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557688B0);
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache) = v15;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount), *(_QWORD *)(v4 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount + 24));
  swift_retain();
  sub_222AAD5F8();
  swift_getObjectType();
  sub_222A94B20();
  sub_222AAD5C8();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a2, v13);
  __swift_destroy_boxed_opaque_existential_1(v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v19);
  return v4;
}

uint64_t sub_222A73FA8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_222A73FE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557687D0;
  if (!qword_2557687D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557687C8);
    result = MEMORY[0x227677FFC](MEMORY[0x24BE5E280], v1);
    atomic_store(result, (unint64_t *)&qword_2557687D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227677FF0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_222A74078(void **a1)
{
  uint64_t v1;

  return sub_222A7376C(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_222A74094()
{
  return type metadata accessor for AMSAccountFamily();
}

uint64_t type metadata accessor for AMSAccountFamily()
{
  uint64_t result;

  result = qword_255768810;
  if (!qword_255768810)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_222A740D8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_222AAD658();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AMSAccountFamily()
{
  return swift_lookUpClassMethod();
}

char *keypath_get_selector_ams_DSID()
{
  return sel_ams_DSID;
}

uint64_t sub_222A7418C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_222A741C4(uint64_t a1)
{
  uint64_t v1;

  return sub_222A73148(a1, v1);
}

void sub_222A741CC()
{
  qword_2540C8E18 = (uint64_t)&unk_24E974398;
}

void *static App.Kind.allCases.getter()
{
  return &unk_24E9743C0;
}

BOOL static App.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t App.Kind.hash(into:)()
{
  return sub_222AADB8C();
}

uint64_t App.Kind.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

BOOL sub_222A74270(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_222A74288()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

uint64_t sub_222A742CC()
{
  return sub_222AADB8C();
}

uint64_t sub_222A742F4()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

void sub_222A74334(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E9743E8;
}

void App.id.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void App.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t App.isBeta.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

_QWORD *App.init(id:kind:)@<X0>(_QWORD *result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = *a2;
  *(_QWORD *)a3 = *result;
  *(_BYTE *)(a3 + 8) = v3;
  return result;
}

char *App.withKind(_:)@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  char v3;

  v3 = *result;
  *(_QWORD *)a2 = *v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t App.hash(into:)()
{
  sub_222AADBA4();
  return sub_222AADB8C();
}

uint64_t static App.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    return (*(unsigned __int8 *)(a2 + 8) ^ *(unsigned __int8 *)(a1 + 8) ^ 1) & 1;
  else
    return 0;
}

uint64_t App.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  return sub_222AADBB0();
}

uint64_t sub_222A74454()
{
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  return sub_222AADBB0();
}

uint64_t sub_222A744B0()
{
  sub_222AADBA4();
  return sub_222AADB8C();
}

uint64_t sub_222A744EC()
{
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  return sub_222AADBB0();
}

unint64_t sub_222A74548()
{
  unint64_t result;

  result = qword_2540C7BD8;
  if (!qword_2540C7BD8)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for App.Kind, &type metadata for App.Kind);
    atomic_store(result, (unint64_t *)&qword_2540C7BD8);
  }
  return result;
}

unint64_t sub_222A74590()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557688B8;
  if (!qword_2557688B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557688C0);
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2557688B8);
  }
  return result;
}

unint64_t sub_222A745E0()
{
  unint64_t result;

  result = qword_2540C7BF0;
  if (!qword_2540C7BF0)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for App, &type metadata for App);
    atomic_store(result, (unint64_t *)&qword_2540C7BF0);
  }
  return result;
}

uint64_t sub_222A74624(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    return (*(unsigned __int8 *)(a2 + 8) ^ *(unsigned __int8 *)(a1 + 8) ^ 1) & 1;
  else
    return 0;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for App(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for App(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for App()
{
  return &type metadata for App;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for App.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for App.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A747EC + 4 * byte_222AAEA3D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_222A74820 + 4 * byte_222AAEA38[v4]))();
}

uint64_t sub_222A74820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A74828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A74830);
  return result;
}

uint64_t sub_222A7483C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A74844);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_222A74848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A74850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A7485C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_222A74864(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for App.Kind()
{
  return &type metadata for App.Kind;
}

uint64_t AppInstallation.Progress.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_222AAD4B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

double AppInstallation.Progress.fractionCompleted.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 20));
}

uint64_t type metadata accessor for AppInstallation.Progress(uint64_t a1)
{
  return sub_222A75D8C(a1, qword_2540C7CA8);
}

id AppInstallation.Progress.progress.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));
}

uint64_t AppInstallation.Progress.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  sub_222AAD4A8();
  objc_msgSend(a1, sel_fractionCompleted);
  v5 = v4;
  result = type metadata accessor for AppInstallation.Progress(0);
  *(_QWORD *)(a2 + *(int *)(result + 20)) = v5;
  *(_QWORD *)(a2 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t AppInstallation.Progress.init(fractionCompleted:progress:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t result;

  sub_222AAD4A8();
  result = type metadata accessor for AppInstallation.Progress(0);
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  *(_QWORD *)(a2 + *(int *)(result + 24)) = a1;
  return result;
}

BOOL static AppInstallation.Progress.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppInstallation.Progress(0);
  return *(double *)(a1 + *(int *)(v4 + 20)) == *(double *)(a2 + *(int *)(v4 + 20));
}

void AppInstallation.Progress.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  v1 = type metadata accessor for AppInstallation.Progress(0);
  sub_222AADBA4();
  v2 = *(id *)(v0 + *(int *)(v1 + 24));
  sub_222AAD970();

}

uint64_t AppInstallation.Progress.hashValue.getter()
{
  sub_222AADB80();
  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  type metadata accessor for AppInstallation.Progress(0);
  sub_222AADBA4();
  sub_222AAD970();
  return sub_222AADBB0();
}

uint64_t sub_222A74B48()
{
  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  sub_222AADBA4();
  return sub_222AAD970();
}

uint64_t sub_222A74BDC()
{
  sub_222AADB80();
  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  sub_222AADBA4();
  sub_222AAD970();
  return sub_222AADBB0();
}

BOOL sub_222A74C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + *(int *)(a3 + 20)) == *(double *)(a2 + *(int *)(a3 + 20));
}

void sub_222A74C94(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v21;
  char *v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t v25;

  v25 = a2;
  v4 = type metadata accessor for AppInstallation.Progress(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v23[3] = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v23[4] = (char *)v23 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v23[5] = (char *)v23 - v9;
  v10 = type metadata accessor for AppInstallation.Phase(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v23[2] = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v23[1] = (char *)v23 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C76B0);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v23 + *(int *)(v19 + 48) - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v2;
  sub_222A75DC0(v2, (uint64_t)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0(a1, (uint64_t)v21, type metadata accessor for AppInstallation.Phase);
  v22 = (char *)sub_222A74E98 + 4 * byte_222AAEB70[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_222A74E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_222A75DC0(v0, v1, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
    sub_222A75DC0(*(_QWORD *)(v3 - 96), *(_QWORD *)(v3 - 88), type metadata accessor for AppInstallation.Phase);
    return sub_222A75A30(v0);
  }
  else
  {
    v5 = v1;
    v6 = *(_QWORD *)(v3 - 104);
    sub_222A759B0(v5, v6);
    v7 = *(_QWORD *)(v3 - 112);
    sub_222A759B0(v2, v7);
    v8 = *(_QWORD *)(v3 - 120);
    sub_222A75DC0(v6, v8, type metadata accessor for AppInstallation.Progress);
    v9 = sub_222AAD4B4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v8, v7, v9);
    sub_222A759B0(v8, *(_QWORD *)(v3 - 88));
    sub_222A759F4(v7, type metadata accessor for AppInstallation.Progress);
    sub_222A759F4(v6, type metadata accessor for AppInstallation.Progress);
    swift_storeEnumTagMultiPayload();
    return sub_222A759F4(v0, type metadata accessor for AppInstallation.Phase);
  }
}

void AppInstallation.Phase.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;

  type metadata accessor for AppInstallation.Progress(0);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for AppInstallation.Phase(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  sub_222A75DC0(v0, (uint64_t)&v8 - v5, v6);
  v7 = (char *)sub_222A75368 + 4 * byte_222AAEB75[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_222A75368()
{
  uint64_t v0;
  uint64_t v1;

  sub_222A759B0(v1, v0);
  sub_222AADB8C();
  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  sub_222AADBA4();
  sub_222AAD970();
  return sub_222A759F4(v0, type metadata accessor for AppInstallation.Progress);
}

void sub_222A7557C()
{
  sub_222AADAE4();
  __break(1u);
}

uint64_t type metadata accessor for AppInstallation.Phase(uint64_t a1)
{
  return sub_222A75D8C(a1, qword_2540C7C00);
}

void static AppInstallation.Phase.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  _QWORD v17[2];

  v4 = type metadata accessor for AppInstallation.Phase(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v17[1] = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v17[0] = (char *)v17 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v11 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C76B0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v17 + *(int *)(v13 + 48) - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(a1, (uint64_t)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0(a2, (uint64_t)v15, type metadata accessor for AppInstallation.Phase);
  v16 = (char *)sub_222A7571C + 4 * byte_222AAEB7A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_222A7571C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  sub_222A75DC0(v0, v2, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_222A759F4(v2, type metadata accessor for AppInstallation.Progress);
    sub_222A75A30(v0);
    return 0;
  }
  else
  {
    v4 = type metadata accessor for AppInstallation.Progress(0);
    v3 = *(double *)(v2 + *(int *)(v4 + 20)) == *(double *)(v1 + *(int *)(v4 + 20));
    sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
    sub_222A759F4(v2, type metadata accessor for AppInstallation.Progress);
    sub_222A759F4(v0, type metadata accessor for AppInstallation.Phase);
  }
  return v3;
}

uint64_t AppInstallation.Phase.hashValue.getter()
{
  return sub_222A7657C((void (*)(_BYTE *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_222A759A0(uint64_t a1, uint64_t a2)
{
  return sub_222A765C8(a1, a2, (void (*)(_BYTE *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_222A759B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppInstallation.Progress(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A759F4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_222A75A30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C76B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_222A75A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_222A76618(a1, a2, a3, (void (*)(_BYTE *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_222A75A80()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_222A75AA4()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  sub_222AADB80();
  v2 = objc_msgSend(*(id *)(v1 + 16), sel_bundleID);
  sub_222AAD7B4();

  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t sub_222A75B28()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 16), sel_bundleID);
  sub_222AAD7B4();

  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222A75B90()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  sub_222AADB80();
  v2 = objc_msgSend(*(id *)(v1 + 16), sel_bundleID);
  sub_222AAD7B4();

  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

BOOL sub_222A75C10(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  id v3;

  v2 = *a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), sel_storeItemID);
  return v3 == objc_msgSend(*(id *)(v2 + 16), sel_storeItemID);
}

uint64_t AppInstallation.init(phase:progress:hasPostProcessingPhase:essentialBackgroundAssetDownloadEstimate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t result;

  v10 = (int *)type metadata accessor for AppInstallation(0);
  sub_222A75DC0(a1, (uint64_t)a5 + v10[5], type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0(a2, (uint64_t)a5 + v10[6], type metadata accessor for AppInstallation.Progress);
  *((_BYTE *)a5 + v10[7]) = a3;
  *(uint64_t *)((char *)a5 + v10[8]) = a4;
  *((_BYTE *)a5 + v10[9]) = 0;
  *(uint64_t *)((char *)a5 + v10[10]) = 0;
  v11 = objc_allocWithZone(MEMORY[0x24BE044E0]);
  v12 = (void *)sub_222AAD7A8();
  v13 = objc_msgSend(v11, sel_initWithBundleID_, v12);

  sub_222A759F4(a2, type metadata accessor for AppInstallation.Progress);
  sub_222A759F4(a1, type metadata accessor for AppInstallation.Phase);
  type metadata accessor for AppInstallation.ASDAppStore();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v13;
  *a5 = result;
  return result;
}

uint64_t type metadata accessor for AppInstallation(uint64_t a1)
{
  return sub_222A75D8C(a1, qword_2540C7D40);
}

uint64_t sub_222A75D8C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_222A75DC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for AppInstallation.ASDAppStore()
{
  return objc_opt_self();
}

uint64_t AppInstallation.phase.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AppInstallation(0);
  return sub_222A75DC0(v1 + *(int *)(v3 + 20), a1, type metadata accessor for AppInstallation.Phase);
}

uint64_t AppInstallation.progress.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AppInstallation(0);
  return sub_222A75DC0(v1 + *(int *)(v3 + 24), a1, type metadata accessor for AppInstallation.Progress);
}

uint64_t AppInstallation.hasPostProcessingPhase.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 28));
}

uint64_t AppInstallation.essentialBackgroundAssetDownloadEstimate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 32));
}

uint64_t AppInstallation.isExternalUpdateAvailable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 36));
}

uint64_t AppInstallation.externalVersionId.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 40));
}

id AppInstallation.pausedProgress.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v1 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AppInstallation.Phase(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  v10 = type metadata accessor for AppInstallation(0);
  sub_222A75DC0(v0 + *(int *)(v10 + 20), (uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    sub_222A759F4((uint64_t)v9, type metadata accessor for AppInstallation.Phase);
    return 0;
  }
  v11 = swift_projectBox();
  sub_222A75DC0(v11, (uint64_t)v7, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    sub_222A759F4((uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    swift_release();
    return 0;
  }
  sub_222A759B0((uint64_t)v7, (uint64_t)v3);
  v12 = *(id *)&v3[*(int *)(v1 + 24)];
  sub_222A759F4((uint64_t)v3, type metadata accessor for AppInstallation.Progress);
  swift_release();
  return v12;
}

uint64_t AppInstallation.isPaused.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v1 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AppInstallation.Phase(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  v10 = type metadata accessor for AppInstallation(0);
  sub_222A75DC0(v0 + *(int *)(v10 + 20), (uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v11 = swift_projectBox();
    sub_222A75DC0(v11, (uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    if (swift_getEnumCaseMultiPayload() < 3)
    {
      sub_222A759B0((uint64_t)v7, (uint64_t)v3);
      v12 = *(id *)&v3[*(int *)(v1 + 24)];
      sub_222A759F4((uint64_t)v3, type metadata accessor for AppInstallation.Progress);

      swift_release();
      return 1;
    }
    sub_222A759F4((uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    swift_release();
  }
  else
  {
    sub_222A759F4((uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  }
  return 0;
}

uint64_t AppInstallation.init(_app:phase:overallProgress:isExternalUpdateAvailable:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int *v17;
  id v18;
  id v19;
  uint64_t v21;

  v10 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AppInstallation.Phase(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(a2, (uint64_t)v15, type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0(a3, (uint64_t)v12, type metadata accessor for AppInstallation.Progress);
  type metadata accessor for AppInstallation.ASDAppStore();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *a5 = v16;
  v17 = (int *)type metadata accessor for AppInstallation(0);
  sub_222A75DC0((uint64_t)v15, (uint64_t)a5 + v17[5], type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0((uint64_t)v12, (uint64_t)a5 + v17[6], type metadata accessor for AppInstallation.Progress);
  v18 = a1;
  *((_BYTE *)a5 + v17[7]) = objc_msgSend(v18, sel_hasPostProcessing);
  *(uint64_t *)((char *)a5 + v17[8]) = (uint64_t)objc_msgSend(v18, sel_essentialBackgroundAssetDownloadEstimate);
  *((_BYTE *)a5 + v17[9]) = a4;
  v19 = objc_msgSend(v18, sel_storeExternalVersionID);

  sub_222A759F4((uint64_t)v12, type metadata accessor for AppInstallation.Progress);
  sub_222A759F4((uint64_t)v15, type metadata accessor for AppInstallation.Phase);
  *(uint64_t *)((char *)a5 + v17[10]) = (uint64_t)v19;
  sub_222A759F4(a3, type metadata accessor for AppInstallation.Progress);
  return sub_222A759F4(a2, type metadata accessor for AppInstallation.Phase);
}

id AppInstallation.app.getter()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 16);
}

uint64_t AppInstallation.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)v0 + 16);
  swift_retain();
  v2 = objc_msgSend(v1, sel_bundleID);
  sub_222AAD7B4();

  sub_222AAD7CC();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for AppInstallation(0);
  AppInstallation.Phase.hash(into:)();
  sub_222AAD4B4();
  sub_222A71270(&qword_2557688C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_222AAD790();
  type metadata accessor for AppInstallation.Progress(0);
  sub_222AADBA4();
  sub_222AAD970();
  sub_222AADB98();
  sub_222AADBA4();
  sub_222AADB98();
  return sub_222AADBA4();
}

uint64_t AppInstallation.hashValue.getter()
{
  return sub_222A7657C((void (*)(_BYTE *))AppInstallation.hash(into:));
}

uint64_t sub_222A7657C(void (*a1)(_BYTE *))
{
  _BYTE v3[72];

  sub_222AADB80();
  a1(v3);
  return sub_222AADBB0();
}

uint64_t sub_222A765BC(uint64_t a1, uint64_t a2)
{
  return sub_222A765C8(a1, a2, (void (*)(_BYTE *))AppInstallation.hash(into:));
}

uint64_t sub_222A765C8(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *))
{
  _BYTE v5[72];

  sub_222AADB80();
  a3(v5);
  return sub_222AADBB0();
}

uint64_t sub_222A7660C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_222A76618(a1, a2, a3, (void (*)(_BYTE *))AppInstallation.hash(into:));
}

uint64_t sub_222A76618(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v6[72];

  sub_222AADB80();
  a4(v6);
  return sub_222AADBB0();
}

BOOL _s8AppState0A12InstallationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  id v5;
  int *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v4 = *a2;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), sel_storeItemID);
  if (v5 == objc_msgSend(*(id *)(v4 + 16), sel_storeItemID)
    && (v6 = (int *)type metadata accessor for AppInstallation(0),
        static AppInstallation.Phase.== infix(_:_:)(a1 + v6[5], (uint64_t)a2 + v6[5]),
        (v7 & 1) != 0)
    && (v8 = v6[6],
        v9 = a1 + v8,
        v10 = (char *)a2 + v8,
        v11 = type metadata accessor for AppInstallation.Progress(0),
        *(double *)(v9 + *(int *)(v11 + 20)) == *(double *)&v10[*(int *)(v11 + 20)])
    && *(unsigned __int8 *)(a1 + v6[7]) == *((unsigned __int8 *)a2 + v6[7])
    && *(_QWORD *)(a1 + v6[8]) == *(uint64_t *)((char *)a2 + v6[8])
    && *(unsigned __int8 *)(a1 + v6[9]) == *((unsigned __int8 *)a2 + v6[9]))
  {
    return *(_QWORD *)(a1 + v6[10]) == *(uint64_t *)((char *)a2 + v6[10]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_222A76758()
{
  return sub_222A71270(&qword_2557688D0, type metadata accessor for AppInstallation.Progress, (uint64_t)&protocol conformance descriptor for AppInstallation.Progress);
}

uint64_t sub_222A76784()
{
  return sub_222A71270(&qword_2557688D8, type metadata accessor for AppInstallation.Phase, (uint64_t)&protocol conformance descriptor for AppInstallation.Phase);
}

uint64_t sub_222A767B0()
{
  return sub_222A71270(&qword_2557688E0, type metadata accessor for AppInstallation, (uint64_t)&protocol conformance descriptor for AppInstallation);
}

_QWORD *initializeBufferWithCopyOfBuffer for AppInstallation(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v12 = sub_222AAD4B4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
        v13 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)((char *)v9 + *(int *)(v13 + 20)) = *(_QWORD *)((char *)v10 + *(int *)(v13 + 20));
        v14 = *(int *)(v13 + 24);
        v15 = *(void **)((char *)v10 + v14);
        *(_QWORD *)((char *)v9 + v14) = v15;
        v16 = v15;
        goto LABEL_7;
      case 3u:
        *v9 = *v10;
        swift_retain();
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        break;
    }
    v17 = a3[6];
    v18 = (char *)v7 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v18[*(int *)(v21 + 20)] = *(_QWORD *)&v19[*(int *)(v21 + 20)];
    v22 = *(int *)(v21 + 24);
    v23 = *(void **)&v19[v22];
    *(_QWORD *)&v18[v22] = v23;
    v24 = a3[8];
    *((_BYTE *)v7 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)v7 + v24) = *(_QWORD *)((char *)a2 + v24);
    v25 = a3[10];
    *((_BYTE *)v7 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *(_QWORD *)((char *)v7 + v25) = *(_QWORD *)((char *)a2 + v25);
    v26 = v23;
  }
  return v7;
}

void destroy for AppInstallation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  type metadata accessor for AppInstallation.Phase(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      v5 = sub_222AAD4B4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

      break;
    case 3u:
      swift_release();
      break;
    default:
      break;
  }
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

}

_QWORD *initializeWithCopy for AppInstallation(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (_QWORD *)((char *)a2 + v6);
  v9 = type metadata accessor for AppInstallation.Phase(0);
  swift_retain();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      v10 = sub_222AAD4B4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)((char *)v7 + *(int *)(v11 + 20)) = *(_QWORD *)((char *)v8 + *(int *)(v11 + 20));
      v12 = *(int *)(v11 + 24);
      v13 = *(void **)((char *)v8 + v12);
      *(_QWORD *)((char *)v7 + v12) = v13;
      v14 = v13;
      goto LABEL_5;
    case 3u:
      *v7 = *v8;
      swift_retain();
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      break;
  }
  v15 = a3[6];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_222AAD4B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v19 = type metadata accessor for AppInstallation.Progress(0);
  *(_QWORD *)&v16[*(int *)(v19 + 20)] = *(_QWORD *)&v17[*(int *)(v19 + 20)];
  v20 = *(int *)(v19 + 24);
  v21 = *(void **)&v17[v20];
  *(_QWORD *)&v16[v20] = v21;
  v22 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v22) = *(_QWORD *)((char *)a2 + v22);
  v23 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v23) = *(_QWORD *)((char *)a2 + v23);
  v24 = v21;
  return a1;
}

_QWORD *assignWithCopy for AppInstallation(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  *a1 = *a2;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_222A759F4((uint64_t)a1 + v6, type metadata accessor for AppInstallation.Phase);
    v9 = type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v10 = sub_222AAD4B4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
        v11 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)((char *)v7 + *(int *)(v11 + 20)) = *(_QWORD *)((char *)v8 + *(int *)(v11 + 20));
        v12 = *(int *)(v11 + 24);
        v13 = *(void **)((char *)v8 + v12);
        *(_QWORD *)((char *)v7 + v12) = v13;
        v14 = v13;
        goto LABEL_6;
      case 3u:
        *v7 = *v8;
        swift_retain();
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        break;
    }
  }
  v15 = a3[6];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_222AAD4B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v19 = type metadata accessor for AppInstallation.Progress(0);
  *(_QWORD *)&v16[*(int *)(v19 + 20)] = *(_QWORD *)&v17[*(int *)(v19 + 20)];
  v20 = *(int *)(v19 + 24);
  v21 = *(void **)&v17[v20];
  v22 = *(void **)&v16[v20];
  *(_QWORD *)&v16[v20] = v21;
  v23 = v21;

  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  return a1;
}

_QWORD *initializeWithTake for AppInstallation(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for AppInstallation.Phase(0);
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    v11 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v7[*(int *)(v11 + 20)] = *(_QWORD *)&v8[*(int *)(v11 + 20)];
    *(_QWORD *)&v7[*(int *)(v11 + 24)] = *(_QWORD *)&v8[*(int *)(v11 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_222AAD4B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = type metadata accessor for AppInstallation.Progress(0);
  *(_QWORD *)&v13[*(int *)(v16 + 20)] = *(_QWORD *)&v14[*(int *)(v16 + 20)];
  *(_QWORD *)&v13[*(int *)(v16 + 24)] = *(_QWORD *)&v14[*(int *)(v16 + 24)];
  v17 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  v18 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  return a1;
}

_QWORD *assignWithTake for AppInstallation(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_222A759F4((uint64_t)a1 + v6, type metadata accessor for AppInstallation.Phase);
    v9 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v10 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      v11 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v7[*(int *)(v11 + 20)] = *(_QWORD *)&v8[*(int *)(v11 + 20)];
      *(_QWORD *)&v7[*(int *)(v11 + 24)] = *(_QWORD *)&v8[*(int *)(v11 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_222AAD4B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = type metadata accessor for AppInstallation.Progress(0);
  *(_QWORD *)&v13[*(int *)(v16 + 20)] = *(_QWORD *)&v14[*(int *)(v16 + 20)];
  v17 = *(int *)(v16 + 24);
  v18 = *(void **)&v13[v17];
  *(_QWORD *)&v13[v17] = *(_QWORD *)&v14[v17];

  v19 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  v20 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_222A773F8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for AppInstallation.Phase(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = type metadata accessor for AppInstallation.Progress(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AppInstallation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_222A774A4(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for AppInstallation.Phase(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for AppInstallation.Progress(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t sub_222A77540()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for AppInstallation.Phase(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AppInstallation.Progress(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppInstallation.Progress(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_222AAD4B4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for AppInstallation.Progress(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_222AAD4B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation.Progress()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_222A77880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_222AAD4B4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallation.Progress()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_222A77908(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_222AAD4B4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_222A77980()
{
  uint64_t result;
  unint64_t v1;

  result = sub_222AAD4B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppInstallation.Phase(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v7 = sub_222AAD4B4();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        v8 = type metadata accessor for AppInstallation.Progress(0);
        *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
        v9 = *(int *)(v8 + 24);
        v10 = *(void **)((char *)a2 + v9);
        *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
        v11 = v10;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for AppInstallation.Phase(uint64_t a1)
{
  uint64_t v2;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      v2 = sub_222AAD4B4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);

      break;
    case 3u:
      swift_release();
      break;
    default:
      return;
  }
}

_QWORD *initializeWithCopy for AppInstallation.Phase(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      v6 = sub_222AAD4B4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)((char *)a1 + *(int *)(v7 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 20));
      v8 = *(int *)(v7 + 24);
      v9 = *(void **)((char *)a2 + v8);
      *(_QWORD *)((char *)a1 + v8) = v9;
      v10 = v9;
      goto LABEL_5;
    case 3u:
      *a1 = *a2;
      swift_retain();
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for AppInstallation.Phase(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a1 != a2)
  {
    sub_222A759F4((uint64_t)a1, type metadata accessor for AppInstallation.Phase);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v6 = sub_222AAD4B4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)((char *)a1 + *(int *)(v7 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v7 + 20));
        v8 = *(int *)(v7 + 24);
        v9 = *(void **)((char *)a2 + v8);
        *(_QWORD *)((char *)a1 + v8) = v9;
        v10 = v9;
        goto LABEL_6;
      case 3u:
        *a1 = *a2;
        swift_retain();
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for AppInstallation.Phase(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&a1[*(int *)(v7 + 20)] = *(_QWORD *)&a2[*(int *)(v7 + 20)];
    *(_QWORD *)&a1[*(int *)(v7 + 24)] = *(_QWORD *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for AppInstallation.Phase(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_222A759F4((uint64_t)a1, type metadata accessor for AppInstallation.Phase);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&a1[*(int *)(v7 + 20)] = *(_QWORD *)&a2[*(int *)(v7 + 20)];
      *(_QWORD *)&a1[*(int *)(v7 + 24)] = *(_QWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation.Phase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AppInstallation.Phase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_222A78280()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_222A78290()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AppInstallation.Progress(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_222A78300()
{
  return sub_222A71270(&qword_2557688E8, (uint64_t (*)(uint64_t))type metadata accessor for AppInstallation.ASDAppStore, (uint64_t)&unk_222AAEDA4);
}

uint64_t AppInstallationType.init(_:)@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t result;
  char v5;

  type metadata accessor for State();
  result = swift_getEnumCaseMultiPayload();
  v5 = 1;
  switch((int)result)
  {
    case 0:
      v5 = *a1;
      break;
    case 2:
      result = sub_222A783C0((uint64_t)a1);
      v5 = 2;
      break;
    case 3:
      result = sub_222A783C0((uint64_t)a1);
      v5 = 3;
      break;
    case 6:
      break;
    default:
      result = sub_222A783C0((uint64_t)a1);
      v5 = 0;
      break;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_222A783C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

AppState::AppInstallationType_optional __swiftcall AppInstallationType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AppState::AppInstallationType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_222AADAB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AppInstallationType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_222A78484 + 4 * byte_222AAEE17[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_222A78484()
{
  return 0x6573616863727570;
}

uint64_t sub_222A7849C()
{
  return 0x657461647075;
}

uint64_t sub_222A784B0()
{
  return 0x6F6C6E776F646572;
}

void sub_222A784CC(char *a1)
{
  sub_222A7ADBC(*a1);
}

unint64_t sub_222A784DC()
{
  unint64_t result;

  result = qword_2557688F0;
  if (!qword_2557688F0)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppInstallationType, &type metadata for AppInstallationType);
    atomic_store(result, (unint64_t *)&qword_2557688F0);
  }
  return result;
}

void sub_222A78520()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_222AADB80();
  __asm { BR              X9 }
}

uint64_t sub_222A7856C()
{
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

void sub_222A785DC()
{
  __asm { BR              X10 }
}

uint64_t sub_222A78618()
{
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

void sub_222A78674()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_222AADB80();
  __asm { BR              X9 }
}

uint64_t sub_222A786BC()
{
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

AppState::AppInstallationType_optional sub_222A7872C(Swift::String *a1)
{
  return AppInstallationType.init(rawValue:)(*a1);
}

uint64_t sub_222A78738()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_222A78768 + 4 * byte_222AAEE27[*v0]))();
}

void sub_222A78768(_QWORD *a1@<X8>)
{
  *a1 = 0x6573616863727570;
  a1[1] = 0xE800000000000000;
}

void sub_222A78784(_QWORD *a1@<X8>)
{
  *a1 = 0x657461647075;
  a1[1] = 0xE600000000000000;
}

void sub_222A7879C(_QWORD *a1@<X8>)
{
  *a1 = 0x6F6C6E776F646572;
  a1[1] = 0xEA00000000006461;
}

uint64_t getEnumTagSinglePayload for AppInstallationType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppInstallationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A78898 + 4 * byte_222AAEE30[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_222A788CC + 4 * byte_222AAEE2B[v4]))();
}

uint64_t sub_222A788CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A788D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A788DCLL);
  return result;
}

uint64_t sub_222A788E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A788F0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_222A788F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A788FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_222A78908(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationType()
{
  return &type metadata for AppInstallationType;
}

void __swiftcall AppOffer.init(flags:ageRating:baseBuyParams:metricsBuyParams:)(AppState::AppOffer *__return_ptr retstr, AppState::AppOffer::Flags flags, Swift::Int_optional ageRating, Swift::String baseBuyParams, Swift::String metricsBuyParams)
{
  retstr->flags.rawValue = *(_QWORD *)flags.rawValue;
  retstr->ageRating.value = ageRating.value;
  retstr->ageRating.is_nil = ageRating.is_nil;
  retstr->baseBuyParams = baseBuyParams;
  retstr->metricsBuyParams = metricsBuyParams;
}

void static AppOffer.standard.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0xE000000000000000;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
}

uint64_t AppOffer.Flags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

AppState::AppOffer::Flags __swiftcall AppOffer.Flags.init(rawValue:)(AppState::AppOffer::Flags rawValue)
{
  AppState::AppOffer::Flags *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static AppOffer.Flags.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static AppOffer.Flags.dsidLess.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static AppOffer.Flags.disabled.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static AppOffer.Flags.arcadeApp.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static AppOffer.Flags.preorder.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

_QWORD *sub_222A789A0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_222A789AC()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

uint64_t sub_222A789F0()
{
  return sub_222AADB8C();
}

uint64_t sub_222A78A18()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

void sub_222A78A58(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_222A78A60@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_222A78A74@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_222A78A88@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_222A78A9C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_222A78ACC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_222A78AF8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_222A78B1C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_222A78B30(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_222A78B44(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_222A78B58@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_222A78B6C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_222A78B80(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_222A78B94(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_222A78BA8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_222A78BB8()
{
  return sub_222AAD9B8();
}

_QWORD *sub_222A78BD0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_222A78BE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

void AppOffer.flags.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t AppOffer.ageRating.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_222A78C54()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;

  v2 = v0[3];
  v1 = v0[4];
  v4 = v0[5];
  v3 = v0[6];
  v5 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    swift_bridgeObjectRetain();
    v6 = sub_222AA4D5C(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v8 = *((_QWORD *)v6 + 2);
    v7 = *((_QWORD *)v6 + 3);
    if (v8 >= v7 >> 1)
      v6 = sub_222AA4D5C((char *)(v7 > 1), v8 + 1, 1, v6);
    *((_QWORD *)v6 + 2) = v8 + 1;
    v9 = &v6[16 * v8];
    *((_QWORD *)v9 + 4) = v2;
    *((_QWORD *)v9 + 5) = v1;
  }
  else
  {
    v6 = (char *)MEMORY[0x24BEE4AF8];
  }
  v10 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v10 = v4 & 0xFFFFFFFFFFFFLL;
  if (v10)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v6 = sub_222AA4D5C(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
    v12 = *((_QWORD *)v6 + 2);
    v11 = *((_QWORD *)v6 + 3);
    if (v12 >= v11 >> 1)
      v6 = sub_222AA4D5C((char *)(v11 > 1), v12 + 1, 1, v6);
    *((_QWORD *)v6 + 2) = v12 + 1;
    v13 = &v6[16 * v12];
    *((_QWORD *)v13 + 4) = v4;
    *((_QWORD *)v13 + 5) = v3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768910);
  sub_222A79694();
  v14 = sub_222AAD79C();
  swift_bridgeObjectRelease();
  return v14;
}

BOOL sub_222A78DE0()
{
  return (sub_222AAD820() & 1) == 0;
}

uint64_t AppOffer.apply(to:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*v2 & 2) != 0)
  {
    sub_222A78EE0(a1, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      swift_bridgeObjectRelease();
      return swift_storeEnumTagMultiPayload();
    }
    sub_222A783C0((uint64_t)v7);
  }
  return sub_222A78EE0(a1, a2);
}

uint64_t sub_222A78EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AppOffer.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_222AADB8C();
  sub_222AADB98();
  if (v1 != 1)
    sub_222AADB8C();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t AppOffer.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_222AADB80();
  sub_222AADB8C();
  sub_222AADB98();
  if (v1 != 1)
    sub_222AADB8C();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t sub_222A790B4()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_222AADB8C();
  sub_222AADB98();
  if (v1 != 1)
    sub_222AADB8C();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222A79168()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_222AADB80();
  sub_222AADB8C();
  sub_222AADB98();
  if (v1 != 1)
    sub_222AADB8C();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t _s8AppState0A5OfferV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  char v10;

  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 16))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
      v9 = *(_BYTE *)(a2 + 16);
    else
      v9 = 1;
    if ((v9 & 1) != 0)
      return 0;
  }
  if (v3 == *(_QWORD *)(a2 + 24) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
    || (v10 = sub_222AADAD8(), result = 0, (v10 & 1) != 0))
  {
    if (v4 == v6 && v5 == v7)
      return 1;
    else
      return sub_222AADAD8();
  }
  return result;
}

unint64_t sub_222A79314()
{
  unint64_t result;

  result = qword_2557688F8;
  if (!qword_2557688F8)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOffer.Flags, &type metadata for AppOffer.Flags);
    atomic_store(result, (unint64_t *)&qword_2557688F8);
  }
  return result;
}

unint64_t sub_222A7935C()
{
  unint64_t result;

  result = qword_255768900;
  if (!qword_255768900)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOffer.Flags, &type metadata for AppOffer.Flags);
    atomic_store(result, (unint64_t *)&qword_255768900);
  }
  return result;
}

unint64_t sub_222A793A4()
{
  unint64_t result;

  result = qword_2540C7628;
  if (!qword_2540C7628)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOffer.Flags, &type metadata for AppOffer.Flags);
    atomic_store(result, (unint64_t *)&qword_2540C7628);
  }
  return result;
}

unint64_t sub_222A793EC()
{
  unint64_t result;

  result = qword_2540C7630;
  if (!qword_2540C7630)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOffer.Flags, &type metadata for AppOffer.Flags);
    atomic_store(result, (unint64_t *)&qword_2540C7630);
  }
  return result;
}

unint64_t sub_222A79434()
{
  unint64_t result;

  result = qword_255768908;
  if (!qword_255768908)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOffer, &type metadata for AppOffer);
    atomic_store(result, (unint64_t *)&qword_255768908);
  }
  return result;
}

uint64_t destroy for AppOffer()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppOffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppOffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppOffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppOffer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppOffer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppOffer()
{
  return &type metadata for AppOffer;
}

ValueMetadata *type metadata accessor for AppOffer.Flags()
{
  return &type metadata for AppOffer.Flags;
}

unint64_t sub_222A79694()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255768918;
  if (!qword_255768918)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255768910);
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255768918);
  }
  return result;
}

AppState::AppOpenableDestination_optional __swiftcall AppOpenableDestination.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  AppState::AppOpenableDestination_optional result;
  char v5;

  v2 = v1;
  v3 = sub_222AADAB4();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t AppOpenableDestination.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x736567617373656DLL;
  else
    return 7368801;
}

uint64_t sub_222A79778(char *a1, char *a2)
{
  return sub_222A7AF18(*a1, *a2);
}

unint64_t sub_222A79788()
{
  unint64_t result;

  result = qword_255768920;
  if (!qword_255768920)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppOpenableDestination, &type metadata for AppOpenableDestination);
    atomic_store(result, (unint64_t *)&qword_255768920);
  }
  return result;
}

uint64_t sub_222A797CC()
{
  sub_222AADB80();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t sub_222A79844()
{
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222A79898()
{
  sub_222AADB80();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

AppState::AppOpenableDestination_optional sub_222A7990C(Swift::String *a1)
{
  return AppOpenableDestination.init(rawValue:)(*a1);
}

void sub_222A79918(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7368801;
  if (*v1)
    v2 = 0x736567617373656DLL;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE800000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t storeEnumTagSinglePayload for AppOpenableDestination(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A7999C + 4 * byte_222AAF165[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_222A799D0 + 4 * asc_222AAF160[v4]))();
}

uint64_t sub_222A799D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A799D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A799E0);
  return result;
}

uint64_t sub_222A799EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A799F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_222A799F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A79A00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppOpenableDestination()
{
  return &type metadata for AppOpenableDestination;
}

BOOL static AppPurchaseType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AppPurchaseType.hash(into:)()
{
  return sub_222AADB8C();
}

uint64_t AppPurchaseType.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

unint64_t sub_222A79AA4()
{
  unint64_t result;

  result = qword_255768928;
  if (!qword_255768928)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppPurchaseType, &type metadata for AppPurchaseType);
    atomic_store(result, (unint64_t *)&qword_255768928);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AppPurchaseType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A79B34 + 4 * byte_222AAF239[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_222A79B68 + 4 * byte_222AAF234[v4]))();
}

uint64_t sub_222A79B68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A79B70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A79B78);
  return result;
}

uint64_t sub_222A79B84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A79B8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_222A79B90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A79B98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppPurchaseType()
{
  return &type metadata for AppPurchaseType;
}

uint64_t sub_222A79BB4@<X0>(void *a1@<X0>, unsigned __int8 *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint64_t v25;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for State();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *a2;
  if (objc_msgSend(a1, sel_isFamilyShared)
    && (objc_msgSend(a1, sel_isOpenable) & 1) == 0
    && (objc_msgSend(a1, sel_isUpdateAvailable) & 1) == 0
    && (v16 = objc_msgSend(a1, sel_progress), v16, !v16)
    || (objc_msgSend(a1, sel_isInstalled) & 1) == 0
    && (v17 = objc_msgSend(a1, sel_progress), v17, !v17))
  {

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4, 1, 1, v11);
  }
  sub_222A79EB4(a1, a3 & 1, v10);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_222A7A648((uint64_t)v10);
    if ((objc_msgSend(a1, sel_isUpdateAvailable) & 1) != 0)
    {
      v18 = objc_msgSend(a1, sel_updateBuyParams);
      if (v18)
      {
        v19 = v18;
        v20 = sub_222AAD7B4();
        v22 = v21;

        *v14 = v20;
        v14[1] = v22;
LABEL_21:
        swift_storeEnumTagMultiPayload();
        goto LABEL_22;
      }
    }
    if (objc_msgSend(a1, sel_hasMessagesExtension)
      && ((objc_msgSend(a1, sel_isLaunchProhibited) & 1) != 0 || v15 == 1))
    {
      v24 = objc_msgSend(a1, sel_storeExternalVersionID);

      *(_BYTE *)v14 = 1;
    }
    else
    {
      if (objc_msgSend(a1, sel_isLaunchProhibited))
      {

        goto LABEL_21;
      }
      v24 = objc_msgSend(a1, sel_storeExternalVersionID);

      *(_BYTE *)v14 = 0;
    }
    v14[1] = (uint64_t)v24;
    goto LABEL_21;
  }

  sub_222A7A688((uint64_t)v10, (uint64_t)v14);
LABEL_22:
  sub_222A7A688((uint64_t)v14, a4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a4, 0, 1, v11);
}

uint64_t sub_222A79EB4@<X0>(void *a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  int v53;

  v6 = type metadata accessor for AppInstallation.Phase(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v52 - v10;
  v12 = type metadata accessor for AppInstallation.Progress(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v52 - v16;
  v18 = objc_msgSend(a1, sel_progress);
  if (v18)
  {
    v53 = a2;
    v19 = v18;
    sub_222AAD4A8();
    objc_msgSend(v19, sel_fractionCompleted);
    *(_QWORD *)&v17[*(int *)(v12 + 20)] = v20;
    *(_QWORD *)&v17[*(int *)(v12 + 24)] = v19;
    switch((unint64_t)objc_msgSend(a1, sel_progressPhase))
    {
      case 0uLL:
        v27 = objc_msgSend(a1, sel_installError);
        if (!v27)
          goto LABEL_10;

        goto LABEL_9;
      case 1uLL:
LABEL_9:
        sub_222A759F4((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

        goto LABEL_21;
      case 2uLL:
        v52 = v19;
        v28 = objc_msgSend(a1, sel_downloadProgress);
        if (v28)
        {
          v29 = v28;
          v22 = a1;
          v23 = v29;
          sub_222AAD4A8();
          objc_msgSend(v23, (SEL)0x24E978868);
          *(_QWORD *)&v11[*(int *)(v12 + 20)] = v30;
          *(_QWORD *)&v11[*(int *)(v12 + 24)] = v23;
LABEL_13:
          swift_storeEnumTagMultiPayload();
          sub_222A75DC0((uint64_t)v17, (uint64_t)v15, type metadata accessor for AppInstallation.Progress);
          type metadata accessor for AppInstallation.ASDAppStore();
          v31 = swift_allocObject();
          *(_QWORD *)(v31 + 16) = v22;
          *(_QWORD *)a3 = v31;
          v32 = (int *)type metadata accessor for AppInstallation(0);
          sub_222A75DC0((uint64_t)v11, (uint64_t)&a3[v32[5]], type metadata accessor for AppInstallation.Phase);
          sub_222A75DC0((uint64_t)v15, (uint64_t)&a3[v32[6]], type metadata accessor for AppInstallation.Progress);
          v33 = v22;
          a3[v32[7]] = objc_msgSend(v33, sel_hasPostProcessing);
          *(_QWORD *)&a3[v32[8]] = objc_msgSend(v33, sel_essentialBackgroundAssetDownloadEstimate);
          a3[v32[9]] = v53 & 1;
          v34 = objc_msgSend(v33, sel_storeExternalVersionID);

          sub_222A759F4((uint64_t)v15, type metadata accessor for AppInstallation.Progress);
          sub_222A759F4((uint64_t)v11, type metadata accessor for AppInstallation.Phase);

          *(_QWORD *)&a3[v32[10]] = v34;
LABEL_19:
          sub_222A759F4((uint64_t)v17, type metadata accessor for AppInstallation.Progress);
          v51 = type metadata accessor for State();
        }
        else
        {
          sub_222A759F4((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

LABEL_21:
          *a3 = 0;
          v51 = type metadata accessor for State();
        }
        swift_storeEnumTagMultiPayload();
        result = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(a3, 0, 1, v51);
        break;
      case 3uLL:
      case 4uLL:
        v52 = v19;
        v21 = objc_msgSend(a1, sel_installProgress);
        if (!v21)
          v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1768]), sel_init);
        v22 = a1;
        v23 = v21;
        sub_222AAD4A8();
        objc_msgSend(v23, sel_fractionCompleted);
        *(_QWORD *)&v11[*(int *)(v12 + 20)] = v24;
        *(_QWORD *)&v11[*(int *)(v12 + 24)] = v23;
        goto LABEL_13;
      case 5uLL:
        v52 = v19;
        v35 = objc_msgSend(a1, sel_postProcessProgress);
        if (!v35)
          v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1768]), sel_init);
        v36 = a1;
        v37 = v35;
        sub_222AAD4A8();
        objc_msgSend(v37, (SEL)0x24E978868);
        *(_QWORD *)&v11[*(int *)(v12 + 20)] = v38;
        *(_QWORD *)&v11[*(int *)(v12 + 24)] = v37;
        swift_storeEnumTagMultiPayload();
        sub_222A75DC0((uint64_t)v17, (uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        type metadata accessor for AppInstallation.ASDAppStore();
        v39 = swift_allocObject();
        *(_QWORD *)(v39 + 16) = v36;
        *(_QWORD *)a3 = v39;
        v40 = (int *)type metadata accessor for AppInstallation(0);
        sub_222A75DC0((uint64_t)v11, (uint64_t)&a3[v40[5]], type metadata accessor for AppInstallation.Phase);
        sub_222A75DC0((uint64_t)v15, (uint64_t)&a3[v40[6]], type metadata accessor for AppInstallation.Progress);
        v41 = v36;
        a3[v40[7]] = objc_msgSend(v41, sel_hasPostProcessing);
        *(_QWORD *)&a3[v40[8]] = objc_msgSend(v41, sel_essentialBackgroundAssetDownloadEstimate);
        a3[v40[9]] = v53 & 1;
        v42 = objc_msgSend(v41, sel_storeExternalVersionID);

        sub_222A759F4((uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        sub_222A759F4((uint64_t)v11, type metadata accessor for AppInstallation.Phase);

        *(_QWORD *)&a3[v40[10]] = v42;
        goto LABEL_19;
      case 6uLL:
        sub_222A759F4((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

        v43 = type metadata accessor for State();
        return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(a3, 1, 1, v43);
      case 7uLL:
        sub_222A7A9EC(a1, (uint64_t)v17, (uint64_t)v11);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BF8);
        v44 = swift_allocBox();
        v52 = v19;
        v45 = v44;
        sub_222A75DC0((uint64_t)v11, v46, type metadata accessor for AppInstallation.Phase);
        *v9 = v45;
        swift_storeEnumTagMultiPayload();
        sub_222A75DC0((uint64_t)v17, (uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        type metadata accessor for AppInstallation.ASDAppStore();
        v47 = swift_allocObject();
        *(_QWORD *)(v47 + 16) = a1;
        *(_QWORD *)a3 = v47;
        v48 = (int *)type metadata accessor for AppInstallation(0);
        sub_222A75DC0((uint64_t)v9, (uint64_t)&a3[v48[5]], type metadata accessor for AppInstallation.Phase);
        sub_222A75DC0((uint64_t)v15, (uint64_t)&a3[v48[6]], type metadata accessor for AppInstallation.Progress);
        v49 = a1;
        a3[v48[7]] = objc_msgSend(v49, sel_hasPostProcessing);
        *(_QWORD *)&a3[v48[8]] = objc_msgSend(v49, sel_essentialBackgroundAssetDownloadEstimate);
        a3[v48[9]] = v53 & 1;
        v50 = objc_msgSend(v49, sel_storeExternalVersionID);
        sub_222A759F4((uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        sub_222A759F4((uint64_t)v9, type metadata accessor for AppInstallation.Phase);

        *(_QWORD *)&a3[v48[10]] = v50;
        sub_222A759F4((uint64_t)v11, type metadata accessor for AppInstallation.Phase);
        goto LABEL_19;
      default:
LABEL_10:
        sub_222A7A6CC(a1, v53 & 1, a3);

        return sub_222A759F4((uint64_t)v17, type metadata accessor for AppInstallation.Progress);
    }
  }
  else
  {
    v25 = type metadata accessor for State();
    return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a3, 1, 1, v25);
  }
  return result;
}

uint64_t sub_222A7A648(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_222A7A688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A7A6CC@<X0>(void *a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  id v26;
  id v27;
  uint64_t v28;

  v6 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AppInstallation.Phase(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  v15 = objc_msgSend(a1, sel_progress);
  if (v15)
  {
    v16 = v15;
    sub_222AAD4A8();
    objc_msgSend(v16, sel_fractionCompleted);
    *(_QWORD *)&v14[*(int *)(v6 + 20)] = v17;
    *(_QWORD *)&v14[*(int *)(v6 + 24)] = v16;
    swift_storeEnumTagMultiPayload();
    if (objc_msgSend(v16, sel_isIndeterminate))
    {
      sub_222A759F4((uint64_t)v14, type metadata accessor for AppInstallation.Phase);

      *a3 = 0;
    }
    else
    {
      sub_222A75DC0((uint64_t)v14, (uint64_t)v12, type metadata accessor for AppInstallation.Phase);
      v21 = v16;
      v22 = a1;
      sub_222AAD4A8();
      objc_msgSend(v21, sel_fractionCompleted);
      *(_QWORD *)&v8[*(int *)(v6 + 20)] = v23;
      *(_QWORD *)&v8[*(int *)(v6 + 24)] = v21;
      type metadata accessor for AppInstallation.ASDAppStore();
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v22;
      *(_QWORD *)a3 = v24;
      v25 = (int *)type metadata accessor for AppInstallation(0);
      sub_222A75DC0((uint64_t)v12, (uint64_t)&a3[v25[5]], type metadata accessor for AppInstallation.Phase);
      sub_222A75DC0((uint64_t)v8, (uint64_t)&a3[v25[6]], type metadata accessor for AppInstallation.Progress);
      v26 = v22;
      a3[v25[7]] = objc_msgSend(v26, sel_hasPostProcessing);
      *(_QWORD *)&a3[v25[8]] = objc_msgSend(v26, sel_essentialBackgroundAssetDownloadEstimate);
      a3[v25[9]] = a2 & 1;
      v27 = objc_msgSend(v26, sel_storeExternalVersionID);

      sub_222A759F4((uint64_t)v8, type metadata accessor for AppInstallation.Progress);
      sub_222A759F4((uint64_t)v12, type metadata accessor for AppInstallation.Phase);

      *(_QWORD *)&a3[v25[10]] = v27;
      sub_222A759F4((uint64_t)v14, type metadata accessor for AppInstallation.Phase);
    }
    v18 = type metadata accessor for State();
    swift_storeEnumTagMultiPayload();
    type metadata accessor for State();
    return (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a3, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for State();
    return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a3, 1, 1, v19);
  }
}

uint64_t sub_222A7A9EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend(a1, sel_postProcessProgress);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_fractionCompleted);
    if (v8 > 0.0)
    {
      sub_222AAD4A8();
      objc_msgSend(v7, sel_fractionCompleted);
      v10 = v9;
      v11 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)(a3 + *(int *)(v11 + 20)) = v10;
      *(_QWORD *)(a3 + *(int *)(v11 + 24)) = v7;
      goto LABEL_8;
    }

  }
  v12 = objc_msgSend(a1, sel_downloadProgress);
  if (v12)
  {
    v13 = v12;
    sub_222AAD4A8();
    objc_msgSend(v13, sel_fractionCompleted);
    v15 = v14;
    v16 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)(a3 + *(int *)(v16 + 20)) = v15;
    *(_QWORD *)(a3 + *(int *)(v16 + 24)) = v13;
  }
  else
  {
    sub_222A75DC0(a2, a3, type metadata accessor for AppInstallation.Progress);
  }
LABEL_8:
  type metadata accessor for AppInstallation.Phase(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_222A7AB18@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = type metadata accessor for State();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_isHidden))
  {
    swift_bridgeObjectRelease();
LABEL_6:

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  }
  v12 = sub_222A7ACF4((uint64_t)objc_msgSend(a1, sel_purchaserDSID), a2);
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_6;
  if (objc_msgSend(a1, sel_isPreorder))
  {

    *v11 = 1;
  }
  else
  {
    v14 = a3[3];
    v15 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v14);
    if (((*(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 24))(a1, v14, v15) & 1) != 0)
    {
      v16 = objc_msgSend(a1, sel_cleanedRedownloadParams);
      v17 = sub_222AAD7B4();
      v19 = v18;

      *(_QWORD *)v11 = v17;
      *((_QWORD *)v11 + 1) = v19;
    }
    else
    {

      *v11 = 0;
    }
  }
  swift_storeEnumTagMultiPayload();
  sub_222A7A688((uint64_t)v11, a4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
}

BOOL sub_222A7ACF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_222AADB74();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

void sub_222A7ADBC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_222A7AE0C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_222A7AE70 + 4 * byte_222AAF2CC[a2]))(0x6573616863727570);
}

uint64_t sub_222A7AE70(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6573616863727570 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_222AADAD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_222A7AF18(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x736567617373656DLL;
  else
    v3 = 7368801;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE800000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x736567617373656DLL;
  else
    v5 = 7368801;
  if ((a2 & 1) != 0)
    v6 = 0xE800000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_222AADAD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_222A7AFB4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_222A7B004(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_222A7B0EC + 4 * byte_222AAF2D9[a2]))(0x676E6974696177);
}

uint64_t sub_222A7B0EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 0x676E6974696177 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_222AADAD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_222A7B234(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_222A7B274()
{
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t State.isLocalApplication.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v9;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v0, (uint64_t)v3, v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v6 = 1;
  if (EnumCaseMultiPayload == 2)
    goto LABEL_7;
  if (EnumCaseMultiPayload != 5 && EnumCaseMultiPayload != 7)
  {
    v6 = 0;
LABEL_7:
    sub_222A759F4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  }
  return v6;
}

uint64_t type metadata accessor for State()
{
  uint64_t result;

  result = qword_2540C7DF8;
  if (!qword_2540C7DF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t State.isBuyable.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v8;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v0, (uint64_t)v3, v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 6 || EnumCaseMultiPayload == 8)
    return 1;
  sub_222A759F4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return 0;
}

BOOL State.isUpdatable.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _BOOL8 v4;
  uint64_t v6;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v0, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  v4 = swift_getEnumCaseMultiPayload() == 2;
  sub_222A759F4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return v4;
}

uint64_t State.isPendingUpdate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t (*v7)();
  unsigned int v8;
  uint64_t (*v9)();
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for State);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v6 = 1;
  if (EnumCaseMultiPayload)
  {
    v7 = type metadata accessor for State;
    if (EnumCaseMultiPayload == 4)
    {
      v7 = (uint64_t (*)())type metadata accessor for AppInstallation;
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    if (EnumCaseMultiPayload == 2)
      v9 = type metadata accessor for State;
    else
      v9 = v7;
    if (EnumCaseMultiPayload == 2)
      v6 = 1;
    else
      v6 = v8;
    sub_222A759F4((uint64_t)v4, (uint64_t (*)(_QWORD))v9);
  }
  return v6;
}

BOOL State.hasBeenPurchased.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  int EnumCaseMultiPayload;
  BOOL v10;
  _BOOL8 v11;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for State();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  sub_222A75DC0(v1, (uint64_t)&v13 - v6, v8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v10 = EnumCaseMultiPayload == 8 || EnumCaseMultiPayload == 6;
  v11 = 0;
  if (!v10)
  {
    if (EnumCaseMultiPayload
      || (sub_222A75DC0((uint64_t)v7, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for State),
          *v5 != 1))
    {
      v11 = 1;
    }
  }
  sub_222A759F4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return v11;
}

BOOL State.hasKnownWaitingType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v0, (uint64_t)v3, v4);
  if (!swift_getEnumCaseMultiPayload())
    return *v3 != 0;
  sub_222A759F4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return 0;
}

AppState::State::Key_optional __swiftcall State.Key.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AppState::State::Key_optional result;
  char v5;

  v2 = v1;
  v3 = sub_222AADAB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t State.Key.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_222A7B854 + 4 * byte_222AAF2EB[*v0]))(0x656C6261797562, 0xE700000000000000);
}

uint64_t sub_222A7B854()
{
  return 0x676E6974696177;
}

uint64_t sub_222A7B868()
{
  return 0x6573616863727570;
}

uint64_t sub_222A7B8F4()
{
  return 0x656C62616E65706FLL;
}

uint64_t sub_222A7B90C()
{
  return 0x6E776F6E6B6E75;
}

void sub_222A7B920(char *a1)
{
  sub_222A7AFB4(*a1);
}

uint64_t sub_222A7B92C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_222AADB80();
  sub_222A7B234((uint64_t)v3, v1);
  return sub_222AADBB0();
}

void sub_222A7B970(uint64_t a1)
{
  char *v1;

  sub_222A7B234(a1, *v1);
}

uint64_t sub_222A7B978()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_222AADB80();
  sub_222A7B234((uint64_t)v3, v1);
  return sub_222AADBB0();
}

AppState::State::Key_optional sub_222A7B9B8(Swift::String *a1)
{
  return State.Key.init(rawValue:)(*a1);
}

uint64_t sub_222A7B9C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = State.Key.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void State.key.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  sub_222A75DC0(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_222A7BA74 + 4 * byte_222AAF2F4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_222A7BA74()
{
  _BYTE *v0;

  *v0 = 1;
}

uint64_t State.overrideBuyParams.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  v1 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(v0, (uint64_t)v3, v4);
  if ((swift_getEnumCaseMultiPayload() & 0xFFFFFFFE) == 2)
    return *(_QWORD *)v3;
  sub_222A759F4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return 0;
}

uint64_t sub_222A7BBAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int EnumCaseMultiPayload;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;

  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E38);
  MEMORY[0x24BDAC7A8](v35);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for State();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v29 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v29 - v17;
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v34((char *)&v29 - v17, 1, 1, v6);
  v33 = *(_QWORD *)(a1 + 16);
  if (!v33)
    goto LABEL_15;
  v30 = v13;
  v31 = a1;
  v32 = a2;
  v19 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v36 = v7;
  v20 = *(_QWORD *)(v7 + 72);
  swift_bridgeObjectRetain();
  v21 = v33;
  while (1)
  {
    sub_222A75DC0(v19, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for State);
    v26 = (uint64_t)&v5[*(int *)(v35 + 48)];
    sub_222A7DC44((uint64_t)v18, (uint64_t)v5);
    sub_222A75DC0((uint64_t)v9, v26, (uint64_t (*)(_QWORD))type metadata accessor for State);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v5, 1, v6) == 1)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (!EnumCaseMultiPayload)
      {
        sub_222A7DCD0((uint64_t)v18, &qword_2540C7E30);
        sub_222A7DC8C((uint64_t)v9, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for State);
        v34(v18, 0, 1, v6);
        v25 = &qword_2540C7E30;
        goto LABEL_6;
      }
    }
    else
    {
      sub_222A7DC44((uint64_t)v5, (uint64_t)v16);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_222A759F4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for State);
        v24 = (uint64_t)v16;
        goto LABEL_5;
      }
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    }
    v23 = EnumCaseMultiPayload;
    v24 = (uint64_t)v9;
    if (v23 == 4)
      break;
LABEL_5:
    sub_222A759F4(v24, (uint64_t (*)(_QWORD))type metadata accessor for State);
    v25 = &qword_2540C7E38;
LABEL_6:
    sub_222A7DCD0((uint64_t)v5, v25);
    v19 += v20;
    if (!--v21)
    {
      a1 = v31;
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  a1 = v31;
  swift_bridgeObjectRelease();
  sub_222A7DCD0((uint64_t)v18, &qword_2540C7E30);
  sub_222A759F4(v26, type metadata accessor for AppInstallation);
  sub_222A7DCD0((uint64_t)v5, &qword_2540C7E30);
  sub_222A7DC8C((uint64_t)v9, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for State);
  v34(v18, 0, 1, v6);
LABEL_14:
  a2 = v32;
  v13 = v30;
  v7 = v36;
LABEL_15:
  sub_222A7DC44((uint64_t)v18, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    if (v33)
    {
      sub_222A75DC0(a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, (uint64_t (*)(_QWORD))type metadata accessor for State);
      v27 = 0;
    }
    else
    {
      v27 = 1;
    }
    v34((char *)a2, v27, 1, v6);
    sub_222A7DCD0((uint64_t)v18, &qword_2540C7E30);
    return sub_222A7DCD0((uint64_t)v13, &qword_2540C7E30);
  }
  else
  {
    sub_222A7DCD0((uint64_t)v18, &qword_2540C7E30);
    sub_222A7DC8C((uint64_t)v13, a2, (uint64_t (*)(_QWORD))type metadata accessor for State);
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v34)(a2, 0, 1, v6);
  }
}

uint64_t sub_222A7BFA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v36 = a2;
  v3 = type metadata accessor for AppInstallation.Phase(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for State();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v33 - v13;
  v15 = type metadata accessor for AppInstallation(0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v33 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v33 - v22;
  sub_222A75DC0(a1, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    v34 = v5;
    sub_222A7DC8C((uint64_t)v14, (uint64_t)v23, type metadata accessor for AppInstallation);
    v24 = v35;
    sub_222A75DC0(v35, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for State);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v26 = v36;
    if (EnumCaseMultiPayload == 4)
    {
      sub_222A7DC8C((uint64_t)v12, (uint64_t)v21, type metadata accessor for AppInstallation);
      sub_222A75DC0((uint64_t)v21, (uint64_t)v18, type metadata accessor for AppInstallation);
      v27 = *(int *)(v15 + 24);
      v28 = &v23[v27];
      sub_222A75DC0((uint64_t)&v21[v27], (uint64_t)v8, type metadata accessor for AppInstallation.Progress);
      v29 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v8, v28, v29);
      v30 = (uint64_t)&v18[*(int *)(v15 + 24)];
      sub_222A759F4(v30, type metadata accessor for AppInstallation.Progress);
      sub_222A7DC8C((uint64_t)v8, v30, type metadata accessor for AppInstallation.Progress);
      v31 = (uint64_t)v34;
      sub_222A74C94((uint64_t)&v23[*(int *)(v15 + 20)], (uint64_t)v34);
      sub_222A7DC00(v31, (uint64_t)&v18[*(int *)(v15 + 20)]);
      sub_222A7DC8C((uint64_t)v18, v26, type metadata accessor for AppInstallation);
      sub_222A759F4((uint64_t)v21, type metadata accessor for AppInstallation);
      sub_222A759F4((uint64_t)v23, type metadata accessor for AppInstallation);
      return swift_storeEnumTagMultiPayload();
    }
    sub_222A759F4((uint64_t)v23, type metadata accessor for AppInstallation);
  }
  else
  {
    v12 = v14;
    v24 = v35;
    v26 = v36;
  }
  sub_222A759F4((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return sub_222A75DC0(v24, v26, (uint64_t (*)(_QWORD))type metadata accessor for State);
}

void State.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for AppInstallation(0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v2);
  sub_222A75DC0(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_222A7C380 + 4 * byte_222AAF2FD[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_222A7C380()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_222AADB8C();
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)sub_222A7C3B8 + 4 * byte_222AAF306[v1]))(v2, 0x6E776F6E6B6E75);
}

uint64_t sub_222A7C3B8()
{
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t State.hashValue.getter()
{
  sub_222AADB80();
  State.hash(into:)();
  return sub_222AADBB0();
}

uint64_t sub_222A7C560()
{
  sub_222AADB80();
  State.hash(into:)();
  return sub_222AADBB0();
}

uint64_t sub_222A7C5A0()
{
  sub_222AADB80();
  State.hash(into:)();
  return sub_222AADBB0();
}

void _s8AppState0B0O2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v17 = a2;
  v3 = type metadata accessor for AppInstallation(0);
  MEMORY[0x24BDAC7A8](v3);
  v16 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for State();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EB8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v16 + *(int *)(v12 + 48) - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A75DC0(a1, (uint64_t)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for State);
  sub_222A75DC0(v17, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for State);
  v15 = (char *)sub_222A7C790 + 4 * byte_222AAF30A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_222A7C790()
{
  uint64_t v0;
  char *v1;
  char v2;
  char v3;

  sub_222A75DC0(v0, (uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_222A7DCD0(v0, &qword_2540C7EB8);
    v3 = 0;
  }
  else
  {
    sub_222A7ADBC(*v1);
    v3 = v2;
    sub_222A759F4(v0, (uint64_t (*)(_QWORD))type metadata accessor for State);
  }
  return v3 & 1;
}

unint64_t sub_222A7CAC0()
{
  unint64_t result;

  result = qword_2540C7DE8;
  if (!qword_2540C7DE8)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for State.Key, &type metadata for State.Key);
    atomic_store(result, (unint64_t *)&qword_2540C7DE8);
  }
  return result;
}

unint64_t sub_222A7CB08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255768930;
  if (!qword_255768930)
  {
    v1 = type metadata accessor for State();
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for State, v1);
    atomic_store(result, (unint64_t *)&qword_255768930);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      v11 = (int *)type metadata accessor for AppInstallation(0);
      v12 = v11[5];
      v13 = (_QWORD *)((char *)a1 + v12);
      v14 = (_QWORD *)((char *)a2 + v12);
      v15 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          v16 = sub_222AAD4B4();
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
          v17 = type metadata accessor for AppInstallation.Progress(0);
          *(_QWORD *)((char *)v13 + *(int *)(v17 + 20)) = *(_QWORD *)((char *)v14 + *(int *)(v17 + 20));
          v18 = *(int *)(v17 + 24);
          v19 = *(void **)((char *)v14 + v18);
          *(_QWORD *)((char *)v13 + v18) = v19;
          v20 = v19;
          goto LABEL_14;
        case 3u:
          *v13 = *v14;
          swift_retain();
LABEL_14:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
          break;
      }
      v21 = v11[6];
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
      v25 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v22[*(int *)(v25 + 20)] = *(_QWORD *)&v23[*(int *)(v25 + 20)];
      v26 = *(int *)(v25 + 24);
      v27 = *(void **)&v23[v26];
      *(_QWORD *)&v22[v26] = v27;
      *((_BYTE *)a1 + v11[7]) = *((_BYTE *)a2 + v11[7]);
      *(_QWORD *)((char *)a1 + v11[8]) = *(_QWORD *)((char *)a2 + v11[8]);
      *((_BYTE *)a1 + v11[9]) = *((_BYTE *)a2 + v11[9]);
      *(_QWORD *)((char *)a1 + v11[10]) = *(_QWORD *)((char *)a2 + v11[10]);
      v28 = v27;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
  }
  return a1;
}

void destroy for State(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    swift_release();
    v3 = type metadata accessor for AppInstallation(0);
    v4 = a1 + *(int *)(v3 + 20);
    type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v5 = sub_222AAD4B4();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

        break;
      case 3u:
        swift_release();
        break;
      default:
        break;
    }
    v6 = a1 + *(int *)(v3 + 24);
    v7 = sub_222AAD4B4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  }
  else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    swift_bridgeObjectRelease();
  }
}

_QWORD *initializeWithCopy for State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    *a1 = *a2;
    v8 = (int *)type metadata accessor for AppInstallation(0);
    v9 = v8[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v13 = sub_222AAD4B4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
        v14 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)((char *)v10 + *(int *)(v14 + 20)) = *(_QWORD *)((char *)v11 + *(int *)(v14 + 20));
        v15 = *(int *)(v14 + 24);
        v16 = *(void **)((char *)v11 + v15);
        *(_QWORD *)((char *)v10 + v15) = v16;
        v17 = v16;
        goto LABEL_11;
      case 3u:
        *v10 = *v11;
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
        break;
    }
    v18 = v8[6];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v19[*(int *)(v22 + 20)] = *(_QWORD *)&v20[*(int *)(v22 + 20)];
    v23 = *(int *)(v22 + 24);
    v24 = *(void **)&v20[v23];
    *(_QWORD *)&v19[v23] = v24;
    *((_BYTE *)a1 + v8[7]) = *((_BYTE *)a2 + v8[7]);
    *(_QWORD *)((char *)a1 + v8[8]) = *(_QWORD *)((char *)a2 + v8[8]);
    *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
    *(_QWORD *)((char *)a1 + v8[10]) = *(_QWORD *)((char *)a2 + v8[10]);
    v25 = v24;
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  if (a1 != a2)
  {
    sub_222A759F4((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for State);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      v7 = (int *)type metadata accessor for AppInstallation(0);
      v8 = v7[5];
      v9 = (_QWORD *)((char *)a1 + v8);
      v10 = (_QWORD *)((char *)a2 + v8);
      v11 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          v12 = sub_222AAD4B4();
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
          v13 = type metadata accessor for AppInstallation.Progress(0);
          *(_QWORD *)((char *)v9 + *(int *)(v13 + 20)) = *(_QWORD *)((char *)v10 + *(int *)(v13 + 20));
          v14 = *(int *)(v13 + 24);
          v15 = *(void **)((char *)v10 + v14);
          *(_QWORD *)((char *)v9 + v14) = v15;
          v16 = v15;
          goto LABEL_12;
        case 3u:
          *v9 = *v10;
          swift_retain();
LABEL_12:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
          break;
      }
      v17 = v7[6];
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      v21 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v18[*(int *)(v21 + 20)] = *(_QWORD *)&v19[*(int *)(v21 + 20)];
      v22 = *(int *)(v21 + 24);
      v23 = *(void **)&v19[v22];
      *(_QWORD *)&v18[v22] = v23;
      *((_BYTE *)a1 + v7[7]) = *((_BYTE *)a2 + v7[7]);
      *(_QWORD *)((char *)a1 + v7[8]) = *(_QWORD *)((char *)a2 + v7[8]);
      *((_BYTE *)a1 + v7[9]) = *((_BYTE *)a2 + v7[9]);
      *(_QWORD *)((char *)a1 + v7[10]) = *(_QWORD *)((char *)a2 + v7[10]);
      v24 = v23;
      goto LABEL_14;
    }
    if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *initializeWithTake for State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (swift_getEnumCaseMultiPayload() == 4)
  {
    *a1 = *a2;
    v6 = (int *)type metadata accessor for AppInstallation(0);
    v7 = v6[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v11 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      v12 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v8[*(int *)(v12 + 20)] = *(_QWORD *)&v9[*(int *)(v12 + 20)];
      *(_QWORD *)&v8[*(int *)(v12 + 24)] = *(_QWORD *)&v9[*(int *)(v12 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    v13 = v6[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    v17 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v14[*(int *)(v17 + 20)] = *(_QWORD *)&v15[*(int *)(v17 + 20)];
    *(_QWORD *)&v14[*(int *)(v17 + 24)] = *(_QWORD *)&v15[*(int *)(v17 + 24)];
    *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
    *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
    *((_BYTE *)a1 + v6[9]) = *((_BYTE *)a2 + v6[9]);
    *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 != a2)
  {
    sub_222A759F4((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for State);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      *a1 = *a2;
      v6 = (int *)type metadata accessor for AppInstallation(0);
      v7 = v6[5];
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for AppInstallation.Phase(0);
      if (swift_getEnumCaseMultiPayload() > 2)
      {
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        v11 = sub_222AAD4B4();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
        v12 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)&v8[*(int *)(v12 + 20)] = *(_QWORD *)&v9[*(int *)(v12 + 20)];
        *(_QWORD *)&v8[*(int *)(v12 + 24)] = *(_QWORD *)&v9[*(int *)(v12 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      v13 = v6[6];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      v16 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      v17 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v14[*(int *)(v17 + 20)] = *(_QWORD *)&v15[*(int *)(v17 + 20)];
      *(_QWORD *)&v14[*(int *)(v17 + 24)] = *(_QWORD *)&v15[*(int *)(v17 + 24)];
      *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
      *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
      *((_BYTE *)a1 + v6[9]) = *((_BYTE *)a2 + v6[9]);
      *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_222A7DA18()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AppInstallation(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for State.Key(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for State.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_222A7DB80 + 4 * byte_222AAF328[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_222A7DBB4 + 4 * byte_222AAF323[v4]))();
}

uint64_t sub_222A7DBB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A7DBBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A7DBC4);
  return result;
}

uint64_t sub_222A7DBD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A7DBD8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_222A7DBDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A7DBE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for State.Key()
{
  return &type metadata for State.Key;
}

uint64_t sub_222A7DC00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppInstallation.Phase(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A7DC44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A7DC8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_222A7DCD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AppStateController.state(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  _QWORD v12[2];
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;

  v6 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *((_BYTE *)a1 + 8);
  v18 = *a1;
  v19 = v9;
  swift_storeEnumTagMultiPayload();
  v12[0] = 0;
  v12[1] = 0;
  v13 = 1;
  v14 = 0;
  v15 = 0xE000000000000000;
  v16 = 0;
  v17 = 0xE000000000000000;
  (*(void (**)(uint64_t *, char *, _QWORD *, uint64_t, uint64_t))(a3 + 56))(&v18, v8, v12, a2, a3);
  return sub_222A783C0((uint64_t)v8);
}

uint64_t AppStateController.state(forApp:applying:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  _QWORD v20[2];
  char v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v8 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = *((_BYTE *)a1 + 8);
  v13 = *a2;
  v14 = a2[1];
  v15 = *((_BYTE *)a2 + 16);
  v19 = *(_OWORD *)(a2 + 3);
  v17 = a2[5];
  v16 = a2[6];
  v25 = v11;
  v26 = v12;
  swift_storeEnumTagMultiPayload();
  v20[0] = v13;
  v20[1] = v14;
  v21 = v15;
  v22 = v19;
  v23 = v17;
  v24 = v16;
  (*(void (**)(uint64_t *, char *, _QWORD *, uint64_t, uint64_t))(a4 + 56))(&v25, v10, v20, a3, a4);
  return sub_222A783C0((uint64_t)v10);
}

uint64_t AppStateController.prospectiveState(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v3;
  _QWORD v5[2];
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *((_BYTE *)a1 + 8);
  v11 = *a1;
  v12 = v3;
  v5[0] = 0;
  v5[1] = 0;
  v6 = 1;
  v7 = 0;
  v8 = 0xE000000000000000;
  v9 = 0;
  v10 = 0xE000000000000000;
  return (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(a3 + 64))(&v11, v5, a2);
}

uint64_t AppStateController.clearWaiting(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *((_BYTE *)a1 + 8);
  v5 = *a1;
  v6 = v3;
  return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t))(a3 + 120))(&v5, 0, a2) & 1;
}

uint64_t dispatch thunk of AppStateController.isLoaded.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateController.onLoad.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppStateController.loadDataSources()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AppStateController.reloadAllStates(synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 32) + *(_QWORD *)(a3 + 32));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A7E220;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_222A7E0EC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of AppStateController.preloadState(forApps:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AppStateController.state(forApp:initialState:applying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of AppStateController.prospectiveState(forApp:applying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of AppStateController.canTransitionState(forApp:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of AppStateController.transitionState(forApp:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of AppStateController.onStateChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AppStateController.postsChanges(forApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AppStateController.setPostsChanges(_:forApp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of AppStateController.setWaiting(forApp:installationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 112))();
}

uint64_t dispatch thunk of AppStateController.clearWaiting(forApp:refreshState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 128) + *(_QWORD *)(a4 + 128));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppStateController.isLocal(app:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of AppStateController.isRedownloadable(app:includingPreorders:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of AppStateController.purchaseHistoryIncludes(app:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 152))();
}

uint64_t AppStateDataSource.isIncremental.getter()
{
  return 0;
}

uint64_t sub_222A7E22C()
{
  return 1;
}

uint64_t AppStateDataSource.providesState(forApp:)()
{
  return 1;
}

uint64_t AppStateDataSource.setWaiting(forAppWith:installationType:)()
{
  return 0;
}

uint64_t AppStateDataSource.clearWaiting(forAppWith:)()
{
  return 0;
}

uint64_t dispatch thunk of AppStateDataSource.isIncremental.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateDataSource.onSynchronizeAppStates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppStateDataSource.load()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 32) + *(_QWORD *)(a4 + 32));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppStateDataSource.reloadAllStates(synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 40) + *(_QWORD *)(a3 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A7E220;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AppStateDataSource.state(forAppWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AppStateDataSource.providesState(forApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of AppStateDataSource.setWaiting(forAppWith:installationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of AppStateDataSource.clearWaiting(forAppWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_222A7E3E4()
{
  uint64_t v1;

  v1 = sub_222AADBBC();
  sub_222AAD7D8();
  sub_222AADACC();
  sub_222AAD7D8();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  return v1;
}

uint64_t sub_222A7E478@<X0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = *a1;
  if (*(_QWORD *)(v12 + 16) && (v13 = sub_222A8B258(a2 & 1), (v14 & 1) != 0))
  {
    v15 = v13;
    v16 = *(_QWORD *)(v12 + 56);
    v17 = type metadata accessor for State();
    v18 = *(_QWORD *)(v17 - 8);
    sub_222A78EE0(v16 + *(_QWORD *)(v18 + 72) * v15, (uint64_t)v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
  }
  else
  {
    v17 = type metadata accessor for State();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 1, 1, v17);
  }
  sub_222A80648((uint64_t)v11, (uint64_t)v9);
  type metadata accessor for State();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v9, 1, v17) != 1)
    return sub_222A7A688((uint64_t)v9, a3);
  swift_storeEnumTagMultiPayload();
  return sub_222A7DCD0((uint64_t)v9, &qword_2540C7E30);
}

uint64_t sub_222A7E5F0@<X0>(_QWORD *a1@<X0>, char a2@<W1>, ValueMetadata *a3@<X2>, _QWORD *a4@<X3>, _BYTE *a5@<X8>)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  ValueMetadata *v31;
  _QWORD *v32;
  uint64_t v33;
  ValueMetadata *v34;
  char v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  char v39;
  ValueMetadata *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t DynamicType;
  uint64_t v51;
  uint64_t v52;
  ValueMetadata *v53;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v55;
  uint64_t *v56;
  _QWORD v57[2];
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  __int128 v64;
  char *v65;
  char *v66;
  ValueMetadata *v67;
  _BYTE *v68;
  __int128 v69;
  ValueMetadata *MetatypeMetadata;
  uint64_t v71[3];
  ValueMetadata *v72;
  uint64_t v73;
  char v74;

  v68 = a5;
  v67 = a3;
  *(_QWORD *)&v64 = *a4;
  v7 = a2 & 1;
  v8 = sub_222AAD598();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v65 = (char *)v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v66 = (char *)v57 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v62 = (uint64_t)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v57 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v57 - v18;
  v20 = type metadata accessor for State();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = a1;
  v24 = *a1;
  if (*(_QWORD *)(v24 + 16))
  {
    v25 = v7;
    v26 = sub_222A8B258(v7);
    if ((v27 & 1) != 0)
    {
      sub_222A78EE0(*(_QWORD *)(v24 + 56) + *(_QWORD *)(v21 + 72) * v26, (uint64_t)v19);
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
      v29 = v19;
      v30 = 0;
    }
    else
    {
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
      v29 = v19;
      v30 = 1;
    }
    v31 = (ValueMetadata *)v20;
    v28(v29, v30, 1, v20);
  }
  else
  {
    v25 = v7;
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v28(v19, 1, 1, v20);
    v31 = (ValueMetadata *)v20;
  }
  sub_222A80648((uint64_t)v19, (uint64_t)v17);
  v32 = a4;
  if ((*(unsigned int (**)(char *, uint64_t, ValueMetadata *))(v21 + 48))(v17, 1, v31) == 1)
  {
    v33 = (uint64_t)v23;
    swift_storeEnumTagMultiPayload();
    sub_222A7DCD0((uint64_t)v17, &qword_2540C7E30);
  }
  else
  {
    v33 = (uint64_t)v23;
    sub_222A7A688((uint64_t)v17, (uint64_t)v23);
  }
  v34 = v67;
  _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v33, (uint64_t)v67);
  if ((v35 & 1) != 0)
  {
    result = sub_222A759F4(v33, (uint64_t (*)(_QWORD))type metadata accessor for State);
    *v68 = 1;
  }
  else
  {
    v67 = v31;
    v37 = a4[8];
    v38 = a4[9];
    __swift_project_boxed_opaque_existential_1(a4 + 5, v37);
    v39 = v25;
    v74 = v25;
    (*(void (**)(__int128 *__return_ptr, char *, ValueMetadata *, uint64_t, uint64_t))(v38 + 8))(&v69, &v74, v34, v37, v38);
    if (MetatypeMetadata)
    {
      sub_222A80690(&v69, (uint64_t)v71);
      v40 = v72;
      v41 = v73;
      __swift_project_boxed_opaque_existential_1(v71, (uint64_t)v72);
      if (((*(uint64_t (**)(uint64_t, ValueMetadata *, ValueMetadata *, uint64_t))(v41 + 8))(v33, v34, v40, v41) & 1) != 0)
      {
        v42 = v62;
        sub_222A7BFA8(v33, v62);
        v28((char *)v42, 0, 1, (uint64_t)v67);
        sub_222AA9A84(v42, v25);
        sub_222A759F4(v33, (uint64_t (*)(_QWORD))type metadata accessor for State);
        *v68 = 1;
      }
      else
      {
        v63 = v32 + 10;
        v58 = (_QWORD *)v32[13];
        v59 = v32[14];
        v57[1] = __swift_project_boxed_opaque_existential_1(v32 + 10, (uint64_t)v58);
        v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
        v46 = *(_QWORD *)(sub_222AAD5B0() - 8);
        v47 = *(_QWORD *)(v46 + 72);
        v48 = *(unsigned __int8 *)(v46 + 80);
        v57[0] = v47;
        v60 = (v48 + 32) & ~v48;
        v61 = v48 | 7;
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
        sub_222AAD58C();
        sub_222AAD580();
        MetatypeMetadata = (ValueMetadata *)v64;
        *(_QWORD *)&v69 = v32;
        swift_retain();
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD58C();
        sub_222AAD580();
        v49 = v32[2];
        MetatypeMetadata = &type metadata for AdamID;
        *(_QWORD *)&v69 = v49;
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        MetatypeMetadata = &type metadata for App.Kind;
        LOBYTE(v69) = v39;
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        __swift_project_boxed_opaque_existential_1(v71, (uint64_t)v72);
        DynamicType = swift_getDynamicType();
        MetatypeMetadata = (ValueMetadata *)swift_getMetatypeMetadata();
        *(_QWORD *)&v69 = DynamicType;
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD6A0();
        swift_bridgeObjectRelease();
        v51 = v32[13];
        v59 = v32[14];
        v58 = __swift_project_boxed_opaque_existential_1(v63, v51);
        v65 = (char *)(v60 + v57[0]);
        v52 = swift_allocObject();
        v64 = xmmword_222AAE880;
        *(_OWORD *)(v52 + 16) = xmmword_222AAE880;
        sub_222AAD58C();
        sub_222AAD580();
        v53 = v67;
        MetatypeMetadata = v67;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v69);
        sub_222A78EE0(v33, (uint64_t)boxed_opaque_existential_0);
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD6A0();
        swift_bridgeObjectRelease();
        v55 = v32[13];
        v59 = v32[14];
        __swift_project_boxed_opaque_existential_1(v63, v55);
        *(_OWORD *)(swift_allocObject() + 16) = v64;
        sub_222AAD58C();
        sub_222AAD580();
        MetatypeMetadata = v53;
        v56 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v69);
        sub_222A78EE0((uint64_t)v34, (uint64_t)v56);
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)&v69, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD6A0();
        swift_bridgeObjectRelease();
        sub_222A759F4(v33, (uint64_t (*)(_QWORD))type metadata accessor for State);
        *v68 = 0;
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
    }
    else
    {
      sub_222A7DCD0((uint64_t)&v69, &qword_255768970);
      v43 = v32[13];
      v63 = (_QWORD *)v32[14];
      v62 = (uint64_t)__swift_project_boxed_opaque_existential_1(v32 + 10, v43);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
      sub_222AAD5B0();
      v61 = v33;
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
      sub_222AAD58C();
      sub_222AAD580();
      v72 = (ValueMetadata *)v64;
      v71[0] = (uint64_t)v32;
      swift_retain();
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v71, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      sub_222AAD5A4();
      sub_222AAD58C();
      sub_222AAD580();
      v44 = v32[2];
      v72 = &type metadata for AdamID;
      v71[0] = v44;
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v71, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      v72 = &type metadata for App.Kind;
      LOBYTE(v71[0]) = v25;
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v71, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      v72 = v67;
      v45 = __swift_allocate_boxed_opaque_existential_0(v71);
      sub_222A78EE0((uint64_t)v34, (uint64_t)v45);
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v71, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      sub_222AAD5A4();
      sub_222AAD6A0();
      swift_bridgeObjectRelease();
      result = sub_222A759F4(v61, (uint64_t (*)(_QWORD))type metadata accessor for State);
      *v68 = 0;
    }
  }
  return result;
}

uint64_t sub_222A7EF70@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  char v7;
  uint64_t v8;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(__int128 *__return_ptr, char *, uint64_t, uint64_t, uint64_t);
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  _BYTE *v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;
  char v50;

  v44 = a5;
  v42 = a1;
  v7 = a3 & 1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - v12;
  v43 = type metadata accessor for State();
  v14 = *(_QWORD *)(v43 - 8);
  v15 = MEMORY[0x24BDAC7A8](v43);
  v39 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v40 = (char *)&v38 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v38 - v19;
  v21 = a2[8];
  v22 = a2[9];
  __swift_project_boxed_opaque_existential_1(a2 + 5, v21);
  v50 = v7;
  v23 = *(void (**)(__int128 *__return_ptr, char *, uint64_t, uint64_t, uint64_t))(v22 + 8);
  v41 = a4;
  v23(&v45, &v50, a4, v21, v22);
  if (v46)
  {
    v24 = v44;
    sub_222A80690(&v45, (uint64_t)v47);
    v25 = *v42;
    if (*(_QWORD *)(*v42 + 16))
    {
      v26 = sub_222A8B258(v7);
      v27 = v43;
      if ((v28 & 1) != 0)
      {
        sub_222A78EE0(*(_QWORD *)(v25 + 56) + *(_QWORD *)(v14 + 72) * v26, (uint64_t)v13);
        v29 = 0;
      }
      else
      {
        v29 = 1;
      }
    }
    else
    {
      v29 = 1;
      v27 = v43;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, v29, 1, v27);
    sub_222A80648((uint64_t)v13, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v27) == 1)
    {
      swift_storeEnumTagMultiPayload();
      sub_222A7DCD0((uint64_t)v11, &qword_2540C7E30);
    }
    else
    {
      sub_222A7A688((uint64_t)v11, (uint64_t)v20);
    }
    v32 = (uint64_t)v40;
    v31 = v41;
    v33 = v48;
    v34 = v49;
    __swift_project_boxed_opaque_existential_1(v47, v48);
    LOBYTE(v33) = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 8))(v20, v31, v33, v34);
    sub_222A78EE0((uint64_t)v20, v32);
    if ((v33 & 1) != 0)
    {
      v35 = 1;
    }
    else
    {
      v36 = (uint64_t)v39;
      swift_storeEnumTagMultiPayload();
      _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v32, v36);
      v35 = v37;
      sub_222A759F4(v36, (uint64_t (*)(_QWORD))type metadata accessor for State);
    }
    sub_222A759F4(v32, (uint64_t (*)(_QWORD))type metadata accessor for State);
    sub_222A759F4((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for State);
    *v24 = v35 & 1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  }
  else
  {
    result = sub_222A7DCD0((uint64_t)&v45, &qword_255768970);
    *v44 = 0;
  }
  return result;
}

uint64_t sub_222A7F26C(uint64_t a1, char a2, uint64_t a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = a2 & 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A78EE0(a3, (uint64_t)v7);
  v8 = type metadata accessor for State();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  return sub_222AA9A84((uint64_t)v7, v4);
}

uint64_t sub_222A7F324(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  _BYTE v13[16];

  v3 = type metadata accessor for AppStateMachine.StateChange();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *a1;
  swift_storeEnumTagMultiPayload();
  v10 = *(os_unfair_lock_s **)(v1 + 32);
  swift_retain();
  os_unfair_lock_lock(v10 + 6);
  sub_222A7F26C((uint64_t)&v10[4], v9, (uint64_t)v8);
  os_unfair_lock_unlock(v10 + 6);
  swift_release();
  v11 = *(_QWORD *)(v1 + 16);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)v5 = v11;
  v5[8] = v9;
  sub_222AAD538();
  sub_222A759F4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for AppStateMachine.StateChange);
  return sub_222A759F4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for State);
}

uint64_t sub_222A7F47C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppStateMachine()
{
  return objc_opt_self();
}

_QWORD *sub_222A7F4D8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v11;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v5 = *(int *)(a3 + 24);
    v6 = (_QWORD *)(a1 + v5);
    v7 = (uint64_t *)((char *)a2 + v5);
    v8 = type metadata accessor for State();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *v6 = *v7;
      v13 = (int *)type metadata accessor for AppInstallation(0);
      v14 = v13[5];
      v15 = (_QWORD *)((char *)v6 + v14);
      v16 = (_QWORD *)((char *)v7 + v14);
      v17 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          v18 = sub_222AAD4B4();
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
          v19 = type metadata accessor for AppInstallation.Progress(0);
          *(_QWORD *)((char *)v15 + *(int *)(v19 + 20)) = *(_QWORD *)((char *)v16 + *(int *)(v19 + 20));
          v20 = *(int *)(v19 + 24);
          v21 = *(void **)((char *)v16 + v20);
          *(_QWORD *)((char *)v15 + v20) = v21;
          v22 = v21;
          goto LABEL_14;
        case 3u:
          *v15 = *v16;
          swift_retain();
LABEL_14:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
          break;
      }
      v23 = v13[6];
      v24 = (char *)v6 + v23;
      v25 = (char *)v7 + v23;
      v26 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
      v27 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v24[*(int *)(v27 + 20)] = *(_QWORD *)&v25[*(int *)(v27 + 20)];
      v28 = *(int *)(v27 + 24);
      v29 = *(void **)&v25[v28];
      *(_QWORD *)&v24[v28] = v29;
      *((_BYTE *)v6 + v13[7]) = *((_BYTE *)v7 + v13[7]);
      *(_QWORD *)((char *)v6 + v13[8]) = *(_QWORD *)((char *)v7 + v13[8]);
      *((_BYTE *)v6 + v13[9]) = *((_BYTE *)v7 + v13[9]);
      *(_QWORD *)((char *)v6 + v13[10]) = *(_QWORD *)((char *)v7 + v13[10]);
      v30 = v29;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      v10 = v7[1];
      *v6 = *v7;
      v6[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
  }
  return v3;
}

void sub_222A7F80C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int EnumCaseMultiPayload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1 + *(int *)(a2 + 24);
  type metadata accessor for State();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    swift_release();
    v4 = type metadata accessor for AppInstallation(0);
    v5 = v2 + *(int *)(v4 + 20);
    type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v6 = sub_222AAD4B4();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

        break;
      case 3u:
        swift_release();
        break;
      default:
        break;
    }
    v7 = v2 + *(int *)(v4 + 24);
    v8 = sub_222AAD4B4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  }
  else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_222A7F948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (_QWORD *)(a1 + v4);
  v6 = (_QWORD *)(a2 + v4);
  v7 = type metadata accessor for State();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    *v5 = *v6;
    v10 = (int *)type metadata accessor for AppInstallation(0);
    v11 = v10[5];
    v12 = (_QWORD *)((char *)v5 + v11);
    v13 = (_QWORD *)((char *)v6 + v11);
    v14 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        v15 = sub_222AAD4B4();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
        v16 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)((char *)v12 + *(int *)(v16 + 20)) = *(_QWORD *)((char *)v13 + *(int *)(v16 + 20));
        v17 = *(int *)(v16 + 24);
        v18 = *(void **)((char *)v13 + v17);
        *(_QWORD *)((char *)v12 + v17) = v18;
        v19 = v18;
        goto LABEL_11;
      case 3u:
        *v12 = *v13;
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
        break;
    }
    v20 = v10[6];
    v21 = (char *)v5 + v20;
    v22 = (char *)v6 + v20;
    v23 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    v24 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v21[*(int *)(v24 + 20)] = *(_QWORD *)&v22[*(int *)(v24 + 20)];
    v25 = *(int *)(v24 + 24);
    v26 = *(void **)&v22[v25];
    *(_QWORD *)&v21[v25] = v26;
    *((_BYTE *)v5 + v10[7]) = *((_BYTE *)v6 + v10[7]);
    *(_QWORD *)((char *)v5 + v10[8]) = *(_QWORD *)((char *)v6 + v10[8]);
    *((_BYTE *)v5 + v10[9]) = *((_BYTE *)v6 + v10[9]);
    *(_QWORD *)((char *)v5 + v10[10]) = *(_QWORD *)((char *)v6 + v10[10]);
    v27 = v26;
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    v9 = v6[1];
    *v5 = *v6;
    v5[1] = v9;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  return a1;
}

uint64_t sub_222A7FC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 24);
    v5 = (_QWORD *)(a1 + v4);
    v6 = (_QWORD *)(a2 + v4);
    sub_222A759F4(a1 + v4, (uint64_t (*)(_QWORD))type metadata accessor for State);
    v7 = type metadata accessor for State();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *v5 = *v6;
      v9 = (int *)type metadata accessor for AppInstallation(0);
      v10 = v9[5];
      v11 = (_QWORD *)((char *)v5 + v10);
      v12 = (_QWORD *)((char *)v6 + v10);
      v13 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          v14 = sub_222AAD4B4();
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
          v15 = type metadata accessor for AppInstallation.Progress(0);
          *(_QWORD *)((char *)v11 + *(int *)(v15 + 20)) = *(_QWORD *)((char *)v12 + *(int *)(v15 + 20));
          v16 = *(int *)(v15 + 24);
          v17 = *(void **)((char *)v12 + v16);
          *(_QWORD *)((char *)v11 + v16) = v17;
          v18 = v17;
          goto LABEL_12;
        case 3u:
          *v11 = *v12;
          swift_retain();
LABEL_12:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
          break;
      }
      v19 = v9[6];
      v20 = (char *)v5 + v19;
      v21 = (char *)v6 + v19;
      v22 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
      v23 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v20[*(int *)(v23 + 20)] = *(_QWORD *)&v21[*(int *)(v23 + 20)];
      v24 = *(int *)(v23 + 24);
      v25 = *(void **)&v21[v24];
      *(_QWORD *)&v20[v24] = v25;
      *((_BYTE *)v5 + v9[7]) = *((_BYTE *)v6 + v9[7]);
      *(_QWORD *)((char *)v5 + v9[8]) = *(_QWORD *)((char *)v6 + v9[8]);
      *((_BYTE *)v5 + v9[9]) = *((_BYTE *)v6 + v9[9]);
      *(_QWORD *)((char *)v5 + v9[10]) = *(_QWORD *)((char *)v6 + v9[10]);
      v26 = v25;
      goto LABEL_14;
    }
    if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      *v5 = *v6;
      v5[1] = v6[1];
      swift_bridgeObjectRetain();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_222A7FF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (_QWORD *)(a1 + v4);
  v6 = (_QWORD *)(a2 + v4);
  v7 = type metadata accessor for State();
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    *v5 = *v6;
    v8 = (int *)type metadata accessor for AppInstallation(0);
    v9 = v8[5];
    v10 = (char *)v5 + v9;
    v11 = (char *)v6 + v9;
    v12 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v13 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      v14 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v10[*(int *)(v14 + 20)] = *(_QWORD *)&v11[*(int *)(v14 + 20)];
      *(_QWORD *)&v10[*(int *)(v14 + 24)] = *(_QWORD *)&v11[*(int *)(v14 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    v15 = v8[6];
    v16 = (char *)v5 + v15;
    v17 = (char *)v6 + v15;
    v18 = sub_222AAD4B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
    v19 = type metadata accessor for AppInstallation.Progress(0);
    *(_QWORD *)&v16[*(int *)(v19 + 20)] = *(_QWORD *)&v17[*(int *)(v19 + 20)];
    *(_QWORD *)&v16[*(int *)(v19 + 24)] = *(_QWORD *)&v17[*(int *)(v19 + 24)];
    *((_BYTE *)v5 + v8[7]) = *((_BYTE *)v6 + v8[7]);
    *(_QWORD *)((char *)v5 + v8[8]) = *(_QWORD *)((char *)v6 + v8[8]);
    *((_BYTE *)v5 + v8[9]) = *((_BYTE *)v6 + v8[9]);
    *(_QWORD *)((char *)v5 + v8[10]) = *(_QWORD *)((char *)v6 + v8[10]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_222A801E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 24);
    v5 = (_QWORD *)(a1 + v4);
    v6 = (_QWORD *)(a2 + v4);
    sub_222A759F4(a1 + v4, (uint64_t (*)(_QWORD))type metadata accessor for State);
    v7 = type metadata accessor for State();
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      *v5 = *v6;
      v8 = (int *)type metadata accessor for AppInstallation(0);
      v9 = v8[5];
      v10 = (char *)v5 + v9;
      v11 = (char *)v6 + v9;
      v12 = type metadata accessor for AppInstallation.Phase(0);
      if (swift_getEnumCaseMultiPayload() > 2)
      {
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v13 = sub_222AAD4B4();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
        v14 = type metadata accessor for AppInstallation.Progress(0);
        *(_QWORD *)&v10[*(int *)(v14 + 20)] = *(_QWORD *)&v11[*(int *)(v14 + 20)];
        *(_QWORD *)&v10[*(int *)(v14 + 24)] = *(_QWORD *)&v11[*(int *)(v14 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      v15 = v8[6];
      v16 = (char *)v5 + v15;
      v17 = (char *)v6 + v15;
      v18 = sub_222AAD4B4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      v19 = type metadata accessor for AppInstallation.Progress(0);
      *(_QWORD *)&v16[*(int *)(v19 + 20)] = *(_QWORD *)&v17[*(int *)(v19 + 20)];
      *(_QWORD *)&v16[*(int *)(v19 + 24)] = *(_QWORD *)&v17[*(int *)(v19 + 24)];
      *((_BYTE *)v5 + v8[7]) = *((_BYTE *)v6 + v8[7]);
      *(_QWORD *)((char *)v5 + v8[8]) = *(_QWORD *)((char *)v6 + v8[8]);
      *((_BYTE *)v5 + v8[9]) = *((_BYTE *)v6 + v8[9]);
      *(_QWORD *)((char *)v5 + v8[10]) = *(_QWORD *)((char *)v6 + v8[10]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_222A80470()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_222A8047C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for State();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_222A804F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_222A804FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 8) = a2 + 1;
  }
  else
  {
    v7 = type metadata accessor for State();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AppStateMachine.StateChange()
{
  uint64_t result;

  result = qword_2540C7ED0;
  if (!qword_2540C7ED0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_222A805A8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for State();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_222A80628()
{
  return sub_222A7E3E4();
}

uint64_t sub_222A80648(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A80690(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t dispatch thunk of AppStateRule.canMove(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AppStateRules.rule(forKind:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

BOOL static AppStoreType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppStoreType.hash(into:)()
{
  return sub_222AADB8C();
}

uint64_t AppStoreType.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

BOOL sub_222A80738(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_222A80750()
{
  unint64_t result;

  result = qword_255768978;
  if (!qword_255768978)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AppStoreType, &type metadata for AppStoreType);
    atomic_store(result, (unint64_t *)&qword_255768978);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AppStoreType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A807E0 + 4 * byte_222AAF61D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_222A80814 + 4 * byte_222AAF618[v4]))();
}

uint64_t sub_222A80814(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A8081C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A80824);
  return result;
}

uint64_t sub_222A80830(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A80838);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_222A8083C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A80844(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreType()
{
  return &type metadata for AppStoreType;
}

void ArcadeEntitlementRefreshCondition.description.getter()
{
  __asm { BR              X10 }
}

unint64_t sub_222A80890()
{
  sub_222AADA00();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  return 0xD00000000000002ALL;
}

void ArcadeEntitlementRefreshCondition.hash(into:)()
{
  __asm { BR              X11 }
}

uint64_t sub_222A80A14()
{
  sub_222AADB8C();
  return sub_222AADB98();
}

void ArcadeEntitlementRefreshCondition.hashValue.getter()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_222AADB80();
  __asm { BR              X10 }
}

uint64_t sub_222A80AA8()
{
  sub_222AADB8C();
  sub_222AADB98();
  return sub_222AADBB0();
}

void sub_222A80B28()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_222AADB80();
  __asm { BR              X10 }
}

uint64_t sub_222A80B60()
{
  sub_222AADB8C();
  sub_222AADB98();
  return sub_222AADBB0();
}

uint64_t _s8AppState33ArcadeEntitlementRefreshConditionO2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1)
{
  return ((uint64_t (*)(void))((char *)sub_222A80BFC + 4 * byte_222AAF6C0[*a1 >> 6]))();
}

uint64_t sub_222A80BFC@<X0>(unsigned int a1@<W8>)
{
  char v1;

  if (a1 < 0x40)
    return (((v1 & 1) == 0) ^ a1) & 1;
  else
    return 0;
}

unint64_t sub_222A80C6C()
{
  unint64_t result;

  result = qword_255768980;
  if (!qword_255768980)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for ArcadeEntitlementRefreshCondition, &type metadata for ArcadeEntitlementRefreshCondition);
    atomic_store(result, (unint64_t *)&qword_255768980);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArcadeEntitlementRefreshCondition(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7D)
    goto LABEL_17;
  if (a2 + 131 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 131) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 131;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 131;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 131;
  }
LABEL_17:
  v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7C)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for ArcadeEntitlementRefreshCondition(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 131 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 131) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7D)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7C)
    return ((uint64_t (*)(void))((char *)&loc_222A80D9C + 4 * byte_222AAF6C9[v4]))();
  *a1 = a2 - 125;
  return ((uint64_t (*)(void))((char *)sub_222A80DD0 + 4 * byte_222AAF6C4[v4]))();
}

uint64_t sub_222A80DD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A80DD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A80DE0);
  return result;
}

uint64_t sub_222A80DF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A80E00);
  *(_BYTE *)result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_222A80E04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A80E0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A80E18(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *a1;
  v2 = v1 >> 6;
  v3 = (v1 & 1) + 3;
  if (v2 == 3)
    return v3;
  else
    return v2;
}

_BYTE *sub_222A80E34(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_222A80E44(_BYTE *result, unsigned int a2)
{
  if (a2 < 3)
    *result = *result & 1 | ((_BYTE)a2 << 6);
  else
    *result = a2 & 1 ^ 0xC1;
  return result;
}

ValueMetadata *type metadata accessor for ArcadeEntitlementRefreshCondition()
{
  return &type metadata for ArcadeEntitlementRefreshCondition;
}

BOOL static ArcadeIntroOfferState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ArcadeIntroOfferState.hash(into:)()
{
  return sub_222AADB8C();
}

uint64_t ArcadeIntroOfferState.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADB8C();
  return sub_222AADBB0();
}

unint64_t sub_222A80F04()
{
  unint64_t result;

  result = qword_255768988;
  if (!qword_255768988)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for ArcadeIntroOfferState, &type metadata for ArcadeIntroOfferState);
    atomic_store(result, (unint64_t *)&qword_255768988);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArcadeIntroOfferState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ArcadeIntroOfferState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222A81024 + 4 * byte_222AAF7B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_222A81058 + 4 * byte_222AAF7B0[v4]))();
}

uint64_t sub_222A81058(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A81060(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222A81068);
  return result;
}

uint64_t sub_222A81074(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222A8107CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_222A81080(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222A81088(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArcadeIntroOfferState()
{
  return &type metadata for ArcadeIntroOfferState;
}

void static ArcadeState.default.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 3;
}

void ArcadeState.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_222A81104()
{
  sub_222AADA00();
  sub_222AAD7D8();
  sub_222AADA78();
  return 0;
}

void static ArcadeState.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

BOOL sub_222A81254()
{
  void *v0;
  _BOOL4 v1;
  void *v2;
  char v3;

  if (v1)
  {
    sub_222A81464(v0, v1);
    sub_222A81484(v2, v3);
    sub_222A81484(v0, v1);
    LOBYTE(v1) = 0;
  }
  else
  {
    sub_222A81484(v2, 0);
    sub_222A81484(v0, 0);
    return v0 == v2;
  }
  return v1;
}

id sub_222A81464(id result, char a2)
{
  if (a2 == 2)
    return result;
  if (a2 == 1)
    return (id)swift_retain();
  return result;
}

void sub_222A81484(void *a1, char a2)
{
  if (a2 == 2)
  {

  }
  else if (a2 == 1)
  {
    swift_release();
  }
}

unint64_t sub_222A814A4()
{
  unint64_t result;

  result = qword_2540C81B8;
  if (!qword_2540C81B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C81B8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ArcadeState(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_222A81464(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for ArcadeState(uint64_t a1)
{
  sub_222A81484(*(void **)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for ArcadeState(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_222A81464(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_222A81484(v5, v6);
  return a1;
}

uint64_t assignWithTake for ArcadeState(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  char v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_222A81484(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArcadeState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArcadeState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_222A81654(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_222A8165C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArcadeState()
{
  return &type metadata for ArcadeState;
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.subscriptionState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.onSubscriptionStateChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_222A81710()
{
  if (qword_2540C7588 != -1)
    swift_once();
  return sub_222A723C0((uint64_t)&qword_2540C8DC8, (uint64_t)&unk_2540C8DF0);
}

uint64_t ASDArcadeSubscriptionManager.__allocating_init(objectGraph:requestingBundleID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  _BYTE v24[40];

  v21 = a2;
  v22 = a3;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7558);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD658();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7548);
  sub_222AAD604();
  sub_222AAD6AC();
  sub_222AAD6AC();
  v11 = (void *)sub_222AAD7A8();
  sub_222AAD64C();

  sub_222AAD640();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v12 = v23[0];
  v13 = v23[1];
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  sub_222A723C0((uint64_t)v24, (uint64_t)v23);
  v15 = (void *)objc_opt_self();
  v16 = v14;
  v17 = objc_msgSend(v15, sel_defaultCenter);
  v18 = swift_allocObject();
  v19 = sub_222A8408C(v12, v13, (uint64_t)v16, (uint64_t)v23, v21, v22, v17, v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t ASDArcadeSubscriptionManager.deinit()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 128), sel_removeObserver_, v0);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  swift_bridgeObjectRelease();

  swift_release();
  sub_222A81484(*(void **)(v0 + 144), *(_BYTE *)(v0 + 152));
  swift_release();
  return v0;
}

uint64_t ASDArcadeSubscriptionManager.__deallocating_deinit()
{
  ASDArcadeSubscriptionManager.deinit();
  return swift_deallocClassInstance();
}

id ASDArcadeSubscriptionManager.subscriptionState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  char v4;

  swift_beginAccess();
  v3 = *(void **)(v1 + 144);
  *(_QWORD *)a1 = v3;
  v4 = *(_BYTE *)(v1 + 152);
  *(_BYTE *)(a1 + 8) = v4;
  return sub_222A81464(v3, v4);
}

void sub_222A81A58(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v2 = *(void **)a1;
  v3 = *a2;
  v4 = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  v5 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;
  v6 = *(_BYTE *)(v3 + 152);
  *(_BYTE *)(v3 + 152) = v4;
  sub_222A81464(v2, v4);
  sub_222A81464(v5, v6);
  sub_222A81484(v5, v6);
  v7 = v5;
  v8 = v6;
  sub_222A81B84((uint64_t)&v7);
  sub_222A81484(v5, v6);
}

void ASDArcadeSubscriptionManager.subscriptionState.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  char v6;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  swift_beginAccess();
  v4 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = v2;
  LOBYTE(v2) = *(_BYTE *)(v1 + 152);
  *(_BYTE *)(v1 + 152) = v3;
  sub_222A81464(v4, v2);
  sub_222A81484(v4, v2);
  v5 = v4;
  v6 = v2;
  sub_222A81B84((uint64_t)&v5);
  sub_222A81484(v4, v2);
}

void sub_222A81B84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  ValueMetadata *v13;
  void *v14;
  char v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v4);
  v5 = *(void **)a1;
  LOBYTE(a1) = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  v6 = *(_BYTE *)(v2 + 152);
  v14 = *(void **)(v2 + 144);
  v15 = v6;
  v11 = v5;
  v12 = a1;
  static ArcadeState.== infix(_:_:)((uint64_t)&v14);
  if ((v7 & 1) == 0)
  {
    v8 = *(void **)(v2 + 144);
    v9 = *(_BYTE *)(v2 + 152);
    v14 = v8;
    v15 = v9;
    sub_222A81464(v8, v9);
    sub_222AAD538();
    sub_222A81484(v8, v9);
    if (qword_2540C7278 != -1)
      swift_once();
    sub_222A723C0((uint64_t)&unk_2540C8DF0, (uint64_t)&v14);
    __swift_project_boxed_opaque_existential_1(&v14, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
    sub_222AAD5B0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
    sub_222AAD58C();
    sub_222AAD580();
    v10 = *(void **)(v2 + 144);
    v13 = &type metadata for ArcadeState;
    v11 = v10;
    v12 = *(_BYTE *)(v2 + 152);
    sub_222A81464(v10, v12);
    sub_222AAD55C();
    sub_222A7DCD0((uint64_t)&v11, (uint64_t *)&unk_2540C8268);
    sub_222AAD580();
    sub_222AAD5A4();
    sub_222AAD688();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  }
}

void (*ASDArcadeSubscriptionManager.subscriptionState.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  char v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = *(void **)(v1 + 144);
  v3[3] = v4;
  v5 = *(_BYTE *)(v1 + 152);
  *((_BYTE *)v3 + 32) = v5;
  sub_222A81464(v4, v5);
  return sub_222A81E1C;
}

void sub_222A81E1C(uint64_t *a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v3 = *a1;
  v4 = *(void **)(*a1 + 24);
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_BYTE *)(v3 + 32);
  v7 = *(void **)(v5 + 144);
  v8 = *(_BYTE *)(v5 + 152);
  *(_QWORD *)(v5 + 144) = v4;
  *(_BYTE *)(v5 + 152) = v6;
  if ((a2 & 1) != 0)
  {
    sub_222A81464(v4, v6);
    sub_222A81464(v7, v8);
    sub_222A81484(v7, v8);
    v11 = v7;
    v12 = v8;
    sub_222A81B84((uint64_t)&v11);
    sub_222A81484(v7, v8);
    v9 = *(void **)(v3 + 24);
    v10 = *(_BYTE *)(v3 + 32);
  }
  else
  {
    sub_222A81464(v7, v8);
    sub_222A81484(v7, v8);
    v11 = v7;
    v12 = v8;
    sub_222A81B84((uint64_t)&v11);
    v9 = v7;
    v10 = v8;
  }
  sub_222A81484(v9, v10);
  free((void *)v3);
}

uint64_t ASDArcadeSubscriptionManager.onSubscriptionStateChange.getter()
{
  return swift_retain();
}

uint64_t sub_222A81EF8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v1 = v0;
  v15 = *v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v5);
  if (qword_2540C7278 != -1)
    swift_once();
  sub_222A723C0((uint64_t)&unk_2540C8DF0, (uint64_t)v17);
  v14[1] = v17[4];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v6 = (void *)sub_222AAD388();
  v7 = sub_222AAD7B4();
  v9 = v8;

  v16[3] = MEMORY[0x24BEE0D00];
  v16[0] = v7;
  v16[1] = v9;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v16, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD694();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  v10 = sub_222AAD8A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v12 = v15;
  v11[4] = v1;
  v11[5] = v12;
  swift_retain();
  sub_222A9ACB8((uint64_t)v4, (uint64_t)&unk_2557689B8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_222A82170()
{
  uint64_t v0;
  _QWORD *v1;

  sub_222AAD598();
  *(_QWORD *)(v0 + 136) = swift_task_alloc();
  *(_BYTE *)(v0 + 121) = 0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_222A821F8;
  return ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(v0 + 112, (_BYTE *)(v0 + 121));
}

uint64_t sub_222A821F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_222A81484(*(void **)(v2 + 112), *(_BYTE *)(v2 + 120));
  return swift_task_switch();
}

uint64_t sub_222A82268()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A82298()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_0;

  if (qword_2540C7278 != -1)
    swift_once();
  v1 = *(void **)(v0 + 152);
  sub_222A723C0((uint64_t)qword_2540C8DF0, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  swift_getErrorValue();
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 80) = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_0, v2, v3);
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1, _BYTE *a2)
{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 352) = a1;
  *(_QWORD *)(v3 + 360) = v2;
  *(_QWORD *)(v3 + 368) = *v2;
  sub_222AAD598();
  *(_QWORD *)(v3 + 376) = swift_task_alloc();
  *(_QWORD *)(v3 + 384) = swift_task_alloc();
  *(_QWORD *)(v3 + 392) = swift_task_alloc();
  *(_BYTE *)(v3 + 345) = *a2;
  return swift_task_switch();
}

void sub_222A824E4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  if (qword_2540C7278 != -1)
    swift_once();
  v1 = *(_BYTE *)(v0 + 345);
  v2 = *(_QWORD *)(v0 + 360);
  sub_222A723C0((uint64_t)qword_2540C8DF0, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF8F0;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 304) = &type metadata for ArcadeEntitlementRefreshCondition;
  *(_BYTE *)(v0 + 280) = v1;
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 280, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  swift_beginAccess();
  v3 = *(void **)(v2 + 144);
  v4 = *(_BYTE *)(v2 + 152);
  *(_QWORD *)(v0 + 272) = &type metadata for ArcadeState;
  *(_QWORD *)(v0 + 248) = v3;
  *(_BYTE *)(v0 + 256) = v4;
  sub_222A81464(v3, v4);
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 248, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v5 = *(_QWORD *)(v2 + 24);
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v0 + 360) + 16);
    *(_QWORD *)(v0 + 240) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 216) = v6;
    *(_QWORD *)(v0 + 224) = v5;
    v7 = v0 + 216;
  }
  else
  {
    v7 = v0 + 216;
    *(_OWORD *)(v0 + 216) = 0u;
    *(_OWORD *)(v0 + 232) = 0u;
  }
  v8 = *(unsigned __int8 *)(v0 + 345);
  swift_bridgeObjectRetain();
  sub_222AAD574();
  sub_222A7DCD0(v7, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __asm { BR              X10 }
}

uint64_t sub_222A82CA8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A82CFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_BYTE *)(v0 + 344);
  v4 = *(os_unfair_lock_s **)(v1 + 136);
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v2;
  *(_BYTE *)(v5 + 32) = v3;
  os_unfair_lock_lock(v4 + 4);
  sub_222A83F20(v6, *(_QWORD *)(v5 + 16), *(void **)(v5 + 24), *(_BYTE *)(v5 + 32));
  v7 = *(_QWORD *)(v0 + 352);
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  swift_release();
  swift_task_dealloc();
  *(_QWORD *)v7 = v2;
  *(_BYTE *)(v7 + 8) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void (*sub_222A82EA4(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(int a1, char a2, char a3, void *a4)
{
  uint64_t v12;

  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a5;
  *(_QWORD *)(v12 + 32) = a2;
  *(_QWORD *)(v12 + 40) = a3;
  *(_QWORD *)(v12 + 48) = a4;
  *(_QWORD *)(v12 + 56) = a6;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_222A84584;
}

void sub_222A82F3C(int a1, char a2, char a3, id a4, char a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, int, int, id), uint64_t, uint64_t, uint64_t);
  id v18;

  if (!a4)
  {
    swift_bridgeObjectRetain();
    sub_222AAD700();
    swift_bridgeObjectRelease();
    return;
  }
  if ((a5 & 1) == 0 || (a2 & 1) == 0 || (a3 & 1) == 0)
  {
    v18 = a4;
    goto LABEL_11;
  }
  type metadata accessor for Code(0);
  v13 = a4;
  sub_222A845B4();
  if ((sub_222AAD40C() & 1) == 0)
  {
LABEL_11:
    sub_222AAD6E8();

    return;
  }
  if (qword_2540C7278 != -1)
    swift_once();
  __swift_project_boxed_opaque_existential_1(qword_2540C8DF0, qword_2540C8E08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD550();
  sub_222AAD550();
  sub_222AAD694();
  swift_bridgeObjectRelease();
  v14 = a6 + 4;
  v16 = a6[7];
  v15 = a6[8];
  __swift_project_boxed_opaque_existential_1(v14, v16);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, int, int, id), uint64_t, uint64_t, uint64_t))(v15 + 8);
  swift_retain();
  v17(1, 1, a7, a8, sub_222A845FC, a9, v16, v15);

  swift_release();
}

void sub_222A83178(int a1, int a2, int a3, id a4)
{
  id v5;

  if (a4)
  {
    v5 = a4;
    sub_222AAD6E8();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_222AAD700();
    swift_bridgeObjectRelease();
  }
}

void sub_222A83200(int a1, int a2, id a3)
{
  id v4;

  if (a3)
  {
    v4 = a3;
    sub_222AAD6E8();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_222AAD700();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_222A83288(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  void (*v12)(int, char, char, void *);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  if (*(_BYTE *)(a1 + 9) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
    v11 = sub_222AAD718();
    v12 = sub_222A82EA4(a3 & 1, a4, a5, v11, a2, a6);
    v14 = v13;
    v15 = (_QWORD *)(a2 + 32);
    v17 = *(_QWORD *)(a2 + 56);
    v16 = *(_QWORD *)(a2 + 64);
    __swift_project_boxed_opaque_existential_1(v15, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v16 + 8))(1, 1, a4, a5, v12, v14, v17, v16);
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
    swift_bridgeObjectRetain();
    return sub_222AAD6DC();
  }
  return v11;
}

uint64_t sub_222A833A4(uint64_t a1, _QWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11;
  BOOL v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(int, char, char, void *);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v11 = *(unsigned __int8 *)(a1 + 9);
  v12 = *(_BYTE *)(a1 + 8) != 1 || *(_QWORD *)a1 == 0;
  if (v12
    || (swift_retain(),
        v13 = swift_bridgeObjectRetain(),
        v14 = sub_222A84604(v13, a2),
        swift_release(),
        swift_bridgeObjectRelease(),
        !v14))
  {
    if (!v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
      swift_bridgeObjectRetain();
      return sub_222AAD6DC();
    }
  }
  else
  {

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
  v15 = sub_222AAD718();
  v16 = sub_222A82EA4(a3 & 1, a4, a5, v15, (uint64_t)a2, a6);
  v18 = v17;
  v19 = a2 + 4;
  v21 = a2[7];
  v20 = a2[8];
  __swift_project_boxed_opaque_existential_1(v19, v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v20 + 8))(1, 1, a4, a5, v16, v18, v21, v20);
  swift_release();
  return v15;
}

uint64_t sub_222A83510(uint64_t a1, _QWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(int, char, char, void *);
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v11 = *(unsigned __int8 *)(a1 + 9);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if (!*(_QWORD *)a1)
      goto LABEL_6;
    swift_retain();
    v12 = swift_bridgeObjectRetain();
    v13 = sub_222A84604(v12, a2);
    swift_release();
    swift_bridgeObjectRelease();
    if (!v13)
      goto LABEL_6;

  }
  if (!v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
    swift_bridgeObjectRetain();
    return sub_222AAD6DC();
  }
LABEL_6:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7570);
  v14 = sub_222AAD718();
  v15 = sub_222A82EA4(a3 & 1, a4, a5, v14, (uint64_t)a2, a6);
  v17 = v16;
  v18 = a2 + 4;
  v20 = a2[7];
  v19 = a2[8];
  __swift_project_boxed_opaque_existential_1(v18, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v19 + 8))(1, 1, a4, a5, v15, v17, v20, v19);
  swift_release();
  return v14;
}

uint64_t sub_222A83678(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void (*)(int, int, id), uint64_t, uint64_t, uint64_t);

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 8);
  v5 = *((_BYTE *)a1 + 9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7580);
  v6 = sub_222AAD718();
  v7 = a2 + 4;
  v9 = a2[7];
  v8 = a2[8];
  __swift_project_boxed_opaque_existential_1(v7, v9);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  *(_QWORD *)(v10 + 24) = v3;
  *(_BYTE *)(v10 + 32) = v4;
  *(_BYTE *)(v10 + 33) = v5;
  v11 = *(void (**)(void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v8 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(sub_222A84B24, v10, v9, v8);
  swift_release();
  return v6;
}

void sub_222A83740(int a1, int a2, id a3)
{
  id v4;

  if (a3)
  {
    v4 = a3;
    sub_222AAD6E8();

  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_222AAD700();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_222A837CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[31] = a1;
  v3[32] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  v3[33] = swift_task_alloc();
  sub_222AAD598();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7580);
  sub_222A841DC(&qword_2540C7578, &qword_2540C7580);
  v4 = (_QWORD *)swift_task_alloc();
  v3[37] = v4;
  *v4 = v3;
  v4[1] = sub_222A838C0;
  return sub_222AAD670();
}

uint64_t sub_222A838C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
    *(_OWORD *)(v2 + 312) = *(_OWORD *)(v2 + 216);
  return swift_task_switch();
}

uint64_t sub_222A83930()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;

  if (qword_2540C7278 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 312);
  sub_222A723C0((uint64_t)qword_2540C8DF0, v0 + 56);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  v20 = v1;
  if (v1)
  {
    v1 = *(_QWORD *)(v0 + 312);
    *(_QWORD *)(v0 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7598);
    *(_QWORD *)(v0 + 160) = v1;
  }
  else
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }
  v2 = *(_QWORD *)(v0 + 320);
  swift_bridgeObjectRetain();
  sub_222AAD574();
  sub_222A7DCD0(v0 + 160, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v19 = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 320);
    *(_QWORD *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75A0);
    *(_QWORD *)(v0 + 128) = v3;
  }
  else
  {
    v3 = 0;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
  }
  swift_bridgeObjectRetain();
  sub_222AAD574();
  sub_222A7DCD0(v0 + 128, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD694();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if (!v20)
  {
LABEL_15:
    if (v19)
    {
      v14 = *(_QWORD *)(v0 + 256);
      v15 = *(_QWORD *)(v14 + 24);
      if (v15)
      {
        v16 = *(_QWORD *)(v14 + 16);
        swift_bridgeObjectRetain();
        LOBYTE(v16) = sub_222A84954(v3, v16, v15);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
        {
          v13 = 0;
          v12 = 2;
          goto LABEL_22;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    v13 = 0;
    v12 = 1;
    goto LABEL_22;
  }
  v4 = *(_QWORD **)(v0 + 256);
  swift_bridgeObjectRetain();
  swift_retain();
  v5 = sub_222A84604(v1, v4);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v7 = *(_QWORD *)(v0 + 256);
  v6 = *(_QWORD *)(v0 + 264);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 72), *(_QWORD *)(v7 + 96));
  sub_222AAD5EC();
  v8 = sub_222AAD6D0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8);
  v11 = *(_QWORD *)(v0 + 264);
  if (v10 == 1)
  {
    sub_222A7DCD0(*(_QWORD *)(v0 + 264), &qword_2540C7560);
    v12 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_222AAD6C4();
    swift_release();
    v12 = *(_QWORD *)(v0 + 240);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  }
  v13 = 2;
LABEL_22:
  v17 = *(_QWORD *)(v0 + 248);
  *(_QWORD *)v17 = v12;
  *(_BYTE *)(v17 + 8) = v13;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A83D2C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v5;

  if (qword_2540C7278 != -1)
    swift_once();
  v1 = *(void **)(v0 + 304);
  sub_222A723C0((uint64_t)qword_2540C8DF0, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  swift_getErrorValue();
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 120) = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 96));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_0, v2, v3);
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 96, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v5 = *(_QWORD *)(v0 + 248);
  *(_QWORD *)v5 = 1;
  *(_BYTE *)(v5 + 8) = 3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_222A83F20(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  void *v7;
  char v8;
  void *v9;
  char v10;

  swift_beginAccess();
  v7 = *(void **)(a2 + 144);
  *(_QWORD *)(a2 + 144) = a3;
  v8 = *(_BYTE *)(a2 + 152);
  *(_BYTE *)(a2 + 152) = a4;
  sub_222A81464(a3, a4);
  sub_222A81464(v7, v8);
  sub_222A81484(v7, v8);
  v9 = v7;
  v10 = v8;
  sub_222A81B84((uint64_t)&v9);
  sub_222A81484(v7, v8);
}

id sub_222A83FCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;
  char v5;

  v3 = *v1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)a1 = v4;
  v5 = *(_BYTE *)(v3 + 152);
  *(_BYTE *)(a1 + 8) = v5;
  return sub_222A81464(v4, v5);
}

uint64_t sub_222A8401C()
{
  return swift_retain();
}

uint64_t sub_222A84028(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E0EC;
  return ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(a1, a2);
}

uint64_t sub_222A8408C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  id v16;
  uint64_t v17;
  _QWORD v19[5];

  v19[3] = sub_222A84B44();
  v19[4] = &off_24E975A98;
  v19[0] = a3;
  *(_QWORD *)(a8 + 16) = a1;
  *(_QWORD *)(a8 + 24) = a2;
  sub_222A723C0((uint64_t)v19, a8 + 32);
  sub_222A723C0(a4, a8 + 72);
  *(_QWORD *)(a8 + 112) = a5;
  *(_QWORD *)(a8 + 120) = a6;
  *(_QWORD *)(a8 + 128) = a7;
  *(_QWORD *)(a8 + 144) = 0;
  *(_BYTE *)(a8 + 152) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7538);
  swift_allocObject();
  v16 = a7;
  *(_QWORD *)(a8 + 160) = sub_222AAD544();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(_QWORD *)(a8 + 136) = v17;
  objc_msgSend(v16, sel_addObserver_selector_name_object_, a8, sel_entitlementsDidChange_, *MEMORY[0x24BE044D0], 0);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return a8;
}

void sub_222A841BC(int a1, int a2, id a3)
{
  sub_222A83200(a1, a2, a3);
}

uint64_t sub_222A841C4(uint64_t *a1)
{
  _QWORD *v1;

  return sub_222A83678(a1, v1);
}

uint64_t sub_222A841D0(uint64_t a1)
{
  return sub_222A84268(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_222A83510);
}

uint64_t sub_222A841DC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x227677FFC](MEMORY[0x24BE5E280], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_222A84220(uint64_t a1)
{
  return sub_222A84268(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_222A833A4);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_222A8425C(uint64_t a1)
{
  return sub_222A84268(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_222A83288);
}

uint64_t sub_222A84268(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

id sub_222A84280@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)a2 = v4;
  v5 = *(_BYTE *)(v3 + 152);
  *(_BYTE *)(a2 + 8) = v5;
  return sub_222A81464(v4, v5);
}

uint64_t type metadata accessor for ASDArcadeSubscriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ASDArcadeSubscriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for ASDArcadeSubscriptionManager.EntitlementsResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8AppState28ASDArcadeSubscriptionManagerC18EntitlementsResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 10))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASDArcadeSubscriptionManager.EntitlementsResult()
{
  return &type metadata for ASDArcadeSubscriptionManager.EntitlementsResult;
}

uint64_t sub_222A844AC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A844D8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A7E0EC;
  return sub_222A82170();
}

uint64_t sub_222A84550()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_222A84584(int a1, char a2, char a3, void *a4)
{
  uint64_t v4;

  sub_222A82F3C(a1, a2, a3, a4, *(_BYTE *)(v4 + 16), *(_QWORD **)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48));
}

unint64_t sub_222A845B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255768730;
  if (!qword_255768730)
  {
    type metadata accessor for Code(255);
    result = MEMORY[0x227677FFC](&unk_222AAE540, v1);
    atomic_store(result, (unint64_t *)&qword_255768730);
  }
  return result;
}

void sub_222A845FC(int a1, int a2, int a3, id a4)
{
  sub_222A83178(a1, a2, a3, a4);
}

_QWORD *sub_222A84604(unint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char *, uint64_t);
  char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7388);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_222AAD4B4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v35 = (char *)&v32 - v14;
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    v15 = sub_222AADA84();
    if (v15)
      goto LABEL_3;
  }
  else
  {
    v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15)
    {
LABEL_3:
      v33 = v10;
      v34 = v8;
      v32 = v3;
      v40 = a1 & 0xC000000000000001;
      v36 = a2[2];
      v37 = v15;
      v38 = a2[3];
      v39 = a1;
      v8 = 4;
      do
      {
        if (v40)
          v16 = (_QWORD *)MEMORY[0x227677A50](v8 - 4, a1);
        else
          v16 = *(id *)(a1 + 8 * v8);
        a2 = v16;
        v10 = v8 - 3;
        if (__OFADD__(v8 - 4, 1))
        {
          __break(1u);
          goto LABEL_26;
        }
        v17 = v38;
        if (v38)
        {
          v18 = objc_msgSend(v16, sel_familyID);
          v19 = objc_msgSend(v18, sel_stringValue);

          v20 = sub_222AAD7B4();
          v22 = v21;

          if (v20 == v36 && v17 == v22)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v3 = sub_222AADAD8();
            swift_bridgeObjectRelease();
            if ((v3 & 1) == 0)
              goto LABEL_4;
          }
          v24 = objc_msgSend(a2, sel_expiryDate, v32);
          if (!v24)
          {
            v26 = v34;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v34, 1, 1, v9);
LABEL_23:
            sub_222A7DCD0(v26, &qword_2540C7388);
LABEL_24:
            swift_bridgeObjectRelease();
            return a2;
          }
          v25 = v24;
          sub_222AAD49C();

          v27 = v33;
          v26 = v34;
          v28 = *(void (**)(uint64_t, char *, uint64_t))(v33 + 32);
          v28(v34, v13, v9);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(v26, 0, 1, v9);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v26, 1, v9) == 1)
            goto LABEL_23;
          v29 = v35;
          v28((uint64_t)v35, (char *)v26, v9);
          sub_222AAD4A8();
          v3 = sub_222AAD478();
          v30 = *(void (**)(char *, uint64_t))(v27 + 8);
          v30(v13, v9);
          v30(v29, v9);
          if ((v3 & 1) != 0)
            goto LABEL_24;
        }
LABEL_4:

        ++v8;
        a1 = v39;
      }
      while (v10 != v37);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_222A84954(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_222AADA84();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v9 = 4;
      while (1)
      {
        v10 = v9 - 4;
        if (v24)
        {
          v11 = (id)MEMORY[0x227677A50](v9 - 4, v7);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
            goto LABEL_19;
        }
        else
        {
          v11 = *(id *)(v7 + 8 * v9);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v11;
        v14 = a3;
        v15 = objc_msgSend(v11, sel_stringValue, v22);
        v16 = sub_222AAD7B4();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          v20 = 1;
          goto LABEL_22;
        }
        v20 = sub_222AADAD8();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          v8 = v12;
          v19 = v4 == v12;
          v7 = v23;
          if (!v19)
            continue;
        }
        goto LABEL_22;
      }
    }
  }
  v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

uint64_t sub_222A84AF8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_222A84B24(int a1, int a2, id a3)
{
  sub_222A83740(a1, a2, a3);
}

unint64_t sub_222A84B44()
{
  unint64_t result;

  result = qword_2540C75E0;
  if (!qword_2540C75E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C75E0);
  }
  return result;
}

void sub_222A84B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x227678158](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_retain(*(id *)(v4
                           + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));

    swift_beginAccess();
    v7 = (void *)MEMORY[0x227678158](v3);
    objc_msgSend(v6, sel_setObserver_, v7);

  }
}

uint64_t sub_222A84C24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_222A7418C(0, (unint64_t *)&qword_2540C81B0);
    v4 = sub_222AAD850();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_222A84D04()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;

  sub_222AADA00();
  swift_getObjectType();
  v1 = sub_222AADBBC();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));
  v3 = objc_msgSend(v2, sel_description);
  sub_222AAD7B4();

  sub_222AAD7D8();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  return v1;
}

id sub_222A84F30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ASDDeviceAppFetcher.init(regulatoryLogger:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_222A84FB8(a1, a2);
}

uint64_t sub_222A84FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C8030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id ASDDeviceAppFetcher.observeQuery(_:on:using:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  char v14;

  v7 = *((_BYTE *)a1 + 8);
  v13 = *a1;
  v14 = v7;
  sub_222A8BB80();
  v9 = v8;
  sub_222A723C0(a2, (uint64_t)&v13);
  v10 = objc_allocWithZone((Class)type metadata accessor for ASDDeviceAppFetcher.QueryObservation());
  swift_retain();
  v11 = sub_222A858EC(v9, (uint64_t)&v13, a3, a4);

  swift_release();
  return v11;
}

uint64_t type metadata accessor for ASDDeviceAppFetcher.QueryObservation()
{
  return objc_opt_self();
}

uint64_t ASDDeviceAppFetcher.fetchQuery(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v2 + 32) = v3;
  *(_BYTE *)(v2 + 64) = *((_BYTE *)a1 + 8);
  return swift_task_switch();
}

uint64_t sub_222A850F0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_BYTE *)(v4 + 24) = v1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8160);
  *v5 = v0;
  v5[1] = sub_222A851BC;
  return sub_222AADAF0();
}

uint64_t sub_222A851BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A85228()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_222A85234()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_222A85268(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t v9;

  v9 = a2;
  v7[3] = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8178);
  v7[2] = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v7[4] = v4;
  v7[5] = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_222AAD4F0();
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  sub_222AAD988();
  __asm { BR              X10 }
}

uint64_t sub_222A85398()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  sub_222AAD4D8();

  sub_222A85C90(v5, v8 - 128);
  v9 = *(_QWORD *)(v8 - 104);
  if (v9)
  {
    v10 = *(_QWORD *)(v8 - 96);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 104));
    (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1(v8 - 128);
  }
  else
  {
    sub_222A85CD8(v8 - 128);
  }
  v11 = *(void **)(v8 - 136);
  *(_QWORD *)(v8 - 128) = v11;
  *(_BYTE *)(v8 - 120) = v2;
  sub_222A8BB80();
  *(_QWORD *)(v8 - 192) = v0;
  *(_QWORD *)(v8 - 184) = v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, v3, v0);
  v14 = *(_QWORD *)(v8 - 176);
  v13 = *(_QWORD *)(v8 - 168);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v16 = *(_QWORD *)(v8 - 152);
  *(_QWORD *)(v8 - 168) = v3;
  v17 = v4;
  v18 = *(_QWORD *)(v8 - 144);
  v15(v16, v13, v18);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = (v6 + *(unsigned __int8 *)(v14 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v11;
  *(_BYTE *)(v21 + 24) = v2;
  v22 = v7;
  v23 = *(_QWORD *)(v8 - 192);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v21 + v19, v22, v23);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v21 + v20, v16, v18);
  *(_QWORD *)(v8 - 96) = sub_222A85E10;
  *(_QWORD *)(v8 - 88) = v21;
  *(_QWORD *)(v8 - 128) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v8 - 120) = 1107296256;
  *(_QWORD *)(v8 - 112) = sub_222A84C24;
  *(_QWORD *)(v8 - 104) = &block_descriptor;
  v24 = _Block_copy((const void *)(v8 - 128));
  sub_222A85EAC(v11, v2);
  swift_release();
  v25 = *(void **)(v8 - 184);
  objc_msgSend(v25, sel_executeQueryWithResultHandler_, v24);
  _Block_release(v24);

  return (*(uint64_t (**)(_QWORD, uint64_t))(v17 + 8))(*(_QWORD *)(v8 - 168), v23);
}

void sub_222A855CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_222AAD94C();
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  __asm { BR              X10 }
}

uint64_t sub_222A85654()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  sub_222AAD4D8();

  if (v2)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8178);
    return sub_222AAD874();
  }
  else
  {
    if (v1)
      swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8178);
    return sub_222AAD880();
  }
}

id sub_222A85750(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  char v14;

  v7 = *((_BYTE *)a1 + 8);
  v13 = *a1;
  v14 = v7;
  sub_222A8BB80();
  v9 = v8;
  sub_222A723C0(a2, (uint64_t)&v13);
  v10 = objc_allocWithZone((Class)type metadata accessor for ASDDeviceAppFetcher.QueryObservation());
  swift_retain();
  v11 = sub_222A858EC(v9, (uint64_t)&v13, a3, a4);

  swift_release();
  return v11;
}

uint64_t sub_222A857FC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v2 + 32) = v3;
  *(_BYTE *)(v2 + 64) = *((_BYTE *)a1 + 8);
  return swift_task_switch();
}

uint64_t sub_222A85820()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_BYTE *)(v4 + 24) = v1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8160);
  *v5 = v0;
  v5[1] = sub_222A851BC;
  return sub_222AADAF0();
}

id sub_222A858EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery] = a1;
  sub_222A723C0(a2, (uint64_t)&v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler]);
  v10 = &v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer];
  *(_QWORD *)v10 = a3;
  *((_QWORD *)v10 + 1) = a4;
  v18.receiver = v4;
  v18.super_class = ObjectType;
  v11 = a1;
  swift_retain();
  v12 = objc_msgSendSuper2(&v18, sel_init);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17[4] = sub_222A85F04;
  v17[5] = v13;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_222A84C24;
  v17[3] = &block_descriptor_15;
  v14 = _Block_copy(v17);
  v15 = v12;
  swift_release();
  objc_msgSend(v11, sel_executeQueryWithResultHandler_, v14);

  _Block_release(v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v15;
}

void sub_222A85A3C(uint64_t a1)
{
  uint64_t v1;

  sub_222A85268(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t destroy for ASDDeviceAppFetcher(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t initializeWithCopy for ASDDeviceAppFetcher(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    v4 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for ASDDeviceAppFetcher(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 3);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 24) = v4;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t assignWithTake for ASDDeviceAppFetcher(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASDDeviceAppFetcher(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASDDeviceAppFetcher(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASDDeviceAppFetcher()
{
  return &type metadata for ASDDeviceAppFetcher;
}

uint64_t sub_222A85C3C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_222A85C68()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_222A85C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C8030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A85CD8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C8030);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_222A85D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_222AAD4F0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8178);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  sub_222A85DDC(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24));
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

void sub_222A85DDC(void *a1, char a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 3:

      break;
    default:
      return;
  }
}

void sub_222A85E10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_222AAD4F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8178);
  sub_222A855CC(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24));
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

id sub_222A85EAC(id result, char a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_222A85EE0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_222A85F04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_222A84B80(a1, a2, v2);
}

uint64_t ASDPurchaseHistory.update(in:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_222A85F30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = swift_task_alloc();
  v0[4] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_222A85FD4;
  return sub_222AADAF0();
}

uint64_t sub_222A85FD4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A86040()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A8604C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A86080(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v24 = a2;
  v25 = a3;
  v22 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B48);
  v3 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_222AAD4F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - v11;
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  v13 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v22, v21);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = (v8 + *(unsigned __int8 *)(v3 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v5, v14);
  aBlock[4] = sub_222A886E0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A862CC;
  aBlock[3] = &block_descriptor_57;
  v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_updateWithContext_withCompletionHandler_, v25, v18);
  _Block_release(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_222A862C4(uint64_t a1)
{
  uint64_t v1;

  return sub_222A86080(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_222A862CC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t ASDPurchaseHistory.update(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_222A8633C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[3];
  v1 = v0[4];
  v3 = v0[2];
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[6] = v5;
  *v5 = v0;
  v5[1] = sub_222A863EC;
  return sub_222AADAF0();
}

uint64_t sub_222A863EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A86458(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
  char *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v25 = a3;
  v26 = a4;
  v24 = a2;
  v22 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B48);
  v4 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD4F0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - v12;
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  v14 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v15 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v21);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (v9 + *(unsigned __int8 *)(v4 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v11, v7);
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v18 + v17, v6, v15);
  aBlock[4] = sub_222A8860C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A862CC;
  aBlock[3] = &block_descriptor_51;
  v19 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_updateForAccountID_withContext_withCompletionHandler_, v25, v26, v19);
  _Block_release(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t sub_222A866A4(uint64_t a1)
{
  uint64_t v1;

  return sub_222A86458(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_222A866B0(void *a1)
{
  void *v2;
  id v3;

  sub_222AAD94C();
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  v2 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  if (a1)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768B48);
    return sub_222AAD874();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768B48);
    return sub_222AAD880();
  }
}

uint64_t ASDPurchaseHistory.fetchAllApps(of:compatibleWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_222A867B4()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[5];
  v2 = sub_222A88AD4(v0[3]);
  v0[6] = (uint64_t)v2;
  v3 = swift_task_alloc();
  v0[7] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  *v4 = v0;
  v4[1] = sub_222A8687C;
  return sub_222AADAF0();
}

uint64_t sub_222A8687C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A868E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_222A8691C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ASDPurchaseHistory.fetchApps(of:withIDs:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

{
  uint64_t v3;
  _QWORD *v4;

  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  return swift_task_switch();
}

uint64_t sub_222A86970()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[6];
  v2 = sub_222A88BF4(v0[4], v0[3]);
  v0[7] = (uint64_t)v2;
  v3 = swift_task_alloc();
  v0[8] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  *v4 = v0;
  v4[1] = sub_222A86A38;
  return sub_222AADAF0();
}

uint64_t sub_222A86A38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A86AA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_222A86AD8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A86B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  sub_222A723C0(*(_QWORD *)(v0 + 80), v0 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 96) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  sub_222A80690((__int128 *)(v0 + 16), v4 + 24);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v5;
  v5[2] = v3;
  v5[3] = v1;
  v5[4] = sub_222A88330;
  v5[5] = v4;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *v6 = v0;
  v6[1] = sub_222A86C2C;
  return sub_222AADAC0();
}

uint64_t sub_222A86C2C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A86C98()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
}

uint64_t sub_222A86CD0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_222A86D0C(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = sub_222A88948(a1, 0);
  sub_222A88078(a2);
  sub_222A7418C(0, (unint64_t *)&qword_2540C81B8);
  v4 = (void *)sub_222AAD844();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setStoreIDs_, v4);

  return v3;
}

uint64_t ASDPurchaseHistory.fetchAllApps(for:compatibleWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_222A86DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  sub_222A723C0(*(_QWORD *)(v0 + 72), v0 + 16);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 88) = v3;
  sub_222A80690((__int128 *)(v0 + 16), v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v4;
  v4[2] = v2;
  v4[3] = v1;
  v4[4] = sub_222A883E0;
  v4[5] = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v5;
  *v5 = v0;
  v5[1] = sub_222A86EB4;
  return sub_222AADAC0();
}

uint64_t sub_222A86EB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A86F20()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56));
}

uint64_t sub_222A86F58()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A86F94(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v24 = a2;
  v25 = a3;
  v22 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75A8);
  v3 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_222AAD4F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - v11;
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  v13 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v22, v21);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = (v8 + *(unsigned __int8 *)(v3 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v5, v14);
  aBlock[4] = sub_222A8856C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A872DC;
  aBlock[3] = &block_descriptor_0;
  v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_executeQuery_withResultHandler_, v25, v18);
  _Block_release(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_222A871D8(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  sub_222AAD94C();
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  v4 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  if (a2)
  {
    v5 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75A8);
    return sub_222AAD874();
  }
  else
  {
    if (a1)
      swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75A8);
    return sub_222AAD880();
  }
}

uint64_t sub_222A872DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_222A7418C(0, &qword_2540C7368);
    v4 = sub_222AAD850();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_222A87368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75B8);
  v6[17] = v7;
  v6[18] = *(_QWORD *)(v7 - 8);
  v6[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A87408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  __int128 v23;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 32);
    v4 = sub_222AAD8A4();
    v22 = *(_QWORD *)(v4 - 8);
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      v7 = *(_QWORD *)(v0 + 160);
      v6 = *(_QWORD *)(v0 + 168);
      v8 = *(_QWORD *)(v0 + 128);
      v9 = *v3++;
      v23 = *(_OWORD *)(v0 + 112);
      v21(v6, 1, 1, v4);
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = 0;
      v11 = (_QWORD *)(v10 + 16);
      *(_QWORD *)(v10 + 24) = 0;
      *(_OWORD *)(v10 + 32) = v23;
      *(_QWORD *)(v10 + 48) = v8;
      *(_QWORD *)(v10 + 56) = v9;
      sub_222A88498(v6, v7);
      LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v7, 1, v4);
      v12 = (id)v23;
      swift_retain();
      v13 = *(_QWORD *)(v0 + 160);
      if ((_DWORD)v7 == 1)
      {
        sub_222A884E0(*(_QWORD *)(v0 + 160));
        if (!*v11)
          goto LABEL_8;
      }
      else
      {
        sub_222AAD898();
        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v13, v4);
        if (!*v11)
        {
LABEL_8:
          v14 = 0;
          v16 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_222AAD868();
      v16 = v15;
      swift_unknownObjectRelease();
LABEL_9:
      v17 = **(_QWORD **)(v0 + 96);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
      v18 = v16 | v14;
      if (v16 | v14)
      {
        v18 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v14;
        *(_QWORD *)(v0 + 40) = v16;
      }
      v5 = *(_QWORD *)(v0 + 168);
      *(_QWORD *)(v0 + 48) = 1;
      *(_QWORD *)(v0 + 56) = v18;
      *(_QWORD *)(v0 + 64) = v17;
      swift_task_create();
      swift_release();
      sub_222A884E0(v5);
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  *(_QWORD *)(v0 + 72) = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8260);
  sub_222AAD8D4();
  *(_QWORD *)(v0 + 176) = sub_222A88520(&qword_2540C75B0, &qword_2540C75B8, MEMORY[0x24BEE6BD8]);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v19;
  *v19 = v0;
  v19[1] = sub_222A876DC;
  return sub_222AAD88C();
}

uint64_t sub_222A876DC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[24] = v0;
    v4 = v2[18];
    v3 = v2[19];
    v5 = v2[17];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_222A8776C()
{
  uint64_t v0;
  unint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 80);
  if (v1)
  {
    sub_222A87AE4(v1);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v2;
    *v2 = v0;
    v2[1] = sub_222A8788C;
    return sub_222AAD88C();
  }
  else
  {
    v4 = *(_QWORD **)(v0 + 88);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    swift_bridgeObjectRelease();
    *v4 = *(_QWORD *)(v0 + 72);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A87844()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A8788C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[24] = v0;
    v4 = v2[18];
    v3 = v2[19];
    v5 = v2[17];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_222A87918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return swift_task_switch();
}

uint64_t sub_222A87938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (*(uint64_t (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 56));
  *(_QWORD *)(v0 + 64) = v2;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
  *v4 = v0;
  v4[1] = sub_222A87A00;
  return sub_222AADAF0();
}

uint64_t sub_222A87A00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A87A6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 24);

  *v1 = *(_QWORD *)(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A87AAC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A87AE4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
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
    v3 = sub_222AADA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_222AADA84();
    swift_bridgeObjectRelease();
    v5 = v4 + v3;
    if (!__OFADD__(v4, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v4 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = v4 + v3;
  if (__OFADD__(v4, v3))
    goto LABEL_23;
LABEL_5:
  v6 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v6;
  v4 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v8 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v4 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v5)
      v9 = v5;
    swift_bridgeObjectRetain();
    *v1 = MEMORY[0x227677A5C](v4, v9, 1, v6);
    swift_bridgeObjectRelease();
    v8 = *v1 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_222A88144(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_222AADA84();
    swift_bridgeObjectRelease();
    v6 = *v1;
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
    return sub_222AAD85C();
  }
  __break(1u);
  return result;
}

uint64_t sub_222A87CA4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_222A87CC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = swift_task_alloc();
  v0[4] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_222A85FD4;
  return sub_222AADAF0();
}

uint64_t sub_222A87D64(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_222A87D84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[3];
  v1 = v0[4];
  v3 = v0[2];
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[6] = v5;
  *v5 = v0;
  v5[1] = sub_222A87E34;
  return sub_222AADAF0();
}

uint64_t sub_222A87E34()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A87EA0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A73D98;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return swift_task_switch();
}

uint64_t sub_222A87F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A88784;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return swift_task_switch();
}

uint64_t sub_222A87F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A88784;
  v9[10] = a3;
  v9[11] = v8;
  v9[8] = a1;
  v9[9] = a2;
  return swift_task_switch();
}

uint64_t sub_222A88004(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A88784;
  v7[9] = a2;
  v7[10] = v6;
  v7[8] = a1;
  return swift_task_switch();
}

uint64_t sub_222A88078(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v6 = MEMORY[0x24BEE4AF8];
    sub_222AADA54();
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithLongLong_, v5);
      sub_222AADA3C();
      sub_222AADA60();
      sub_222AADA6C();
      sub_222AADA48();
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_222A88144(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_222AADA84();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_222AADA84();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_222A88520(&qword_2540C7378, &qword_2540C7590, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7590);
            v10 = sub_222A996F8(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_222A7418C(0, &qword_2540C7368);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_222A882FC(uint64_t a1)
{
  uint64_t v1;

  return sub_222A86F94(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_222A88304()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

void *sub_222A88330(uint64_t a1)
{
  uint64_t v1;

  return sub_222A86D0C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_222A8833C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_222A7E220;
  return sub_222A87368(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_222A883BC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

void *sub_222A883E0(uint64_t a1)
{
  return sub_222A88948(a1, 0);
}

uint64_t sub_222A883EC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A88420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_222A7E0EC;
  *(_QWORD *)(v6 + 48) = v4;
  *(_QWORD *)(v6 + 56) = v5;
  *(_OWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_222A88498(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A884E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_222A88520(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x227677FFC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_222A88560()
{
  return objectdestroy_44Tm(&qword_2540C75A8);
}

uint64_t sub_222A8856C(uint64_t a1, void *a2)
{
  sub_222AAD4F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75A8);
  return sub_222A871D8(a1, a2);
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

uint64_t sub_222A88600()
{
  return objectdestroy_44Tm(&qword_255768B48);
}

uint64_t sub_222A8860C(void *a1)
{
  return sub_222A886F0(a1);
}

uint64_t sub_222A8861C()
{
  return objectdestroy_44Tm(&qword_255768B48);
}

uint64_t objectdestroy_44Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = sub_222AAD4F0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (v5 + v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v1 + v5, v3);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v1 + v9, v7);
  return swift_deallocObject();
}

uint64_t sub_222A886E0(void *a1)
{
  return sub_222A886F0(a1);
}

uint64_t sub_222A886F0(void *a1)
{
  sub_222AAD4F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768B48);
  return sub_222A866B0(a1);
}

id sub_222A8879C(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_redownloadParams);
  sub_222AAD7B4();

  sub_222A888A0();
  sub_222AAD9A0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768B58);
  sub_222A888E4();
  sub_222AAD79C();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_222AAD7A8();
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_222A888A0()
{
  unint64_t result;

  result = qword_255768B50;
  if (!qword_255768B50)
  {
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255768B50);
  }
  return result;
}

unint64_t sub_222A888E4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255768B60;
  if (!qword_255768B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255768B58);
    v2 = sub_222A79694();
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE2FF0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255768B60);
  }
  return result;
}

void *sub_222A88948(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04588]), sel_init);
  v5 = v4;
  if ((a2 & 1) != 0)
    v6 = 0;
  else
    v6 = a1;
  objc_msgSend(v4, sel_setAccountID_, v6);
  objc_msgSend(v5, sel_setIsHidden_, 2);
  objc_msgSend(v5, sel_setIsFirstParty_, 2);
  objc_msgSend(v5, sel_setIsPreorder_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7610);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_222AAFA90;
  sub_222AAD7B4();
  v8 = objc_allocWithZone(MEMORY[0x24BE04590]);
  v9 = (void *)sub_222AAD7A8();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithName_ascending_, v9, 0);

  *(_QWORD *)(v7 + 32) = v10;
  sub_222AAD85C();
  sub_222A7418C(0, &qword_2540C75E8);
  v11 = (void *)sub_222AAD844();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setSortOptions_, v11);

  return v5;
}

void *sub_222A88AD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A88D7C(a1, (uint64_t)v4);
  v5 = sub_222AAD6D0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_222A73FA8((uint64_t)v4);
LABEL_5:
    v8 = 0;
    v9 = 1;
    return sub_222A88948((uint64_t)v8, v9);
  }
  swift_getKeyPath();
  sub_222AAD6C4();
  swift_release();
  v7 = (void *)v11[1];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  if (!v7)
    goto LABEL_5;
  v8 = objc_msgSend(v7, sel_longLongValue);

  v9 = 0;
  return sub_222A88948((uint64_t)v8, v9);
}

void *sub_222A88BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A88D7C(a2, (uint64_t)v6);
  v7 = sub_222AAD6D0();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_222A73FA8((uint64_t)v6);
LABEL_5:
    v10 = 0;
    v11 = 1;
    goto LABEL_6;
  }
  swift_getKeyPath();
  sub_222AAD6C4();
  swift_release();
  v9 = (void *)v15[1];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  if (!v9)
    goto LABEL_5;
  v10 = objc_msgSend(v9, sel_longLongValue);

  v11 = 0;
LABEL_6:
  v12 = sub_222A88948((uint64_t)v10, v11);
  sub_222A88078(a1);
  sub_222A7418C(0, (unint64_t *)&qword_2540C81B8);
  v13 = (void *)sub_222AAD844();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setStoreIDs_, v13);

  return v12;
}

uint64_t sub_222A88D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_222A88DCC(void *a1, id a2)
{
  id v2;
  id v4;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768BB0);
    return sub_222AAD874();
  }
  if (!a1)
  {
    type metadata accessor for ASDError(0);
    sub_222A89CDC(MEMORY[0x24BEE4AF8]);
    sub_222A89E10();
    sub_222AAD460();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768BB0);
    return sub_222AAD874();
  }
  v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768BB0);
  return sub_222AAD880();
}

uint64_t sub_222A88EAC(uint64_t a1, void *a2)
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
  char *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B98);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD4CC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  if (a2)
  {
    v17 = (uint64_t)a2;
    v14 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768B90);
    return sub_222AAD874();
  }
  sub_222A89EBC(a1, (uint64_t)v6, &qword_255768B98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_222A89C9C((uint64_t)v6);
    type metadata accessor for ASDError(0);
    v16 = 901;
    sub_222A89CDC(MEMORY[0x24BEE4AF8]);
    sub_222A89E10();
    sub_222AAD460();
    v16 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768B90);
    return sub_222AAD874();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768B90);
  sub_222AAD880();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

Swift::Bool __swiftcall ASDPurchaseManager.isDeletableSystemApp(_:)(Swift::String a1)
{
  void *v1;
  id v2;
  Swift::Bool v3;

  v1 = (void *)MEMORY[0x227677C54]();
  objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v2 = sub_222A89B0C();
  if (v2)
  {

    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_autoreleasePoolPop(v1);
  return v3;
}

uint64_t ASDPurchaseManager.start(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  v2[5] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_222A8916C()
{
  uint64_t v0;
  uint64_t v1;
  int8x16_t *v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i64[0] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  sub_222A89BE0();
  *v3 = v0;
  v3[1] = sub_222A89224;
  return sub_222AADAF0();
}

uint64_t sub_222A89224()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A89290()
{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(id);
  id v3;
  id v4;

  v1 = *(void **)(v0 + 16);
  if (objc_msgSend(v1, sel_error))
  {
    swift_willThrow();

    v2 = *(uint64_t (**)(id))(v0 + 8);
    v3 = 0;
  }
  else
  {
    v4 = objc_msgSend(v1, sel_success);

    v2 = *(uint64_t (**)(id))(v0 + 8);
    v3 = v4;
  }
  return v2(v3);
}

uint64_t sub_222A89320()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

void sub_222A89358(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768BB0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_222A8A0BC;
  *(_QWORD *)(v11 + 24) = v10;
  aBlock[4] = sub_222A8A130;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A894B0;
  aBlock[3] = &block_descriptor_17;
  v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_startPurchase_withResultHandler_, a3, v12);
  _Block_release(v12);
}

void sub_222A894B0(uint64_t a1, void *a2, void *a3)
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

uint64_t ASDPurchaseManager.install(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_222A8956C()
{
  uint64_t v0;
  uint64_t v1;
  int8x16_t *v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i64[0] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  sub_222AAD4CC();
  *v3 = v0;
  v3[1] = sub_222A8961C;
  return sub_222AADAF0();
}

uint64_t sub_222A8961C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A89690()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_222A896C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B90);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (NSString *)sub_222AAD7A8();
  NSClassFromString(v8);

  v9 = (void *)objc_opt_self();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v10 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v10, (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  aBlock[4] = sub_222A89C34;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A89830;
  aBlock[3] = &block_descriptor_1;
  v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_installApp_withCompletionHandler_, a3, v12);
  _Block_release(v12);
}

uint64_t sub_222A89830(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B98);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_222AAD4C0();
    v10 = sub_222AAD4CC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = sub_222AAD4CC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_222A89C9C((uint64_t)v8);
}

uint64_t sub_222A89928()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x227677C54]();
  objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v1 = sub_222A89B0C();
  if (v1)
  {

    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  objc_autoreleasePoolPop(v0);
  return v2;
}

uint64_t sub_222A899B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A89A30;
  v5[3] = a1;
  v5[4] = v4;
  v5[5] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_222A89A30(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    v5 = 0;
  else
    v5 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_222A89A8C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A7E0EC;
  v7[3] = a2;
  v7[4] = v6;
  v7[2] = a1;
  v7[5] = swift_getObjectType();
  return swift_task_switch();
}

id sub_222A89B0C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_222AAD7A8();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifierOfSystemPlaceholder_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_222AAD46C();

    swift_willThrow();
  }
  return v2;
}

void sub_222A89BD4(uint64_t a1)
{
  uint64_t v1;

  sub_222A89358(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_222A89BE0()
{
  unint64_t result;

  result = qword_255768B70;
  if (!qword_255768B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255768B70);
  }
  return result;
}

void sub_222A89C1C(uint64_t a1)
{
  uint64_t v1;

  sub_222A896C4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_222A89C28()
{
  return objectdestroyTm_0(&qword_255768B90);
}

uint64_t sub_222A89C34(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768B90);
  return sub_222A88EAC(a1, a2);
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

uint64_t sub_222A89C9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255768B98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_222A89CDC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768BA0);
  v2 = sub_222AADAA8();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_222A89EBC(v6, (uint64_t)&v15, &qword_255768BA8);
    v7 = v15;
    v8 = v16;
    result = sub_222A89E58(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_222A89F00(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_222A89E10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255768788;
  if (!qword_255768788)
  {
    type metadata accessor for ASDError(255);
    result = MEMORY[0x227677FFC](&unk_222AAE714, v1);
    atomic_store(result, (unint64_t *)&qword_255768788);
  }
  return result;
}

unint64_t sub_222A89E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_222AADB80();
  sub_222AAD7CC();
  v4 = sub_222AADBB0();
  return sub_222A89F10(a1, a2, v4);
}

uint64_t sub_222A89EBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_222A89F00(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_222A89F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_222AADAD8() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_222AADAD8() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_222AADAD8() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_222A8A054()
{
  return objectdestroyTm_0(&qword_255768BB0);
}

uint64_t objectdestroyTm_0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_222A8A0BC(void **a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768BB0);
  return sub_222A88DCC(*a1, a2);
}

uint64_t sub_222A8A10C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A8A130(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_222A8A168(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void **v6;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];

  v11 = *v6;
  if (a4)
    v12 = (void *)sub_222AAD7A8();
  else
    v12 = 0;
  v15[4] = a5;
  v15[5] = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_222A8A240;
  v15[3] = &block_descriptor_6;
  v13 = _Block_copy(v15);
  swift_retain();
  objc_msgSend(v11, sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler_, a1, a2 & 1, v12, v13);
  _Block_release(v13);

  return swift_release();
}

uint64_t sub_222A8A240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, void *);
  id v10;

  v8 = a2;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_222A7418C(0, &qword_2540C75D8);
    v8 = sub_222AAD850();
  }
  swift_retain();
  v10 = a5;
  v9(v8, a3, a4, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_222A8A2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v5 = *v3;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_222A8A388;
  v8[3] = &block_descriptor_3;
  v6 = _Block_copy(v8);
  swift_retain();
  objc_msgSend(v5, sel_getCachedSubscriptionEntitlementsForSegment_withResultHandler_, a1, v6);
  _Block_release(v6);
  return swift_release();
}

uint64_t sub_222A8A388(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_222A8A448(a1, a2, a3, a4, &qword_2540C75D8);
}

uint64_t sub_222A8A39C(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_222A8A434;
  v6[3] = &block_descriptor_2;
  v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler_, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_222A8A434(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_222A8A448(a1, a2, a3, a4, (unint64_t *)&qword_2540C81B8);
}

uint64_t sub_222A8A448(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *);
  id v9;

  v7 = a2;
  v8 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_222A7418C(0, a5);
    v7 = sub_222AAD850();
  }
  swift_retain();
  v9 = a4;
  v8(v7, a3, a4);
  swift_release();

  return swift_bridgeObjectRelease();
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

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

uint64_t sub_222A8A510()
{
  uint64_t result;
  unint64_t v1;

  result = sub_222AAD994();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id *sub_222A8A590()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + *((_QWORD *)*v0 + 12);
  v2 = sub_222AAD994();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_222A8A5EC()
{
  sub_222A8A590();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AsyncExpensive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncExpensive);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x227677F9C](a1, v6, a5);
}

uint64_t AvailableUpdate.hash(into:)()
{
  sub_222AADBA4();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t static AvailableUpdate.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != *a2)
    return 0;
  if (a1[1] == a2[1] && a1[2] == a2[2])
    return 1;
  else
    return sub_222AADAD8();
}

uint64_t AvailableUpdate.hashValue.getter()
{
  sub_222AADB80();
  sub_222AADBA4();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t sub_222A8A750()
{
  sub_222AADB80();
  sub_222AADBA4();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

uint64_t sub_222A8A7C0()
{
  sub_222AADBA4();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222A8A810()
{
  sub_222AADB80();
  sub_222AADBA4();
  swift_bridgeObjectRetain();
  sub_222AAD7CC();
  swift_bridgeObjectRelease();
  return sub_222AADBB0();
}

unint64_t sub_222A8A880()
{
  unint64_t result;

  result = qword_255768BB8;
  if (!qword_255768BB8)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AvailableUpdate, &type metadata for AvailableUpdate);
    atomic_store(result, (unint64_t *)&qword_255768BB8);
  }
  return result;
}

uint64_t sub_222A8A8C4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != *a2)
    return 0;
  if (a1[1] == a2[1] && a1[2] == a2[2])
    return 1;
  else
    return sub_222AADAD8();
}

uint64_t initializeBufferWithCopyOfBuffer for AvailableUpdate(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AvailableUpdate()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AvailableUpdate(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AvailableUpdate(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableUpdate(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AvailableUpdate(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AvailableUpdate()
{
  return &type metadata for AvailableUpdate;
}

ValueMetadata *_s7BuyableVMa()
{
  return &_s7BuyableVN;
}

BOOL sub_222A8AA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int EnumCaseMultiPayload;
  _BOOL8 v14;
  uint64_t v16;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (unsigned __int8 *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v16 - v11;
  sub_222A78EE0(a2, (uint64_t)&v16 - v11);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_222A783C0((uint64_t)v12);
  if ((_DWORD)a2 != 6)
    return 0;
  sub_222A78EE0(a1, (uint64_t)v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v14 = 1;
  if (EnumCaseMultiPayload != 8)
  {
    if (EnumCaseMultiPayload || (sub_222A78EE0((uint64_t)v10, (uint64_t)v7), *v7 >= 2u))
      v14 = 0;
  }
  sub_222A783C0((uint64_t)v10);
  return v14;
}

uint64_t DefaultAppStateDataSource.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_222AAD778();
  return v0;
}

uint64_t DefaultAppStateDataSource.init()()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_222AAD778();
  return v0;
}

uint64_t DefaultAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t DefaultAppStateDataSource.load()()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultAppStateDataSource.reloadState(forAppsWith:synchronizing:)()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_222A8AC78(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t DefaultAppStateDataSource.reloadAllStates(synchronizing:)()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultAppStateDataSource.state(forAppWith:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t DefaultAppStateDataSource.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t DefaultAppStateDataSource.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_222A8AD24()
{
  return swift_retain();
}

uint64_t sub_222A8AD30()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_222A8AD40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t type metadata accessor for DefaultAppStateDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for DefaultAppStateDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DefaultAppStateDataSource.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

double sub_222A8ADC4@<D0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double result;

  v3 = *a1;
  if (qword_2540C7670 != -1)
    swift_once();
  v4 = qword_2540C8E40;
  if (*(_QWORD *)(qword_2540C8E40 + 16) && (v5 = sub_222A8B2B4(v3), (v6 & 1) != 0))
  {
    sub_222A723C0(*(_QWORD *)(v4 + 56) + 40 * v5, a2);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

void sub_222A8AE58(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = &_s8WildcardVN;
  *(_QWORD *)(a1 + 32) = &off_24E976A10;
}

uint64_t sub_222A8AE70()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8220);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_222AAF550;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 64) = &type metadata for StoreAppRuleset;
  *(_QWORD *)(inited + 72) = &off_24E975DF8;
  *(_BYTE *)(inited + 80) = 1;
  *(_QWORD *)(inited + 112) = &type metadata for BetaAppRuleset;
  *(_QWORD *)(inited + 120) = &off_24E975DE8;
  v1 = sub_222A90C60(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BE8);
  result = swift_arrayDestroy();
  qword_2540C8E38 = v1;
  return result;
}

double sub_222A8AF28@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  char v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_222A8B258(*a1), (v6 & 1) != 0))
  {
    sub_222A723C0(*(_QWORD *)(v4 + 56) + 40 * v5, (uint64_t)v11);
    v7 = v12;
    v8 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    State.key.getter();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 8))(&v10, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_222A8AFE0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultAppStateRules()
{
  return objc_opt_self();
}

double sub_222A8B024@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_222A8AF28(a1, a2);
}

unint64_t sub_222A8B044()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8228);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_222AAFCE0;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 64) = &_s7BuyableVN;
  *(_QWORD *)(inited + 72) = &off_24E975D20;
  *(_BYTE *)(inited + 80) = 1;
  *(_QWORD *)(inited + 112) = &_s7WaitingVN;
  *(_QWORD *)(inited + 120) = &off_24E976978;
  *(_BYTE *)(inited + 128) = 5;
  *(_QWORD *)(inited + 160) = &_s10InstallingVN;
  *(_QWORD *)(inited + 168) = &off_24E9761E0;
  *(_BYTE *)(inited + 176) = 6;
  *(_QWORD *)(inited + 208) = &_s9InstalledVN;
  *(_QWORD *)(inited + 216) = &off_24E9761A0;
  *(_BYTE *)(inited + 224) = 2;
  *(_QWORD *)(inited + 256) = &_s9PurchasedVN;
  *(_QWORD *)(inited + 264) = &off_24E9762A8;
  *(_BYTE *)(inited + 272) = 3;
  *(_QWORD *)(inited + 304) = &_s9UpdatableVN;
  *(_QWORD *)(inited + 312) = &off_24E976938;
  *(_BYTE *)(inited + 320) = 4;
  *(_QWORD *)(inited + 352) = &_s12DownloadableVN;
  *(_QWORD *)(inited + 360) = &off_24E975FC0;
  *(_BYTE *)(inited + 368) = 7;
  *(_QWORD *)(inited + 400) = &_s8OpenableVN;
  *(_QWORD *)(inited + 408) = &off_24E976268;
  *(_BYTE *)(inited + 416) = 8;
  *(_QWORD *)(inited + 448) = &_s7UnknownVN;
  *(_QWORD *)(inited + 456) = &off_24E9768F8;
  result = sub_222A8FB5C(inited);
  qword_2540C8E40 = result;
  return result;
}

unint64_t sub_222A8B188(uint64_t a1, char a2)
{
  char v3;
  uint64_t v4;

  v3 = a2 & 1;
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  v4 = sub_222AADBB0();
  return sub_222A8B370(a1, v3, v4);
}

unint64_t sub_222A8B200(uint64_t a1)
{
  uint64_t v2;

  sub_222AADB80();
  sub_222AADBA4();
  v2 = sub_222AADBB0();
  return sub_222A8B3FC(a1, v2);
}

unint64_t sub_222A8B258(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_222AADB80();
  sub_222AADB8C();
  v2 = sub_222AADBB0();
  return sub_222A8B498(v1, v2);
}

uint64_t sub_222A8B2B4(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  sub_222AADB80();
  sub_222A7B234((uint64_t)v4, a1);
  v2 = sub_222AADBB0();
  return sub_222A8B554(a1, v2);
}

unint64_t sub_222A8B30C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_222AADB80();
  sub_222AAD7CC();
  v4 = sub_222AADBB0();
  return sub_222A8B854(a1, a2, v4);
}

unint64_t sub_222A8B370(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  for (result = a3 & ~v5;
        ((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
        result = (result + 1) & ~v5)
  {
    if (((*(_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * result) == a1) & (((a2 & 1) == 0) ^ *(unsigned __int8 *)(*(_QWORD *)(v3 + 48) + 16 * result + 8))) != 0)
      break;
  }
  return result;
}

unint64_t sub_222A8B3FC(uint64_t a1, uint64_t a2)
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

unint64_t sub_222A8B498(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_222A8B554(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_222A8B854(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_222AADAD8() & 1) == 0)
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
      while (!v14 && (sub_222AADAD8() & 1) == 0);
    }
  }
  return v6;
}

ValueMetadata *type metadata accessor for BetaAppRuleset()
{
  return &type metadata for BetaAppRuleset;
}

ValueMetadata *type metadata accessor for StoreAppRuleset()
{
  return &type metadata for StoreAppRuleset;
}

uint64_t dispatch thunk of DeviceAppFetcher.observeQuery(_:on:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of DeviceAppFetcher.fetchQuery(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A70BFC;
  return v9(a1, a2, a3);
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_222A85EAC(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for DeviceAppQuery(uint64_t a1)
{
  sub_222A85DDC(*(void **)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_222A85EAC(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_222A85DDC(v5, v6);
  return a1;
}

uint64_t assignWithTake for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  char v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_222A85DDC(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceAppQuery(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceAppQuery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_222A8BB40(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_222A8BB58(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceAppQuery()
{
  return &type metadata for DeviceAppQuery;
}

void sub_222A8BB80()
{
  __asm { BR              X10 }
}

id sub_222A8BBB4(uint64_t a1)
{
  void *v1;
  id v2;

  sub_222A8BD54(a1);
  sub_222A814A4();
  v1 = (void *)sub_222AAD844();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_queryForStoreItemIDs_, v1);

  return v2;
}

id sub_222A8BCDC(id a1)
{
  return a1;
}

id sub_222A8BCF0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_opt_self();
  if (a1)
    v2 = objc_msgSend(v1, sel_queryForBetaApps);
  else
    v2 = objc_msgSend(v1, sel_queryForStoreApps);
  return v2;
}

uint64_t sub_222A8BD54(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_222AADA54();
    result = sub_222AA7BD0(a1);
    v4 = result;
    v6 = v5;
    v8 = v7 & 1;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(a1 + 32))
    {
      if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) == 0)
        goto LABEL_11;
      if (*(_DWORD *)(a1 + 36) != (_DWORD)v6)
        goto LABEL_12;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithLongLong_, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v4));
      sub_222AADA3C();
      sub_222AADA60();
      sub_222AADA6C();
      sub_222AADA48();
      result = sub_222AA7C74(v4, v6, v8 & 1, a1);
      v4 = result;
      v6 = v9;
      v8 = v10 & 1;
      if (!--v2)
      {
        sub_222A8BEB4(result, v9, v10 & 1);
        return v11;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

uint64_t sub_222A8BEB4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t DeviceAppStateDataSource.__allocating_init(query:fetcher:updateRegistry:store:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[40];
  _QWORD v20[5];

  v8 = sub_222AAD748();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = *(void **)a1;
  v13 = *(_BYTE *)(a1 + 8);
  v14 = *a4;
  sub_222A723C0(a2, (uint64_t)v20);
  sub_222A89EBC(a3, (uint64_t)v19, &qword_2540C8028);
  if (qword_2540C8100 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v8, (uint64_t)qword_2540C8E60);
  v16 = swift_allocObject();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  v17 = sub_222A8F728(v12, v13, v20, (uint64_t)v19, v14, (uint64_t)v11, v16);
  sub_222A7DCD0(a3, &qword_2540C8028);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v17;
}

uint64_t sub_222A8C020(_QWORD *a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_222A8C07C(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_222A8C07C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)@<X0>(id *@<X0>, uint64_t *@<X8>);
  uint64_t (*v6)@<X0>(id *@<X0>, uint64_t *@<X8>);
  os_unfair_lock_s *v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)@<X0>(id *@<X0>, uint64_t *@<X8>);
  uint64_t v13;
  uint64_t v14;

  v3 = *v1;
  v4 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v4);
  v11 = a1;
  v12 = sub_222A8D1A0;
  v13 = 0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81F8);
  sub_222A8FA38();
  v10 = sub_222AAD79C();
  v6 = v5;
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v14 = v3;
  v11 = v1;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)&v11, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v14 = MEMORY[0x24BEE0D00];
  v11 = (_QWORD *)v10;
  v12 = v6;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)&v11, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v7 = (os_unfair_lock_s *)(v1[24] + 16);
  os_unfair_lock_lock(v7);
  sub_222A99B7C((_QWORD *(*)(uint64_t *__return_ptr))sub_222A8FAE8, &v11);
  os_unfair_lock_unlock(v7);
  os_unfair_lock_lock(v7);
  sub_222A99B7C((_QWORD *(*)(uint64_t *__return_ptr))sub_222A8FB48, &v11);
  os_unfair_lock_unlock(v7);
  v8 = v11;
  swift_bridgeObjectRelease();
  v11 = v8;
  sub_222AAD76C();
  return swift_bridgeObjectRelease();
}

uint64_t DeviceAppStateDataSource.deinit()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = 0;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_222A85DDC(*(void **)(v0 + 56), *(_BYTE *)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_222A7DCD0(v0 + 112, &qword_2540C8028);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t DeviceAppStateDataSource.__deallocating_deinit()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = 0;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_222A85DDC(*(void **)(v0 + 56), *(_BYTE *)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_222A7DCD0(v0 + 112, &qword_2540C8028);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t DeviceAppStateDataSource.description.getter()
{
  sub_222AADBBC();
  sub_222AAD7D8();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  sub_222AADA78();
  sub_222AAD7D8();
  return 0;
}

uint64_t DeviceAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t DeviceAppStateDataSource.load()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[4] = v0;
  v2 = sub_222AAD5B0();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A8C51C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v1 + 56);
  v3 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 24) = v3;
  sub_222A85EAC(v2, v3);
  sub_222AAD550();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_222A8C5BC;
  return sub_222A8C6A0((uint64_t *)(v0 + 16), *(_QWORD *)(v0 + 56), 0, 1);
}

uint64_t sub_222A8C5BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 56);
  v3 = *(_QWORD *)(*v1 + 40);
  v4 = *(_QWORD *)(*v1 + 48);
  v5 = *v1;
  *(_QWORD *)(v5 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_222A85DDC(*(void **)(v5 + 16), *(_BYTE *)(v5 + 24));
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_222A8C66C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A8C6A0(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v5 + 176) = a3;
  *(_QWORD *)(v5 + 184) = v4;
  *(_BYTE *)(v5 + 145) = a4;
  *(_QWORD *)(v5 + 168) = a2;
  *(_QWORD *)(v5 + 192) = *v4;
  sub_222AAD598();
  v7 = swift_task_alloc();
  v8 = *a1;
  *(_QWORD *)(v5 + 200) = v7;
  *(_QWORD *)(v5 + 208) = v8;
  *(_BYTE *)(v5 + 146) = *((_BYTE *)a1 + 8);
  return swift_task_switch();
}

uint64_t sub_222A8C718()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 146);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD **)(v0 + 184);
  v4 = v3[12];
  v5 = v3[13];
  __swift_project_boxed_opaque_existential_1(v3 + 9, v4);
  *(_QWORD *)(v0 + 136) = v2;
  *(_BYTE *)(v0 + 144) = v1;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 16) + *(_QWORD *)(v5 + 16));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v6;
  *v6 = v0;
  v6[1] = sub_222A8C7B8;
  return v8(v0 + 136, v4, v5);
}

uint64_t sub_222A8C7B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A8C824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  _QWORD *v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 176);
  v6 = *(os_unfair_lock_s **)(v4 + 192);
  v7 = (_QWORD *)swift_task_alloc();
  v7[2] = v1;
  v7[3] = v4;
  v7[4] = v5;
  v7[5] = v3;
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = sub_222A8F9B4;
  *(_QWORD *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  sub_222A99B7C(*(_QWORD *(**)(uint64_t *__return_ptr))(v8 + 16), &v12);
  os_unfair_lock_unlock(v6 + 4);
  if (v2)
    return swift_task_dealloc();
  v10 = *(_BYTE *)(v0 + 145);
  v11 = v12;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v0 + 160) = v11;
    sub_222AAD76C();
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A8C930()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v12;
  uint64_t *v13;

  v1 = v0;
  v2 = v0 + 10;
  v13 = v0 + 2;
  v3 = v0[24];
  v4 = v1[23];
  v12 = v1[21];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  v5 = sub_222AAD5B0();
  v6 = *(_QWORD *)(v5 - 8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v1[9] = v3;
  v1[6] = v4;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)(v1 + 6), (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v1[13] = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_0, v12, v5);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v2, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v8 = v1[14];
  v9 = v1[15];
  v1[5] = v9;
  v10 = __swift_allocate_boxed_opaque_existential_0(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v10, v8, v9);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v13, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t DeviceAppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 57) = a2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v2;
  v4 = sub_222AAD5B0();
  *(_QWORD *)(v3 + 80) = v4;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  v5 = sub_222AAD598();
  *(_QWORD *)(v3 + 104) = v5;
  *(_QWORD *)(v3 + 112) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 120) = swift_task_alloc();
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A8CC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 48) = v5;
  *(_BYTE *)(v0 + 56) = 0;
  swift_bridgeObjectRetain();
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8190);
  *(_QWORD *)(v0 + 16) = v5;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 16, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  sub_222AAD5A4();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v6;
  *v6 = v0;
  v6[1] = sub_222A8CD24;
  return sub_222A8C6A0((uint64_t *)(v0 + 48), *(_QWORD *)(v0 + 96), v5, *(_BYTE *)(v0 + 57));
}

uint64_t sub_222A8CD24()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*v1 + 88);
  v2 = *(_QWORD *)(*v1 + 96);
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *v1;
  *(_QWORD *)(v5 + 144) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_222A85DDC(*(void **)(v5 + 48), *(_BYTE *)(v5 + 56));
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_222A8CDF0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DeviceAppStateDataSource.reloadAllStates(synchronizing:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 32) = v1;
  *(_BYTE *)(v2 + 25) = a1;
  v3 = sub_222AAD5B0();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A8CE9C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v1 + 56);
  v3 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 24) = v3;
  sub_222A85EAC(v2, v3);
  sub_222AAD550();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_222A8C5BC;
  return sub_222A8C6A0((uint64_t *)(v0 + 16), *(_QWORD *)(v0 + 56), 0, *(_BYTE *)(v0 + 25));
}

void DeviceAppStateDataSource.state(forAppWith:)(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v4 = *a1;
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 192) + 16);
  os_unfair_lock_lock(v5);
  sub_222A8CF8C(v2, v4, a2);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_222A8CF8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 160);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_222A8B200(a2), (v8 & 1) != 0))
  {
    v9 = v7;
    v10 = *(_QWORD *)(v6 + 56);
    v11 = type metadata accessor for State();
    v12 = *(_QWORD *)(v11 - 8);
    sub_222A78EE0(v10 + *(_QWORD *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

BOOL DeviceAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  void *v4;
  int v5;
  id v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(v1 + 64);
  if (v3 == 2)
    goto LABEL_5;
  v4 = *(void **)(v1 + 56);
  if (v3 == 3)
  {
    v6 = objc_msgSend(v4, sel_predicate);
    v7 = objc_msgSend(v6, sel_description);

    sub_222AAD7B4();
    sub_222A888A0();
    v5 = sub_222AAD9AC();
    sub_222A85DDC(v4, 3);
    swift_bridgeObjectRelease();
    sub_222A85DDC(v4, 3);
    return ((v2 ^ v5) & 1) == 0;
  }
  if (v3 == 4 && v4 == (void *)1)
LABEL_5:
    v5 = 1;
  else
    v5 = 0;
  return ((v2 ^ v5) & 1) == 0;
}

uint64_t sub_222A8D1A0@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t result;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;

  v3 = *a1;
  v13 = objc_msgSend(*a1, sel_storeItemID);
  v4 = sub_222AADACC();
  v6 = v5;
  v7 = objc_msgSend(v3, sel_progress, v13);
  if (v7)
  {
    v8 = v7;
    v14 = v4;
    v15 = v6;
    sub_222AAD7D8();
    v9 = v8;
    v10 = objc_msgSend(v9, sel_description);
    sub_222AAD7B4();

    sub_222AAD7D8();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_222AADA00();
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    sub_222AAD7D8();
    v12 = objc_msgSend(v3, sel_bundleID);
    sub_222AAD7B4();

    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    sub_222AAD7D8();
    objc_msgSend(v3, sel_isInstalled);
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    sub_222AAD7D8();
    objc_msgSend(v3, sel_isLaunchProhibited);
    sub_222AAD7D8();
    swift_bridgeObjectRelease();
    result = sub_222AAD7D8();
  }
  *a2 = v14;
  a2[1] = v15;
  return result;
}

uint64_t sub_222A8D410@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[5];
  uint64_t v27;
  char v28;
  _BYTE v29[40];
  uint64_t v30;

  v7 = a2 + 16;
  swift_beginAccess();
  v8 = *(_QWORD *)(a2 + 168);
  sub_222A723C0(v7, (uint64_t)v29);
  sub_222A8FB04();
  swift_bridgeObjectRetain();
  v25 = v8;
  swift_bridgeObjectRetain();
  v9 = sub_222AAD8F8();
  v30 = v9;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_222AADA84();
    swift_bridgeObjectRelease();
    result = v8;
    if (v10)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_20:
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    *a3 = v9;
    return result;
  }
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = v8;
  if (!v10)
    goto LABEL_19;
LABEL_3:
  if (v10 >= 1)
  {
    v23 = a3;
    v24 = v3;
    v12 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v14 = (id)MEMORY[0x227677A50](v12, a1);
      else
        v14 = *(id *)(a1 + 8 * v12 + 32);
      v15 = v14;
      if (!objc_msgSend(v14, sel_storeItemID, v23, v24))
      {
        v16 = objc_msgSend(v15, sel_bundleID);
        v17 = sub_222AAD7B4();
        v19 = v18;

        if (*(_QWORD *)(v25 + 16))
        {
          v20 = sub_222A8B30C(v17, v19);
          if ((v21 & 1) != 0)
          {
            v13 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v20);

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
        }
        swift_bridgeObjectRelease();
      }
      v22 = objc_msgSend(v15, sel_storeItemID);
      sub_222A723C0((uint64_t)v29, (uint64_t)v26);
      sub_222A716BC((uint64_t)v22, (uint64_t)v26, (uint64_t)&v27);

      if ((v28 & 1) != 0)
        goto LABEL_7;
      v13 = v27;
LABEL_6:
      sub_222AA54C4(v26, v13);
LABEL_7:
      if (v10 == ++v12)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v9 = v30;
        a3 = v23;
        goto LABEL_20;
      }
    }
  }
  __break(1u);
  return result;
}

void sub_222A8D654(unint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  void *v11;
  uint64_t v12;

  v11 = (void *)MEMORY[0x227677C54]();
  sub_222A8D6E8(a1, a2, a3, a4, (uint64_t)&v12);
  objc_autoreleasePoolPop(v11);
  if (v5)
    __break(1u);
  else
    *a5 = v12;
}

uint64_t sub_222A8D6E8@<X0>(unint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unsigned int (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  char v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  unint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  unint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t *v115;
  unint64_t v116;
  __int128 v117;
  unint64_t v118;
  _QWORD *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  _QWORD *v124;
  _QWORD *v125;
  uint64_t v126;
  unint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  id v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t *v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD v142[5];
  uint64_t v143[2];
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;

  v111 = a4;
  v113 = a3;
  v125 = a2;
  v7 = type metadata accessor for State();
  v137 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v114 = (uint64_t)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E40);
  MEMORY[0x24BDAC7A8](v123);
  v10 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_222AAD598();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v109 = (char *)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v120 = (char *)&v109 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v121 = (uint64_t)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (uint64_t *)((char *)&v109 - v19);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (uint64_t)&v109 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v136 = (uint64_t *)((char *)&v109 - v25);
  MEMORY[0x24BDAC7A8](v24);
  v133 = (uint64_t)&v109 - v26;
  v147 = MEMORY[0x24BEE4B08];
  v146 = MEMORY[0x24BEE4B08];
  v110 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_90:
    swift_bridgeObjectRetain();
    result = sub_222AADA84();
    v27 = result;
  }
  else
  {
    v27 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v135 = v7;
  v112 = (_QWORD *)a5;
  v130 = a1;
  if (v27)
  {
    if (v27 < 1)
    {
      __break(1u);
      return result;
    }
    v29 = 0;
    v128 = v125 + 2;
    v119 = v125 + 21;
    v131 = (char *)(v125 + 20);
    v127 = a1 & 0xC000000000000001;
    v118 = 0x8000000222AB0610;
    v117 = xmmword_222AAE880;
    v116 = 0x8000000222AB0660;
    v126 = v23;
    v122 = v10;
    v115 = v20;
    v129 = v27;
    while (1)
    {
      v38 = v127 ? (id)MEMORY[0x227677A50](v29, a1) : *(id *)(a1 + 8 * v29 + 32);
      v39 = v38;
      v40 = (uint64_t)objc_msgSend(v38, sel_storeItemID);
      sub_222A723C0((uint64_t)v128, (uint64_t)v143);
      if ((v40 & 0x8000000000000000) == 0)
        break;
      v142[0] = 0;
      v142[1] = 0xE000000000000000;
      sub_222AADA00();
      swift_bridgeObjectRelease();
      v142[0] = 0xD00000000000001DLL;
      v142[1] = v118;
      v140 = v40;
      v30 = MEMORY[0x24BEE4008];
      sub_222AADACC();
      sub_222AAD7D8();
      swift_bridgeObjectRelease();
      v31 = v142[0];
      v32 = v142[1];
      sub_222A71A40();
      v33 = (void *)swift_allocError();
      *v34 = v31;
      v34[1] = v32;
      swift_willThrow();
      sub_222A723C0((uint64_t)v143, (uint64_t)v142);
      v132 = v39;
      v134 = (char *)v142[4];
      v124 = __swift_project_boxed_opaque_existential_1(v142, v142[3]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
      sub_222AAD5B0();
      *(_OWORD *)(swift_allocObject() + 16) = v117;
      sub_222AAD58C();
      sub_222AAD580();
      v141 = v30;
      v140 = v40;
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)&v140, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      swift_getErrorValue();
      v35 = v138;
      v36 = v139;
      v141 = v139;
      v37 = __swift_allocate_boxed_opaque_existential_0(&v140);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v37, v35, v36);
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)&v140, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      v23 = v126;
      sub_222AAD5A4();
      v7 = v135;
      sub_222AAD6A0();
      a1 = v130;
      swift_bridgeObjectRelease();

      sub_222A7239C((uint64_t)v143);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v142);

      v124 = 0;
LABEL_7:
      if (v129 == ++v29)
      {
        swift_bridgeObjectRelease();
        a5 = v146;
        goto LABEL_43;
      }
    }
    v134 = (char *)v40;
    sub_222A7239C((uint64_t)v143);
    if (objc_msgSend(v39, sel_storeItemID))
    {
      v41 = objc_msgSend(v39, sel_bundleID);
      v42 = sub_222AAD7B4();
      v44 = v43;

      v45 = v119;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v142[0] = *v45;
      *v45 = 0x8000000000000000;
      sub_222AACBB0((uint64_t)v134, v42, v44, isUniquelyReferenced_nonNull_native);
      *v45 = v142[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    v47 = v125;
    sub_222A8E7CC(v39, v136);
    v48 = objc_msgSend(v39, sel_isBetaApp);
    v49 = v48;
    v50 = *((unsigned __int8 *)v47 + 64);
    if (v50 == 2)
    {
      v52 = (uint64_t)v134;
      if ((v48 & 1) == 0)
        goto LABEL_26;
    }
    else
    {
      v51 = (void *)v47[7];
      if (v50 == 3)
      {
        v53 = objc_msgSend(v51, sel_predicate);
        v54 = objc_msgSend(v53, sel_description);

        v55 = sub_222AAD7B4();
        v132 = v39;
        v57 = v56;

        v23 = v126;
        v143[0] = v55;
        v143[1] = v57;
        strcpy((char *)v142, "isBetaApp == 1");
        HIBYTE(v142[1]) = -18;
        sub_222A888A0();
        LODWORD(v55) = sub_222AAD9AC();
        sub_222A85DDC(v51, 3);
        v39 = v132;
        v7 = v135;
        swift_bridgeObjectRelease();
        sub_222A85DDC(v51, 3);
        v52 = (uint64_t)v134;
        if (((v49 ^ v55) & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        v52 = (uint64_t)v134;
        if (v50 == 4)
        {
          if (((v48 ^ (v51 == (void *)1)) & 1) != 0)
            goto LABEL_26;
        }
        else if ((v48 & 1) != 0)
        {
          goto LABEL_26;
        }
      }
    }
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v137 + 48))(v136, 1, v7) != 1)
      sub_222AA54C4(v143, v52);
LABEL_26:
    v58 = v131;
    swift_beginAccess();
    v59 = *(_QWORD *)v58;
    if (*(_QWORD *)(v59 + 16))
    {
      v60 = sub_222A8B200(v52);
      v61 = (uint64_t)v122;
      if ((v62 & 1) != 0)
      {
        sub_222A78EE0(*(_QWORD *)(v59 + 56) + *(_QWORD *)(v137 + 72) * v60, v23);
        v63 = 0;
      }
      else
      {
        v63 = 1;
      }
    }
    else
    {
      v63 = 1;
      v61 = (uint64_t)v122;
    }
    v64 = v137;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v137 + 56))(v23, v63, 1, v7);
    swift_endAccess();
    v65 = v61 + *(int *)(v123 + 48);
    sub_222A89EBC(v23, v61, &qword_2540C7E30);
    sub_222A89EBC((uint64_t)v136, v65, &qword_2540C7E30);
    v66 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48);
    if (v66(v61, 1, v7) == 1)
    {
      sub_222A7DCD0(v23, &qword_2540C7E30);
      if (v66(v65, 1, v7) == 1)
      {
        sub_222A7DCD0(v61, &qword_2540C7E30);
LABEL_39:

        v75 = v136;
        goto LABEL_40;
      }
    }
    else
    {
      v67 = (uint64_t)v115;
      sub_222A89EBC(v61, (uint64_t)v115, &qword_2540C7E30);
      if (v66(v65, 1, v7) != 1)
      {
        v76 = v114;
        sub_222A7A688(v65, v114);
        _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v67, v76);
        v78 = v77;
        sub_222A783C0(v76);
        v23 = v126;
        sub_222A7DCD0(v126, &qword_2540C7E30);
        sub_222A783C0(v67);
        sub_222A7DCD0(v61, &qword_2540C7E30);
        if ((v78 & 1) != 0)
          goto LABEL_39;
LABEL_37:
        v68 = v136;
        v69 = v121;
        sub_222A89EBC((uint64_t)v136, v121, &qword_2540C7E30);
        v70 = v29;
        v71 = v23;
        v72 = v7;
        v73 = v39;
        swift_beginAccess();
        v74 = (uint64_t)v134;
        sub_222AA9C3C(v69, (uint64_t)v134);
        swift_endAccess();
        sub_222AA54C4(v143, v74);

        v7 = v72;
        v23 = v71;
        v29 = v70;
        v75 = v68;
LABEL_40:
        sub_222A7DCD0((uint64_t)v75, &qword_2540C7E30);
        a1 = v130;
        goto LABEL_7;
      }
      v23 = v126;
      sub_222A7DCD0(v126, &qword_2540C7E30);
      sub_222A783C0(v67);
    }
    sub_222A7DCD0(v61, &qword_2540C7E40);
    goto LABEL_37;
  }
  swift_bridgeObjectRelease();
  a5 = MEMORY[0x24BEE4B08];
LABEL_43:
  v79 = v125 + 20;
  swift_beginAccess();
  v140 = MEMORY[0x24BEE4B08];
  v80 = swift_bridgeObjectRetain();
  v10 = (char *)sub_222A94B44(v80);
  v20 = v113;
  if (v113)
  {
    v81 = swift_bridgeObjectRetain();
    v10 = (char *)sub_222A9915C(v81, (uint64_t)v10);
    swift_bridgeObjectRelease();
  }
  v82 = 0;
  v83 = *((_QWORD *)v10 + 7);
  v131 = v10 + 56;
  v84 = 1 << v10[32];
  if (v84 < 64)
    v85 = ~(-1 << v84);
  else
    v85 = -1;
  v23 = v85 & v83;
  v132 = (id)((unint64_t)(v84 + 63) >> 6);
  v136 = (uint64_t *)(a5 + 56);
  v134 = v10;
LABEL_51:
  while (v23)
  {
    v88 = __clz(__rbit64(v23));
    v23 &= v23 - 1;
    v89 = v88 | (v82 << 6);
LABEL_66:
    v7 = *(_QWORD *)(*((_QWORD *)v10 + 6) + 8 * v89);
    if (!*(_QWORD *)(a5 + 16))
      goto LABEL_73;
    sub_222AADB80();
    v20 = v143;
    sub_222AADBA4();
    v93 = sub_222AADBB0();
    v94 = -1 << *(_BYTE *)(a5 + 32);
    v95 = v93 & ~v94;
    if (((*(unint64_t *)((char *)v136 + ((v95 >> 3) & 0xFFFFFFFFFFFFF8)) >> v95) & 1) == 0)
      goto LABEL_73;
    v96 = *(_QWORD *)(a5 + 48);
    if (*(_QWORD *)(v96 + 8 * v95) != v7)
    {
      v97 = ~v94;
      while (1)
      {
        v95 = (v95 + 1) & v97;
        if (((*(unint64_t *)((char *)v136 + ((v95 >> 3) & 0xFFFFFFFFFFFFF8)) >> v95) & 1) == 0)
          break;
        if (*(_QWORD *)(v96 + 8 * v95) == v7)
          goto LABEL_51;
      }
LABEL_73:
      v98 = sub_222A8B200(v7);
      if ((v99 & 1) != 0)
      {
        v100 = v98;
        v101 = swift_isUniquelyReferenced_nonNull_native();
        v102 = *v79;
        v143[0] = *v79;
        *v79 = 0x8000000000000000;
        if ((v101 & 1) == 0)
        {
          sub_222AABE70();
          v102 = v143[0];
        }
        a1 = v137;
        v87 = v133;
        sub_222A7A688(*(_QWORD *)(v102 + 56) + *(_QWORD *)(v137 + 72) * v100, v133);
        sub_222AAB8E4(v100, v102);
        *v79 = v102;
        swift_bridgeObjectRelease();
        v86 = 0;
      }
      else
      {
        v86 = 1;
        a1 = v137;
        v87 = v133;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56))(v87, v86, 1, v135);
      sub_222A7DCD0(v87, &qword_2540C7E30);
      sub_222AA54C4(v143, v7);
      v20 = &v147;
      sub_222AA54C4(v143, v7);
      v10 = v134;
    }
  }
  if (__OFADD__(v82++, 1))
  {
    __break(1u);
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  if (v82 >= (uint64_t)v132)
    goto LABEL_81;
  v91 = *(_QWORD *)&v131[8 * v82];
  if (v91)
  {
LABEL_65:
    v23 = (v91 - 1) & v91;
    v89 = __clz(__rbit64(v91)) + (v82 << 6);
    goto LABEL_66;
  }
  v92 = v82 + 1;
  if (v82 + 1 >= (uint64_t)v132)
    goto LABEL_81;
  v91 = *(_QWORD *)&v131[8 * v92];
  if (v91)
    goto LABEL_64;
  v92 = v82 + 2;
  if (v82 + 2 >= (uint64_t)v132)
    goto LABEL_81;
  v91 = *(_QWORD *)&v131[8 * v92];
  if (v91)
    goto LABEL_64;
  v92 = v82 + 3;
  if (v82 + 3 >= (uint64_t)v132)
    goto LABEL_81;
  v91 = *(_QWORD *)&v131[8 * v92];
  if (v91)
  {
LABEL_64:
    v82 = v92;
    goto LABEL_65;
  }
  v92 = v82 + 4;
  if (v82 + 4 < (uint64_t)v132)
  {
    v91 = *(_QWORD *)&v131[8 * v92];
    if (!v91)
    {
      while (1)
      {
        v82 = v92 + 1;
        if (__OFADD__(v92, 1))
          goto LABEL_89;
        if (v82 >= (uint64_t)v132)
          goto LABEL_81;
        v91 = *(_QWORD *)&v131[8 * v82];
        ++v92;
        if (v91)
          goto LABEL_65;
      }
    }
    goto LABEL_64;
  }
LABEL_81:
  swift_release();
  v103 = v130;
  v104 = v140;
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_222A89EBC((uint64_t)(v125 + 14), (uint64_t)v143, &qword_2540C8028);
  v105 = v144;
  if (v144)
  {
    v106 = v145;
    __swift_project_boxed_opaque_existential_1(v143, v144);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 32))(v104, v105, v106);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v143);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_222A7DCD0((uint64_t)v143, &qword_2540C8028);
  }
  v107 = (uint64_t)v125;
  __swift_project_boxed_opaque_existential_1(v125 + 2, v125[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v144 = v111;
  v143[0] = v107;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v143, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  if (v110)
  {
    swift_bridgeObjectRetain();
    v108 = sub_222AADA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v108 = *(_QWORD *)((v103 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v144 = MEMORY[0x24BEE1768];
  v143[0] = v108;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v143, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  result = swift_bridgeObjectRelease();
  *v112 = v147;
  return result;
}

uint64_t sub_222A8E7CC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (**v9)(uint64_t *, uint64_t, uint64_t, ValueMetadata *);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  ValueMetadata *v13;
  uint64_t (**Description)(uint64_t *, uint64_t, uint64_t, ValueMetadata *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  ValueMetadata *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  uint64_t v31;
  id v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *boxed_opaque_existential_0;
  ValueMetadata *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  ValueMetadata *v55;
  ValueMetadata *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  ValueMetadata *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t (**v65)(uint64_t *, uint64_t, uint64_t, ValueMetadata *);
  ValueMetadata *v66;
  uint64_t v67;
  ValueMetadata *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t (**v81)(uint64_t *, uint64_t, uint64_t, ValueMetadata *);
  uint64_t *v82;
  uint64_t v83;
  ValueMetadata *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  ValueMetadata *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93[3];
  ValueMetadata *v94;
  uint64_t v95;

  v3 = (uint64_t)v2;
  v6 = v2 + 2;
  v88 = (ValueMetadata *)*v2;
  v7 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t (**)(uint64_t *, uint64_t, uint64_t, ValueMetadata *))((char *)&v70
                                                                             - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (ValueMetadata *)type metadata accessor for State();
  Description = (uint64_t (**)(uint64_t *, uint64_t, uint64_t, ValueMetadata *))v13[-1].Description;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v85 = (uint64_t)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v70 - v17;
  v19 = objc_msgSend(a1, sel_storeItemID);
  v87 = v6;
  sub_222A723C0((uint64_t)v6, (uint64_t)v93);
  sub_222A716BC((uint64_t)v19, (uint64_t)v93, (uint64_t)&v90);
  if ((v91 & 1) != 0)
    return Description[7](a2, 1, 1, v13);
  v86 = v90;
  v82 = a2;
  v83 = v3 + 112;
  sub_222A89EBC(v3 + 112, (uint64_t)v93, (uint64_t *)&qword_2540C8028);
  v21 = v94;
  if (v94)
  {
    v81 = v9;
    v22 = v86;
    v23 = v18;
    v24 = (char *)Description;
    v25 = v95;
    __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    v89 = v22;
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, ValueMetadata *, uint64_t))(v25 + 8))(&v90, &v89, v21, v25);
    v26 = v90;
    v27 = v92;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
    if (v27)
    {
      v28 = objc_msgSend(a1, sel_storeExternalVersionID);
      swift_bridgeObjectRelease();
      LOBYTE(v27) = (uint64_t)v28 < v26;
    }
    Description = (uint64_t (**)(uint64_t *, uint64_t, uint64_t, ValueMetadata *))v24;
    v18 = v23;
  }
  else
  {
    sub_222A7DCD0((uint64_t)v93, (uint64_t *)&qword_2540C8028);
    LOBYTE(v27) = 0;
  }
  LOBYTE(v93[0]) = *(_BYTE *)(v3 + 152);
  v29 = a1;
  sub_222A79BB4(v29, (unsigned __int8 *)v93, v27, (uint64_t)v12);
  v81 = Description;
  v30 = ((uint64_t (*)(char *, uint64_t, ValueMetadata *))Description[6])(v12, 1, v13);
  v84 = v13;
  if (v30 != 1)
  {
    sub_222A7A688((uint64_t)v12, (uint64_t)v18);
    v35 = *(_QWORD *)(v3 + 40);
    v80 = *(_QWORD *)(v3 + 48);
    v79 = __swift_project_boxed_opaque_existential_1(v87, v35);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
    v37 = *(_QWORD *)(sub_222AAD5B0() - 8);
    v38 = *(_QWORD *)(v37 + 72);
    v39 = *(unsigned __int8 *)(v37 + 80);
    v40 = (v39 + 32) & ~v39;
    v77 = v36;
    v74 = v40 + v38;
    v75 = v39 | 7;
    v41 = swift_allocObject();
    v76 = xmmword_222AAE880;
    *(_OWORD *)(v41 + 16) = xmmword_222AAE880;
    v78 = v41 + v40;
    sub_222AAD58C();
    sub_222AAD580();
    v94 = v88;
    v93[0] = v3;
    swift_retain();
    sub_222AAD55C();
    sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
    sub_222AAD580();
    v94 = (ValueMetadata *)sub_222A8F9D0();
    v93[0] = (uint64_t)v29;
    v42 = v29;
    sub_222AAD55C();
    sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
    sub_222AAD580();
    v94 = v13;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v93);
    sub_222A78EE0((uint64_t)v18, (uint64_t)boxed_opaque_existential_0);
    sub_222AAD55C();
    sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
    sub_222AAD580();
    sub_222AAD5A4();
    sub_222AAD694();
    swift_bridgeObjectRelease();
    sub_222A89EBC(v83, (uint64_t)v93, (uint64_t *)&qword_2540C8028);
    v44 = v94;
    if (v94)
    {
      v79 = v42;
      v80 = v40;
      v45 = v95;
      __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
      v89 = v86;
      (*(void (**)(uint64_t *__return_ptr, uint64_t *, ValueMetadata *, uint64_t))(v45 + 8))(&v90, &v89, v44, v45);
      v47 = v90;
      v46 = v91;
      v48 = v92;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
      if (v48)
      {
        v49 = *(_QWORD *)(v3 + 40);
        v78 = *(_QWORD *)(v3 + 48);
        v73 = __swift_project_boxed_opaque_existential_1(v87, v49);
        v50 = swift_allocObject();
        *(_OWORD *)(v50 + 16) = v76;
        v72 = v50 + v80;
        sub_222AAD58C();
        sub_222AAD580();
        v94 = v88;
        v93[0] = v3;
        swift_retain();
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        v71 = v47;
        v93[0] = v47;
        v93[1] = v46;
        v70 = v46;
        v93[2] = v48;
        v94 = &type metadata for AvailableUpdate;
        swift_bridgeObjectRetain();
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        v94 = &type metadata for AdamID;
        v93[0] = v86;
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD688();
        swift_bridgeObjectRelease();
        v51 = v85;
        sub_222A78EE0((uint64_t)v18, v85);
        if (swift_getEnumCaseMultiPayload() == 5)
        {
          v52 = *(_QWORD *)(v51 + 8);
          if (objc_msgSend(v79, sel_storeItemID) && v52)
          {
            v53 = v71;
            if (v52 < v71)
            {
              v54 = *(_QWORD *)(v3 + 48);
              v85 = *(_QWORD *)(v3 + 40);
              v86 = v54;
              v87 = __swift_project_boxed_opaque_existential_1(v87, v85);
              *(_OWORD *)(swift_allocObject() + 16) = v76;
              v79 = v18;
              sub_222AAD58C();
              sub_222AAD580();
              v94 = v88;
              v93[0] = v3;
              swift_retain();
              sub_222AAD55C();
              sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
              sub_222AAD580();
              v55 = (ValueMetadata *)MEMORY[0x24BEE4008];
              v94 = (ValueMetadata *)MEMORY[0x24BEE4008];
              v93[0] = v53;
              sub_222AAD55C();
              sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
              sub_222AAD580();
              v94 = v55;
              v93[0] = v52;
              sub_222AAD55C();
              sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
              sub_222AAD580();
              v56 = v84;
              v94 = v84;
              v57 = __swift_allocate_boxed_opaque_existential_0(v93);
              v58 = v70;
              *v57 = v70;
              v57[1] = v48;
              swift_storeEnumTagMultiPayload();
              swift_bridgeObjectRetain();
              sub_222AAD55C();
              sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
              sub_222AAD580();
              sub_222AAD5A4();
              sub_222AAD688();
              swift_bridgeObjectRelease();
              sub_222A783C0((uint64_t)v79);
              v59 = v82;
              *v82 = v58;
              v59[1] = v48;
              swift_storeEnumTagMultiPayload();
              return v81[7](v59, 0, 1, v56);
            }
            swift_bridgeObjectRelease();
            __swift_project_boxed_opaque_existential_1(v87, *(_QWORD *)(v3 + 40));
            *(_OWORD *)(swift_allocObject() + 16) = v76;
            sub_222AAD58C();
            sub_222AAD580();
            v94 = v88;
            v93[0] = v3;
            swift_retain();
            sub_222AAD55C();
            sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
            sub_222AAD580();
            sub_222AAD5A4();
            sub_222AAD688();
            swift_bridgeObjectRelease();
            sub_222A89EBC(v83, (uint64_t)v93, (uint64_t *)&qword_2540C8028);
            v68 = v94;
            if (v94)
            {
              v69 = v95;
              __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
              v90 = v86;
              (*(void (**)(uint64_t *, ValueMetadata *, uint64_t))(v69 + 24))(&v90, v68, v69);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
            }
            else
            {
              sub_222A7DCD0((uint64_t)v93, (uint64_t *)&qword_2540C8028);
            }
            v66 = v84;
            v65 = v81;
            v64 = v82;
            v67 = (uint64_t)v18;
            goto LABEL_28;
          }
          v79 = v18;
          swift_bridgeObjectRelease();
        }
        else
        {
          v79 = v18;
          swift_bridgeObjectRelease();
          sub_222A783C0(v51);
        }
        v61 = *(_QWORD *)(v3 + 40);
        v85 = *(_QWORD *)(v3 + 48);
        __swift_project_boxed_opaque_existential_1(v87, v61);
        *(_OWORD *)(swift_allocObject() + 16) = v76;
        sub_222AAD58C();
        sub_222AAD580();
        v94 = v88;
        v93[0] = v3;
        swift_retain();
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        v94 = &type metadata for AdamID;
        v93[0] = v86;
        sub_222AAD55C();
        sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
        sub_222AAD580();
        sub_222AAD5A4();
        sub_222AAD688();
        swift_bridgeObjectRelease();
        sub_222A89EBC(v83, (uint64_t)v93, (uint64_t *)&qword_2540C8028);
        v62 = v94;
        if (v94)
        {
          v63 = v95;
          __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
          v90 = v86;
          (*(void (**)(uint64_t *, ValueMetadata *, uint64_t))(v63 + 24))(&v90, v62, v63);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
        }
        else
        {
          sub_222A7DCD0((uint64_t)v93, (uint64_t *)&qword_2540C8028);
        }
        v65 = v81;
        v64 = v82;
        v66 = v84;
        v67 = (uint64_t)v79;
LABEL_28:
        sub_222A7A688(v67, (uint64_t)v64);
        return v65[7](v64, 0, 1, v66);
      }
    }
    else
    {
      sub_222A7DCD0((uint64_t)v93, (uint64_t *)&qword_2540C8028);
    }
    v60 = v82;
    sub_222A7A688((uint64_t)v18, (uint64_t)v82);
    return v81[7](v60, 0, 1, v84);
  }
  sub_222A7DCD0((uint64_t)v12, &qword_2540C7E30);
  v31 = *(_QWORD *)(v3 + 40);
  v85 = *(_QWORD *)(v3 + 48);
  __swift_project_boxed_opaque_existential_1(v87, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v94 = v88;
  v93[0] = v3;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v94 = (ValueMetadata *)sub_222A8F9D0();
  v93[0] = (uint64_t)v29;
  v32 = v29;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v93, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  sub_222A89EBC(v83, (uint64_t)v93, (uint64_t *)&qword_2540C8028);
  v33 = v94;
  if (v94)
  {
    v34 = v95;
    __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    v90 = v86;
    (*(void (**)(uint64_t *, ValueMetadata *, uint64_t))(v34 + 24))(&v90, v33, v34);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  }
  else
  {
    sub_222A7DCD0((uint64_t)v93, (uint64_t *)&qword_2540C8028);
  }
  return v81[7](v82, 1, 1, v84);
}

uint64_t sub_222A8F538()
{
  return swift_retain();
}

uint64_t sub_222A8F544()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A7E220;
  return DeviceAppStateDataSource.load()();
}

uint64_t sub_222A8F58C(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E0EC;
  return DeviceAppStateDataSource.reloadState(forAppsWith:synchronizing:)(a1, a2);
}

uint64_t sub_222A8F5EC(char a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_222A7E220;
  return DeviceAppStateDataSource.reloadAllStates(synchronizing:)(a1);
}

void sub_222A8F63C()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F994();
  os_unfair_lock_unlock(v1);
}

BOOL sub_222A8F6AC(uint64_t a1)
{
  return DeviceAppStateDataSource.providesState(forApp:)(a1);
}

uint64_t sub_222A8F6D0()
{
  return DeviceAppStateDataSource.description.getter();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_222A8F708(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_222A8F728(void *a1, char a2, _QWORD *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void **, uint64_t *, uint64_t (*)(_QWORD *), uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26[5];
  void *v27;
  char v28;
  uint64_t v29[5];

  v14 = sub_222AAD748();
  v29[3] = v14;
  v29[4] = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(boxed_opaque_existential_0, a6, v14);
  *(_QWORD *)(a7 + 176) = 0;
  *(_QWORD *)(a7 + 184) = 0;
  *(_QWORD *)(a7 + 56) = a1;
  *(_BYTE *)(a7 + 64) = a2;
  sub_222A723C0((uint64_t)a3, a7 + 72);
  sub_222A89EBC(a4, a7 + 112, &qword_2540C8028);
  *(_BYTE *)(a7 + 152) = a5;
  v16 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a7 + 160) = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  sub_222A85EAC(a1, a2);
  *(_QWORD *)(a7 + 168) = sub_222A8FC8C(v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  *(_QWORD *)(a7 + 200) = sub_222AAD778();
  sub_222A723C0((uint64_t)v29, a7 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(_QWORD *)(a7 + 192) = v17;
  v18 = a3[3];
  v19 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v18);
  v27 = a1;
  v28 = a2;
  v26[3] = sub_222AAD628();
  v26[4] = MEMORY[0x24BE5D370];
  __swift_allocate_boxed_opaque_existential_0(v26);
  sub_222AAD61C();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = *(uint64_t (**)(void **, uint64_t *, uint64_t (*)(_QWORD *), uint64_t, uint64_t, uint64_t))(v19 + 8);
  swift_retain();
  v22 = v21(&v27, v26, sub_222A8FA30, v20, v18, v19);
  v24 = v23;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  sub_222A7DCD0(a4, &qword_2540C8028);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  sub_222A85DDC(a1, a2);
  *(_QWORD *)(a7 + 176) = v22;
  *(_QWORD *)(a7 + 184) = v24;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return a7;
}

uint64_t type metadata accessor for DeviceAppStateDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for DeviceAppStateDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_222A8F97C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222A8CF8C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_222A8F994()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_222A8F9B4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_222A8D654(*(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(uint64_t **)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_222A8F9D0()
{
  unint64_t result;

  result = qword_2540C81B0;
  if (!qword_2540C81B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C81B0);
  }
  return result;
}

uint64_t sub_222A8FA0C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_222A8FA30(_QWORD *a1)
{
  return sub_222A8C020(a1);
}

unint64_t sub_222A8FA38()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2540C81F0;
  if (!qword_2540C81F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C81F8);
    v2 = sub_222A8FA9C();
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE2B38], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2540C81F0);
  }
  return result;
}

unint64_t sub_222A8FA9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2540C8168;
  if (!qword_2540C8168)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C8160);
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2540C8168);
  }
  return result;
}

uint64_t sub_222A8FAE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_222A8D410(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_222A8FB04()
{
  unint64_t result;

  result = qword_2540C80B8;
  if (!qword_2540C80B8)
  {
    result = MEMORY[0x227677FFC](&protocol conformance descriptor for AdamID, &type metadata for AdamID);
    atomic_store(result, (unint64_t *)&qword_2540C80B8);
  }
  return result;
}

void sub_222A8FB48(_QWORD *a1@<X8>)
{
  sub_222A8F9B4(a1);
}

unint64_t sub_222A8FB5C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _BYTE v13[8];
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8210);
  v2 = sub_222AADAA8();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_222A89EBC(v6, (uint64_t)v13, &qword_2540C7DF0);
    v7 = v13[0];
    result = sub_222A8B2B4(v13[0]);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v7;
    result = sub_222A80690(&v14, v3[7] + 40 * result);
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_222A8FC8C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C76A8);
  v2 = (_QWORD *)sub_222AADAA8();
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
    result = sub_222A8B30C(v5, v6);
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
    v4 += 3;
    v2[2] = v13;
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

uint64_t sub_222A8FD9C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v15 = MEMORY[0x24BEE4AF8];
  sub_222AA5168(0, v1, 0);
  v2 = v15;
  result = sub_222AA7BD0(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v7)
      goto LABEL_14;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v5);
    v12 = *(_QWORD *)(v15 + 16);
    v11 = *(_QWORD *)(v15 + 24);
    if (v12 >= v11 >> 1)
      sub_222AA5168((char *)(v11 > 1), v12 + 1, 1);
    *(_QWORD *)(v15 + 16) = v12 + 1;
    *(_QWORD *)(v15 + 8 * v12 + 32) = v10;
    result = sub_222AA7C74(v5, v7, v9 & 1, a1);
    v5 = result;
    v7 = v13;
    v9 = v14 & 1;
    if (!--v1)
    {
      sub_222A8BEB4(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t DeviceUpdateRegistry.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_2540C8110 != -1)
    swift_once();
  v0 = sub_222AAD748();
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2540C8E90);
  v8 = v0;
  v9 = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(boxed_opaque_existential_0, v1, v0);
  v3 = swift_allocObject();
  v4 = sub_222A90ECC(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81E0);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v3 + 16) = v5;
  sub_222A80690(&v7, v3 + 24);
  return v3;
}

uint64_t DeviceUpdateRegistry.entry(forAdamID:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v4 = *a1;
  v5 = *(os_unfair_lock_s **)(v2 + 16);
  swift_retain();
  os_unfair_lock_lock(v5 + 6);
  sub_222A90060((unint64_t)&v5[4], v4, a2);
  os_unfair_lock_unlock(v5 + 6);
  return swift_release();
}

unint64_t sub_222A90060@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)result;
  if (*(_QWORD *)(*(_QWORD *)result + 16) && (result = sub_222A8B200(a2), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(v4 + 56) + 24 * result;
    v7 = *(_QWORD *)(v6 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v6;
    *(_QWORD *)(a3 + 16) = v7;
    return swift_bridgeObjectRetain();
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

uint64_t DeviceUpdateRegistry.addEntry(_:forAdamID:)(uint64_t *a1, uint64_t *a2)
{
  ValueMetadata **v2;
  ValueMetadata *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ValueMetadata *v10;
  uint64_t v12;
  _QWORD v13[3];
  ValueMetadata *v14;

  v5 = *v2;
  v6 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v6);
  v7 = *a1;
  v12 = a1[1];
  v8 = a1[2];
  v9 = *a2;
  __swift_project_boxed_opaque_existential_1(v2 + 3, (uint64_t)v2[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v14 = v5;
  v13[0] = v2;
  swift_retain();
  sub_222AAD55C();
  sub_222A72468((uint64_t)v13);
  sub_222AAD580();
  v13[0] = v7;
  v13[1] = v12;
  v13[2] = v8;
  v14 = &type metadata for AvailableUpdate;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A72468((uint64_t)v13);
  sub_222AAD580();
  v14 = (ValueMetadata *)MEMORY[0x24BEE4008];
  v13[0] = v9;
  sub_222AAD55C();
  sub_222A72468((uint64_t)v13);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v10 = v2[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)&v10[1].Description);
  sub_222A90318(&v10[1].Kind, v9, v7, v12, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)&v10[1].Description);
  return swift_release();
}

uint64_t sub_222A90318(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *a1;
  *a1 = 0x8000000000000000;
  sub_222AACD00(a3, a4, a5, a2, isUniquelyReferenced_nonNull_native);
  *a1 = v12;
  return swift_bridgeObjectRelease();
}

uint64_t DeviceUpdateRegistry.removeEntry(forAdamID:)(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = *v1;
  v4 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v4);
  v5 = *a1;
  __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v9 = v3;
  v8[0] = v1;
  swift_retain();
  sub_222AAD55C();
  sub_222A72468((uint64_t)v8);
  sub_222AAD580();
  v9 = MEMORY[0x24BEE4008];
  v8[0] = v5;
  sub_222AAD55C();
  sub_222A72468((uint64_t)v8);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v6 = v1[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  sub_222A90580((uint64_t *)(v6 + 16), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
  return swift_release();
}

unint64_t sub_222A90580(uint64_t *a1, uint64_t a2)
{
  unint64_t result;
  char v4;
  unint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;

  result = sub_222A8B200(a2);
  if ((v4 & 1) != 0)
  {
    v5 = result;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v7 = *a1;
    v8 = *a1;
    *a1 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_222AAC440();
      v7 = v8;
    }
    sub_222AABCA4(v5, v7);
    *a1 = v7;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t DeviceUpdateRegistry.removeEntries(forAdamIDs:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  v3 = *v1;
  v4 = sub_222AAD598();
  result = MEMORY[0x24BDAC7A8](v4);
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
    sub_222AAD5B0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
    sub_222AAD58C();
    sub_222AAD580();
    v9 = v3;
    v8[0] = v1;
    swift_retain();
    sub_222AAD55C();
    sub_222A72468((uint64_t)v8);
    sub_222AAD580();
    v6 = sub_222A8FD9C(a1);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7360);
    v8[0] = v6;
    sub_222AAD55C();
    sub_222A72468((uint64_t)v8);
    sub_222AAD580();
    sub_222AAD5A4();
    sub_222AAD688();
    swift_bridgeObjectRelease();
    v7 = v1[2];
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
    sub_222A90818((uint64_t *)(v7 + 16), a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
    return swift_release();
  }
  return result;
}

unint64_t sub_222A90818(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  char v16;
  unint64_t v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;

  v4 = a2 + 56;
  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v10 << 6);
LABEL_20:
    result = sub_222A8B200(*(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v12));
    if ((v16 & 1) != 0)
    {
      v17 = result;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v19 = *a1;
      v20 = *a1;
      *a1 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_222AAC440();
        v19 = v20;
      }
      sub_222AABCA4(v17, v19);
      *a1 = v19;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
  }
  v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v13 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v13);
  ++v10;
  if (v14)
    goto LABEL_19;
  v10 = v13 + 1;
  if (v13 + 1 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
    goto LABEL_19;
  v10 = v13 + 2;
  if (v13 + 2 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_19:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_20;
  }
  v15 = v13 + 3;
  if (v15 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v14 = *(_QWORD *)(v4 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t DeviceUpdateRegistry.deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return v0;
}

uint64_t DeviceUpdateRegistry.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_222A90A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)v1 + 16);
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_222A9100C((unint64_t)&v3[4], a1);
  os_unfair_lock_unlock(v3 + 6);
  return swift_release();
}

uint64_t sub_222A90AA0(uint64_t *a1, uint64_t *a2)
{
  return DeviceUpdateRegistry.addEntry(_:forAdamID:)(a1, a2);
}

uint64_t sub_222A90AC0(uint64_t *a1)
{
  return DeviceUpdateRegistry.removeEntry(forAdamID:)(a1);
}

uint64_t sub_222A90AE0(uint64_t a1)
{
  return DeviceUpdateRegistry.removeEntries(forAdamIDs:)(a1);
}

unint64_t sub_222A90B00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BE0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8200);
    v7 = (_QWORD *)sub_222AADAA8();
    v8 = (uint64_t)&v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_222A89EBC(v9, (uint64_t)v5, &qword_2540C7BE0);
      v11 = *v5;
      result = sub_222A8B258(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v7[6] + result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for State();
      result = sub_222A7A688(v8, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_222A90C60(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t i;
  char v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  char v11[8];
  __int128 v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8208);
    v3 = (_QWORD *)sub_222AADAA8();
    for (i = a1 + 32; ; i += 48)
    {
      sub_222A89EBC(i, (uint64_t)v11, &qword_2540C7BE8);
      v5 = v11[0];
      result = sub_222A8B258(v11[0]);
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      result = sub_222A80690(&v12, v3[7] + 40 * result);
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_222A90D6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C80C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8218);
    v7 = (_QWORD *)sub_222AADAA8();
    v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_222A89EBC(v9, (uint64_t)v5, &qword_2540C80C8);
      v11 = *v5;
      result = sub_222A8B200(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v7[6] + 8 * result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for State();
      result = sub_222A7A688(v8, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_222A90ECC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768C30);
  v3 = (_QWORD *)sub_222AADAA8();
  v4 = a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  result = sub_222A8B200(v4);
  if ((v9 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v10 = a1 + 11;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v11 = (_QWORD *)(v3[7] + 24 * result);
    *v11 = v5;
    v11[1] = v7;
    v11[2] = v6;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      break;
    v3[2] = v14;
    if (!--v1)
      goto LABEL_8;
    v15 = v10 + 4;
    v4 = *(v10 - 3);
    v5 = *(v10 - 2);
    v7 = *(v10 - 1);
    v16 = *v10;
    swift_bridgeObjectRetain();
    result = sub_222A8B200(v4);
    v10 = v15;
    v6 = v16;
    if ((v17 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DeviceUpdateRegistry()
{
  return objc_opt_self();
}

uint64_t method lookup function for DeviceUpdateRegistry()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_222A9100C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_222A90060(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_222A91024(_QWORD *a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7380);
  v3 = (_QWORD *)sub_222AADAA8();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_222A8B200(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
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
    swift_retain();
    result = sub_222A8B200(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_222A91120(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7370);
    v3 = (_QWORD *)sub_222AADAA8();
    for (i = (_QWORD *)(a1 + 96); ; i += 9)
    {
      v5 = *(i - 8);
      v6 = *((_BYTE *)i - 56);
      v19 = *((_OWORD *)i - 3);
      v7 = *((_BYTE *)i - 32);
      v9 = *(i - 3);
      v8 = *(i - 2);
      v11 = *(i - 1);
      v10 = *i;
      result = sub_222A8B188(v5, v6);
      if ((v13 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v14 = v3[6] + 16 * result;
      *(_QWORD *)v14 = v5;
      *(_BYTE *)(v14 + 8) = v6;
      v15 = v3[7] + 56 * result;
      *(_OWORD *)v15 = v19;
      *(_BYTE *)(v15 + 16) = v7;
      *(_QWORD *)(v15 + 24) = v9;
      *(_QWORD *)(v15 + 32) = v8;
      *(_QWORD *)(v15 + 40) = v11;
      *(_QWORD *)(v15 + 48) = v10;
      v16 = v3[2];
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
        goto LABEL_10;
      v3[2] = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t DisabledArcadeSubscriptionManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7538);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_222AAD544();
  return v0;
}

uint64_t DisabledArcadeSubscriptionManager.init()()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7538);
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_222AAD544();
  return v0;
}

void DisabledArcadeSubscriptionManager.subscriptionState.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 3;
}

uint64_t DisabledArcadeSubscriptionManager.onSubscriptionStateChange.getter()
{
  return swift_retain();
}

uint64_t DisabledArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_222A9131C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DisabledArcadeSubscriptionManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t DisabledArcadeSubscriptionManager.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_222A91378(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 3;
}

uint64_t sub_222A91388(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for DisabledArcadeSubscriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for DisabledArcadeSubscriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisabledArcadeSubscriptionManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

ValueMetadata *_s12DownloadableVMa()
{
  return &_s12DownloadableVN;
}

uint64_t sub_222A913EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unsigned int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  uint64_t v14;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  sub_222A78EE0(a2, (uint64_t)&v14 - v8);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_222A759F4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if ((_DWORD)a2 != 3)
    return 0;
  sub_222A78EE0(a1, (uint64_t)v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload > 8)
    goto LABEL_8;
  v11 = 1;
  if (((1 << EnumCaseMultiPayload) & 0x1A3) == 0)
  {
    if (EnumCaseMultiPayload == 2)
    {
LABEL_9:
      v12 = (uint64_t (*)(_QWORD))type metadata accessor for State;
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 4)
    {
      v12 = type metadata accessor for AppInstallation;
LABEL_10:
      sub_222A759F4((uint64_t)v7, v12);
      return v11;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  return v11;
}

uint64_t sub_222A9151C()
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
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned int v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v0 = sub_222AAD3B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7618);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7620);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = 0x2F2F3A7370747468;
  v49 = 0xE90000000000003FLL;
  sub_222AAD7D8();
  sub_222AAD3D0();
  swift_bridgeObjectRelease();
  v10 = sub_222AAD3DC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_222A7DCD0((uint64_t)v6, &qword_2540C7618);
    return 0;
  }
  v12 = sub_222AAD3C4();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  if (!v12)
    return 0;
  v47 = v9;
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v14 = v12 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v15 = v12;
    v16 = *(_QWORD *)(v1 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v46 = v15;
    swift_bridgeObjectRetain();
    while (1)
    {
      v17(v3, v14, v0);
      if (sub_222AAD3A0() == 0x7256747845707061 && v18 == 0xEB00000000644973)
        break;
      v19 = sub_222AADAD8();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_13;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v14 += v16;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_13:
    swift_bridgeObjectRelease();
    v21 = (uint64_t)v47;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v47, v3, v0);
    v20 = 0;
  }
  else
  {
LABEL_11:
    v20 = 1;
    v21 = (uint64_t)v47;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v21, v20, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v21, 1, v0) == 1)
  {
    sub_222A7DCD0(v21, &qword_2540C7620);
    return 0;
  }
  v22 = sub_222AAD3AC();
  v24 = v23;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v21, v0);
  if (!v24)
    return 0;
  v26 = HIBYTE(v24) & 0xF;
  v27 = v22 & 0xFFFFFFFFFFFFLL;
  if ((v24 & 0x2000000000000000) != 0)
    v28 = HIBYTE(v24) & 0xF;
  else
    v28 = v22 & 0xFFFFFFFFFFFFLL;
  if (!v28)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v24 & 0x1000000000000000) == 0)
  {
    if ((v24 & 0x2000000000000000) == 0)
    {
      if ((v22 & 0x1000000000000000) != 0)
        v29 = (unsigned __int8 *)((v24 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v29 = (unsigned __int8 *)sub_222AADA24();
      v30 = (uint64_t)sub_222A720F8(v29, v27, 10);
      v32 = v31 & 1;
      goto LABEL_60;
    }
    v48 = v22;
    v49 = v24 & 0xFFFFFFFFFFFFFFLL;
    if (v22 == 43)
    {
      if (!v26)
        goto LABEL_74;
      if (v26 == 1 || (BYTE1(v22) - 48) > 9u)
        goto LABEL_47;
      v30 = (BYTE1(v22) - 48);
      if (v26 != 2)
      {
        if ((BYTE2(v22) - 48) > 9u)
          goto LABEL_47;
        v30 = 10 * (BYTE1(v22) - 48) + (BYTE2(v22) - 48);
        v33 = v26 - 3;
        if (v33)
        {
          v34 = (unsigned __int8 *)&v48 + 3;
          while (1)
          {
            v35 = *v34 - 48;
            if (v35 > 9)
              goto LABEL_47;
            v36 = 10 * v30;
            if ((unsigned __int128)(v30 * (__int128)10) >> 64 != (10 * v30) >> 63)
              goto LABEL_47;
            v30 = v36 + v35;
            if (__OFADD__(v36, v35))
              goto LABEL_47;
            v32 = 0;
            ++v34;
            if (!--v33)
              goto LABEL_60;
          }
        }
      }
    }
    else
    {
      if (v22 == 45)
      {
        if (v26)
        {
          if (v26 != 1 && (BYTE1(v22) - 48) <= 9u)
          {
            if (v26 == 2)
            {
              v32 = 0;
              v30 = -(uint64_t)(BYTE1(v22) - 48);
              goto LABEL_60;
            }
            if ((BYTE2(v22) - 48) <= 9u)
            {
              v30 = -10 * (BYTE1(v22) - 48) - (BYTE2(v22) - 48);
              v41 = v26 - 3;
              if (!v41)
                goto LABEL_59;
              v42 = (unsigned __int8 *)&v48 + 3;
              while (1)
              {
                v43 = *v42 - 48;
                if (v43 > 9)
                  break;
                v44 = 10 * v30;
                if ((unsigned __int128)(v30 * (__int128)10) >> 64 != (10 * v30) >> 63)
                  break;
                v30 = v44 - v43;
                if (__OFSUB__(v44, v43))
                  break;
                v32 = 0;
                ++v42;
                if (!--v41)
                  goto LABEL_60;
              }
            }
          }
LABEL_47:
          v30 = 0;
          v32 = 1;
          goto LABEL_60;
        }
        __break(1u);
LABEL_74:
        __break(1u);
        return result;
      }
      if (!v26 || (v22 - 48) > 9u)
        goto LABEL_47;
      v30 = (v22 - 48);
      if (v26 != 1)
      {
        if ((BYTE1(v22) - 48) > 9u)
          goto LABEL_47;
        v30 = 10 * (v22 - 48) + (BYTE1(v22) - 48);
        v37 = v26 - 2;
        if (v37)
        {
          v38 = (unsigned __int8 *)&v48 + 2;
          while (1)
          {
            v39 = *v38 - 48;
            if (v39 > 9)
              goto LABEL_47;
            v40 = 10 * v30;
            if ((unsigned __int128)(v30 * (__int128)10) >> 64 != (10 * v30) >> 63)
              goto LABEL_47;
            v30 = v40 + v39;
            if (__OFADD__(v40, v39))
              goto LABEL_47;
            v32 = 0;
            ++v38;
            if (!--v37)
              goto LABEL_60;
          }
        }
      }
    }
LABEL_59:
    v32 = 0;
    goto LABEL_60;
  }
  v30 = (uint64_t)sub_222A7210C(v22, v24, 10);
  v32 = v45;
LABEL_60:
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    return 0;
  else
    return v30;
}

id sub_222A91AE4()
{
  if (qword_2540C75C8 != -1)
    swift_once();
  qword_2540C7508 = qword_2540C75C0;
  return (id)qword_2540C75C0;
}

AppState::GreenTeaLogger __swiftcall GreenTeaLogger.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  objc_class *v3;
  ct_green_tea_logger_s *v4;
  AppState::GreenTeaLogger result;

  v1 = v0;
  if (qword_2540C75C8 != -1)
    swift_once();
  v2 = (void *)qword_2540C75C0;
  *v1 = qword_2540C75C0;
  v3 = v2;
  result.backing._logger = v4;
  result.backing.super.isa = v3;
  return result;
}

id static GreenTeaLogger.shared.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_2540C71E0 != -1)
    swift_once();
  v2 = (void *)qword_2540C7508;
  *a1 = qword_2540C7508;
  return v2;
}

Swift::Void __swiftcall GreenTeaLogger.willAccessLocationForSearch()()
{
  id *v0;

  objc_msgSend(*v0, sel_willAccessLocationForSearch);
}

Swift::Void __swiftcall GreenTeaLogger.willTransmitLocationForSearch()()
{
  id *v0;

  objc_msgSend(*v0, sel_willTransmitLocationForSearch);
}

Swift::Void __swiftcall GreenTeaLogger.willRequestAppList()()
{
  id *v0;

  objc_msgSend(*v0, sel_willRequestAppList);
}

id sub_222A91BFC()
{
  id *v0;

  return objc_msgSend(*v0, sel_willAccessLocationForSearch);
}

id sub_222A91C0C()
{
  id *v0;

  return objc_msgSend(*v0, sel_willTransmitLocationForSearch);
}

id sub_222A91C1C()
{
  id *v0;

  return objc_msgSend(*v0, sel_willRequestAppList);
}

id sub_222A91C2C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)ASGreenTeaLogger), sel_init);
  qword_2540C75C0 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for GreenTeaLogger()
{
  return &type metadata for GreenTeaLogger;
}

uint64_t sub_222A91C6C(uint64_t a1, uint64_t a2)
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
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[2];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[6];

  v33 = a1;
  v34 = a2;
  v32 = sub_222AAD508();
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_222AAD91C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_222AAD520();
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_222AAD910();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v11);
  *(_BYTE *)(v2 + 24) = 2;
  v27[1] = sub_222A92594();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7600);
  v13 = swift_allocObject();
  v28 = xmmword_222AAE880;
  *(_OWORD *)(v13 + 16) = xmmword_222AAE880;
  sub_222AAD904();
  aBlock[0] = v13;
  sub_222A71270(&qword_2540C81A0, v12, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8148);
  sub_222A925D0((unint64_t *)&unk_2540C8150, &qword_2540C8148);
  sub_222AAD9C4();
  sub_222AAD514();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v4);
  v14 = sub_222AAD940();
  v15 = v29;
  *(_QWORD *)(v29 + 16) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8248);
  v16 = v30;
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v28;
  sub_222AAD4FC();
  aBlock[0] = v17;
  sub_222A71270(&qword_2540C80D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8138);
  sub_222A925D0(&qword_2540C8140, &qword_2540C8138);
  v19 = v31;
  v18 = v32;
  sub_222AAD9C4();
  v20 = swift_allocObject();
  v21 = v15;
  swift_weakInit();
  v22 = (_QWORD *)swift_allocObject();
  v23 = v33;
  v24 = v34;
  v22[2] = v20;
  v22[3] = v23;
  v22[4] = v24;
  aBlock[4] = sub_222A92660;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A9B720;
  aBlock[3] = &block_descriptor_3;
  v25 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_222AAD514();
  MEMORY[0x227677978](0, v10, v19, v25);
  _Block_release(v25);
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v36);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v18);
  swift_release();
  swift_release();
  return v21;
}

uint64_t sub_222A92078(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result;
    a2(&v5);
    *(_BYTE *)(v4 + 24) = v5;
    return swift_release();
  }
  return result;
}

uint64_t HardwarePlatform.init(bag:device:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _OWORD v14[2];
  __int128 v15;
  char v16;
  uint64_t v17[5];

  v6 = sub_222AAD664();
  v17[3] = v6;
  v17[4] = (uint64_t)&off_24E975E10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v17);
  v8 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(boxed_opaque_existential_0, a2, v6);
  sub_222A723C0((uint64_t)v17, (uint64_t)v14);
  v16 = 0;
  v9 = swift_allocObject();
  *(_BYTE *)(v9 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7500);
  swift_allocObject();
  v10 = sub_222A91C6C((uint64_t)sub_222A92218, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *((_QWORD *)&v15 + 1) = v10;
  v11 = v14[1];
  *(_OWORD *)a3 = v14[0];
  *(_OWORD *)(a3 + 16) = v11;
  *(_BYTE *)(a3 + 48) = v16;
  *(_OWORD *)(a3 + 32) = v15;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v6);
  v12 = sub_222AAD658();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
}

uint64_t sub_222A92208()
{
  return swift_deallocObject();
}

void sub_222A92218(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t HardwarePlatform.isAppleSiliconSupportEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t HardwarePlatform.isRosettaAvailable.getter()
{
  unsigned __int8 v1;

  sub_222AAD928();
  return v1;
}

uint64_t HardwarePlatform.isRunnable(_:)(void *a1)
{
  if ((objc_msgSend(a1, sel_watchOnly) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, sel_supportsIPad) & 1) != 0)
    return 1;
  return (uint64_t)objc_msgSend(a1, sel_supportsIPhone);
}

uint64_t sub_222A922DC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_222A922E4()
{
  unsigned __int8 v1;

  sub_222AAD928();
  return v1;
}

uint64_t sub_222A92334(void *a1)
{
  if ((objc_msgSend(a1, sel_watchOnly) & 1) != 0)
    return 0;
  if (objc_msgSend(a1, sel_supportsIPad))
    return 1;
  return (uint64_t)objc_msgSend(a1, sel_supportsIPhone);
}

void sub_222A92394(_BYTE *a1@<X8>)
{
  sub_222A92578(a1);
}

uint64_t destroy for HardwarePlatform(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HardwarePlatform(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HardwarePlatform(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HardwarePlatform()
{
  return &type metadata for HardwarePlatform;
}

void sub_222A92578(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(unsigned __int8 *)(v1 + 24);
  if (v2 == 2)
    __break(1u);
  else
    *a1 = v2 & 1;
}

unint64_t sub_222A92594()
{
  unint64_t result;

  result = qword_2540C81A8;
  if (!qword_2540C81A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C81A8);
  }
  return result;
}

uint64_t sub_222A925D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x227677FFC](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_222A92610()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_222A92634()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A92660()
{
  uint64_t v0;

  return sub_222A92078(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t *__return_ptr))(v0 + 24));
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

ValueMetadata *_s9InstalledVMa()
{
  return &_s9InstalledVN;
}

uint64_t sub_222A92698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unsigned int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v19;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v19 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - v14;
  sub_222A78EE0(a2, (uint64_t)&v19 - v14);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_222A759F4((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if ((_DWORD)a2 == 7)
  {
    sub_222A78EE0(a1, (uint64_t)v13);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload <= 8)
    {
      v17 = 1;
      if (((1 << EnumCaseMultiPayload) & 0x12C) != 0)
      {
LABEL_10:
        sub_222A759F4((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for State);
        return v17;
      }
      if (EnumCaseMultiPayload == 1)
      {
        sub_222A78EE0((uint64_t)v13, (uint64_t)v7);
        if ((*v7 & 1) != 0)
          goto LABEL_10;
      }
      else if (EnumCaseMultiPayload == 4)
      {
        sub_222A78EE0((uint64_t)v13, (uint64_t)v10);
        sub_222A759F4((uint64_t)v10, type metadata accessor for AppInstallation);
        goto LABEL_10;
      }
    }
    v17 = 0;
    goto LABEL_10;
  }
  return 0;
}

ValueMetadata *_s10InstallingVMa()
{
  return &_s10InstallingVN;
}

uint64_t sub_222A92840(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int EnumCaseMultiPayload;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v32;
  uint64_t v33;

  v32 = a1;
  v33 = a2;
  v2 = type metadata accessor for AppInstallation(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v32 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v32 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  v14 = type metadata accessor for State();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EB8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (uint64_t)&v20[*(int *)(v18 + 48)];
  sub_222A75DC0(v32, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for State);
  sub_222A75DC0(v33, v21, (uint64_t (*)(_QWORD))type metadata accessor for State);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 4)
  {
    if (EnumCaseMultiPayload == 8)
    {
      sub_222A759F4(v21, (uint64_t (*)(_QWORD))type metadata accessor for State);
      v23 = (uint64_t)v20;
LABEL_10:
      sub_222A759F4(v23, (uint64_t (*)(_QWORD))type metadata accessor for State);
      return 1;
    }
LABEL_8:
    if (swift_getEnumCaseMultiPayload() != 4)
    {
      sub_222A7DCD0((uint64_t)v20, &qword_2540C7EB8);
      return 0;
    }
    sub_222A759F4(v21, type metadata accessor for AppInstallation);
    v23 = (uint64_t)v20;
    goto LABEL_10;
  }
  sub_222A75DC0((uint64_t)v20, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if (swift_getEnumCaseMultiPayload() != 4)
  {
    sub_222A759F4((uint64_t)v16, type metadata accessor for AppInstallation);
    goto LABEL_8;
  }
  sub_222A7DC8C((uint64_t)v16, (uint64_t)v13, type metadata accessor for AppInstallation);
  sub_222A7DC8C(v21, (uint64_t)v11, type metadata accessor for AppInstallation);
  sub_222A92B3C((uint64_t)&v13[*(int *)(v2 + 20)], (uint64_t)&v11[*(int *)(v2 + 20)]);
  v25 = v24;
  sub_222A7DC8C((uint64_t)v13, (uint64_t)v8, type metadata accessor for AppInstallation);
  sub_222A7DC8C((uint64_t)v11, (uint64_t)v5, type metadata accessor for AppInstallation);
  if ((v25 & 1) != 0)
  {
    v26 = *(int *)(v2 + 24);
    v27 = &v8[v26];
    v28 = &v5[v26];
    v29 = type metadata accessor for AppInstallation.Progress(0);
    v30 = *(double *)&v27[*(int *)(v29 + 20)] <= *(double *)&v28[*(int *)(v29 + 20)];
  }
  else
  {
    v30 = 0;
  }
  sub_222A759F4((uint64_t)v5, type metadata accessor for AppInstallation);
  sub_222A759F4((uint64_t)v8, type metadata accessor for AppInstallation);
  sub_222A759F4((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return v30;
}

void sub_222A92B3C(uint64_t a1, uint64_t a2)
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  _QWORD v38[12];
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;

  v41 = a1;
  v42 = (char *)a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BF8);
  MEMORY[0x24BDAC7A8](v2);
  v38[8] = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for AppInstallation.Progress(0);
  v4 = MEMORY[0x24BDAC7A8](v39);
  v38[11] = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v38[10] = (char *)v38 - v6;
  v7 = type metadata accessor for AppInstallation.Phase(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v38[4] = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v38[3] = (char *)v38 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v38[5] = (char *)v38 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v38[9] = (char *)v38 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v38[2] = (char *)v38 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v38[1] = (char *)v38 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v38[7] = (char *)v38 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v38[6] = (char *)v38 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v40 = (char *)v38 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v38[0] = (char *)v38 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v31 = MEMORY[0x24BDAC7A8](v30);
  MEMORY[0x24BDAC7A8](v31);
  v32 = __swift_instantiateConcreteTypeFromMangledName(qword_2540C76B0);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)v38 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = (uint64_t)&v35[*(int *)(v33 + 48)];
  sub_222A75DC0(v41, (uint64_t)v35, type metadata accessor for AppInstallation.Phase);
  sub_222A75DC0((uint64_t)v42, v36, type metadata accessor for AppInstallation.Phase);
  v42 = v35;
  v37 = (char *)sub_222A92E80 + 4 * byte_222AB0040[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_222A92E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v5 = *(_QWORD *)(v4 - 104);
  sub_222A75DC0(v5, v1, type metadata accessor for AppInstallation.Phase);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v14 = swift_projectBox();
    sub_222A75DC0(v14, v2, type metadata accessor for AppInstallation.Phase);
    sub_222A75DC0(v2, v3, type metadata accessor for AppInstallation.Phase);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      sub_222A759F4(v2, type metadata accessor for AppInstallation.Phase);
      v15 = swift_projectBox();
      v16 = *(_QWORD *)(v4 - 160);
      sub_222A75DC0(v15, v16, type metadata accessor for AppInstallation.Phase);
      sub_222A759F4(v16, type metadata accessor for AppInstallation.Phase);
      swift_release();
      swift_release();
      sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
      sub_222A759F4(v5, type metadata accessor for AppInstallation.Phase);
    }
    else
    {
      sub_222A759F4(v3, type metadata accessor for AppInstallation.Phase);
      v18 = *(_QWORD *)(v4 - 224);
      sub_222A7DC8C(v2, v18, type metadata accessor for AppInstallation.Phase);
      if (!swift_getEnumCaseMultiPayload())
      {
        sub_222A759F4(v18, type metadata accessor for AppInstallation.Progress);
        swift_release();
        sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
        v7 = v5;
        goto LABEL_7;
      }
      sub_222A759F4(v18, type metadata accessor for AppInstallation.Phase);
      swift_release();
      sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
      sub_222A759F4(v5, type metadata accessor for AppInstallation.Phase);
    }
    return 0;
  }
  if (EnumCaseMultiPayload)
  {
    sub_222A759F4(v1, type metadata accessor for AppInstallation.Progress);
    sub_222A759F4(v0, type metadata accessor for AppInstallation.Phase);
    v7 = v5;
LABEL_7:
    sub_222A759F4(v7, type metadata accessor for AppInstallation.Phase);
    return 1;
  }
  v8 = *(_QWORD *)(v4 - 144);
  sub_222A7DC8C(v1, v8, type metadata accessor for AppInstallation.Progress);
  v9 = *(_QWORD *)(v4 - 136);
  sub_222A7DC8C(v0, v9, type metadata accessor for AppInstallation.Progress);
  v10 = *(_QWORD *)(v4 - 128);
  v11 = *(double *)(v8 + *(int *)(v10 + 20));
  sub_222A759F4(v8, type metadata accessor for AppInstallation.Progress);
  v12 = *(double *)(v9 + *(int *)(v10 + 20));
  sub_222A759F4(v9, type metadata accessor for AppInstallation.Progress);
  v13 = v11 < v12;
  sub_222A759F4(v5, type metadata accessor for AppInstallation.Phase);
  return v13;
}

_QWORD *ManagedRestrictions.__allocating_init(accounts:)(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];

  sub_222A723C0(a1, (uint64_t)v6);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    swift_allocObject();
    v5 = sub_222A93C40(v6, v3, v4);

    __swift_destroy_boxed_opaque_existential_1(a1);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*sub_222A93600())()
{
  swift_retain();
  return sub_222A93F20;
}

uint64_t ManagedRestrictions.deinit()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 64), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return v0;
}

uint64_t ManagedRestrictions.__deallocating_deinit()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 64), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t ManagedRestrictions.maxAppContentRating.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(*(id *)(v0 + 56), sel_effectiveValueForSetting_, *MEMORY[0x24BE639D0]);
  if (!v1)
    return static Restrictions.defaultMaxAppContentRating.getter();
  v2 = v1;
  v3 = objc_msgSend(v1, sel_integerValue);

  return (uint64_t)v3;
}

id ManagedRestrictions.isAppInstallationAllowed.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 56), sel_isOnDeviceAppInstallationAllowed);
}

id ManagedRestrictions.isAppUninstallationAllowed.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 56), sel_isAppRemovalAllowed);
}

uint64_t ManagedRestrictions.hasManagedAppleID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_222AAD6D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_222AAD5EC();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_222A73FA8((uint64_t)v3);
    return 0;
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
    swift_getKeyPath();
    sub_222AAD6C4();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    return v9[15];
  }
}

BOOL ManagedRestrictions.isAccountModificationRestricted.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 56), sel_effectiveBoolValueForSetting_, *MEMORY[0x24BE63770]) == 2;
}

uint64_t ManagedRestrictions.onRestrictionsChange.getter()
{
  return swift_retain();
}

uint64_t sub_222A9390C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = *v0;
  v2 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v2);
  if (qword_2540C7358 != -1)
    swift_once();
  v3 = sub_222AAD748();
  __swift_project_value_buffer(v3, (uint64_t)qword_2540C8DB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  sub_222AAD568();
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v5[3] = v1;
  v5[4] = &protocol witness table for ManagedRestrictions;
  v5[0] = v0;
  swift_retain();
  sub_222AAD538();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_222A93B6C()
{
  return ManagedRestrictions.maxAppContentRating.getter();
}

id sub_222A93B8C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 56), sel_isOnDeviceAppInstallationAllowed);
}

id sub_222A93BB0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 56), sel_isAppRemovalAllowed);
}

uint64_t sub_222A93BD8()
{
  return ManagedRestrictions.hasManagedAppleID.getter() & 1;
}

BOOL sub_222A93BFC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 56), sel_effectiveBoolValueForSetting_, *MEMORY[0x24BE63770]) == 2;
}

uint64_t sub_222A93C34()
{
  return swift_retain();
}

_QWORD *sub_222A93C40(_QWORD *a1, void *a2, void *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _BYTE v16[40];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7550);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_222A723C0((uint64_t)a1, (uint64_t)(v4 + 2));
  v4[7] = a2;
  v4[8] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7540);
  swift_allocObject();
  v12 = a2;
  v13 = a3;
  v4[9] = sub_222AAD544();
  objc_msgSend(v13, sel_addObserver_selector_name_object_, v4, sel_effectiveSettingsChanged_, *MEMORY[0x24BE63740], v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_222AAD5F8();
  swift_getObjectType();
  sub_222A94B20();
  sub_222AAD5C8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

BOOL _s8AppState19ManagedRestrictionsC24isRunningInStoreDemoModeSbvg_0()
{
  __CFString *v0;
  __CFString *v1;
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  v0 = (__CFString *)sub_222AAD7A8();
  v1 = (__CFString *)sub_222AAD7A8();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, &keyExistsAndHasValidFormat);

  if (AppBooleanValue)
    v3 = keyExistsAndHasValidFormat == 0;
  else
    v3 = 1;
  return !v3;
}

char *keypath_get_selector_ams_isManagedAppleID()
{
  return sel_ams_isManagedAppleID;
}

id sub_222A93EB0@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_ams_isManagedAppleID);
  *a2 = (_BYTE)result;
  return result;
}

id sub_222A93EE0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setManagedAppleID_, *a1);
}

uint64_t type metadata accessor for ManagedRestrictions()
{
  return objc_opt_self();
}

uint64_t method lookup function for ManagedRestrictions()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_222A93F20()
{
  return sub_222A9390C();
}

ValueMetadata *_s8OpenableVMa()
{
  return &_s8OpenableVN;
}

uint64_t sub_222A93F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t (*v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  sub_222A78EE0(a2, (uint64_t)&v14 - v8);
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    sub_222A78EE0(a1, (uint64_t)v7);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    result = 1;
    switch(EnumCaseMultiPayload)
    {
      case 0:
      case 1:
      case 7:
      case 8:
        return result;
      case 2:
      case 3:
        v12 = (uint64_t (*)(_QWORD))type metadata accessor for State;
        goto LABEL_8;
      case 4:
        v12 = type metadata accessor for AppInstallation;
LABEL_8:
        sub_222A759F4((uint64_t)v7, v12);
        result = 1;
        break;
      default:
        v13 = (uint64_t)v7;
        goto LABEL_5;
    }
  }
  else
  {
    v13 = (uint64_t)v9;
LABEL_5:
    sub_222A759F4(v13, (uint64_t (*)(_QWORD))type metadata accessor for State);
    return 0;
  }
  return result;
}

uint64_t sub_222A94098()
{
  uint64_t v0;

  v0 = sub_222AAD730();
  __swift_allocate_value_buffer(v0, qword_2540C8E20);
  __swift_project_value_buffer(v0, (uint64_t)qword_2540C8E20);
  return sub_222AAD724();
}

uint64_t sub_222A940F8(uint64_t a1)
{
  return sub_222A941BC(a1, qword_2540C8E48);
}

uint64_t sub_222A9411C(uint64_t a1)
{
  return sub_222A941BC(a1, qword_2540C8E60);
}

uint64_t sub_222A94140(uint64_t a1)
{
  return sub_222A941BC(a1, qword_2540C8E90);
}

uint64_t sub_222A9416C(uint64_t a1)
{
  return sub_222A941BC(a1, qword_2540C8E78);
}

uint64_t sub_222A94194(uint64_t a1)
{
  return sub_222A941BC(a1, qword_2540C8DB0);
}

uint64_t sub_222A941BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_222AAD730();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD748();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (qword_2540C8118 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_2540C8E20);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  return sub_222AAD73C();
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

uint64_t sub_222A942F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t result;
  uint64_t v15;

  v0 = sub_222AAD610();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_222AAD730();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_222AAD748();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2540C8118 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v4, (uint64_t)qword_2540C8E20);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
  sub_222AAD73C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BE5CFE0], v0);
  v13 = sub_222AAD67C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  result = sub_222AAD5E0();
  qword_2540C8DE0 = result;
  unk_2540C8DE8 = MEMORY[0x24BE5CEA0];
  qword_2540C8DC8 = v13;
  return result;
}

uint64_t dispatch thunk of Platform.isAppleSiliconSupportEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Platform.isRosettaAvailable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Platform.isRunnable(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *_s9PurchasedVMa()
{
  return &_s9PurchasedVN;
}

uint64_t sub_222A94504(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  char *v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  uint64_t v31;

  v31 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EB8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for State();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v30 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v30 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v30 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (unsigned __int8 *)&v30 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v30 - v22;
  sub_222A78EE0(a2, (uint64_t)&v30 - v22);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = v12;
    v30 = v9;
    v25 = (uint64_t)&v5[*(int *)(v3 + 48)];
    v26 = v31;
    sub_222A78EE0(v31, (uint64_t)v5);
    sub_222A78EE0(a2, v25);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        sub_222A78EE0((uint64_t)v5, (uint64_t)v21);
        if (*v21 < 2u)
          goto LABEL_3;
        goto LABEL_10;
      case 1u:
        sub_222A78EE0((uint64_t)v5, (uint64_t)v18);
        if ((*v18 & 1) != 0)
          goto LABEL_10;
        if (swift_getEnumCaseMultiPayload() != 1)
          goto LABEL_10;
        sub_222A78EE0(v25, (uint64_t)v15);
        if (*v15 != 1)
          goto LABEL_10;
        goto LABEL_3;
      case 6u:
      case 8u:
        goto LABEL_3;
      default:
LABEL_10:
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_222A78EE0(v25, (uint64_t)v24);
          if (*v24 == 1)
          {
            v28 = (uint64_t)v30;
            *v30 = 0;
            *(_QWORD *)(v28 + 8) = 0xE000000000000000;
            swift_storeEnumTagMultiPayload();
            v29 = sub_222A913EC(v26, v28);
            sub_222A783C0(v28);
            if ((v29 & 1) != 0)
            {
LABEL_3:
              sub_222A783C0(v25);
              sub_222A783C0((uint64_t)v5);
              return 1;
            }
          }
        }
        sub_222A947B8((uint64_t)v5);
        break;
    }
  }
  else
  {
    sub_222A783C0((uint64_t)v23);
  }
  return 0;
}

uint64_t sub_222A947B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of PurchaseHistory.update(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A7E0EC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PurchaseHistory.update(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E220;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PurchaseHistory.fetchAllApps(of:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A70BFC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PurchaseHistory.fetchApps(of:withIDs:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_222A94B1C;
  return v13(a1, a2, a3, a4, a5);
}

{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 40) + *(_QWORD *)(a5 + 40));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_222A94B1C;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of PurchaseHistory.fetchAllApps(for:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 48) + *(_QWORD *)(a4 + 48));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A94B1C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_222A94B20()
{
  return sub_222AAD5BC();
}

uint64_t sub_222A94B44(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_222A8FB04();
  result = sub_222AAD8F8();
  v3 = 0;
  v15 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_222AA54C4(&v14, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t *PurchaseHistoryAppStateDataSource.__allocating_init(accounts:platform:purchaseHistory:purchaseHistoryContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  _BYTE v18[40];
  _BYTE v19[40];
  _BYTE v20[40];
  _BYTE v21[48];

  v8 = sub_222AAD748();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_222A723C0(a1, (uint64_t)v21);
  sub_222A723C0(a2, (uint64_t)v20);
  sub_222A723C0(a3, (uint64_t)v19);
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2540C8100 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v8, (uint64_t)qword_2540C8E60);
  v14 = (uint64_t *)swift_allocObject();
  sub_222A94E48((uint64_t)v21, (uint64_t)v18);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  v15 = sub_222A99C28((uint64_t)v18, (uint64_t)v20, (uint64_t)v19, a4, v12, (uint64_t)v11, v14);

  sub_222A99EE8((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v15;
}

uint64_t sub_222A94E48(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AdamID.Context(a2, a1);
  return a2;
}

uint64_t *PurchaseHistoryAppStateDataSource.__allocating_init(family:platform:purchaseHistory:purchaseHistoryContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  _BYTE v18[40];
  _BYTE v19[40];
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v5 = v4;
  sub_222A723C0(a1, (uint64_t)v20);
  sub_222A723C0(a2, (uint64_t)v19);
  sub_222A723C0(a3, (uint64_t)v18);
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2540C8100 != -1)
    swift_once();
  v11 = sub_222AAD748();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_2540C8E60);
  v13 = v21;
  v14 = v22;
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  v16 = sub_222A9A214(v15, (uint64_t)v19, (uint64_t)v18, a4, v10, v12, v5, v13, v11, v14, MEMORY[0x24BE5E330]);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v16;
}

uint64_t sub_222A94FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD52C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  v11 = *MEMORY[0x24BE5C3B8];
  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((_DWORD)a1 == v11)
  {
    v13 = sub_222AAD8A4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = a2;
    swift_retain();
    sub_222A9733C((uint64_t)v6, (uint64_t)&unk_255768DA0, (uint64_t)v14);
    return swift_release();
  }
  return result;
}

uint64_t (*sub_222A95128())(uint64_t a1)
{
  swift_retain();
  return sub_222A9A55C;
}

uint64_t PurchaseHistoryAppStateDataSource.deinit()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 144), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  swift_release();
  swift_release();
  return v0;
}

uint64_t PurchaseHistoryAppStateDataSource.__deallocating_deinit()
{
  PurchaseHistoryAppStateDataSource.deinit();
  return swift_deallocClassInstance();
}

uint64_t PurchaseHistoryAppStateDataSource.description.getter()
{
  sub_222AADBBC();
  sub_222AAD7D8();
  swift_bridgeObjectRelease();
  sub_222AAD7D8();
  type metadata accessor for ASDPurchaseHistoryContext(0);
  sub_222AADA78();
  sub_222AAD7D8();
  return 0;
}

BOOL PurchaseHistoryAppStateDataSource.isIncremental.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136) != 1;
}

uint64_t PurchaseHistoryAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t PurchaseHistoryAppStateDataSource.load()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_222A952C8()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 136) == 1)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v1;
    *v1 = v0;
    v1[1] = sub_222A9533C;
    return sub_222A955C0();
  }
  else
  {
    sub_222A953EC();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A9533C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 32) = v2;
  *v2 = v4;
  v2[1] = sub_222A953A4;
  return sub_222A95AA8(1);
}

uint64_t sub_222A953A4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A953EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_222AAD8A4();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_222A7DCD0((uint64_t)v4, &qword_2540C8180);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_222AAD898();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_222AAD868();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_255768D88;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_222A955C0()
{
  _QWORD *v0;
  _QWORD *v1;

  v1[18] = v0;
  v1[19] = *v0;
  sub_222AAD598();
  v1[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A95620()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  _BYTE v11[9];

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(os_unfair_lock_s **)(v1 + 216);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = sub_222A9A43C;
  *(_QWORD *)(v3 + 24) = v1;
  os_unfair_lock_lock(v2 + 4);
  sub_222AA7B38(*(_QWORD *(**)(uint64_t *__return_ptr))(v3 + 16), v11);
  os_unfair_lock_unlock(v2 + 4);
  LOBYTE(v1) = v11[0];
  swift_task_dealloc();
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD **)(v0 + 144);
    v5 = v4[15];
    v6 = v4[16];
    __swift_project_boxed_opaque_existential_1(v4 + 12, v5);
    v7 = v4[17];
    v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 8) + *(_QWORD *)(v6 + 8));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v8;
    *v8 = v0;
    v8[1] = sub_222A95744;
    return v10(v7, v5, v6);
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A95744()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A957A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 144);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 176), *(_QWORD *)(v2 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 104) = v1;
  *(_QWORD *)(v0 + 80) = v2;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 80, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A958E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0;
  v2 = v0 + 6;
  v3 = (void *)v0[22];
  v4 = v0[19];
  v5 = v1[18];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 176), *(_QWORD *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v1[5] = v4;
  v1[2] = v5;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)(v1 + 2), (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v6 = v1[14];
  v7 = v1[15];
  v1[9] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v2, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_222A95AA8(char a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 160) = v1;
  *(_BYTE *)(v2 + 256) = a1;
  *(_QWORD *)(v2 + 168) = *v1;
  sub_222AAD598();
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A95B0C()
{
  uint64_t v0;
  _QWORD *v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 160);
  sub_222A723C0((uint64_t)(v1 + 12), v0 + 16);
  v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 184) = v2;
  *(_QWORD *)(v0 + 200) = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v2);
  v3 = v1 + 2;
  v4 = v1[5];
  v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v5 + 16) + *(_QWORD *)(v5 + 16));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v6;
  *v6 = v0;
  v6[1] = sub_222A95BB0;
  return v8(v4, v5);
}

uint64_t sub_222A95BB0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD, _QWORD);

  v4 = (_QWORD *)*v2;
  v4[27] = a1;
  v4[28] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v6 = v4[20] + 56;
  v8 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))(**(int **)(v4[24] + 48) + *(_QWORD *)(v4[24] + 48));
  v7 = (_QWORD *)swift_task_alloc();
  v4[29] = v7;
  *v7 = v4;
  v7[1] = sub_222A95C7C;
  return v8(a1, v6, v4[23], v4[24]);
}

uint64_t sub_222A95C7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 240) = a1;
  *(_QWORD *)(v3 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_222A95CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  _QWORD *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v5 = *(os_unfair_lock_s **)(v4 + 216);
  v6 = (_QWORD *)swift_task_alloc();
  v6[2] = v4;
  v6[3] = v1;
  v6[4] = 0;
  v6[5] = v3;
  v7 = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = sub_222A9A624;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = v5 + 4;
  os_unfair_lock_lock(v5 + 4);
  (*(void (**)(uint64_t *__return_ptr))(v7 + 16))(&v12);
  if (v2)
  {
    os_unfair_lock_unlock(v5 + 4);
    return swift_task_dealloc();
  }
  else
  {
    v10 = *(_BYTE *)(v0 + 256);
    v11 = v12;
    os_unfair_lock_unlock(v8);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if ((v10 & 1) != 0)
    {
      *(_QWORD *)(v0 + 152) = v11;
      sub_222AAD76C();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A95E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0;
  v2 = v0 + 16;
  v3 = (uint64_t *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v1 + 160);
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 176), *(_QWORD *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 80) = v4;
  *(_QWORD *)(v1 + 56) = v5;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v6 = *(_QWORD *)(v1 + 120);
  v7 = *(_QWORD *)(v1 + 128);
  *(_QWORD *)(v1 + 112) = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v3, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_222A95FE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0;
  v2 = v0 + 16;
  v3 = (uint64_t *)(v0 + 88);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v1 + 160);
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 176), *(_QWORD *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 80) = v4;
  *(_QWORD *)(v1 + 56) = v5;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v6 = *(_QWORD *)(v1 + 120);
  v7 = *(_QWORD *)(v1 + 128);
  *(_QWORD *)(v1 + 112) = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v3, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t PurchaseHistoryAppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_BYTE *)(v3 + 48) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 32) = v4;
  *v4 = v3;
  v4[1] = sub_222A9620C;
  return sub_222A955C0();
}

uint64_t sub_222A9620C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 40) = v3;
  *v3 = v2;
  v3[1] = sub_222A96278;
  return sub_222A962C0(*(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 48));
}

uint64_t sub_222A96278()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A962C0(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 304) = a2;
  *(_QWORD *)(v3 + 192) = a1;
  *(_QWORD *)(v3 + 200) = v2;
  *(_QWORD *)(v3 + 208) = *v2;
  sub_222AAD598();
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A96324()
{
  uint64_t v0;
  _QWORD *v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 200);
  sub_222A723C0((uint64_t)(v1 + 12), v0 + 16);
  v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 224) = v2;
  *(_QWORD *)(v0 + 240) = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v2);
  v3 = v1 + 2;
  v4 = v1[5];
  v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v5 + 16) + *(_QWORD *)(v5 + 16));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v6;
  *v6 = v0;
  v6[1] = sub_222A963C8;
  return v8(v4, v5);
}

uint64_t sub_222A963C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 256) = a1;
  *(_QWORD *)(v3 + 264) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A96434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD, _QWORD *, uint64_t, _QWORD, _QWORD);

  v1 = v0[29];
  v2 = v0[25];
  v3 = swift_bridgeObjectRetain();
  v4 = sub_222A99078(v3);
  v0[34] = v4;
  swift_bridgeObjectRelease();
  v7 = (uint64_t (*)(_QWORD, _QWORD *, uint64_t, _QWORD, _QWORD))(**(int **)(v1 + 40) + *(_QWORD *)(v1 + 40));
  v5 = (_QWORD *)swift_task_alloc();
  v0[35] = v5;
  *v5 = v0;
  v5[1] = sub_222A964D4;
  return v7(v0[32], v4, v2 + 56, v0[28], v0[29]);
}

uint64_t sub_222A964D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 288) = a1;
  *(_QWORD *)(v3 + 296) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_222A96554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  _QWORD *v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v6 = *(os_unfair_lock_s **)(v4 + 216);
  v7 = (_QWORD *)swift_task_alloc();
  v7[2] = v4;
  v7[3] = v1;
  v7[4] = v5;
  v7[5] = v3;
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = sub_222A9A410;
  *(_QWORD *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  (*(void (**)(uint64_t *__return_ptr))(v8 + 16))(&v12);
  if (v2)
  {
    os_unfair_lock_unlock(v6 + 4);
    return swift_task_dealloc();
  }
  else
  {
    v10 = *(_BYTE *)(v0 + 304);
    v11 = v12;
    os_unfair_lock_unlock(v6 + 4);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if ((v10 & 1) != 0)
    {
      *(_QWORD *)(v0 + 184) = v11;
      sub_222AAD76C();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A96674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0;
  v2 = v0 + 16;
  v3 = (uint64_t *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v1 + 192);
  v5 = *(_QWORD *)(v1 + 200);
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 176), *(_QWORD *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 80) = v4;
  *(_QWORD *)(v1 + 56) = v5;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  *(_QWORD *)(v1 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8190);
  *(_QWORD *)(v1 + 88) = v6;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 88, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v7 = *(_QWORD *)(v1 + 152);
  v8 = *(_QWORD *)(v1 + 160);
  *(_QWORD *)(v1 + 144) = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v3, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_222A96894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;

  v1 = v0;
  v2 = v0 + 16;
  v3 = (uint64_t *)(v0 + 120);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v1 + 192);
  v6 = *(_QWORD *)(v1 + 200);
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 176), *(_QWORD *)(v6 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 80) = v4;
  *(_QWORD *)(v1 + 56) = v6;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  *(_QWORD *)(v1 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8190);
  *(_QWORD *)(v1 + 88) = v5;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 88, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v7 = *(_QWORD *)(v1 + 152);
  v8 = *(_QWORD *)(v1 + 160);
  *(_QWORD *)(v1 + 144) = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v3, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t PurchaseHistoryAppStateDataSource.reloadAllStates(synchronizing:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 40) = a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_222A96B18;
  return sub_222A955C0();
}

uint64_t sub_222A96B18()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_222A953A4;
  return sub_222A95AA8(*(_BYTE *)(v1 + 40));
}

void PurchaseHistoryAppStateDataSource.state(forAppWith:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 216) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, (uint64_t (*)(void))sub_222A9A338);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_222A96BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 152);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_222A8B200(a2), (v8 & 1) != 0))
  {
    v9 = v7;
    v10 = *(_QWORD *)(v6 + 56);
    v11 = type metadata accessor for State();
    v12 = *(_QWORD *)(v11 - 8);
    sub_222A78EE0(v10 + *(_QWORD *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

BOOL PurchaseHistoryAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 8) & 1) == 0;
}

uint64_t sub_222A96CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_222AAD8A4();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_222A7DCD0((uint64_t)v4, &qword_2540C8180);
  }
  else
  {
    sub_222AAD898();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_222AAD868();
      v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        v13[2] = v9;
        v13[3] = v11;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_222A96E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_222A96EAC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = v0[2];
  if (*(_QWORD *)(v1 + 136) == 1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[3] = v2;
    *v2 = v0;
    v2[1] = sub_222A96FD4;
    return sub_222A95AA8(1);
  }
  else
  {
    v4 = *(os_unfair_lock_s **)(v1 + 216);
    v5 = swift_task_alloc();
    *(_QWORD *)(v5 + 16) = sub_222A9A3E0;
    *(_QWORD *)(v5 + 24) = v1;
    v6 = v4 + 4;
    os_unfair_lock_lock(v4 + 4);
    (*(void (**)(uint64_t *__return_ptr))(v5 + 16))(&v9);
    v7 = v9;
    v0[4] = v9;
    os_unfair_lock_unlock(v6);
    swift_task_dealloc();
    v8 = (_QWORD *)swift_task_alloc();
    v0[5] = v8;
    *v8 = v0;
    v8[1] = sub_222A9701C;
    return sub_222A962C0(v7, 1);
  }
}

uint64_t sub_222A96FD4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A9701C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A97080()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A970B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A970E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_222A97100()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = v0[2];
  if (*(_QWORD *)(v1 + 136) == 1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[6] = v2;
    *v2 = v0;
    v2[1] = sub_222A972C0;
    return sub_222A95AA8(1);
  }
  else
  {
    v4 = *(os_unfair_lock_s **)(v1 + 216);
    v5 = swift_task_alloc();
    *(_QWORD *)(v5 + 16) = sub_222A9A3E0;
    *(_QWORD *)(v5 + 24) = v1;
    v6 = v4 + 4;
    os_unfair_lock_lock(v4 + 4);
    (*(void (**)(uint64_t *__return_ptr))(v5 + 16))(&v9);
    v7 = v9;
    v0[3] = v9;
    os_unfair_lock_unlock(v6);
    swift_task_dealloc();
    v8 = (_QWORD *)swift_task_alloc();
    v0[4] = v8;
    *v8 = v0;
    v8[1] = sub_222A97228;
    return sub_222A962C0(v7, 1);
  }
}

uint64_t sub_222A97228()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A9728C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A972C0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A97308()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9733C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_222AAD8A4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_222AAD898();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_222A7DCD0(a1, &qword_2540C8180);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_222AAD868();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_222A97510(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;

  v4[26] = a4;
  v4[27] = *a4;
  sub_222AAD598();
  v4[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A975B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  _BYTE *v31;
  uint64_t v32;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD **)(v0 + 208);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_222AAD5EC();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_222A89EBC(v1, v2, &qword_2540C7560);
  v6 = sub_222AAD6D0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(v2, 1, v6);
  v10 = *(_QWORD *)(v0 + 240);
  if (v9 == 1)
  {
    sub_222A7DCD0(*(_QWORD *)(v0 + 240), &qword_2540C7560);
  }
  else
  {
    swift_getKeyPath();
    sub_222AAD6C4();
    swift_release();
    v11 = *(void **)(v0 + 200);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
    if (v11)
    {
      v12 = *(_QWORD *)(v0 + 208);
      v13 = objc_msgSend(v11, sel_longLongValue);

      v16 = *(void **)(v12 + 160);
      v15 = v12 + 160;
      v14 = v16;
      if ((*(_BYTE *)(v15 + 8) & 1) == 0 && v13 == v14)
        goto LABEL_8;
      v30 = (uint64_t *)v15;
      v31 = (_BYTE *)(v15 + 8);
      v17 = *(_QWORD *)(v0 + 208);
      goto LABEL_10;
    }
  }
  v17 = *(_QWORD *)(v0 + 208);
  if ((*(_BYTE *)(v17 + 168) & 1) != 0)
  {
LABEL_8:
    sub_222A7DCD0(*(_QWORD *)(v0 + 248), &qword_2540C7560);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v30 = (uint64_t *)(v17 + 160);
  v31 = (_BYTE *)(v17 + 168);
LABEL_10:
  v32 = *(_QWORD *)(v0 + 248);
  v19 = *(_QWORD *)(v0 + 232);
  v20 = *(_QWORD *)(v0 + 216);
  sub_222A723C0(v17 + 176, v0 + 56);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 120) = v20;
  *(_QWORD *)(v0 + 96) = v17;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 96, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222A89EBC(v32, v19, &qword_2540C7560);
  v21 = v8(v19, 1, v6);
  v22 = *(_QWORD *)(v0 + 232);
  if (v21 == 1)
  {
    sub_222A7DCD0(*(_QWORD *)(v0 + 232), &qword_2540C7560);
    v23 = v0 + 56;
    v24 = v31;
LABEL_14:
    v27 = v0 + 128;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    goto LABEL_15;
  }
  swift_getKeyPath();
  sub_222AAD6C4();
  swift_release();
  v25 = *(void **)(v0 + 192);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v22, v6);
  v23 = v0 + 56;
  v24 = v31;
  if (!v25)
    goto LABEL_14;
  v26 = objc_msgSend(v25, sel_longLongValue);

  *(_QWORD *)(v0 + 152) = MEMORY[0x24BEE4008];
  *(_QWORD *)(v0 + 128) = v26;
  v27 = v0 + 128;
LABEL_15:
  sub_222AAD574();
  sub_222A7DCD0(v27, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  if (*v24 == 1)
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }
  else
  {
    v28 = *v30;
    *(_QWORD *)(v0 + 184) = MEMORY[0x24BEE4008];
    *(_QWORD *)(v0 + 160) = v28;
  }
  sub_222AAD574();
  sub_222A7DCD0(v0 + 160, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v23);
  v29 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v29;
  *v29 = v0;
  v29[1] = sub_222A97A70;
  v29[2] = *(_QWORD *)(v0 + 208);
  return swift_task_switch();
}

uint64_t sub_222A97A70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A97AD4()
{
  uint64_t v0;

  sub_222A7DCD0(*(_QWORD *)(v0 + 248), &qword_2540C7560);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A97B40()
{
  uint64_t v0;

  sub_222A7DCD0(*(_QWORD *)(v0 + 248), &qword_2540C7560);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A97BAC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A7E220;
  return sub_222A955C0();
}

uint64_t sub_222A97BF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  result = sub_222A94B44(v2);
  *a1 = result;
  return result;
}

void sub_222A97C50(_QWORD *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  void *v11;
  uint64_t v12;

  v11 = (void *)MEMORY[0x227677C54]();
  sub_222A97CE4(a1, a2, a3, a4, &v12);
  objc_autoreleasePoolPop(v11);
  if (v5)
    __break(1u);
  else
    *a5 = v12;
}

uint64_t sub_222A97CE4@<X0>(_QWORD *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  char *v8;
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
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *boxed_opaque_existential_0;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t inited;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  unint64_t v90;
  char v91;
  unint64_t v92;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  unint64_t v124;
  char v125;
  unint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  char *v144;
  _QWORD *v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  id v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t *v157;
  __int128 v158;
  unint64_t v159;
  char *v160;
  _QWORD *v161;
  int64_t v162;
  uint64_t *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170[3];
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176[3];
  uint64_t v177;
  char *v178;
  uint64_t v179;

  v134 = a4;
  v135 = a3;
  v138 = a5;
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E40);
  MEMORY[0x24BDAC7A8](v143);
  v8 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for State();
  v165 = *(_QWORD *)(v9 - 8);
  v166 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v136 = (uint64_t)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v163 = (uint64_t *)((char *)&v132 - v12);
  v13 = sub_222AAD598();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v144 = (char *)&v132 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v137 = (char *)&v132 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v140 = (uint64_t)&v132 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v139 = (uint64_t)&v132 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (uint64_t *)((char *)&v132 - v23);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v149 = (uint64_t)&v132 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v148 = (uint64_t)&v132 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v155 = (uint64_t)&v132 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v167 = (uint64_t)&v132 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v160 = (char *)&v132 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)&v132 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = MEMORY[0x24BEE4B08];
  v37 = a1[5];
  v38 = a1[6];
  v145 = a1;
  __swift_project_boxed_opaque_existential_1(a1 + 2, v37);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v38 + 8))(v176, v37, v38);
  __swift_project_boxed_opaque_existential_1(v176, v177);
  sub_222AAD5EC();
  v39 = sub_222AAD6D0();
  v40 = *(_QWORD *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v36, 1, v39) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
    sub_222A7DCD0((uint64_t)v36, &qword_2540C7560);
LABEL_45:
    v100 = v138;
    v101 = v145;
    swift_beginAccess();
    v102 = swift_bridgeObjectRetain();
    sub_222A9B74C(v102);
    v101[19] = MEMORY[0x24BEE4B00];
    result = swift_bridgeObjectRelease();
    v101[20] = 0;
    *((_BYTE *)v101 + 168) = 1;
    *v100 = v179;
    return result;
  }
  swift_getKeyPath();
  sub_222AAD6C4();
  swift_release();
  v41 = (void *)v172;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v39);
  if (!v41)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
    goto LABEL_45;
  }
  v42 = objc_msgSend(v41, sel_longLongValue);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
  v43 = v145;
  if ((v145[21] & 1) != 0 || v42 != (id)v145[20])
  {
    swift_beginAccess();
    v44 = swift_bridgeObjectRetain();
    sub_222A9B74C(v44);
    v145[19] = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRelease();
    v43 = v145;
    v145[20] = v42;
    *((_BYTE *)v43 + 168) = 0;
  }
  v178 = (char *)MEMORY[0x24BEE4B08];
  v132 = a2 >> 62;
  if (a2 >> 62)
  {
LABEL_91:
    swift_bridgeObjectRetain();
    result = sub_222AADA84();
    v43 = v145;
    v45 = result;
  }
  else
  {
    v45 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v156 = a2;
  if (v45)
  {
    v151 = v42;
    if (v45 < 1)
    {
      __break(1u);
      return result;
    }
    v47 = 0;
    v161 = v43 + 22;
    v150 = v43 + 7;
    v159 = a2 & 0xC000000000000001;
    v142 = 0x8000000222AB0610;
    v158 = xmmword_222AAE880;
    v141 = 0x8000000222AB0660;
    v133 = v24;
    v146 = v8;
    v162 = v45;
    v157 = v43 + 19;
    while (1)
    {
      v59 = v159 ? (id)MEMORY[0x227677A50](v47, a2) : *(id *)(a2 + 8 * v47 + 32);
      v60 = v59;
      v61 = (uint64_t)objc_msgSend(v59, sel_storeItemID, v132);
      sub_222A723C0((uint64_t)v161, (uint64_t)v176);
      if ((v61 & 0x8000000000000000) == 0)
        break;
      v172 = 0;
      v173 = 0xE000000000000000;
      sub_222AADA00();
      swift_bridgeObjectRelease();
      v172 = 0xD00000000000001DLL;
      v173 = v142;
      v170[0] = v61;
      sub_222AADACC();
      sub_222AAD7D8();
      swift_bridgeObjectRelease();
      v48 = v172;
      v49 = v173;
      sub_222A71A40();
      v50 = swift_allocError();
      *v51 = v48;
      v51[1] = v49;
      swift_willThrow();
      sub_222A723C0((uint64_t)v176, (uint64_t)&v172);
      v154 = v174;
      v164 = v175;
      v153 = __swift_project_boxed_opaque_existential_1(&v172, v174);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
      v52 = *(unsigned __int8 *)(*(_QWORD *)(sub_222AAD5B0() - 8) + 80);
      v53 = (v52 + 32) & ~v52;
      v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = v158;
      v152 = v54 + v53;
      sub_222AAD58C();
      sub_222AAD580();
      v171 = MEMORY[0x24BEE4008];
      v170[0] = v61;
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v170, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      swift_getErrorValue();
      v56 = v168;
      v55 = v169;
      v171 = v169;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v170);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 16))(boxed_opaque_existential_0, v56, v55);
      sub_222AAD55C();
      sub_222A7DCD0((uint64_t)v170, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      sub_222AAD5A4();
      sub_222AAD6A0();
      swift_bridgeObjectRelease();
      v58 = (void *)v50;
      a2 = v156;

      sub_222A7239C((uint64_t)v176);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v172);

      v154 = 0;
LABEL_13:
      if (v162 == ++v47)
      {
        swift_bridgeObjectRelease();
        v8 = v178;
        goto LABEL_47;
      }
    }
    sub_222A7239C((uint64_t)v176);
    sub_222AA54C4(v176, v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7608);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v158;
    *(_QWORD *)(inited + 32) = v151;
    v63 = sub_222AA84DC(inited);
    swift_setDeallocating();
    sub_222A723C0((uint64_t)v150, (uint64_t)v176);
    v64 = v60;
    v65 = v167;
    v164 = v64;
    sub_222A7AB18(v64, v63, v176, v167);
    v66 = v155;
    sub_222A89EBC(v65, v155, &qword_2540C7E30);
    v68 = v165;
    v67 = v166;
    v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v165 + 48);
    if (v69(v66, 1, v166) == 1)
    {
      sub_222A7DCD0(v66, &qword_2540C7E30);
      v70 = v157;
LABEL_33:
      if (v69(v167, 1, v67) == 1)
      {
        swift_beginAccess();
        v90 = sub_222A8B200(v61);
        if ((v91 & 1) != 0)
        {
          v92 = v90;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v94 = *v70;
          v172 = *v70;
          *v70 = 0x8000000000000000;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_222AABE70();
            v94 = v172;
          }
          v95 = v165;
          v96 = v140;
          sub_222A7A688(*(_QWORD *)(v94 + 56) + *(_QWORD *)(v165 + 72) * v92, v140);
          sub_222AAB8E4(v92, v94);
          *v70 = v94;
          swift_bridgeObjectRelease();
          v97 = v96;
          v98 = 0;
          a2 = v156;
        }
        else
        {
          v98 = 1;
          v97 = v140;
          v95 = v165;
        }
        v99 = v166;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v95 + 56))(v97, v98, 1, v166);
        swift_endAccess();
        LODWORD(v99) = v69(v97, 1, v99);
        sub_222A7DCD0(v97, &qword_2540C7E30);
        if ((_DWORD)v99 != 1)
          sub_222AA54C4(v176, v61);
      }

      goto LABEL_42;
    }
    sub_222A7A688(v66, (uint64_t)v163);
    v71 = v157;
    swift_beginAccess();
    v72 = *v71;
    v73 = *(_QWORD *)(v72 + 16);
    v147 = v61;
    if (v73 && (v74 = sub_222A8B200(v61), (v75 & 1) != 0))
    {
      v76 = v148;
      sub_222A78EE0(*(_QWORD *)(v72 + 56) + *(_QWORD *)(v68 + 72) * v74, v148);
      v77 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56);
      v78 = v76;
      v79 = 0;
    }
    else
    {
      v77 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56);
      v76 = v148;
      v78 = v148;
      v79 = 1;
    }
    v80 = v166;
    v77(v78, v79, 1, v166);
    swift_endAccess();
    v81 = v149;
    sub_222A78EE0((uint64_t)v163, v149);
    v153 = v77;
    v77(v81, 0, 1, v80);
    v82 = (uint64_t)v146;
    v83 = (uint64_t)&v146[*(int *)(v143 + 48)];
    sub_222A89EBC(v76, (uint64_t)v146, &qword_2540C7E30);
    sub_222A89EBC(v81, v83, &qword_2540C7E30);
    if (v69(v82, 1, v80) == 1)
    {
      sub_222A7DCD0(v81, &qword_2540C7E30);
      sub_222A7DCD0(v76, &qword_2540C7E30);
      if (v69(v83, 1, v80) == 1)
      {
        sub_222A7DCD0((uint64_t)v146, &qword_2540C7E30);
        a2 = v156;
        v70 = v157;
        v61 = v147;
LABEL_32:
        sub_222A783C0((uint64_t)v163);
        v67 = v166;
        goto LABEL_33;
      }
    }
    else
    {
      v84 = (uint64_t)v133;
      sub_222A89EBC(v82, (uint64_t)v133, &qword_2540C7E30);
      if (v69(v83, 1, v80) != 1)
      {
        v87 = v136;
        sub_222A7A688(v83, v136);
        _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v84, v87);
        v89 = v88;
        sub_222A783C0(v87);
        sub_222A7DCD0(v149, &qword_2540C7E30);
        sub_222A7DCD0(v148, &qword_2540C7E30);
        sub_222A783C0(v84);
        sub_222A7DCD0(v82, &qword_2540C7E30);
        a2 = v156;
        v70 = v157;
        v61 = v147;
        if ((v89 & 1) != 0)
          goto LABEL_32;
LABEL_30:
        v85 = (uint64_t)v163;
        v86 = v139;
        sub_222A78EE0((uint64_t)v163, v139);
        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v153)(v86, 0, 1, v166);
        swift_beginAccess();
        sub_222AA9C3C(v86, v61);
        swift_endAccess();
        sub_222AA54C4(v176, v61);

        sub_222A783C0(v85);
LABEL_42:
        sub_222A7DCD0(v167, &qword_2540C7E30);
        goto LABEL_13;
      }
      sub_222A7DCD0(v149, &qword_2540C7E30);
      sub_222A7DCD0(v148, &qword_2540C7E30);
      sub_222A783C0(v84);
    }
    sub_222A7DCD0((uint64_t)v146, &qword_2540C7E40);
    a2 = v156;
    v61 = v147;
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  v8 = (char *)MEMORY[0x24BEE4B08];
LABEL_47:
  v24 = v145 + 19;
  swift_beginAccess();
  v170[0] = MEMORY[0x24BEE4B08];
  v103 = swift_bridgeObjectRetain();
  v104 = sub_222A94B44(v103);
  v42 = v160;
  if (v135)
  {
    v105 = swift_bridgeObjectRetain();
    v104 = sub_222A9915C(v105, v104);
    swift_bridgeObjectRelease();
  }
  v106 = 0;
  v107 = *(_QWORD *)(v104 + 56);
  v161 = (_QWORD *)(v104 + 56);
  v108 = 1 << *(_BYTE *)(v104 + 32);
  if (v108 < 64)
    v109 = ~(-1 << v108);
  else
    v109 = -1;
  v110 = v109 & v107;
  v162 = (unint64_t)(v108 + 63) >> 6;
  v163 = v24;
  v164 = v8 + 56;
  v159 = v104;
LABEL_55:
  while (v110)
  {
    v113 = __clz(__rbit64(v110));
    v110 &= v110 - 1;
    v114 = v113 | (v106 << 6);
LABEL_70:
    a2 = *(_QWORD *)(*(_QWORD *)(v104 + 48) + 8 * v114);
    if (!*((_QWORD *)v8 + 2))
      goto LABEL_77;
    sub_222AADB80();
    sub_222AADBA4();
    v118 = sub_222AADBB0();
    v119 = -1 << v8[32];
    v120 = v118 & ~v119;
    if (((*(_QWORD *)&v164[(v120 >> 3) & 0xFFFFFFFFFFFFF8] >> v120) & 1) == 0)
      goto LABEL_77;
    v121 = *((_QWORD *)v8 + 6);
    if (*(_QWORD *)(v121 + 8 * v120) != a2)
    {
      v122 = ~v119;
      while (1)
      {
        v120 = (v120 + 1) & v122;
        if (((*(_QWORD *)&v164[(v120 >> 3) & 0xFFFFFFFFFFFFF8] >> v120) & 1) == 0)
          break;
        if (*(_QWORD *)(v121 + 8 * v120) == a2)
          goto LABEL_55;
      }
LABEL_77:
      v167 = v106;
      v123 = v8;
      v124 = sub_222A8B200(a2);
      if ((v125 & 1) != 0)
      {
        v126 = v124;
        v127 = swift_isUniquelyReferenced_nonNull_native();
        v128 = *v24;
        v176[0] = *v24;
        *v24 = 0x8000000000000000;
        v129 = v24;
        if ((v127 & 1) == 0)
        {
          sub_222AABE70();
          v128 = v176[0];
        }
        v112 = v165;
        v42 = v160;
        sub_222A7A688(*(_QWORD *)(v128 + 56) + *(_QWORD *)(v165 + 72) * v126, (uint64_t)v160);
        sub_222AAB8E4(v126, v128);
        *v129 = v128;
        swift_bridgeObjectRelease();
        v111 = 0;
        v8 = v123;
        v104 = v159;
      }
      else
      {
        v111 = 1;
        v112 = v165;
      }
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v112 + 56))(v42, v111, 1, v166);
      sub_222A7DCD0((uint64_t)v42, &qword_2540C7E30);
      sub_222AA54C4(v176, a2);
      sub_222AA54C4(v176, a2);
      v24 = v163;
      v106 = v167;
    }
  }
  if (__OFADD__(v106++, 1))
  {
    __break(1u);
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  if (v106 >= v162)
    goto LABEL_85;
  v116 = v161[v106];
  if (v116)
  {
LABEL_69:
    v110 = (v116 - 1) & v116;
    v114 = __clz(__rbit64(v116)) + (v106 << 6);
    goto LABEL_70;
  }
  v117 = v106 + 1;
  if (v106 + 1 >= v162)
    goto LABEL_85;
  v116 = v161[v117];
  if (v116)
    goto LABEL_68;
  v117 = v106 + 2;
  if (v106 + 2 >= v162)
    goto LABEL_85;
  v116 = v161[v117];
  if (v116)
    goto LABEL_68;
  v117 = v106 + 3;
  if (v106 + 3 >= v162)
    goto LABEL_85;
  v116 = v161[v117];
  if (v116)
  {
LABEL_68:
    v106 = v117;
    goto LABEL_69;
  }
  v117 = v106 + 4;
  if (v106 + 4 < v162)
  {
    v116 = v161[v117];
    if (!v116)
    {
      while (1)
      {
        v106 = v117 + 1;
        if (__OFADD__(v117, 1))
          goto LABEL_90;
        if (v106 >= v162)
          goto LABEL_85;
        v116 = v161[v106];
        ++v117;
        if (v116)
          goto LABEL_69;
      }
    }
    goto LABEL_68;
  }
LABEL_85:
  swift_release();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v130 = (uint64_t)v145;
  __swift_project_boxed_opaque_existential_1(v145 + 22, v145[25]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v177 = v134;
  v176[0] = v130;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v176, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  if (v132)
  {
    swift_bridgeObjectRetain();
    v131 = sub_222AADA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v131 = *(_QWORD *)((v156 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v177 = MEMORY[0x24BEE1768];
  v176[0] = v131;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v176, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  result = swift_bridgeObjectRelease();
  *v138 = v179;
  return result;
}

BOOL sub_222A98E18()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 136) != 1;
}

uint64_t sub_222A98E2C()
{
  return swift_retain();
}

uint64_t sub_222A98E38()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

uint64_t sub_222A98E54(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v3 + 48) = a2;
  v4 = *v2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 32) = v5;
  *v5 = v3;
  v5[1] = sub_222A9620C;
  return sub_222A955C0();
}

uint64_t sub_222A98EA4(char a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  *(_BYTE *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 16) = *v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_222A96B18;
  return sub_222A955C0();
}

void sub_222A98EF4()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 216) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
}

BOOL sub_222A98F64(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 8) & 1) == 0;
}

uint64_t sub_222A98F74()
{
  return PurchaseHistoryAppStateDataSource.description.getter();
}

_QWORD *sub_222A98F94(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768DA8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_222A997EC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_222A9A434();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_222A99078(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8240);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_222A999E8(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_222A9A434();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_222A9915C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_222A992DC((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_222A992DC((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x2276780C8](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_222A992DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t i;
  unint64_t v25;
  BOOL v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;

  v43 = (unint64_t *)result;
  v6 = 0;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v7 = 0;
    v8 = a4 + 56;
    v9 = 1 << *(_BYTE *)(a4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(a4 + 56);
    v45 = (unint64_t)(v9 + 63) >> 6;
    v12 = a3 + 56;
    while (1)
    {
LABEL_6:
      if (v11)
      {
        v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v14 = v13 | (v7 << 6);
      }
      else
      {
        v15 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v15 >= v45)
          goto LABEL_60;
        v16 = *(_QWORD *)(v8 + 8 * v15);
        ++v7;
        if (!v16)
        {
          v7 = v15 + 1;
          if (v15 + 1 >= v45)
            goto LABEL_60;
          v16 = *(_QWORD *)(v8 + 8 * v7);
          if (!v16)
          {
            v7 = v15 + 2;
            if (v15 + 2 >= v45)
              goto LABEL_60;
            v16 = *(_QWORD *)(v8 + 8 * v7);
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v45)
              {
LABEL_60:
                swift_retain();
                return sub_222AA67E0(v43, a2, v6, a3);
              }
              v16 = *(_QWORD *)(v8 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  v7 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    break;
                  if (v7 >= v45)
                    goto LABEL_60;
                  v16 = *(_QWORD *)(v8 + 8 * v7);
                  ++v17;
                  if (v16)
                    goto LABEL_21;
                }
LABEL_63:
                __break(1u);
                goto LABEL_64;
              }
              v7 = v17;
            }
          }
        }
LABEL_21:
        v11 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v7 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v14);
      sub_222AADB80();
      sub_222AADBA4();
      result = sub_222AADBB0();
      v19 = -1 << *(_BYTE *)(a3 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      v22 = 1 << v20;
      if (((1 << v20) & *(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
      {
        v23 = *(_QWORD *)(a3 + 48);
        if (*(_QWORD *)(v23 + 8 * v20) != v18)
        {
          for (i = v20 + 1; ; i = v25 + 1)
          {
            v25 = i & ~v19;
            if (((*(_QWORD *)(v12 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
              goto LABEL_6;
            if (*(_QWORD *)(v23 + 8 * v25) == v18)
              break;
          }
          v21 = v25 >> 6;
          v22 = 1 << v25;
        }
        v43[v21] |= v22;
        v26 = __OFADD__(v6++, 1);
        if (v26)
          break;
      }
    }
    __break(1u);
  }
  v27 = 0;
  v44 = a3 + 56;
  v28 = 1 << *(_BYTE *)(a3 + 32);
  if (v28 < 64)
    v29 = ~(-1 << v28);
  else
    v29 = -1;
  v30 = v29 & *(_QWORD *)(a3 + 56);
  v46 = (unint64_t)(v28 + 63) >> 6;
  v31 = a4 + 56;
  while (v30)
  {
    v32 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    v33 = v32 | (v27 << 6);
LABEL_52:
    v37 = *(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v33);
    sub_222AADB80();
    sub_222AADBA4();
    result = sub_222AADBB0();
    v38 = -1 << *(_BYTE *)(a4 + 32);
    v39 = result & ~v38;
    if (((*(_QWORD *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) != 0)
    {
      v40 = *(_QWORD *)(a4 + 48);
      if (*(_QWORD *)(v40 + 8 * v39) == v37)
      {
LABEL_57:
        *(unint64_t *)((char *)v43 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
        v26 = __OFADD__(v6++, 1);
        if (v26)
        {
          __break(1u);
          goto LABEL_60;
        }
      }
      else
      {
        v41 = ~v38;
        while (1)
        {
          v39 = (v39 + 1) & v41;
          if (((*(_QWORD *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) == 0)
            break;
          if (*(_QWORD *)(v40 + 8 * v39) == v37)
            goto LABEL_57;
        }
      }
    }
  }
  v34 = v27 + 1;
  if (__OFADD__(v27, 1))
    goto LABEL_62;
  if (v34 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v34);
  ++v27;
  if (v35)
    goto LABEL_51;
  v27 = v34 + 1;
  if (v34 + 1 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v27);
  if (v35)
    goto LABEL_51;
  v27 = v34 + 2;
  if (v34 + 2 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v27);
  if (v35)
  {
LABEL_51:
    v30 = (v35 - 1) & v35;
    v33 = __clz(__rbit64(v35)) + (v27 << 6);
    goto LABEL_52;
  }
  v36 = v34 + 3;
  if (v36 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v36);
  if (v35)
  {
    v27 = v36;
    goto LABEL_51;
  }
  while (1)
  {
    v27 = v36 + 1;
    if (__OFADD__(v36, 1))
      break;
    if (v27 >= v46)
      goto LABEL_60;
    v35 = *(_QWORD *)(v44 + 8 * v27);
    ++v36;
    if (v35)
      goto LABEL_51;
  }
LABEL_64:
  __break(1u);
  return result;
}

void (*sub_222A996F8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_222A99778(v6, a2, a3);
  return sub_222A9974C;
}

void sub_222A9974C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_222A99778(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x227677A50](a2, a3);
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
    return sub_222A997E4;
  }
  __break(1u);
  return result;
}

void sub_222A997E4(id *a1)
{

}

uint64_t sub_222A997EC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
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

_QWORD *sub_222A999E8(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

_QWORD *sub_222A99B7C@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_222A99BB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_222A8FB04();
  result = sub_222AAD8F8();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_222AA54C4(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t *sub_222A99C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_0;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _BYTE v28[40];
  _QWORD v29[4];
  uint64_t v30[5];
  _QWORD v31[6];

  v27 = *a7;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7550);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v28[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v31[3] = &type metadata for SingleAccountFamily;
  v31[4] = &protocol witness table for SingleAccountFamily;
  v18 = swift_allocObject();
  v31[0] = v18;
  v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 48) = *(_QWORD *)(a1 + 32);
  v20 = sub_222AAD748();
  v30[3] = v20;
  v30[4] = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(boxed_opaque_existential_0, a6, v20);
  a7[20] = 0;
  *((_BYTE *)a7 + 168) = 1;
  sub_222A723C0((uint64_t)v31, (uint64_t)(a7 + 2));
  sub_222A723C0(a2, (uint64_t)(a7 + 7));
  sub_222A723C0(a3, (uint64_t)(a7 + 12));
  a7[17] = a4;
  a7[18] = (uint64_t)a5;
  sub_222A723C0((uint64_t)v30, (uint64_t)(a7 + 22));
  a7[19] = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  *((_BYTE *)a7 + 169) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  v22 = a5;
  a7[28] = sub_222AAD778();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  a7[27] = v23;
  objc_msgSend(v22, sel_addObserver_selector_name_object_, a7, sel_purchaseHistoryUpdated_, *MEMORY[0x24BE044B8], 0, v27);
  v24 = a7[5];
  v25 = a7[6];
  __swift_project_boxed_opaque_existential_1(a7 + 2, v24);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v25 + 8))(v29, v24, v25);
  __swift_project_boxed_opaque_existential_1(v29, v29[3]);
  sub_222AAD5F8();
  swift_getObjectType();
  sub_222AAD5BC();
  sub_222AAD5C8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return a7;
}

uint64_t sub_222A99EE8(uint64_t a1)
{
  destroy for AdamID.Context();
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_222A99F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32[40];
  _QWORD v33[4];
  uint64_t v34[5];
  uint64_t v35[6];

  v27 = a4;
  v29 = *a7;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7550);
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v28 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = a8;
  v35[4] = a10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(boxed_opaque_existential_0, a1, a8);
  v34[3] = a9;
  v34[4] = a11;
  v20 = __swift_allocate_boxed_opaque_existential_0(v34);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 32))(v20, a6, a9);
  a7[20] = 0;
  *((_BYTE *)a7 + 168) = 1;
  sub_222A723C0((uint64_t)v35, (uint64_t)(a7 + 2));
  sub_222A723C0(a2, (uint64_t)(a7 + 7));
  sub_222A723C0(a3, (uint64_t)(a7 + 12));
  a7[17] = v27;
  a7[18] = (uint64_t)a5;
  sub_222A723C0((uint64_t)v34, (uint64_t)(a7 + 22));
  a7[19] = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  *((_BYTE *)a7 + 169) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  v21 = a5;
  a7[28] = sub_222AAD778();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v22 = swift_allocObject();
  *(_DWORD *)(v22 + 16) = 0;
  a7[27] = v22;
  objc_msgSend(v21, sel_addObserver_selector_name_object_, a7, sel_purchaseHistoryUpdated_, *MEMORY[0x24BE044B8], 0);
  v23 = a7[5];
  v24 = a7[6];
  __swift_project_boxed_opaque_existential_1(a7 + 2, v23);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v24 + 8))(v33, v23, v24);
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  sub_222AAD5F8();
  swift_getObjectType();
  sub_222AAD5BC();
  v25 = v28;
  sub_222AAD5C8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return a7;
}

uint64_t *sub_222A9A214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v28 = a4;
  v29 = a5;
  v26 = a2;
  v27 = a3;
  v25 = a10;
  v14 = *(_QWORD *)(a9 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a6, a9);
  return sub_222A99F44((uint64_t)v21, v26, v27, v28, v29, (uint64_t)v17, v22, a8, a9, v25, a11);
}

uint64_t sub_222A9A338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222A96BE8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t type metadata accessor for PurchaseHistoryAppStateDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for PurchaseHistoryAppStateDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_222A9A380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_222A7E0EC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_222A9A3E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_222A97BF4(a1);
}

uint64_t sub_222A9A3F8(uint64_t a1)
{
  uint64_t v1;

  return sub_222A8F708(a1, *(uint64_t (**)(void))(v1 + 16));
}

void sub_222A9A410(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_222A97C50(*(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_222A9A434()
{
  return swift_release();
}

void sub_222A9A43C(_BYTE *a1@<X8>)
{
  uint64_t v1;

  if ((*(_BYTE *)(v1 + 169) & 1) != 0)
  {
    *a1 = 0;
  }
  else
  {
    *(_BYTE *)(v1 + 169) = 1;
    *a1 = 1;
  }
}

uint64_t sub_222A9A460()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A7E0EC;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_222A7E220;
  return sub_222A955C0();
}

uint64_t sub_222A9A4C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A9A4EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255768E50 + dword_255768E50))(a1, v4);
}

uint64_t sub_222A9A55C(uint64_t a1)
{
  uint64_t v1;

  return sub_222A94FCC(a1, v1);
}

uint64_t objectdestroyTm_1()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222A9A594(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (_QWORD *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_222A7E220;
  return sub_222A97510(a1, v4, v5, v6);
}

uint64_t sub_222A9A600()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

void sub_222A9A624(_QWORD *a1@<X8>)
{
  sub_222A9A410(a1);
}

uint64_t sub_222A9A638@<X0>(uint64_t a1@<X8>)
{
  return sub_222A9A338(a1);
}

uint64_t dispatch thunk of PurchaseManager.isDeletableSystemApp(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PurchaseManager.start(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_222A70BFC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PurchaseManager.install(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_222A7E0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of RegulatoryLogger.willAccessLocationForSearch()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RegulatoryLogger.willTransmitLocationForSearch()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RegulatoryLogger.willRequestAppList()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t static Restrictions.defaultMaxAppContentRating.getter()
{
  return 1000;
}

BOOL Restrictions.isActionableOffer(_:with:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  _BOOL8 result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = type metadata accessor for State();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v35 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v35 - v16;
  v19 = *a1;
  if ((*a1 & 4) == 0)
  {
    v36 = v17;
    v37 = a2;
    v38 = a4;
    v20 = a1[1];
    v21 = *((_BYTE *)a1 + 16);
    sub_222A78EE0(a2, (uint64_t)&v35 - v16);
    v22 = swift_getEnumCaseMultiPayload() - 1;
    result = 0;
    switch(v22)
    {
      case 0:
        return result;
      case 2:
        swift_bridgeObjectRelease();
        goto LABEL_4;
      case 5:
      case 7:
LABEL_4:
        v35 = v20;
        v24 = v38;
        v25 = a3;
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v38 + 16))(a3, v38) & 1) == 0)
          return 0;
        v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 32))(a3, v24);
        if ((v19 & 8) == 0 && (v26 & 1) != 0)
          return 0;
        v27 = v21;
        v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 40))(v25, v24);
        sub_222A78EE0(v37, (uint64_t)v15);
        if ((v28 & 1) == 0)
        {
          sub_222A783C0((uint64_t)v15);
LABEL_15:
          if ((v27 & 1) != 0)
            return 1;
          v32 = (*(uint64_t (**)(uint64_t))(v38 + 8))(v25);
          return v32 >= v35;
        }
        swift_storeEnumTagMultiPayload();
        _s8AppState0B0O2eeoiySbAC_ACtFZ_0((uint64_t)v15, (uint64_t)v12);
        v30 = v29;
        sub_222A783C0((uint64_t)v12);
        v31 = v36;
        sub_222A78EE0((uint64_t)v15, v36);
        if ((v30 & 1) != 0)
        {
          sub_222A783C0(v31);
          sub_222A783C0((uint64_t)v15);
          return 0;
        }
        swift_storeEnumTagMultiPayload();
        _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v31, (uint64_t)v12);
        v34 = v33;
        sub_222A783C0((uint64_t)v12);
        sub_222A783C0(v31);
        sub_222A783C0((uint64_t)v15);
        if ((v34 & 1) == 0)
          goto LABEL_15;
        break;
      default:
        sub_222A783C0((uint64_t)v18);
        return 1;
    }
  }
  return 0;
}

uint64_t dispatch thunk of Restrictions.maxAppContentRating.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Restrictions.isAppInstallationAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Restrictions.isAppUninstallationAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Restrictions.isRunningInStoreDemoMode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Restrictions.hasManagedAppleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Restrictions.isAccountModificationRestricted.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Restrictions.onRestrictionsChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

id sub_222A9AA1C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_ams_DSID);
  *a2 = result;
  return result;
}

id sub_222A9AA54(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setDSID_, *a1);
}

uint64_t SingleAccountFamily.init(primaryAccount:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_222A80690(a1, a2);
}

uint64_t SingleAccountFamily.primaryAccount.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222A723C0(v1, a1);
}

uint64_t SingleAccountFamily.fetchFamilyMemberIDs()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7560);
  *(_QWORD *)(v1 + 32) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9AAD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 32);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
  sub_222AAD5EC();
  v2 = sub_222AAD6D0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 32);
  if (v4 == 1)
  {
    sub_222A73FA8(*(_QWORD *)(v0 + 32));
LABEL_5:
    v8 = MEMORY[0x24BEE4AF8];
    goto LABEL_6;
  }
  swift_getKeyPath();
  sub_222AAD6C4();
  swift_release();
  v6 = *(void **)(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  if (!v6)
    goto LABEL_5;
  v7 = objc_msgSend(v6, sel_longLongValue);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7608);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_222AAE880;
  *(_QWORD *)(v8 + 32) = v7;
LABEL_6:
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

id sub_222A9AC0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_ams_DSID);
  *a2 = result;
  return result;
}

id sub_222A9AC44(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setDSID_, *a1);
}

uint64_t sub_222A9AC58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222A723C0(v1, a1);
}

uint64_t sub_222A9AC64()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_222A73D98;
  return SingleAccountFamily.fetchFamilyMemberIDs()();
}

ValueMetadata *type metadata accessor for SingleAccountFamily()
{
  return &type metadata for SingleAccountFamily;
}

uint64_t sub_222A9ACB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_222AAD8A4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_222AAD898();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_222A7DCD0(a1, &qword_2540C8180);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_222AAD868();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_222A9AE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[4];
  _QWORD v19[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222A89EBC(a1, (uint64_t)v9, &qword_2540C8180);
  v10 = sub_222AAD8A4();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_222A7DCD0((uint64_t)v9, &qword_2540C8180);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_222AAD868();
      v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_222AAD898();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v15 = *v4;
  v16 = (_QWORD *)(v14 | v12);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v16 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  v18[1] = 1;
  v18[2] = v16;
  v18[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t sub_222A9AF94(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int64_t v5;
  int v6;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v15 = MEMORY[0x24BEE4AF8];
  sub_222AA5184(0, v1, 0);
  v2 = v15;
  result = sub_222AA7BD4(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(a1 + 36) != v7)
      goto LABEL_14;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v5);
    v12 = *(_QWORD *)(v15 + 16);
    v11 = *(_QWORD *)(v15 + 24);
    if (v12 >= v11 >> 1)
      sub_222AA5184((char *)(v11 > 1), v12 + 1, 1);
    *(_QWORD *)(v15 + 16) = v12 + 1;
    *(_QWORD *)(v15 + 8 * v12 + 32) = v10;
    result = sub_222AA7C78(v5, v7, v9 & 1, a1);
    v5 = result;
    v7 = v13;
    v9 = v14 & 1;
    if (!--v1)
    {
      sub_222A8BEB4(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_222A9B0FC(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = a5;
  *(double *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  *(_QWORD *)(v5 + 48) = swift_task_alloc();
  v6 = sub_222AAD4B4();
  *(_QWORD *)(v5 + 56) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 72) = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  *(_QWORD *)(v5 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9B19C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  v1 = v0[11];
  v2 = v0[8];
  v3 = v0[6];
  v13 = v0[7];
  v14 = v0[10];
  v4 = v0[4];
  v5 = v0[5];
  sub_222AAD484();
  v6 = sub_222AAD8A4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v3, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v5;
  swift_retain();
  sub_222A9AE04(v3, (uint64_t)&unk_255768E80, (uint64_t)v8);
  sub_222A7DCD0(v3, &qword_2540C8180);
  v7(v3, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v14, v1, v13);
  v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v10 + v9, v14, v13);
  sub_222A9AE04(v3, (uint64_t)&unk_255768E90, v10);
  sub_222A7DCD0(v3, &qword_2540C8180);
  v11 = (_QWORD *)swift_task_alloc();
  v0[12] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8188);
  *v11 = v0;
  v11[1] = sub_222A9B358;
  return sub_222AAD8E0();
}

uint64_t sub_222A9B358()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A9B3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v1 = *(_QWORD *)(v0 + 88);
    v2 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8260);
    sub_222AAD8EC();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_222A9B46C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9B4D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_222A7E220;
  return v8(a1);
}

uint64_t sub_222A9B534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_222A9B54C()
{
  uint64_t v0;
  uint64_t result;
  double v2;
  double v3;
  _QWORD *v4;

  result = sub_222AAD490();
  if (v2 <= 0.0)
  {
    sub_222AAD8BC();
    sub_222AA91FC();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = v2 * 1000000000.0;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) != 0)
  {
    if (v3 > -1.0)
    {
      if (v3 < 1.84467441e19)
      {
        v4 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 24) = v4;
        *v4 = v0;
        v4[1] = sub_222A9B64C;
        return sub_222AAD8C8();
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_222A9B64C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_222A9B6B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_222AAD8BC();
  if (!v1)
  {
    sub_222AA91FC();
    swift_allocError();
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9B720(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_222A9B74C(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;

  v1 = result;
  v2 = 0;
  v3 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    result = sub_222AA54C4(&v13, *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v9));
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_222A9B894(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    result = sub_222AA54C4(&v13, *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v9));
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_222A9B9DC(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    result = sub_222AA55E0((uint64_t)&v13, *(_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v9), *(_BYTE *)(*(_QWORD *)(v1 + 48) + 16 * v9 + 8));
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_222A9BB2C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_222A9BB50()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)v0 + 16);
  swift_retain();
  os_unfair_lock_lock(v1 + 6);
  sub_222AA8C94();
  os_unfair_lock_unlock(v1 + 6);
  return swift_release();
}

uint64_t StorefrontAppStateController.Configuration.init(updateRegistry:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_0;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  sub_222A723C0(a1, (uint64_t)a2);
  a2[5] = MEMORY[0x24BEE4AF8];
  if (qword_2540C7A68 != -1)
    swift_once();
  v4 = qword_2540C8E38;
  v5 = type metadata accessor for DefaultAppStateRules();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  a2[9] = v5;
  a2[10] = &off_24E975D98;
  a2[6] = v6;
  a2[11] = 0x403E000000000000;
  v7 = qword_2540C80F8;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = sub_222AAD748();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2540C8E48);
  v13 = v8;
  v14 = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, v9, v8);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return sub_222A80690(&v12, (uint64_t)(a2 + 12));
}

uint64_t StorefrontAppStateController.Configuration.withDataSources(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_222A9BD34(v2, a2);
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + 40) = a1;
  return result;
}

uint64_t sub_222A9BD34(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for StorefrontAppStateController.Configuration(a2, a1);
  return a2;
}

uint64_t *StorefrontAppStateController.Configuration.withStateTransitionRules(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_222A9BD34(v2, a2);
  return __swift_assign_boxed_opaque_existential_1((uint64_t *)(a2 + 48), a1);
}

uint64_t StorefrontAppStateController.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[40];
  _BYTE v14[40];

  v2 = sub_222AAD748();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(double *)(a1 + 88);
  sub_222A723C0(a1 + 48, (uint64_t)v14);
  sub_222A723C0(a1, (uint64_t)v13);
  v8 = qword_2540C80F8;
  swift_bridgeObjectRetain();
  if (v8 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v2, (uint64_t)qword_2540C8E48);
  v10 = swift_allocObject();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  v11 = sub_222AA7D5C(v6, (uint64_t)v14, (uint64_t)v13, (uint64_t)v5, v10, v7);
  sub_222AA8080(a1);
  return v11;
}

BOOL StorefrontAppStateController.isLoaded.getter()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  _BOOL8 v2;
  BOOL v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA80AC(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t StorefrontAppStateController.onLoad.getter()
{
  return swift_retain();
}

uint64_t StorefrontAppStateController.loadDataSources()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_222A9BF44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  v3 = *(os_unfair_lock_s **)(v1 + 192);
  v4 = swift_task_alloc();
  v5 = v4;
  if (v2)
  {
    *(_QWORD *)(v4 + 16) = sub_222AA80C0;
    *(_QWORD *)(v4 + 24) = v1;
    os_unfair_lock_lock(v3 + 4);
    (*(void (**)(uint64_t *__return_ptr))(v5 + 16))(&v11);
    v8 = v11;
    *(_QWORD *)(v0 + 24) = v11;
    os_unfair_lock_unlock(v3 + 4);
    swift_task_dealloc();
    if (v8)
    {
      swift_retain();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 32) = v9;
      *v9 = v0;
      v9[1] = sub_222A9C0EC;
      return sub_222AAD8B0();
    }
  }
  else
  {
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = 1;
    v6 = swift_task_alloc();
    *(_QWORD *)(v6 + 16) = sub_222AA80D8;
    *(_QWORD *)(v6 + 24) = v5;
    os_unfair_lock_lock(v3 + 4);
    sub_222A8F708(v7, *(uint64_t (**)(void))(v6 + 16));
    os_unfair_lock_unlock(v3 + 4);
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9C0EC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222A9C140()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 40) & 1) != 0)
    return swift_willThrowTypedImpl();
  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_222A9C1A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    if (v3 == 1)
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v4 = sub_222A9C234();
    v6 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;
    swift_retain_n();
    sub_222AA8754(v6);
    if (*(_QWORD *)(a1 + 24) == 1)
      sub_222AAD538();
    swift_release();
  }
  *a2 = v4;
  return sub_222AA941C(v3);
}

uint64_t sub_222A9C234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_222AAD8A4();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_222A7DCD0((uint64_t)v4, &qword_2540C8180);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_222AAD898();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_222AAD868();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_255768ED8;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  return swift_task_create();
}

uint64_t StorefrontAppStateController.reloadAllStates(synchronizing:)(char a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = v1;
  *(_BYTE *)(v2 + 140) = a1;
  *(_QWORD *)(v2 + 88) = *v1;
  sub_222AAD598();
  *(_QWORD *)(v2 + 96) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9C468()
{
  uint64_t v0;
  uint64_t v1;
  double *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  _QWORD *v6;
  char v8;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(double **)(v0 + 80);
  v8 = *(_BYTE *)(v0 + 140);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v2 + 19, *((_QWORD *)v2 + 22));
  *(_QWORD *)(v0 + 104) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  v3 = *(_QWORD *)(sub_222AAD5B0() - 8);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v3 + 72);
  *(_DWORD *)(v0 + 136) = *(_DWORD *)(v3 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 16) = v2;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 16, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD550();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v4 = v2[18];
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 120) = v5;
  *(_BYTE *)(v5 + 16) = v8;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v6;
  *v6 = v0;
  v6[1] = sub_222A9C634;
  return sub_222A9C878((uint64_t)&unk_255768DE8, v5, v4);
}

uint64_t sub_222A9C634()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_222A9C690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 72) = v1;
  *(_QWORD *)(v0 + 48) = v2;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 48, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD550();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9C7DC(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 32) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_222A9C7F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 40) + *(_QWORD *)(v3 + 40));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v4;
  *v4 = v0;
  v4[1] = sub_222A96FD4;
  return v6(*(unsigned __int8 *)(v0 + 32), v2, v3);
}

uint64_t sub_222A9C878(uint64_t a1, uint64_t a2, double a3)
{
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 200) = a2;
  *(_QWORD *)(v4 + 208) = v3;
  *(_QWORD *)(v4 + 192) = a1;
  *(double *)(v4 + 184) = a3;
  *(_QWORD *)(v4 + 216) = *v3;
  sub_222AAD598();
  *(_QWORD *)(v4 + 224) = swift_task_alloc();
  *(_QWORD *)(v4 + 232) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9C8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v1 + 16);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = *(_QWORD *)(v0 + 192);
    v3 = *(_QWORD *)(v0 + 200);
    v5 = *(_QWORD *)(v0 + 184);
    sub_222A723C0(v1 + 152, v0 + 16);
    v6 = (_QWORD *)swift_allocObject();
    *(_QWORD *)(v0 + 240) = v6;
    v6[2] = v2;
    v6[3] = v4;
    v6[4] = v3;
    sub_222A80690((__int128 *)(v0 + 16), (uint64_t)(v6 + 5));
    v6[10] = v1;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v7;
    v7[2] = v5;
    v7[3] = &unk_255768E60;
    v7[4] = v6;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v8;
    *v8 = v0;
    v8[1] = sub_222A9CA40;
    return sub_222AADAC0();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A9CA40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_222A9CAB4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222A9CAEC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;
  void *v10;

  v1 = v0;
  v2 = v0 + 15;
  v10 = (void *)v0[33];
  v3 = v0[27];
  v4 = v1[26];
  v5 = v1[23];
  swift_task_dealloc();
  swift_release();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 152), *(_QWORD *)(v4 + 176));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  v1[10] = v3;
  v1[7] = v4;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)(v1 + 7), (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v1[14] = MEMORY[0x24BEE13C8];
  v1[11] = v5;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)(v1 + 11), (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v6 = v1[19];
  v7 = v1[20];
  v1[18] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v2, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t StorefrontAppStateController.reloadState(forApps:synchronizing:)(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 228) = a2;
  *(_QWORD *)(v3 + 144) = a1;
  *(_QWORD *)(v3 + 152) = v2;
  *(_QWORD *)(v3 + 160) = *v2;
  sub_222AAD598();
  *(_QWORD *)(v3 + 168) = swift_task_alloc();
  *(_QWORD *)(v3 + 176) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9CDD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD *v9;
  char v11;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 160);
  v11 = *(_BYTE *)(v1 + 228);
  v3 = *(_QWORD *)(v1 + 144);
  v4 = *(double **)(v1 + 152);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v4 + 19, *((_QWORD *)v4 + 22));
  *(_QWORD *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  v5 = *(_QWORD *)(sub_222AAD5B0() - 8);
  *(_QWORD *)(v1 + 192) = *(_QWORD *)(v5 + 72);
  *(_DWORD *)(v1 + 224) = *(_DWORD *)(v5 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 16) = v4;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 16, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C76A0);
  *(_QWORD *)(v1 + 200) = v6;
  *(_QWORD *)(v1 + 72) = v6;
  *(_QWORD *)(v1 + 48) = v3;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 48, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  v7 = v4[18];
  v8 = swift_allocObject();
  *(_QWORD *)(v1 + 208) = v8;
  *(_QWORD *)(v8 + 16) = v3;
  *(_BYTE *)(v8 + 24) = v11;
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 216) = v9;
  *v9 = v1;
  v9[1] = sub_222A9D018;
  return sub_222A9C878((uint64_t)&unk_255768E08, v8, v7);
}

uint64_t sub_222A9D018()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_222A9D074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v1 + 152);
  v6 = *(_QWORD *)(v1 + 144);
  v7 = v2;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 152), *(_QWORD *)(v4 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 104) = v3;
  *(_QWORD *)(v1 + 80) = v4;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 80, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v1 + 136) = v7;
  *(_QWORD *)(v1 + 112) = v6;
  swift_bridgeObjectRetain();
  sub_222AAD55C();
  sub_222A7DCD0(v1 + 112, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_222A9D22C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 64) = a3;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_222A9D248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, _QWORD, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  v4 = sub_222AA6CE4((uint64_t)sub_222AA8E88, v3, v1);
  swift_task_dealloc();
  if (*(_QWORD *)(v4 + 16))
  {
    v5 = *(_QWORD **)(v0 + 24);
    v6 = v5[3];
    v7 = v5[4];
    __swift_project_boxed_opaque_existential_1(v5, v6);
    v8 = sub_222A9AF94(v4);
    swift_release();
    v9 = sub_222A99BB8(v8);
    *(_QWORD *)(v0 + 40) = v9;
    swift_bridgeObjectRelease();
    v12 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(**(int **)(v7 + 32) + *(_QWORD *)(v7 + 32));
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v10;
    *v10 = v0;
    v10[1] = sub_222A9D384;
    return v12(v9, *(unsigned __int8 *)(v0 + 64), v6, v7);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_222A9D384()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222A9D3F8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t StorefrontAppStateController.preloadState(forApps:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(os_unfair_lock_s **)(v1 + 192);
  v15 = a1;
  v16 = v1;
  v8 = v7 + 4;
  os_unfair_lock_lock(v7 + 4);
  sub_222AA8200(&v17);
  v9 = v17;
  os_unfair_lock_unlock(v8);
  v10 = *(_QWORD *)(v9 + 16);
  result = swift_bridgeObjectRelease();
  if (v10)
  {
    v12 = sub_222AAD8A4();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v2;
    v13[5] = a1;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_222A9ACB8((uint64_t)v6, (uint64_t)&unk_255768E18, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t sub_222A9D558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_beginAccess();
  v6 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(v6 + 16) <= *(_QWORD *)(a1 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_222AA7028(v6);
    swift_bridgeObjectRelease();
    v8 = a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    v7 = swift_bridgeObjectRetain();
    v8 = sub_222AA71A0(v7, a1);
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  sub_222A9B9DC(v9);
  result = swift_endAccess();
  *a3 = v8;
  return result;
}

uint64_t sub_222A9D64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[28] = a4;
  v5[29] = a5;
  sub_222AAD598();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222A9D6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 224) + 16);
  *(_QWORD *)(v0 + 256) = v1;
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 264) = v2;
  if (!v2)
  {
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_QWORD *)(v0 + 272) = 0;
  v3 = *(_QWORD *)(v1 + 16);
  v4 = swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v5 = 0;
  while (1)
  {
    sub_222A723C0(v4 + 40 * v5 + 32, v0 + 16);
    v6 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v6);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7) & 1) != 0)
      break;
LABEL_7:
    v11 = *(_QWORD *)(v0 + 264);
    v12 = *(_QWORD *)(v0 + 272) + 1;
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    if (v12 == v11)
      goto LABEL_10;
    v5 = *(_QWORD *)(v0 + 272) + 1;
    *(_QWORD *)(v0 + 272) = v5;
    v4 = *(_QWORD *)(v0 + 256);
    if (v5 >= *(_QWORD *)(v4 + 16))
      goto LABEL_9;
  }
  v8 = *(_QWORD *)(v0 + 232);
  v9 = swift_task_alloc();
  *(_QWORD *)(v9 + 16) = v0 + 16;
  swift_bridgeObjectRetain();
  v10 = sub_222AA6CE4((uint64_t)sub_222AA8E88, v9, v8);
  *(_QWORD *)(v0 + 280) = v10;
  swift_task_dealloc();
  if (!*(_QWORD *)(v10 + 16))
  {
    swift_release();
    goto LABEL_7;
  }
  v14 = *(_QWORD *)(v0 + 40);
  v15 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v14);
  v16 = sub_222A9AF94(v10);
  sub_222A8FB04();
  v17 = sub_222AAD8F8();
  v18 = *(_QWORD *)(v16 + 16);
  if (v18)
  {
    v30 = v14;
    v19 = 0;
    v20 = v16 + 32;
    do
    {
      v22 = v17 + 56;
      while (1)
      {
        v23 = *(_QWORD *)(v20 + 8 * v19++);
        sub_222AADB80();
        sub_222AADBA4();
        v24 = sub_222AADBB0();
        v25 = -1 << *(_BYTE *)(v17 + 32);
        v26 = v24 & ~v25;
        if (((*(_QWORD *)(v22 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) == 0)
          break;
        v27 = *(_QWORD *)(v17 + 48);
        if (*(_QWORD *)(v27 + 8 * v26) != v23)
        {
          v28 = ~v25;
          do
          {
            v26 = (v26 + 1) & v28;
            if (((*(_QWORD *)(v22 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) == 0)
              goto LABEL_14;
          }
          while (*(_QWORD *)(v27 + 8 * v26) != v23);
        }
        if (v19 == v18)
          goto LABEL_23;
      }
LABEL_14:
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_222AA5CC8(v23, v26, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
    while (v19 != v18);
LABEL_23:
    swift_bridgeObjectRelease();
    v14 = v30;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(v0 + 288) = v17;
  v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v15 + 32) + *(_QWORD *)(v15 + 32));
  v29 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v29;
  *v29 = v0;
  v29[1] = sub_222A9D9CC;
  return v31(v17, 1, v14, v15);
}

uint64_t sub_222A9D9CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_222A9DA40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t (*v26)(uint64_t *);
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t);

  v1 = *(_QWORD *)(v0 + 304);
  v2 = sub_222AA8E88;
  while (1)
  {
    do
    {
      v3 = *(_QWORD *)(v0 + 264);
      v4 = *(_QWORD *)(v0 + 272) + 1;
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      if (v4 == v3)
      {
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v5 = *(_QWORD *)(v0 + 272) + 1;
      *(_QWORD *)(v0 + 272) = v5;
      v6 = *(_QWORD *)(v0 + 256);
      if (v5 >= *(_QWORD *)(v6 + 16))
      {
        __break(1u);
        goto LABEL_21;
      }
      sub_222A723C0(v6 + 40 * v5 + 32, v0 + 16);
      v7 = *(_QWORD *)(v0 + 40);
      v8 = *(_QWORD *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v7);
    }
    while (((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8) & 1) == 0);
    v9 = *(_QWORD *)(v0 + 232);
    v10 = swift_task_alloc();
    *(_QWORD *)(v10 + 16) = v0 + 16;
    swift_bridgeObjectRetain();
    v11 = sub_222AA6CE4((uint64_t)sub_222AA8E88, v10, v9);
    *(_QWORD *)(v0 + 280) = v11;
    swift_task_dealloc();
    if (*(_QWORD *)(v11 + 16))
      break;
    swift_release();
  }
  v2 = *(uint64_t (**)(uint64_t *))(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), (uint64_t)v2);
  v13 = sub_222A9AF94(v11);
  sub_222A8FB04();
  v1 = sub_222AAD8F8();
  v14 = *(_QWORD *)(v13 + 16);
  if (!v14)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v26 = v2;
  v15 = 0;
  v16 = v13 + 32;
  do
  {
    v18 = v1 + 56;
    while (1)
    {
      v19 = *(_QWORD *)(v16 + 8 * v15++);
      sub_222AADB80();
      sub_222AADBA4();
      v20 = sub_222AADBB0();
      v21 = -1 << *(_BYTE *)(v1 + 32);
      v22 = v20 & ~v21;
      if (((*(_QWORD *)(v18 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
        break;
      v23 = *(_QWORD *)(v1 + 48);
      if (*(_QWORD *)(v23 + 8 * v22) != v19)
      {
        v24 = ~v21;
        do
        {
          v22 = (v22 + 1) & v24;
          if (((*(_QWORD *)(v18 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            goto LABEL_10;
        }
        while (*(_QWORD *)(v23 + 8 * v22) != v19);
      }
      if (v15 == v14)
        goto LABEL_19;
    }
LABEL_10:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_222AA5CC8(v19, v22, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  while (v15 != v14);
LABEL_19:
  swift_bridgeObjectRelease();
  v2 = v26;
LABEL_22:
  *(_QWORD *)(v0 + 288) = v1;
  v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t))(**(int **)(v4 + 32)
                                                                                             + *(_QWORD *)(v4 + 32));
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v25;
  *v25 = v0;
  v25[1] = sub_222A9D9CC;
  return v27(v1, 1, v2, v4);
}

uint64_t sub_222A9DD30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t *);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t *);
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t);

  v35 = *(void **)(v0 + 304);
  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 224);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 176));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 112) = type metadata accessor for StorefrontAppStateController();
  *(_QWORD *)(v0 + 88) = v2;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 88, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C76A0);
  *(_QWORD *)(v0 + 120) = v1;
  *(_QWORD *)(v0 + 144) = v3;
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 120, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v4 = *(_QWORD *)(v0 + 40);
  v5 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v4);
  *(_QWORD *)(v0 + 80) = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, v5, v4);
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 56, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 176) = v8;
  v9 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 152));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v9, v7, v8);
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 152, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();

  v10 = 0;
  v11 = sub_222AA8E88;
  while (1)
  {
    do
    {
      v12 = *(_QWORD *)(v0 + 264);
      v13 = *(_QWORD *)(v0 + 272) + 1;
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      if (v13 == v12)
      {
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v14 = *(_QWORD *)(v0 + 272) + 1;
      *(_QWORD *)(v0 + 272) = v14;
      v15 = *(_QWORD *)(v0 + 256);
      if (v14 >= *(_QWORD *)(v15 + 16))
      {
        __break(1u);
        goto LABEL_21;
      }
      sub_222A723C0(v15 + 40 * v14 + 32, v0 + 16);
      v16 = *(_QWORD *)(v0 + 40);
      v17 = *(_QWORD *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v16);
    }
    while (((*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17) & 1) == 0);
    v18 = *(_QWORD *)(v0 + 232);
    v19 = swift_task_alloc();
    *(_QWORD *)(v19 + 16) = v0 + 16;
    swift_bridgeObjectRetain();
    v20 = sub_222AA6CE4((uint64_t)sub_222AA8E88, v19, v18);
    *(_QWORD *)(v0 + 280) = v20;
    swift_task_dealloc();
    if (*(_QWORD *)(v20 + 16))
      break;
    swift_release();
  }
  v11 = *(uint64_t (**)(uint64_t *))(v0 + 40);
  v13 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), (uint64_t)v11);
  v22 = sub_222A9AF94(v20);
  sub_222A8FB04();
  v10 = sub_222AAD8F8();
  v23 = *(_QWORD *)(v22 + 16);
  if (!v23)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v36 = v13;
  v37 = v11;
  v24 = 0;
  v25 = v22 + 32;
  do
  {
    v27 = v10 + 56;
    while (1)
    {
      v28 = *(_QWORD *)(v25 + 8 * v24++);
      sub_222AADB80();
      sub_222AADBA4();
      v29 = sub_222AADBB0();
      v30 = -1 << *(_BYTE *)(v10 + 32);
      v31 = v29 & ~v30;
      if (((*(_QWORD *)(v27 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
        break;
      v32 = *(_QWORD *)(v10 + 48);
      if (*(_QWORD *)(v32 + 8 * v31) != v28)
      {
        v33 = ~v30;
        do
        {
          v31 = (v31 + 1) & v33;
          if (((*(_QWORD *)(v27 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
            goto LABEL_10;
        }
        while (*(_QWORD *)(v32 + 8 * v31) != v28);
      }
      if (v24 == v23)
        goto LABEL_19;
    }
LABEL_10:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_222AA5CC8(v28, v31, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  while (v24 != v23);
LABEL_19:
  swift_bridgeObjectRelease();
  v13 = v36;
  v11 = v37;
LABEL_22:
  *(_QWORD *)(v0 + 288) = v10;
  v38 = (uint64_t (*)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t))(**(int **)(v13 + 32)
                                                                                             + *(_QWORD *)(v13 + 32));
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 296) = v34;
  *v34 = v0;
  v34[1] = sub_222A9D9CC;
  return v38(v10, 1, v11, v13);
}

void StorefrontAppStateController.state(forApp:initialState:applying:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, (uint64_t (*)(void))sub_222AA82C4);
  os_unfair_lock_unlock(v1);
}

void sub_222A9E324(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
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
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  int v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;

  v35 = a5;
  v36 = a1;
  v34 = a4;
  v37 = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for State();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v31 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v31 - v19;
  swift_beginAccess();
  v21 = *(_QWORD *)(a2 + 32);
  if (!*(_QWORD *)(v21 + 16) || (v22 = sub_222A8B200(a3), (v23 & 1) == 0))
  {
    swift_endAccess();
    v28 = 1;
LABEL_6:
    v30 = v36;
    v29 = v37;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v28, 1, v11);
    sub_222A78EE0(v35, (uint64_t)v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      sub_222A7A688((uint64_t)v18, (uint64_t)v20);
      sub_222A7DCD0((uint64_t)v10, &qword_2540C7E30);
      if ((*v30 & 2) == 0)
        goto LABEL_13;
    }
    else
    {
      sub_222A759F4((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A7A688((uint64_t)v10, (uint64_t)v20);
      if ((*v30 & 2) == 0)
        goto LABEL_13;
    }
    sub_222A78EE0((uint64_t)v20, (uint64_t)v15);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
LABEL_14:
      sub_222A759F4((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for State);
      return;
    }
    sub_222A759F4((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for State);
LABEL_13:
    sub_222A78EE0((uint64_t)v20, v29);
    goto LABEL_14;
  }
  v24 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
  swift_endAccess();
  v33 = &v31;
  v25 = *(_QWORD *)(v24 + 32);
  v32 = (uint64_t *)(v25 + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v25 + 24));
  v26 = v38;
  sub_222A7E478(v32, v34 & 1, (uint64_t)v10);
  v38 = v26;
  v27 = (os_unfair_lock_s *)(v25 + 24);
  if (!v26)
  {
    os_unfair_lock_unlock(v27);
    swift_release();
    swift_release();
    v28 = 0;
    goto LABEL_6;
  }
  os_unfair_lock_unlock(v27);
  __break(1u);
}

void StorefrontAppStateController.prospectiveState(forApp:applying:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_unfair_lock_s *v46;
  os_unfair_lock_s *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  os_unfair_lock_s *v51;
  os_unfair_lock_s *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  __int128 v73[2];
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v65 = (uint64_t *)((char *)&v54 - v11);
  v70 = type metadata accessor for State();
  v12 = *(_QWORD *)(v70 - 8);
  v13 = MEMORY[0x24BDAC7A8](v70);
  v57 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v55 = (uint64_t)&v54 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v69 = (uint64_t)&v54 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v68 = (uint64_t)&v54 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v56 = (uint64_t)&v54 - v21;
  v72 = *a1;
  v71 = *((unsigned __int8 *)a1 + 8);
  v64 = *a2;
  v60 = a2[1];
  v61 = *((unsigned __int8 *)a2 + 16);
  v59 = a2[3];
  v63 = a2[4];
  v58 = a2[5];
  v62 = a2[6];
  v66 = v3;
  v22 = *(_QWORD *)(v3 + 16);
  v23 = MEMORY[0x24BEE4AF8];
  v74 = MEMORY[0x24BEE4AF8];
  v24 = *(_QWORD *)(v22 + 16);
  swift_bridgeObjectRetain();
  v67 = a3;
  if (!v24)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    v32 = *(_QWORD *)(v23 + 16);
    v33 = v66;
    if (v32)
    {
      v34 = v23 + 32;
      swift_retain();
      v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        sub_222A723C0(v34, (uint64_t)&v75);
        v36 = v77;
        v37 = v78;
        __swift_project_boxed_opaque_existential_1(&v75, v77);
        *(_QWORD *)&v73[0] = v72;
        (*(void (**)(__int128 *, uint64_t, unint64_t))(v37 + 48))(v73, v36, v37);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v70) == 1)
        {
          sub_222A7DCD0((uint64_t)v10, &qword_2540C7E30);
        }
        else
        {
          v38 = v68;
          sub_222A7A688((uint64_t)v10, v68);
          sub_222A7A688(v38, v69);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v35 = (_QWORD *)sub_222AA4E5C(0, v35[2] + 1, 1, v35);
          v40 = v35[2];
          v39 = v35[3];
          if (v40 >= v39 >> 1)
            v35 = (_QWORD *)sub_222AA4E5C(v39 > 1, v40 + 1, 1, v35);
          v35[2] = v40 + 1;
          sub_222A7A688(v69, (uint64_t)v35+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v40);
        }
        v34 += 40;
        --v32;
      }
      while (v32);
      swift_release_n();
      a3 = v67;
    }
    else
    {
      swift_release();
      v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v41 = v64;
    *(_QWORD *)&v75 = v64;
    *((_QWORD *)&v75 + 1) = v60;
    v76 = v61;
    v77 = v59;
    v78 = v63;
    v79 = v58;
    v80 = v62;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42 = v65;
    sub_222A9ECD4((uint64_t)v35, (uint64_t *)&v75, v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(v42, 1, v70) == 1)
    {
      sub_222A7DCD0((uint64_t)v42, &qword_2540C7E30);
    }
    else
    {
      v43 = v56;
      v44 = sub_222A7A688((uint64_t)v42, v56);
      MEMORY[0x24BDAC7A8](v44);
      v45 = v72;
      *(&v54 - 4) = v33;
      *(&v54 - 3) = v45;
      *((_BYTE *)&v54 - 16) = v71;
      v47 = v46 + 4;
      *(&v54 - 1) = v43;
      os_unfair_lock_lock(v46 + 4);
      sub_222AA8D50(&v75);
      v48 = v75;
      os_unfair_lock_unlock(v47);
      if ((v48 & 1) != 0)
      {
        if ((v41 & 2) != 0)
        {
          v49 = v55;
          sub_222A78EE0(v43, v55);
          if (swift_getEnumCaseMultiPayload() == 3)
          {
            swift_bridgeObjectRelease();
            swift_storeEnumTagMultiPayload();
LABEL_33:
            sub_222A759F4(v43, (uint64_t (*)(_QWORD))type metadata accessor for State);
            return;
          }
          sub_222A759F4(v49, (uint64_t (*)(_QWORD))type metadata accessor for State);
        }
        sub_222A78EE0(v43, a3);
        goto LABEL_33;
      }
      sub_222A759F4(v43, (uint64_t (*)(_QWORD))type metadata accessor for State);
    }
    v43 = (uint64_t)v57;
    v50 = swift_storeEnumTagMultiPayload();
    v75 = 0uLL;
    LOBYTE(v76) = 1;
    v77 = 0;
    v78 = 0xE000000000000000;
    v79 = 0;
    v80 = 0xE000000000000000;
    MEMORY[0x24BDAC7A8](v50);
    *(&v54 - 6) = (uint64_t)&v75;
    *(&v54 - 5) = v33;
    *(&v54 - 4) = v72;
    *((_BYTE *)&v54 - 24) = v71;
    v52 = v51 + 4;
    *(&v54 - 2) = v43;
    os_unfair_lock_lock(v51 + 4);
    sub_222A8F708(v53, (uint64_t (*)(void))sub_222AA82C4);
    os_unfair_lock_unlock(v52);
    goto LABEL_33;
  }
  v25 = 0;
  v26 = (os_unfair_lock_s *)(v22 + 32);
  v27 = MEMORY[0x24BEE4AF8];
  while (v25 < *(_QWORD *)(v22 + 16))
  {
    sub_222A723C0((uint64_t)v26, (uint64_t)&v75);
    v29 = v77;
    v28 = v78;
    __swift_project_boxed_opaque_existential_1(&v75, v77);
    *(_QWORD *)&v73[0] = v72;
    BYTE8(v73[0]) = v71;
    if (((*(uint64_t (**)(__int128 *, uint64_t, unint64_t))(v28 + 56))(v73, v29, v28) & 1) != 0)
    {
      sub_222A80690(&v75, (uint64_t)v73);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_222AA514C(0, *(_QWORD *)(v27 + 16) + 1, 1);
      v27 = v74;
      v31 = *(_QWORD *)(v74 + 16);
      v30 = *(_QWORD *)(v74 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_222AA514C((_QWORD *)(v30 > 1), v31 + 1, 1);
        v27 = v74;
      }
      *(_QWORD *)(v27 + 16) = v31 + 1;
      sub_222A80690(v73, v27 + 40 * v31 + 32);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v75);
    }
    ++v25;
    v26 += 10;
    if (v24 == v25)
    {
      v23 = v74;
      a3 = v67;
      goto LABEL_13;
    }
  }
  __break(1u);
  os_unfair_lock_unlock(v26);
  __break(1u);
}

uint64_t sub_222A9ECD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  char *v11;
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
  BOOL (*v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  BOOL (*v38)();
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - v10;
  v12 = *a2;
  v13 = a2[1];
  v15 = a2[2];
  v14 = a2[3];
  v16 = a2[4];
  v33 = a2[5];
  v17 = a2[6];
  sub_222A7BBAC(a1, (uint64_t)&v30 - v10);
  if (v16)
  {
    v18 = v17;
    v34 = a3;
    sub_222A89EBC((uint64_t)v11, (uint64_t)v9, &qword_2540C7E30);
    v19 = type metadata accessor for State();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1)
    {
      sub_222A7DCD0((uint64_t)v9, &qword_2540C7E30);
    }
    else if (swift_getEnumCaseMultiPayload() == 1)
    {
      if ((*v9 & 1) == 0 && (v12 & 4) == 0)
      {
        v31 = v13;
        v32 = v12;
        v37 = v12;
        v38 = (BOOL (*)())v13;
        v30 = v15;
        LOBYTE(v39) = v15 & 1;
        v40 = v14;
        v41 = v16;
        v42 = v33;
        v43 = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v37 = sub_222A78C54();
        v38 = v23;
        v35 = 38;
        v36 = 0xE100000000000000;
        sub_222A888A0();
        v24 = sub_222AAD9A0();
        swift_bridgeObjectRelease();
        v37 = v24;
        v38 = sub_222A78DE0;
        v39 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255768B58);
        sub_222A888E4();
        v25 = sub_222AAD79C();
        v27 = v26;
        swift_bridgeObjectRelease();
        sub_222AA8E58(v32, v31, v30, v14, v16);
        sub_222A7DCD0((uint64_t)v11, &qword_2540C7E30);
        v28 = v34;
        *v34 = v25;
        v28[1] = v27;
        swift_storeEnumTagMultiPayload();
        return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v28, 0, 1, v19);
      }
    }
    else
    {
      sub_222A759F4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for State);
    }
    v21 = (uint64_t)v11;
    v22 = (uint64_t)v34;
  }
  else
  {
    v21 = (uint64_t)v11;
    v22 = (uint64_t)a3;
  }
  return sub_222A80648(v21, v22);
}

uint64_t StorefrontAppStateController.canTransitionState(forApp:to:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  unsigned __int8 v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA8D50(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

void sub_222A9EFE0(uint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, _BYTE *a4@<X8>)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;

  v12 = a1;
  v8 = sub_222A9F0AC(&v12);
  v9 = v8[4];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
  sub_222A7EF70((uint64_t *)(v9 + 16), v8, a2 & 1, a3, &v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v10 = v11;
    swift_release();
    swift_release();
    *a4 = v10;
  }
}

_QWORD *sub_222A9F0AC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  _BYTE v19[40];

  v2 = v1;
  v4 = sub_222AAD748();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = *a1;
  v9 = (uint64_t *)(v1 + 32);
  swift_beginAccess();
  v10 = *(_QWORD *)(v1 + 32);
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_222A8B200(v8), (v12 & 1) != 0))
  {
    v13 = *(_QWORD **)(*(_QWORD *)(v10 + 56) + 8 * v11);
    swift_endAccess();
    swift_retain();
  }
  else
  {
    swift_endAccess();
    sub_222A723C0(v2 + 48, (uint64_t)v19);
    if (qword_2540C8108 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v4, (uint64_t)qword_2540C8E78);
    type metadata accessor for AppStateMachine();
    v15 = (_QWORD *)swift_allocObject();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    v13 = sub_222AA8308(v8, (uint64_t)v19, (uint64_t)v7, v15);
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v9;
    *v9 = 0x8000000000000000;
    sub_222AACE58((uint64_t)v13, v8, isUniquelyReferenced_nonNull_native);
    *v9 = v18;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  return v13;
}

uint64_t StorefrontAppStateController.transitionState(forApp:to:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  unsigned __int8 v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA8408(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_222A9F2CC(uint64_t a1, ValueMetadata *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  v19 = *(_QWORD *)a1;
  v10 = sub_222A9F0AC(&v19);
  v11 = v10[4];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
  sub_222A7E5F0((_QWORD *)(v11 + 16), v9, a2, v10, &v19);
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
  v12 = v19;
  swift_release();
  swift_release();
  if ((_DWORD)v12 == 1)
  {
    v13 = *(void **)(v2 + 136);
    v19 = v8;
    v20 = v9;
    v14 = v13;
    v15 = objc_msgSend(v14, sel_containsObject_, sub_222AADAFC());

    swift_unknownObjectRelease();
    if (v15)
    {
      v16 = (uint64_t)&v7[*(int *)(v5 + 48)];
      *(_QWORD *)v7 = v8;
      v7[8] = v9;
      sub_222A78EE0((uint64_t)a2, v16);
      sub_222AAD538();
      sub_222A7DCD0((uint64_t)v7, &qword_2540C7BD0);
    }
  }
  return v12;
}

uint64_t StorefrontAppStateController.onStateChange.getter()
{
  return swift_retain();
}

uint64_t StorefrontAppStateController.postsChanges(forApp:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  unsigned __int8 v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA82D8(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_222A9F4CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, unsigned __int8 *a4@<X8>)
{
  id v5;
  unsigned __int8 v6;
  uint64_t result;
  uint64_t v9;

  LOBYTE(v9) = a3 & 1;
  v5 = *(id *)(a1 + 136);
  v6 = objc_msgSend(v5, sel_containsObject_, sub_222AADAFC(), a2, v9);

  result = swift_unknownObjectRelease();
  *a4 = v6;
  return result;
}

void StorefrontAppStateController.setPostsChanges(_:forApp:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, sub_222AA82F4);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_222A9F5C4(char a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v4;
  id v5;
  uint64_t v6;
  char **v7;
  id v8;
  uint64_t v11;

  v4 = *(void **)(a2 + 136);
  LOBYTE(v11) = a4 & 1;
  if ((a1 & 1) != 0)
  {
    v5 = v4;
    v6 = sub_222AADAFC();
    v7 = &selRef_addObject_;
  }
  else
  {
    v8 = v4;
    v6 = sub_222AADAFC();
    v7 = &selRef_removeObject_;
  }
  objc_msgSend(v4, *v7, v6, a3, v11);

  return swift_unknownObjectRelease();
}

void StorefrontAppStateController.setWaiting(forApp:installationType:)(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  os_unfair_lock_s *v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  os_unfair_lock_s *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  os_unfair_lock_s *v42;
  int v43;
  int v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  __int128 v50[2];
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v5 = type metadata accessor for State();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v38 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (uint64_t)&v38 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  v16 = *a1;
  LODWORD(a1) = *((unsigned __int8 *)a1 + 8);
  v17 = *a2;
  swift_storeEnumTagMultiPayload();
  v55[0] = 0;
  v55[1] = 0;
  v56 = 1;
  v57 = 0;
  v58 = 0xE000000000000000;
  v59 = 0;
  v60 = 0xE000000000000000;
  v18 = *(os_unfair_lock_s **)(v2 + 192);
  v45 = v55;
  v46 = v2;
  v47 = v16;
  v44 = (int)a1;
  v48 = (char)a1;
  v19 = v18 + 4;
  v49 = v13;
  os_unfair_lock_lock(v18 + 4);
  sub_222A8F708(v20, (uint64_t (*)(void))sub_222AA82C4);
  v42 = v19;
  os_unfair_lock_unlock(v19);
  sub_222A759F4(v13, (uint64_t (*)(_QWORD))type metadata accessor for State);
  v43 = v17;
  *v10 = v17;
  v40 = v5;
  swift_storeEnumTagMultiPayload();
  _s8AppState0B0O2eeoiySbAC_ACtFZ_0((uint64_t)v15, (uint64_t)v10);
  LOBYTE(v13) = v21;
  sub_222A759F4((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for State);
  sub_222A759F4((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for State);
  if ((v13 & 1) == 0)
  {
    v39 = v2;
    v22 = *(_QWORD *)(v2 + 16);
    v23 = MEMORY[0x24BEE4AF8];
    v54 = MEMORY[0x24BEE4AF8];
    v24 = *(os_unfair_lock_s **)(v22 + 16);
    swift_bridgeObjectRetain();
    v38 = 0;
    if (v24)
    {
      v25 = 0;
      v26 = v22 + 32;
      v27 = MEMORY[0x24BEE4AF8];
      while ((unint64_t)v25 < *(_QWORD *)(v22 + 16))
      {
        sub_222A723C0(v26, (uint64_t)&v51);
        v29 = v52;
        v28 = v53;
        __swift_project_boxed_opaque_existential_1(&v51, v52);
        *(_QWORD *)&v50[0] = v16;
        BYTE8(v50[0]) = v44;
        if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v28 + 56))(v50, v29, v28) & 1) != 0)
        {
          sub_222A80690(&v51, (uint64_t)v50);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_222AA514C(0, *(_QWORD *)(v27 + 16) + 1, 1);
          v27 = v54;
          v31 = *(_QWORD *)(v54 + 16);
          v30 = *(_QWORD *)(v54 + 24);
          if (v31 >= v30 >> 1)
          {
            sub_222AA514C((_QWORD *)(v30 > 1), v31 + 1, 1);
            v27 = v54;
          }
          *(_QWORD *)(v27 + 16) = v31 + 1;
          sub_222A80690(v50, v27 + 40 * v31 + 32);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
        }
        v25 = (os_unfair_lock_s *)((char *)v25 + 1);
        v26 += 40;
        if (v24 == v25)
        {
          v23 = v54;
          goto LABEL_14;
        }
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_14:
    v25 = v42;
    swift_bridgeObjectRelease();
    v32 = *(_QWORD *)(v23 + 16);
    v33 = v41;
    if (v32)
    {
      v34 = v23 + 32;
      while (1)
      {
        sub_222A723C0(v34, (uint64_t)&v51);
        v35 = v52;
        v36 = v53;
        __swift_project_boxed_opaque_existential_1(&v51, v52);
        *(_QWORD *)&v50[0] = v16;
        LOBYTE(v54) = v43;
        if (((*(uint64_t (**)(__int128 *, uint64_t *, uint64_t, uint64_t))(v36 + 64))(v50, &v54, v35, v36) & 1) != 0)
          break;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
        v34 += 40;
        if (!--v32)
          goto LABEL_18;
      }
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
    }
    else
    {
LABEL_18:
      swift_release();
    }
    *v33 = v43;
    v37 = swift_storeEnumTagMultiPayload();
    MEMORY[0x24BDAC7A8](v37);
    *(&v38 - 4) = v39;
    *(&v38 - 3) = v16;
    *((_BYTE *)&v38 - 16) = v44;
    *(&v38 - 1) = (uint64_t)v33;
    os_unfair_lock_lock(v25);
    sub_222AA8408(&v51);
    if (v38)
    {
LABEL_24:
      os_unfair_lock_unlock(v25);
      __break(1u);
      return;
    }
    os_unfair_lock_unlock(v25);
    sub_222A759F4((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for State);
  }
}

uint64_t StorefrontAppStateController.clearWaiting(forApp:refreshState:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  __int128 v22[2];
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)a1;
  v5 = *(_BYTE *)(a1 + 8);
  v6 = *(_QWORD *)(v2 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  v26 = MEMORY[0x24BEE4AF8];
  v8 = *(_QWORD *)(v6 + 16);
  result = swift_bridgeObjectRetain();
  v21 = a2;
  if (v8)
  {
    v10 = 0;
    v11 = v6 + 32;
    v12 = MEMORY[0x24BEE4AF8];
    while (v10 < *(_QWORD *)(v6 + 16))
    {
      sub_222A723C0(v11, (uint64_t)&v23);
      v13 = v24;
      v14 = v25;
      __swift_project_boxed_opaque_existential_1(&v23, v24);
      *(_QWORD *)&v22[0] = v4;
      BYTE8(v22[0]) = v5;
      if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v14 + 56))(v22, v13, v14) & 1) != 0)
      {
        sub_222A80690(&v23, (uint64_t)v22);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_222AA514C(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v26;
        v16 = *(_QWORD *)(v26 + 16);
        v15 = *(_QWORD *)(v26 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_222AA514C((_QWORD *)(v15 > 1), v16 + 1, 1);
          v12 = v26;
        }
        *(_QWORD *)(v12 + 16) = v16 + 1;
        result = sub_222A80690(v22, v12 + 40 * v16 + 32);
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
      }
      ++v10;
      v11 += 40;
      if (v8 == v10)
      {
        v7 = v26;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v7 + 16);
    if (v17)
    {
      v18 = v7 + 32;
      do
      {
        sub_222A723C0(v18, (uint64_t)&v23);
        v19 = v24;
        v20 = v25;
        __swift_project_boxed_opaque_existential_1(&v23, v24);
        *(_QWORD *)&v22[0] = v4;
        (*(void (**)(__int128 *, uint64_t, uint64_t))(v20 + 72))(v22, v19, v20);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
        v18 += 40;
        --v17;
      }
      while (v17);
    }
    swift_release();
    if ((v21 & 1) != 0)
      sub_222A9FCC0(v4);
    return 1;
  }
  return result;
}

uint64_t sub_222A9FCC0(uint64_t a1)
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
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_222AAD508();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_222AAD520();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *(_QWORD *)(v2 + 200);
  v12 = swift_allocObject();
  swift_weakInit();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = a1;
  aBlock[4] = sub_222AA8E18;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_222A9B720;
  aBlock[3] = &block_descriptor_4;
  v14 = _Block_copy(aBlock);
  swift_retain();
  sub_222AAD514();
  v18 = MEMORY[0x24BEE4AF8];
  sub_222A71270(&qword_2540C80D0, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8138);
  sub_222A88520(&qword_2540C8140, &qword_2540C8138, MEMORY[0x24BEE12C8]);
  sub_222AAD9C4();
  MEMORY[0x227677978](0, v11, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return swift_release();
}

uint64_t StorefrontAppStateController.refreshUpdateRegistry(forApp:with:)(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  *(_QWORD *)(v3 + 280) = v2;
  *(_QWORD *)(v3 + 288) = *v2;
  *(_QWORD *)(v3 + 296) = type metadata accessor for State();
  *(_QWORD *)(v3 + 304) = swift_task_alloc();
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  sub_222AAD598();
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  v6 = swift_task_alloc();
  v7 = *a1;
  *(_QWORD *)(v3 + 336) = v6;
  *(_QWORD *)(v3 + 344) = v7;
  *(_BYTE *)(v3 + 396) = *((_BYTE *)a1 + 8);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v8;
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(a2 + 48);
  return swift_task_switch();
}

uint64_t sub_222A9FFCC()
{
  uint64_t v0;
  __int128 *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];

  v1 = (__int128 *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 396);
  v3 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 280);
  v5 = *(os_unfair_lock_s **)(v4 + 192);
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v3;
  *(_BYTE *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v0 + 16;
  v7 = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = sub_222AA8454;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = v5 + 4;
  os_unfair_lock_lock(v5 + 4);
  sub_222A8F708(v9, *(uint64_t (**)(void))(v7 + 16));
  os_unfair_lock_unlock(v5 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_222AA8474(v0 + 16);
  v10 = sub_222A9151C();
  LOBYTE(v6) = v11;
  sub_222AA84A8(v0 + 16);
  if ((v6 & 1) == 0)
  {
    v12 = *(_QWORD *)(v0 + 344);
    v13 = *(_QWORD **)(v0 + 280);
    v14 = v13[14];
    v15 = v13[15];
    v38 = v13;
    v39 = v13 + 11;
    __swift_project_boxed_opaque_existential_1(v13 + 11, v14);
    v47[0] = v12;
    (*(void (**)(__int128 *__return_ptr, _QWORD *, uint64_t, uint64_t))(v15 + 8))(&v43, v47, v14, v15);
    if (!(_QWORD)v44 || (v16 = v43, swift_bridgeObjectRelease(), v16 < v10))
    {
      v37 = v10;
      v41 = *(_QWORD *)(v0 + 344);
      v17 = *(_QWORD *)(v0 + 280);
      v40 = *(_QWORD *)(v0 + 288);
      v42 = *(_QWORD *)(v0 + 312);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v17 + 152), *(_QWORD *)(v17 + 176));
      *(_QWORD *)(v0 + 352) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
      v18 = *(_QWORD *)(sub_222AAD5B0() - 8);
      *(_QWORD *)(v0 + 360) = *(_QWORD *)(v18 + 72);
      *(_DWORD *)(v0 + 392) = *(_DWORD *)(v18 + 80);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
      sub_222AAD58C();
      sub_222AAD580();
      *(_QWORD *)(v0 + 176) = v40;
      *(_QWORD *)(v0 + 152) = v17;
      swift_retain();
      sub_222AAD55C();
      sub_222A7DCD0(v0 + 152, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      sub_222AAD5A4();
      sub_222AAD58C();
      sub_222AAD580();
      *(_QWORD *)(v0 + 144) = &type metadata for App;
      *(_QWORD *)(v0 + 120) = v41;
      *(_BYTE *)(v0 + 128) = v2;
      sub_222AAD55C();
      sub_222A7DCD0(v0 + 120, (uint64_t *)&unk_2540C8268);
      sub_222AAD580();
      sub_222AAD5A4();
      sub_222AAD688();
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
      v19 = swift_task_alloc();
      *(_QWORD *)(v19 + 16) = v1;
      *(_QWORD *)(v19 + 24) = v17;
      *(_QWORD *)(v19 + 32) = v41;
      *(_BYTE *)(v19 + 40) = v2;
      *(_QWORD *)(v19 + 48) = v42;
      v20 = swift_task_alloc();
      *(_QWORD *)(v20 + 16) = sub_222AA82C4;
      *(_QWORD *)(v20 + 24) = v19;
      os_unfair_lock_lock(v8);
      sub_222A8F708(v21, *(uint64_t (**)(void))(v20 + 16));
      os_unfair_lock_unlock(v8);
      swift_task_dealloc();
      v22 = (uint64_t *)(v0 + 320);
      v24 = *(_QWORD *)(v0 + 312);
      v23 = *(_QWORD *)(v0 + 320);
      v25 = *(_QWORD *)(v0 + 304);
      swift_task_dealloc();
      sub_222A759F4(v24, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A78EE0(v23, v25);
      if (swift_getEnumCaseMultiPayload() == 5)
      {
        v26 = *(_QWORD *)(*(_QWORD *)(v0 + 304) + 8);
        if (v26 && v26 < v37)
        {
          v27 = *(_QWORD *)(v0 + 344);
          v28 = v38[14];
          v29 = v38[15];
          __swift_project_boxed_opaque_existential_1(v39, v28);
          v30 = *(_OWORD *)(v0 + 32);
          v43 = *v1;
          v44 = v30;
          v45 = *(_OWORD *)(v0 + 48);
          v46 = *(_QWORD *)(v0 + 64);
          v31 = sub_222A78C54();
          *(_QWORD *)&v43 = v37;
          *((_QWORD *)&v43 + 1) = v31;
          *(_QWORD *)&v44 = v32;
          v47[0] = v27;
          (*(void (**)(__int128 *, _QWORD *, uint64_t, uint64_t))(v29 + 16))(&v43, v47, v28, v29);
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_255768E28);
          inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_222AAE880;
          *(_QWORD *)(inited + 32) = v27;
          *(_BYTE *)(inited + 40) = v2;
          v34 = sub_222AA85F4(inited);
          *(_QWORD *)(v0 + 368) = v34;
          swift_setDeallocating();
          v35 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 376) = v35;
          *v35 = v0;
          v35[1] = sub_222AA04FC;
          return StorefrontAppStateController.reloadState(forApps:synchronizing:)(v34, 1);
        }
      }
      else
      {
        sub_222A759F4(*v22, (uint64_t (*)(_QWORD))type metadata accessor for State);
        v22 = (uint64_t *)(v0 + 304);
      }
      sub_222A759F4(*v22, (uint64_t (*)(_QWORD))type metadata accessor for State);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222AA04FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_222AA0568()
{
  uint64_t v0;

  sub_222A759F4(*(_QWORD *)(v0 + 320), (uint64_t (*)(_QWORD))type metadata accessor for State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222AA05D8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;

  v7 = *(void **)(v0 + 384);
  v1 = *(_BYTE *)(v0 + 396);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 280);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 152), *(_QWORD *)(v3 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 208) = &type metadata for App;
  *(_QWORD *)(v0 + 184) = v2;
  *(_BYTE *)(v0 + 192) = v1;
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 184, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v4 = sub_222AADB38();
  *(_QWORD *)(v0 + 240) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 216) = v4;
  *(_QWORD *)(v0 + 224) = v5;
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 216, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();

  sub_222A759F4(*(_QWORD *)(v0 + 320), (uint64_t (*)(_QWORD))type metadata accessor for State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t StorefrontAppStateController.isLocal(app:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int EnumCaseMultiPayload;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33[2];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = type metadata accessor for State();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v29 = (uint64_t)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *a1;
  v8 = *((_BYTE *)a1 + 8);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  v37 = MEMORY[0x24BEE4AF8];
  v11 = *(_QWORD *)(v9 + 16);
  result = swift_bridgeObjectRetain();
  if (v11)
  {
    v13 = 0;
    v14 = v9 + 32;
    v15 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v13 >= *(_QWORD *)(v9 + 16))
      {
        __break(1u);
        return result;
      }
      sub_222A723C0(v14, (uint64_t)&v34);
      v16 = v35;
      v17 = v36;
      __swift_project_boxed_opaque_existential_1(&v34, v35);
      *(_QWORD *)&v33[0] = v32;
      BYTE8(v33[0]) = v8;
      if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v17 + 56))(v33, v16, v17) & 1) != 0)
      {
        sub_222A80690(&v34, (uint64_t)v33);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_222AA514C(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v37;
        v19 = *(_QWORD *)(v37 + 16);
        v18 = *(_QWORD *)(v37 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_222AA514C((_QWORD *)(v18 > 1), v19 + 1, 1);
          v15 = v37;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_222A80690(v33, v15 + 40 * v19 + 32);
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
      }
      ++v13;
      v14 += 40;
    }
    while (v11 != v13);
    v10 = v37;
  }
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(v10 + 16);
  if (!v20)
  {
LABEL_25:
    swift_release();
    return 0;
  }
  v21 = v10 + 32;
  swift_retain();
  v22 = 1;
  while (1)
  {
    sub_222A723C0(v21, (uint64_t)&v34);
    v23 = v35;
    v24 = v36;
    __swift_project_boxed_opaque_existential_1(&v34, v35);
    *(_QWORD *)&v33[0] = v32;
    (*(void (**)(__int128 *, uint64_t, uint64_t))(v24 + 48))(v33, v23, v24);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v7, 1, v31) == 1)
    {
      sub_222A7DCD0((uint64_t)v7, &qword_2540C7E30);
      goto LABEL_21;
    }
    v25 = v29;
    sub_222A78EE0((uint64_t)v7, v29);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 7 || EnumCaseMultiPayload == 5)
      goto LABEL_28;
    if (EnumCaseMultiPayload == 2)
      break;
    sub_222A759F4(v25, (uint64_t (*)(_QWORD))type metadata accessor for State);
    sub_222A759F4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for State);
LABEL_21:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    if (v20 == v22)
    {
      swift_release_n();
      return 0;
    }
    v21 += 40;
    if (__OFADD__(v22++, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
  }
  sub_222A759F4(v25, (uint64_t (*)(_QWORD))type metadata accessor for State);
LABEL_28:
  sub_222A759F4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for State);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
  swift_release_n();
  return 1;
}

uint64_t StorefrontAppStateController.isRedownloadable(app:includingPreorders:)(uint64_t *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  int EnumCaseMultiPayload;
  _BYTE v29[4];
  int v30;
  _BYTE *v31;
  uint64_t v32;
  __int128 v33[2];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v30 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v31 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v29[-v7];
  v32 = *a1;
  v9 = *((_BYTE *)a1 + 8);
  v10 = *(_QWORD *)(v2 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  v37 = MEMORY[0x24BEE4AF8];
  v12 = *(_QWORD *)(v10 + 16);
  result = swift_bridgeObjectRetain();
  if (v12)
  {
    v14 = 0;
    v15 = v10 + 32;
    v16 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v14 >= *(_QWORD *)(v10 + 16))
      {
        __break(1u);
        return result;
      }
      sub_222A723C0(v15, (uint64_t)&v34);
      v17 = v35;
      v18 = v36;
      __swift_project_boxed_opaque_existential_1(&v34, v35);
      *(_QWORD *)&v33[0] = v32;
      BYTE8(v33[0]) = v9;
      if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v18 + 56))(v33, v17, v18) & 1) != 0)
      {
        sub_222A80690(&v34, (uint64_t)v33);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_222AA514C(0, *(_QWORD *)(v16 + 16) + 1, 1);
        v16 = v37;
        v20 = *(_QWORD *)(v37 + 16);
        v19 = *(_QWORD *)(v37 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_222AA514C((_QWORD *)(v19 > 1), v20 + 1, 1);
          v16 = v37;
        }
        *(_QWORD *)(v16 + 16) = v20 + 1;
        result = sub_222A80690(v33, v16 + 40 * v20 + 32);
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
      }
      ++v14;
      v15 += 40;
    }
    while (v12 != v14);
    v11 = v37;
  }
  v21 = v30;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(v11 + 16);
  if (!v22)
  {
    swift_release();
    return 0;
  }
  v23 = v11 + 32;
  swift_retain();
  while (1)
  {
    sub_222A723C0(v23, (uint64_t)&v34);
    v24 = v35;
    v25 = v36;
    __swift_project_boxed_opaque_existential_1(&v34, v35);
    *(_QWORD *)&v33[0] = v32;
    (*(void (**)(__int128 *, uint64_t, uint64_t))(v25 + 48))(v33, v24, v25);
    v26 = type metadata accessor for State();
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 48))(v8, 1, v26) == 1)
      goto LABEL_17;
    v27 = v31;
    sub_222A89EBC((uint64_t)v8, (uint64_t)v31, &qword_2540C7E30);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1)
      break;
    if (*v27 == 1 && (v21 & 1) != 0)
      goto LABEL_26;
LABEL_17:
    sub_222A7DCD0((uint64_t)v8, &qword_2540C7E30);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v23 += 40;
    if (!--v22)
    {
      swift_release_n();
      return 0;
    }
  }
  if (EnumCaseMultiPayload != 3)
  {
    sub_222A759F4((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for State);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_26:
  sub_222A7DCD0((uint64_t)v8, &qword_2540C7E30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
  swift_release_n();
  return 1;
}

uint64_t StorefrontAppStateController.purchaseHistoryIncludes(app:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int EnumCaseMultiPayload;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  __int128 v31[2];
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  v30 = *a1;
  v9 = *((_BYTE *)a1 + 8);
  v10 = *(_QWORD *)(v1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  v35 = MEMORY[0x24BEE4AF8];
  v12 = *(_QWORD *)(v10 + 16);
  result = swift_bridgeObjectRetain();
  v29 = v6;
  if (v12)
  {
    v14 = 0;
    v15 = v10 + 32;
    v16 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v14 >= *(_QWORD *)(v10 + 16))
      {
        __break(1u);
        return result;
      }
      sub_222A723C0(v15, (uint64_t)&v32);
      v17 = v33;
      v18 = v34;
      __swift_project_boxed_opaque_existential_1(&v32, v33);
      *(_QWORD *)&v31[0] = v30;
      BYTE8(v31[0]) = v9;
      if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v18 + 56))(v31, v17, v18) & 1) != 0)
      {
        sub_222A80690(&v32, (uint64_t)v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_222AA514C(0, *(_QWORD *)(v16 + 16) + 1, 1);
        v16 = v35;
        v20 = *(_QWORD *)(v35 + 16);
        v19 = *(_QWORD *)(v35 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_222AA514C((_QWORD *)(v19 > 1), v20 + 1, 1);
          v16 = v35;
        }
        *(_QWORD *)(v16 + 16) = v20 + 1;
        result = sub_222A80690(v31, v16 + 40 * v20 + 32);
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
      }
      ++v14;
      v15 += 40;
    }
    while (v12 != v14);
    v11 = v35;
  }
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(v11 + 16);
  if (!v21)
  {
    swift_release();
    return 0;
  }
  v22 = v11 + 32;
  swift_retain();
  v23 = v29;
  while (1)
  {
    sub_222A723C0(v22, (uint64_t)&v32);
    v24 = v33;
    v25 = v34;
    __swift_project_boxed_opaque_existential_1(&v32, v33);
    *(_QWORD *)&v31[0] = v30;
    (*(void (**)(__int128 *, uint64_t, uint64_t))(v25 + 48))(v31, v24, v25);
    v26 = type metadata accessor for State();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 48))(v8, 1, v26) == 1)
      goto LABEL_16;
    sub_222A89EBC((uint64_t)v8, (uint64_t)v23, &qword_2540C7E30);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1)
      break;
    if ((*v23 & 1) == 0)
      goto LABEL_24;
LABEL_16:
    sub_222A7DCD0((uint64_t)v8, &qword_2540C7E30);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
    v22 += 40;
    if (!--v21)
    {
      swift_release_n();
      return 0;
    }
  }
  if (EnumCaseMultiPayload != 3)
  {
    sub_222A759F4((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for State);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
LABEL_24:
  sub_222A7DCD0((uint64_t)v8, &qword_2540C7E30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
  swift_release_n();
  return 1;
}

uint64_t sub_222AA1194(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[31] = a4;
  v4[32] = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7660);
  v4[33] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C80F0);
  v4[34] = v5;
  v4[35] = *(_QWORD *)(v5 - 8);
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EC8);
  v4[41] = swift_task_alloc();
  sub_222AAD598();
  v4[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222AA1294()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  _QWORD *v20;

  v2 = *(_QWORD **)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 256);
  __swift_project_boxed_opaque_existential_1(v2 + 19, v2[22]);
  *(_QWORD *)(v0 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  v3 = *(_QWORD *)(sub_222AAD5B0() - 8);
  *(_QWORD *)(v0 + 352) = *(_QWORD *)(v3 + 72);
  *(_DWORD *)(v0 + 392) = *(_DWORD *)(v3 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  *(_QWORD *)(v0 + 208) = v2;
  *(_QWORD *)(v0 + 232) = v1;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0(v0 + 208, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD550();
  sub_222AAD688();
  swift_bridgeObjectRelease();
  type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver();
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 360) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81E8);
  v5 = swift_allocObject();
  v6 = MEMORY[0x24BEE4B08];
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v4 + 16) = v5;
  v7 = v2[2];
  *(_QWORD *)(v0 + 368) = v7;
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = (_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 280);
    v11 = v7 + 32;
    swift_bridgeObjectRetain();
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      sub_222A723C0(v11, (uint64_t)v9);
      v14 = *(_QWORD *)(v0 + 80);
      v13 = *(_QWORD *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1(v9, v14);
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v14, v13);
      *(_QWORD *)(v0 + 240) = v4;
      sub_222A71270(&qword_2540C7730, (uint64_t (*)(uint64_t))type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver, (uint64_t)&unk_222AB0448);
      sub_222AAD754();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = (_QWORD *)sub_222AA4FD0(0, v12[2] + 1, 1, v12);
      v16 = v12[2];
      v15 = v12[3];
      if (v16 >= v15 >> 1)
        v12 = (_QWORD *)sub_222AA4FD0(v15 > 1, v16 + 1, 1, v12);
      v17 = *(_QWORD *)(v0 + 312);
      v18 = *(_QWORD *)(v0 + 272);
      v12[2] = v16 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))((unint64_t)v12+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v16, v17, v18);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      v11 += 40;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v0 + 376) = v12;
  v19 = *(double *)(*(_QWORD *)(v0 + 248) + 144);
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 384) = v20;
  *v20 = v0;
  v20[1] = sub_222AA15EC;
  return sub_222A9C878((uint64_t)&unk_255768EE8, 0, v19);
}

uint64_t sub_222AA15EC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_222AA1640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_unfair_lock_s *v25;
  uint64_t v26;
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
  __int128 *v37;

  v34 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 368) + 16);
  result = swift_bridgeObjectRetain();
  v33 = v1;
  if (v1)
  {
    v3 = 0;
    v37 = (__int128 *)(v0 + 16);
    v35 = *(_QWORD *)(v0 + 376);
    v4 = result + 32;
    v5 = *(_QWORD *)(v0 + 280);
    v30 = v5;
    v31 = *(_QWORD *)(v0 + 320);
    while (v3 < *(_QWORD *)(*(_QWORD *)(v0 + 368) + 16))
    {
      result = sub_222A723C0(v4, (uint64_t)v37);
      v6 = *(_QWORD *)(v35 + 16);
      if (v3 == v6)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v5 + 56))(*(_QWORD *)(v0 + 264), 1, 1, *(_QWORD *)(v0 + 272));
LABEL_10:
        v20 = *(_QWORD *)(v0 + 264);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
        sub_222A7DCD0(v20, &qword_2540C7660);
        goto LABEL_11;
      }
      if (v3 >= v6)
        goto LABEL_13;
      v7 = *(_QWORD *)(v0 + 264);
      v8 = *(_QWORD *)(v0 + 272);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v0 + 376)+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v3, v8);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v8) == 1)
        goto LABEL_10;
      ++v3;
      v9 = *(__int128 **)(v0 + 328);
      v11 = *(_QWORD *)(v0 + 296);
      v10 = *(_QWORD *)(v0 + 304);
      v12 = *(_QWORD *)(v0 + 272);
      v36 = *(_QWORD *)(v0 + 288);
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
      v13(v10, *(_QWORD *)(v0 + 264), v12);
      v14 = (char *)v9 + *(int *)(v31 + 48);
      sub_222A80690(v37, (uint64_t)v9);
      v13((uint64_t)v14, v10, v12);
      sub_222A80690(v9, v0 + 96);
      v13(v11, (uint64_t)v14, v12);
      v15 = *(_QWORD *)(v0 + 120);
      v16 = *(_QWORD *)(v0 + 128);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v15);
      (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
      sub_222AAD760();
      v17 = *(void **)(v34 + 200);
      *(_QWORD *)(v0 + 160) = sub_222A7418C(0, (unint64_t *)&qword_2540C81A8);
      *(_QWORD *)(v0 + 168) = MEMORY[0x24BE5E508];
      *(_QWORD *)(v0 + 136) = v17;
      v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
      sub_222A88520(&qword_2540C8120, &qword_2540C8128, MEMORY[0x24BE5E498]);
      v5 = v30;
      sub_222AAD5C8();
      swift_release();
      v19 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v19(v36, v12);
      v19(v11, v12);
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      result = __swift_destroy_boxed_opaque_existential_1(v0 + 96);
      v4 += 40;
      if (v33 == v3)
        goto LABEL_11;
    }
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    v21 = *(_QWORD *)(v0 + 360);
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v21 + 16);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v22 + 24));
    v23 = *(_QWORD *)(v22 + 16);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 24));
    v24 = *(_QWORD *)(v0 + 248);
    swift_release();
    sub_222AA1EF4(v23);
    swift_bridgeObjectRelease();
    v25 = *(os_unfair_lock_s **)(v24 + 192);
    v26 = swift_task_alloc();
    *(_QWORD *)(v26 + 16) = v24;
    *(_QWORD *)(v26 + 24) = 1;
    v27 = swift_task_alloc();
    *(_QWORD *)(v27 + 16) = sub_222AA9550;
    *(_QWORD *)(v27 + 24) = v26;
    os_unfair_lock_lock(v25 + 4);
    sub_222A8F708(v28, *(uint64_t (**)(void))(v27 + 16));
    v29 = *(_QWORD *)(v0 + 248);
    v32 = *(_QWORD *)(v0 + 256);
    os_unfair_lock_unlock(v25 + 4);
    swift_task_dealloc();
    swift_task_dealloc();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v29 + 152), *(_QWORD *)(v29 + 176));
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
    sub_222AAD58C();
    sub_222AAD580();
    *(_QWORD *)(v0 + 200) = v32;
    *(_QWORD *)(v0 + 176) = v29;
    swift_retain();
    sub_222AAD55C();
    sub_222A7DCD0(v0 + 176, (uint64_t *)&unk_2540C8268);
    sub_222AAD580();
    sub_222AAD5A4();
    sub_222AAD550();
    sub_222AAD688();
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_222AA1B98(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_222AA1BB0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 24) + *(_QWORD *)(v3 + 24));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v4;
  *v4 = v0;
  v4[1] = sub_222A96FD4;
  return v6(v2, v3);
}

uint64_t sub_222AA1C28(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v3 = *v1;
  v15 = sub_222AAD4F0();
  v4 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v7);
  v20 = a1;
  __swift_project_boxed_opaque_existential_1(v1 + 19, v1[22]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v19 = v3;
  v18[0] = v1;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v18, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v19 = MEMORY[0x24BEE1768];
  v18[0] = 1;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v18, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD694();
  swift_bridgeObjectRelease();
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  v8 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  v9 = (os_unfair_lock_s *)v1[24];
  v16 = v1;
  v17 = &v20;
  v10 = v9 + 4;
  os_unfair_lock_lock(v9 + 4);
  sub_222A8F708(v11, (uint64_t (*)(void))sub_222AA8E3C);
  os_unfair_lock_unlock(v10);
  sub_222AAD94C();
  v12 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v15);
}

uint64_t sub_222AA1EF4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v3 = *v1;
  v4 = sub_222AAD4F0();
  v15 = *(_QWORD *)(v4 - 8);
  v16 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_222AAD598();
  MEMORY[0x24BDAC7A8](v7);
  v21 = a1;
  __swift_project_boxed_opaque_existential_1(v1 + 19, v1[22]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAE880;
  sub_222AAD58C();
  sub_222AAD580();
  v20 = v3;
  v19[0] = v1;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v19, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  v8 = *(_QWORD *)(a1 + 16);
  v20 = MEMORY[0x24BEE1768];
  v19[0] = v8;
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v19, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD694();
  swift_bridgeObjectRelease();
  sub_222A7418C(0, (unint64_t *)&unk_2540C81C0);
  sub_222AAD988();
  sub_222AAD4E4();
  sub_222AAD958();
  v9 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  v10 = (os_unfair_lock_s *)v1[24];
  v17 = v1;
  v18 = &v21;
  v11 = v10 + 4;
  os_unfair_lock_lock(v10 + 4);
  sub_222A8F708(v12, (uint64_t (*)(void))sub_222AA9510);
  os_unfair_lock_unlock(v11);
  sub_222AAD94C();
  v13 = (void *)sub_222AAD988();
  sub_222AAD4D8();

  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v6, v16);
}

uint64_t (*sub_222AA21C0(uint64_t a1))(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_222AA94E8;
  *(_QWORD *)(v2 + 24) = a1;
  swift_retain();
  return sub_222AA94EC;
}

uint64_t sub_222AA2220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_222AA2240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  v3 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_222AA22E0;
  return sub_222AADA30();
}

uint64_t sub_222AA22E0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222AA2334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v7[19] = a2;
  v7[20] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8180);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_222AA23A8()
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
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int128 *v20;
  __int128 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v20 = (__int128 *)(v0 + 56);
    v21 = (__int128 *)(v0 + 16);
    v3 = v1 + 32;
    v22 = sub_222AAD8A4();
    v19 = *(_QWORD *)(v22 - 8);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    swift_bridgeObjectRetain();
    do
    {
      v23 = v2;
      v5 = *(_QWORD *)(v0 + 208);
      v25 = *(_QWORD *)(v0 + 200);
      v6 = *(_QWORD *)(v0 + 184);
      v24 = *(_QWORD *)(v0 + 192);
      v7 = *(_QWORD *)(v0 + 168);
      v8 = *(_QWORD *)(v0 + 176);
      v18(v5, 1, 1, v22);
      sub_222A723C0(v3, (uint64_t)v21);
      sub_222A723C0(v6, (uint64_t)v20);
      v9 = (_QWORD *)swift_allocObject();
      v9[2] = 0;
      v9[3] = 0;
      v9[4] = v7;
      v9[5] = v8;
      sub_222A80690(v21, (uint64_t)(v9 + 6));
      sub_222A80690(v20, (uint64_t)(v9 + 11));
      v9[16] = v24;
      sub_222A89EBC(v5, v25, &qword_2540C8180);
      LODWORD(v5) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v25, 1, v22);
      swift_retain();
      swift_retain();
      v10 = *(_QWORD *)(v0 + 200);
      if ((_DWORD)v5 == 1)
      {
        sub_222A7DCD0(*(_QWORD *)(v0 + 200), &qword_2540C8180);
      }
      else
      {
        sub_222AAD898();
        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v10, v22);
      }
      if (v9[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v11 = sub_222AAD868();
        v13 = v12;
        swift_unknownObjectRelease();
      }
      else
      {
        v11 = 0;
        v13 = 0;
      }
      v14 = **(_QWORD **)(v0 + 152);
      v15 = swift_allocObject();
      *(_QWORD *)(v15 + 16) = &unk_255768EC0;
      *(_QWORD *)(v15 + 24) = v9;
      v16 = v13 | v11;
      if (v13 | v11)
      {
        v16 = v0 + 96;
        *(_QWORD *)(v0 + 96) = 0;
        *(_QWORD *)(v0 + 104) = 0;
        *(_QWORD *)(v0 + 112) = v11;
        *(_QWORD *)(v0 + 120) = v13;
      }
      v4 = *(_QWORD *)(v0 + 208);
      *(_QWORD *)(v0 + 128) = 1;
      *(_QWORD *)(v0 + 136) = v16;
      *(_QWORD *)(v0 + 144) = v14;
      swift_task_create();
      swift_release();
      sub_222A7DCD0(v4, &qword_2540C8180);
      v3 += 40;
      --v2;
    }
    while (v23 != 1);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_222AA2670(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  _QWORD *v8;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t);

  v8[19] = a7;
  v8[20] = a8;
  v8[18] = a6;
  v8[21] = *a8;
  sub_222AAD598();
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v11 = (_QWORD *)swift_task_alloc();
  v8[24] = v11;
  *v11 = v8;
  v11[1] = sub_222AA2720;
  return v13(a6);
}

uint64_t sub_222AA2720()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_222AA279C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v12;
  void *v13;
  uint64_t *v14;

  v1 = v0;
  v2 = v0 + 6;
  v14 = v0 + 10;
  v13 = (void *)v0[25];
  v3 = v0[21];
  v4 = v1[20];
  v12 = (_QWORD *)v1[18];
  __swift_project_boxed_opaque_existential_1((_QWORD *)v1[19], *(_QWORD *)(v1[19] + 24));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8250);
  sub_222AAD5B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_222AAF550;
  sub_222AAD58C();
  sub_222AAD580();
  v1[5] = v3;
  v1[2] = v4;
  swift_retain();
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)(v1 + 2), (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD58C();
  sub_222AAD580();
  v5 = v12[3];
  v6 = __swift_project_boxed_opaque_existential_1(v12, v5);
  v1[9] = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_0, v6, v5);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v2, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  swift_getErrorValue();
  v8 = v1[14];
  v9 = v1[15];
  v1[13] = v9;
  v10 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v10, v8, v9);
  sub_222AAD55C();
  sub_222A7DCD0((uint64_t)v14, (uint64_t *)&unk_2540C8268);
  sub_222AAD580();
  sub_222AAD5A4();
  sub_222AAD6A0();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

void sub_222AA2A14(unint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
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
  unint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int (*v55)(uint64_t *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  ValueMetadata *v67;
  uint64_t v68;
  uint64_t v69;
  os_unfair_lock_s *v70;
  char v71;
  void *v72;
  id v73;
  uint64_t v74;
  __int128 *v75;
  uint64_t v76;
  char v77;
  char v78;
  uint64_t *v79;
  uint64_t v80;
  os_unfair_lock_s *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  unsigned __int8 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t *v107;
  ValueMetadata *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned int v123;
  __int128 v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  __int128 v130;
  char *v131;
  uint64_t v132;

  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BD0);
  MEMORY[0x24BDAC7A8](v96);
  v95 = (uint64_t *)((char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v94 = type metadata accessor for AppStateMachine.StateChange();
  MEMORY[0x24BDAC7A8](v94);
  v93 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E40);
  MEMORY[0x24BDAC7A8](v101);
  v100 = (uint64_t)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v97 = (uint64_t)&v91 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v91 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v113 = (uint64_t)&v91 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v91 - v18;
  v122 = type metadata accessor for State();
  v20 = *(_QWORD *)(v122 - 8);
  v21 = MEMORY[0x24BDAC7A8](v122);
  v108 = (ValueMetadata *)((char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = MEMORY[0x24BDAC7A8](v21);
  v99 = (uint64_t)&v91 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (uint64_t *)((char *)&v91 - v26);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v92 = (uint64_t)&v91 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v119 = (uint64_t)&v91 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v118 = (uint64_t)&v91 - v32;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8130);
  sub_222AAD784();
  swift_endAccess();
  if (qword_2540C7668 != -1)
LABEL_60:
    swift_once();
  v110 = *(_QWORD *)(qword_2540C8E18 + 16);
  if (!v110)
    return;
  v106 = (uint64_t *)(a1 + 128);
  v33 = *(_QWORD *)(a1 + 16);
  v120 = *(_QWORD *)(v33 + 16);
  v109 = qword_2540C8E18 + 32;
  v121 = v33;
  v102 = v33 + 32;
  v111 = qword_2540C8E18;
  swift_bridgeObjectRetain();
  v34 = v111;
  v35 = 0;
  v98 = v27;
  v105 = a2;
  v104 = v20;
  v116 = a1;
  v107 = (uint64_t *)v10;
  v103 = v15;
  while (1)
  {
    if (v35 >= *(_QWORD *)(v34 + 16))
      goto LABEL_59;
    v117 = v35;
    v123 = *(unsigned __int8 *)(v109 + v35);
    v15 = (char *)MEMORY[0x24BEE4AF8];
    v131 = (char *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    if (v120)
    {
      a1 = 0;
      v10 = v102;
      while (a1 < *(_QWORD *)(v121 + 16))
      {
        sub_222A723C0(v10, (uint64_t)&v124);
        v27 = v126;
        v36 = v127;
        __swift_project_boxed_opaque_existential_1(&v124, (uint64_t)v126);
        *(_QWORD *)&v130 = a2;
        BYTE8(v130) = v123;
        if (((*(uint64_t (**)(__int128 *, uint64_t *, uint64_t))(v36 + 56))(&v130, v27, v36) & 1) != 0)
        {
          sub_222A80690(&v124, (uint64_t)&v130);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_222AA514C(0, *((_QWORD *)v15 + 2) + 1, 1);
          v15 = v131;
          v38 = *((_QWORD *)v131 + 2);
          v37 = *((_QWORD *)v131 + 3);
          v27 = (uint64_t *)(v38 + 1);
          if (v38 >= v37 >> 1)
          {
            sub_222AA514C((_QWORD *)(v37 > 1), v38 + 1, 1);
            v15 = v131;
          }
          *((_QWORD *)v15 + 2) = v27;
          sub_222A80690(&v130, (uint64_t)&v15[40 * v38 + 32]);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v124);
        }
        ++a1;
        v10 += 40;
        if (v120 == a1)
        {
          v39 = v131;
          v15 = (char *)MEMORY[0x24BEE4AF8];
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    v39 = v15;
LABEL_20:
    swift_bridgeObjectRelease();
    v40 = *((_QWORD *)v39 + 2);
    if (v40)
    {
      v41 = v15;
      v42 = (uint64_t)(v39 + 32);
      v115 = (uint64_t *)v39;
      swift_retain();
      do
      {
        sub_222A723C0(v42, (uint64_t)&v124);
        v43 = (uint64_t)v126;
        v44 = v127;
        __swift_project_boxed_opaque_existential_1(&v124, (uint64_t)v126);
        *(_QWORD *)&v130 = a2;
        (*(void (**)(__int128 *, uint64_t, uint64_t))(v44 + 48))(&v130, v43, v44);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v124);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1, v122) == 1)
        {
          sub_222A7DCD0((uint64_t)v19, &qword_2540C7E30);
        }
        else
        {
          v45 = v118;
          sub_222A7A688((uint64_t)v19, v118);
          sub_222A7A688(v45, v119);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v41 = (_QWORD *)sub_222AA4E5C(0, v41[2] + 1, 1, v41);
          v47 = v41[2];
          v46 = v41[3];
          if (v47 >= v46 >> 1)
            v41 = (_QWORD *)sub_222AA4E5C(v46 > 1, v47 + 1, 1, v41);
          v41[2] = v47 + 1;
          sub_222A7A688(v119, (uint64_t)v41+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(_QWORD *)(v20 + 72) * v47);
        }
        v42 += 40;
        --v40;
      }
      while (v40);
      swift_release_n();
    }
    else
    {
      swift_release();
      v41 = v15;
    }
    v48 = v113;
    v49 = v122;
    if (v41[2] == 1)
    {
      sub_222A78EE0((uint64_t)v41 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80)), v113);
      v50 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56);
      v50(v48, 0, 1, v49);
      v51 = (uint64_t)v103;
      swift_storeEnumTagMultiPayload();
      v50(v51, 0, 1, v49);
      v52 = (uint64_t *)(v100 + *(int *)(v101 + 48));
      v53 = v48;
      v54 = v100;
      sub_222A89EBC(v53, v100, &qword_2540C7E30);
      v115 = v52;
      sub_222A89EBC(v51, (uint64_t)v52, &qword_2540C7E30);
      v55 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v20 + 48);
      if (v55((uint64_t *)v54, 1, v49) == 1)
      {
        sub_222A7DCD0(v51, &qword_2540C7E30);
        sub_222A7DCD0(v113, &qword_2540C7E30);
        if (v55(v115, 1, v49) == 1)
        {
          sub_222A7DCD0(v54, &qword_2540C7E30);
LABEL_50:
          swift_bridgeObjectRelease();
          *(_QWORD *)&v124 = a2;
          v79 = sub_222A9F0AC((uint64_t *)&v124);
          v80 = (uint64_t)v98;
          swift_storeEnumTagMultiPayload();
          v115 = &v91;
          v81 = (os_unfair_lock_s *)v79[4];
          v67 = (ValueMetadata *)&v81[6];
          swift_retain();
          os_unfair_lock_lock(v81 + 6);
          v10 = v123;
          v82 = v112;
          sub_222A7F26C((uint64_t)&v81[4], v123, v80);
          v114 = v82;
          if (v82)
            goto LABEL_62;
          os_unfair_lock_unlock(v81 + 6);
          swift_release();
          v83 = v79[2];
          v84 = (uint64_t)v93;
          swift_storeEnumTagMultiPayload();
          *(_QWORD *)v84 = v83;
          *(_BYTE *)(v84 + 8) = v10;
          sub_222AAD538();
          sub_222A759F4(v84, (uint64_t (*)(_QWORD))type metadata accessor for AppStateMachine.StateChange);
          sub_222A759F4((uint64_t)v98, (uint64_t (*)(_QWORD))type metadata accessor for State);
          v115 = v79;
          v85 = v79[4];
          v15 = (char *)(v85 + 16);
          v67 = (ValueMetadata *)(v85 + 24);
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v85 + 24));
          v86 = v114;
          sub_222A7E478((uint64_t *)(v85 + 16), v10, v99);
          v112 = v86;
          if (v86)
            goto LABEL_62;
          os_unfair_lock_unlock((os_unfair_lock_t)(v85 + 24));
          swift_release();
          a1 = v116;
          v87 = *(void **)(v116 + 136);
          *(_QWORD *)&v124 = a2;
          BYTE8(v124) = v10;
          v88 = v87;
          v27 = (uint64_t *)sub_222AADAFC();
          v89 = objc_msgSend(v88, sel_containsObject_, v27);

          swift_unknownObjectRelease();
          if ((v89 & 1) != 0)
          {
            v27 = v95;
            v90 = (uint64_t)v95 + *(int *)(v96 + 48);
            *v95 = a2;
            *((_BYTE *)v27 + 8) = v10;
            sub_222A78EE0(v99, v90);
            sub_222AAD538();
            sub_222A7DCD0((uint64_t)v27, &qword_2540C7BD0);
          }
          swift_release();
          v75 = &v130;
LABEL_55:
          sub_222A759F4(*((_QWORD *)v75 - 32), (uint64_t (*)(_QWORD))type metadata accessor for State);
          goto LABEL_5;
        }
        goto LABEL_38;
      }
      v56 = v97;
      sub_222A89EBC(v54, v97, &qword_2540C7E30);
      if (v55(v115, 1, v49) == 1)
      {
        sub_222A7DCD0((uint64_t)v103, &qword_2540C7E30);
        sub_222A7DCD0(v113, &qword_2540C7E30);
        sub_222A759F4(v56, (uint64_t (*)(_QWORD))type metadata accessor for State);
LABEL_38:
        sub_222A7DCD0(v54, &qword_2540C7E40);
        goto LABEL_39;
      }
      v76 = v92;
      sub_222A7A688((uint64_t)v115, v92);
      _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v56, v76);
      v78 = v77;
      sub_222A759F4(v76, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A7DCD0((uint64_t)v103, &qword_2540C7E30);
      sub_222A7DCD0(v113, &qword_2540C7E30);
      sub_222A759F4(v56, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A7DCD0(v54, &qword_2540C7E30);
      if ((v78 & 1) != 0)
        goto LABEL_50;
    }
LABEL_39:
    v57 = v106;
    swift_beginAccess();
    v58 = *v57;
    if (*(_QWORD *)(v58 + 16) && (v59 = sub_222A8B188(a2, v123), (v60 & 1) != 0))
    {
      v61 = *(_QWORD *)(v58 + 56) + 56 * v59;
      a1 = *(_QWORD *)v61;
      v15 = *(char **)(v61 + 8);
      v62 = *(unsigned __int8 *)(v61 + 16);
      v63 = *(_QWORD *)(v61 + 24);
      v64 = *(_QWORD *)(v61 + 32);
      v65 = *(uint64_t **)(v61 + 40);
      v66 = *(_QWORD *)(v61 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      a1 = 0;
      v15 = 0;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
    }
    v114 = v66;
    v115 = v65;
    swift_endAccess();
    *(_QWORD *)&v124 = a1;
    *((_QWORD *)&v124 + 1) = v15;
    v125 = v62;
    v126 = (uint64_t *)v63;
    v127 = v64;
    v128 = v65;
    v129 = v66;
    v27 = v107;
    sub_222A9ECD4((uint64_t)v41, (uint64_t *)&v124, v107);
    v10 = (uint64_t)v27;
    swift_bridgeObjectRelease();
    sub_222AA8E58(a1, (uint64_t)v15, v62, v63, v64);
    v20 = v104;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v104 + 48))(v27, 1, v122) != 1)
      break;
    sub_222A7DCD0((uint64_t)v27, &qword_2540C7E30);
    a2 = v105;
LABEL_5:
    v35 = v117 + 1;
    v34 = v111;
    if (v117 + 1 == v110)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  v67 = v108;
  sub_222A7A688((uint64_t)v27, (uint64_t)v108);
  a2 = v105;
  *(_QWORD *)&v124 = v105;
  a1 = v116;
  v27 = sub_222A9F0AC((uint64_t *)&v124);
  v15 = (char *)&v91;
  v68 = v27[4];
  v115 = (uint64_t *)(v68 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v68 + 24));
  v69 = v112;
  sub_222A7E5F0(v115, v123, v67, v27, &v124);
  v112 = v69;
  v70 = (os_unfair_lock_s *)(v68 + 24);
  if (!v69)
  {
    os_unfair_lock_unlock(v70);
    v10 = v124;
    swift_release();
    swift_release();
    v71 = v123;
    if ((v10 & 1) != 0)
    {
      v72 = *(void **)(a1 + 136);
      *(_QWORD *)&v124 = a2;
      BYTE8(v124) = v123;
      v73 = v72;
      v27 = (uint64_t *)sub_222AADAFC();
      v10 = (uint64_t)objc_msgSend(v73, sel_containsObject_, v27);

      swift_unknownObjectRelease();
      if ((_DWORD)v10)
      {
        v27 = v95;
        v74 = (uint64_t)v95 + *(int *)(v96 + 48);
        *v95 = a2;
        *((_BYTE *)v27 + 8) = v71;
        sub_222A78EE0((uint64_t)v108, v74);
        sub_222AAD538();
        sub_222A7DCD0((uint64_t)v27, &qword_2540C7BD0);
      }
    }
    v75 = (__int128 *)&v132;
    goto LABEL_55;
  }
  os_unfair_lock_unlock(v70);
  __break(1u);
LABEL_62:
  os_unfair_lock_unlock((os_unfair_lock_t)v67);
  __break(1u);
}

void sub_222AA3774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void (*v63)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int (*v69)(_QWORD *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  ValueMetadata *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  uint64_t v90;
  _QWORD *v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  unsigned __int8 v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  _QWORD *v101;
  int64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int64_t v106;
  unint64_t v107;
  int64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  ValueMetadata *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  _QWORD *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  __int128 v139;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __int128 v145;
  _QWORD *v146;

  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7BD0);
  MEMORY[0x24BDAC7A8](v111);
  v110 = (uint64_t *)((char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E40);
  MEMORY[0x24BDAC7A8](v117);
  v122 = (uint64_t)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v121 = (uint64_t *)((char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v104 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v104 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v138 = (uint64_t)&v104 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v104 - v17;
  v134 = type metadata accessor for State();
  v19 = *(_QWORD *)(v134 - 8);
  v20 = MEMORY[0x24BDAC7A8](v134);
  v115 = (ValueMetadata *)((char *)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = MEMORY[0x24BDAC7A8](v20);
  v116 = (uint64_t)&v104 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v112 = (uint64_t)&v104 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v132 = (uint64_t)&v104 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v131 = (uint64_t)&v104 - v28;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8130);
  sub_222AAD784();
  v29 = (uint64_t)v14;
  swift_endAccess();
  v30 = *(_QWORD *)(a2 + 56);
  v105 = a2 + 56;
  v31 = 1 << *(_BYTE *)(a2 + 32);
  v32 = -1;
  if (v31 < 64)
    v32 = ~(-1 << v31);
  v33 = v32 & v30;
  v120 = (uint64_t *)(a1 + 128);
  v106 = (unint64_t)(v31 + 63) >> 6;
  v109 = a2;
  v34 = swift_bridgeObjectRetain();
  v35 = v33;
  v36 = 0;
  v37 = 0x2540C7000;
  v38 = (_QWORD *)&unk_2540C8000;
  v126 = a1;
  v135 = v14;
  v119 = v19;
  v113 = v11;
  do
  {
LABEL_5:
    if (v35)
    {
      v39 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      v40 = v39 | (v36 << 6);
    }
    else
    {
      if (__OFADD__(v36++, 1))
      {
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      if (v36 >= v106)
        goto LABEL_76;
      v42 = *(_QWORD *)(v105 + 8 * v36);
      if (!v42)
      {
        v43 = v36 + 1;
        if (v36 + 1 >= v106)
          goto LABEL_76;
        v42 = *(_QWORD *)(v105 + 8 * v43);
        if (!v42)
        {
          v43 = v36 + 2;
          if (v36 + 2 >= v106)
            goto LABEL_76;
          v42 = *(_QWORD *)(v105 + 8 * v43);
          if (!v42)
          {
            v43 = v36 + 3;
            if (v36 + 3 >= v106)
              goto LABEL_76;
            v42 = *(_QWORD *)(v105 + 8 * v43);
            if (!v42)
            {
              v43 = v36 + 4;
              if (v36 + 4 >= v106)
                goto LABEL_76;
              v42 = *(_QWORD *)(v105 + 8 * v43);
              if (!v42)
              {
                while (1)
                {
                  v36 = v43 + 1;
                  if (__OFADD__(v43, 1))
                    break;
                  if (v36 >= v106)
                    goto LABEL_76;
                  v42 = *(_QWORD *)(v105 + 8 * v36);
                  ++v43;
                  if (v42)
                    goto LABEL_19;
                }
LABEL_79:
                __break(1u);
LABEL_80:
                os_unfair_lock_unlock((os_unfair_lock_t)v34);
                __break(1u);
                return;
              }
            }
          }
        }
        v36 = v43;
      }
LABEL_19:
      v35 = (v42 - 1) & v42;
      v40 = __clz(__rbit64(v42)) + (v36 << 6);
    }
    v44 = *(_QWORD *)(*(_QWORD *)(v109 + 48) + 8 * v40);
    if (*(_QWORD *)(v37 + 1640) != -1)
    {
      v100 = v37;
      v101 = v38;
      v102 = v36;
      v103 = v35;
      swift_once();
      v35 = v103;
      v36 = v102;
      v38 = v101;
      v37 = v100;
      a1 = v126;
    }
    v34 = v38[451];
    v125 = *(_QWORD *)(v34 + 16);
  }
  while (!v125);
  v107 = v35;
  v108 = v36;
  v45 = *(_QWORD *)(a1 + 16);
  v133 = *(_QWORD *)(v45 + 16);
  v124 = v34 + 32;
  v136 = v45;
  v118 = v45 + 32;
  v34 = swift_bridgeObjectRetain();
  v46 = 0;
  v47 = v138;
  v123 = v34;
  while (1)
  {
    if (v46 >= *(_QWORD *)(v34 + 16))
    {
      __break(1u);
      goto LABEL_78;
    }
    v129 = v46;
    v137 = *(unsigned __int8 *)(v124 + v46);
    v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v146 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    if (v133)
      break;
    v55 = (uint64_t)v48;
LABEL_40:
    swift_bridgeObjectRelease();
    v56 = *(_QWORD *)(v55 + 16);
    if (v56)
    {
      v57 = v55 + 32;
      v130 = (_QWORD *)v55;
      swift_retain();
      do
      {
        sub_222A723C0(v57, (uint64_t)&v139);
        v58 = (uint64_t)v141;
        v59 = v142;
        __swift_project_boxed_opaque_existential_1(&v139, (uint64_t)v141);
        *(_QWORD *)&v145 = v44;
        (*(void (**)(__int128 *, uint64_t, uint64_t))(v59 + 48))(&v145, v58, v59);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v134) == 1)
        {
          sub_222A7DCD0((uint64_t)v18, &qword_2540C7E30);
          v47 = v138;
        }
        else
        {
          v60 = v131;
          sub_222A7A688((uint64_t)v18, v131);
          sub_222A7A688(v60, v132);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v48 = (_QWORD *)sub_222AA4E5C(0, v48[2] + 1, 1, v48);
          v47 = v138;
          v62 = v48[2];
          v61 = v48[3];
          if (v62 >= v61 >> 1)
            v48 = (_QWORD *)sub_222AA4E5C(v61 > 1, v62 + 1, 1, v48);
          v48[2] = v62 + 1;
          sub_222A7A688(v132, (uint64_t)v48+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(_QWORD *)(v19 + 72) * v62);
        }
        v57 += 40;
        --v56;
      }
      while (v56);
      swift_release_n();
      v29 = (uint64_t)v135;
    }
    else
    {
      swift_release();
    }
    if (v48[2] == 1)
    {
      sub_222A78EE0((uint64_t)v48 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80)), v47);
      v63 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56);
      v64 = v134;
      v63(v47, 0, 1, v134);
      swift_storeEnumTagMultiPayload();
      v63(v29, 0, 1, v64);
      v65 = v122 + *(int *)(v117 + 48);
      sub_222A89EBC(v47, v122, &qword_2540C7E30);
      v130 = (_QWORD *)v65;
      v66 = v122;
      sub_222A89EBC(v29, v65, &qword_2540C7E30);
      v67 = v47;
      v68 = v29;
      v69 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48);
      if (v69((_QWORD *)v66, 1, v64) == 1)
      {
        sub_222A7DCD0(v68, &qword_2540C7E30);
        sub_222A7DCD0(v67, &qword_2540C7E30);
        if (v69(v130, 1, v64) == 1)
        {
          sub_222A7DCD0(v66, &qword_2540C7E30);
LABEL_66:
          swift_bridgeObjectRelease();
          *(_QWORD *)&v139 = v44;
          v90 = v126;
          v91 = sub_222A9F0AC((uint64_t *)&v139);
          v92 = v137;
          LOBYTE(v139) = v137;
          sub_222A7F324((char *)&v139);
          v130 = v91;
          v93 = v91[4];
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v93 + 24));
          v94 = v114;
          sub_222A7E478((uint64_t *)(v93 + 16), v92, v116);
          v114 = v94;
          v34 = v93 + 24;
          if (v94)
            goto LABEL_80;
          os_unfair_lock_unlock((os_unfair_lock_t)v34);
          swift_release();
          v95 = *(void **)(v90 + 136);
          *(_QWORD *)&v139 = v44;
          BYTE8(v139) = v92;
          v96 = v95;
          v97 = objc_msgSend(v96, sel_containsObject_, sub_222AADAFC());

          swift_unknownObjectRelease();
          if ((v97 & 1) != 0)
          {
            v98 = (uint64_t)v110;
            v99 = (uint64_t)v110 + *(int *)(v111 + 48);
            *v110 = v44;
            *(_BYTE *)(v98 + 8) = v92;
            sub_222A78EE0(v116, v99);
            sub_222AAD538();
            sub_222A7DCD0(v98, &qword_2540C7BD0);
          }
          swift_release();
          v86 = v116;
LABEL_70:
          sub_222A759F4(v86, (uint64_t (*)(_QWORD))type metadata accessor for State);
          goto LABEL_25;
        }
        goto LABEL_58;
      }
      v70 = (uint64_t)v113;
      sub_222A89EBC(v66, (uint64_t)v113, &qword_2540C7E30);
      v71 = (uint64_t)v130;
      if (v69(v130, 1, v64) == 1)
      {
        sub_222A7DCD0((uint64_t)v135, &qword_2540C7E30);
        sub_222A7DCD0(v138, &qword_2540C7E30);
        sub_222A759F4(v70, (uint64_t (*)(_QWORD))type metadata accessor for State);
LABEL_58:
        sub_222A7DCD0(v66, &qword_2540C7E40);
        goto LABEL_59;
      }
      v87 = v112;
      sub_222A7A688(v71, v112);
      _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v70, v87);
      v89 = v88;
      sub_222A759F4(v87, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A7DCD0((uint64_t)v135, &qword_2540C7E30);
      sub_222A7DCD0(v138, &qword_2540C7E30);
      sub_222A759F4(v70, (uint64_t (*)(_QWORD))type metadata accessor for State);
      sub_222A7DCD0(v66, &qword_2540C7E30);
      if ((v89 & 1) != 0)
        goto LABEL_66;
    }
LABEL_59:
    v72 = v120;
    swift_beginAccess();
    v73 = *v72;
    if (*(_QWORD *)(*v72 + 16) && (v74 = sub_222A8B188(v44, v137), (v75 & 1) != 0))
    {
      v76 = *(_QWORD *)(v73 + 56) + 56 * v74;
      v77 = *(_QWORD *)v76;
      v78 = *(_QWORD *)(v76 + 8);
      v79 = *(unsigned __int8 *)(v76 + 16);
      v80 = *(_QWORD *)(v76 + 32);
      v130 = *(_QWORD **)(v76 + 24);
      v82 = *(_QWORD *)(v76 + 40);
      v81 = *(_QWORD *)(v76 + 48);
      swift_bridgeObjectRetain();
      v83 = v81;
      swift_bridgeObjectRetain();
    }
    else
    {
      v77 = 0;
      v78 = 0;
      v79 = 0;
      v130 = 0;
      v80 = 0;
      v82 = 0;
      v83 = 0;
    }
    v127 = v80;
    v128 = v82;
    swift_endAccess();
    *(_QWORD *)&v139 = v77;
    *((_QWORD *)&v139 + 1) = v78;
    v140 = v79;
    v141 = v130;
    v142 = v80;
    v143 = v82;
    v144 = v83;
    v84 = v121;
    sub_222A9ECD4((uint64_t)v48, (uint64_t *)&v139, v121);
    swift_bridgeObjectRelease();
    sub_222AA8E58(v77, v78, v79, (uint64_t)v130, v127);
    v19 = v119;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v119 + 48))(v84, 1, v134) != 1)
    {
      v85 = v115;
      sub_222A7A688((uint64_t)v84, (uint64_t)v115);
      *(_QWORD *)&v139 = v44;
      BYTE8(v139) = v137;
      sub_222A9F2CC((uint64_t)&v139, v85);
      v86 = (uint64_t)v85;
      goto LABEL_70;
    }
    sub_222A7DCD0((uint64_t)v84, &qword_2540C7E30);
LABEL_25:
    v47 = v138;
    v46 = v129 + 1;
    v29 = (uint64_t)v135;
    v34 = v123;
    if (v129 + 1 == v125)
    {
      v34 = swift_bridgeObjectRelease();
      a1 = v126;
      v37 = 0x2540C7000uLL;
      v38 = &unk_2540C8000;
      v36 = v108;
      v35 = v107;
      goto LABEL_5;
    }
  }
  v49 = 0;
  v50 = v118;
  while (v49 < *(_QWORD *)(v136 + 16))
  {
    sub_222A723C0(v50, (uint64_t)&v139);
    v51 = (uint64_t)v141;
    v52 = v142;
    __swift_project_boxed_opaque_existential_1(&v139, (uint64_t)v141);
    *(_QWORD *)&v145 = v44;
    BYTE8(v145) = v137;
    if (((*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v52 + 56))(&v145, v51, v52) & 1) != 0)
    {
      sub_222A80690(&v139, (uint64_t)&v145);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_222AA514C(0, v48[2] + 1, 1);
      v48 = v146;
      v54 = v146[2];
      v53 = v146[3];
      v29 = (uint64_t)v135;
      if (v54 >= v53 >> 1)
      {
        sub_222AA514C((_QWORD *)(v53 > 1), v54 + 1, 1);
        v29 = (uint64_t)v135;
        v48 = v146;
      }
      v48[2] = v54 + 1;
      sub_222A80690(&v145, (uint64_t)&v48[5 * v54 + 4]);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
      v29 = (uint64_t)v135;
    }
    ++v49;
    v50 += 40;
    v47 = v138;
    if (v133 == v49)
    {
      v55 = (uint64_t)v146;
      v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_76:
  swift_release();
}

unint64_t sub_222AA44A8(uint64_t a1, unint64_t a2)
{
  unint64_t v4;

  v4 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2;
  sub_222AA941C(a2);
  sub_222AA941C(a2);
  sub_222AA8754(v4);
  if (*(_QWORD *)(a1 + 24) == 1)
    sub_222AAD538();
  return sub_222AA8754(a2);
}

uint64_t sub_222AA4514(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v7 = a3 & 1;
  swift_beginAccess();
  sub_222AA8474(a4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = 0x8000000000000000;
  sub_222AACF90(a4, a2, v7, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t StorefrontAppStateController.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_222AA8754(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  swift_release();

  swift_release();
  swift_release();
  return v0;
}

uint64_t StorefrontAppStateController.__deallocating_deinit()
{
  StorefrontAppStateController.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_222AA465C()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  unsigned __int8 v3;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA8D94(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_222AA46C0()
{
  return swift_retain();
}

uint64_t sub_222AA46CC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_222A7E220;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_222AA472C(char a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_222A7E220;
  return StorefrontAppStateController.reloadAllStates(synchronizing:)(a1);
}

uint64_t sub_222AA477C(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E0EC;
  return StorefrontAppStateController.reloadState(forApps:synchronizing:)(a1, a2);
}

uint64_t sub_222AA47DC(uint64_t a1)
{
  return StorefrontAppStateController.preloadState(forApps:)(a1);
}

void sub_222AA47FC()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
}

void sub_222AA4898(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  StorefrontAppStateController.prospectiveState(forApp:applying:)(a1, a2, a3);
}

uint64_t sub_222AA48B8()
{
  return sub_222AA48D0();
}

uint64_t sub_222AA48C4()
{
  return sub_222AA48D0();
}

uint64_t sub_222AA48D0()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  unsigned __int8 v3;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA8D94(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_222AA4944()
{
  return swift_retain();
}

uint64_t sub_222AA4950()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  unsigned __int8 v3;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222AA8D94(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void sub_222AA49C8()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_222AA4A3C(uint64_t *a1, unsigned __int8 *a2)
{
  char v2;

  StorefrontAppStateController.setWaiting(forApp:installationType:)(a1, a2);
  return v2 & 1;
}

uint64_t sub_222AA4A60(uint64_t a1, char a2)
{
  StorefrontAppStateController.clearWaiting(forApp:refreshState:)(a1, a2);
  return 1;
}

uint64_t sub_222AA4A84(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  return StorefrontAppStateController.refreshUpdateRegistry(forApp:with:)(a1, a2);
}

uint64_t sub_222AA4AE4(uint64_t *a1)
{
  return StorefrontAppStateController.isLocal(app:)(a1) & 1;
}

uint64_t sub_222AA4B08(uint64_t *a1, int a2)
{
  return StorefrontAppStateController.isRedownloadable(app:includingPreorders:)(a1, a2) & 1;
}

uint64_t sub_222AA4B2C(uint64_t *a1)
{
  return StorefrontAppStateController.purchaseHistoryIncludes(app:)(a1) & 1;
}

uint64_t sub_222AA4B50(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_222AA9540;
  return v6(a1);
}

uint64_t sub_222AA4BB4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_222AA4C18;
  return v6(a1);
}

uint64_t sub_222AA4C18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_222AA4C64(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7608);
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
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_222AA4D5C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255768DA8);
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

size_t sub_222AA4E5C(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8230);
  v10 = *(_QWORD *)(type metadata accessor for State() - 8);
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
  v15 = *(_QWORD *)(type metadata accessor for State() - 8);
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
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

size_t sub_222AA4FD0(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8258);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2540C80F0) - 8);
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
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2540C80F0) - 8);
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
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

_QWORD *sub_222AA514C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_222AA51A0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_222AA5168(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_222AA52D4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_222AA5184(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_222AA53CC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_222AA51A0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8238);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EC0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_222AA52D4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7608);
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

char *sub_222AA53CC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8240);
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

uint64_t sub_222AA54C4(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_222AADB80();
  sub_222AADBA4();
  v6 = sub_222AADBB0();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_222AA5CC8(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_222AA55E0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;

  v6 = a3 & 1;
  v7 = *v3;
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  v8 = sub_222AADBB0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      v12 = *(_QWORD *)(v7 + 48) + 16 * v10;
      if (*(_QWORD *)v12 == a2 && (((v6 == 0) ^ *(unsigned __int8 *)(v12 + 8)) & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_7;
    }
    result = 0;
    v14 = *(_QWORD *)(*v3 + 48) + 16 * v10;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = *(_BYTE *)(v14 + 8);
    *(_QWORD *)a1 = v15;
    *(_BYTE *)(a1 + 8) = v14;
  }
  else
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_222AA5E14(a2, v6, v10, isUniquelyReferenced_nonNull_native);
    *v3 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)a1 = a2;
    *(_BYTE *)(a1 + 8) = v6;
    return 1;
  }
  return result;
}

uint64_t sub_222AA5744()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81D0);
  result = sub_222AAD9E8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      sub_222AADB80();
      sub_222AADBA4();
      result = sub_222AADBB0();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_222AA59EC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F0);
  result = sub_222AAD9E8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
      v19 = *(_QWORD *)v18;
      v20 = *(_BYTE *)(v18 + 8);
      sub_222AADB80();
      sub_222AADBA4();
      sub_222AADB8C();
      result = sub_222AADBB0();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
      *(_QWORD *)v12 = v19;
      *(_BYTE *)(v12 + 8) = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_222AA5CC8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_222AA5744();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_222AA5F88();
      goto LABEL_14;
    }
    sub_222AA62C0();
  }
  v8 = *v3;
  sub_222AADB80();
  sub_222AADBA4();
  result = sub_222AADBB0();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_222AADB08();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_222AA5E14(uint64_t result, char a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v6 = result;
  v7 = a2 & 1;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0)
    goto LABEL_14;
  if ((a4 & 1) != 0)
  {
    sub_222AA59EC();
  }
  else
  {
    if (v9 > v8)
    {
      result = (uint64_t)sub_222AA611C();
      goto LABEL_14;
    }
    sub_222AA6538();
  }
  v10 = *v4;
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  result = sub_222AADBB0();
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a3 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v12 = ~v11;
    while (1)
    {
      v13 = *(_QWORD *)(v10 + 48) + 16 * a3;
      if (*(_QWORD *)v13 == v6 && (((v7 == 0) ^ *(unsigned __int8 *)(v13 + 8)) & 1) != 0)
        break;
      a3 = (a3 + 1) & v12;
      if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
        goto LABEL_14;
    }
    result = sub_222AADB08();
    __break(1u);
  }
LABEL_14:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v15 = *(_QWORD *)(v14 + 48) + 16 * a3;
  *(_QWORD *)v15 = v6;
  *(_BYTE *)(v15 + 8) = v7;
  v16 = *(_QWORD *)(v14 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    *(_QWORD *)(v14 + 16) = v18;
  return result;
}

void *sub_222AA5F88()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81D0);
  v2 = *v0;
  v3 = sub_222AAD9DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
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
  return result;
}

void *sub_222AA611C()
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
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F0);
  v2 = *v0;
  v3 = sub_222AAD9DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
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
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_QWORD *)v17;
    LOBYTE(v17) = *(_BYTE *)(v17 + 8);
    v19 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v19 = v18;
    *(_BYTE *)(v19 + 8) = v17;
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

uint64_t sub_222AA62C0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81D0);
  result = sub_222AAD9E8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    sub_222AADB80();
    sub_222AADBA4();
    result = sub_222AADBB0();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_222AA6538()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F0);
  result = sub_222AAD9E8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
    v19 = *(_QWORD *)v18;
    v20 = *(_BYTE *)(v18 + 8);
    sub_222AADB80();
    sub_222AADBA4();
    sub_222AADB8C();
    result = sub_222AADBB0();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
    *(_QWORD *)v12 = v19;
    *(_BYTE *)(v12 + 8) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_222AA67E0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81D0);
  result = sub_222AAD9F4();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    sub_222AADB80();
    sub_222AADBA4();
    result = sub_222AADBB0();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_222AA6A48(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F0);
  result = sub_222AAD9F4();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(_QWORD *)(v4 + 48) + 16 * v13;
    v18 = *(_QWORD *)v17;
    v19 = *(_BYTE *)(v17 + 8);
    sub_222AADB80();
    sub_222AADBA4();
    sub_222AADB8C();
    result = sub_222AADBB0();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = *(_QWORD *)(v8 + 48) + 16 * v23;
    *(_QWORD *)v28 = v18;
    *(_BYTE *)(v28 + 8) = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_222AA6CE4(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v5)(uint64_t *);
  char v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v5 = (uint64_t (*)(uint64_t *))isStackAllocationSafe;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a3 + 32);
  v7 = (unint64_t)((1 << v6) + 63) >> 6;
  v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_222AA6E60((uint64_t)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a3, v5);
    swift_release();
    if (v3)
      swift_willThrow();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    v9 = sub_222AA6E60((uint64_t)v10, v7, a3, v5);
    swift_release();
    MEMORY[0x2276780C8](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_222AA6E60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  uint64_t v4;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v22 = (unint64_t *)result;
  v7 = 0;
  v8 = 0;
  v9 = a3 + 56;
  v10 = 1 << *(_BYTE *)(a3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a3 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
LABEL_4:
  v25 = v7;
  while (v12)
  {
    v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    v15 = v14 | (v8 << 6);
LABEL_18:
    v19 = *(_QWORD *)(a3 + 48) + 16 * v15;
    v20 = *(_QWORD *)v19;
    LOBYTE(v19) = *(_BYTE *)(v19 + 8);
    v23 = v20;
    v24 = v19;
    result = a4(&v23);
    if (v4)
      return result;
    if ((result & 1) != 0)
    {
      *(unint64_t *)((char *)v22 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v7 = v25 + 1;
      if (!__OFADD__(v25, 1))
        goto LABEL_4;
      __break(1u);
LABEL_28:
      swift_retain();
      return sub_222AA6A48(v22, a2, v25, a3);
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v8 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v9 + 8 * v8);
  if (v17)
  {
LABEL_17:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v8 << 6);
    goto LABEL_18;
  }
  v18 = v8 + 1;
  if (v8 + 1 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v8 + 2;
  if (v8 + 2 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v8 + 3;
  if (v8 + 3 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
  {
LABEL_16:
    v8 = v18;
    goto LABEL_17;
  }
  while (1)
  {
    v8 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v8 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v9 + 8 * v8);
    ++v18;
    if (v17)
      goto LABEL_17;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_222AA7028(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    result = sub_222AA7580(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v10), *(_BYTE *)(*(_QWORD *)(v2 + 48) + 16 * v10 + 8), (uint64_t)&v14);
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_222AA71A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t isStackAllocationSafe;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  int64_t v34;
  _QWORD v35[6];

  v2 = a2;
  v35[5] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = 0;
    v6 = a1 + 56;
    v5 = *(_QWORD *)(a1 + 56);
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v33 = ~v7;
    if (-v7 < 64)
      v8 = ~(-1 << -(char)v7);
    else
      v8 = -1;
    v9 = v8 & v5;
    v34 = (unint64_t)(63 - v7) >> 6;
    v10 = a2 + 56;
    do
    {
LABEL_6:
      if (v9)
      {
        v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v12 = v11 | (v4 << 6);
      }
      else
      {
        v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_37;
        }
        if (v13 >= v34)
          goto LABEL_34;
        v14 = *(_QWORD *)(v6 + 8 * v13);
        v15 = v4 + 1;
        if (!v14)
        {
          v15 = v4 + 2;
          if (v4 + 2 >= v34)
            goto LABEL_34;
          v14 = *(_QWORD *)(v6 + 8 * v15);
          if (!v14)
          {
            v15 = v4 + 3;
            if (v4 + 3 >= v34)
              goto LABEL_34;
            v14 = *(_QWORD *)(v6 + 8 * v15);
            if (!v14)
            {
              v15 = v4 + 4;
              if (v4 + 4 >= v34)
                goto LABEL_34;
              v14 = *(_QWORD *)(v6 + 8 * v15);
              if (!v14)
              {
                v16 = v4 + 5;
                if (v4 + 5 >= v34)
                {
LABEL_34:
                  swift_bridgeObjectRetain();
                  sub_222A9A434();
                  return v2;
                }
                v14 = *(_QWORD *)(v6 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      break;
                    if (v15 >= v34)
                      goto LABEL_34;
                    v14 = *(_QWORD *)(v6 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_23;
                  }
LABEL_37:
                  __break(1u);
                }
                v15 = v4 + 5;
              }
            }
          }
        }
LABEL_23:
        v9 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v15 << 6);
        v4 = v15;
      }
      v17 = *(_QWORD *)(a1 + 48) + 16 * v12;
      v18 = *(_QWORD *)v17;
      v19 = *(unsigned __int8 *)(v17 + 8);
      sub_222AADB80();
      sub_222AADBA4();
      sub_222AADB8C();
      v20 = sub_222AADBB0();
      v21 = -1 << *(_BYTE *)(v2 + 32);
      v22 = v20 & ~v21;
    }
    while (((*(_QWORD *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0);
    while (1)
    {
      v23 = *(_QWORD *)(v2 + 48) + 16 * v22;
      if (*(_QWORD *)v23 == v18 && ((v19 ^ *(unsigned __int8 *)(v23 + 8)) & 1) == 0)
        break;
      v22 = (v22 + 1) & ~v21;
      if (((*(_QWORD *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
        goto LABEL_6;
    }
    v35[0] = a1;
    v35[1] = v6;
    v35[2] = v33;
    v35[3] = v4;
    v35[4] = v9;
    v24 = (unint64_t)(63 - v21) >> 6;
    v25 = 8 * v24;
    isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v24 <= 0x80 || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      v28 = (char *)&v33 - v27;
      memcpy((char *)&v33 - v27, (const void *)(v2 + 56), v25);
      v29 = sub_222AA76E0((uint64_t)v28, v24, v2, v22, v35);
      swift_release();
      sub_222A9A434();
      return v29;
    }
    else
    {
      v30 = (void *)swift_slowAlloc();
      memcpy(v30, (const void *)(v2 + 56), v25);
      v31 = sub_222AA76E0((uint64_t)v30, v24, v2, v22, v35);
      swift_release();
      sub_222A9A434();
      MEMORY[0x2276780C8](v30, -1, -1);
      return v31;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_222AA7580@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  int v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2 & 1;
  v7 = *v3;
  sub_222AADB80();
  sub_222AADBA4();
  sub_222AADB8C();
  result = sub_222AADBB0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = result & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      v12 = *(_QWORD *)(v7 + 48) + 16 * v10;
      if (*(_QWORD *)v12 == a1 && (((v6 == 0) ^ *(unsigned __int8 *)(v12 + 8)) & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_9;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_222AA611C();
      v14 = v17;
    }
    v15 = *(_QWORD *)(v14 + 48) + 16 * v10;
    v16 = *(_QWORD *)v15;
    LOBYTE(v15) = *(_BYTE *)(v15 + 8);
    *(_QWORD *)a3 = v16;
    *(_BYTE *)(a3 + 8) = v15;
    sub_222AA796C(v10);
    *v3 = v17;
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 8) = 2;
  }
  return result;
}

uint64_t sub_222AA76E0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32;

  v7 = (unint64_t *)result;
  v8 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v9 = v8 - 1;
  v10 = a3 + 56;
  while (2)
  {
    v32 = v9;
    while (1)
    {
LABEL_3:
      v12 = a5[3];
      v11 = a5[4];
      if (!v11)
      {
        v15 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
          goto LABEL_38;
        }
        v16 = (unint64_t)(a5[2] + 64) >> 6;
        if (v15 >= v16)
        {
          v15 = a5[3];
LABEL_34:
          a5[3] = v15;
          a5[4] = 0;
          swift_retain();
          return sub_222AA6A48(v7, a2, v32, a3);
        }
        v17 = a5[1];
        v18 = *(_QWORD *)(v17 + 8 * v15);
        if (v18)
          goto LABEL_14;
        v19 = v12 + 2;
        if (v12 + 2 >= v16)
          goto LABEL_34;
        v18 = *(_QWORD *)(v17 + 8 * v19);
        if (!v18)
        {
          if (v12 + 3 >= v16)
            goto LABEL_35;
          v18 = *(_QWORD *)(v17 + 8 * (v12 + 3));
          if (v18)
          {
            v15 = v12 + 3;
            goto LABEL_14;
          }
          v19 = v12 + 4;
          if (v12 + 4 >= v16)
          {
            v15 = v12 + 3;
            goto LABEL_34;
          }
          v18 = *(_QWORD *)(v17 + 8 * v19);
          if (!v18)
          {
            v15 = v12 + 5;
            if (v12 + 5 >= v16)
            {
LABEL_35:
              v15 = v19;
              goto LABEL_34;
            }
            v18 = *(_QWORD *)(v17 + 8 * v15);
            if (!v18)
            {
              v15 = v16 - 1;
              v30 = v12 + 6;
              while (v16 != v30)
              {
                v18 = *(_QWORD *)(v17 + 8 * v30++);
                if (v18)
                {
                  v15 = v30 - 1;
                  goto LABEL_14;
                }
              }
              goto LABEL_34;
            }
            goto LABEL_14;
          }
        }
        v15 = v19;
LABEL_14:
        v13 = (v18 - 1) & v18;
        v14 = __clz(__rbit64(v18)) + (v15 << 6);
        v12 = v15;
        goto LABEL_15;
      }
      v13 = (v11 - 1) & v11;
      v14 = __clz(__rbit64(v11)) | (v12 << 6);
LABEL_15:
      v20 = *(_QWORD *)(*a5 + 48) + 16 * v14;
      v21 = *(_QWORD *)v20;
      v22 = *(unsigned __int8 *)(v20 + 8);
      a5[3] = v12;
      a5[4] = v13;
      sub_222AADB80();
      sub_222AADBA4();
      sub_222AADB8C();
      result = sub_222AADBB0();
      v23 = -1 << *(_BYTE *)(a3 + 32);
      v24 = result & ~v23;
      if (((*(_QWORD *)(v10 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) != 0)
      {
        v25 = ~v23;
        while (1)
        {
          v26 = *(_QWORD *)(a3 + 48) + 16 * v24;
          if (*(_QWORD *)v26 == v21 && ((v22 ^ *(unsigned __int8 *)(v26 + 8)) & 1) == 0)
            break;
          v24 = (v24 + 1) & v25;
          if (((*(_QWORD *)(v10 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
            goto LABEL_3;
        }
        v27 = (v24 >> 3) & 0x1FFFFFFFFFFFFFF8;
        v28 = 1 << v24;
        v29 = *(unint64_t *)((char *)v7 + v27);
        *(unint64_t *)((char *)v7 + v27) = v29 & ~v28;
        if ((v29 & v28) != 0)
          break;
      }
    }
    v9 = v32 - 1;
    if (__OFSUB__(v32, 1))
    {
LABEL_38:
      __break(1u);
      return result;
    }
    if (v32 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

unint64_t sub_222AA796C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_222AAD9D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = 16 * v6;
        sub_222AADB80();
        sub_222AADBA4();
        sub_222AADB8C();
        v11 = sub_222AADBB0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + v10);
          if (16 * v2 != v10 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

_QWORD *sub_222AA7B38@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X1>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_222AA7B74(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_222AA1C28(v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_222AA7BD4(uint64_t a1)
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

int64_t sub_222AA7C78(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_222AA7D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];

  v25 = a2;
  v27 = sub_222AAD910();
  MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_222AAD520();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_222AAD91C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_222AAD748();
  v29[3] = v18;
  v29[4] = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(boxed_opaque_existential_0, a4, v18);
  *(_QWORD *)(a5 + 16) = a1;
  *(double *)(a5 + 144) = a6;
  sub_222A723C0(a2, a5 + 48);
  sub_222A723C0(a3, a5 + 88);
  sub_222A723C0((uint64_t)v29, a5 + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C80E8);
  swift_allocObject();
  *(_QWORD *)(a5 + 208) = sub_222AAD544();
  v20 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a5 + 32) = sub_222A91024(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(a5 + 128) = sub_222A91120(v20);
  *(_QWORD *)(a5 + 40) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a5 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14E0]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C80D8);
  swift_allocObject();
  *(_QWORD *)(a5 + 216) = sub_222AAD544();
  *(_QWORD *)(a5 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v21 = swift_allocObject();
  *(_DWORD *)(v21 + 16) = 0;
  *(_QWORD *)(a5 + 192) = v21;
  sub_222A7418C(0, (unint64_t *)&qword_2540C81A8);
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BEE5758], v14);
  sub_222AAD514();
  v28 = v20;
  sub_222A71270(&qword_2540C81A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8148);
  sub_222A88520((unint64_t *)&unk_2540C8150, &qword_2540C8148, MEMORY[0x24BEE12C8]);
  sub_222AAD9C4();
  v22 = sub_222AAD940();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(v25);
  *(_QWORD *)(a5 + 200) = v22;
  return a5;
}

uint64_t sub_222AA8080(uint64_t a1)
{
  destroy for StorefrontAppStateController.Configuration(a1);
  return a1;
}

void sub_222AA80AC(BOOL *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24) == 1;
}

unint64_t sub_222AA80C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_222A9C1A0(v1, a1);
}

unint64_t sub_222AA80D8()
{
  uint64_t v0;

  return sub_222AA44A8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_222AA80F0()
{
  return swift_deallocObject();
}

uint64_t sub_222AA8100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;

  v4 = *(_BYTE *)(v1 + 16);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_222A7E220;
  *(_BYTE *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_222AA8168()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_222AA818C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_222A7E0EC;
  *(_BYTE *)(v6 + 64) = v5;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = v4;
  return swift_task_switch();
}

uint64_t sub_222AA8200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_222A9D558(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_222AA8218()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_222AA824C(uint64_t a1)
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
  v8[1] = sub_222A7E0EC;
  return sub_222A9D64C(a1, v4, v5, v7, v6);
}

void sub_222AA82C4(uint64_t a1@<X8>)
{
  sub_222AA8D70(a1);
}

uint64_t sub_222AA82D8@<X0>(unsigned __int8 *a1@<X8>)
{
  uint64_t v1;

  return sub_222A9F4CC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), a1);
}

uint64_t sub_222AA82F4()
{
  return sub_222AA8CC0();
}

_QWORD *sub_222AA8308(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[5];

  v8 = sub_222AAD748();
  v14[3] = v8;
  v14[4] = MEMORY[0x24BE5E330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(boxed_opaque_existential_0, a3, v8);
  a4[2] = a1;
  v10 = sub_222A90B00(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C81D8);
  v11 = swift_allocObject();
  *(_DWORD *)(v11 + 24) = 0;
  *(_QWORD *)(v11 + 16) = v10;
  a4[4] = v11;
  sub_222A723C0(a2, (uint64_t)(a4 + 5));
  sub_222A723C0((uint64_t)v14, (uint64_t)(a4 + 10));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C80E0);
  swift_allocObject();
  v12 = sub_222AAD544();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  a4[3] = v12;
  return a4;
}

uint64_t sub_222AA8408@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v3;
  ValueMetadata *v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  v3 = *(_BYTE *)(v1 + 32);
  v4 = *(ValueMetadata **)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v3;
  result = sub_222A9F2CC((uint64_t)&v6, v4);
  *a1 = result & 1;
  return result;
}

uint64_t sub_222AA8454()
{
  uint64_t v0;

  return sub_222AA4514(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_222AA8474(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_222AA84A8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_222AA84DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F8);
    v3 = sub_222AAD9F4();
    v4 = 0;
    v5 = v3 + 56;
    v6 = ~(-1 << *(_BYTE *)(v3 + 32));
    while (1)
    {
      v7 = *(_QWORD *)(a1 + 32 + 8 * v4);
      result = sub_222AADB74();
      v9 = result & v6;
      v10 = (result & (unint64_t)v6) >> 6;
      v11 = *(_QWORD *)(v5 + 8 * v10);
      v12 = 1 << (result & v6);
      v13 = *(_QWORD *)(v3 + 48);
      if ((v12 & v11) != 0)
      {
        while (*(_QWORD *)(v13 + 8 * v9) != v7)
        {
          v9 = (v9 + 1) & v6;
          v10 = v9 >> 6;
          v11 = *(_QWORD *)(v5 + 8 * (v9 >> 6));
          v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        *(_QWORD *)(v5 + 8 * v10) = v12 | v11;
        *(_QWORD *)(v13 + 8 * v9) = v7;
        v14 = *(_QWORD *)(v3 + 16);
        v15 = __OFADD__(v14, 1);
        v16 = v14 + 1;
        if (v15)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v3 + 16) = v16;
      }
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_222AA85F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C75F0);
    v3 = sub_222AAD9F4();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = (uint64_t *)(v6 + 16 * v4);
      v8 = *v7;
      v9 = *((unsigned __int8 *)v7 + 8);
      sub_222AADB80();
      sub_222AADBA4();
      sub_222AADB8C();
      result = sub_222AADBB0();
      v11 = ~(-1 << *(_BYTE *)(v3 + 32));
      v12 = result & v11;
      v13 = (result & (unint64_t)v11) >> 6;
      v14 = *(_QWORD *)(v5 + 8 * v13);
      v15 = 1 << (result & v11);
      v16 = *(_QWORD *)(v3 + 48);
      if ((v15 & v14) != 0)
      {
        while (1)
        {
          v21 = v16 + 16 * v12;
          if (*(_QWORD *)v21 == v8 && ((v9 ^ *(unsigned __int8 *)(v21 + 8)) & 1) == 0)
            break;
          v12 = (v12 + 1) & v11;
          v13 = v12 >> 6;
          v14 = *(_QWORD *)(v5 + 8 * (v12 >> 6));
          v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0)
            goto LABEL_5;
        }
      }
      else
      {
LABEL_5:
        *(_QWORD *)(v5 + 8 * v13) = v15 | v14;
        v17 = v16 + 16 * v12;
        *(_QWORD *)v17 = v8;
        *(_BYTE *)(v17 + 8) = v9;
        v18 = *(_QWORD *)(v3 + 16);
        v19 = __OFADD__(v18, 1);
        v20 = v18 + 1;
        if (v19)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v3 + 16) = v20;
      }
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

unint64_t sub_222AA8754(unint64_t result)
{
  if (result >= 2)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for StorefrontAppStateController()
{
  return objc_opt_self();
}

uint64_t method lookup function for StorefrontAppStateController()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver()
{
  return objc_opt_self();
}

uint64_t destroy for StorefrontAppStateController.Configuration(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 96);
}

uint64_t initializeWithCopy for StorefrontAppStateController.Configuration(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  __int128 v8;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 48, a2 + 48, v6);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  return a1;
}

uint64_t *assignWithCopy for StorefrontAppStateController.Configuration(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for StorefrontAppStateController.Configuration(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontAppStateController.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StorefrontAppStateController.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StorefrontAppStateController.Configuration()
{
  return &type metadata for StorefrontAppStateController.Configuration;
}

uint64_t *initializeBufferWithCopyOfBuffer for StorefrontAppStateController.DataSourceState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_retain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for StorefrontAppStateController.DataSourceState(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_release();
  return result;
}

unint64_t *assignWithCopy for StorefrontAppStateController.DataSourceState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_retain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_retain();
    swift_release();
  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for StorefrontAppStateController.DataSourceState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_release();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontAppStateController.DataSourceState(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorefrontAppStateController.DataSourceState(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_222AA8C4C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_222AA8C64(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for StorefrontAppStateController.DataSourceState()
{
  return &type metadata for StorefrontAppStateController.DataSourceState;
}

uint64_t sub_222AA8C94()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_222A9B894(v0);
}

uint64_t sub_222AA8CC0()
{
  uint64_t v0;

  return sub_222A9F5C4(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_222AA8CE0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v3;
  ValueMetadata *v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  v3 = *(_BYTE *)(v1 + 32);
  v4 = *(ValueMetadata **)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v3;
  result = sub_222A9F2CC((uint64_t)&v6, v4);
  *a1 = result & 1;
  return result;
}

void sub_222AA8D3C(_BYTE *a1@<X8>)
{
  sub_222AA8D50(a1);
}

void sub_222AA8D50(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_222A9EFE0(*(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

void sub_222AA8D70(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_222A9E324(*(_BYTE **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), *(_QWORD *)(v1 + 48), a1);
}

_QWORD *sub_222AA8D94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
    *a1 = v5;
  return result;
}

uint64_t sub_222AA8DD0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_222AA8DF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA8E18()
{
  uint64_t v0;

  return sub_222AA7B74(*(_QWORD *)(v0 + 16), (uint64_t *)(v0 + 24));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_222AA8E3C()
{
  uint64_t v0;

  sub_222AA2A14(*(_QWORD *)(v0 + 16), **(_QWORD **)(v0 + 24));
}

uint64_t sub_222AA8E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_222AA8E88(uint64_t *a1)
{
  return sub_222AA8EA0(a1) & 1;
}

uint64_t sub_222AA8EA0(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD **)(v1 + 16);
  v3 = *a1;
  v4 = *((_BYTE *)a1 + 8);
  v5 = v2[3];
  v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  v8 = v3;
  v9 = v4;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 56))(&v8, v5, v6) & 1;
}

uint64_t sub_222AA8F18()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA8F54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 80);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_222A7E220;
  *(_QWORD *)(v6 + 48) = v1 + 40;
  *(_QWORD *)(v6 + 56) = v5;
  *(_QWORD *)(v6 + 40) = v4;
  *(_OWORD *)(v6 + 24) = v7;
  *(_QWORD *)(v6 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_222AA8FE0(uint64_t a1, uint64_t a2)
{
  double *v2;
  uint64_t v3;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v8 = *((_QWORD *)v2 + 3);
  v7 = *((_QWORD *)v2 + 4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_222A7E220;
  return sub_222A9B0FC(v6, a1, a2, v8, v7);
}

uint64_t sub_222AA905C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA9088(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_222A7E220;
  return v8(a1);
}

uint64_t sub_222AA9110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_222AAD4B4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_222AA9184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_222AAD4B4() - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_222A7E220;
  v4[2] = v3;
  return swift_task_switch();
}

unint64_t sub_222AA91FC()
{
  unint64_t result;

  result = qword_255768E98;
  if (!qword_255768E98)
  {
    result = MEMORY[0x227677FFC](&unk_222AAFB74, &type metadata for TimedOutError);
    atomic_store(result, &qword_255768E98);
  }
  return result;
}

uint64_t sub_222AA9240(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_222A7E220;
  return sub_222AA2334(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_222AA92D0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA9314(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = v1[5];
  v8 = (uint64_t)(v1 + 6);
  v9 = (uint64_t)(v1 + 11);
  v10 = (_QWORD *)v1[16];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_222A7E220;
  return sub_222AA2670(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_222AA93AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_222A7E220;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255768EB8 + dword_255768EB8))(a1, v4);
}

unint64_t sub_222AA941C(unint64_t result)
{
  if (result >= 2)
    return swift_retain();
  return result;
}

uint64_t sub_222AA942C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA9458(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (_QWORD *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_222A7E220;
  return sub_222AA1194(a1, v4, v5, v6);
}

uint64_t sub_222AA94C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_222AA94EC(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

void sub_222AA9510()
{
  uint64_t v0;

  sub_222AA3774(*(_QWORD *)(v0 + 16), **(_QWORD **)(v0 + 24));
}

uint64_t sub_222AA952C@<X0>(unsigned __int8 *a1@<X8>)
{
  return sub_222AA82D8(a1);
}

unint64_t sub_222AA9550()
{
  return sub_222AA80D8();
}

ValueMetadata *_s7UnknownVMa()
{
  return &_s7UnknownVN;
}

ValueMetadata *_s9UpdatableVMa()
{
  return &_s9UpdatableVN;
}

uint64_t sub_222AA958C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v15;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v15 - v11;
  sub_222A78EE0(a2, (uint64_t)&v15 - v11);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    sub_222A78EE0(a1, (uint64_t)v10);
    v13 = (char *)&loc_222AA96AC + 4 * byte_222AB04B4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  sub_222A759F4((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for State);
  return 0;
}

void sub_222AA96F4()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  sub_222A78EE0(v0, v1);
  JUMPOUT(0x222AA96C4);
}

uint64_t dispatch thunk of UpdateRegistry.entry(forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of UpdateRegistry.addEntry(_:forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of UpdateRegistry.removeEntry(forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of UpdateRegistry.removeEntries(forAdamIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

ValueMetadata *_s7WaitingVMa()
{
  return &_s7WaitingVN;
}

uint64_t sub_222AA97F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v28;

  v4 = type metadata accessor for State();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (unsigned __int8 *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (unsigned __int8 *)&v28 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v28 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v28 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (unsigned __int8 *)&v28 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7EB8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (uint64_t)&v22[*(int *)(v20 + 48)];
  sub_222A78EE0(a1, (uint64_t)v22);
  sub_222A78EE0(a2, v23);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_222A78EE0((uint64_t)v22, (uint64_t)v16);
      if (*v16 == 1)
        goto LABEL_2;
      goto LABEL_18;
    case 2u:
      if (swift_getEnumCaseMultiPayload())
        goto LABEL_18;
      sub_222A78EE0(v23, (uint64_t)v10);
      v24 = *v10;
      goto LABEL_12;
    case 3u:
    case 8u:
LABEL_2:
      if (!swift_getEnumCaseMultiPayload())
        goto LABEL_9;
      goto LABEL_18;
    case 4u:
      sub_222A78EE0((uint64_t)v22, (uint64_t)v13);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      sub_222A759F4((uint64_t)v13, type metadata accessor for AppInstallation);
      if (EnumCaseMultiPayload)
        goto LABEL_18;
LABEL_9:
      v26 = (uint64_t)v22;
      goto LABEL_17;
    case 5u:
      if (swift_getEnumCaseMultiPayload())
        goto LABEL_18;
      sub_222A78EE0(v23, (uint64_t)v7);
      v24 = *v7;
LABEL_12:
      if ((v24 | 2) == 2)
      {
LABEL_16:
        sub_222A759F4(v23, (uint64_t (*)(_QWORD))type metadata accessor for State);
        v26 = (uint64_t)v22;
LABEL_17:
        sub_222A759F4(v26, (uint64_t (*)(_QWORD))type metadata accessor for State);
        return 1;
      }
      else
      {
LABEL_18:
        sub_222A947B8((uint64_t)v22);
        return 0;
      }
    case 6u:
      if (!swift_getEnumCaseMultiPayload())
      {
        sub_222A78EE0(v23, (uint64_t)v18);
        if (*v18 <= 1u)
          goto LABEL_16;
      }
      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

uint64_t sub_222AA9A84(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v5 = a2 & 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for State();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_222A7A648(a1);
    v13 = sub_222A8B258(v5);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_222AAC084();
        v17 = v22;
      }
      sub_222A7A688(*(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, (uint64_t)v8);
      sub_222AABAC4(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_222A7A648((uint64_t)v8);
  }
  else
  {
    sub_222A7A688(a1, (uint64_t)v12);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_222AAC978((uint64_t)v12, v5, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_222AA9C3C(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for State();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_222A7A648(a1);
    v13 = sub_222A8B200(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_222AABE70();
        v17 = v22;
      }
      sub_222A7A688(*(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, (uint64_t)v8);
      sub_222AAB8E4(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_222A7A648((uint64_t)v8);
  }
  else
  {
    sub_222A7A688(a1, (uint64_t)v12);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_222AACA94((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t WaitingAppStateDataSource.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  WaitingAppStateDataSource.init()();
  return v0;
}

_QWORD *WaitingAppStateDataSource.init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0[3] = &unk_24E9745D8;
  v0[2] = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  v0[5] = sub_222AAD778();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  v0[4] = v1;
  return v0;
}

_QWORD *WaitingAppStateDataSource.__allocating_init(supportedAppKinds:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)swift_allocObject();
  v2[3] = a1;
  v2[2] = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  v2[5] = sub_222AAD778();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  v2[4] = v3;
  return v2;
}

_QWORD *WaitingAppStateDataSource.init(supportedAppKinds:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[3] = a1;
  v1[2] = sub_222A90D6C(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8128);
  swift_allocObject();
  v1[5] = sub_222AAD778();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540C82A0);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v1[4] = v2;
  return v1;
}

uint64_t WaitingAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t WaitingAppStateDataSource.load()()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t WaitingAppStateDataSource.reloadState(forAppsWith:synchronizing:)()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t WaitingAppStateDataSource.reloadAllStates(synchronizing:)()
{
  uint64_t v0;

  return sub_222A8AC78(*(uint64_t (**)(void))(v0 + 8));
}

void WaitingAppStateDataSource.state(forAppWith:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, (uint64_t (*)(void))sub_222AAD228);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_222AAA050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_222A8B200(a2), (v8 & 1) != 0))
  {
    v9 = v7;
    v10 = *(_QWORD *)(v6 + 56);
    v11 = type metadata accessor for State();
    v12 = *(_QWORD *)(v11 - 8);
    sub_222A78EE0(v10 + *(_QWORD *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

uint64_t WaitingAppStateDataSource.setWaiting(forAppWith:installationType:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, sub_222AAD240);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_222AAA194(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v7 = a3;
  v8 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  swift_beginAccess();
  sub_222AA9C3C((uint64_t)v7, a2);
  return swift_endAccess();
}

uint64_t WaitingAppStateDataSource.clearWaiting(forAppWith:)()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A8F708(v2, sub_222AAD25C);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_222AAA2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7E30);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v8 = sub_222A8B200(a2);
  if ((v9 & 1) != 0)
  {
    v10 = v8;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v7;
    v18 = *v7;
    *v7 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_222AABE70();
      v12 = v18;
    }
    v13 = *(_QWORD *)(v12 + 56);
    v14 = type metadata accessor for State();
    v15 = *(_QWORD *)(v14 - 8);
    sub_222A7A688(v13 + *(_QWORD *)(v15 + 72) * v10, (uint64_t)v6);
    sub_222AAB8E4(v10, v12);
    *v7 = v12;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v6, 0, 1, v14);
  }
  else
  {
    v16 = type metadata accessor for State();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  swift_endAccess();
  return sub_222A7A648((uint64_t)v6);
}

uint64_t WaitingAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  BOOL v8;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0;
  v4 = (unsigned __int8 *)(v2 + 32);
  v5 = v3 - 1;
  do
  {
    v6 = *(unsigned __int8 *)(a1 + 8) ^ *v4;
    v8 = v5-- != 0;
    if ((v6 & 1) == 0)
      break;
    ++v4;
  }
  while (v8);
  return (v6 ^ 1) & 1;
}

uint64_t WaitingAppStateDataSource.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t WaitingAppStateDataSource.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_222AAA4F0()
{
  return swift_retain();
}

void sub_222AAA4FC()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_222AAA56C(uint64_t a1)
{
  return WaitingAppStateDataSource.providesState(forApp:)(a1) & 1;
}

uint64_t sub_222AAA590()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_222AAA604()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_222A9A3F8(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_222AAA670(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;

  v3 = v2;
  v5 = type metadata accessor for State();
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8218);
  v38 = a2;
  result = sub_222AADA9C();
  v10 = result;
  if (*(_QWORD *)(v8 + 16))
  {
    v34 = v2;
    v11 = 0;
    v12 = *(_QWORD *)(v8 + 64);
    v36 = (_QWORD *)(v8 + 64);
    v13 = 1 << *(_BYTE *)(v8 + 32);
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & v12;
    v35 = (unint64_t)(v13 + 63) >> 6;
    v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v19 = v18 | (v11 << 6);
      }
      else
      {
        v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        result = (uint64_t)v36;
        if (v20 >= v35)
          goto LABEL_34;
        v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          v11 = v20 + 1;
          if (v20 + 1 >= v35)
            goto LABEL_34;
          v21 = v36[v11];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_41;
              }
              v33 = 1 << *(_BYTE *)(v8 + 32);
              if (v33 >= 64)
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v36 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v8 + 16) = 0;
              break;
            }
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v11 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_43;
                if (v11 >= v35)
                  goto LABEL_34;
                v21 = v36[v11];
                ++v22;
                if (v21)
                  goto LABEL_21;
              }
            }
            v11 = v22;
          }
        }
LABEL_21:
        v15 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      v23 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v19);
      v24 = *(_QWORD *)(v37 + 72);
      v25 = *(_QWORD *)(v8 + 56) + v24 * v19;
      if ((v38 & 1) != 0)
        sub_222A7A688(v25, (uint64_t)v7);
      else
        sub_222A78EE0(v25, (uint64_t)v7);
      sub_222AADB80();
      sub_222AADBA4();
      result = sub_222AADBB0();
      v26 = -1 << *(_BYTE *)(v10 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v17) = v23;
      result = sub_222A7A688((uint64_t)v7, *(_QWORD *)(v10 + 56) + v24 * v17);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v10;
  return result;
}

uint64_t sub_222AAA99C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;

  v3 = v2;
  v5 = type metadata accessor for State();
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8200);
  v38 = a2;
  result = sub_222AADA9C();
  v10 = result;
  if (*(_QWORD *)(v8 + 16))
  {
    v34 = v2;
    v11 = 0;
    v12 = *(_QWORD *)(v8 + 64);
    v36 = (_QWORD *)(v8 + 64);
    v13 = 1 << *(_BYTE *)(v8 + 32);
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & v12;
    v35 = (unint64_t)(v13 + 63) >> 6;
    v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v19 = v18 | (v11 << 6);
      }
      else
      {
        v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        result = (uint64_t)v36;
        if (v20 >= v35)
          goto LABEL_34;
        v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          v11 = v20 + 1;
          if (v20 + 1 >= v35)
            goto LABEL_34;
          v21 = v36[v11];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_41;
              }
              v33 = 1 << *(_BYTE *)(v8 + 32);
              if (v33 >= 64)
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v36 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v8 + 16) = 0;
              break;
            }
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v11 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_43;
                if (v11 >= v35)
                  goto LABEL_34;
                v21 = v36[v11];
                ++v22;
                if (v21)
                  goto LABEL_21;
              }
            }
            v11 = v22;
          }
        }
LABEL_21:
        v15 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      v23 = *(_BYTE *)(*(_QWORD *)(v8 + 48) + v19);
      v24 = *(_QWORD *)(v37 + 72);
      v25 = *(_QWORD *)(v8 + 56) + v24 * v19;
      if ((v38 & 1) != 0)
        sub_222A7A688(v25, (uint64_t)v7);
      else
        sub_222A78EE0(v25, (uint64_t)v7);
      sub_222AADB80();
      sub_222AADB8C();
      result = sub_222AADBB0();
      v26 = -1 << *(_BYTE *)(v10 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_BYTE *)(*(_QWORD *)(v10 + 48) + v17) = v23;
      result = sub_222A7A688((uint64_t)v7, *(_QWORD *)(v10 + 56) + v24 * v17);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v10;
  return result;
}

uint64_t sub_222AAACC8(uint64_t a1, char a2)
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
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C76A8);
  v37 = a2;
  v6 = sub_222AADA9C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_222AADB80();
    sub_222AAD7CC();
    result = sub_222AADBB0();
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
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_222AAAFD0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  char v33;
  __int128 v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768C30);
  v33 = a2;
  result = sub_222AADA9C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((v33 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = *(_QWORD *)(v5 + 56) + 24 * v19;
      v34 = *(_OWORD *)v28;
      v29 = *(_QWORD *)(v28 + 16);
      if ((v33 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_222AADB80();
      sub_222AADBA4();
      result = sub_222AADBB0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = *(_QWORD *)(v7 + 56) + 24 * v16;
      *(_OWORD *)v17 = v34;
      *(_QWORD *)(v17 + 16) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_222AAB2C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7380);
  result = sub_222AADA9C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        swift_retain();
      sub_222AADB80();
      sub_222AADBA4();
      result = sub_222AADBB0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_222AAB5A0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7370);
  v39 = a2;
  result = sub_222AADA9C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v37 = (_QWORD *)(v5 + 64);
    v38 = v5;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v37;
        if (v21 >= v36)
          goto LABEL_33;
        v22 = v37[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_33;
          v22 = v37[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              if ((v39 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v35 = 1 << *(_BYTE *)(v5 + 32);
              if (v35 >= 64)
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v37 = -1 << v35;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v36)
                  goto LABEL_33;
                v22 = v37[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = *(_QWORD *)(v5 + 48) + 16 * v20;
      v29 = *(_QWORD *)v28;
      v30 = *(_BYTE *)(v28 + 8);
      v31 = *(_QWORD *)(v5 + 56) + 56 * v20;
      v40 = *(_OWORD *)v31;
      v32 = *(_BYTE *)(v31 + 16);
      v33 = *(_QWORD *)(v31 + 32);
      v34 = *(_QWORD *)(v31 + 48);
      v41 = *(_QWORD *)(v31 + 40);
      v42 = *(_QWORD *)(v31 + 24);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_222AADB80();
      sub_222AADBA4();
      sub_222AADB8C();
      result = sub_222AADBB0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v15 == v25;
          if (v15 == v25)
            v15 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = *(_QWORD *)(v7 + 48) + 16 * v16;
      *(_QWORD *)v17 = v29;
      *(_BYTE *)(v17 + 8) = v30;
      v18 = *(_QWORD *)(v7 + 56) + 56 * v16;
      *(_OWORD *)v18 = v40;
      *(_BYTE *)(v18 + 16) = v32;
      *(_QWORD *)(v18 + 24) = v42;
      *(_QWORD *)(v18 + 32) = v33;
      *(_QWORD *)(v18 + 40) = v41;
      *(_QWORD *)(v18 + 48) = v34;
      ++*(_QWORD *)(v7 + 16);
      v5 = v38;
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_222AAB8E4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_222AAD9D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_222AADB80();
        sub_222AADBA4();
        result = sub_222AADBB0();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v9 < v8)
          goto LABEL_11;
LABEL_12:
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v3);
        v12 = (_QWORD *)(v10 + 8 * v6);
        if (v3 != v6 || v11 >= v12 + 1)
          *v11 = *v12;
        v13 = *(_QWORD *)(a2 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for State() - 8) + 72);
        v15 = v14 * v3;
        result = v13 + v14 * v3;
        v16 = v14 * v6;
        v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v15 == v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v9 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v9)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_222AABAC4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_222AAD9D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_222AADB80();
        sub_222AADB8C();
        result = sub_222AADBB0();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v9 < v8)
          goto LABEL_11;
LABEL_12:
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_BYTE *)(v10 + v3);
        v12 = (_BYTE *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1)
          *v11 = *v12;
        v13 = *(_QWORD *)(a2 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for State() - 8) + 72);
        v15 = v14 * v3;
        result = v13 + v14 * v3;
        v16 = v14 * v6;
        v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v15 == v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v9 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v9)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_222AABCA4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_222AAD9D0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_222AADB80();
        sub_222AADBA4();
        result = sub_222AADBB0();
        v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_QWORD *)(v11 + 8 * v3);
          v13 = (_QWORD *)(v11 + 8 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = v14 + 24 * v3;
          v16 = (__int128 *)(v14 + 24 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            v9 = *v16;
            *(_QWORD *)(v15 + 16) = *((_QWORD *)v16 + 2);
            *(_OWORD *)v15 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_222AABE70()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  uint64_t v9;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for State();
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8218);
  v5 = *v0;
  v6 = sub_222AADA90();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = v5 + 64;
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v16)
        goto LABEL_26;
      v23 = *(_QWORD *)(v9 + 8 * v12);
      if (!v23)
        break;
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = 8 * v18;
    v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v18);
    v21 = *(_QWORD *)(v26 + 72) * v18;
    sub_222A78EE0(*(_QWORD *)(v5 + 56) + v21, (uint64_t)v4);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v20;
    result = (void *)sub_222A7A688((uint64_t)v4, *(_QWORD *)(v7 + 56) + v21);
  }
  v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v9 + 8 * v24);
  if (v23)
  {
    v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_222AAC084()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  uint64_t v9;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;

  v1 = v0;
  v2 = type metadata accessor for State();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C8200);
  v5 = *v0;
  v6 = sub_222AADA90();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v24 = v1;
  result = (void *)(v6 + 64);
  v9 = v5 + 64;
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v9 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v9 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v18);
    v20 = *(_QWORD *)(v25 + 72) * v18;
    sub_222A78EE0(*(_QWORD *)(v5 + 56) + v20, (uint64_t)v4);
    *(_BYTE *)(*(_QWORD *)(v7 + 48) + v18) = v19;
    result = (void *)sub_222A7A688((uint64_t)v4, *(_QWORD *)(v7 + 56) + v20);
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v9 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v9 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_222AAC294()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C76A8);
  v2 = *v0;
  v3 = sub_222AADA90();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_222AAC440()
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255768C30);
  v2 = *v0;
  v3 = sub_222AADA90();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 24 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_QWORD *)(v19 + 16);
    v21 = *(_OWORD *)v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = *(_QWORD *)(v4 + 56) + v18;
    *(_OWORD *)v22 = v21;
    *(_QWORD *)(v22 + 16) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_222AAC5F8()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7380);
  v2 = *v0;
  v3 = sub_222AADA90();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_222AAC798()
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C7370);
  v2 = *v0;
  v3 = sub_222AADA90();
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
    v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      v9 = v29 + 1;
      if (v29 + 1 >= v13)
        goto LABEL_26;
      v30 = *(_QWORD *)(v6 + 8 * v9);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 16 * v15;
    v18 = *(_QWORD *)v17;
    LOBYTE(v17) = *(_BYTE *)(v17 + 8);
    v19 = 56 * v15;
    v20 = *(_QWORD *)(v2 + 56) + v19;
    v21 = *(_BYTE *)(v20 + 16);
    v23 = *(_QWORD *)(v20 + 24);
    v22 = *(_QWORD *)(v20 + 32);
    v24 = *(_QWORD *)(v20 + 40);
    v25 = *(_QWORD *)(v20 + 48);
    v26 = *(_QWORD *)(v4 + 48) + v16;
    v27 = *(_OWORD *)v20;
    *(_QWORD *)v26 = v18;
    *(_BYTE *)(v26 + 8) = v17;
    v28 = *(_QWORD *)(v4 + 56) + v19;
    *(_OWORD *)v28 = v27;
    *(_BYTE *)(v28 + 16) = v21;
    *(_QWORD *)(v28 + 24) = v23;
    *(_QWORD *)(v28 + 32) = v22;
    *(_QWORD *)(v28 + 40) = v24;
    *(_QWORD *)(v28 + 48) = v25;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v31 = v29 + 2;
  if (v31 >= v13)
    goto LABEL_26;
  v30 = *(_QWORD *)(v6 + 8 * v31);
  if (v30)
  {
    v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v9);
    ++v31;
    if (v30)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_222AAC978(uint64_t a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  char v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v7 = a2 & 1;
  v8 = (_QWORD *)*v3;
  v10 = sub_222A8B258(a2 & 1);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = v17 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for State() - 8) + 72) * v10;
        return sub_222AAD2B0(a1, v18);
      }
      return sub_222AAD0B0(v10, v7, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_222AAC084();
      goto LABEL_7;
    }
    sub_222AAA99C(v13, a3 & 1);
    v20 = sub_222A8B258(v7);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_222AAD0B0(v10, v7, a1, v16);
    }
  }
  result = sub_222AADB14();
  __break(1u);
  return result;
}

uint64_t sub_222AACA94(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_222A8B200(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = v17 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for State() - 8) + 72) * v10;
        return sub_222AAD2B0(a1, v18);
      }
      return sub_222AAD138(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_222AABE70();
      goto LABEL_7;
    }
    sub_222AAA670(v13, a3 & 1);
    v20 = sub_222A8B200(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_222AAD138(v10, a2, a1, v16);
    }
  }
  result = sub_222AADB14();
  __break(1u);
  return result;
}

uint64_t sub_222AACBB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_222A8B30C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_222AAC294();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_222AAACC8(result, a4 & 1);
  result = sub_222A8B30C(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_222AADB14();
  __break(1u);
  return result;
}

uint64_t sub_222AACD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v6 = v5;
  v12 = *v5;
  v14 = sub_222A8B200(a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= result && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= result && (a5 & 1) == 0)
  {
    result = (uint64_t)sub_222AAC440();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 24 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      v21[2] = a3;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    *(_QWORD *)(v20[6] + 8 * v14) = a4;
    v23 = (_QWORD *)(v20[7] + 24 * v14);
    *v23 = a1;
    v23[1] = a2;
    v23[2] = a3;
    v24 = v20[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_222AAAFD0(result, a5 & 1);
  result = sub_222A8B200(a4);
  if ((v18 & 1) == (v22 & 1))
  {
    v14 = result;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_222AADB14();
  __break(1u);
  return result;
}

uint64_t sub_222AACE58(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_222A8B200(a2);
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
    result = (uint64_t)sub_222AAC5F8();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_release();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_222AAB2C8(result, a3 & 1);
  result = sub_222A8B200(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_222AADB14();
  __break(1u);
  return result;
}

unint64_t sub_222AACF90(uint64_t a1, uint64_t a2, char a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  char v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t result;
  unint64_t v20;
  char v21;

  v5 = (_QWORD **)v4;
  v9 = a3 & 1;
  v10 = (_QWORD *)*v4;
  v12 = sub_222A8B188(a2, a3 & 1);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_222AAD2F4(a1, v18[7] + 56 * v12);
      return sub_222AAD1BC(v12, a2, v9, a1, v18);
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_222AAC798();
      goto LABEL_7;
    }
    sub_222AAB5A0(v15, a4 & 1);
    v20 = sub_222A8B188(a2, v9);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_222AAD2F4(a1, v18[7] + 56 * v12);
      return sub_222AAD1BC(v12, a2, v9, a1, v18);
    }
  }
  result = sub_222AADB14();
  __break(1u);
  return result;
}

uint64_t sub_222AAD0B0(unint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2 & 1;
  v7 = a4[7];
  v8 = type metadata accessor for State();
  result = sub_222A7A688(a3, v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

uint64_t sub_222AAD138(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = type metadata accessor for State();
  result = sub_222A7A688(a3, v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

unint64_t sub_222AAD1BC(unint64_t result, uint64_t a2, char a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = a5[6] + 16 * result;
  *(_QWORD *)v5 = a2;
  *(_BYTE *)(v5 + 8) = a3 & 1;
  v6 = a5[7] + 56 * result;
  v7 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a4;
  *(_OWORD *)(v6 + 16) = v7;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a4 + 32);
  *(_QWORD *)(v6 + 48) = *(_QWORD *)(a4 + 48);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_222AAD228@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_222AAA050(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_222AAD240()
{
  uint64_t v0;

  return sub_222AAA194(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_222AAD25C()
{
  uint64_t v0;

  return sub_222AAA2D8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t type metadata accessor for WaitingAppStateDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for WaitingAppStateDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WaitingAppStateDataSource.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of WaitingAppStateDataSource.__allocating_init(supportedAppKinds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_222AAD2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_222AAD2F4(uint64_t a1, uint64_t a2)
{
  assignWithTake for AppOffer(a2, a1);
  return a2;
}

uint64_t sub_222AAD330()
{
  return sub_222AAD25C();
}

uint64_t sub_222AAD344@<X0>(uint64_t a1@<X8>)
{
  return sub_222AAD228(a1);
}

uint64_t sub_222AAD358()
{
  return sub_222AAD240();
}

ValueMetadata *_s8WildcardVMa()
{
  return &_s8WildcardVN;
}

uint64_t sub_222AAD37C()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_222AAD388()
{
  return MEMORY[0x24BDCB900]();
}

uint64_t sub_222AAD394()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_222AAD3A0()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_222AAD3AC()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_222AAD3B8()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_222AAD3C4()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_222AAD3D0()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_222AAD3DC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_222AAD3E8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_222AAD3F4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_222AAD400()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_222AAD40C()
{
  return MEMORY[0x24BDCC930]();
}

uint64_t sub_222AAD418()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_222AAD424()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_222AAD430()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_222AAD43C()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_222AAD448()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_222AAD454()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_222AAD460()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_222AAD46C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_222AAD478()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_222AAD484()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_222AAD490()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_222AAD49C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_222AAD4A8()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_222AAD4B4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_222AAD4C0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_222AAD4CC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_222AAD4D8()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_222AAD4E4()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_222AAD4F0()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_222AAD4FC()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_222AAD508()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_222AAD514()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_222AAD520()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_222AAD52C()
{
  return MEMORY[0x24BE5C3C0]();
}

uint64_t sub_222AAD538()
{
  return MEMORY[0x24BE5C5A8]();
}

uint64_t sub_222AAD544()
{
  return MEMORY[0x24BE5C5B0]();
}

uint64_t sub_222AAD550()
{
  return MEMORY[0x24BE5C758]();
}

uint64_t sub_222AAD55C()
{
  return MEMORY[0x24BE5C770]();
}

uint64_t sub_222AAD568()
{
  return MEMORY[0x24BE5C778]();
}

uint64_t sub_222AAD574()
{
  return MEMORY[0x24BE5C780]();
}

uint64_t sub_222AAD580()
{
  return MEMORY[0x24BE5C788]();
}

uint64_t sub_222AAD58C()
{
  return MEMORY[0x24BE5C790]();
}

uint64_t sub_222AAD598()
{
  return MEMORY[0x24BE5C798]();
}

uint64_t sub_222AAD5A4()
{
  return MEMORY[0x24BE5C7A0]();
}

uint64_t sub_222AAD5B0()
{
  return MEMORY[0x24BE5C7C0]();
}

uint64_t sub_222AAD5BC()
{
  return MEMORY[0x24BE5CAF0]();
}

uint64_t sub_222AAD5C8()
{
  return MEMORY[0x24BE5CAF8]();
}

uint64_t sub_222AAD5D4()
{
  return MEMORY[0x24BE5CC70]();
}

uint64_t sub_222AAD5E0()
{
  return MEMORY[0x24BE5CEA8]();
}

uint64_t sub_222AAD5EC()
{
  return MEMORY[0x24BE5CEC0]();
}

uint64_t sub_222AAD5F8()
{
  return MEMORY[0x24BE5CEC8]();
}

uint64_t sub_222AAD604()
{
  return MEMORY[0x24BE5CF98]();
}

uint64_t sub_222AAD610()
{
  return MEMORY[0x24BE5CFE8]();
}

uint64_t sub_222AAD61C()
{
  return MEMORY[0x24BE5D378]();
}

uint64_t sub_222AAD628()
{
  return MEMORY[0x24BE5D380]();
}

uint64_t sub_222AAD634()
{
  return MEMORY[0x24BE5DD78]();
}

uint64_t sub_222AAD640()
{
  return MEMORY[0x24BE5DDA8]();
}

uint64_t sub_222AAD64C()
{
  return MEMORY[0x24BE5DDD8]();
}

uint64_t sub_222AAD658()
{
  return MEMORY[0x24BE5DE08]();
}

uint64_t sub_222AAD664()
{
  return MEMORY[0x24BE5DE48]();
}

uint64_t sub_222AAD670()
{
  return MEMORY[0x24BE5DE58]();
}

uint64_t sub_222AAD67C()
{
  return MEMORY[0x24BE5DE88]();
}

uint64_t sub_222AAD688()
{
  return MEMORY[0x24BE5DE90]();
}

uint64_t sub_222AAD694()
{
  return MEMORY[0x24BE5DE98]();
}

uint64_t sub_222AAD6A0()
{
  return MEMORY[0x24BE5DEA0]();
}

uint64_t sub_222AAD6AC()
{
  return MEMORY[0x24BE5E120]();
}

uint64_t sub_222AAD6B8()
{
  return MEMORY[0x24BE5E128]();
}

uint64_t sub_222AAD6C4()
{
  return MEMORY[0x24BE5E130]();
}

uint64_t sub_222AAD6D0()
{
  return MEMORY[0x24BE5E138]();
}

uint64_t sub_222AAD6DC()
{
  return MEMORY[0x24BE5E238]();
}

uint64_t sub_222AAD6E8()
{
  return MEMORY[0x24BE5E248]();
}

uint64_t sub_222AAD6F4()
{
  return MEMORY[0x24BE5E250]();
}

uint64_t sub_222AAD700()
{
  return MEMORY[0x24BE5E258]();
}

uint64_t sub_222AAD70C()
{
  return MEMORY[0x24BE5E260]();
}

uint64_t sub_222AAD718()
{
  return MEMORY[0x24BE5E268]();
}

uint64_t sub_222AAD724()
{
  return MEMORY[0x24BE5E310]();
}

uint64_t sub_222AAD730()
{
  return MEMORY[0x24BE5E320]();
}

uint64_t sub_222AAD73C()
{
  return MEMORY[0x24BE5E328]();
}

uint64_t sub_222AAD748()
{
  return MEMORY[0x24BE5E338]();
}

uint64_t sub_222AAD754()
{
  return MEMORY[0x24BE5E470]();
}

uint64_t sub_222AAD760()
{
  return MEMORY[0x24BE5E478]();
}

uint64_t sub_222AAD76C()
{
  return MEMORY[0x24BE5E480]();
}

uint64_t sub_222AAD778()
{
  return MEMORY[0x24BE5E488]();
}

uint64_t sub_222AAD784()
{
  return MEMORY[0x24BEE0298]();
}

uint64_t sub_222AAD790()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_222AAD79C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_222AAD7A8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_222AAD7B4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_222AAD7C0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_222AAD7CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_222AAD7D8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_222AAD7E4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_222AAD7F0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_222AAD7FC()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_222AAD808()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_222AAD814()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_222AAD820()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_222AAD82C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_222AAD838()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_222AAD844()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_222AAD850()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_222AAD85C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_222AAD868()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_222AAD874()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_222AAD880()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_222AAD88C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_222AAD898()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_222AAD8A4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_222AAD8B0()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_222AAD8BC()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_222AAD8C8()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_222AAD8D4()
{
  return MEMORY[0x24BEE6B98]();
}

uint64_t sub_222AAD8E0()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_222AAD8EC()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_222AAD8F8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_222AAD904()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_222AAD910()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_222AAD91C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_222AAD928()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_222AAD934()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_222AAD940()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_222AAD94C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_222AAD958()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_222AAD964()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_222AAD970()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_222AAD97C()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_222AAD988()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_222AAD994()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_222AAD9A0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_222AAD9AC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_222AAD9B8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_222AAD9C4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_222AAD9D0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_222AAD9DC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_222AAD9E8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_222AAD9F4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_222AADA00()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_222AADA0C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_222AADA18()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_222AADA24()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_222AADA30()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_222AADA3C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_222AADA48()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_222AADA54()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_222AADA60()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_222AADA6C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_222AADA78()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_222AADA84()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_222AADA90()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_222AADA9C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_222AADAA8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_222AADAB4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_222AADAC0()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_222AADACC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_222AADAD8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_222AADAE4()
{
  return MEMORY[0x24BEE3D60]();
}

uint64_t sub_222AADAF0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_222AADAFC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_222AADB08()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_222AADB14()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_222AADB20()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_222AADB2C()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_222AADB38()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_222AADB44()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_222AADB50()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_222AADB5C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_222AADB68()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_222AADB74()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_222AADB80()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_222AADB8C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_222AADB98()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_222AADBA4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_222AADBB0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_222AADBBC()
{
  return MEMORY[0x24BEE4A98]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x24BED3BC0]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x24BED3BE0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF8]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

