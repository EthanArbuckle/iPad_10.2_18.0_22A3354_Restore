double HUDefaultSizeForIconSize(uint64_t a1)
{
  double result;
  double v2;

  result = 16.0;
  switch(a1)
  {
    case 0:
    case 2:
      result = 24.0;
      break;
    case 3:
      v2 = 32.0;
      goto LABEL_5;
    case 4:
      v2 = 48.0;
LABEL_5:
      result = v2;
      break;
    case 5:
      result = *MEMORY[0x24BDF7FB8];
      break;
    default:
      return result;
  }
  return result;
}

void sub_23EB86510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23EB86A08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_23EB86A5C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23EB86AA4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB86B00()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23EB86B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23EB86B98())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ScheduleRuleList.rules.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *ScheduleRuleList.__allocating_init(rules:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (_QWORD *)swift_allocObject();
  v2[4] = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    v3 = sub_23EB86CE4();
  }
  else
  {
    v3 = 0;
    v4 = 0xE000000000000000;
  }
  v2[2] = v3;
  v2[3] = v4;
  return v2;
}

_QWORD *ScheduleRuleList.init(rules:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;

  v1[4] = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    v2 = sub_23EB86CE4();
  }
  else
  {
    v2 = 0;
    v3 = 0xE000000000000000;
  }
  v1[2] = v2;
  v1[3] = v3;
  return v1;
}

uint64_t sub_23EB86CE4()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_23EB94F88();
  v1 = (id)HFLocalizedString();

  v2 = sub_23EB94F94();
  return v2;
}

uint64_t type metadata accessor for ScheduleRuleDisplayInfo()
{
  uint64_t result;

  result = qword_256DB5188;
  if (!qword_256DB5188)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ScheduleRuleList.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScheduleRuleList.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23EB86E1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ScheduleRuleList();
  result = sub_23EB94D48();
  *a1 = result;
  return result;
}

uint64_t ScheduleRuleDisplayInfo.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EB94CD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ScheduleRuleDisplayInfo.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EB94CD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*ScheduleRuleDisplayInfo.id.modify())()
{
  return CGSizeMake;
}

uint64_t ScheduleRuleDisplayInfo.type.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ScheduleRuleDisplayInfo();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ScheduleRuleDisplayInfo.primaryText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ScheduleRuleDisplayInfo() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScheduleRuleDisplayInfo.secondaryText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ScheduleRuleDisplayInfo() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

int *ScheduleRuleDisplayInfo.init(id:type:primaryText:secondaryText:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v13;
  uint64_t v14;
  int *result;
  _QWORD *v16;
  _QWORD *v17;

  v13 = *a2;
  v14 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a7, a1, v14);
  result = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  *(_BYTE *)(a7 + result[5]) = v13;
  v16 = (_QWORD *)(a7 + result[6]);
  *v16 = a3;
  v16[1] = a4;
  v17 = (_QWORD *)(a7 + result[7]);
  *v17 = a5;
  v17[1] = a6;
  return result;
}

BOOL static ScheduleRuleDisplayInfo.ScheduleType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ScheduleRuleDisplayInfo.ScheduleType.hash(into:)()
{
  return sub_23EB95168();
}

uint64_t ScheduleRuleDisplayInfo.ScheduleType.hashValue.getter()
{
  sub_23EB9515C();
  sub_23EB95168();
  return sub_23EB95180();
}

BOOL sub_23EB87094(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23EB870A8()
{
  sub_23EB9515C();
  sub_23EB95168();
  return sub_23EB95180();
}

uint64_t sub_23EB870EC()
{
  return sub_23EB95168();
}

uint64_t sub_23EB87114()
{
  sub_23EB9515C();
  sub_23EB95168();
  return sub_23EB95180();
}

uint64_t ScheduleRuleDisplayInfo.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23EB94CD0();
  sub_23EB87638(&qword_256DB5058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EB94F7C();
  v1 = type metadata accessor for ScheduleRuleDisplayInfo();
  sub_23EB95168();
  swift_bridgeObjectRetain();
  sub_23EB94FA0();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + *(int *)(v1 + 28) + 8))
    return sub_23EB95174();
  sub_23EB95174();
  swift_bridgeObjectRetain();
  sub_23EB94FA0();
  return swift_bridgeObjectRelease();
}

uint64_t ScheduleRuleDisplayInfo.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_23EB9515C();
  sub_23EB94CD0();
  sub_23EB87638(&qword_256DB5058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EB94F7C();
  v1 = type metadata accessor for ScheduleRuleDisplayInfo();
  sub_23EB95168();
  swift_bridgeObjectRetain();
  sub_23EB94FA0();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 28) + 8))
  {
    sub_23EB95174();
    swift_bridgeObjectRetain();
    sub_23EB94FA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23EB95174();
  }
  return sub_23EB95180();
}

uint64_t sub_23EB87374@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23EB94CD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23EB873B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23EB9515C();
  sub_23EB94CD0();
  sub_23EB87638(&qword_256DB5058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23EB94F7C();
  sub_23EB95168();
  swift_bridgeObjectRetain();
  sub_23EB94FA0();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + *(int *)(a2 + 28) + 8))
  {
    sub_23EB95174();
    swift_bridgeObjectRetain();
    sub_23EB94FA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23EB95174();
  }
  return sub_23EB95180();
}

uint64_t _s12HomeUICommon23ScheduleRuleDisplayInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;

  if ((sub_23EB94CAC() & 1) == 0)
    return 0;
  v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    return 0;
  v5 = v4;
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = v7 == *v9 && v8 == v9[1];
  if (v10 || (v11 = sub_23EB95150(), result = 0, (v11 & 1) != 0))
  {
    v13 = *(int *)(v5 + 28);
    v14 = (_QWORD *)(a1 + v13);
    v15 = *(_QWORD *)(a1 + v13 + 8);
    v16 = (_QWORD *)(a2 + v13);
    v17 = v16[1];
    if (v15)
    {
      if (v17)
      {
        v18 = *v14 == *v16 && v15 == v17;
        if (v18 || (sub_23EB95150() & 1) != 0)
          return 1;
      }
    }
    else if (!v17)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_23EB8758C()
{
  return MEMORY[0x24BDB9D70];
}

unint64_t sub_23EB8759C()
{
  unint64_t result;

  result = qword_256DB5060;
  if (!qword_256DB5060)
  {
    result = MEMORY[0x24265A42C](&protocol conformance descriptor for ScheduleRuleDisplayInfo.ScheduleType, &type metadata for ScheduleRuleDisplayInfo.ScheduleType);
    atomic_store(result, (unint64_t *)&qword_256DB5060);
  }
  return result;
}

uint64_t sub_23EB875E0()
{
  return sub_23EB87638(&qword_256DB5058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_23EB8760C()
{
  return sub_23EB87638(&qword_256DB5068, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleDisplayInfo, (uint64_t)&protocol conformance descriptor for ScheduleRuleDisplayInfo);
}

uint64_t sub_23EB87638(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24265A42C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ScheduleRuleList()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScheduleRuleList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScheduleRuleList.title.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ScheduleRuleList.title.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ScheduleRuleList.title.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ScheduleRuleList.__allocating_init(rules:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ScheduleRuleDisplayInfo(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23EB94CD0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ScheduleRuleDisplayInfo(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for ScheduleRuleDisplayInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduleRuleDisplayInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EB87A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23EB94CD0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ScheduleRuleDisplayInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EB87AB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23EB94CD0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23EB87B34()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EB94CD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScheduleRuleDisplayInfo.ScheduleType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScheduleRuleDisplayInfo.ScheduleType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB87CA4 + 4 * byte_23EB963B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23EB87CD8 + 4 * byte_23EB963B0[v4]))();
}

uint64_t sub_23EB87CD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB87CE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB87CE8);
  return result;
}

uint64_t sub_23EB87CF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB87CFCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23EB87D00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB87D08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB87D14(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23EB87D1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScheduleRuleDisplayInfo.ScheduleType()
{
  return &type metadata for ScheduleRuleDisplayInfo.ScheduleType;
}

void type metadata accessor for HUIconSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256DB51C8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256DB51C8);
  }
}

uint64_t SwiftUICanary.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_23EB94D9C();
  result = sub_23EB94ED4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23EB87E00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EB87E18()
{
  return sub_23EB94F04();
}

uint64_t sub_23EB87E30@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_23EB94D9C();
  result = sub_23EB94ED4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

ValueMetadata *type metadata accessor for SwiftUICanary()
{
  return &type metadata for SwiftUICanary;
}

uint64_t sub_23EB87EB4()
{
  return MEMORY[0x24BDF1F80];
}

HomeUICommon::IconViewStyling_optional __swiftcall IconViewStyling.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (HomeUICommon::IconViewStyling_optional)rawValue;
}

uint64_t IconViewStyling.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_23EB87EE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_QWORD *sub_23EB87EFC@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_23EB87F1C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t IconViewWrapper.init(iconDescriptor:iconSize:styling:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4;

  v4 = *a3;
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = v4;
  return result;
}

uint64_t IconViewWrapper.iconDescriptor.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t IconViewWrapper.iconDescriptor.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*IconViewWrapper.iconDescriptor.modify())()
{
  return CGSizeMake;
}

uint64_t IconViewWrapper.iconSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t IconViewWrapper.iconSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*IconViewWrapper.iconSize.modify())()
{
  return CGSizeMake;
}

void IconViewWrapper.appearanceStyling.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *IconViewWrapper.appearanceStyling.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*IconViewWrapper.appearanceStyling.modify())()
{
  return CGSizeMake;
}

id IconViewWrapper.makeUIView(context:)()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)HUIconView), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_updateWithIconDescriptor_displayStyle_animated_, v1, 1, 0);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  return v4;
}

id IconViewWrapper.updateUIView(_:context:)(id a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;

  v3 = *v1;
  v4 = v1[1];
  if (!*v1)
  {
    objc_msgSend(a1, sel_setVibrancyEffect_, 0);
    v17 = 1;
    goto LABEL_15;
  }
  v5 = *((unsigned __int8 *)v1 + 16);
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    swift_unknownObjectRetain();
    v8 = objc_msgSend(v7, sel_state);
    v9 = sub_23EB94F94();
    v11 = v10;
    if (v9 == sub_23EB94F94() && v11 == v12)
    {

      swift_bridgeObjectRelease_n();
      if (v5)
        goto LABEL_8;
    }
    else
    {
      v14 = sub_23EB95150();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & v5 & 1) != 0)
      {
LABEL_8:
        v15 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
        v16 = objc_msgSend((id)objc_opt_self(), sel_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment_, v15, 1.0, 0.45);

        objc_msgSend(a1, sel_setVibrancyEffect_, v16);
        swift_unknownObjectRelease();

        v17 = 2;
        goto LABEL_13;
      }
    }
    swift_unknownObjectRelease();
  }
  objc_msgSend(a1, sel_setVibrancyEffect_, 0);
  v17 = 1;
LABEL_13:
  objc_opt_self();
  v18 = (void *)swift_dynamicCastObjCClass();
  if (v18)
    objc_msgSend(v18, sel_isSystemImage);
LABEL_15:
  objc_msgSend(a1, sel_setContentMode_, 1);
  objc_msgSend(a1, sel_setIconSize_, v4);
  return objc_msgSend(a1, sel_updateWithIconDescriptor_displayStyle_animated_, v3, v17, 0);
}

double IconViewWrapper.sizeThatFits(_:uiView:context:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  int v8;
  int v9;
  double result;
  BOOL v11;

  if (*(_BYTE *)(v4 + 16) == 1 && *(_QWORD *)v4 != 0)
  {
    v8 = a4 & 1;
    v9 = a2 & 1;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      v11 = v9 == 0;
    else
      v11 = 0;
    if (v11 && v8 == 0)
      return CGSizeMake(*(double *)&a1, *(double *)&a3 + -10.0);
  }
  return result;
}

id sub_23EB88348()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)HUIconView), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_updateWithIconDescriptor_displayStyle_animated_, v1, 1, 0);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  return v4;
}

double sub_23EB88410(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  int v8;
  int v9;
  double result;
  BOOL v11;

  if (*(_BYTE *)(v4 + 16) == 1 && *(_QWORD *)v4 != 0)
  {
    v8 = a4 & 1;
    v9 = a2 & 1;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      v11 = v9 == 0;
    else
      v11 = 0;
    if (v11 && v8 == 0)
      return CGSizeMake(*(double *)&a1, *(double *)&a3 + -10.0);
  }
  return result;
}

uint64_t sub_23EB884C4()
{
  sub_23EB88938();
  return sub_23EB94E2C();
}

uint64_t sub_23EB88514()
{
  sub_23EB88938();
  return sub_23EB94DD8();
}

void sub_23EB88564()
{
  sub_23EB88938();
  sub_23EB94E20();
  __break(1u);
}

unint64_t sub_23EB8858C()
{
  unint64_t result;

  result = qword_256DB52F0;
  if (!qword_256DB52F0)
  {
    result = MEMORY[0x24265A42C](&protocol conformance descriptor for IconViewStyling, &type metadata for IconViewStyling);
    atomic_store(result, (unint64_t *)&qword_256DB52F0);
  }
  return result;
}

