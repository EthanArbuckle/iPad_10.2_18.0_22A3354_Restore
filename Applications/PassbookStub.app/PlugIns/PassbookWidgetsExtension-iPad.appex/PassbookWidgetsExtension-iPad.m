uint64_t sub_1000040A0()
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
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[4];

  v0 = type metadata accessor for Locale.Language(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Locale(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004334(&qword_100018AB0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static Locale.current.getter(v9);
  Locale.language.getter(v12);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  Locale.Language.region.getter(v13);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v14 = type metadata accessor for Locale.Region(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14);
  if (v16 == 1)
  {
    result = sub_1000043B8((uint64_t)v11);
    v18 = 0;
  }
  else
  {
    v19 = Locale.Region.identifier.getter();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
    v23[2] = v19;
    v23[3] = v21;
    v23[0] = 21333;
    v23[1] = 0xE200000000000000;
    v22 = sub_1000043F8();
    v18 = StringProtocol.caseInsensitiveCompare<A>(_:)(v23, &type metadata for String, &type metadata for String, v22, v22);
    result = swift_bridgeObjectRelease(v21);
  }
  qword_100019150 = v18;
  byte_100019158 = v16 == 1;
  return result;
}

uint64_t sub_100004274(__int128 *a1)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  if (!sub_10000F8C0(2, 17, 0, 0))
    return v2;
  v3 = v2;
  return swift_getOpaqueTypeMetadata2(0, &v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration._contentMarginsDisabled()>>, 0);
}

uint64_t sub_1000042D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v2 = *a1;
  v1 = a1[1];
  if (sub_10000F8C0(2, 17, 0, 0))
  {
    v4[0] = v2;
    v4[1] = v1;
    return swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of WidgetConfiguration._contentMarginsDisabled()>>, 1);
  }
  return v1;
}

uint64_t sub_100004334(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004374(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000043B8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004334(&qword_100018AB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000043F8()
{
  unint64_t result;

  result = qword_100018AB8;
  if (!qword_100018AB8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100018AB8);
  }
  return result;
}

uint64_t sub_10000443C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v0 = type metadata accessor for Logger(0);
  sub_1000044CC(v0, qword_100019160);
  sub_10000450C(v0, (uint64_t)qword_100019160);
  v1 = static String._unconditionallyBridgeFromObjectiveC(_:)(PKLogSubsystem);
  v3 = v2;
  result = PKLogFacilityTypeGetName(31);
  if (result)
  {
    v5 = String.init(cString:)();
    return Logger.init(subsystem:category:)(v1, v3, v5, v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_1000044CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10000450C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void **sub_100004524(void **a1, void **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char v20;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v5;
    v12 = sub_100004334(&qword_100018AC0);
    if (swift_getEnumCaseMultiPayload(v10, v12) == 1)
    {
      v13 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
      v14 = 1;
    }
    else
    {
      v15 = *v10;
      *v9 = *v10;
      swift_retain(v15);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v12, v14);
    v16 = *(int *)(a3 + 24);
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = *(_QWORD *)v18;
    v20 = v18[8];
    sub_100004628(*(_QWORD *)v18, v20);
    *(_QWORD *)v17 = v19;
    v17[8] = v20;
  }
  return a1;
}

uint64_t sub_100004628(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_100004634(id *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  v5 = sub_100004334(&qword_100018AC0);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  return sub_1000046C4(*(uint64_t *)((char *)a1 + *(int *)(a2 + 24)), *((_BYTE *)a1 + *(int *)(a2 + 24) + 8));
}

uint64_t sub_1000046C4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

void **sub_1000046D0(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char v19;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)((char *)a1 + v7);
  v9 = (uint64_t *)((char *)a2 + v7);
  v10 = v6;
  v11 = sub_100004334(&qword_100018AC0);
  if (swift_getEnumCaseMultiPayload(v9, v11) == 1)
  {
    v12 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    v13 = 1;
  }
  else
  {
    v14 = *v9;
    *v8 = *v9;
    swift_retain(v14);
    v13 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v11, v13);
  v15 = *(int *)(a3 + 24);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = v17[8];
  sub_100004628(*(_QWORD *)v17, v19);
  *(_QWORD *)v16 = v18;
  v16[8] = v19;
  return a1;
}

void **sub_1000047B0(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_1000048B4((uint64_t)a1 + v9);
    v12 = sub_100004334(&qword_100018AC0);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v15 = *v11;
      *v10 = *v11;
      swift_retain(v15);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
  }
  v16 = *(int *)(a3 + 24);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)v18;
  v20 = v18[8];
  sub_100004628(*(_QWORD *)v18, v20);
  v21 = *(_QWORD *)v17;
  v22 = v17[8];
  *(_QWORD *)v17 = v19;
  v17[8] = v20;
  sub_1000046C4(v21, v22);
  return a1;
}

uint64_t sub_1000048B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004334(&qword_100018AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_1000048F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_100004334(&qword_100018AC0);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  return a1;
}

void **sub_1000049C8(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_1000048B4((uint64_t)a1 + v7);
    v10 = sub_100004334(&qword_100018AC0);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(_QWORD *)v14;
  LOBYTE(v14) = v14[8];
  v16 = *(_QWORD *)v13;
  v17 = v13[8];
  *(_QWORD *)v13 = v15;
  v13[8] = (char)v14;
  sub_1000046C4(v16, v17);
  return a1;
}

uint64_t sub_100004AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004ACC);
}

uint64_t sub_100004ACC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100004334(&qword_100018AC8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_100004B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004B58);
}

char *sub_100004B58(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_100004334(&qword_100018AC8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for BridgedSpendingSummaryChartView(uint64_t a1)
{
  uint64_t result;

  result = qword_100018B28;
  if (!qword_100018B28)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BridgedSpendingSummaryChartView);
  return result;
}

void sub_100004C0C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_100004C8C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = "\t";
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_100004C8C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100018B38)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100018B38);
  }
}

uint64_t sub_100004CE0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000111CC, 1);
}

void sub_100004CF0(void **a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  uint64_t v13;
  char v14;
  double v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v23[5];

  v4 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v23[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = GeometryProxy.size.getter(v6);
  v11 = v10;
  v12 = (char *)a1 + *(int *)(type metadata accessor for BridgedSpendingSummaryChartView(0) + 24);
  v13 = *(_QWORD *)v12;
  v14 = v12[8];
  sub_100004628(*(_QWORD *)v12, v14);
  v15 = sub_100007AB4(v13, v14);
  sub_1000046C4(v13, v14);
  sub_100007874((uint64_t)v8);
  v16 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v16 == enum case for ColorScheme.light(_:))
  {
    v17 = 1;
  }
  else if (v16 == enum case for ColorScheme.dark(_:))
  {
    v17 = 2;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v17 = 0;
  }
  v18 = *a1;
  v23[0] = v9;
  v23[1] = v11;
  v23[2] = v15;
  *(_QWORD *)&v23[3] = v17;
  *(_QWORD *)&v23[4] = v18;
  v19 = v18;
  v20 = sub_100005184(v23);
  v21 = Image.init(uiImage:)(v20);

  *a2 = v21;
}

uint64_t sub_100004E70()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100004E88@<X0>(uint64_t a1@<X0>, void (**a2)(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin();
  sub_100004F2C(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_100014BE8, v7 + v5, v6 | 7);
  result = sub_100005044((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_100005088;
  a2[1] = (void (*)(uint64_t *@<X8>))v8;
  return result;
}

uint64_t sub_100004F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BridgedSpendingSummaryChartView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for BridgedSpendingSummaryChartView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = sub_100004334(&qword_100018AC0);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  sub_1000046C4(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 24)), *(_BYTE *)(v0 + v4 + *(int *)(v1 + 24) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100005044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BridgedSpendingSummaryChartView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100005088(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BridgedSpendingSummaryChartView(0) - 8) + 80);
  sub_100004CF0((void **)(v1 + ((v3 + 16) & ~v3)), a1);
}

void sub_1000050D4(void *a1, id a2)
{
  id v3;
  id v4;

  v3 = objc_msgSend(a2, "layer");
  v4 = objc_msgSend(a1, "CGContext");
  objc_msgSend(v3, "renderInContext:", v4);

}

void sub_100005150(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_100005184(double *a1)
{
  double v2;
  double v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t result;
  _QWORD v20[5];
  uint64_t v21;

  v2 = *a1;
  v3 = a1[1];
  v4 = objc_msgSend(objc_allocWithZone((Class)PKSpendingSummaryChartView), "initWithFrame:", 0.0, 0.0, *a1, v3);
  objc_msgSend(v4, "setPrioritizeLegendPlacement:", 1);
  objc_msgSend(v4, "setShowPlaceholders:", 1);
  v5 = (void *)*((_QWORD *)a1 + 4);
  v6 = objc_msgSend(v5, "summaryType");
  v7 = objc_msgSend(v5, "summaryType");
  if (v6)
    v8 = v7 == (id)1;
  else
    v8 = 1;
  v9 = v8;
  objc_msgSend(v4, "setShowLegendLabels:", v9);
  objc_msgSend(v4, "configureWithSummary:presentationStyle:", v5, 3);
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", *((_QWORD *)a1 + 3));
  v10 = sub_1000053F8();
  v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(v10), "defaultFormat");
  objc_msgSend(v11, "setScale:", a1[2]);
  v12 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:format:", v11, v2, v3);
  v13 = swift_allocObject(&unk_100014C10, 24, 7);
  *(_QWORD *)(v13 + 16) = v4;
  v14 = swift_allocObject(&unk_100014C38, 32, 7);
  *(_QWORD *)(v14 + 16) = sub_100005458;
  *(_QWORD *)(v14 + 24) = v13;
  v20[4] = sub_100005470;
  v21 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_100005150;
  v20[3] = &unk_100014C50;
  v15 = _Block_copy(v20);
  v16 = v21;
  v17 = v4;
  swift_retain(v14);
  swift_release(v16);
  v18 = objc_msgSend(v12, "imageWithActions:", v15);

  _Block_release(v15);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v14, "", 129, 56, 36, 1);
  swift_release(v13);
  result = swift_release(v14);
  if ((v11 & 1) == 0)
    return (uint64_t)v18;
  __break(1u);
  return result;
}

unint64_t sub_1000053F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018B70;
  if (!qword_100018B70)
  {
    v1 = objc_opt_self(UIGraphicsImageRendererFormat);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100018B70);
  }
  return result;
}

uint64_t sub_100005434()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100005458(void *a1)
{
  uint64_t v1;

  sub_1000050D4(a1, *(id *)(v1 + 16));
}