unint64_t sub_23EB885D4()
{
  unint64_t result;

  result = qword_256DB52F8;
  if (!qword_256DB52F8)
  {
    result = MEMORY[0x24265A42C](&protocol conformance descriptor for IconViewWrapper, &type metadata for IconViewWrapper);
    atomic_store(result, (unint64_t *)&qword_256DB52F8);
  }
  return result;
}

uint64_t sub_23EB88618()
{
  return MEMORY[0x24BDF5560];
}

uint64_t getEnumTagSinglePayload for IconViewStyling(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IconViewStyling(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB88700 + 4 * byte_23EB9667D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23EB88734 + 4 * byte_23EB96678[v4]))();
}

uint64_t sub_23EB88734(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB8873C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB88744);
  return result;
}

uint64_t sub_23EB88750(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB88758);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23EB8875C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB88764(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23EB88770(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IconViewStyling()
{
  return &type metadata for IconViewStyling;
}

uint64_t destroy for IconViewWrapper()
{
  return swift_unknownObjectRelease();
}

uint64_t _s12HomeUICommon15IconViewWrapperVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IconViewWrapper(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IconViewWrapper(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconViewWrapper(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IconViewWrapper(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for IconViewWrapper()
{
  return &type metadata for IconViewWrapper;
}

unint64_t sub_23EB88938()
{
  unint64_t result;

  result = qword_256DB5360;
  if (!qword_256DB5360)
  {
    result = MEMORY[0x24265A42C](&protocol conformance descriptor for IconViewWrapper, &type metadata for IconViewWrapper);
    atomic_store(result, (unint64_t *)&qword_256DB5360);
  }
  return result;
}

uint64_t *sub_23EB8897C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(uint64_t *, _QWORD, uint64_t, int *);
  uint64_t v21;
  void *v22;
  id v23;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = sub_23EB94CD0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      *((_BYTE *)a1 + v7[5]) = *((_BYTE *)a2 + v7[5]);
      v12 = v7[6];
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      v16 = v7[7];
      v17 = (uint64_t *)((char *)a1 + v16);
      v18 = (uint64_t *)((char *)a2 + v16);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      v20 = *(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(a1, 0, 1, v7);
    }
    v21 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v22 = *(void **)((char *)a2 + v21);
    *(uint64_t *)((char *)a1 + v21) = (uint64_t)v22;
    swift_retain();
    v23 = v22;
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265A414]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23EB88B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {
    v5 = sub_23EB94CD0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();

}

char *sub_23EB88BA0(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t, int *);
  uint64_t v19;
  void *v20;
  id v21;

  v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = sub_23EB94CD0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    a1[v6[5]] = a2[v6[5]];
    v10 = v6[6];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = v6[7];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(a1, 0, 1, v6);
  }
  v19 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  v20 = *(void **)&a2[v19];
  *(_QWORD *)&a1[v19] = v20;
  swift_retain();
  v21 = v20;
  return a1;
}

_BYTE *sub_23EB88CB8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void (*v18)(_BYTE *, _QWORD, uint64_t, int *);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;

  v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v25 = sub_23EB94CD0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 24))(a1, a2, v25);
      a1[v6[5]] = a2[v6[5]];
      v26 = v6[6];
      v27 = &a1[v26];
      v28 = &a2[v26];
      *v27 = *v28;
      v27[1] = v28[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v29 = v6[7];
      v30 = &a1[v29];
      v31 = &a2[v29];
      *v30 = *v31;
      v30[1] = v31[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23EB88EAC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v11 = sub_23EB94CD0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  a1[v6[5]] = a2[v6[5]];
  v12 = v6[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *v13 = *v14;
  v13[1] = v14[1];
  v15 = v6[7];
  v16 = &a1[v15];
  v17 = &a2[v15];
  *v16 = *v17;
  v16[1] = v17[1];
  v18 = *(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  swift_release();
  v20 = *(int *)(a3 + 24);
  v21 = *(void **)&a2[v20];
  v22 = *(void **)&a1[v20];
  *(_QWORD *)&a1[v20] = v21;
  v23 = v21;

  return a1;
}

uint64_t sub_23EB88EAC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_23EB88EE8(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = sub_23EB94CD0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    a1[v6[5]] = a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  return a1;
}

_BYTE *sub_23EB88FDC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = (int *)type metadata accessor for ScheduleRuleDisplayInfo();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v16 = sub_23EB94CD0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(a1, a2, v16);
      a1[v6[5]] = a2[v6[5]];
      v17 = v6[6];
      v18 = &a1[v17];
      v19 = (uint64_t *)&a2[v17];
      v21 = *v19;
      v20 = v19[1];
      *v18 = v21;
      v18[1] = v20;
      swift_bridgeObjectRelease();
      v22 = v6[7];
      v23 = &a1[v22];
      v24 = (uint64_t *)&a2[v22];
      v26 = *v24;
      v25 = v24[1];
      *v23 = v26;
      v23[1] = v25;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23EB88EAC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  v11 = sub_23EB94CD0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  a1[v6[5]] = a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  v13 = *(int *)(a3 + 24);
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  return a1;
}

uint64_t sub_23EB89178()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EB89184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23EB89204()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EB89210(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ScheduleRuleAccessListCell()
{
  uint64_t result;

  result = qword_256DB53D0;
  if (!qword_256DB53D0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23EB892C8()
{
  unint64_t v0;

  sub_23EB8934C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23EB8934C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256DB53E0)
  {
    type metadata accessor for ScheduleRuleDisplayInfo();
    v0 = sub_23EB9509C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256DB53E0);
  }
}

uint64_t sub_23EB893A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EB893B0()
{
  uint64_t v0;

  v0 = sub_23EB94D3C();
  __swift_allocate_value_buffer(v0, qword_256DB5F48);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DB5F48);
  return sub_23EB94D0C();
}

uint64_t sub_23EB893F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  char v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[240];
  _OWORD v14[13];
  _OWORD v15[2];

  v3 = sub_23EB94D90();
  sub_23EB895DC(v1, (uint64_t)v14);
  v4 = sub_23EB94E74();
  v5 = sub_23EB94E80();
  v6 = sub_23EB94E98();
  sub_23EB94E98();
  if (sub_23EB94E98() != v4)
    v6 = sub_23EB94E98();
  sub_23EB94E98();
  if (sub_23EB94E98() != v5)
    v6 = sub_23EB94E98();
  *(_OWORD *)&v13[183] = v14[11];
  *(_OWORD *)&v13[199] = v14[12];
  *(_OWORD *)&v13[215] = v15[0];
  *(_OWORD *)&v13[224] = *(_OWORD *)((char *)v15 + 9);
  *(_OWORD *)&v13[119] = v14[7];
  *(_OWORD *)&v13[135] = v14[8];
  *(_OWORD *)&v13[151] = v14[9];
  *(_OWORD *)&v13[167] = v14[10];
  *(_OWORD *)&v13[55] = v14[3];
  *(_OWORD *)&v13[71] = v14[4];
  *(_OWORD *)&v13[87] = v14[5];
  *(_OWORD *)&v13[103] = v14[6];
  *(_OWORD *)&v13[7] = v14[0];
  *(_OWORD *)&v13[23] = v14[1];
  *(_OWORD *)&v13[39] = v14[2];
  if (qword_256DB5040 != -1)
    swift_once();
  v7 = sub_23EB94D3C();
  __swift_project_value_buffer(v7, (uint64_t)qword_256DB5F48);
  sub_23EB94D24();
  result = sub_23EB94D54();
  *(_OWORD *)(a1 + 193) = *(_OWORD *)&v13[176];
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v13[192];
  *(_OWORD *)(a1 + 225) = *(_OWORD *)&v13[208];
  *(_OWORD *)(a1 + 241) = *(_OWORD *)&v13[224];
  *(_OWORD *)(a1 + 129) = *(_OWORD *)&v13[112];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v13[128];
  *(_OWORD *)(a1 + 161) = *(_OWORD *)&v13[144];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v13[160];
  *(_OWORD *)(a1 + 65) = *(_OWORD *)&v13[48];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v13[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v13[80];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v13[96];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v13;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v13[16];
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v13[32];
  *(_BYTE *)(a1 + 264) = v6;
  *(_QWORD *)(a1 + 272) = v9;
  *(_QWORD *)(a1 + 280) = v10;
  *(_QWORD *)(a1 + 288) = v11;
  *(_QWORD *)(a1 + 296) = v12;
  *(_BYTE *)(a1 + 304) = 0;
  return result;
}

uint64_t sub_23EB895DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[143];
  __int128 v27;
  _BYTE v28[7];
  _BYTE v29[7];
  _QWORD v30[2];
  _BYTE v31[144];
  __int128 v32;
  __int128 v33;
  _BYTE v34[25];
  uint64_t v35;
  _BYTE v36[105];
  __int128 v37;
  _BYTE v38[31];
  uint64_t v39;
  char v40;
  _BYTE v41[7];
  char v42;
  _BYTE v43[7];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v58;
  _QWORD v59[2];
  char v60;
  uint64_t v61;
  uint64_t v62;
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
  char v74;

  v24 = sub_23EB94F34();
  v4 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for ScheduleRuleAccessListCell() + 20));
  swift_retain();
  v23 = sub_23EB94D84();
  v5 = sub_23EB94DA8();
  sub_23EB89A5C(a1, (uint64_t)&v35);
  v49 = 1;
  v50 = (unint64_t)v5;
  LOBYTE(v51) = 1;
  *((_QWORD *)&v51 + 1) = v35;
  v52 = *(_OWORD *)v36;
  v53 = *(_OWORD *)&v36[16];
  v54 = *(_OWORD *)&v36[32];
  v55 = *(_OWORD *)&v36[48];
  v56 = *(_OWORD *)&v36[64];
  v57 = *(_OWORD *)&v36[80];
  v58 = v36[96];
  v59[0] = v5;
  v59[1] = 0;
  v60 = 1;
  v61 = v35;
  v62 = *(_QWORD *)v36;
  v63 = *(_QWORD *)&v36[8];
  v64 = *(_QWORD *)&v36[16];
  v65 = *(_QWORD *)&v36[24];
  v66 = *(_QWORD *)&v36[32];
  v67 = *(_QWORD *)&v36[40];
  v68 = *(_QWORD *)&v36[48];
  v69 = *(_QWORD *)&v36[56];
  v70 = *(_QWORD *)&v36[64];
  v71 = *(_QWORD *)&v36[72];
  v72 = *(_QWORD *)&v36[80];
  v73 = *(_QWORD *)&v36[88];
  v74 = v36[96];
  sub_23EB89F78((uint64_t)&v50, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23EB89E90);
  sub_23EB89F78((uint64_t)v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23EB89FD8);
  LOBYTE(a1) = sub_23EB94E8C();
  v6 = sub_23EB94E98();
  sub_23EB94E98();
  if (sub_23EB94E98() != a1)
    v6 = sub_23EB94E98();
  LOBYTE(v25) = v58;
  *(_OWORD *)&v26[87] = v55;
  *(_OWORD *)&v26[23] = v51;
  *(_OWORD *)&v26[103] = v56;
  *(_OWORD *)&v26[39] = v52;
  *(_OWORD *)&v26[119] = v57;
  *(_QWORD *)&v26[135] = v25;
  *(_OWORD *)&v26[55] = v53;
  *(_OWORD *)&v26[71] = v54;
  *(_OWORD *)&v26[7] = v50;
  v27 = *(_OWORD *)&v26[112];
  HIBYTE(v27) = BYTE8(v57);
  if (qword_256DB5040 != -1)
    swift_once();
  v7 = sub_23EB94D3C();
  __swift_project_value_buffer(v7, (uint64_t)qword_256DB5F48);
  sub_23EB94D18();
  sub_23EB94D54();
  *(_OWORD *)&v36[89] = *(_OWORD *)&v26[80];
  v37 = *(_OWORD *)&v26[96];
  *(_OWORD *)v38 = v27;
  *(_OWORD *)&v38[15] = *(_OWORD *)&v26[127];
  *(_OWORD *)&v36[25] = *(_OWORD *)&v26[16];
  *(_OWORD *)&v36[41] = *(_OWORD *)&v26[32];
  *(_OWORD *)&v36[57] = *(_OWORD *)&v26[48];
  *(_OWORD *)&v36[73] = *(_OWORD *)&v26[64];
  *(_OWORD *)&v36[9] = *(_OWORD *)v26;
  *(_OWORD *)&v31[97] = *(_OWORD *)&v26[96];
  *(_OWORD *)&v31[81] = *(_OWORD *)&v26[80];
  *(_OWORD *)&v31[113] = v27;
  *(_OWORD *)&v31[128] = *(_OWORD *)&v26[127];
  *(_OWORD *)&v31[17] = *(_OWORD *)&v26[16];
  *(_DWORD *)v41 = *(_DWORD *)v29;
  *(_DWORD *)&v41[3] = *(_DWORD *)&v29[3];
  *(_DWORD *)v43 = *(_DWORD *)v28;
  *(_DWORD *)&v43[3] = *(_DWORD *)&v28[3];
  v30[0] = v23;
  v30[1] = 0;
  v31[0] = 1;
  *(_OWORD *)&v31[33] = *(_OWORD *)&v26[32];
  *(_OWORD *)&v31[49] = *(_OWORD *)&v26[48];
  *(_OWORD *)&v31[65] = *(_OWORD *)&v26[64];
  *(_OWORD *)&v31[1] = *(_OWORD *)v26;
  *(_QWORD *)&v32 = 0;
  BYTE8(v32) = 1;
  HIDWORD(v32) = *(_DWORD *)&v29[3];
  *(_DWORD *)((char *)&v32 + 9) = *(_DWORD *)v29;
  LOBYTE(v33) = v6;
  *(_DWORD *)((char *)&v33 + 1) = *(_DWORD *)v28;
  DWORD1(v33) = *(_DWORD *)&v28[3];
  *((_QWORD *)&v33 + 1) = v8;
  *(_QWORD *)v34 = v9;
  *(_QWORD *)&v34[8] = v10;
  *(_QWORD *)&v34[16] = v11;
  v34[24] = 0;
  v12 = *(_OWORD *)v31;
  *(_OWORD *)(a2 + 16) = (unint64_t)v23;
  *(_OWORD *)(a2 + 32) = v12;
  v13 = *(_OWORD *)&v31[16];
  v14 = *(_OWORD *)&v31[32];
  v15 = *(_OWORD *)&v31[64];
  *(_OWORD *)(a2 + 80) = *(_OWORD *)&v31[48];
  *(_OWORD *)(a2 + 96) = v15;
  *(_OWORD *)(a2 + 48) = v13;
  *(_OWORD *)(a2 + 64) = v14;
  v16 = *(_OWORD *)&v31[80];
  v17 = *(_OWORD *)&v31[96];
  v18 = *(_OWORD *)&v31[128];
  *(_OWORD *)(a2 + 144) = *(_OWORD *)&v31[112];
  *(_OWORD *)(a2 + 160) = v18;
  *(_OWORD *)(a2 + 112) = v16;
  *(_OWORD *)(a2 + 128) = v17;
  v19 = v32;
  v20 = v33;
  v21 = *(_OWORD *)v34;
  *(_OWORD *)(a2 + 217) = *(_OWORD *)&v34[9];
  *(_OWORD *)(a2 + 192) = v20;
  *(_OWORD *)(a2 + 208) = v21;
  *(_OWORD *)(a2 + 176) = v19;
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = v4;
  v35 = v23;
  *(_QWORD *)v36 = 0;
  v36[8] = 1;
  v39 = 0;
  v40 = 1;
  v42 = v6;
  v44 = v8;
  v45 = v9;
  v46 = v10;
  v47 = v11;
  v48 = 0;
  swift_retain();
  swift_retain();
  sub_23EB8A0C0((uint64_t)v30, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23EB89E90);
  sub_23EB8A0C0((uint64_t)&v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23EB89FD8);
  swift_release();
  return swift_release();
}

uint64_t sub_23EB89A5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ScheduleRuleDisplayInfo();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB8A11C(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    result = sub_23EB8A164((uint64_t)v5);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  else
  {
    sub_23EB8A1A4((uint64_t)v5, (uint64_t)v9);
    v24 = &v9[*(int *)(v6 + 24)];
    v25 = *((_QWORD *)v24 + 1);
    v72 = *(_QWORD *)v24;
    v73 = v25;
    sub_23EB8A1E8();
    swift_bridgeObjectRetain();
    v26 = sub_23EB94EE0();
    v69 = v27;
    v67 = v29;
    v68 = v28 & 1;
    v30 = *(int *)(v6 + 28);
    v66 = v9;
    v31 = &v9[v30];
    v32 = *((_QWORD *)v31 + 1);
    v71 = v26;
    if (v32)
    {
      v72 = *(_QWORD *)v31;
      v73 = v32;
      swift_bridgeObjectRetain();
      v33 = sub_23EB94EE0();
      v35 = v34;
      v37 = v36 & 1;
      sub_23EB94EA4();
      v38 = sub_23EB94EC8();
      v40 = v39;
      v42 = v41;
      swift_release();
      v43 = v42 & 1;
      sub_23EB8A080(v33, v35, v37);
      swift_bridgeObjectRelease();
      LODWORD(v72) = sub_23EB94E68();
      v70 = sub_23EB94EBC();
      v45 = v44;
      v47 = v46;
      v49 = v48 & 1;
      sub_23EB8A080(v38, v40, v43);
      swift_bridgeObjectRelease();
      v50 = sub_23EB94E74();
      if (qword_256DB5040 != -1)
        swift_once();
      v51 = sub_23EB94D3C();
      __swift_project_value_buffer(v51, (uint64_t)qword_256DB5F48);
      sub_23EB94D30();
      sub_23EB94D54();
      v61 = v53;
      v62 = v52;
      v60 = v54;
      v23 = v55;
      v19 = v50;
      v56 = v70;
      v26 = v71;
      v57 = v45;
    }
    else
    {
      v56 = 0;
      v57 = 0;
      v49 = 0;
      v47 = 0;
      v19 = 0;
      v61 = 0;
      v62 = 0;
      v60 = 0;
      v23 = 0;
    }
    v12 = v67;
    sub_23EB89F38(v26, v67, v68);
    swift_bridgeObjectRetain();
    v70 = v56;
    v63 = v57;
    v64 = v47;
    v58 = v57;
    v65 = v49;
    v21 = v61;
    v20 = v62;
    v22 = v60;
    sub_23EB89F48(v56, v58, v49, v47);
    sub_23EB88EAC((uint64_t)v66);
    v59 = v56;
    v16 = v63;
    sub_23EB8A090(v59, v63, v49, v47);
    v13 = v68;
    sub_23EB8A080(v71, v12, v68);
    v14 = v69;
    result = swift_bridgeObjectRelease();
    v15 = v70;
    v11 = v71;
    v18 = v64;
    v17 = v65;
  }
  *(_QWORD *)a2 = v11;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v15;
  *(_QWORD *)(a2 + 40) = v16;
  *(_QWORD *)(a2 + 48) = v17;
  *(_QWORD *)(a2 + 56) = v18;
  *(_QWORD *)(a2 + 64) = v19;
  *(_QWORD *)(a2 + 72) = v20;
  *(_QWORD *)(a2 + 80) = v21;
  *(_QWORD *)(a2 + 88) = v22;
  *(_QWORD *)(a2 + 96) = v23;
  *(_BYTE *)(a2 + 104) = 0;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

uint64_t sub_23EB89E90(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  if (a4)
  {
    sub_23EB89F38(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return sub_23EB89F48(a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_23EB89F38(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23EB89F48(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23EB89F38(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23EB89F78(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 128);
  a2(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_23EB89FD8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  if (a4)
  {
    sub_23EB8A080(result, a2, a3 & 1);
    swift_bridgeObjectRelease();
    return sub_23EB8A090(a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_23EB8A080(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23EB8A090(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23EB8A080(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23EB8A0C0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 152);
  a2(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), v4);
  return a1;
}

uint64_t sub_23EB8A11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EB8A164(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5370);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EB8A1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23EB8A1E8()
{
  unint64_t result;

  result = qword_256DB5418;
  if (!qword_256DB5418)
  {
    result = MEMORY[0x24265A42C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256DB5418);
  }
  return result;
}

unint64_t sub_23EB8A230()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256DB5420;
  if (!qword_256DB5420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5428);
    v2[0] = sub_23EB8A2E0();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24265A42C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB5420);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265A420](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23EB8A2E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DB5430;
  if (!qword_256DB5430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5438);
    result = MEMORY[0x24265A42C](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_256DB5430);
  }
  return result;
}

uint64_t ScheduleAccessList.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
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
  char *v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  __int128 v33;
  _OWORD v34[2];

  v31 = a1;
  v28 = sub_23EB94E5C();
  v30 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5440);
  v25 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5448);
  v7 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5450);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5458);
  v26 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1[1];
  v33 = *v1;
  v34[0] = v15;
  *(_OWORD *)((char *)v34 + 9) = *(__int128 *)((char *)v1 + 25);
  v32 = &v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5460);
  sub_23EB8AB48(&qword_256DB5468, &qword_256DB5460, (uint64_t (*)(void))sub_23EB8AABC, MEMORY[0x24BDF5578]);
  sub_23EB94EB0();
  sub_23EB94E50();
  sub_23EB8B8F0(&qword_256DB5528, &qword_256DB5440, MEMORY[0x24BDF1A30]);
  v16 = v28;
  sub_23EB94F1C();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v16);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v4);
  v17 = *((_QWORD *)&v34[0] + 1);
  swift_retain();
  v18 = sub_23EB94F70();
  v20 = v19;
  v21 = v27;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v27);
  v22 = &v12[*(int *)(v10 + 36)];
  *(_QWORD *)v22 = v17;
  *((_QWORD *)v22 + 1) = v18;
  *((_QWORD *)v22 + 2) = v20;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  sub_23EB8AE50();
  sub_23EB94F10();
  sub_23EB8B7D8((uint64_t)v12, &qword_256DB5450);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v31, v14, v29);
}

uint64_t sub_23EB8A61C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[40];

  v29 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB54C8);
  v27 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5548);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5460);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5488);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 32);
  if (*(_QWORD *)(v16 + 16))
  {
    v17 = v16 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v26 = v8;
    v18 = sub_23EB8B930(v17, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleRuleDisplayInfo);
    v25[1] = v25;
    MEMORY[0x24BDAC7A8](v18);
    v25[-2] = v16;
    v25[-1] = a1;
    swift_bridgeObjectRetain();
    sub_23EB8B348((uint64_t)v8, (uint64_t)v30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB54D8);
    v25[2] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB54F8);
    sub_23EB8AB48(&qword_256DB54D0, &qword_256DB54D8, (uint64_t (*)(void))sub_23EB8AD58, MEMORY[0x24BDF5578]);
    sub_23EB8AB48(&qword_256DB54F0, &qword_256DB54F8, (uint64_t (*)(void))sub_23EB8ADB4, MEMORY[0x24BDF4A08]);
    sub_23EB94F58();
    swift_bridgeObjectRelease();
    v19 = v27;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v10, v5, v3);
    swift_storeEnumTagMultiPayload();
    sub_23EB8AB48(&qword_256DB5480, &qword_256DB5488, (uint64_t (*)(void))sub_23EB8ABAC, MEMORY[0x24BDF5578]);
    sub_23EB8ACA0();
    sub_23EB94E44();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5478);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 0, 1, v20);
    sub_23EB8B9B0((uint64_t)v12, v29, &qword_256DB5460);
    return sub_23EB8B974((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleRuleDisplayInfo);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB54A8);
      sub_23EB8AC1C();
      sub_23EB94F64();
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5498);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 0, 1, v23);
    }
    else
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5498);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 1, 1, v22);
    }
    sub_23EB8B790((uint64_t)v15, (uint64_t)v10);
    swift_storeEnumTagMultiPayload();
    sub_23EB8AB48(&qword_256DB5480, &qword_256DB5488, (uint64_t (*)(void))sub_23EB8ABAC, MEMORY[0x24BDF5578]);
    sub_23EB8ACA0();
    sub_23EB94E44();
    sub_23EB8B7D8((uint64_t)v15, &qword_256DB5488);
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5478);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v12, 0, 1, v24);
    return sub_23EB8B9B0((uint64_t)v12, v29, &qword_256DB5460);
  }
}

uint64_t sub_23EB8AAB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EB8A61C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_23EB8AABC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256DB5470;
  if (!qword_256DB5470)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5478);
    v2[0] = sub_23EB8AB48(&qword_256DB5480, &qword_256DB5488, (uint64_t (*)(void))sub_23EB8ABAC, MEMORY[0x24BDF5578]);
    v2[1] = sub_23EB8ACA0();
    result = MEMORY[0x24265A42C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB5470);
  }
  return result;
}

uint64_t sub_23EB8AB48(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24265A42C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23EB8ABAC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_256DB5490;
  if (!qword_256DB5490)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5498);
    v2 = sub_23EB8AC1C();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24265A42C](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256DB5490);
  }
  return result;
}

unint64_t sub_23EB8AC1C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256DB54A0;
  if (!qword_256DB54A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB54A8);
    v2 = sub_23EB8B8F0(&qword_256DB54B0, &qword_256DB54B8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x24265A42C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256DB54A0);
  }
  return result;
}

unint64_t sub_23EB8ACA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_256DB54C0;
  if (!qword_256DB54C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB54C8);
    v2[0] = sub_23EB8AB48(&qword_256DB54D0, &qword_256DB54D8, (uint64_t (*)(void))sub_23EB8AD58, MEMORY[0x24BDF5578]);
    v2[1] = sub_23EB8AB48(&qword_256DB54F0, &qword_256DB54F8, (uint64_t (*)(void))sub_23EB8ADB4, MEMORY[0x24BDF4A08]);
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24265A42C](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB54C0);
  }
  return result;
}

unint64_t sub_23EB8AD58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256DB54E0;
  if (!qword_256DB54E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB54E8);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24265A42C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB54E0);
  }
  return result;
}

unint64_t sub_23EB8ADB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256DB5500;
  if (!qword_256DB5500)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5508);
    v2[0] = sub_23EB87638(&qword_256DB5510, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleAccessListCell, (uint64_t)&unk_23EB9687C);
    v2[1] = sub_23EB8B8F0(&qword_256DB5518, &qword_256DB5520, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24265A42C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB5500);
  }
  return result;
}