uint64_t sub_100005460()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005470()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005490(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000054A0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000054AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018B78;
  if (!qword_100018B78)
  {
    v1 = sub_100004374(&qword_100018B80);
    result = swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100018B78);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CreditBalanceView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for AppleCardWidgetDataManager.CreditBalanceModel(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

_QWORD *initializeWithCopy for AppleCardWidgetDataManager.CreditBalanceModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for AppleCardWidgetDataManager.CreditBalanceModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for AppleCardWidgetDataManager.CreditBalanceModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CreditBalanceView()
{
  return &type metadata for CreditBalanceView;
}

uint64_t sub_100005744(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011210, 1);
}

id sub_100005754@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
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
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  id result;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v99 = a2;
  sub_100004334(&qword_100018B90);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v100 = (uint64_t)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v98 = (uint64_t)&v84 - v5;
  v85 = sub_100004334(&qword_100018B98);
  __chkstk_darwin(v85);
  v90 = (uint64_t *)((char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = type metadata accessor for ContentTransition(0);
  v88 = *(_QWORD *)(v89 - 8);
  __chkstk_darwin(v89);
  v87 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_100004334(&qword_100018BA0);
  v8 = __chkstk_darwin(v84);
  v97 = (uint64_t)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v86 = (char *)&v84 - v11;
  __chkstk_darwin(v10);
  v93 = (uint64_t)&v84 - v12;
  v95 = sub_100004334(&qword_100018BA8);
  v92 = *(_QWORD *)(v95 - 8);
  v13 = __chkstk_darwin(v95);
  v94 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v84 - v15;
  v17 = *a1;
  v18 = a1[1];
  v19 = a1[2];
  v96 = a1;
  v102 = a1[3];
  v103 = v19;
  v104 = v17;
  v105 = v18;
  v20 = sub_1000043F8();
  v101 = v20;
  swift_bridgeObjectRetain(v18);
  v21 = Text.init<A>(_:)(&v104, &type metadata for String, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  v28 = static Font.footnote.getter();
  v29 = Text.font(_:)(v28, v21, v23, v27, v25);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  swift_release(v28);
  sub_10000617C(v21, v23, v27);
  swift_bridgeObjectRelease(v25);
  KeyPath = swift_getKeyPath(&unk_100010A38);
  v104 = v29;
  v105 = v31;
  v106 = v33 & 1;
  v107 = v35;
  v108 = KeyPath;
  v109 = 0x3FE999999999999ALL;
  v37 = sub_100004334(&qword_100018BB0);
  v38 = sub_100006210();
  v91 = v16;
  View.widgetAccentable(_:)(1, v37, v38);
  sub_10000617C(v29, v31, v33 & 1);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v35);
  v104 = v103;
  v105 = v102;
  swift_bridgeObjectRetain(v102);
  v39 = Text.init<A>(_:)(&v104, &type metadata for String, v101);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  result = (id)PKFontForDesign(UIFontDescriptorSystemDesignRounded, UIFontTextStyleTitle2, UIContentSizeCategoryExtraExtraLarge, 2, 0);
  if (result)
  {
    v47 = v43 & 1;
    v48 = Font.init(_:)();
    v49 = Text.font(_:)(v48, v39, v41, v43 & 1, v45);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    swift_release(v48);
    LOBYTE(v48) = v53 & 1;
    sub_10000617C(v39, v41, v47);
    v56 = swift_bridgeObjectRelease(v45);
    v57 = static Font.Weight.bold.getter(v56);
    v58 = Text.fontWeight(_:)(*(_QWORD *)&v57, 0, v49, v51, v53 & 1, v55);
    v60 = v59;
    v62 = v61;
    v64 = v63 & 1;
    sub_10000617C(v49, v51, v48);
    swift_bridgeObjectRelease(v55);
    v65 = swift_getKeyPath(&unk_100010A38);
    v66 = v87;
    static ContentTransition.numericText(countsDown:)(0);
    v67 = swift_getKeyPath(&unk_100010A68);
    v68 = v90;
    v69 = v88;
    v70 = v89;
    (*(void (**)(char *, char *, uint64_t))(v88 + 16))((char *)v90 + *(int *)(v85 + 28), v66, v89);
    *v68 = v67;
    v71 = (uint64_t)v86;
    sub_100006310((uint64_t)v68, (uint64_t)&v86[*(int *)(v84 + 36)], &qword_100018B98);
    *(_QWORD *)v71 = v58;
    *(_QWORD *)(v71 + 8) = v60;
    *(_BYTE *)(v71 + 16) = v64;
    *(_QWORD *)(v71 + 24) = v62;
    *(_QWORD *)(v71 + 32) = v65;
    *(_QWORD *)(v71 + 40) = 0x3FE999999999999ALL;
    sub_1000062B8(v58, v60, v64);
    swift_bridgeObjectRetain(v62);
    swift_retain(v65);
    sub_100006354((uint64_t)v68, &qword_100018B98);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v66, v70);
    sub_10000617C(v58, v60, v64);
    swift_release(v65);
    swift_bridgeObjectRelease(v62);
    v72 = v93;
    sub_1000062C8(v71, v93);
    v73 = v98;
    sub_100005DD8(v98);
    v74 = v92;
    v75 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
    v77 = v94;
    v76 = v95;
    v78 = v91;
    v75(v94, v91, v95);
    v79 = v97;
    sub_100006310(v72, v97, &qword_100018BA0);
    v80 = v100;
    sub_100006310(v73, v100, &qword_100018B90);
    v81 = v99;
    v75(v99, v77, v76);
    v82 = sub_100004334(&qword_100018BD0);
    sub_100006310(v79, (uint64_t)&v81[*(int *)(v82 + 48)], &qword_100018BA0);
    sub_100006310(v80, (uint64_t)&v81[*(int *)(v82 + 64)], &qword_100018B90);
    sub_100006354(v73, &qword_100018B90);
    sub_100006354(v72, &qword_100018BA0);
    v83 = *(void (**)(char *, uint64_t))(v74 + 8);
    v83(v78, v76);
    sub_100006354(v80, &qword_100018B90);
    sub_100006354(v79, &qword_100018BA0);
    return (id)((uint64_t (*)(char *, uint64_t))v83)(v77, v76);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005DD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t KeyPath;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  _QWORD v61[2];

  v3 = sub_100004334(&qword_100018B98);
  __chkstk_darwin();
  v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ContentTransition(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004334(&qword_100018BA0);
  __chkstk_darwin();
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v1 + 40);
  if (!v14)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, 1, 1);
  v61[0] = *(_QWORD *)(v1 + 32);
  v61[1] = v14;
  v57 = v10;
  v59 = v11;
  v15 = sub_1000043F8();
  swift_bridgeObjectRetain(v14);
  v16 = Text.init<A>(_:)(v61, &type metadata for String, v15);
  v18 = v17;
  v56 = v7;
  v20 = v19;
  v60 = v9;
  v22 = v21 & 1;
  v23 = static Font.footnote.getter();
  v55 = v3;
  v24 = v23;
  v25 = Text.font(_:)(v23, v16, v18, v22, v20);
  v53 = (uint64_t *)v5;
  v54 = v6;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v58 = a1;
  v32 = v31;
  swift_release(v24);
  LOBYTE(v24) = v30 & 1;
  sub_10000617C(v16, v18, v22);
  v33 = swift_bridgeObjectRelease(v20);
  v34 = static Color.secondary.getter(v33);
  v35 = Text.foregroundColor(_:)(v34, v26, v28, v30 & 1, v32);
  v37 = v36;
  LOBYTE(v20) = v38;
  v52 = v39;
  swift_release(v34);
  LOBYTE(v34) = v20 & 1;
  sub_10000617C(v26, v28, v24);
  swift_bridgeObjectRelease(v32);
  KeyPath = swift_getKeyPath(&unk_100010A38);
  v41 = v60;
  static ContentTransition.numericText(countsDown:)(0);
  v42 = swift_getKeyPath(&unk_100010A68);
  v43 = v56;
  v45 = v53;
  v44 = v54;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))((char *)v53 + *(int *)(v55 + 28), v41, v54);
  *v45 = v42;
  v46 = v57;
  v47 = (uint64_t)v45;
  sub_100006310((uint64_t)v45, (uint64_t)&v13[*(int *)(v57 + 36)], &qword_100018B98);
  *(_QWORD *)v13 = v35;
  *((_QWORD *)v13 + 1) = v37;
  v13[16] = v34;
  v48 = v52;
  *((_QWORD *)v13 + 3) = v52;
  *((_QWORD *)v13 + 4) = KeyPath;
  *((_QWORD *)v13 + 5) = 0x3FE999999999999ALL;
  sub_1000062B8(v35, v37, v34);
  swift_bridgeObjectRetain(v48);
  swift_retain(KeyPath);
  sub_100006354(v47, &qword_100018B98);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v60, v44);
  sub_10000617C(v35, v37, v34);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v48);
  v49 = v58;
  sub_1000062C8((uint64_t)v13, v58);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v59 + 56))(v49, 0, 1, v46);
}

id sub_10000611C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  _OWORD *v7;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[3];

  v9 = v7[1];
  v12[0] = *v7;
  v12[1] = v9;
  v12[2] = v7[2];
  *(_QWORD *)a7 = static HorizontalAlignment.leading.getter(a1, a2, a3, a4, a5, a6);
  *(_QWORD *)(a7 + 8) = 0;
  *(_BYTE *)(a7 + 16) = 1;
  v10 = sub_100004334(&qword_100018B88);
  return sub_100005754((uint64_t *)v12, (char *)(a7 + *(int *)(v10 + 44)));
}

uint64_t sub_10000617C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000618C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ContentTransition(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.contentTransition.setter(v3);
}

unint64_t sub_100006210()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018BB8;
  if (!qword_100018BB8)
  {
    v1 = sub_100004374(&qword_100018BB0);
    sub_1000063BC(&qword_100018BC0, &qword_100018BC8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018BB8);
  }
  return result;
}

uint64_t sub_100006294()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_1000062B8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000062C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004334(&qword_100018BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006310(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004334(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006354(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004334(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006390()
{
  return sub_1000063BC(&qword_100018BD8, &qword_100018BE0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_1000063BC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004374(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1000063FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char v21;
  id v22;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    if (v11)
    {
      *(_QWORD *)v9 = *(_QWORD *)v10;
      *((_QWORD *)v9 + 1) = v11;
      v12 = *((_QWORD *)v10 + 3);
      *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
      *((_QWORD *)v9 + 3) = v12;
      v13 = *((_QWORD *)v10 + 5);
      *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
      *((_QWORD *)v9 + 5) = v13;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRetain(v13);
    }
    else
    {
      v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    v16 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v9 + 6) = v16;
    v9[56] = v10[56];
    v17 = *(int *)(a3 + 20);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *(_QWORD *)v19;
    v21 = v19[8];
    v22 = v16;
    sub_100004628(v20, v21);
    *(_QWORD *)v18 = v20;
    v18[8] = v21;
  }
  return a1;
}

uint64_t sub_100006520(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  v6 = *(_QWORD *)(v5 + 8);
  if (v6)
  {
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + 24));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + 40));
  }

  return sub_1000046C4(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_BYTE *)(a1 + *(int *)(a2 + 20) + 8));
}

uint64_t sub_1000065A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  if (v10)
  {
    *(_QWORD *)v8 = *(_QWORD *)v9;
    *(_QWORD *)(v8 + 8) = v10;
    v11 = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(v8 + 24) = v11;
    v12 = *(_QWORD *)(v9 + 40);
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
    *(_QWORD *)(v8 + 40) = v12;
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
  }
  else
  {
    v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  v14 = *(void **)(v9 + 48);
  *(_QWORD *)(v8 + 48) = v14;
  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  v15 = *(int *)(a3 + 20);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  v20 = v14;
  sub_100004628(v18, v19);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v19;
  return a1;
}

uint64_t sub_1000066A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  v11 = *(_QWORD *)(a2 + v7 + 8);
  if (v10)
  {
    if (v11)
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      v12 = *((_QWORD *)v9 + 1);
      *(_QWORD *)(v8 + 8) = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v10);
      *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
      v13 = *((_QWORD *)v9 + 3);
      v14 = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v14);
      *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
      v15 = *((_QWORD *)v9 + 5);
      v16 = *(_QWORD *)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v15;
      swift_bridgeObjectRetain(v15);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      sub_10000684C((_QWORD *)v8);
      v21 = v9[1];
      v20 = v9[2];
      *(_OWORD *)v8 = *v9;
      *(_OWORD *)(v8 + 16) = v21;
      *(_OWORD *)(v8 + 32) = v20;
    }
  }
  else if (v11)
  {
    *(_QWORD *)v8 = *(_QWORD *)v9;
    v17 = *((_QWORD *)v9 + 1);
    *(_QWORD *)(v8 + 8) = v17;
    *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
    v18 = *((_QWORD *)v9 + 3);
    *(_QWORD *)(v8 + 24) = v18;
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    v19 = *((_QWORD *)v9 + 5);
    *(_QWORD *)(v8 + 40) = v19;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v19);
  }
  else
  {
    v22 = *v9;
    v23 = v9[2];
    *(_OWORD *)(v8 + 16) = v9[1];
    *(_OWORD *)(v8 + 32) = v23;
    *(_OWORD *)v8 = v22;
  }
  v24 = *(void **)(v8 + 48);
  v25 = (void *)*((_QWORD *)v9 + 6);
  *(_QWORD *)(v8 + 48) = v25;
  v26 = v25;

  *(_BYTE *)(v8 + 56) = *((_BYTE *)v9 + 56);
  v27 = *(int *)(a3 + 20);
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = *(_QWORD *)v29;
  v31 = *(_BYTE *)(v29 + 8);
  sub_100004628(*(_QWORD *)v29, v31);
  v32 = *(_QWORD *)v28;
  v33 = *(_BYTE *)(v28 + 8);
  *(_QWORD *)v28 = v30;
  *(_BYTE *)(v28 + 8) = v31;
  sub_1000046C4(v32, v33);
  return a1;
}

_QWORD *sub_10000684C(_QWORD *a1)
{
  destroy for AppleCardWidgetDataManager.CreditBalanceModel(a1);
  return a1;
}

uint64_t sub_100006880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  *(_OWORD *)((char *)v8 + 41) = *(_OWORD *)((char *)v9 + 41);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  return a1;
}

uint64_t sub_100006918(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  __int128 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (!v10)
    goto LABEL_5;
  v11 = *(_QWORD *)(v9 + 8);
  if (!v11)
  {
    sub_10000684C((_QWORD *)v8);
LABEL_5:
    v16 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v16;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    goto LABEL_6;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v11;
  swift_bridgeObjectRelease(v10);
  v12 = *(_QWORD *)(v9 + 24);
  v13 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v8 + 24) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(v9 + 40);
  v15 = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 40) = v14;
  swift_bridgeObjectRelease(v15);
LABEL_6:
  v17 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);

  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  v18 = *(int *)(a3 + 20);
  v19 = a1 + v18;
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  LOBYTE(v20) = *((_BYTE *)v20 + 8);
  v22 = *(_QWORD *)v19;
  v23 = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v19 = v21;
  *(_BYTE *)(v19 + 8) = (_BYTE)v20;
  sub_1000046C4(v22, v23);
  return a1;
}

uint64_t sub_100006A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006A28);
}

uint64_t sub_100006A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 > 1)
    return (v9 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_100006AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006AB0);
}

uint64_t sub_100006AB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  return result;
}

uint64_t type metadata accessor for AppleCardContentView(uint64_t a1)
{
  uint64_t result;

  result = qword_100018C40;
  if (!qword_100018C40)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppleCardContentView);
  return result;
}

uint64_t sub_100006B68(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for AppleCardWidgetTimelineEntry(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\t";
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100006BD8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011260, 1);
}

uint64_t sub_100006BE8@<X0>(char *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  double v39;
  char v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t OpaqueTypeConformance2;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[4];
  __int128 v72;

  v68 = sub_100004334(&qword_100018C80);
  __chkstk_darwin(v68);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004334(&qword_100018C88);
  __chkstk_darwin(v8);
  v66 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_100004334(&qword_100018C90);
  __chkstk_darwin(v64);
  v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100004334(&qword_100018C98);
  __chkstk_darwin(v12);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100004334(&qword_100018CA0);
  __chkstk_darwin(v15);
  v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_100004334(&qword_100018CA8);
  v65 = *(_QWORD *)(v67 - 8);
  v18 = __chkstk_darwin(v67);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v64 - v21;
  v23 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  v29 = &a1[*(int *)(v23 + 20)];
  v30 = *((_QWORD *)v29 + 1);
  v69 = a3;
  if (!v30)
  {
    v66 = (char *)v15;
    __asm { BR              X10 }
  }
  v32 = *((_QWORD *)v29 + 2);
  v31 = *((_QWORD *)v29 + 3);
  v71[0] = *(_QWORD *)v29;
  v71[1] = v30;
  v71[2] = v32;
  v71[3] = v31;
  v72 = *((_OWORD *)v29 + 2);
  *(_QWORD *)v14 = static HorizontalAlignment.leading.getter(v23, v24, v25, v26, v27, v28);
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 1;
  v33 = sub_100004334(&qword_100018D18);
  sub_100007350(v71, a1, &v14[*(int *)(v33 + 44)]);
  v34 = &a1[*(int *)(type metadata accessor for AppleCardContentView(0) + 20)];
  v35 = *(_QWORD *)v34;
  v36 = v34[8];
  sub_100004628(*(_QWORD *)v34, v36);
  v37 = sub_100007C74(v35, v36);
  v38 = sub_1000046C4(v35, v36);
  if ((v37 & 1) != 0)
    v39 = 16.0;
  else
    v39 = 0.0;
  v40 = static Edge.Set.all.getter(v38);
  v41 = EdgeInsets.init(_all:)(v39);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  sub_100006310((uint64_t)v14, (uint64_t)v17, &qword_100018C98);
  v48 = &v17[*(int *)(v15 + 36)];
  *v48 = v40;
  *((double *)v48 + 1) = v41;
  *((_QWORD *)v48 + 2) = v43;
  *((_QWORD *)v48 + 3) = v45;
  *((_QWORD *)v48 + 4) = v47;
  v48[40] = 0;
  v49 = sub_100006354((uint64_t)v14, &qword_100018C98);
  if ((PKIsPad(v49) & 1) != 0)
  {
    v50 = v68;
    v51 = v64;
    if (qword_100018A98 != -1)
      swift_once(&qword_100018A98, sub_10000EEE0);
    v52 = qword_100019190;
  }
  else
  {
    v50 = v68;
    v51 = v64;
    if (qword_100018A90 != -1)
      swift_once(&qword_100018A90, sub_10000EE34);
    v52 = qword_100019178;
  }
  v53 = sub_10000450C(v51, (uint64_t)v52);
  sub_100006310(v53, (uint64_t)v11, &qword_100018C90);
  v54 = sub_10000861C();
  View.widgetURL(_:)(v11, v15, v54);
  sub_100006354((uint64_t)v11, &qword_100018C90);
  sub_100006354((uint64_t)v17, &qword_100018CA0);
  v55 = v65;
  v56 = v20;
  v57 = v67;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v22, v56, v67);
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v7, v22, v57);
  swift_storeEnumTagMultiPayload(v7, v50, 0);
  v58 = sub_100004334(&qword_100018CB8);
  v70[0] = v15;
  v70[1] = v54;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v70, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
  v60 = sub_1000086A0();
  v61 = (uint64_t)v66;
  _ConditionalContent<>.init(storage:)(v7, v57, v58, OpaqueTypeConformance2, v60);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v22, v57);
  v62 = sub_100004334(&qword_100018CB0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v61, 0, 1, v62);
  return sub_1000088F4(v61, v69, &qword_100018C88);
}

uint64_t sub_100007350@<X0>(_QWORD *a1@<X0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  uint64_t KeyPath;
  char *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t OpaqueTypeConformance2;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  char *v51;
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
  unint64_t v62;
  _BYTE v63[16];
  __int128 v64;
  _OWORD v65[2];

  v51 = a2;
  v5 = *a1;
  v6 = a1[1];
  v56 = a1[2];
  v57 = v5;
  v59 = a1[3];
  v60 = v6;
  v7 = (uint64_t)(a1 + 4);
  v55 = a1[4];
  v58 = a1[5];
  v8 = sub_100004334(&qword_100018AC8);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for BridgedSpendingSummaryChartView(0);
  __chkstk_darwin(v11);
  v13 = (uint64_t *)((char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v53 = sub_100004334(&qword_100018D20);
  v50 = *(_QWORD *)(v53 - 8);
  v14 = __chkstk_darwin(v53);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v49 - v17;
  v52 = sub_100004334(&qword_100018D28);
  __chkstk_darwin(v52);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100004334(&qword_100018D30);
  v22 = __chkstk_darwin(v21);
  v54 = (uint64_t)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v25 = (char *)&v49 - v24;
  v26 = *(_OWORD *)a1;
  v64 = *((_OWORD *)a1 + 1);
  v65[0] = v26;
  sub_1000088F4(v7, (uint64_t)v63, &qword_100018D38);
  v27 = *(void **)&v51[*(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20) + 48];
  if (v27)
  {
    *v10 = swift_getKeyPath(&unk_100010BB0);
    v28 = sub_100004334(&qword_100018AC0);
    swift_storeEnumTagMultiPayload(v10, v28, 0);
    KeyPath = swift_getKeyPath(&unk_100010BE0);
    *v13 = v27;
    sub_1000088F4((uint64_t)v10, (uint64_t)v13 + *(int *)(v11 + 20), &qword_100018AC8);
    v30 = (char *)v13 + *(int *)(v11 + 24);
    *(_QWORD *)v30 = KeyPath;
    v30[8] = 0;
    v31 = v27;
    sub_100008814((uint64_t)v65);
    sub_100008814((uint64_t)&v64);
    sub_100008814((uint64_t)v63);
    v32 = sub_10000883C();
    v51 = (char *)v31;
    View.widgetAccentable(_:)(1, v11, v32);
    sub_100008938((uint64_t)v13);
    v33 = v50;
    v34 = v53;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v18, v16, v53);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v20, v18, v34);
    swift_storeEnumTagMultiPayload(v20, v52, 0);
    v35 = sub_100004334(&qword_100018D40);
    v61 = v11;
    v62 = v32;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
    v37 = sub_1000063BC(&qword_100018D50, &qword_100018D40, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    _ConditionalContent<>.init(storage:)(v20, v34, v35, OpaqueTypeConformance2, v37);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v34);
  }
  else
  {
    sub_100008814((uint64_t)v65);
    sub_100008814((uint64_t)&v64);
    v38 = sub_100008814((uint64_t)v63);
    *(_QWORD *)v20 = static Color.clear.getter(v38);
    *((_WORD *)v20 + 4) = 256;
    swift_storeEnumTagMultiPayload(v20, v52, 1);
    v39 = sub_100004334(&qword_100018D40);
    v40 = sub_10000883C();
    v61 = v11;
    v62 = v40;
    v41 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
    v42 = sub_1000063BC(&qword_100018D50, &qword_100018D40, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    _ConditionalContent<>.init(storage:)(v20, v53, v39, v41, v42);
  }
  v43 = v54;
  sub_100006310((uint64_t)v25, v54, &qword_100018D30);
  v44 = v58;
  v46 = v59;
  v45 = v60;
  *a3 = v57;
  a3[1] = v45;
  a3[2] = v56;
  a3[3] = v46;
  a3[4] = v55;
  a3[5] = v44;
  v47 = sub_100004334(&qword_100018D58);
  sub_100006310(v43, (uint64_t)a3 + *(int *)(v47 + 48), &qword_100018D30);
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v46);
  sub_100006354((uint64_t)v25, &qword_100018D30);
  sub_100006354(v43, &qword_100018D30);
  swift_bridgeObjectRelease(v44);
  swift_bridgeObjectRelease(v46);
  return swift_bridgeObjectRelease(v45);
}

uint64_t sub_100007814@<X0>(_QWORD *a1@<X8>)
{
  char *v1;
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1[*(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20) + 56];
  *a1 = static Alignment.center.getter();
  a1[1] = v4;
  v5 = sub_100004334(&qword_100018C78);
  return sub_100006BE8(v1, v3, (uint64_t)a1 + *(int *)(v5 + 44));
}