unint64_t sub_23EB8AE50()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256DB5530;
  if (!qword_256DB5530)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5450);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5440);
    v2[3] = sub_23EB94E5C();
    v2[4] = sub_23EB8B8F0(&qword_256DB5528, &qword_256DB5440, MEMORY[0x24BDF1A30]);
    v2[5] = MEMORY[0x24BDEF958];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23EB8B8F0(&qword_256DB5538, &qword_256DB5540, MEMORY[0x24BDEF370]);
    result = MEMORY[0x24265A42C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256DB5530);
  }
  return result;
}

uint64_t sub_23EB8AF34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EB8AF44@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v2 = (void *)sub_23EB94F88();
  v3 = (id)HFLocalizedString();

  sub_23EB94F94();
  sub_23EB8A1E8();
  v4 = sub_23EB94EE0();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v8 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_23EB8B010(uint64_t a1, _OWORD *a2)
{
  _OWORD *v3;
  __int128 v4;

  v3 = (_OWORD *)swift_allocObject();
  v4 = a2[1];
  v3[1] = *a2;
  v3[2] = v4;
  *(_OWORD *)((char *)v3 + 41) = *(_OWORD *)((char *)a2 + 25);
  swift_bridgeObjectRetain();
  sub_23EB8B8A4((uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5550);
  sub_23EB94CD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5508);
  sub_23EB8B8F0(&qword_256DB5558, &qword_256DB5550, MEMORY[0x24BEE12D8]);
  sub_23EB8ADB4();
  sub_23EB87638(&qword_256DB5560, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleDisplayInfo, (uint64_t)&protocol conformance descriptor for ScheduleRuleDisplayInfo);
  return sub_23EB94F4C();
}

uint64_t sub_23EB8B130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v20[2];

  v6 = type metadata accessor for ScheduleRuleAccessListCell();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5508);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB8B930(a1, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleRuleDisplayInfo);
  v12 = type metadata accessor for ScheduleRuleDisplayInfo();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 0, 1, v12);
  *(_QWORD *)&v8[*(int *)(v6 + 20)] = *(_QWORD *)(a2 + 16);
  v13 = *(int *)(v6 + 24);
  v14 = objc_allocWithZone(MEMORY[0x24BDD1500]);
  swift_retain();
  v15 = objc_msgSend(v14, sel_init);
  objc_msgSend(v15, sel_setDateStyle_, 0);
  objc_msgSend(v15, sel_setTimeStyle_, 1);
  objc_msgSend(v15, sel_setFormattingContext_, 3);
  *(_QWORD *)&v8[v13] = v15;
  if (*(_QWORD *)(a2 + 32))
  {
    v16 = *(_QWORD *)(a2 + 32);
  }
  else
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_tertiarySystemFillColor);
    v16 = MEMORY[0x242659BF8](v17);
  }
  v20[1] = v16;
  swift_retain();
  swift_retain();
  v18 = sub_23EB94F40();
  sub_23EB8B930((uint64_t)v8, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleRuleAccessListCell);
  swift_release();
  *(_QWORD *)&v11[*(int *)(v9 + 36)] = v18;
  sub_23EB8B974((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleRuleAccessListCell);
  return sub_23EB8B9B0((uint64_t)v11, a3, &qword_256DB5508);
}

uint64_t sub_23EB8B348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  char v16;
  __int128 v17;
  __int128 v18;
  char v19;

  result = type metadata accessor for ScheduleRuleDisplayInfo();
  v5 = *(unsigned __int8 *)(a1 + *(int *)(result + 20));
  if (v5 == 1)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromScheduleType_, 1);
    v11 = sub_23EB94F94();
    v13 = v12;

    *(_QWORD *)&v17 = v11;
    *((_QWORD *)&v17 + 1) = v13;
    sub_23EB8A1E8();
    sub_23EB94EE0();
  }
  else
  {
    if (v5 != 2)
    {
      v14 = 0uLL;
      v16 = -1;
      v15 = 0uLL;
      goto LABEL_7;
    }
    v6 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromScheduleType_, 2);
    v7 = sub_23EB94F94();
    v9 = v8;

    *(_QWORD *)&v17 = v7;
    *((_QWORD *)&v17 + 1) = v9;
    sub_23EB8A1E8();
    sub_23EB94EE0();
  }
  result = sub_23EB94E44();
  v14 = v17;
  v15 = v18;
  v16 = v19;