uint64_t sub_100007874@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004334(&qword_100018AC0);
  __chkstk_darwin();
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100006310(v2, (uint64_t)v10, &qword_100018AC0);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = static os_log_type_t.fault.getter();
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v20[1] = a1;
      v19 = v18;
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = sub_100007EA8(0x686353726F6C6F43, 0xEB00000000656D65, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_100007AB4(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  double v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = *(double *)&v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_100007EA8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_1000046C4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100007C74(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_100007EA8(1819242306, 0xE400000000000000, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_1000046C4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100007E2C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_100007EA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100007F78(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100008994((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100008994((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008974(v12);
  return v7;
}

uint64_t sub_100007F78(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100008130(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008130(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000081C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000839C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000839C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000081C4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100008338(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100008338(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100004334(&qword_100018D60);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000839C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100004334(&qword_100018D60);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void sub_1000084E8(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

void sub_100008510(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100008538(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_10000855C(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_100008580@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000085A8(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_1000085CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000085F4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_10000861C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018CC0;
  if (!qword_100018CC0)
  {
    v1 = sub_100004374(&qword_100018CA0);
    sub_1000063BC(&qword_100018CC8, &qword_100018C98, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018CC0);
  }
  return result;
}

unint64_t sub_1000086A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018CD0;
  if (!qword_100018CD0)
  {
    v1 = sub_100004374(&qword_100018CB8);
    sub_10000870C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018CD0);
  }
  return result;
}

unint64_t sub_10000870C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018CD8;
  if (!qword_100018CD8)
  {
    v1 = sub_100004374(&qword_100018CE0);
    sub_100008790();
    sub_1000063BC(&qword_100018D08, &qword_100018D10, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018CD8);
  }
  return result;
}

unint64_t sub_100008790()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018CE8;
  if (!qword_100018CE8)
  {
    v1 = sub_100004374(&qword_100018CF0);
    sub_100006210();
    sub_1000063BC(&qword_100018CF8, &qword_100018D00, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018CE8);
  }
  return result;
}

uint64_t sub_100008814(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_10000883C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018D48;
  if (!qword_100018D48)
  {
    v1 = type metadata accessor for BridgedSpendingSummaryChartView(255);
    result = swift_getWitnessTable(&unk_100010978, v1);
    atomic_store(result, (unint64_t *)&qword_100018D48);
  }
  return result;
}

uint64_t sub_100008884()
{
  return EnvironmentValues.colorScheme.getter();
}

void sub_1000088A8(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000088D0(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_1000088F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004334(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008938(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BridgedSpendingSummaryChartView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008974(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008994(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000089D4()
{
  return sub_1000063BC(&qword_100018D68, &qword_100018D70, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

_QWORD *initializeBufferWithCopyOfBuffer for AppleCardWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for AppleCardWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for AppleCardWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for AppleCardWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AppleCardWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleCardWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleCardWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppleCardWidget()
{
  return &type metadata for AppleCardWidget;
}

uint64_t sub_100008B44(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000112A4, 1);
}

uint64_t sub_100008B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t OpaqueTypeConformance2;
  unint64_t v27;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v66 = a1;
  v79 = a3;
  v4 = sub_100004334(&qword_100018AA0);
  v68 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_100004334(&qword_100018D78);
  v70 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004334(&qword_100018D80);
  v10 = *(_QWORD *)(v9 - 8);
  v73 = v9;
  v74 = v10;
  __chkstk_darwin(v9);
  v69 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100004334(&qword_100018D88);
  v13 = *(_QWORD *)(v12 - 8);
  v75 = v12;
  v76 = v13;
  __chkstk_darwin(v12);
  v71 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100004334(&qword_100018D90);
  v77 = *(_QWORD *)(v15 - 8);
  v78 = v15;
  __chkstk_darwin(v15);
  v72 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for ConfigurationIntent();
  v18 = type metadata accessor for AppleCardWidgetDataManager();
  v19 = swift_allocObject(v18, 32, 7);
  v20 = (void *)objc_opt_self(PKAccountService);
  swift_bridgeObjectRetain(a2);
  *(_QWORD *)(v19 + 16) = objc_msgSend(v20, "sharedInstance");
  *(_QWORD *)(v19 + 24) = objc_msgSend((id)objc_opt_self(PKPassLibrary), "sharedInstance");
  v84 = v19;
  v21 = sub_100004334(&qword_100018D98);
  v22 = sub_100004374(&qword_100018DA0);
  v23 = sub_100004374(&qword_100018DA8);
  v24 = sub_1000095C8();
  v25 = sub_1000063BC(&qword_100018DC0, &qword_100018DA8, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
  v80 = v22;
  v81 = v23;
  v82 = v24;
  v83 = v25;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v80, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
  v27 = sub_10000964C();
  IntentConfiguration.init<A>(kind:intent:provider:content:)(v66, a2, v17, &v84, sub_100009168, 0, v17, v21, &type metadata for AppleCardWidgetTimelineProvider, OpaqueTypeConformance2, v27);
  v28 = sub_1000063BC(&qword_100018AA8, &qword_100018AA0, (uint64_t)&protocol conformance descriptor for IntentConfiguration<A, B>);
  WidgetConfiguration._contentMarginsDisabled()(v4, v28);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v6, v4);
  v29 = sub_100004334(&qword_100018DD0);
  v30 = type metadata accessor for WidgetFamily(0);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = (v32 + 32) & ~v32;
  v34 = swift_allocObject(v29, v33 + *(_QWORD *)(v31 + 72), v32 | 7);
  *(_OWORD *)(v34 + 16) = xmmword_100010C20;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v31 + 104))(v34 + v33, enum case for WidgetFamily.systemSmall(_:), v30);
  v80 = v4;
  v81 = v28;
  v35 = swift_getOpaqueTypeConformance2(&v80, &unk_100011164, 1);
  v36 = v69;
  v37 = v67;
  WidgetConfiguration.supportedFamilies(_:)(v34, v67, v35);
  swift_bridgeObjectRelease(v34);
  v38 = v37;
  (*(void (**)(char *, uint64_t))(v70 + 8))(v8, v37);
  v39 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000016, 0x8000000100013330);
  v40 = Text.init(_:tableName:bundle:comment:)(v39);
  v42 = v41;
  v44 = v43;
  v46 = v45 & 1;
  v80 = v38;
  v81 = v35;
  v47 = swift_getOpaqueTypeConformance2(&v80, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v48 = v71;
  v49 = v73;
  WidgetConfiguration.configurationDisplayName(_:)(v40, v42, v46, v44, v73, v47);
  sub_10000617C(v40, v42, v46);
  swift_bridgeObjectRelease(v44);
  v50 = v49;
  (*(void (**)(char *, uint64_t))(v74 + 8))(v36, v49);
  v51 = v72;
  v52 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100013350);
  v53 = Text.init(_:tableName:bundle:comment:)(v52);
  v55 = v54;
  v57 = v56;
  v59 = v58 & 1;
  v80 = v50;
  v81 = v47;
  v60 = v75;
  v61 = swift_getOpaqueTypeConformance2(&v80, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v53, v55, v59, v57, v60, v61);
  sub_10000617C(v53, v55, v59);
  swift_bridgeObjectRelease(v57);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v48, v60);
  if (qword_100018A80 != -1)
    swift_once(&qword_100018A80, sub_1000040A0);
  v62 = (qword_100019150 == 0) & ~byte_100019158;
  v80 = v60;
  v81 = v61;
  v63 = swift_getOpaqueTypeConformance2(&v80, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v64 = v78;
  WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)(v62, v78, v63);
  return (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v51, v64);
}

uint64_t sub_100009168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t KeyPath;
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
  unint64_t v27;
  uint64_t v28;
  _QWORD v30[2];

  v30[1] = a2;
  v3 = type metadata accessor for ContainerBackgroundPlacement(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  __chkstk_darwin(v7);
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AppleCardContentView(0);
  __chkstk_darwin(v10);
  v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100004334(&qword_100018DA0);
  __chkstk_darwin(v13);
  v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009828(a1, (uint64_t)v9, type metadata accessor for AppleCardWidgetTimelineEntry);
  KeyPath = swift_getKeyPath(&unk_100010C90);
  v17 = sub_100009768((uint64_t)v9, (uint64_t)v12);
  v18 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v18 = KeyPath;
  v18[8] = 0;
  v19 = static Alignment.center.getter(v17);
  sub_1000093C8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, INFINITY, 0, v19, v20);
  v21 = sub_1000097AC((uint64_t)v12);
  v22 = static ContainerBackgroundPlacement.widget.getter(v21);
  v23 = static Alignment.center.getter(v22);
  v25 = v24;
  v26 = sub_100004334(&qword_100018DA8);
  v27 = sub_1000095C8();
  v28 = sub_1000063BC(&qword_100018DC0, &qword_100018DA8, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
  View.containerBackground<A>(for:alignment:content:)(v6, v23, v25, sub_100009584, 0, v13, v26, v27, v28);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_1000097E8((uint64_t)v15);
}

__n128 sub_1000093C8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_100009828(v16, a9, type metadata accessor for AppleCardContentView);
  v35 = a9 + *(int *)(sub_100004334(&qword_100018DA0) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

void sub_100009584(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_100009590@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(PKHomeScreenWidgetKindAppleCard);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000095C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100008B54(*v1, v1[1], a1);
}

unint64_t sub_1000095C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018DB0;
  if (!qword_100018DB0)
  {
    v1 = sub_100004374(&qword_100018DA0);
    sub_10000986C(&qword_100018DB8, type metadata accessor for AppleCardContentView, (uint64_t)&unk_100010AD0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100018DB0);
  }
  return result;
}

unint64_t sub_10000964C()
{
  unint64_t result;

  result = qword_100018DC8;
  if (!qword_100018DC8)
  {
    result = swift_getWitnessTable(&unk_100010D40, &type metadata for AppleCardWidgetTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_100018DC8);
  }
  return result;
}

uint64_t sub_100009690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v1 = sub_10000986C(&qword_100018DD8, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  EnvironmentValues.subscript.getter(&v3, v0, v0, v1);
  return v3;
}

_QWORD *sub_1000096F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  v2 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v3 = sub_10000986C(&qword_100018DD8, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  result = EnvironmentValues.subscript.getter(&v5, v2, v2, v3);
  *a1 = v5;
  return result;
}

uint64_t sub_100009768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000097AC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppleCardContentView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000097E8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004334(&qword_100018DA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009828(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000986C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000098AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_100004374(&qword_100018D90);
  v1 = sub_100004374(&qword_100018D88);
  v2 = sub_100004374(&qword_100018D80);
  v3 = sub_100004374(&qword_100018D78);
  v9 = sub_100004374(&qword_100018AA0);
  v10 = sub_1000063BC(&qword_100018AA8, &qword_100018AA0, (uint64_t)&protocol conformance descriptor for IntentConfiguration<A, B>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v9, &unk_100011164, 1);
  v9 = v3;
  v10 = OpaqueTypeConformance2;
  v5 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v9 = v2;
  v10 = v5;
  v6 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v9 = v1;
  v10 = v6;
  v7 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v9 = v0;
  v10 = v7;
  return swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)>>, 1);
}

uint64_t sub_1000099C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[2];

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)(PKHomeScreenWidgetKindAppleCard);
  v2 = v1;
  v5[0] = v0;
  v5[1] = v1;
  v3 = sub_100009AC0();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v5, &type metadata for AppleCardWidget, v3);
  return swift_bridgeObjectRelease(v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100009A5C();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100009A5C()
{
  unint64_t result;

  result = qword_100018DE0;
  if (!qword_100018DE0)
  {
    result = swift_getWitnessTable(&unk_100010CCC, &type metadata for WidgetGroup);
    atomic_store(result, (unint64_t *)&qword_100018DE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_100009AB0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000112E8, 1);
}

unint64_t sub_100009AC0()
{
  unint64_t result;

  result = qword_100018DE8;
  if (!qword_100018DE8)
  {
    result = swift_getWitnessTable("\tB", &type metadata for AppleCardWidget);
    atomic_store(result, (unint64_t *)&qword_100018DE8);
  }
  return result;
}

uint64_t sub_100009B04()
{
  _QWORD v1[2];

  v1[0] = &type metadata for AppleCardWidget;
  v1[1] = sub_100009AC0();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

ValueMetadata *type metadata accessor for AppleCardWidgetTimelineProvider()
{
  return &type metadata for AppleCardWidgetTimelineProvider;
}

unint64_t sub_100009B54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018DF0[0];
  if (!qword_100018DF0[0])
  {
    v1 = type metadata accessor for AppleCardWidgetTimelineEntry(255);
    result = swift_getWitnessTable(&unk_100010DE8, v1);
    atomic_store(result, qword_100018DF0);
  }
  return result;
}

__n128 sub_100009B9C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  NSString v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 result;
  __n128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  if (qword_100018A88 != -1)
    swift_once(&qword_100018A88, sub_10000443C);
  v2 = type metadata accessor for Logger(0);
  sub_10000450C(v2, (uint64_t)qword_100019160);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v18[0] = v6;
    *(_DWORD *)v5 = 136446210;
    v17 = sub_100007EA8(0xD00000000000001FLL, 0x8000000100010D00, (uint64_t *)v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, v18, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%{public}s] returning placeholder", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }

  v7 = objc_msgSend((id)objc_opt_self(NSDecimalNumber), "zero");
  v8 = String._bridgeToObjectiveC()();
  v9 = (id)PKCurrencyAmountMake(v7, v8);

  v10 = v9;
  sub_10000DCF8(v9, v9, (uint64_t *)v18);
  v15 = (__n128)v18[1];
  v16 = v18[0];
  v11 = v19;
  v12 = v20;
  Date.init()();
  v13 = a1 + *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry(0) + 20);
  result = v15;
  *(_OWORD *)v13 = v16;
  *(__n128 *)(v13 + 16) = v15;
  *(_QWORD *)(v13 + 32) = v11;
  *(_QWORD *)(v13 + 40) = v12;
  *(_QWORD *)(v13 + 48) = 0;
  *(_BYTE *)(v13 + 56) = 3;
  return result;
}

uint64_t sub_100009DC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (qword_100018A88 != -1)
    swift_once(&qword_100018A88, sub_10000443C);
  v9 = type metadata accessor for Logger(0);
  sub_10000450C(v9, (uint64_t)qword_100019160);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v18 = v13;
    *(_DWORD *)v12 = 136446210;
    v17 = sub_100007EA8(0xD00000000000001FLL, 0x8000000100010D00, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] requesting snapshot", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  v14 = objc_msgSend(a1, "period");
  v15 = swift_allocObject(&unk_100014F38, 32, 7);
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  swift_retain(v15);
  swift_retain(a5);
  swift_retain(a4);
  sub_10000E5E0(a5, (void (*)(__int128 *))sub_10000A930, v15, a5, (uint64_t)v14);
  swift_release_n(v15, 2);
  return swift_release(a5);
}

uint64_t sub_100009FBC(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000A83C((uint64_t *)a1);
  Date.init()(v7);
  v8 = &v6[*(int *)(v4 + 20)];
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a1;
  *((_OWORD *)v8 + 1) = v9;
  *((_OWORD *)v8 + 2) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v8 + 41) = *(_OWORD *)(a1 + 41);
  if (qword_100018A88 != -1)
    swift_once(&qword_100018A88, sub_10000443C);
  v10 = type metadata accessor for Logger(0);
  sub_10000450C(v10, (uint64_t)qword_100019160);
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v17 = v14;
    *(_DWORD *)v13 = 136446210;
    v16 = sub_100007EA8(0xD00000000000001FLL, 0x8000000100010D00, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v13 + 4, v13 + 12);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s] returning snapshot", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }

  a2(v6);
  return sub_10000A8F4((uint64_t)v6);
}

uint64_t sub_10000A1BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (qword_100018A88 != -1)
    swift_once(&qword_100018A88, sub_10000443C);
  v9 = type metadata accessor for Logger(0);
  sub_10000450C(v9, (uint64_t)qword_100019160);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v18 = v13;
    *(_DWORD *)v12 = 136446210;
    v17 = sub_100007EA8(0xD00000000000001FLL, 0x8000000100010D00, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] requesting timeline", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  v14 = objc_msgSend(a1, "period");
  v15 = swift_allocObject(&unk_100014F10, 32, 7);
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  swift_retain(v15);
  swift_retain(a5);
  swift_retain(a4);
  sub_10000E5E0(a5, (void (*)(__int128 *))sub_10000A834, v15, a5, (uint64_t)v14);
  swift_release_n(v15, 2);
  return swift_release(a5);
}

uint64_t sub_10000A3B8(uint64_t a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(_QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v6 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004334(&qword_100018E08);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  v37 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_10000A83C((uint64_t *)a1);
  Date.init()(v16);
  v38 = v13;
  v17 = &v15[*(int *)(v13 + 20)];
  v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v17 = *(_OWORD *)a1;
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v17 + 41) = *(_OWORD *)(a1 + 41);
  if (qword_100018A88 != -1)
    swift_once(&qword_100018A88, sub_10000443C);
  v19 = type metadata accessor for Logger(0);
  sub_10000450C(v19, (uint64_t)qword_100019160);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v35 = a3;
    v22 = swift_slowAlloc(12, -1);
    v36 = a2;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc(32, -1);
    v40 = v24;
    v34 = v12;
    *(_DWORD *)v23 = 136446210;
    v39 = sub_100007EA8(0xD00000000000001FLL, 0x8000000100010D00, &v40);
    v12 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v23 + 4, v23 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%{public}s] returning timeline", v23, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v25 = v23;
    a2 = v36;
    swift_slowDealloc(v25, -1, -1);
  }

  v26 = sub_100004334(&qword_100018E10);
  v27 = *(unsigned __int8 *)(v37 + 80);
  v28 = (v27 + 32) & ~v27;
  v29 = swift_allocObject(v26, v28 + *(_QWORD *)(v37 + 72), v27 | 7);
  *(_OWORD *)(v29 + 16) = xmmword_100010C20;
  v30 = sub_10000A8B0((uint64_t)v15, v29 + v28);
  static TimelineReloadPolicy.never.getter(v30);
  v31 = sub_100009B54();
  Timeline.init(entries:policy:)(v29, v8, v38, v31);
  a2(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return sub_10000A8F4((uint64_t)v15);
}

uint64_t sub_10000A6E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_100009DC0(a1, a2, a3, a4, *v4);
}

uint64_t sub_10000A6E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_10000A1BC(a1, a2, a3, a4, *v4);
}

uint64_t sub_10000A6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000A75C;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000A75C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000A7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000A938;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000A810()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A834(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A3B8(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t *sub_10000A83C(uint64_t *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[6];
  sub_10000A874(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  v3 = v2;
  return a1;
}

uint64_t sub_10000A874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a6);
    swift_bridgeObjectRetain(a2);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_10000A8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A8F4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppleCardWidgetTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A930(uint64_t a1)
{
  uint64_t v1;

  return sub_100009FBC(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t *sub_10000A940(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  id v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    if (v11)
    {
      *(_QWORD *)v9 = *(_QWORD *)v10;
      *((_QWORD *)v9 + 1) = v11;
      v12 = *((_QWORD *)v10 + 3);
      *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
      *((_QWORD *)v9 + 3) = v12;
      v13 = *((_QWORD *)v10 + 5);
      *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
      *((_QWORD *)v9 + 5) = v13;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRetain(v13);
    }
    else
    {
      v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    v16 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v9 + 6) = v16;
    v9[56] = v10[56];
    v17 = v16;
  }
  return a1;
}

void sub_10000AA2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = *(_QWORD *)(v5 + 8);
  if (v6)
  {
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + 24));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + 40));
  }

}

uint64_t sub_10000AA90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  id v15;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  if (v10)
  {
    *(_QWORD *)v8 = *(_QWORD *)v9;
    *(_QWORD *)(v8 + 8) = v10;
    v11 = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(v8 + 24) = v11;
    v12 = *(_QWORD *)(v9 + 40);
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
    *(_QWORD *)(v8 + 40) = v12;
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
  }
  else
  {
    v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  v14 = *(void **)(v9 + 48);
  *(_QWORD *)(v8 + 48) = v14;
  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  v15 = v14;
  return a1;
}

uint64_t sub_10000AB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  id v26;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  v11 = *((_QWORD *)v9 + 1);
  if (v10)
  {
    if (v11)
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      v12 = *((_QWORD *)v9 + 1);
      *(_QWORD *)(v8 + 8) = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v10);
      *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
      v13 = *((_QWORD *)v9 + 3);
      v14 = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v14);
      *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
      v15 = *((_QWORD *)v9 + 5);
      v16 = *(_QWORD *)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v15;
      swift_bridgeObjectRetain(v15);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      sub_10000684C((_QWORD *)v8);
      v21 = v9[1];
      v20 = v9[2];
      *(_OWORD *)v8 = *v9;
      *(_OWORD *)(v8 + 16) = v21;
      *(_OWORD *)(v8 + 32) = v20;
    }
  }
  else if (v11)
  {
    *(_QWORD *)v8 = *(_QWORD *)v9;
    v17 = *((_QWORD *)v9 + 1);
    *(_QWORD *)(v8 + 8) = v17;
    *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
    v18 = *((_QWORD *)v9 + 3);
    *(_QWORD *)(v8 + 24) = v18;
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    v19 = *((_QWORD *)v9 + 5);
    *(_QWORD *)(v8 + 40) = v19;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v19);
  }
  else
  {
    v22 = *v9;
    v23 = v9[2];
    *(_OWORD *)(v8 + 16) = v9[1];
    *(_OWORD *)(v8 + 32) = v23;
    *(_OWORD *)v8 = v22;
  }
  v24 = *(void **)(v8 + 48);
  v25 = (void *)*((_QWORD *)v9 + 6);
  *(_QWORD *)(v8 + 48) = v25;
  v26 = v25;

  *(_BYTE *)(v8 + 56) = *((_BYTE *)v9 + 56);
  return a1;
}

uint64_t sub_10000ACB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  *(_OWORD *)((char *)v8 + 41) = *(_OWORD *)((char *)v9 + 41);
  return a1;
}

uint64_t sub_10000AD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  __int128 v16;
  void *v17;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (!v10)
    goto LABEL_5;
  v11 = *(_QWORD *)(v9 + 8);
  if (!v11)
  {
    sub_10000684C((_QWORD *)v8);
LABEL_5:
    v16 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v16;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    goto LABEL_6;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v11;
  swift_bridgeObjectRelease(v10);
  v12 = *(_QWORD *)(v9 + 24);
  v13 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v8 + 24) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(v9 + 40);
  v15 = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 40) = v14;
  swift_bridgeObjectRelease(v15);
LABEL_6:
  v17 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);

  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  return a1;
}

uint64_t sub_10000ADF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000AE04);
}

uint64_t sub_10000AE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_10000AE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000AE9C);
}

uint64_t sub_10000AE9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for AppleCardWidgetTimelineEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_100018E70;
  if (!qword_100018E70)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppleCardWidgetTimelineEntry);
  return result;
}

uint64_t sub_10000AF54(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "9";
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000AFC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

BOOL sub_10000B000(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000B014()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000B058()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000B080(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10000B0C0(void *a1, void *a2, uint64_t a3, void (*a4)(__int128 *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  Class isa;
  id v58;
  id v59;
  void *v60;
  id v61;
  void (*v62)(__int128 *);
  void *v63;
  id v64;
  unsigned __int8 v65;
  id v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  void (*v76)(__int128 *);
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  char v81[40];
  void *v82;
  _QWORD v83[5];
  __int128 aBlock;
  __int128 v85;
  _OWORD v86[3];

  if (!a1)
    goto LABEL_9;
  v78 = a1;
  v13 = objc_msgSend(v78, "creditDetails");
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "currencyCode");

    if (v15)
    {
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      if (!a2)
      {
        swift_bridgeObjectRelease(v18);
        v85 = 0u;
        memset(v86, 0, 24);
        aBlock = 0u;
        BYTE8(v86[1]) = 1;
        a4(&aBlock);

        return;
      }
      v73 = v18;
      v19 = objc_allocWithZone((Class)PKTransactionSource);
      v74 = a2;
      v20 = objc_msgSend(v19, "initWithPaymentPass:");
      v21 = sub_100004334(&qword_100018F90);
      inited = swift_initStackObject(v21, v81);
      *(_OWORD *)(inited + 16) = xmmword_100010E20;
      *(_QWORD *)(inited + 32) = v20;
      *(_QWORD *)&aBlock = inited;
      specialized Array._endMutation()();
      v23 = aBlock;
      if ((unint64_t)aBlock >> 62)
      {
        if ((uint64_t)aBlock < 0)
          v28 = aBlock;
        else
          v28 = aBlock & 0xFFFFFFFFFFFFFF8;
        v29 = v20;
        swift_bridgeObjectRetain(v23);
        v30 = _CocoaArrayWrapper.endIndex.getter(v28);
        swift_bridgeObjectRelease(v23);
        if (v30)
          goto LABEL_7;
      }
      else
      {
        v24 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
        v25 = v20;
        if (v24)
        {
LABEL_7:
          sub_10000E27C(v23, &qword_100018FB0, &qword_100018F98, PKTransactionSource_ptr);
          v27 = v26;
          goto LABEL_16;
        }
      }
      v27 = &_swiftEmptySetSingleton;
LABEL_16:
      swift_bridgeObjectRelease(v23);
      v82 = v27;
      v76 = a4;
      v77 = a5;
      v72 = a6;
      v75 = v20;
      v71 = v16;
      if (a3)
      {
        v31 = a3;
        if ((a3 & 0xC000000000000001) == 0)
          goto LABEL_27;
LABEL_21:
        if (v31 < 0)
          v32 = v31;
        else
          v32 = v31 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(a3);
        v33 = __CocoaSet.makeIterator()(v32);
        v34 = sub_10000EC34(0, &qword_100018F80, PKAccountUser_ptr);
        v35 = sub_10000EC6C(&qword_100018F88, &qword_100018F80, PKAccountUser_ptr);
        v36 = Set.Iterator.init(_cocoa:)(v83, v33, v34, v35);
        v31 = v83[0];
        v79 = v83[1];
        v37 = v83[2];
        v38 = v83[3];
        v39 = v83[4];
LABEL_31:
        v44 = (unint64_t)(v37 + 64) >> 6;
        if ((v31 & 0x8000000000000000) == 0)
          goto LABEL_35;
        while (1)
        {
          v45 = __CocoaSet.Iterator.next()(v36);
          if (!v45)
            break;
          v46 = v45;
          v80 = v45;
          v47 = sub_10000EC34(0, &qword_100018F80, PKAccountUser_ptr);
          swift_unknownObjectRetain(v46);
          swift_dynamicCast(&aBlock, &v80, (char *)&type metadata for Swift.AnyObject + 8, v47, 7);
          v48 = (id)aBlock;
          swift_unknownObjectRelease(v46);
          v49 = v38;
          v50 = v39;
          if (!v48)
            break;
          while (1)
          {
            sub_10000CFA8((Swift::Int *)&aBlock, objc_msgSend(objc_allocWithZone((Class)PKTransactionSource), "initWithAccountUser:", v48));

            v38 = v49;
            v39 = v50;
            if (v31 < 0)
              break;
LABEL_35:
            if (v39)
            {
              v50 = (v39 - 1) & v39;
              v51 = __clz(__rbit64(v39)) | (v38 << 6);
              v49 = v38;
            }
            else
            {
              v52 = v38 + 1;
              if (__OFADD__(v38, 1))
              {
                __break(1u);
                goto LABEL_66;
              }
              if (v52 >= v44)
                goto LABEL_54;
              v53 = *(_QWORD *)(v79 + 8 * v52);
              v49 = v38 + 1;
              if (!v53)
              {
                v49 = v38 + 2;
                if (v38 + 2 >= v44)
                  goto LABEL_54;
                v53 = *(_QWORD *)(v79 + 8 * v49);
                if (!v53)
                {
                  v49 = v38 + 3;
                  if (v38 + 3 >= v44)
                    goto LABEL_54;
                  v53 = *(_QWORD *)(v79 + 8 * v49);
                  if (!v53)
                  {
                    v49 = v38 + 4;
                    if (v38 + 4 >= v44)
                      goto LABEL_54;
                    v53 = *(_QWORD *)(v79 + 8 * v49);
                    if (!v53)
                    {
                      v54 = v38 + 5;
                      while (v44 != v54)
                      {
                        v53 = *(_QWORD *)(v79 + 8 * v54++);
                        if (v53)
                        {
                          v49 = v54 - 1;
                          goto LABEL_50;
                        }
                      }
                      goto LABEL_54;
                    }
                  }
                }
              }
LABEL_50:
              v50 = (v53 - 1) & v53;
              v51 = __clz(__rbit64(v53)) + (v49 << 6);
            }
            v48 = *(id *)(*(_QWORD *)(v31 + 48) + 8 * v51);
            if (!v48)
              goto LABEL_54;
          }
        }
LABEL_54:
        sub_10000EC2C(v31);
        v55 = v82;
        v56 = objc_allocWithZone((Class)PKTransactionSourceCollection);
        sub_10000EC34(0, &qword_100018F98, PKTransactionSource_ptr);
        sub_10000EC6C(&qword_100018FA0, &qword_100018F98, PKTransactionSource_ptr);
        isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v55);
        v58 = objc_msgSend(v56, "initWithTransactionSources:", isa);

        v59 = objc_msgSend(v78, "creditDetails");
        if (!v59)
        {
          swift_bridgeObjectRelease(v73);
          v62 = v76;
          v64 = v74;
          v63 = v75;
LABEL_63:
          v85 = 0u;
          memset(v86, 0, 24);
          aBlock = 0u;
          BYTE8(v86[1]) = 2;
          v62(&aBlock);

          goto LABEL_64;
        }
        v60 = v59;
        v61 = objc_msgSend(v59, "accountSummary");

        v62 = v76;
        v63 = v75;
        if (v61)
        {
          if ((objc_msgSend(v61, "requiresDebtCollectionNotices") & 1) != 0)
          {
            swift_bridgeObjectRelease(v73);

LABEL_62:
            v64 = v74;
            goto LABEL_63;
          }
          v65 = objc_msgSend((id)objc_opt_self(PKCreditAccountController), "shouldDisplayTransactionsForTransactionSourceCollection:withAccount:", v58, v78);

          if ((v65 & 1) != 0)
          {
            v66 = objc_msgSend(objc_allocWithZone((Class)PKSpendingSummaryFetcher), "initWithTransactionSourceCollection:account:accountUser:", v58, v78, 0);
            v67 = (_QWORD *)swift_allocObject(&unk_100015460, 80, 7);
            v67[2] = v72;
            v67[3] = a7;
            v67[4] = v66;
            v67[5] = v78;
            v67[6] = v71;
            v67[7] = v73;
            v67[8] = v76;
            v67[9] = v77;
            *(_QWORD *)&v86[0] = sub_10000ECF0;
            *((_QWORD *)&v86[0] + 1) = v67;
            *(_QWORD *)&aBlock = _NSConcreteStackBlock;
            *((_QWORD *)&aBlock + 1) = 1107296256;
            *(_QWORD *)&v85 = sub_10000BD94;
            *((_QWORD *)&v85 + 1) = &unk_100015478;
            v68 = _Block_copy(&aBlock);
            v69 = *((_QWORD *)&v86[0] + 1);
            v70 = v78;
            swift_retain(v72);
            v64 = v66;
            swift_retain(v77);
            swift_release(v69);
            objc_msgSend(v64, "availableSummaries:", v68);

            _Block_release(v68);
LABEL_64:

            return;
          }
        }
        swift_bridgeObjectRelease(v73);
        goto LABEL_62;
      }
      if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
        && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
      {
        sub_10000E27C((uint64_t)&_swiftEmptyArrayStorage, &qword_100018FA8, &qword_100018F80, PKAccountUser_ptr);
        v31 = v40;
        if ((v40 & 0xC000000000000001) != 0)
          goto LABEL_21;
      }
      else
      {
        v31 = (uint64_t)&_swiftEmptySetSingleton;
        if (((unint64_t)&_swiftEmptySetSingleton & 0xC000000000000001) != 0)
          goto LABEL_21;
      }
LABEL_27:
      v41 = -1 << *(_BYTE *)(v31 + 32);
      v79 = v31 + 56;
      v37 = ~v41;
      v42 = -v41;
      if (v42 < 64)
        v43 = ~(-1 << v42);
      else
        v43 = -1;
      v39 = v43 & *(_QWORD *)(v31 + 56);
      v36 = (_QWORD *)swift_bridgeObjectRetain(a3);
      v38 = 0;
      goto LABEL_31;
    }

LABEL_9:
    v85 = 0u;
    memset(v86, 0, 25);
    aBlock = 0u;
    a4(&aBlock);
    return;
  }
LABEL_66:
  __break(1u);
}

uint64_t sub_10000B85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  NSDate v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  id v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  _QWORD *v32;

  v28 = a6;
  v17 = type metadata accessor for Date(0);
  v29 = *(_QWORD *)(v17 - 8);
  v30 = v17;
  __chkstk_darwin(v17);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C6CC(a1, a2, a3, a5, (uint64_t)v19);
  v20.super.isa = Date._bridgeToObjectiveC()().super.isa;
  if (a5 == 3)
    v21 = 2;
  else
    v21 = a5 == 2;
  v22 = (_QWORD *)swift_allocObject(&unk_1000154B0, 56, 7);
  v22[2] = a7;
  v22[3] = a8;
  v22[4] = a9;
  v22[5] = a10;
  v22[6] = a11;
  aBlock[4] = sub_10000ED5C;
  v32 = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000BD44;
  aBlock[3] = &unk_1000154C8;
  v23 = _Block_copy(aBlock);
  v24 = v32;
  v25 = a7;
  swift_bridgeObjectRetain(a9);
  swift_retain(a11);
  swift_release(v24);
  objc_msgSend(v28, "spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:", v20.super.isa, v21, 0, v23);
  _Block_release(v23);

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v19, v30);
}