LABEL_7:
  *(_OWORD *)a2 = v14;
  *(_OWORD *)(a2 + 16) = v15;
  *(_BYTE *)(a2 + 32) = v16;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ScheduleAccessList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ScheduleAccessList()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ScheduleAccessList(uint64_t a1, uint64_t a2)
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
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ScheduleAccessList(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
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

uint64_t assignWithTake for ScheduleAccessList(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScheduleAccessList(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScheduleAccessList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduleAccessList()
{
  return &type metadata for ScheduleAccessList;
}

uint64_t sub_23EB8B73C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DB5450);
  sub_23EB8AE50();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EB8B788()
{
  uint64_t v0;

  return sub_23EB8B010(*(_QWORD *)(v0 + 16), *(_OWORD **)(v0 + 24));
}

uint64_t sub_23EB8B790(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EB8B7D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EB8B814@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23EB94D6C();
  *a1 = result;
  return result;
}

uint64_t sub_23EB8B83C()
{
  return sub_23EB94D78();
}

uint64_t sub_23EB8B860()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23EB8B89C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23EB8B130(a1, v2 + 16, a2);
}

uint64_t sub_23EB8B8A4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23EB8B8F0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24265A42C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23EB8B930(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EB8B974(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EB8B9B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;

  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithGuestAccessSchedule_tintColor_shouldDisplayAlwaysAllowedSchedule_scheduleBackgroundColor_listRowBackgroundColor_, a1, a2, a3 & 1, a4, a5);

  return v9;
}

char *HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(void *a1, void *a2, int a3, void *a4, void *a5)
{
  char *v5;
  char *v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  objc_super v33;

  v11 = &v5[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *(_OWORD *)(v11 + 25) = 0u;
  *(_QWORD *)&v5[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;
  type metadata accessor for HUScheduleAccessViewController((uint64_t)a1);
  v12 = v5;
  v32 = a1;
  v13 = sub_23EB8BD50((uint64_t)a1, a3);
  v31 = a5;
  if (a5)
    v14 = MEMORY[0x242659BF8](a5);
  else
    v14 = 0;
  type metadata accessor for ScheduleRuleList();
  swift_allocObject();
  ScheduleRuleList.init(rules:)((uint64_t)v13);
  v30 = a2;
  v15 = MEMORY[0x242659BF8]();
  v16 = a4;
  v17 = MEMORY[0x242659BF8]();
  sub_23EB87638(&qword_256DB5580, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleList, (uint64_t)&protocol conformance descriptor for ScheduleRuleList);
  swift_retain();
  v18 = sub_23EB94D60();
  v19 = *(_QWORD *)v11;
  v20 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v11 = v18;
  *((_QWORD *)v11 + 1) = v21;
  *((_QWORD *)v11 + 2) = v15;
  *((_QWORD *)v11 + 3) = v17;
  *((_QWORD *)v11 + 4) = v14;
  v11[40] = 0;
  sub_23EB8CE2C(v19, v20);

  v33.receiver = v12;
  v33.super_class = (Class)HUScheduleAccessViewController;
  v22 = (char *)objc_msgSendSuper2(&v33, sel_initWithNibName_bundle_, 0, 0);
  v23 = *(_QWORD *)&v22[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
  if (v23)
  {
    v24 = *(_QWORD *)&v22[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
    v25 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_256DB5588));
    sub_23EB8CE7C(v24, v23);
    v26 = v22;
    sub_23EB8CE7C(v24, v23);
    v27 = sub_23EB94DB4();
    v28 = *(void **)&v26[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
    *(_QWORD *)&v26[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = v27;

    sub_23EB8CECC();
    swift_release();

    sub_23EB8CE2C(v24, v23);
  }
  else
  {

    swift_release();
  }
  return v22;
}

uint64_t type metadata accessor for HUScheduleAccessViewController(uint64_t a1)
{
  return sub_23EB919DC(a1, &qword_256DB55D8);
}

uint64_t *sub_23EB8BD50(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  NSObject *p_vtable;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  id v38;
  unint64_t v39;
  id v40;
  char *v41;
  id v42;
  id v43;
  char *v44;
  id v45;
  os_log_type_t v46;
  int v47;
  _BOOL4 v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  id v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, unint64_t);
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  char v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t *v101;
  unint64_t v102;
  unint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  char *v110;
  unint64_t v111;
  unint64_t v112;
  objc_class *v113;
  unint64_t v114;
  NSObject *v115;
  os_log_type_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  id v126;
  char *v127;
  NSObject *v128;
  os_log_type_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  _QWORD *v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  id v146;
  char *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  void *v154;
  int v155;
  uint64_t v156;
  char *v157;
  id v158;
  uint64_t v159;
  char *v160;
  unint64_t v161;
  char *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169[3];
  uint64_t *v170;

  v3 = v2;
  v5 = type metadata accessor for ScheduleRuleDisplayInfo();
  v164 = *(_QWORD *)(v5 - 8);
  v165 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v148 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v148 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v148 - v12;
  v161 = sub_23EB94CE8();
  v14 = *(_QWORD *)(v161 - 8);
  v15 = MEMORY[0x24BDAC7A8](v161);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v148 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v160 = (char *)&v148 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v148 - v25;
  v170 = (uint64_t *)MEMORY[0x24BEE4AF8];
  p_vtable = HUTemperatureIconContentView.vtable;
  v156 = v3;
  if (!v24)
  {
    v166 = v23;
    if (qword_256DB5048 != -1)
      swift_once();
    v58 = (id)qword_256DB5F60;
    sub_23EB94CF4();
    v59 = sub_23EB94CDC();
    v60 = sub_23EB95078();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc();
      v155 = a2;
      v62 = v61;
      v63 = swift_slowAlloc();
      v159 = v14;
      v64 = v63;
      v169[0] = v63;
      *(_DWORD *)v62 = 136315394;
      v65 = sub_23EB9518C();
      v168 = sub_23EB908D8(v65, v66, v169);
      sub_23EB950A8();
      v67 = v161;
      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2080;
      v168 = sub_23EB908D8(0xD000000000000049, 0x800000023EB97AA0, v169);
      p_vtable = (HUTemperatureIconContentView + 24);
      sub_23EB950A8();
      _os_log_impl(&dword_23EB80000, v59, v60, "%s%s There is no schedule to get ruleDisplayInfos from.", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24265A498](v64, -1, -1);
      v68 = v62;
      LOBYTE(v62) = v155;
      MEMORY[0x24265A498](v68, -1, -1);

      v57 = *(void (**)(char *, unint64_t))(v159 + 8);
      v57(v18, v67);
      if ((v62 & 1) == 0)
        goto LABEL_52;
    }
    else
    {

      v57 = *(void (**)(char *, unint64_t))(v14 + 8);
      v57(v18, v161);
      if ((a2 & 1) == 0)
        goto LABEL_52;
    }
    v104 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromScheduleType_, 0);
    v105 = sub_23EB94F94();
    v107 = v106;

    sub_23EB94CC4();
    v108 = v165;
    v8[*(int *)(v165 + 20)] = 0;
    v109 = (uint64_t *)&v8[*(int *)(v108 + 24)];
    *v109 = v105;
    v109[1] = v107;
    v110 = &v8[*(int *)(v108 + 28)];
    *(_QWORD *)v110 = 0;
    *((_QWORD *)v110 + 1) = 0;
    v82 = v170;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_35;
    goto LABEL_54;
  }
  v159 = v14;
  v152 = v22;
  v153 = v13;
  v155 = a2;
  v162 = v11;
  v28 = v24;
  v29 = (void *)objc_opt_self();
  v154 = v28;
  v30 = v28;
  v31 = objc_msgSend(v29, sel_scheduleBuilderFromHomeAccessSchedule_, v30);
  v32 = (void *)objc_opt_self();
  v33 = objc_msgSend(v31, sel_rules);
  v34 = sub_23EB919DC(0, &qword_256DB5628);
  sub_23EB91A14();
  v35 = sub_23EB95054();

  v36 = sub_23EB90F18(v35);
  swift_bridgeObjectRelease();
  sub_23EB90470(v36);
  swift_release();
  v37 = (void *)sub_23EB94FC4();
  swift_bridgeObjectRelease();
  v163 = v32;
  v38 = objc_msgSend(v32, sel_sortedScheduleRules_, v37);

  v151 = v34;
  v39 = sub_23EB94FD0();

  if (qword_256DB5048 != -1)
    swift_once();
  v40 = (id)qword_256DB5F60;
  v41 = v26;
  sub_23EB94CF4();
  v42 = v30;
  v43 = v31;
  v44 = (char *)v42;
  v45 = v43;
  p_vtable = sub_23EB94CDC();
  v46 = sub_23EB95078();
  v47 = v46;
  v48 = os_log_type_enabled(p_vtable, v46);
  v157 = v44;
  v158 = v45;
  v166 = v39;
  if (v48)
  {
    v49 = swift_slowAlloc();
    v50 = (_QWORD *)swift_slowAlloc();
    v150 = swift_slowAlloc();
    v169[0] = v150;
    *(_DWORD *)v49 = 136315906;
    v149 = v47;
    v51 = sub_23EB9518C();
    v168 = sub_23EB908D8(v51, v52, v169);
    sub_23EB950A8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v49 + 12) = 2080;
    v168 = sub_23EB908D8(0xD000000000000049, 0x800000023EB97AA0, v169);
    sub_23EB950A8();
    *(_WORD *)(v49 + 22) = 2112;
    v168 = (uint64_t)v45;
    v53 = v45;
    v148 = v41;
    v54 = v53;
    sub_23EB950A8();
    *v50 = v45;

    *(_WORD *)(v49 + 32) = 2112;
    v168 = (uint64_t)v44;
    v55 = v44;
    v39 = v166;
    sub_23EB950A8();
    v50[1] = v154;

    _os_log_impl(&dword_23EB80000, p_vtable, (os_log_type_t)v149, "%s%s Constructed builder {%@} from unwrapped schedule {%@}", (uint8_t *)v49, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
    swift_arrayDestroy();
    MEMORY[0x24265A498](v50, -1, -1);
    v56 = v150;
    swift_arrayDestroy();
    MEMORY[0x24265A498](v56, -1, -1);
    MEMORY[0x24265A498](v49, -1, -1);

    v57 = *(void (**)(char *, unint64_t))(v159 + 8);
    v57(v148, v161);
  }
  else
  {

    v57 = *(void (**)(char *, unint64_t))(v159 + 8);
    v57(v26, v161);
  }
  v69 = v39 >> 62;
  v70 = v160;
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    v125 = sub_23EB9512C();
    swift_bridgeObjectRelease();
    if (v125)
      goto LABEL_14;
  }
  else if (*(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    v71 = (id)qword_256DB5F60;
    sub_23EB94CF4();
    swift_bridgeObjectRetain_n();
    v72 = sub_23EB94CDC();
    v73 = sub_23EB95078();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = swift_slowAlloc();
      v159 = swift_slowAlloc();
      v169[0] = v159;
      *(_DWORD *)v74 = 136315650;
      v75 = sub_23EB9518C();
      v168 = sub_23EB908D8(v75, v76, v169);
      sub_23EB950A8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v74 + 12) = 2080;
      v168 = sub_23EB908D8(0xD000000000000049, 0x800000023EB97AA0, v169);
      sub_23EB950A8();
      *(_WORD *)(v74 + 22) = 2080;
      swift_bridgeObjectRetain();
      p_vtable = MEMORY[0x242659CAC](v166, v151);
      v78 = v77;
      swift_bridgeObjectRelease();
      v168 = sub_23EB908D8((uint64_t)p_vtable, v78, v169);
      v39 = v166;
      sub_23EB950A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23EB80000, v72, v73, "%s%s Mapping rules to ruleDisplayInfos {%s}", (uint8_t *)v74, 0x20u);
      v79 = v159;
      swift_arrayDestroy();
      MEMORY[0x24265A498](v79, -1, -1);
      MEMORY[0x24265A498](v74, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v57(v70, v161);
    v8 = v157;
    v80 = v158;
    if (v69)
    {
      swift_bridgeObjectRetain();
      v81 = sub_23EB9512C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v81 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (!v81)
    {
      swift_bridgeObjectRelease();

      v84 = MEMORY[0x24BEE4AF8];
LABEL_41:
      swift_bridgeObjectRelease();
      v170 = (uint64_t *)v84;
      goto LABEL_52;
    }
    v169[0] = MEMORY[0x24BEE4AF8];
    v82 = v169;
    sub_23EB91010(0, v81 & ~(v81 >> 63), 0);
    if ((v81 & 0x8000000000000000) == 0)
    {
      v83 = 0;
      v161 = v39 & 0xC000000000000001;
      v84 = v169[0];
      do
      {
        if (v161)
          v85 = (id)MEMORY[0x242659DCC](v83, v39);
        else
          v85 = *(id *)(v39 + 8 * v83 + 32);
        v86 = v85;
        if (objc_msgSend(v85, sel_isYearDayRule))
          v87 = 1;
        else
          v87 = 2;
        v88 = v163;
        v89 = objc_msgSend(v163, sel_localizedMainStringForRule_, v86);
        v90 = sub_23EB94F94();
        v92 = v91;

        v93 = objc_msgSend(v88, sel_localizedDetailedStringForRule_, v86);
        v94 = sub_23EB94F94();
        v96 = v95;

        v97 = (uint64_t)v162;
        sub_23EB94CC4();

        v98 = v97;
        v99 = v165;
        *(_BYTE *)(v97 + *(int *)(v165 + 20)) = v87;
        v100 = (uint64_t *)(v97 + *(int *)(v99 + 24));
        *v100 = v90;
        v100[1] = v92;
        v101 = (uint64_t *)(v97 + *(int *)(v99 + 28));
        *v101 = v94;
        v101[1] = v96;
        v169[0] = v84;
        v103 = *(_QWORD *)(v84 + 16);
        v102 = *(_QWORD *)(v84 + 24);
        if (v103 >= v102 >> 1)
        {
          sub_23EB91010(v102 > 1, v103 + 1, 1);
          v98 = (uint64_t)v162;
          v84 = v169[0];
        }
        ++v83;
        *(_QWORD *)(v84 + 16) = v103 + 1;
        sub_23EB8A1A4(v98, v84+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(_QWORD *)(v164 + 72) * v103);
        v39 = v166;
      }
      while (v81 != v83);
      swift_bridgeObjectRelease();

      goto LABEL_41;
    }
    __break(1u);
LABEL_54:
    v82 = (uint64_t *)sub_23EB906D0(0, v82[2] + 1, 1, (unint64_t)v82);
LABEL_35:
    v112 = v82[2];
    v111 = v82[3];
    if (v112 >= v111 >> 1)
      v82 = (uint64_t *)sub_23EB906D0(v111 > 1, v112 + 1, 1, (unint64_t)v82);
    v82[2] = v112 + 1;
    sub_23EB8A1A4((uint64_t)v8, (uint64_t)v82+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(_QWORD *)(v164 + 72) * v112);
    v170 = v82;
    v113 = p_vtable[492].isa;
    v114 = v166;
    sub_23EB94CF4();
    v115 = sub_23EB94CDC();
    v116 = sub_23EB95078();
    if (os_log_type_enabled(v115, v116))
    {
      v117 = swift_slowAlloc();
      v118 = swift_slowAlloc();
      v169[0] = v118;
      *(_DWORD *)v117 = 136315650;
      v119 = sub_23EB9518C();
      v168 = sub_23EB908D8(v119, v120, v169);
      sub_23EB950A8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v117 + 12) = 2080;
      v168 = sub_23EB908D8(0xD000000000000049, 0x800000023EB97AA0, v169);
      sub_23EB950A8();
      *(_WORD *)(v117 + 22) = 2080;
      swift_beginAccess();
      v121 = swift_bridgeObjectRetain();
      v122 = MEMORY[0x242659CAC](v121, v165);
      v124 = v123;
      swift_bridgeObjectRelease();
      v167 = sub_23EB908D8(v122, v124, v169);
      sub_23EB950A8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23EB80000, v115, v116, "%s%s Adding always allowed info. List of displayInfos to be presented {%s}", (uint8_t *)v117, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24265A498](v118, -1, -1);
      MEMORY[0x24265A498](v117, -1, -1);
    }

    v57((char *)v114, v161);
    goto LABEL_52;
  }
  swift_bridgeObjectRelease();
  v126 = (id)qword_256DB5F60;
  v127 = v152;
  sub_23EB94CF4();
  v128 = sub_23EB94CDC();
  v129 = sub_23EB95078();
  if (os_log_type_enabled(v128, v129))
  {
    v130 = swift_slowAlloc();
    v131 = swift_slowAlloc();
    v169[0] = v131;
    *(_DWORD *)v130 = 136315394;
    v132 = sub_23EB9518C();
    v168 = sub_23EB908D8(v132, v133, v169);
    sub_23EB950A8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v130 + 12) = 2080;
    v168 = sub_23EB908D8(0xD000000000000049, 0x800000023EB97AA0, v169);
    sub_23EB950A8();
    _os_log_impl(&dword_23EB80000, v128, v129, "%s%s Rules are empty!", (uint8_t *)v130, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24265A498](v131, -1, -1);
    MEMORY[0x24265A498](v130, -1, -1);
  }

  v57(v127, v161);
  v134 = v157;
  v135 = (uint64_t)v153;
  if ((v155 & 1) != 0)
  {
    v136 = objc_msgSend(v163, sel_localizedStringFromScheduleType_, 0);
    v137 = sub_23EB94F94();
    v139 = v138;

    sub_23EB94CC4();
    v140 = v165;
    *(_BYTE *)(v135 + *(int *)(v165 + 20)) = 0;
    v141 = (uint64_t *)(v135 + *(int *)(v140 + 24));
    *v141 = v137;
    v141[1] = v139;
    v142 = (_QWORD *)(v135 + *(int *)(v140 + 28));
    *v142 = 0;
    v142[1] = 0;
    v143 = (unint64_t)v170;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v143 = sub_23EB906D0(0, *(_QWORD *)(v143 + 16) + 1, 1, v143);
    v145 = *(_QWORD *)(v143 + 16);
    v144 = *(_QWORD *)(v143 + 24);
    v146 = v158;
    if (v145 >= v144 >> 1)
      v143 = sub_23EB906D0(v144 > 1, v145 + 1, 1, v143);
    *(_QWORD *)(v143 + 16) = v145 + 1;
    sub_23EB8A1A4(v135, v143+ ((*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80))+ *(_QWORD *)(v164 + 72) * v145);

    v170 = (uint64_t *)v143;
  }
  else
  {

  }
LABEL_52:
  swift_beginAccess();
  return v170;
}