void sub_10000B9EC(void *a1, id a2, uint64_t a3, uint64_t a4, void (*a5)(__int128 *))
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSString v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSString v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];

  v9 = objc_msgSend(a2, "creditDetails");
  if (v9)
  {
    v10 = v9;
    v37 = objc_msgSend(v9, "accountSummary");

    v11 = objc_msgSend(a2, "creditDetails");
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "cardBalance");

      if (v13)
      {
        if (!v37)
        {

          goto LABEL_14;
        }
        v14 = objc_msgSend(v37, "availableCredit");
        if (v14)
        {
          v15 = v14;
          v16 = a1;
          v17 = objc_allocWithZone((Class)PKCurrencyAmount);
          v36 = v13;
          v18 = v15;
          swift_bridgeObjectRetain(a4);
          v19 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(a4);
          v20 = objc_msgSend(v17, "initWithAmount:currency:exponent:", v18, v19, 0);

          sub_10000DCF8(v13, v20, (uint64_t *)&v39);
          v21 = v39;
          v22 = v40;
          v23 = v41;
          v42 = v39;
          v43 = v40;
          v44[0] = v41;
          *(_QWORD *)&v44[1] = v16;
          BYTE8(v44[1]) = 3;
          v24 = v16;
          a5(&v42);

          sub_10000ED6C(v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1));
          return;
        }

      }
      else if (!v37)
      {
        goto LABEL_14;
      }
      v25 = v37;
      v26 = (id)PKCurrentUserAltDSID();
      v27 = objc_msgSend(v25, "accountUserActivityForAccountUserAltDSID:", v26);

      if (v27)
      {
        v28 = objc_msgSend(v27, "totalSpending");

        if (v28)
        {
          v38 = a1;
          v29 = objc_allocWithZone((Class)PKCurrencyAmount);
          swift_bridgeObjectRetain(a4);
          v30 = v28;
          v31 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(a4);
          v32 = objc_msgSend(v29, "initWithAmount:currency:exponent:", v30, v31, 0);

          sub_10000DCF8(v32, 0, (uint64_t *)&v39);
          v33 = v39;
          v34 = v40;
          v35 = v41;
          v42 = v39;
          v43 = v40;
          v44[0] = v41;
          *(_QWORD *)&v44[1] = v38;
          BYTE8(v44[1]) = 3;
          v37 = v38;
          a5(&v42);

          sub_10000ED6C(v33, *((uint64_t *)&v33 + 1), v34, *((uint64_t *)&v34 + 1), v35, *((uint64_t *)&v35 + 1));
LABEL_15:

          return;
        }
      }
LABEL_14:
      v43 = 0u;
      memset(v44, 0, 25);
      v42 = 0u;
      a5(&v42);
      goto LABEL_15;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000BD44(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_10000BD94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = type metadata accessor for Date(0);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v9);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  swift_retain(v7);
  v8(v10, v11, v12);
  swift_release(v7);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);
  return swift_bridgeObjectRelease(v12);
}

void sub_10000BE48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  _QWORD *v16;

  v11 = (_QWORD *)swift_allocObject(&unk_100015410, 48, 7);
  v11[2] = a6;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a2;
  v15[4] = sub_10000EC20;
  v16 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000BFA0;
  v15[3] = &unk_100015428;
  v12 = _Block_copy(v15);
  v13 = v16;
  swift_retain(a6);
  swift_retain(a4);
  v14 = a2;
  swift_release(v13);
  objc_msgSend(a5, "defaultAccountForFeature:completion:", 2, v12);
  _Block_release(v12);
}

uint64_t sub_10000BF2C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD), uint64_t a5, uint64_t a6)
{
  void *v10;
  id v11;
  _BYTE v13[24];

  swift_beginAccess(a3 + 16, v13, 1, 0);
  v10 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = a1;
  v11 = a1;

  return a4(a6, 0);
}

void sub_10000BFA0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_10000C014(uint64_t a1, void *a2, void *a3, void *aBlock)
{
  uint64_t v6;
  void (*v7)(id, id, uint64_t (*)(), uint64_t);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = *(void (**)(id, id, uint64_t (*)(), uint64_t))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = _Block_copy(aBlock);
  v9 = swift_allocObject(&unk_1000153E8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  swift_retain(v6);
  v11 = a2;
  v10 = a3;
  v7(v11, v10, sub_10000EBD0, v9);
  swift_release(v6);
  swift_release(v9);

}

void sub_10000C0C4(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  id v22;
  _QWORD aBlock[5];
  _QWORD *v24;
  char v25[24];

  swift_beginAccess(a5 + 16, v25, 0, 0);
  v13 = *(void **)(a5 + 16);
  if (v13 && (v14 = objc_msgSend(v13, "accountIdentifier")) != 0)
  {
    v15 = v14;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    v19 = (_QWORD *)swift_allocObject(&unk_100015398, 48, 7);
    v19[2] = a7;
    v19[3] = a3;
    v19[4] = a4;
    v19[5] = a2;
    aBlock[4] = sub_10000EBA0;
    v24 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C2A0;
    aBlock[3] = &unk_1000153B0;
    v20 = _Block_copy(aBlock);
    v21 = v24;
    swift_retain(a7);
    swift_retain(a4);
    v22 = a2;
    swift_release(v21);
    objc_msgSend(a6, "paymentPassWithAssociatedAccountIdentifier:completion:", v18, v20);
    _Block_release(v20);

  }
  else
  {
    a3(a2, 1);
  }
}

uint64_t sub_10000C22C(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD), uint64_t a4, uint64_t a5)
{
  void *v9;
  id v10;
  _BYTE v12[24];

  swift_beginAccess(a2 + 16, v12, 1, 0);
  v9 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v10 = a1;

  return a3(a5, 0);
}

void sub_10000C2A0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

void sub_10000C2F4(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  id v22;
  _QWORD aBlock[5];
  _QWORD *v24;
  char v25[24];

  swift_beginAccess(a5 + 16, v25, 0, 0);
  v13 = *(void **)(a5 + 16);
  if (v13 && (v14 = objc_msgSend(v13, "accountIdentifier")) != 0)
  {
    v15 = v14;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    v19 = (_QWORD *)swift_allocObject(&unk_100015348, 48, 7);
    v19[2] = a7;
    v19[3] = a3;
    v19[4] = a4;
    v19[5] = a2;
    aBlock[4] = sub_10000EB90;
    v24 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C4D8;
    aBlock[3] = &unk_100015360;
    v20 = _Block_copy(aBlock);
    v21 = v24;
    swift_retain(a7);
    swift_retain(a4);
    v22 = a2;
    swift_release(v21);
    objc_msgSend(a6, "accountUsersForAccountWithIdentifier:completion:", v18, v20);
    _Block_release(v20);

  }
  else
  {
    a3(a2, 1);
  }
}

uint64_t sub_10000C45C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  _BYTE v11[24];

  swift_beginAccess(a2 + 16, v11, 1, 0);
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRelease(v9);
  return a3(a5, 0);
}

uint64_t sub_10000C4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v5 = sub_10000EC34(0, &qword_100018F80, PKAccountUser_ptr);
    v6 = sub_10000EC6C(&qword_100018F88, &qword_100018F80, PKAccountUser_ptr);
    v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v5, v6);
  }
  swift_retain(v3);
  v4(v2);
  swift_release(v3);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_10000C574(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  _BYTE v20[24];
  _BYTE v21[24];
  _BYTE v22[24];

  v12 = a7 + 16;
  v13 = a8 + 16;
  swift_beginAccess(a6 + 16, v22, 0, 0);
  v14 = *(void **)(a6 + 16);
  swift_beginAccess(v12, v21, 0, 0);
  v15 = *(void **)(a7 + 16);
  swift_beginAccess(v13, v20, 0, 0);
  v16 = *(_QWORD *)(a8 + 16);
  swift_bridgeObjectRetain(v16);
  v17 = v14;
  v18 = v15;
  a4(v14, v15, v16);

  return swift_bridgeObjectRelease(v16);
}