uint64_t sub_23EB8CE2C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23EB8CE7C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_23EB8CECC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  id v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v1 = sub_23EB94CE8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v68 - v6;
  v8 = *(void **)&v0[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
  if (v8)
  {
    v9 = qword_256DB5048;
    v10 = v8;
    if (v9 != -1)
      swift_once();
    v11 = (id)qword_256DB5F60;
    sub_23EB94CF4();
    v12 = v0;
    v13 = sub_23EB94CDC();
    v14 = sub_23EB95078();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v69 = (uint64_t)v10;
      v17 = (_QWORD *)v16;
      v68 = swift_slowAlloc();
      v72 = (uint64_t)v12;
      v73 = v68;
      *(_DWORD *)v15 = 138412546;
      v70 = v2;
      v18 = v12;
      v71 = v1;
      v19 = v18;
      sub_23EB950A8();
      *v17 = v12;

      *(_WORD *)(v15 + 12) = 2080;
      v72 = sub_23EB908D8(0xD00000000000001ALL, 0x800000023EB97A80, &v73);
      sub_23EB950A8();
      _os_log_impl(&dword_23EB80000, v13, v14, "%@%s Presenting hosting controller for schedule access", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
      swift_arrayDestroy();
      v20 = v17;
      v10 = (id)v69;
      MEMORY[0x24265A498](v20, -1, -1);
      v21 = v68;
      swift_arrayDestroy();
      MEMORY[0x24265A498](v21, -1, -1);
      MEMORY[0x24265A498](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v70 + 8))(v7, v71);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    }
    objc_msgSend(v12, sel_addChildViewController_, v10);
    v31 = objc_msgSend(v12, sel_view);
    if (v31)
    {
      v32 = v31;
      v33 = objc_msgSend(v10, sel_view);
      if (v33)
      {
        v34 = v33;
        objc_msgSend(v32, sel_addSubview_, v33);

        v35 = objc_msgSend(v10, sel_view);
        if (v35)
        {
          v36 = v35;
          objc_msgSend(v35, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

          __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5618);
          v37 = swift_allocObject();
          *(_OWORD *)(v37 + 16) = xmmword_23EB969B0;
          v38 = objc_msgSend(v10, sel_view);
          if (v38)
          {
            v39 = v38;
            v40 = objc_msgSend(v38, sel_leadingAnchor);

            v41 = objc_msgSend(v12, sel_view);
            if (v41)
            {
              v42 = v41;
              v43 = objc_msgSend(v41, sel_leadingAnchor);

              v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);
              *(_QWORD *)(v37 + 32) = v44;
              v45 = objc_msgSend(v10, sel_view);
              if (v45)
              {
                v46 = v45;
                v47 = objc_msgSend(v45, sel_trailingAnchor);

                v48 = objc_msgSend(v12, sel_view);
                if (v48)
                {
                  v49 = v48;
                  v50 = objc_msgSend(v48, sel_trailingAnchor);

                  v51 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v50);
                  *(_QWORD *)(v37 + 40) = v51;
                  v52 = objc_msgSend(v10, sel_view);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = objc_msgSend(v52, sel_topAnchor);

                    v55 = objc_msgSend(v12, sel_view);
                    if (v55)
                    {
                      v56 = v55;
                      v57 = objc_msgSend(v55, sel_topAnchor);

                      v58 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v57);
                      *(_QWORD *)(v37 + 48) = v58;
                      v59 = objc_msgSend(v10, sel_view);
                      if (v59)
                      {
                        v60 = v59;
                        v61 = objc_msgSend(v59, sel_bottomAnchor);

                        v62 = objc_msgSend(v12, sel_view);
                        if (v62)
                        {
                          v63 = v62;
                          v64 = (void *)objc_opt_self();
                          v65 = objc_msgSend(v63, sel_bottomAnchor);

                          v66 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v65);
                          *(_QWORD *)(v37 + 56) = v66;
                          v73 = v37;
                          sub_23EB94FE8();
                          sub_23EB919DC(0, &qword_256DB5620);
                          v67 = (void *)sub_23EB94FC4();
                          swift_bridgeObjectRelease();
                          objc_msgSend(v64, sel_activateConstraints_, v67);

                          return;
                        }
                        goto LABEL_34;
                      }
LABEL_33:
                      __break(1u);
LABEL_34:
                      __break(1u);
                      return;
                    }
LABEL_32:
                    __break(1u);
                    goto LABEL_33;
                  }
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
LABEL_30:
                __break(1u);
                goto LABEL_31;
              }
LABEL_29:
              __break(1u);
              goto LABEL_30;
            }
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  if (qword_256DB5048 != -1)
    swift_once();
  v22 = (id)qword_256DB5F60;
  sub_23EB94CF4();
  v23 = v0;
  v24 = sub_23EB94CDC();
  v25 = sub_23EB9506C();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v71 = v1;
    v27 = v26;
    v28 = (_QWORD *)swift_slowAlloc();
    v69 = swift_slowAlloc();
    v72 = (uint64_t)v23;
    v73 = v69;
    *(_DWORD *)v27 = 138412546;
    v70 = v2;
    v29 = v23;
    sub_23EB950A8();
    *v28 = v23;

    *(_WORD *)(v27 + 12) = 2080;
    v72 = sub_23EB908D8(0xD00000000000001ALL, 0x800000023EB97A80, &v73);
    sub_23EB950A8();
    _os_log_impl(&dword_23EB80000, v24, v25, "%@%s Unexpected error! We have no host controller!", (uint8_t *)v27, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
    swift_arrayDestroy();
    MEMORY[0x24265A498](v28, -1, -1);
    v30 = v69;
    swift_arrayDestroy();
    MEMORY[0x24265A498](v30, -1, -1);
    MEMORY[0x24265A498](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v5, v71);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

id HUScheduleAccessViewController.init(homeID:tintColor:)(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_23EB94CA0();
  v6 = objc_msgSend(v4, sel_initWithHomeID_tintColor_, v5, a2);

  v7 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = v2;
  v6 = (void *)sub_23EB94CA0();
  v7 = objc_msgSend(v3, sel_initWithHomeID_tintColor_listRowBackgroundColor_, v6, a2, 0);

  v8 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

id HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = (void *)sub_23EB94CA0();
  v8 = objc_msgSend(v6, sel_initWithHomeID_tintColor_listRowBackgroundColor_, v7, a2, a3);

  v9 = sub_23EB94CD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

char *HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)(uint64_t a1, void *a2, char *a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  id v15;
  void *v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  char *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char *v33;
  char *v34;
  id v35;
  os_log_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v59;
  os_log_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  void *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  objc_super v73;

  v69 = a2;
  v70 = a3;
  v5 = sub_23EB94CE8();
  v67 = *(char **)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EB94CD0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v68 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5590);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v3[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *(_OWORD *)(v14 + 25) = 0u;
  *(_QWORD *)&v3[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;
  v73.receiver = v3;
  v73.super_class = (Class)HUScheduleAccessViewController;
  v15 = objc_msgSendSuper2(&v73, sel_initWithNibName_bundle_, 0, 0);
  v16 = (void *)objc_opt_self();
  v17 = (char *)v15;
  v18 = objc_msgSend(v16, sel_sharedDispatcher);
  v19 = objc_msgSend(v18, sel_homeManager);

  if (v19)
  {
    v65 = (char *)v5;
    v20 = qword_256DB5048;
    v21 = v19;
    if (v20 != -1)
      swift_once();
    v22 = (id)qword_256DB5F60;
    sub_23EB94CF4();
    v68 = v17;
    v23 = v17;
    v24 = v21;
    v25 = v23;
    v26 = v24;
    v27 = sub_23EB94CDC();
    v28 = sub_23EB95078();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v63 = v9;
      v30 = v29;
      v31 = swift_slowAlloc();
      v66 = a1;
      v32 = (_QWORD *)v31;
      v61 = swift_slowAlloc();
      v71 = (uint64_t)v25;
      v72 = v61;
      *(_DWORD *)v30 = 138412802;
      v60 = v27;
      v64 = v8;
      v33 = v25;
      v62 = v7;
      v34 = v33;
      sub_23EB950A8();
      *v32 = v25;

      *(_WORD *)(v30 + 12) = 2080;
      v71 = sub_23EB908D8(0xD00000000000002ELL, 0x800000023EB97650, &v72);
      sub_23EB950A8();
      *(_WORD *)(v30 + 22) = 2112;
      v71 = (uint64_t)v26;
      v35 = v26;
      v8 = v64;
      sub_23EB950A8();
      v32[1] = v19;

      v36 = v60;
      _os_log_impl(&dword_23EB80000, v60, v28, "%@%s HMHomeManager exists! as %@", (uint8_t *)v30, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
      swift_arrayDestroy();
      v37 = v32;
      a1 = v66;
      MEMORY[0x24265A498](v37, -1, -1);
      v38 = v61;
      swift_arrayDestroy();
      MEMORY[0x24265A498](v38, -1, -1);
      v39 = v30;
      v9 = v63;
      MEMORY[0x24265A498](v39, -1, -1);

      (*((void (**)(char *, char *))v67 + 1))(v62, v65);
    }
    else
    {

      (*((void (**)(char *, char *))v67 + 1))(v7, v65);
    }
    v57 = v69;
    sub_23EB8DFD0(a1, v69, (void (*)(_QWORD, _QWORD))v70);
    sub_23EB8CECC();

    v50 = v68;
  }
  else
  {
    v40 = sub_23EB95030();
    v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56);
    v65 = v13;
    v41(v13, 1, 1, v40);
    v42 = swift_allocObject();
    swift_unknownObjectWeakInit();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v68, a1, v8);
    sub_23EB9500C();
    v43 = v70;
    v67 = v70;
    swift_retain();
    v44 = v69;
    v66 = a1;
    v69 = v44;
    v45 = sub_23EB95000();
    v46 = v8;
    v47 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v48 = v43;
    v49 = (v10 + v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    v50 = v17;
    v51 = v9;
    v52 = (_QWORD *)swift_allocObject();
    v53 = MEMORY[0x24BEE6930];
    v52[2] = v45;
    v52[3] = v53;
    v52[4] = v42;
    v54 = (char *)v52 + v47;
    v8 = v46;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v54, v68, v46);
    v55 = v69;
    *(_QWORD *)((char *)v52 + v49) = v69;
    *(_QWORD *)((char *)v52 + ((v49 + 15) & 0xFFFFFFFFFFFFFFF8)) = v48;
    swift_release();
    v56 = (uint64_t)v52;
    v9 = v51;
    sub_23EB8F6D8((uint64_t)v65, (uint64_t)&unk_256DB55A0, v56);
    swift_release();

    a1 = v66;
    v70 = v50;
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v50;
}

uint64_t sub_23EB8DFAC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23EB8DFD0(uint64_t a1, void *a2, void (*a3)(_QWORD, _QWORD))
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  void (*v43)(os_log_t, uint64_t);
  os_log_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void **p_vtable;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  id v54;
  char *v55;
  _QWORD *v56;
  id v57;
  id v58;
  char *v59;
  _QWORD *v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  int v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  void *v68;
  _QWORD *v69;
  uint64_t v70;
  id v71;
  char *v72;
  id v73;
  uint64_t v74;
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  int v78;
  _BOOL4 v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  os_log_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  os_log_t v99;
  char *v100;
  NSObject *v101;
  uint64_t v102;
  id v103;
  os_log_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  id v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  os_log_t v124;
  os_log_t v125;
  void (*v126)(id, uint64_t, uint64_t);
  uint64_t v127;
  id v128;
  char *v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  _QWORD *v132;
  void (*v133)(char *, uint64_t);
  id v134;
  id v135;
  char *v136;
  uint64_t v137;
  char *v138;
  id v139;
  uint64_t v140;
  uint64_t v141[5];
  char v142;
  uint64_t v143;

  v133 = a3;
  v134 = a2;
  v143 = *MEMORY[0x24BDAC8D0];
  v4 = sub_23EB94CD0();
  v5 = *(_QWORD **)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v123 - v9;
  v11 = sub_23EB94CE8();
  v132 = *(_QWORD **)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v129 = (char *)&v123 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v138 = (char *)&v123 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = ((char *)&v123 - v16);
  v18 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v19 = objc_msgSend(v18, sel_homeManager);

  v135 = v19;
  if (v19)
  {
    v20 = v19;
    v21 = (void *)sub_23EB94CA0();
    v22 = objc_msgSend(v20, sel_hf_homeWithIdentifier_, v21);

  }
  else
  {
    v22 = 0;
  }
  if (qword_256DB5048 != -1)
    swift_once();
  v128 = v8;
  v23 = (id)qword_256DB5F60;
  sub_23EB94CF4();
  v24 = (_QWORD *)v5[2];
  v127 = a1;
  v126 = v24;
  ((void (*)(char *, uint64_t, uint64_t))v24)(v10, a1, v4);
  v25 = v22;
  v131 = v5;
  v26 = v25;
  v27 = v139;
  v28 = v26;
  v29 = v22;
  v30 = (char *)v27;
  v31 = v17;
  v32 = sub_23EB94CDC();
  v33 = sub_23EB95078();
  v34 = os_log_type_enabled(v32, v33);
  v130 = v4;
  v136 = v30;
  v137 = v11;
  v139 = v28;
  if (v34)
  {
    v124 = v32;
    v125 = v31;
    v35 = swift_slowAlloc();
    v36 = (_QWORD *)swift_slowAlloc();
    v123 = swift_slowAlloc();
    v140 = (uint64_t)v30;
    v141[0] = v123;
    *(_DWORD *)v35 = 138413058;
    v37 = v30;
    sub_23EB950A8();
    *v36 = v30;
    v38 = v130;

    *(_WORD *)(v35 + 12) = 2080;
    v140 = sub_23EB908D8(0xD00000000000002FLL, 0x800000023EB97A30, v141);
    sub_23EB950A8();
    *(_WORD *)(v35 + 22) = 2080;
    sub_23EB87638(&qword_256DB55E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v39 = sub_23EB95144();
    v140 = sub_23EB908D8(v39, v40, v141);
    sub_23EB950A8();
    swift_bridgeObjectRelease();
    v131 = (_QWORD *)v131[1];
    ((void (*)(char *, uint64_t))v131)(v10, v38);
    *(_WORD *)(v35 + 32) = 2112;
    v41 = v29;
    if (v29)
    {
      v28 = v139;
      v140 = (uint64_t)v139;
      v42 = v139;
      sub_23EB950A8();
    }
    else
    {
      v140 = 0;
      sub_23EB950A8();
      v28 = v139;
    }
    v36[1] = v29;

    v44 = v124;
    _os_log_impl(&dword_23EB80000, v124, v33, "%@%s Lookup result for home with id=%s as %@", (uint8_t *)v35, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
    swift_arrayDestroy();
    MEMORY[0x24265A498](v36, -1, -1);
    v45 = v123;
    swift_arrayDestroy();
    MEMORY[0x24265A498](v45, -1, -1);
    MEMORY[0x24265A498](v35, -1, -1);

    v43 = (void (*)(_QWORD, _QWORD))v132[1];
    v11 = v137;
    v43(v125, v137);
    v30 = v136;
  }
  else
  {
    v41 = v29;

    v131 = (_QWORD *)v131[1];
    ((void (*)(char *, uint64_t))v131)(v10, v4);

    v43 = (void (*)(_QWORD, _QWORD))v132[1];
    v43(v31, v11);
  }
  v46 = v138;
  if (!v133)
  {
    v47 = 0;
    p_vtable = HUTemperatureIconContentView.vtable;
    if (v41)
      goto LABEL_14;
LABEL_18:
    v71 = (id)qword_256DB5F60;
    v72 = v129;
    sub_23EB94CF4();
    v73 = v128;
    v74 = v130;
    ((void (*)(id, uint64_t, uint64_t))v126)(v128, v127, v130);
    v75 = v30;
    v76 = sub_23EB94CDC();
    v77 = sub_23EB95078();
    v78 = v77;
    v79 = os_log_type_enabled(v76, v77);
    v138 = v75;
    if (v79)
    {
      v80 = swift_slowAlloc();
      LODWORD(v126) = v78;
      v81 = v80;
      v82 = (_QWORD *)swift_slowAlloc();
      v132 = (_QWORD *)swift_slowAlloc();
      v140 = (uint64_t)v75;
      v141[0] = (uint64_t)v132;
      *(_DWORD *)v81 = 138413058;
      v125 = v76;
      v127 = v47;
      v83 = v75;
      v133 = v43;
      v84 = v30;
      v85 = v83;
      sub_23EB950A8();
      *v82 = v75;

      v30 = v84;
      *(_WORD *)(v81 + 12) = 2080;
      v140 = sub_23EB908D8(0xD00000000000002FLL, 0x800000023EB97A30, v141);
      sub_23EB950A8();
      *(_WORD *)(v81 + 22) = 2080;
      sub_23EB87638(&qword_256DB55E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v86 = sub_23EB95144();
      v140 = sub_23EB908D8(v86, v87, v141);
      sub_23EB950A8();
      swift_bridgeObjectRelease();
      ((void (*)(id, uint64_t))v131)(v73, v74);
      *(_WORD *)(v81 + 32) = 2112;
      v140 = 0;
      v47 = v127;
      sub_23EB950A8();
      v82[1] = 0;
      v88 = v125;
      _os_log_impl(&dword_23EB80000, v125, (os_log_type_t)v126, "%@%s Unable to find home with id=%s as %@", (uint8_t *)v81, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
      swift_arrayDestroy();
      v89 = v82;
      p_vtable = (void **)(HUTemperatureIconContentView + 24);
      MEMORY[0x24265A498](v89, -1, -1);
      v90 = (uint64_t)v132;
      swift_arrayDestroy();
      MEMORY[0x24265A498](v90, -1, -1);
      MEMORY[0x24265A498](v81, -1, -1);

      v133(v129, v137);
    }
    else
    {

      ((void (*)(id, uint64_t))v131)(v73, v74);
      v43(v72, v137);
    }
    type metadata accessor for ScheduleRuleList();
    swift_allocObject();
    ScheduleRuleList.init(rules:)(MEMORY[0x24BEE4AF8]);
    v93 = MEMORY[0x242659BF8](v134);
    sub_23EB87638(&qword_256DB5580, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleList, (uint64_t)&protocol conformance descriptor for ScheduleRuleList);
    swift_retain();
    v94 = sub_23EB94D60();
    v95 = (char *)p_vtable[173] + (_QWORD)v138;
    v96 = *(_QWORD *)v95;
    v97 = *((_QWORD *)v95 + 1);
    *(_QWORD *)v95 = v94;
    *((_QWORD *)v95 + 1) = v98;
    *((_QWORD *)v95 + 2) = v93;
    *((_QWORD *)v95 + 3) = 0;
    *((_QWORD *)v95 + 4) = v47;
    v95[40] = 1;
    sub_23EB8CE2C(v96, v97);
    goto LABEL_29;
  }
  v47 = MEMORY[0x242659BF8](v133);
  p_vtable = (void **)(HUTemperatureIconContentView + 24);
  if (!v41)
    goto LABEL_18;
LABEL_14:
  v133 = v43;
  v49 = v28;
  v50 = objc_msgSend(v49, sel_currentUser);
  v131 = v49;
  v51 = objc_msgSend(v49, sel_homeAccessControlForUser_, v50);

  v52 = objc_msgSend(v51, sel_restrictedGuestAccessSettings);
  v53 = objc_msgSend(v52, sel_guestAccessSchedule);
  v54 = (id)qword_256DB5F60;
  sub_23EB94CF4();
  v55 = v30;
  v132 = v53;
  v56 = v53;
  v130 = (uint64_t)v52;
  v57 = v52;
  v58 = v51;
  v59 = v55;
  v60 = v56;
  v61 = v57;
  v62 = v58;
  v63 = sub_23EB94CDC();
  v64 = sub_23EB95078();
  if (os_log_type_enabled(v63, (os_log_type_t)v64))
  {
    LODWORD(v123) = v64;
    v125 = v61;
    v127 = v47;
    v128 = v62;
    v65 = swift_slowAlloc();
    v66 = (_QWORD *)swift_slowAlloc();
    v124 = (os_log_t)swift_slowAlloc();
    v140 = (uint64_t)v59;
    v141[0] = (uint64_t)v124;
    *(_DWORD *)v65 = 138413314;
    v67 = v59;
    sub_23EB950A8();
    v129 = v59;
    *v66 = v59;

    *(_WORD *)(v65 + 12) = 2080;
    v140 = sub_23EB908D8(0xD00000000000002FLL, 0x800000023EB97A30, v141);
    sub_23EB950A8();
    *(_WORD *)(v65 + 22) = 2112;
    v68 = v60;
    if (v60)
    {
      v140 = (uint64_t)v60;
      v69 = v60;
      sub_23EB950A8();
      v70 = (uint64_t)v132;
    }
    else
    {
      v140 = 0;
      sub_23EB950A8();
      v70 = 0;
    }
    v99 = v125;
    v66[1] = v70;

    *(_WORD *)(v65 + 32) = 2112;
    v100 = v138;
    v126 = v68;
    if (v99)
    {
      v140 = (uint64_t)v99;
      v101 = v99;
      sub_23EB950A8();
      v102 = v130;
    }
    else
    {
      v140 = 0;
      sub_23EB950A8();
      v102 = 0;
    }
    v66[2] = v102;

    *(_WORD *)(v65 + 42) = 2112;
    v61 = v99;
    v92 = v128;
    v140 = (uint64_t)v128;
    v103 = v128;
    sub_23EB950A8();
    v66[3] = v92;

    _os_log_impl(&dword_23EB80000, v63, (os_log_type_t)v123, "%@%s Found access schedule {%@} from guest settings {%@} and home access control {%@}", (uint8_t *)v65, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
    swift_arrayDestroy();
    MEMORY[0x24265A498](v66, -1, -1);
    v104 = v124;
    swift_arrayDestroy();
    MEMORY[0x24265A498](v104, -1, -1);
    MEMORY[0x24265A498](v65, -1, -1);

    v91 = ((uint64_t (*)(char *, uint64_t))v133)(v100, v137);
    v47 = v127;
    v59 = v129;
    v60 = v126;
  }
  else
  {

    v91 = ((uint64_t (*)(char *, uint64_t))v133)(v46, v11);
    v92 = v62;
  }
  type metadata accessor for HUScheduleAccessViewController(v91);
  v105 = sub_23EB8BD50((uint64_t)v132, 1);
  type metadata accessor for ScheduleRuleList();
  swift_allocObject();
  ScheduleRuleList.init(rules:)((uint64_t)v105);
  v106 = MEMORY[0x242659BF8](v134);
  sub_23EB87638(&qword_256DB5580, (uint64_t (*)(uint64_t))type metadata accessor for ScheduleRuleList, (uint64_t)&protocol conformance descriptor for ScheduleRuleList);
  swift_retain();
  v107 = sub_23EB94D60();
  v109 = v108;

  p_vtable = HUTemperatureIconContentView.vtable;
  v110 = &v59[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  v111 = *(_QWORD *)&v59[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  v112 = *(_QWORD *)&v59[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList + 8];
  *(_QWORD *)v110 = v107;
  *((_QWORD *)v110 + 1) = v109;
  *((_QWORD *)v110 + 2) = v106;
  *((_QWORD *)v110 + 3) = 0;
  *((_QWORD *)v110 + 4) = v47;
  v110[40] = 1;
  sub_23EB8CE2C(v111, v112);
  v30 = v136;
LABEL_29:
  v113 = (char *)p_vtable[173] + (_QWORD)v30;
  v114 = *((_QWORD *)v113 + 1);
  if (v114)
  {
    v116 = *((_QWORD *)v113 + 3);
    v115 = *((_QWORD *)v113 + 4);
    v117 = *((_QWORD *)v113 + 2);
    v119 = v113[40];
    v141[0] = *(_QWORD *)v113;
    v118 = v141[0];
    v141[1] = v114;
    v141[2] = v117;
    v141[3] = v116;
    v141[4] = v115;
    v142 = v119 & 1;
    v120 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_256DB5588));
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    v121 = sub_23EB94DB4();

    swift_release();
    sub_23EB8CE2C(v118, v114);
    v122 = *(void **)&v30[OBJC_IVAR___HUScheduleAccessViewController_hostingController];
    *(_QWORD *)&v30[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = v121;

  }
  else
  {

    swift_release();
  }
}

uint64_t sub_23EB8EE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  sub_23EB9500C();
  v7[9] = sub_23EB95000();
  v7[10] = sub_23EB94FF4();
  v7[11] = v8;
  return swift_task_switch();
}

uint64_t sub_23EB8EEF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24265A51C](v1);
  *(_QWORD *)(v0 + 96) = v2;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v3;
    *v3 = v0;
    v3[1] = sub_23EB8EF80;
    return sub_23EB8F1FC();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23EB8EF80(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 112) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_23EB8EFF4()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, _QWORD);
  void *v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 96);
  v2 = *(void (**)(_QWORD, _QWORD))(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v3 = *(void **)(v0 + 56);
  swift_release();
  sub_23EB8DFD0(v4, v3, v2);
  sub_23EB8CECC();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB8F050()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB8F090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_23EB94CD0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_23EB8F138(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(sub_23EB94CD0() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[4];
  v10 = (uint64_t)v1 + v5;
  v11 = *(_QWORD *)((char *)v1 + v6);
  v12 = *(_QWORD *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_23EB91A84;
  return sub_23EB8EE80(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_23EB8F1FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5590);
  v1[5] = swift_task_alloc();
  v1[6] = sub_23EB9500C();
  v1[7] = sub_23EB95000();
  v1[8] = sub_23EB94FF4();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_23EB8F290()
{
  uint64_t v0;
  id v1;
  id v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v2 = objc_msgSend(v1, sel_homeManager);

  if (v2)
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v2);
  }
  else
  {
    v4 = *(char **)(v0 + 32);
    v5 = OBJC_IVAR___HUScheduleAccessViewController_task;
    *(_QWORD *)(v0 + 80) = OBJC_IVAR___HUScheduleAccessViewController_task;
    v6 = *(_QWORD *)&v4[v5];
    *(_QWORD *)(v0 + 88) = v6;
    if (v6)
    {
      swift_retain();
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5608);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5610);
      v8 = sub_23EB8F4A0;
    }
    else
    {
      v9 = *(_QWORD *)(v0 + 40);
      sub_23EB95018();
      v10 = sub_23EB95030();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
      v11 = v4;
      v12 = sub_23EB95000();
      v13 = (_QWORD *)swift_allocObject();
      v14 = MEMORY[0x24BEE6930];
      v13[2] = v12;
      v13[3] = v14;
      v13[4] = v11;
      v15 = sub_23EB8F804(v9, (uint64_t)&unk_256DB5600, (uint64_t)v13);
      *(_QWORD *)(v0 + 112) = v15;
      *(_QWORD *)&v4[v5] = v15;
      swift_retain();
      swift_release();
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5608);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5610);
      v8 = sub_23EB8F550;
    }
    *v7 = v0;
    v7[1] = v8;
    return sub_23EB9503C();
  }
}

uint64_t sub_23EB8F4A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EB8F500()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  swift_release();
  v1 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23EB8F550()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EB8F5B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 32);
  swift_release();
  v3 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v2 + v1) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_23EB8F628()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB8F670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 32);
  swift_release();
  *(_QWORD *)(v2 + v1) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB8F6D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23EB95030();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23EB95024();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23EB918BC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23EB94FF4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23EB8F804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23EB95030();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23EB95024();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23EB918BC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23EB94FF4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5608);
  return swift_task_create();
}