void sub_10000C64C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, id, uint64_t);
  id v9;

  v8 = *(void (**)(uint64_t, id, uint64_t))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  v9 = a3;
  swift_unknownObjectRetain(a4);
  v8(a2, v9, a4);
  swift_release(v7);
  swift_unknownObjectRelease(a4);

}

uint64_t sub_10000C6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, char *, char *);
  uint64_t v24;
  char *v25;
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

  v10 = sub_100004334(&qword_100018F70);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v35 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v35 - v18;
  switch(a4)
  {
    case 0:
      return static Date.now.getter(v17);
    case 1:
      v29 = *(_QWORD *)(a1 + 16);
      if (!v29)
        goto LABEL_18;
      v30 = v29 - 1;
      v13 = (char *)type metadata accessor for Date(0);
      v31 = *((_QWORD *)v13 - 1);
      (*(void (**)(char *, unint64_t, char *))(v31 + 16))(v19, a1+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v30, v13);
      (*(void (**)(char *, _QWORD, uint64_t, char *))(v31 + 56))(v19, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, char *))(v31 + 48))(v19, 1, v13) == 1)
        goto LABEL_19;
      v23 = *(uint64_t (**)(uint64_t, char *, char *))(v31 + 32);
      v24 = a5;
      v25 = v19;
      return v23(v24, v25, v13);
    case 2:
      v21 = *(_QWORD *)(a2 + 16);
      if (!v21)
      {
        v32 = type metadata accessor for Date(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v16, 1, 1, v32);
LABEL_15:
        __break(1u);
LABEL_16:
        v33 = type metadata accessor for Date(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v13, 1, 1, v33);
LABEL_17:
        __break(1u);
LABEL_18:
        v34 = type metadata accessor for Date(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v19, 1, 1, v34);
LABEL_19:
        __break(1u);
LABEL_20:
        v36 = a4;
        _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for Period, &v36, &type metadata for Period, &type metadata for Int);
        __break(1u);
        JUMPOUT(0x10000CA04);
      }
      v22 = v21 - 1;
      v13 = (char *)type metadata accessor for Date(0);
      v19 = (char *)*((_QWORD *)v13 - 1);
      (*((void (**)(char *, unint64_t, char *))v19 + 2))(v16, a2+ ((v19[80] + 32) & ~(unint64_t)v19[80])+ *((_QWORD *)v19 + 9) * v22, v13);
      (*((void (**)(char *, _QWORD, uint64_t, char *))v19 + 7))(v16, 0, 1, v13);
      if ((*((unsigned int (**)(char *, uint64_t, char *))v19 + 6))(v16, 1, v13) == 1)
        goto LABEL_15;
      v23 = (uint64_t (*)(uint64_t, char *, char *))*((_QWORD *)v19 + 4);
      v24 = a5;
      v25 = v16;
      return v23(v24, v25, v13);
    case 3:
      v26 = *(_QWORD *)(a3 + 16);
      if (!v26)
        goto LABEL_16;
      v27 = v26 - 1;
      v28 = type metadata accessor for Date(0);
      v19 = *(char **)(v28 - 8);
      (*((void (**)(char *, unint64_t, uint64_t))v19 + 2))(v13, a3+ ((v19[80] + 32) & ~(unint64_t)v19[80])+ *((_QWORD *)v19 + 9) * v27, v28);
      (*((void (**)(char *, _QWORD, uint64_t, uint64_t))v19 + 7))(v13, 0, 1, v28);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v19 + 6))(v13, 1, v28) == 1)
        goto LABEL_17;
      return (*((uint64_t (**)(uint64_t, char *, uint64_t))v19 + 4))(a5, v13, v28);
    default:
      goto LABEL_20;
  }
}

uint64_t sub_10000CA14()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppleCardWidgetDataManager()
{
  return objc_opt_self(_TtC29PassbookWidgetsExtension_iPad26AppleCardWidgetDataManager);
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.CreditBalanceModel()
{
  return &type metadata for AppleCardWidgetDataManager.CreditBalanceModel;
}

void destroy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  }

}

uint64_t initializeWithCopy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    v6 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v6;
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  v8 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, __int128 *a2)
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  id v20;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *((_QWORD *)a2 + 1);
  if (v4)
  {
    if (v5)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v6 = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 8) = v6;
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRelease(v4);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      v7 = *((_QWORD *)a2 + 3);
      v8 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRelease(v8);
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      v9 = *((_QWORD *)a2 + 5);
      v10 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v9;
      swift_bridgeObjectRetain(v9);
      swift_bridgeObjectRelease(v10);
    }
    else
    {
      sub_10000684C((_QWORD *)a1);
      v15 = a2[1];
      v14 = a2[2];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v15;
      *(_OWORD *)(a1 + 32) = v14;
    }
  }
  else if (v5)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v11 = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 8) = v11;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    v12 = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    v13 = *((_QWORD *)a2 + 5);
    *(_QWORD *)(a1 + 40) = v13;
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
  }
  else
  {
    v16 = *a2;
    v17 = a2[2];
    *(_OWORD *)(a1 + 16) = a2[1];
    *(_OWORD *)(a1 + 32) = v17;
    *(_OWORD *)a1 = v16;
  }
  v18 = *(void **)(a1 + 48);
  v19 = (void *)*((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 48) = v19;
  v20 = v19;

  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  return a1;
}

__n128 initializeWithTake for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;

  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (!v5)
  {
    sub_10000684C((_QWORD *)a1);
LABEL_5:
    v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
LABEL_6:
  v11 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.AppleCardWidgetData()
{
  return &type metadata for AppleCardWidgetDataManager.AppleCardWidgetData;
}

_BYTE *initializeBufferWithCopyOfBuffer for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000CED0 + 4 * byte_100010E35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000CF04 + 4 * byte_100010E30[v4]))();
}

uint64_t sub_10000CF04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CF0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000CF14);
  return result;
}

uint64_t sub_10000CF20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000CF28);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000CF2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CF34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CF40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000CF48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.AppleCardWidgetData.Failure()
{
  return &type metadata for AppleCardWidgetDataManager.AppleCardWidgetData.Failure;
}

unint64_t sub_10000CF64()
{
  unint64_t result;

  result = qword_100018F78;
  if (!qword_100018F78)
  {
    result = swift_getWitnessTable(&unk_100010EEC, &type metadata for AppleCardWidgetDataManager.AppleCardWidgetData.Failure);
    atomic_store(result, (unint64_t *)&qword_100018F78);
  }
  return result;
}