void __swiftcall HUScheduleAccessViewController.init(coder:)(HUScheduleAccessViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void HUScheduleAccessViewController.init(coder:)()
{
  sub_23EB917B4();
}

void __swiftcall HUScheduleAccessViewController.init(nibName:bundle:)(HUScheduleAccessViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_23EB94F88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void HUScheduleAccessViewController.init(nibName:bundle:)()
{
  sub_23EB917B4();
}

Swift::Void __swiftcall HUScheduleAccessViewController.viewDidLoad()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.super_class = (Class)HUScheduleAccessViewController;
  objc_msgSendSuper2(&v6, sel_viewDidLoad);
  v1 = (void *)sub_23EB94F88();
  v2 = (id)HFLocalizedString();

  if (!v2)
  {
    sub_23EB94F94();
    v2 = (id)sub_23EB94F88();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v0, sel_setTitle_, v2);

  v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23EB8FCB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[6] = a1;
  v4[7] = a4;
  v5 = sub_23EB94CE8();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  sub_23EB9500C();
  v4[13] = sub_23EB95000();
  v4[14] = sub_23EB94FF4();
  v4[15] = v6;
  return swift_task_switch();
}

uint64_t sub_23EB8FD60()
{
  _QWORD *v0;
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  _QWORD *v10;

  if (qword_256DB5048 != -1)
    swift_once();
  v1 = (id)qword_256DB5F60;
  sub_23EB94CF4();
  v2 = sub_23EB94CDC();
  v3 = sub_23EB95078();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23EB80000, v2, v3, "HMHomeManager is nil! Attempting to load homes to create the manager!", v4, 2u);
    MEMORY[0x24265A498](v4, -1, -1);
  }
  v5 = v0[12];
  v6 = v0[8];
  v7 = v0[9];

  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v0[16] = v8;
  v8(v5, v6);
  v9 = (void *)objc_opt_self();
  v0[17] = v9;
  v0[18] = objc_msgSend(v9, sel_sharedDispatcher);
  sub_23EB94D00();
  v10 = (_QWORD *)swift_task_alloc();
  v0[19] = v10;
  *v10 = v0;
  v10[1] = sub_23EB8FEB8;
  return sub_23EB95084();
}

uint64_t sub_23EB8FEB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 144);
    swift_bridgeObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_23EB8FF38()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v29;
  NSObject *log;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = *(void **)(v0 + 136);
  swift_release();
  v2 = objc_msgSend(v1, sel_sharedDispatcher);
  v3 = objc_msgSend(v2, sel_homeManager);

  v4 = (id)qword_256DB5F60;
  v5 = *(void **)(v0 + 56);
  if (!v3)
  {
    sub_23EB94CF4();
    v17 = v5;
    v18 = sub_23EB94CDC();
    v19 = sub_23EB95078();
    v20 = os_log_type_enabled(v18, v19);
    v10 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v21 = *(_QWORD *)(v0 + 80);
    v23 = *(void **)(v0 + 56);
    v22 = *(_QWORD *)(v0 + 64);
    if (v20)
    {
      v34 = *(_QWORD *)(v0 + 80);
      v33 = *(_QWORD *)(v0 + 64);
      v24 = swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v36 = v32;
      *(_DWORD *)v24 = 138412546;
      *(_QWORD *)(v0 + 16) = v23;
      v25 = v23;
      sub_23EB950A8();
      *v29 = v23;

      *(_WORD *)(v24 + 12) = 2080;
      *(_QWORD *)(v0 + 24) = sub_23EB908D8(0xD000000000000010, 0x800000023EB97A60, &v36);
      sub_23EB950A8();
      _os_log_impl(&dword_23EB80000, v18, v19, "%@%s HMHomeManager is still nil! Unexpected!", (uint8_t *)v24, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
      swift_arrayDestroy();
      MEMORY[0x24265A498](v29, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24265A498](v32, -1, -1);
      MEMORY[0x24265A498](v24, -1, -1);

      v10(v34, v33);
      goto LABEL_9;
    }

    v26 = v21;
    v27 = v22;
LABEL_8:
    v10(v26, v27);
    goto LABEL_9;
  }
  sub_23EB94CF4();
  v6 = v5;
  v7 = sub_23EB94CDC();
  v8 = sub_23EB95078();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(void **)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 64);
  if (!v9)
  {

    v26 = v11;
    v27 = v13;
    goto LABEL_8;
  }
  v35 = *(_QWORD *)(v0 + 88);
  v14 = swift_slowAlloc();
  log = v7;
  v15 = (_QWORD *)swift_slowAlloc();
  v31 = swift_slowAlloc();
  v36 = v31;
  *(_DWORD *)v14 = 138412546;
  *(_QWORD *)(v0 + 32) = v12;
  v16 = v12;
  sub_23EB950A8();
  *v15 = v12;

  *(_WORD *)(v14 + 12) = 2080;
  *(_QWORD *)(v0 + 40) = sub_23EB908D8(0xD000000000000010, 0x800000023EB97A60, &v36);
  sub_23EB950A8();
  _os_log_impl(&dword_23EB80000, log, v8, "%@%s Successfully created HMHomeManager!", (uint8_t *)v14, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55A8);
  swift_arrayDestroy();
  MEMORY[0x24265A498](v15, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x24265A498](v31, -1, -1);
  MEMORY[0x24265A498](v14, -1, -1);

  v10(v35, v13);
LABEL_9:
  **(_QWORD **)(v0 + 48) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB903B4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB90470(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23EB9512C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23EB9102C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x242659DCC](i, a1);
        sub_23EB919DC(0, &qword_256DB5628);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23EB9102C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_23EB9102C(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_23EB91A6C(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_23EB919DC(0, &qword_256DB5628);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23EB9102C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_23EB9102C(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_23EB91A6C(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EB906D0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5638);
  v10 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23EB95114();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23EB9169C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23EB908D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23EB909A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23EB9187C((uint64_t)v12, *a3);
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
      sub_23EB9187C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23EB909A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23EB950B4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23EB90B60(a5, a6);
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
  v8 = sub_23EB95108();
  if (!v8)
  {
    sub_23EB95114();
    __break(1u);
LABEL_17:
    result = sub_23EB95138();
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

uint64_t sub_23EB90B60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23EB90BF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23EB90DCC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23EB90DCC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23EB90BF4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23EB90D68(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23EB950F0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23EB95114();
      __break(1u);
LABEL_10:
      v2 = sub_23EB94FB8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23EB95138();
    __break(1u);
LABEL_14:
    result = sub_23EB95114();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23EB90D68(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23EB90DCC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB55E0);
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
  result = sub_23EB95138();
  __break(1u);
  return result;
}

uint64_t sub_23EB90F18(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_23EB950CC();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5618);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_23EB91394(&v8, v3 + 4, v2, a1);
  result = sub_23EB91A7C();
  if (v6 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

uint64_t sub_23EB91010(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EB91048(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23EB9102C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23EB91228(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23EB91048(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5638);
  v10 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_23EB95138();
  __break(1u);
  return result;
}

uint64_t sub_23EB91228(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5640);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23EB95138();
  __break(1u);
  return result;
}

_QWORD *sub_23EB91394(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_23EB950C0();
    sub_23EB919DC(0, &qword_256DB5628);
    sub_23EB91A14();
    result = (_QWORD *)sub_23EB95060();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (_QWORD *)v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_23EB950D8())
        goto LABEL_45;
      sub_23EB919DC(0, &qword_256DB5628);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_23EB9169C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for ScheduleRuleDisplayInfo() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_23EB95138();
  __break(1u);
  return result;
}

void sub_23EB917B4()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *(_OWORD *)(v1 + 25) = 0u;
  *(_QWORD *)&v0[OBJC_IVAR___HUScheduleAccessViewController_hostingController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___HUScheduleAccessViewController_task] = 0;

  sub_23EB950E4();
  swift_bridgeObjectRelease();
  sub_23EB95120();
  __break(1u);
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

uint64_t sub_23EB9187C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23EB918BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB5590);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EB918FC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23EB91928(uint64_t a1)
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
  v7[1] = sub_23EB91994;
  return sub_23EB8FCB0(a1, v4, v5, v6);
}

uint64_t sub_23EB91994()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23EB919DC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_23EB91A14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DB5630;
  if (!qword_256DB5630)
  {
    v1 = sub_23EB919DC(255, &qword_256DB5628);
    result = MEMORY[0x24265A42C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256DB5630);
  }
  return result;
}

_OWORD *sub_23EB91A6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23EB91A7C()
{
  return swift_release();
}

uint64_t sub_23EB91A88()
{
  uint64_t result;

  sub_23EB91AE4();
  result = sub_23EB95090();
  qword_256DB5F60 = result;
  return result;
}

unint64_t sub_23EB91AE4()
{
  unint64_t result;

  result = qword_256DB5648;
  if (!qword_256DB5648)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DB5648);
  }
  return result;
}

unint64_t sub_23EB91B20()
{
  unint64_t result;
  uint64_t v1;

  result = sub_23EB91B40();
  qword_256DB5650 = result;
  *(_QWORD *)algn_256DB5658 = v1;
  return result;
}

unint64_t sub_23EB91B40()
{
  id v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_redColor);
  v3 = 0;
  v4[0] = 0;
  v2 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v4, &v3, &v2, 0);
  sub_23EB950E4();
  swift_bridgeObjectRelease();
  sub_23EB95048();
  sub_23EB94FAC();
  swift_bridgeObjectRelease();
  sub_23EB94FAC();
  sub_23EB95048();
  sub_23EB94FAC();
  swift_bridgeObjectRelease();
  sub_23EB94FAC();
  sub_23EB95048();
  sub_23EB94FAC();

  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

uint64_t static PlatformCanary.tweet.getter()
{
  uint64_t v0;

  if (qword_256DB5050 != -1)
    swift_once();
  v0 = qword_256DB5650;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static PlatformCanary.isMacBuild.getter()
{
  return 0;
}

id PlatformCanary.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PlatformCanary.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatformCanary();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PlatformCanary()
{
  return objc_opt_self();
}

id PlatformCanary.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatformCanary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23EB91DE8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id HUIconImageNamed(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;

  v5 = a1;
  v6 = &stru_250F4A0E8;
  v7 = &stru_250F4A0E8;
  if (a2 <= 5)
    v7 = off_250F49DA8[a2];
  if (a3 != 1)
    v6 = CFSTR("-vibrant");
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v5, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HUCommonNullableImageNamed(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v5, "stringByAppendingString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HUCommonNullableImageNamed(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "stringByAppendingString:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HUCommonNullableImageNamed(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        HUCommonNullableImageNamed(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = *MEMORY[0x24BE4CE78];
          if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE4CE78]))
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIImage * _Nonnull HUIconImageNamed(NSString *__strong _Nonnull, HUIconSize, HUIconDisplayStyle)");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("HUIconDefines.m"), 42, CFSTR("No generic fallback icon found"));

          }
          HUIconImageNamed(v13, a2, a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v10;
}

id HUCommonBundle()
{
  if (qword_25433F648 != -1)
    dispatch_once(&qword_25433F648, &__block_literal_global_0);
  return (id)qword_25433F640;
}

id HUCommonImageNamed(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  HUCommonNullableImageNamed(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    NSLog(CFSTR("Missing image %@"), v1);

  return v2;
}

id HUCommonNullableImageNamed(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD *v14;

  v1 = a1;
  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v10 = __HUCommonNullableImageNamed_block_invoke;
  v11 = &unk_250F4A000;
  v12 = v1;
  v3 = v12;
  v4 = v9;
  if (qword_25433F650 != -1)
    dispatch_once(&qword_25433F650, &__block_literal_global_10);
  if (_MergedGlobals_7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HomeUICommon_%@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB0868], "systemAppPersistenteCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = ___HUCommonLoadCachedImageWithGenerationBlock_block_invoke;
    v13[3] = &unk_250F4A028;
    v14 = v4;
    objc_msgSend(v6, "imageForKey:generatingIfNecessaryWithBlock:", v5, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t sub_23EB94CA0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23EB94CAC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23EB94CB8()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23EB94CC4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23EB94CD0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23EB94CDC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23EB94CE8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23EB94CF4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23EB94D00()
{
  return MEMORY[0x24BE4CD50]();
}

uint64_t sub_23EB94D0C()
{
  return MEMORY[0x24BDF6580]();
}

uint64_t sub_23EB94D18()
{
  return MEMORY[0x24BDF6588]();
}

uint64_t sub_23EB94D24()
{
  return MEMORY[0x24BDF6590]();
}

uint64_t sub_23EB94D30()
{
  return MEMORY[0x24BDF6598]();
}

uint64_t sub_23EB94D3C()
{
  return MEMORY[0x24BDF65A0]();
}

uint64_t sub_23EB94D48()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23EB94D54()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23EB94D60()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_23EB94D6C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23EB94D78()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23EB94D84()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_23EB94D90()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23EB94D9C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23EB94DA8()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23EB94DB4()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_23EB94DC0()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_23EB94DCC()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_23EB94DD8()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_23EB94DE4()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_23EB94DF0()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_23EB94DFC()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_23EB94E08()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_23EB94E14()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_23EB94E20()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_23EB94E2C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_23EB94E38()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_23EB94E44()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23EB94E50()
{
  return MEMORY[0x24BDEF960]();
}

uint64_t sub_23EB94E5C()
{
  return MEMORY[0x24BDEF968]();
}

uint64_t sub_23EB94E68()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23EB94E74()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23EB94E80()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23EB94E8C()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23EB94E98()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23EB94EA4()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23EB94EB0()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_23EB94EBC()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23EB94EC8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23EB94ED4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23EB94EE0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23EB94EEC()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23EB94EF8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23EB94F04()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23EB94F10()
{
  return MEMORY[0x24BDF3198]();
}

uint64_t sub_23EB94F1C()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_23EB94F28()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23EB94F34()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23EB94F40()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_23EB94F4C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23EB94F58()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_23EB94F64()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_23EB94F70()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23EB94F7C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23EB94F88()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23EB94F94()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23EB94FA0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23EB94FAC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23EB94FB8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23EB94FC4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23EB94FD0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23EB94FDC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23EB94FE8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23EB94FF4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23EB95000()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23EB9500C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23EB95018()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23EB95024()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23EB95030()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23EB9503C()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23EB95048()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_23EB95054()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23EB95060()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23EB9506C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23EB95078()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23EB95084()
{
  return MEMORY[0x24BE4CD58]();
}

uint64_t sub_23EB95090()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23EB9509C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23EB950A8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23EB950B4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23EB950C0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23EB950CC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23EB950D8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23EB950E4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23EB950F0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23EB950FC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23EB95108()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23EB95114()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23EB95120()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23EB9512C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23EB95138()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23EB95144()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23EB95150()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23EB9515C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23EB95168()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23EB95174()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23EB95180()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23EB9518C()
{
  return MEMORY[0x24BEE4A98]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x24BDC4750]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x24BDC48F8]();
}

uint64_t HFLocalizedString()
{
  return MEMORY[0x24BE4CF28]();
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x24BE4CF30]();
}

uint64_t HFVibrantStateForHFCAPackageState()
{
  return MEMORY[0x24BE4CFD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BDF7C78]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return MEMORY[0x24BDF8180]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