uint64_t sub_10000CFA8(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_10000EC34(0, &qword_100018F98, PKTransactionSource_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_10000D244(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_10000D438(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10000D6D4((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_10000EC34(0, &qword_100018F98, PKTransactionSource_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10000D754((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_10000D244(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100004334(&qword_100018FB0);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000EC34(0, &qword_100018F98, PKTransactionSource_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10000D438(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10000D438(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100004334(&qword_100018FB0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10000D6D4(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_10000D754(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10000D438(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10000D8D8();
      goto LABEL_14;
    }
    sub_10000DA80(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10000EC34(0, &qword_100018F98, PKTransactionSource_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_10000D8D8()
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
  sub_100004334(&qword_100018FB0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
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

Swift::Int sub_10000DA80(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100004334(&qword_100018FB0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_10000DCF8(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  unsigned int v22;
  NSString *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  NSString v46;
  NSString *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  NSString v60;
  id v61;
  uint64_t v62;
  NSString v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  id v87;

  v87 = a2;
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Calendar.Component(0);
  v83 = *(_QWORD *)(v9 - 8);
  v84 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Calendar.Identifier(0);
  v82 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Calendar(0);
  v16 = __chkstk_darwin(v15);
  v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_18;
  }
  v80 = v17;
  v81 = v16;
  v20 = objc_msgSend(a1, "amount");
  if (!v20)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v21 = v20;
  v78 = v12;
  v86 = a3;
  v22 = objc_msgSend(v20, "pk_isNegativeNumber");

  v79 = v8;
  if (v22)
  {
    v76 = v6;
    v77 = v5;
    v23 = (NSString *)String._bridgeToObjectiveC()();
    v24 = (id)PKLocalizedPaymentString(v23);

    if (!v24)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v26 = v25;

    v27 = sub_100004334(&qword_100018FB8);
    v28 = swift_allocObject(v27, 72, 7);
    *(_OWORD *)(v28 + 16) = xmmword_100010C20;
    v29 = a1;
    v30 = objc_msgSend(a1, "negativeValue");
    if (!v30)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    v31 = v30;
    v32 = objc_msgSend(v30, "formattedStringValue");

    if (!v32)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    v35 = v34;

    *(_QWORD *)(v28 + 56) = &type metadata for String;
    *(_QWORD *)(v28 + 64) = sub_10000EDA8();
    *(_QWORD *)(v28 + 32) = v33;
    *(_QWORD *)(v28 + 40) = v35;
    v36 = String.init(format:_:)(v85, v26, v28);
    v85 = v37;
    swift_bridgeObjectRelease(v26);
    a1 = v29;
    v6 = v76;
    v5 = v77;
    v38 = v87;
    if (!v87)
      goto LABEL_8;
LABEL_12:
    v59 = v38;
    v60 = String._bridgeToObjectiveC()();
    v61 = (id)PKLocalizedFeatureString(v60, 2);

    if (v61)
    {
      v84 = v36;
      v87 = a1;
      v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
      v51 = v62;

      v63 = String._bridgeToObjectiveC()();
      v64 = (id)PKLocalizedFeatureString(v63, 2);

      if (v64)
      {
        v55 = v86;
        v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
        v67 = v66;

        v68 = sub_100004334(&qword_100018FB8);
        v69 = swift_allocObject(v68, 72, 7);
        *(_OWORD *)(v69 + 16) = xmmword_100010C20;
        v70 = objc_msgSend(v59, "formattedStringValue");
        if (v70)
        {
          v71 = v70;
          v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v70);
          v74 = v73;

          *(_QWORD *)(v69 + 56) = &type metadata for String;
          *(_QWORD *)(v69 + 64) = sub_10000EDA8();
          *(_QWORD *)(v69 + 32) = v72;
          *(_QWORD *)(v69 + 40) = v74;
          v52 = String.init(format:_:)(v65, v67, v69);
          v53 = v75;
          swift_bridgeObjectRelease(v67);

          v36 = v84;
          v54 = v85;
          goto LABEL_16;
        }
        goto LABEL_21;
      }
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v56 = objc_msgSend(a1, "formattedStringValue");
  if (!v56)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v57 = v56;
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
  v85 = v58;

  v38 = v87;
  if (v87)
    goto LABEL_12;
LABEL_8:
  v39 = v82;
  v40 = v78;
  (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v14, enum case for Calendar.Identifier.gregorian(_:), v78);
  Calendar.init(identifier:)(v14);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v40);
  v42 = v83;
  v41 = v84;
  v43 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v83 + 104))(v11, enum case for Calendar.Component.month(_:), v84);
  v44 = v79;
  static Date.now.getter(v43);
  v45 = Calendar.component(_:from:)(v11, v44);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v44, v5);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v19, v81);
  v46 = String._bridgeToObjectiveC()();
  v47 = (NSString *)(id)PKGregorianMonthSpecificLocalizedStringKeyForKey(v46, v45);

  v48 = (id)PKLocalizedMadisonString(v47);
  if (v48)
  {
    v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
    v51 = v50;

    v52 = 0;
    v53 = 0;
    v54 = v85;
    v55 = v86;
LABEL_16:
    *v55 = v49;
    v55[1] = v51;
    v55[2] = v36;
    v55[3] = v54;
    v55[4] = v52;
    v55[5] = v53;
    return;
  }
LABEL_26:
  __break(1u);
}

void sub_10000E27C(uint64_t a1, uint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Swift::Int v31;
  id v32;
  Swift::Int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  char v40;
  uint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v50;

  v5 = a1;
  v6 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
    if (v7)
    {
LABEL_3:
      sub_100004334(a2);
      v8 = (_QWORD *)static _SetStorage.allocate(capacity:)(v7);
      if (!v6)
        goto LABEL_4;
LABEL_11:
      if (v5 < 0)
        v11 = v5;
      else
        v11 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v5);
      v9 = _CocoaArrayWrapper.endIndex.getter(v11);
      swift_bridgeObjectRelease(v5);
      if (!v9)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_3;
  }
  v8 = &_swiftEmptySetSingleton;
  if (v6)
    goto LABEL_11;
LABEL_4:
  v9 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    return;
LABEL_15:
  v12 = (char *)(v8 + 7);
  v50 = v9;
  if ((v5 & 0xC000000000000001) != 0)
  {
    v13 = 0;
    v46 = v5;
    while (1)
    {
      v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v5);
      v15 = __OFADD__(v13++, 1);
      if (v15)
      {
        __break(1u);
        goto LABEL_43;
      }
      v16 = v14;
      v17 = NSObject._rawHashValue(seed:)(v8[5]);
      v18 = -1 << *((_BYTE *)v8 + 32);
      v19 = v17 & ~v18;
      v20 = v19 >> 6;
      v21 = *(_QWORD *)&v12[8 * (v19 >> 6)];
      v22 = 1 << v19;
      if (((1 << v19) & v21) != 0)
      {
        sub_10000EC34(0, a3, a4);
        v23 = *(id *)(v8[6] + 8 * v19);
        v24 = static NSObject.== infix(_:_:)();

        if ((v24 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v16);
          v5 = v46;
          goto LABEL_18;
        }
        v25 = ~v18;
        while (1)
        {
          v19 = (v19 + 1) & v25;
          v20 = v19 >> 6;
          v21 = *(_QWORD *)&v12[8 * (v19 >> 6)];
          v22 = 1 << v19;
          if ((v21 & (1 << v19)) == 0)
            break;
          v26 = *(id *)(v8[6] + 8 * v19);
          v27 = static NSObject.== infix(_:_:)();

          if ((v27 & 1) != 0)
            goto LABEL_17;
        }
        v5 = v46;
      }
      *(_QWORD *)&v12[8 * v20] = v22 | v21;
      *(_QWORD *)(v8[6] + 8 * v19) = v16;
      v28 = v8[2];
      v15 = __OFADD__(v28, 1);
      v29 = v28 + 1;
      if (v15)
        goto LABEL_44;
      v8[2] = v29;
LABEL_18:
      if (v13 == v50)
        return;
    }
  }
  v30 = 0;
  v47 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v30 != v47)
  {
    v31 = v8[5];
    v32 = *(id *)(v5 + 32 + 8 * v30);
    v33 = NSObject._rawHashValue(seed:)(v31);
    v34 = -1 << *((_BYTE *)v8 + 32);
    v35 = v33 & ~v34;
    v36 = v35 >> 6;
    v37 = *(_QWORD *)&v12[8 * (v35 >> 6)];
    v38 = 1 << v35;
    if (((1 << v35) & v37) != 0)
    {
      sub_10000EC34(0, a3, a4);
      v39 = *(id *)(v8[6] + 8 * v35);
      v40 = static NSObject.== infix(_:_:)();

      if ((v40 & 1) != 0)
        goto LABEL_30;
      v41 = ~v34;
      v35 = (v35 + 1) & v41;
      v36 = v35 >> 6;
      v37 = *(_QWORD *)&v12[8 * (v35 >> 6)];
      v38 = 1 << v35;
      if ((v37 & (1 << v35)) != 0)
      {
        while (1)
        {
          v42 = *(id *)(v8[6] + 8 * v35);
          v43 = static NSObject.== infix(_:_:)();

          if ((v43 & 1) != 0)
            break;
          v35 = (v35 + 1) & v41;
          v36 = v35 >> 6;
          v37 = *(_QWORD *)&v12[8 * (v35 >> 6)];
          v38 = 1 << v35;
          if ((v37 & (1 << v35)) == 0)
            goto LABEL_38;
        }
LABEL_30:

        v9 = v50;
        goto LABEL_31;
      }
LABEL_38:
      v9 = v50;
    }
    *(_QWORD *)&v12[8 * v36] = v38 | v37;
    *(_QWORD *)(v8[6] + 8 * v35) = v32;
    v44 = v8[2];
    v15 = __OFADD__(v44, 1);
    v45 = v44 + 1;
    if (v15)
      goto LABEL_45;
    v8[2] = v45;
LABEL_31:
    if (++v30 == v9)
      return;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

void sub_10000E5E0(uint64_t a1, void (*a2)(__int128 *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 aBlock;
  __int128 v38;
  _QWORD v39[4];

  v10 = (_QWORD *)swift_allocObject(&unk_100015168, 48, 7);
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = a5;
  v11 = *(void **)(a1 + 16);
  if (v11 && (v12 = *(void **)(a1 + 24)) != 0)
  {
    v13 = swift_allocObject(&unk_100015190, 24, 7);
    *(_QWORD *)(v13 + 16) = 0;
    v14 = swift_allocObject(&unk_1000151B8, 24, 7);
    *(_QWORD *)(v14 + 16) = 0;
    v15 = swift_allocObject(&unk_1000151E0, 24, 7);
    *(_QWORD *)(v15 + 16) = 0;
    v16 = objc_allocWithZone((Class)PKAsyncUnaryOperationComposer);
    swift_retain(a3);
    swift_retain(a4);
    v17 = v11;
    v18 = v12;
    v19 = objc_msgSend(v16, "init");
    v20 = swift_allocObject(&unk_100015208, 32, 7);
    *(_QWORD *)(v20 + 16) = v17;
    *(_QWORD *)(v20 + 24) = v13;
    v39[0] = sub_10000EACC;
    v39[1] = v20;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v38 = sub_10000C014;
    *((_QWORD *)&v38 + 1) = &unk_100015220;
    v21 = _Block_copy(&aBlock);
    v22 = v39[1];
    v23 = v17;
    swift_retain(v13);
    swift_release(v22);
    objc_msgSend(v19, "addOperation:", v21);
    _Block_release(v21);
    v24 = (_QWORD *)swift_allocObject(&unk_100015258, 40, 7);
    v24[2] = v13;
    v24[3] = v18;
    v24[4] = v14;
    v39[0] = sub_10000EAF0;
    v39[1] = v24;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v38 = sub_10000C014;
    *((_QWORD *)&v38 + 1) = &unk_100015270;
    v25 = _Block_copy(&aBlock);
    v26 = v39[1];
    v36 = v18;
    swift_retain(v13);
    swift_retain(v14);
    swift_release(v26);
    objc_msgSend(v19, "addOperation:", v25);
    _Block_release(v25);
    v27 = (_QWORD *)swift_allocObject(&unk_1000152A8, 40, 7);
    v27[2] = v13;
    v27[3] = v23;
    v27[4] = v15;
    v39[0] = sub_10000EB34;
    v39[1] = v27;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v38 = sub_10000C014;
    *((_QWORD *)&v38 + 1) = &unk_1000152C0;
    v28 = _Block_copy(&aBlock);
    v29 = v39[1];
    v30 = v23;
    swift_retain(v13);
    swift_retain(v15);
    swift_release(v29);
    objc_msgSend(v19, "addOperation:", v28);
    _Block_release(v28);
    v31 = objc_msgSend(objc_allocWithZone((Class)NSNull), "init");
    v32 = (_QWORD *)swift_allocObject(&unk_1000152F8, 56, 7);
    v32[2] = sub_10000EA4C;
    v32[3] = v10;
    v32[4] = v13;
    v32[5] = v14;
    v32[6] = v15;
    v39[0] = sub_10000EB7C;
    v39[1] = v32;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v38 = sub_10000C64C;
    *((_QWORD *)&v38 + 1) = &unk_100015310;
    v33 = _Block_copy(&aBlock);
    v34 = v39[1];
    swift_retain(v13);
    swift_retain(v14);
    swift_retain(v15);
    swift_retain(v10);
    swift_release(v34);
    v35 = objc_msgSend(v19, "evaluateWithInput:completion:", v31, v33);
    _Block_release(v33);
    swift_release(v10);

    swift_release(v13);
    swift_release(v14);
    swift_release(v15);

    swift_unknownObjectRelease(v35);
  }
  else
  {
    v38 = 0u;
    memset(v39, 0, 25);
    aBlock = 0u;
    swift_retain(a3);
    swift_retain(a4);
    a2(&aBlock);
    swift_release(v10);
  }
}

uint64_t sub_10000EA20()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

void sub_10000EA4C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  sub_10000B0C0(a1, a2, a3, *(void (**)(__int128 *))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
}

uint64_t sub_10000EA58()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EA7C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EAA0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000EACC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_10000BE48(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_10000EAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000EAE4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000EAF0(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  uint64_t v4;

  sub_10000C0C4(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void **)(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_10000EB00()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10000EB34(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  uint64_t v4;

  sub_10000C2F4(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void **)(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_10000EB40()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EB7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000C574(a1, a2, a3, *(void (**)(void *, void *, uint64_t))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48));
}

uint64_t sub_10000EB90(uint64_t a1)
{
  uint64_t v1;

  return sub_10000C45C(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t, _QWORD))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10000EBA0(void *a1)
{
  uint64_t v1;

  return sub_10000C22C(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t, _QWORD))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10000EBAC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EBD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000EBEC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000EC20(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000BF2C(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_10000EC2C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000EC34(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000EC6C(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_10000EC34(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000ECAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000ECF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000B85C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(void **)(v3 + 32), *(void **)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 72));
}

uint64_t sub_10000ED28()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10000ED5C(void *a1)
{
  uint64_t v1;

  sub_10000B9EC(a1, *(id *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(__int128 *))(v1 + 40));
}

uint64_t sub_10000ED6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    return swift_bridgeObjectRelease(a6);
  }
  return result;
}

unint64_t sub_10000EDA8()
{
  unint64_t result;

  result = qword_100018FC0;
  if (!qword_100018FC0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100018FC0);
  }
  return result;
}

uint64_t sub_10000EE34()
{
  uint64_t v0;
  Swift::String v1;
  void *object;

  v0 = sub_100004334(&qword_100018C90);
  sub_1000044CC(v0, qword_100019178);
  sub_10000450C(v0, (uint64_t)qword_100019178);
  v1._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(PKURLActionRouteCreditPaymentPass);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  URL.init(string:)(0x2F3A74656C6C6177, 0xE90000000000002FLL);
  return swift_bridgeObjectRelease(0xE90000000000002FLL);
}

uint64_t sub_10000EEE0()
{
  uint64_t v0;
  Swift::String v1;
  void *object;

  v0 = sub_100004334(&qword_100018C90);
  sub_1000044CC(v0, qword_100019190);
  sub_10000450C(v0, (uint64_t)qword_100019190);
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  v1._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(PKURLActionRouteCreditPaymentPass);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  URL.init(string:)(0xD000000000000019, 0x8000000100013590);
  return swift_bridgeObjectRelease(0x8000000100013590);
}

id sub_10000F1F0()
{
  return sub_10000F564(type metadata accessor for ConfigurationIntent);
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return objc_opt_self(ConfigurationIntent);
}

BOOL sub_10000F21C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000F230()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000F274()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000F29C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10000F2DC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10000F60C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10000F30C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id sub_10000F408(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id sub_10000F460(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id sub_10000F558()
{
  return sub_10000F564(type metadata accessor for ConfigurationIntentResponse);
}

id sub_10000F564(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return objc_opt_self(ConfigurationIntentResponse);
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

unint64_t sub_10000F5C8()
{
  unint64_t result;

  result = qword_100019020;
  if (!qword_100019020)
  {
    result = swift_getWitnessTable(&unk_100010FF8, &type metadata for ConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100019020);
  }
  return result;
}

unint64_t sub_10000F60C(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

unint64_t sub_10000F61C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10000F878(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_10000F64C(uint64_t a1)
{
  return sub_10000F690(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id sub_10000F684(uint64_t a1)
{
  return sub_10000F690(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_10000F690(uint64_t a1, SEL *a2)
{
  uint64_t v2;

  return objc_msgSend((id)swift_getObjCClassFromMetadata(v2), *a2, a1);
}

id sub_10000F7D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeriodResolutionResult();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PeriodResolutionResult()
{
  return objc_opt_self(PeriodResolutionResult);
}

ValueMetadata *type metadata accessor for Period()
{
  return &type metadata for Period;
}

unint64_t sub_10000F834()
{
  unint64_t result;

  result = qword_1000190B0;
  if (!qword_1000190B0)
  {
    result = swift_getWitnessTable(&unk_1000110D0, &type metadata for Period);
    atomic_store(result, (unint64_t *)&qword_1000190B0);
  }
  return result;
}

unint64_t sub_10000F878(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

uint64_t sub_10000F888()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC29PassbookWidgetsExtension_iPadP33_6838F567B78F7D0EC6B21EE504FD3FEF19ResourceBundleClass);
}

uint64_t sub_10000F8B8()
{
  return sub_10000FA50(1);
}

uint64_t sub_10000F8C0(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_100019998 == -1)
  {
    if (qword_1000199A0)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_100019998, 0, (dispatch_function_t)sub_10000FA48);
    if (qword_1000199A0)
      goto LABEL_3;
  }
  if (qword_100019990 == -1)
  {
    v9 = dword_100019980 < a2;
    if (dword_100019980 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_100019990, 0, (dispatch_function_t)sub_10000F8B8);
    v9 = dword_100019980 < a2;
    if (dword_100019980 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_100019984 > a3)
    return 1;
  return dword_100019984 >= a3 && dword_100019988 >= a4;
}

uint64_t sub_10000FA48()
{
  return sub_10000FA50(0);
}

uint64_t sub_10000FA50(uint64_t result)
{
  void *v1;
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];

  v1 = (void *)qword_1000199A0;
  if (qword_1000199A0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_1000199A0 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &dword_100019980, &dword_100019984, &dword_100019988);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}
