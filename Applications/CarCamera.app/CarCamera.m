__n128 initializeWithTake for ButtonBarViewV(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002908(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100002928(uint64_t result, int a2, int a3)
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
  sub_100003400(a1, &qword_100032770, (uint64_t)&unk_10002D100);
}

_BYTE *initializeBufferWithCopyOfBuffer for LayoutConfig(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_100002978(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100002984(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfig()
{
  return &type metadata for LayoutConfig;
}

unint64_t sub_1000029A4()
{
  unint64_t result;

  result = qword_100032778;
  if (!qword_100032778)
  {
    result = swift_getWitnessTable(&unk_1000227A8, &type metadata for LayoutConfig);
    atomic_store(result, (unint64_t *)&qword_100032778);
  }
  return result;
}

BOOL sub_1000029E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002A00()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002A44()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002A6C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_100002AAC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100002AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;

  v8 = sub_1000029A4();
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_100002B04()
{
  unint64_t v0;
  uint64_t var1;

  v0 = sub_1000032F8();
  EnvironmentValues.subscript.getter(&var1, &type metadata for LayoutConfigKey, &type metadata for LayoutConfigKey, v0);
  return var1;
}

uint64_t sub_100002B3C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  int v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  __int128 v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  int v53;
  int v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;

  v69 = a3;
  v67 = sub_10000383C(&qword_1000327B0);
  ((void (*)(void))__chkstk_darwin)();
  v68 = (uint64_t)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000383C(&qword_1000327B8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v66 - v10;
  v12 = sub_10000383C(&qword_1000327C0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v66 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v66 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v66 - v23;
  v26 = static Alignment.center.getter(v22);
  if ((a2 & 1) != 0)
  {
    _FrameLayout.init(width:height:alignment:)(&v70, 0x403C000000000000, 0, 0, 1, v26, v25);
    v46 = sub_10000383C(&qword_1000327C8);
    v47 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(v9, a1, v46);
    v48 = &v9[*(int *)(v6 + 36)];
    v49 = v71;
    *(_OWORD *)v48 = v70;
    *((_OWORD *)v48 + 1) = v49;
    *((_OWORD *)v48 + 2) = v72;
    v50 = static Edge.Set.top.getter(v47);
    v51 = static Edge.Set.bottom.getter();
    v52 = Edge.Set.init(rawValue:)(0);
    v53 = Edge.Set.init(rawValue:)(v52);
    if (Edge.Set.init(rawValue:)(v53 & v50) != v50)
      v52 = Edge.Set.init(rawValue:)(v52 | v50);
    v54 = Edge.Set.init(rawValue:)(v52);
    if (Edge.Set.init(rawValue:)(v54 & v51) != v51)
      LOBYTE(v52) = Edge.Set.init(rawValue:)(v52 | v51);
    v55 = EdgeInsets.init(_all:)(4.0);
    v57 = v56;
    v59 = v58;
    v61 = v60;
    sub_1000038C4((uint64_t)v9, (uint64_t)v15, &qword_1000327B8);
    v62 = &v15[*(int *)(v12 + 36)];
    *v62 = v52;
    *((double *)v62 + 1) = v55;
    *((_QWORD *)v62 + 2) = v57;
    *((_QWORD *)v62 + 3) = v59;
    *((_QWORD *)v62 + 4) = v61;
    v62[40] = 0;
    sub_100003A24((uint64_t)v9, &qword_1000327B8);
    sub_10000387C((uint64_t)v15, (uint64_t)v18);
    v63 = v68;
    sub_1000038C4((uint64_t)v18, v68, &qword_1000327C0);
    swift_storeEnumTagMultiPayload(v63, v67, 1);
    v64 = sub_100003970(&qword_1000327D0, &qword_1000327C0, (void (*)(void))sub_10000394C);
    _ConditionalContent<>.init(storage:)(v63, v12, v12, v64, v64);
    v24 = v18;
  }
  else
  {
    _FrameLayout.init(width:height:alignment:)(&v70, 0, 1, 0x4040000000000000, 0, v26, v25);
    v27 = sub_10000383C(&qword_1000327C8);
    v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v11, a1, v27);
    v29 = &v11[*(int *)(v6 + 36)];
    v30 = v71;
    *(_OWORD *)v29 = v70;
    *((_OWORD *)v29 + 1) = v30;
    *((_OWORD *)v29 + 2) = v72;
    v31 = static Edge.Set.leading.getter(v28);
    v32 = static Edge.Set.trailing.getter();
    v33 = Edge.Set.init(rawValue:)(0);
    v34 = Edge.Set.init(rawValue:)(v33);
    if (Edge.Set.init(rawValue:)(v34 & v31) != v31)
      v33 = Edge.Set.init(rawValue:)(v33 | v31);
    v35 = Edge.Set.init(rawValue:)(v33);
    if (Edge.Set.init(rawValue:)(v35 & v32) != v32)
      LOBYTE(v33) = Edge.Set.init(rawValue:)(v33 | v32);
    v36 = EdgeInsets.init(_all:)(4.0);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    sub_1000038C4((uint64_t)v11, (uint64_t)v21, &qword_1000327B8);
    v43 = &v21[*(int *)(v12 + 36)];
    *v43 = v33;
    *((double *)v43 + 1) = v36;
    *((_QWORD *)v43 + 2) = v38;
    *((_QWORD *)v43 + 3) = v40;
    *((_QWORD *)v43 + 4) = v42;
    v43[40] = 0;
    sub_100003A24((uint64_t)v11, &qword_1000327B8);
    sub_10000387C((uint64_t)v21, (uint64_t)v24);
    v44 = v68;
    sub_1000038C4((uint64_t)v24, v68, &qword_1000327C0);
    swift_storeEnumTagMultiPayload(v44, v67, 0);
    v45 = sub_100003970(&qword_1000327D0, &qword_1000327C0, (void (*)(void))sub_10000394C);
    _ConditionalContent<>.init(storage:)(v44, v12, v12, v45, v45);
  }
  return sub_100003A24((uint64_t)v24, &qword_1000327C0);
}

uint64_t sub_100002FF4()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10000300C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;

  return sub_100002B3C(a1, *v2, a2);
}

uint64_t sub_100003014@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000303C(uint64_t a1, uint64_t a2)
{
  return sub_100003104(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003048(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100003088(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000030F8(uint64_t a1, uint64_t a2)
{
  return sub_100003104(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003104(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100003140(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1000031B4(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100003230@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100003270(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

unint64_t sub_1000032F8()
{
  unint64_t result;

  result = qword_100032780;
  if (!qword_100032780)
  {
    result = swift_getWitnessTable(&unk_100022978, &type metadata for LayoutConfigKey);
    atomic_store(result, (unint64_t *)&qword_100032780);
  }
  return result;
}

uint64_t sub_10000333C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100003380(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000349C((unint64_t *)&qword_100032BF0, (uint64_t)&unk_100022934);
  v3 = sub_10000349C(&qword_1000327A8, (uint64_t)&unk_100022888);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100003400(a1, &qword_100032788, (uint64_t)&unk_10002D1B8);
}

void sub_100003400(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

ValueMetadata *type metadata accessor for LayoutConfigKey()
{
  return &type metadata for LayoutConfigKey;
}

uint64_t sub_100003454()
{
  return sub_10000349C(&qword_100032790, (uint64_t)&unk_10002284C);
}

uint64_t sub_100003478()
{
  return sub_10000349C(&qword_100032798, (uint64_t)&unk_100022820);
}

uint64_t sub_10000349C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000034DC()
{
  return sub_10000349C(&qword_1000327A0, (uint64_t)&unk_1000228BC);
}

uint64_t getEnumTagSinglePayload for SystemButtonType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7E)
    goto LABEL_17;
  if (a2 + 130 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 130) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 130;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 130;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 130;
  }
LABEL_17:
  v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for SystemButtonType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 130 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 130) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7E)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7D)
    return ((uint64_t (*)(void))((char *)&loc_1000035EC + 4 * byte_100022735[v4]))();
  *a1 = a2 - 126;
  return ((uint64_t (*)(void))((char *)sub_100003620 + 4 * byte_100022730[v4]))();
}

uint64_t sub_100003620(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003628(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100003630);
  return result;
}

uint64_t sub_100003648(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100003650);
  *(_BYTE *)result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_100003654(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000365C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003668(_BYTE *a1)
{
  int v1;

  v1 = (char)*a1;
  if (v1 >= 0)
    return *a1 >> 6;
  else
    return v1 & 1 | 2u;
}

_BYTE *sub_100003684(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_100003694(_BYTE *result, unsigned int a2)
{
  if (a2 < 2)
    *result = *result & 1 | ((_BYTE)a2 << 6);
  else
    *result = a2 & 1 | 0x80;
  return result;
}

ValueMetadata *type metadata accessor for SystemButtonType()
{
  return &type metadata for SystemButtonType;
}

uint64_t getEnumTagSinglePayload for CameraButtonShapeType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s9CarCamera12LayoutConfigOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000037AC + 4 * byte_10002273F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000037E0 + 4 * byte_10002273A[v4]))();
}

uint64_t sub_1000037E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000037E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000037F0);
  return result;
}

uint64_t sub_1000037FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100003804);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100003808(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003810(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CameraLayout()
{
  return &type metadata for CameraLayout;
}

uint64_t sub_10000382C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024A14, 1);
}

uint64_t sub_10000383C(uint64_t *a1)
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

uint64_t sub_10000387C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000383C(&qword_1000327C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000038C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000383C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003908(uint64_t *a1)
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

uint64_t sub_10000394C()
{
  return sub_100003970(&qword_1000327D8, &qword_1000327B8, (void (*)(void))sub_1000039D8);
}

uint64_t sub_100003970(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003908(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000039D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000327E0;
  if (!qword_1000327E0)
  {
    v1 = sub_100003908(&qword_1000327C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ViewModifier_Content<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000327E0);
  }
  return result;
}

uint64_t sub_100003A24(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000383C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100003A64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000327E8;
  if (!qword_1000327E8)
  {
    v1 = sub_100003908(&qword_1000327F0);
    sub_100003970(&qword_1000327D0, &qword_1000327C0, (void (*)(void))sub_10000394C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000327E8);
  }
  return result;
}

uint64_t sub_100003AF0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

void destroy for ButtonBarContentView(uint64_t a1)
{
  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));

}

uint64_t sub_100003B28(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t _s9CarCamera20ButtonBarContentViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for ButtonBarContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *(void **)(a2 + 16);
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v10 = v8;

  return a1;
}

__n128 initializeWithTake for ButtonBarContentView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ButtonBarContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarContentView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ButtonBarContentView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ButtonBarContentView()
{
  return &type metadata for ButtonBarContentView;
}

uint64_t sub_100003CEC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024A90, 1);
}

uint64_t sub_100003CFC@<X0>(uint64_t a1@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  id (*v29)();
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;

  v7 = a2 & 1;
  sub_100003AF0(a1, a2 & 1);
  v8 = sub_100008D3C(a1, v7);
  sub_100003B28(a1, v7);
  v9 = type metadata accessor for ButtonBarLayout(0);
  v27 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
  v28[0] = EnvironmentObject.init()(v9, v27);
  v28[1] = v10;
  if ((v8 & 1) != 0)
  {
    v11 = sub_1000053B8();
    v12 = sub_1000053FC();
    v29 = 0;
    v30 = 0;
    v31 = 0;
  }
  else
  {
    v29 = sub_100003F18;
    v30 = 0;
    v31 = 256;
    v11 = sub_1000053B8();
    v12 = sub_1000053FC();
  }
  _ConditionalContent<>.init(storage:)(v28, &type metadata for ButtonBarViewV, &type metadata for ButtonBarViewH, v11, v12);
  v25 = v33;
  v26 = v32;
  v23 = v35;
  v24 = v34;
  v13 = v36;
  v14 = v37;
  v15 = type metadata accessor for CameraModel(0);
  v16 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
  v17 = static ObservableObject.environmentStore.getter(v15, v16);
  v18 = *(_QWORD *)&a3[OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController];
  type metadata accessor for ButtonBarLayout(0);
  v19 = a3;
  swift_retain(v18);
  v20 = static ObservableObject.environmentStore.getter(v9, v27);
  sub_100003AF0(a1, v7);
  v21 = sub_100008D3C(a1, v7) & 1;
  result = sub_100003B28(a1, v7);
  *(_QWORD *)a4 = v26;
  *(_QWORD *)(a4 + 8) = v25;
  *(_QWORD *)(a4 + 16) = v24;
  *(_QWORD *)(a4 + 24) = v23;
  *(_BYTE *)(a4 + 32) = v13;
  *(_BYTE *)(a4 + 33) = v14;
  *(_QWORD *)(a4 + 40) = v17;
  *(_QWORD *)(a4 + 48) = a3;
  *(_QWORD *)(a4 + 56) = v20;
  *(_QWORD *)(a4 + 64) = v18;
  *(_BYTE *)(a4 + 72) = v21;
  return result;
}

uint64_t sub_100003F00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100003CFC(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(char **)(v1 + 16), a1);
}

id sub_100003F18()
{
  if (qword_100032768 != -1)
    swift_once(&qword_100032768, sub_1000201B8);
  return (id)qword_100035118;
}

uint64_t sub_100003F58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  unsigned int *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v29;

  v2 = v1;
  v29 = a1;
  v3 = type metadata accessor for LayoutDirection(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000383C(&qword_1000328E0);
  __chkstk_darwin(v7);
  v9 = (char *)&KeyPath - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000383C(&qword_1000328E8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static VerticalAlignment.center.getter(v11);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v14 = sub_10000383C(&qword_1000328F0);
  sub_1000041E0((uint64_t *)v2, (uint64_t)&v9[*(int *)(v14 + 44)]);
  KeyPath = swift_getKeyPath(&unk_100022CC8);
  v15 = *(_QWORD *)(v2 + 16);
  v16 = *(_QWORD *)(v2 + 24);
  v17 = *(unsigned __int8 *)(v2 + 32);
  v18 = type metadata accessor for CameraCAFManager(0);
  v19 = sub_100005CF4(&qword_1000328F8, type metadata accessor for CameraCAFManager, (uint64_t)&unk_100023C60);
  v20 = (char *)StateObject.wrappedValue.getter(v15, v16, v17, v18, v19);
  v21 = objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus], "currentSession");
  if (!v21)
  {

    goto LABEL_5;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, "configuration");

  LOBYTE(v22) = objc_msgSend(v23, "rightHandDrive");
  if ((v22 & 1) == 0)
  {
LABEL_5:
    v24 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
    goto LABEL_6;
  }
  v24 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
LABEL_6:
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v24, v3);
  v25 = (uint64_t *)&v13[*(int *)(v10 + 36)];
  v26 = sub_10000383C(&qword_100032900);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v25 + *(int *)(v26 + 28), v6, v3);
  *v25 = KeyPath;
  sub_1000038C4((uint64_t)v9, (uint64_t)v13, &qword_1000328E0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100003A24((uint64_t)v9, &qword_1000328E0);
  return sub_100005D34((uint64_t)v13, v29, &qword_1000328E8);
}

uint64_t sub_1000041E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v4 = sub_10000383C(&qword_100032908);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v44 - v8;
  v10 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100022B58);
    v12 = swift_getKeyPath(&unk_100022B80);
    v13 = swift_retain(v10);
    static Published.subscript.getter(v13, KeyPath, v12);
    swift_release(v10);
    swift_release(KeyPath);
    swift_release(v12);
    if (v60)
    {
      LOBYTE(v59) = v59 & 1;
      v14 = sub_100005B84();
      v55 = AnyView.init<A>(_:)(&v56, &type metadata for ButtonBarView, v14);
    }
    else
    {
      v55 = 0;
    }
    v15 = swift_getKeyPath(&unk_100022BA0);
    v16 = swift_getKeyPath(&unk_100022BC8);
    v17 = swift_retain(v10);
    static Published.subscript.getter(v17, v15, v16);
    swift_release(v10);
    swift_release(v15);
    v18 = swift_release(v16);
    v19 = v56;
    v45 = v56;
    v51 = v59;
    v52 = v58;
    v53 = v60;
    v54 = v57;
    *(_QWORD *)v9 = static VerticalAlignment.center.getter(v18);
    *((_QWORD *)v9 + 1) = 0;
    v9[16] = 1;
    v20 = sub_10000383C(&qword_100032910);
    sub_100004594(a1, (uint64_t)&v9[*(int *)(v20 + 44)]);
    v21 = swift_getKeyPath(&unk_100022BE8);
    v22 = swift_getKeyPath(&unk_100022C10);
    v23 = swift_retain(v10);
    static Published.subscript.getter(v23, v21, v22);
    swift_release(v10);
    swift_release(v21);
    swift_release(v22);
    v24 = v57;
    v25 = v59;
    v47 = v58;
    v48 = v56;
    v50 = v9;
    v46 = v60;
    sub_1000038C4((uint64_t)v9, (uint64_t)v7, &qword_100032908);
    v26 = v54;
    v27 = v55;
    *(_QWORD *)a2 = v55;
    *(_QWORD *)(a2 + 8) = v19;
    v29 = v51;
    v28 = v52;
    *(_QWORD *)(a2 + 16) = v26;
    *(_QWORD *)(a2 + 24) = v28;
    v30 = v53;
    *(_QWORD *)(a2 + 32) = v29;
    *(_QWORD *)(a2 + 40) = v30;
    *(_QWORD *)(a2 + 48) = 0;
    *(_BYTE *)(a2 + 56) = 1;
    v31 = sub_10000383C(&qword_100032918);
    v55 = v27;
    v49 = v7;
    v32 = v31;
    sub_1000038C4((uint64_t)v7, a2 + *(int *)(v31 + 80), &qword_100032908);
    v33 = a2 + *(int *)(v32 + 96);
    *(_QWORD *)v33 = 0;
    *(_BYTE *)(v33 + 8) = 1;
    v34 = (_QWORD *)(a2 + *(int *)(v32 + 112));
    v35 = v47;
    v36 = v48;
    *v34 = v48;
    v34[1] = v24;
    v34[2] = v35;
    v34[3] = v25;
    v37 = v46;
    v34[4] = v46;
    swift_retain(v27);
    v38 = v45;
    v39 = v54;
    sub_100005AF4(v45, v54, v28, v29, v30);
    sub_100005AF4(v36, v24, v35, v25, v37);
    sub_100003A24((uint64_t)v50, &qword_100032908);
    sub_100005B3C(v36, v24, v35, v25, v37);
    sub_100003A24((uint64_t)v49, &qword_100032908);
    sub_100005B3C(v38, v39, v28, v29, v53);
    return swift_release(v55);
  }
  else
  {
    v41 = a1[1];
    v42 = type metadata accessor for ButtonBarLayout(0);
    v43 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
    result = EnvironmentObject.error()(0, v41, v42, v43);
    __break(1u);
  }
  return result;
}

uint64_t sub_100004594@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = sub_10000383C(&qword_100032920);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v29 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v29 - v11;
  v14 = *a1;
  v13 = a1[1];
  v15 = sub_100004F48(*a1, v13);
  v16 = static VerticalAlignment.center.getter();
  if (v14)
  {
    *(_QWORD *)v10 = v16;
    *((_QWORD *)v10 + 1) = 0x4010000000000000;
    v10[16] = 0;
    sub_10000383C(&qword_100032928);
    KeyPath = swift_getKeyPath(&unk_100022C30);
    v18 = swift_getKeyPath(&unk_100022C58);
    v19 = swift_retain(v14);
    static Published.subscript.getter(v19, KeyPath, v18);
    swift_release(v14);
    swift_release(KeyPath);
    swift_release(v18);
    v20 = swift_getKeyPath(&unk_100022C78);
    v21 = sub_10000383C(&qword_1000328C8);
    v22 = sub_100005E44(&qword_1000328D0, &qword_1000328C8, (uint64_t)&protocol conformance descriptor for [A]);
    v23 = sub_100005B84();
    ForEach<>.init(_:id:content:)(&v30, v20, sub_10000482C, 0, v21, &type metadata for ButtonBarView, v22, &protocol witness table for String, v23);
    sub_100005D34((uint64_t)v10, (uint64_t)v12, &qword_100032920);
    sub_1000038C4((uint64_t)v12, (uint64_t)v7, &qword_100032920);
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a2 + 8) = v15 & 1;
    *(_BYTE *)(a2 + 9) = (v15 & 1) == 0;
    v24 = sub_10000383C(&qword_100032930);
    sub_1000038C4((uint64_t)v7, a2 + *(int *)(v24 + 48), &qword_100032920);
    v25 = a2 + *(int *)(v24 + 64);
    *(_QWORD *)v25 = 0;
    *(_BYTE *)(v25 + 8) = 1;
    sub_100003A24((uint64_t)v12, &qword_100032920);
    return sub_100003A24((uint64_t)v7, &qword_100032920);
  }
  else
  {
    v27 = type metadata accessor for ButtonBarLayout(0);
    v28 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
    result = EnvironmentObject.error()(0, v13, v27, v28);
    __break(1u);
  }
  return result;
}

uint64_t sub_100004830(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for LayoutDirection(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.layoutDirection.setter(v3);
}

uint64_t sub_1000048AC()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000048C4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003F58(a1);
}

uint64_t sub_1000048FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
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
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v6 = sub_10000383C(&qword_100032898);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v44 - v10;
  if (a1)
  {
    KeyPath = swift_getKeyPath(&unk_100022B58);
    v13 = swift_getKeyPath(&unk_100022B80);
    v14 = swift_retain(a1);
    static Published.subscript.getter(v14, KeyPath, v13);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v13);
    if (v60)
    {
      LOBYTE(v59) = v59 & 1;
      v15 = sub_100005B84();
      v55 = AnyView.init<A>(_:)(&v56, &type metadata for ButtonBarView, v15);
    }
    else
    {
      v55 = 0;
    }
    v16 = swift_getKeyPath(&unk_100022BA0);
    v17 = swift_getKeyPath(&unk_100022BC8);
    v18 = swift_retain(a1);
    static Published.subscript.getter(v18, v16, v17);
    swift_release(a1);
    swift_release(v16);
    v19 = swift_release(v17);
    v20 = v56;
    v45 = v56;
    v51 = v59;
    v52 = v58;
    v53 = v60;
    v54 = v57;
    *(_QWORD *)v11 = static HorizontalAlignment.center.getter(v19);
    *((_QWORD *)v11 + 1) = 0;
    v11[16] = 1;
    v21 = sub_10000383C(&qword_1000328A0);
    sub_100004CB0(a1, a2, (uint64_t)&v11[*(int *)(v21 + 44)]);
    v22 = swift_getKeyPath(&unk_100022BE8);
    v23 = swift_getKeyPath(&unk_100022C10);
    v24 = swift_retain(a1);
    static Published.subscript.getter(v24, v22, v23);
    swift_release(a1);
    swift_release(v22);
    swift_release(v23);
    v25 = v57;
    v26 = v59;
    v47 = v58;
    v48 = v56;
    v50 = v11;
    v46 = v60;
    sub_1000038C4((uint64_t)v11, (uint64_t)v9, &qword_100032898);
    v27 = v54;
    v28 = v55;
    *(_QWORD *)a3 = v55;
    *(_QWORD *)(a3 + 8) = v20;
    v30 = v51;
    v29 = v52;
    *(_QWORD *)(a3 + 16) = v27;
    *(_QWORD *)(a3 + 24) = v29;
    v31 = v53;
    *(_QWORD *)(a3 + 32) = v30;
    *(_QWORD *)(a3 + 40) = v31;
    *(_QWORD *)(a3 + 48) = 0;
    *(_BYTE *)(a3 + 56) = 1;
    v32 = sub_10000383C(&qword_1000328A8);
    v55 = v28;
    v49 = v9;
    v33 = v32;
    sub_1000038C4((uint64_t)v9, a3 + *(int *)(v32 + 80), &qword_100032898);
    v34 = a3 + *(int *)(v33 + 96);
    *(_QWORD *)v34 = 0;
    *(_BYTE *)(v34 + 8) = 1;
    v35 = (_QWORD *)(a3 + *(int *)(v33 + 112));
    v36 = v47;
    v37 = v48;
    *v35 = v48;
    v35[1] = v25;
    v35[2] = v36;
    v35[3] = v26;
    v38 = v46;
    v35[4] = v46;
    swift_retain(v28);
    v39 = v45;
    v40 = v54;
    sub_100005AF4(v45, v54, v29, v30, v31);
    sub_100005AF4(v37, v25, v36, v26, v38);
    sub_100003A24((uint64_t)v50, &qword_100032898);
    sub_100005B3C(v37, v25, v36, v26, v38);
    sub_100003A24((uint64_t)v49, &qword_100032898);
    sub_100005B3C(v39, v40, v29, v30, v53);
    return swift_release(v55);
  }
  else
  {
    v42 = type metadata accessor for ButtonBarLayout(0);
    v43 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
    result = EnvironmentObject.error()(0, a2, v42, v43);
    __break(1u);
  }
  return result;
}

uint64_t sub_100004CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_10000383C(&qword_1000328B8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v29 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v29 - v13;
  v15 = sub_100004F48(a1, a2);
  v16 = static HorizontalAlignment.center.getter();
  if (a1)
  {
    *(_QWORD *)v12 = v16;
    *((_QWORD *)v12 + 1) = 0x4010000000000000;
    v12[16] = 0;
    sub_10000383C(&qword_1000328C0);
    KeyPath = swift_getKeyPath(&unk_100022C30);
    v18 = swift_getKeyPath(&unk_100022C58);
    v19 = swift_retain(a1);
    static Published.subscript.getter(v19, KeyPath, v18);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v18);
    v20 = swift_getKeyPath(&unk_100022C78);
    v21 = sub_10000383C(&qword_1000328C8);
    v22 = sub_100005E44(&qword_1000328D0, &qword_1000328C8, (uint64_t)&protocol conformance descriptor for [A]);
    v23 = sub_100005B84();
    ForEach<>.init(_:id:content:)(&v30, v20, sub_10000482C, 0, v21, &type metadata for ButtonBarView, v22, &protocol witness table for String, v23);
    sub_100005D34((uint64_t)v12, (uint64_t)v14, &qword_1000328B8);
    sub_1000038C4((uint64_t)v14, (uint64_t)v9, &qword_1000328B8);
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 8) = v15 & 1;
    *(_BYTE *)(a3 + 9) = (v15 & 1) == 0;
    v24 = sub_10000383C(&qword_1000328D8);
    sub_1000038C4((uint64_t)v9, a3 + *(int *)(v24 + 48), &qword_1000328B8);
    v25 = a3 + *(int *)(v24 + 64);
    *(_QWORD *)v25 = 0;
    *(_BYTE *)(v25 + 8) = 1;
    sub_100003A24((uint64_t)v14, &qword_1000328B8);
    return sub_100003A24((uint64_t)v9, &qword_1000328B8);
  }
  else
  {
    v27 = type metadata accessor for ButtonBarLayout(0);
    v28 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
    result = EnvironmentObject.error()(0, a2, v27, v28);
    __break(1u);
  }
  return result;
}

uint64_t sub_100004F48(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
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
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  if (a1)
  {
    KeyPath = swift_getKeyPath(&unk_100022BE8);
    v4 = swift_getKeyPath(&unk_100022C10);
    v5 = swift_retain(a1);
    static Published.subscript.getter(v5, KeyPath, v4);
    swift_release(a1);
    swift_release(KeyPath);
    swift_release(v4);
    sub_100005B3C(v25, v26, v27, v28, v29);
    if (v29)
    {
      v6 = swift_getKeyPath(&unk_100022BA0);
      v7 = swift_getKeyPath(&unk_100022BC8);
      v8 = swift_retain(a1);
      static Published.subscript.getter(v8, v6, v7);
      swift_release(a1);
      swift_release(v6);
      swift_release(v7);
      sub_100005B3C(v25, v26, v27, v28, v29);
    }
    v9 = swift_getKeyPath(&unk_100022BE8);
    v10 = swift_getKeyPath(&unk_100022C10);
    v11 = swift_retain(a1);
    static Published.subscript.getter(v11, v9, v10);
    swift_release(a1);
    swift_release(v9);
    swift_release(v10);
    sub_100005B3C(v25, v26, v27, v28, v29);
    if (v29)
    {
      v12 = swift_getKeyPath(&unk_100022BA0);
      v13 = swift_getKeyPath(&unk_100022BC8);
      v14 = swift_retain(a1);
      static Published.subscript.getter(v14, v12, v13);
      swift_release(a1);
      swift_release(v12);
      swift_release(v13);
      sub_100005B3C(v25, v26, v27, v28, v29);
    }
    else
    {
      v16 = swift_getKeyPath(&unk_100022BE8);
      v17 = swift_getKeyPath(&unk_100022C10);
      v18 = swift_retain(a1);
      static Published.subscript.getter(v18, v16, v17);
      swift_release(a1);
      swift_release(v16);
      swift_release(v17);
      sub_100005B3C(v25, v26, v27, v28, 0);
      v19 = swift_getKeyPath(&unk_100022BA0);
      v20 = swift_getKeyPath(&unk_100022BC8);
      v21 = swift_retain(a1);
      static Published.subscript.getter(v21, v19, v20);
      swift_release(a1);
      swift_release(v19);
      swift_release(v20);
    }
    return 1;
  }
  else
  {
    v23 = type metadata accessor for ButtonBarLayout(0);
    v24 = sub_100005CF4(&qword_1000327F8, type metadata accessor for ButtonBarLayout, (uint64_t)&unk_100023988);
    result = EnvironmentObject.error()(0, a2, v23, v24);
    __break(1u);
  }
  return result;
}

uint64_t sub_100005230@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  id v7;
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
  uint64_t result;
  _OWORD v20[3];
  _OWORD v21[2];
  __int128 v22;

  v3 = a1[3];
  v20[2] = a1[2];
  v21[0] = v3;
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)a1 + 57);
  v4 = a1[1];
  v20[0] = *a1;
  v20[1] = v4;
  v22 = v20[0];
  sub_100005C14((uint64_t)v20);
  v5 = sub_100005C78((uint64_t)&v22);
  v6 = (void *)CAFCameraButtonObservable.observed.getter(v5);
  sub_100005CA0((uint64_t)&v22);
  v7 = objc_msgSend(v6, "identifier");

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v11 = type metadata accessor for ButtonBarEntity();
  v12 = swift_allocObject(v11, 104, 7);
  v13 = sub_10001EFB8(v20, v8, v10, (uint64_t)sub_10002149C, 0, v12);
  v14 = type metadata accessor for CameraModel(0);
  v15 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
  v16 = EnvironmentObject.init()(v14, v15);
  v18 = v17;
  result = swift_getKeyPath(&unk_100022CA0);
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = v18;
  *(_QWORD *)(a2 + 16) = result;
  *(_BYTE *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = v13;
  return result;
}

uint64_t sub_100005360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = *v2;
  v4 = v2[1];
  *(_QWORD *)a2 = static HorizontalAlignment.center.getter(a1);
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v6 = sub_10000383C(&qword_100032890);
  return sub_1000048FC(v5, v4, a2 + *(int *)(v6 + 44));
}

unint64_t sub_1000053B8()
{
  unint64_t result;

  result = qword_100032800;
  if (!qword_100032800)
  {
    result = swift_getWitnessTable(&unk_100022B08, &type metadata for ButtonBarViewV);
    atomic_store(result, (unint64_t *)&qword_100032800);
  }
  return result;
}

unint64_t sub_1000053FC()
{
  unint64_t result;

  result = qword_100032808;
  if (!qword_100032808)
  {
    result = swift_getWitnessTable("٪", &type metadata for ButtonBarViewH);
    atomic_store(result, (unint64_t *)&qword_100032808);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CameraActionButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

id sub_100005470(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain(a2);
}

void destroy for ButtonBarViewH(uint64_t a1)
{
  swift_release(*(_QWORD *)a1);
  sub_1000054AC(*(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_BYTE *)(a1 + 32));
}

void sub_1000054AC(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release(a2);
}

uint64_t initializeWithCopy for ButtonBarViewH(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2[2];
  v6 = (void *)a2[3];
  v7 = *((_BYTE *)a2 + 32);
  swift_retain(v3);
  sub_100005470(v5, v6, v7);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t *assignWithCopy for ButtonBarViewH(uint64_t *a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  v2 = a2;
  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = v2[1];
  v6 = v2[2];
  v7 = (void *)v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_100005470(v6, v7, (char)v2);
  v8 = a1[2];
  v9 = (void *)a1[3];
  v10 = *((_BYTE *)a1 + 32);
  a1[2] = v6;
  a1[3] = (uint64_t)v7;
  *((_BYTE *)a1 + 32) = (_BYTE)v2;
  sub_1000054AC(v8, v9, v10);
  return a1;
}

__n128 initializeWithTake for ButtonBarViewH(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for ButtonBarViewH(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  v5 = a2[3];
  v6 = *((_BYTE *)a2 + 32);
  v7 = a1[2];
  v8 = (void *)a1[3];
  v9 = *((_BYTE *)a1 + 32);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  a1[3] = v5;
  *((_BYTE *)a1 + 32) = v6;
  sub_1000054AC(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarViewH(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarViewH(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarViewH()
{
  return &type metadata for ButtonBarViewH;
}

uint64_t *initializeBufferWithCopyOfBuffer for ButtonBarViewV(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for ButtonBarViewV(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t *assignWithCopy for ButtonBarViewV(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t *assignWithTake for ButtonBarViewV(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarViewV(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarViewV(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarViewV()
{
  return &type metadata for ButtonBarViewV;
}

unint64_t sub_100005834()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032818;
  if (!qword_100032818)
  {
    v1 = sub_100003908(&qword_100032820);
    sub_1000058A0();
    sub_100005A78();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032818);
  }
  return result;
}

unint64_t sub_1000058A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032828;
  if (!qword_100032828)
  {
    v1 = sub_100003908(&qword_100032830);
    sub_100005924();
    sub_100005E44(&qword_100032878, &qword_100032880, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032828);
  }
  return result;
}

unint64_t sub_100005924()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032838;
  if (!qword_100032838)
  {
    v1 = sub_100003908(&qword_100032840);
    sub_1000059A8();
    sub_100005E44(&qword_100032868, &qword_100032870, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032838);
  }
  return result;
}

unint64_t sub_1000059A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032848;
  if (!qword_100032848)
  {
    v1 = sub_100003908(&qword_100032850);
    sub_100005A0C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100032848);
  }
  return result;
}

unint64_t sub_100005A0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032858;
  if (!qword_100032858)
  {
    v1 = sub_100003908(&qword_100032860);
    sub_1000053B8();
    sub_1000053FC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032858);
  }
  return result;
}

unint64_t sub_100005A78()
{
  unint64_t result;

  result = qword_100032888;
  if (!qword_100032888)
  {
    result = swift_getWitnessTable(&unk_1000229D0, &type metadata for CameraLayout);
    atomic_store(result, (unint64_t *)&qword_100032888);
  }
  return result;
}

uint64_t sub_100005ABC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024AE0, 1);
}

uint64_t sub_100005ACC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024AB8, 1);
}

void *sub_100005AF4(void *result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  char v7;
  id v8;

  if (a5)
  {
    v7 = a4 & 1;
    v8 = result;
    sub_100003AF0(a3, v7);
    return (void *)swift_retain(a5);
  }
  return result;
}

void *sub_100005B3C(void *result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  char v7;

  if (a5)
  {
    v7 = a4 & 1;

    sub_100003B28(a3, v7);
    return (void *)swift_release(a5);
  }
  return result;
}

unint64_t sub_100005B84()
{
  unint64_t result;

  result = qword_1000328B0;
  if (!qword_1000328B0)
  {
    result = swift_getWitnessTable(&unk_100022E50, &type metadata for ButtonBarView);
    atomic_store(result, (unint64_t *)&qword_1000328B0);
  }
  return result;
}

void sub_100005BD0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(id *)(a1 + 8);
  v4 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_100005C14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 16);
  v8 = v2;
  sub_100003AF0(v3, v4);
  swift_retain(v6);
  v9 = v5;
  return a1;
}

uint64_t sub_100005C78(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_100005CA0(uint64_t a1)
{

  return a1;
}

uint64_t sub_100005CD0()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100005CF4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005D34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000383C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005D78()
{
  return sub_100005E44(&qword_100032938, &qword_100032940, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

unint64_t sub_100005DA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032948;
  if (!qword_100032948)
  {
    v1 = sub_100003908(&qword_1000328E8);
    sub_100005E44(&qword_100032950, &qword_1000328E0, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_100005E44(&qword_100032958, &qword_100032900, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032948);
  }
  return result;
}

uint64_t sub_100005E44(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003908(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for CameraSpinnerView(uint64_t a1)
{
  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_release(*(_QWORD *)(a1 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CameraSpinnerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_retain(v6);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t assignWithCopy for CameraSpinnerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  swift_retain(v9);
  swift_release(v8);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CameraSpinnerView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CameraSpinnerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_release(v8);
  v9 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraSpinnerView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraSpinnerView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraSpinnerView()
{
  return &type metadata for CameraSpinnerView;
}

uint64_t sub_100006108(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024B24, 1);
}

void *sub_100006118@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
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
  _QWORD __src[41];
  _BYTE v18[344];
  _BYTE v19[360];
  uint64_t v20;
  uint64_t v21;
  char v22;
  _BYTE v23[343];
  _BYTE v24[353];

  v3 = *(_QWORD *)v1;
  v4 = *(_BYTE *)(v1 + 8);
  sub_100003AF0(*(_QWORD *)v1, v4);
  v5 = sub_100008D3C(v3, v4);
  v6 = sub_100003B28(v3, v4);
  if ((v5 & 1) != 0)
  {
    v8 = static HorizontalAlignment.center.getter(v6);
    v9 = static Alignment.center.getter(v8);
    v11 = v10;
    sub_1000063F0((uint64_t *)v1, (uint64_t)&v23[23]);
    v18[0] = 1;
    v20 = v8;
    v21 = 0;
    v22 = 1;
    *(_QWORD *)&v23[7] = v9;
    *(_QWORD *)&v23[15] = v11;
    sub_10000699C((uint64_t)&v20);
  }
  else
  {
    v7 = static VerticalAlignment.center.getter(v6);
    sub_1000062C4((uint64_t *)v1, __src);
    v18[336] = 1;
    memcpy(&v18[7], __src, 0x148uLL);
    v20 = v7;
    v21 = 0;
    v22 = 1;
    memcpy(v23, v18, 0x14FuLL);
    sub_1000069A8((uint64_t)&v20);
  }
  sub_100005D34((uint64_t)&v20, (uint64_t)v19, &qword_100032960);
  v12 = sub_10000383C(&qword_100032968);
  v13 = sub_10000383C(&qword_100032970);
  v14 = sub_100005E44(&qword_100032978, &qword_100032968, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v15 = sub_100005E44(&qword_100032980, &qword_100032970, (uint64_t)&protocol conformance descriptor for VStack<A>);
  _ConditionalContent<>.init(storage:)(v19, v12, v13, v14, v15);
  return memcpy(a1, v24, 0x161uLL);
}

_QWORD *sub_1000062C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v16[37];
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[280];
  _BYTE __src[280];

  v4 = static Alignment.center.getter(a1);
  v6 = v5;
  sub_1000063F0(a1, (uint64_t)__src);
  v7 = a1[5];
  if (v7)
  {
    v17 = a1[4];
    v18 = v7;
    v8 = sub_100006B7C();
    swift_bridgeObjectRetain(v7);
    v9 = Text.init<A>(_:)(&v17, &type metadata for String, v8);
    v7 = v10;
    v12 = v11;
    v14 = v13 & 1;
  }
  else
  {
    v9 = 0;
    v14 = 0;
    v12 = 0;
  }
  v16[0] = v4;
  v16[1] = v6;
  memcpy(&v16[2], __src, 0x118uLL);
  memcpy(a2, v16, 0x128uLL);
  a2[37] = v9;
  a2[38] = v7;
  a2[39] = v14;
  a2[40] = v12;
  sub_1000069B0(v16);
  sub_100006A54(v9, v7, v14, v12);
  sub_100006A94(v9, v7, v14, v12);
  v17 = v4;
  v18 = v6;
  memcpy(v19, __src, sizeof(v19));
  return sub_100006AD4(&v17);
}

uint64_t sub_1000063F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, _QWORD, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  char v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t KeyPath;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t *v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  char v84;
  __int128 v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t (*v103)();
  _OWORD *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[5];
  uint64_t v108;
  unsigned __int8 v109;
  uint64_t v110;
  unsigned __int8 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned int v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE v126[16];
  uint64_t v127;
  char v128;
  __int128 v129;

  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v107, 0, 0, _swiftEmptyArrayStorage, 5.0, 10.0, 0.0);
  v67 = v107[3];
  v68 = v107[4];
  v69 = v107[2];
  v8 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v58 = a1 + 4;
  v66 = a2 + 104;
  v9 = v107[0];
  v10 = v107[1];
  v8(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  v65 = Color.init(_:red:green:blue:opacity:)(v7, 0.8, 0.8, 0.8, 1.0);
  v11 = static Alignment.center.getter(v65);
  _FrameLayout.init(width:height:alignment:)(&v108, 0x402C000000000000, 0, 0x402C000000000000, 0, v11, v12);
  v63 = v110;
  v64 = v108;
  v59 = v111;
  v60 = v109;
  v61 = v113;
  v62 = v112;
  v13 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(&v114, 0, 0, _swiftEmptyArrayStorage, 5.0, 10.0, 0.0);
  v14 = v114;
  v56 = v116;
  v57 = v115;
  v15 = v117;
  v55 = v118;
  v16 = v119;
  v54 = static Color.blue.getter(v13);
  KeyPath = swift_getKeyPath(&unk_100022D88);
  v17 = static Alignment.center.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v120, 0x402C000000000000, 0, 0x402C000000000000, 0, v17, v18);
  v19 = v120;
  v20 = v121;
  v21 = v122;
  v22 = v123;
  v23 = v124;
  v24 = v125;
  v129 = *((_OWORD *)a1 + 1);
  v85 = *((_OWORD *)a1 + 1);
  sub_10000383C(&qword_100032990);
  v25 = State.wrappedValue.getter(&v72);
  if ((_BYTE)v72)
    v26 = -6.28318531;
  else
    v26 = 0.0;
  v27 = static UnitPoint.center.getter(v25);
  v29 = v28;
  v71 = v20;
  v70 = v22;
  v127 = *a1;
  v128 = *((_BYTE *)a1 + 8);
  sub_100005D34((uint64_t)v58, (uint64_t)v126, &qword_100032998);
  v30 = (_OWORD *)swift_allocObject(&unk_10002D688, 64, 7);
  v31 = *((_OWORD *)a1 + 1);
  v30[1] = *(_OWORD *)a1;
  v30[2] = v31;
  v30[3] = *((_OWORD *)a1 + 2);
  v32 = v71;
  v33 = v70;
  v72 = xmmword_100022D10;
  *(_QWORD *)&v73 = v14;
  v35 = v56;
  v34 = v57;
  *((_QWORD *)&v73 + 1) = __PAIR64__(v56, v57);
  *(_QWORD *)&v74 = v15;
  v36 = v54;
  v37 = v55;
  *((_QWORD *)&v74 + 1) = v55;
  *(_QWORD *)&v75 = v16;
  v38 = KeyPath;
  *((_QWORD *)&v75 + 1) = KeyPath;
  *(_QWORD *)&v76 = v54;
  *((_QWORD *)&v76 + 1) = v19;
  LOBYTE(v77) = v71;
  *((_QWORD *)&v77 + 1) = v21;
  LOBYTE(v78) = v70;
  *((_QWORD *)&v78 + 1) = v23;
  *(_QWORD *)&v79 = v24;
  *((double *)&v79 + 1) = v26;
  *(double *)&v80 = v27;
  *((_QWORD *)&v80 + 1) = v29;
  *(_QWORD *)&v81 = sub_100006C00;
  *((_QWORD *)&v81 + 1) = v30;
  v82 = 0uLL;
  v84 = v60;
  v83 = v59;
  v39 = v76;
  v40 = v77;
  v41 = v79;
  *(_OWORD *)(a2 + 200) = v78;
  *(_OWORD *)(a2 + 184) = v40;
  *(_OWORD *)(a2 + 168) = v39;
  v42 = v74;
  *(_OWORD *)(a2 + 152) = v75;
  v43 = v81;
  v44 = v67;
  *(_OWORD *)(v66 + 160) = v82;
  v45 = v80;
  *(_OWORD *)(a2 + 248) = v43;
  *(_OWORD *)(a2 + 232) = v45;
  *(_OWORD *)(a2 + 216) = v41;
  v46 = v72;
  v47 = v73;
  *(_OWORD *)(a2 + 136) = v42;
  *(_OWORD *)(a2 + 120) = v47;
  *(_OWORD *)(a2 + 104) = v46;
  v48 = v84;
  v49 = v83;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v69;
  *(_QWORD *)(a2 + 24) = v44;
  *(_QWORD *)(a2 + 32) = v68;
  v50 = v65;
  *(_QWORD *)(a2 + 40) = v65;
  *(_WORD *)(a2 + 48) = 256;
  *(_QWORD *)(a2 + 56) = v64;
  *(_BYTE *)(a2 + 64) = v48;
  *(_QWORD *)(a2 + 72) = v63;
  *(_BYTE *)(a2 + 80) = v49;
  *(_QWORD *)(a2 + 88) = v62;
  *(_QWORD *)(a2 + 96) = v61;
  v85 = xmmword_100022D10;
  v86 = v14;
  v87 = v34;
  v88 = v35;
  v89 = v15;
  v90 = v37;
  v91 = v16;
  v92 = v38;
  v93 = v36;
  v94 = v19;
  v95 = v32;
  v96 = v21;
  v97 = v33;
  v98 = v23;
  v99 = v24;
  v100 = v26;
  v101 = v27;
  v102 = v29;
  v103 = sub_100006C00;
  v104 = v30;
  v105 = 0;
  v106 = 0;
  swift_bridgeObjectRetain(v44);
  swift_retain(v50);
  sub_100006C08(&v72);
  sub_100006C7C((uint64_t)&v127);
  sub_100006CA8((uint64_t)&v129);
  sub_100006CD0((uint64_t)v126);
  sub_100006CF8(&v85);
  swift_release(v50);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100006838(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];

  v2 = static Animation.linear(duration:)(1.0);
  v3 = Animation.repeatForever(autoreverses:)(0, v2);
  swift_release(v2);
  v5[2] = a1;
  withAnimation<A>(_:_:)(v3, sub_100006D70, v5, (char *)&type metadata for () + 8);
  return swift_release(v3);
}

uint64_t sub_1000068B8(uint64_t a1)
{
  uint64_t v1;
  BOOL v3;
  __int128 v4;
  char v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(a1 + 16);
  sub_100005D34((uint64_t)&v6 + 8, (uint64_t)&v7, &qword_1000329A0);
  sub_100006D88(&v7);
  v1 = sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v5);
  v4 = v6;
  v3 = (v5 & 1) == 0;
  State.wrappedValue.setter(&v3, v1);
  return sub_100006DB0((uint64_t)&v6);
}

void *sub_100006964@<X0>(void *a1@<X8>)
{
  return sub_100006118(a1);
}

uint64_t sub_10000699C(uint64_t result)
{
  *(_BYTE *)(result + 352) = 1;
  return result;
}

uint64_t sub_1000069A8(uint64_t result)
{
  *(_BYTE *)(result + 352) = 0;
  return result;
}

_QWORD *sub_1000069B0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[5];
  v3 = a1[7];
  v4 = a1[20];
  v5 = a1[22];
  v6 = a1[33];
  v7 = a1[34];
  v8 = a1[35];
  v9 = a1[36];
  swift_retain(a1[23]);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_bridgeObjectRetain(v4);
  swift_retain(v5);
  sub_100006A44(v6, v7);
  sub_100006A44(v8, v9);
  return a1;
}

uint64_t sub_100006A44(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100006A54(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006A84(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_100006A84(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100006A94(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006AC4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006AC4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

_QWORD *sub_100006AD4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[7];
  v3 = a1[23];
  v4 = a1[33];
  v5 = a1[34];
  v6 = a1[35];
  v7 = a1[36];
  swift_release(a1[22]);
  swift_bridgeObjectRelease();
  swift_release(v2);
  swift_bridgeObjectRelease();
  swift_release(v3);
  sub_100006B6C(v4, v5);
  sub_100006B6C(v6, v7);
  return a1;
}

uint64_t sub_100006B6C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

unint64_t sub_100006B7C()
{
  unint64_t result;

  result = qword_100032988;
  if (!qword_100032988)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100032988);
  }
  return result;
}

uint64_t sub_100006BC8()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease();
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100006C00()
{
  uint64_t v0;

  return sub_100006838(v0 + 16);
}

_QWORD *sub_100006C08(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5];
  v3 = a1[7];
  v4 = a1[18];
  v5 = a1[19];
  v6 = a1[20];
  v7 = a1[21];
  swift_retain(a1[8]);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  sub_100006A44(v4, v5);
  sub_100006A44(v6, v7);
  return a1;
}

uint64_t sub_100006C7C(uint64_t a1)
{
  sub_100003AF0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_100006CA8(uint64_t a1)
{
  swift_retain(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_100006CD0(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

_QWORD *sub_100006CF8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[8];
  v3 = a1[18];
  v4 = a1[19];
  v5 = a1[20];
  v6 = a1[21];
  swift_release(a1[7]);
  swift_bridgeObjectRelease();
  swift_release(v2);
  sub_100006B6C(v3, v4);
  sub_100006B6C(v5, v6);
  return a1;
}

uint64_t sub_100006D70()
{
  uint64_t v0;

  return sub_1000068B8(*(_QWORD *)(v0 + 16));
}

_QWORD *sub_100006D88(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_100006DB0(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_100006DDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000329A8;
  if (!qword_1000329A8)
  {
    v1 = sub_100003908(&qword_1000329B0);
    sub_100005E44(&qword_100032978, &qword_100032968, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_100005E44(&qword_100032980, &qword_100032970, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000329A8);
  }
  return result;
}

char *sub_100006E78(void *a1, char a2)
{
  void *v2;
  id v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  void *v11;
  objc_class *v12;
  _BYTE *v13;
  char *v14;
  id v15;
  id v16;
  objc_super v18;
  objc_super v19;

  v5 = objc_allocWithZone((Class)UIWindow);
  v6 = v2;
  v7 = objc_msgSend(v5, "initWithWindowScene:", a1);
  v8 = OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window] = v7;
  objc_msgSend(v7, "setAutoresizesSubviews:", 1);
  objc_msgSend(*(id *)&v6[v8], "setHidden:", 0);
  v9 = *(id *)&v6[v8];
  objc_msgSend(v9, "makeKeyAndVisible");

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for CameraWindowManager();
  v10 = (char *)objc_msgSendSuper2(&v19, "init");
  v11 = *(void **)&v10[OBJC_IVAR____TtC9CarCamera19CameraWindowManager_window];
  v12 = (objc_class *)type metadata accessor for CameraViewController();
  v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC9CarCamera20CameraViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  v14 = v10;
  v15 = v11;
  v16 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v15, "setRootViewController:", v16, v18.receiver, v18.super_class);

  return v14;
}

id sub_100006FF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraWindowManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CameraWindowManager()
{
  return objc_opt_self(_TtC9CarCamera19CameraWindowManager);
}

uint64_t getEnumTagSinglePayload for CameraPresentationMode(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = v6 - 2;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1000070A4 + 4 * byte_100022DC0[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for CameraPresentationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_10000714C + 4 * byte_100022DCA[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100007180 + 4 * byte_100022DC5[v5]))();
}

uint64_t sub_100007180(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007190);
  return result;
}

uint64_t sub_10000719C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000071A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1000071A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000071B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000071BC(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *sub_1000071D0(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for CameraPresentationMode()
{
  return &type metadata for CameraPresentationMode;
}

void sub_100007270(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *oslog;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a1;
    v7 = objc_msgSend(v5, "_FBSScene");
    v8 = objc_msgSend(v7, "settings");

    v9 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    v10 = swift_dynamicCastObjCClass(v8, v9);

    if (v10)
      v11 = OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager;
    else
      v11 = OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager;
    oslog = *(NSObject **)(v1 + v11);
    *(_QWORD *)(v1 + v11) = 0;

  }
  else
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_100007524(v12, (uint64_t)qword_1000350A8);
    oslog = Logger.logObject.getter(v13);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "[CameraSceneDelegate] Received an unknown scene, ignoring.", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }
  }

}

id sub_10000749C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CameraSceneDelegate()
{
  return objc_opt_self(_TtC9CarCamera19CameraSceneDelegate);
}

uint64_t sub_100007524(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_10000753C(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint8_t *v47;
  char v48;
  id v49;
  id v50;
  char *v51;
  void *v52;
  double v53;
  NSObject *oslog;
  os_log_t osloga;
  id v56;
  uint64_t v57;

  v3 = v2;
  v6 = objc_msgSend(a2, "role");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene(v7);

  v8 = objc_opt_self(UIWindowScene);
  v9 = swift_dynamicCastObjCClass(a1, v8);
  if (!v9)
    goto LABEL_8;
  v10 = (void *)v9;
  v11 = a1;
  v12 = objc_msgSend(a2, "role");
  v13 = _UIWindowSceneSessionRoleCarPlay;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  if (v14 == v17 && v16 == v18)
  {

    swift_bridgeObjectRelease_n(v16, 2);
  }
  else
  {
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, v17);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {

LABEL_8:
      if (qword_100032738 != -1)
        swift_once(&qword_100032738, sub_100007E68);
      v21 = type metadata accessor for Logger(0);
      v22 = sub_100007524(v21, (uint64_t)qword_1000350A8);
      oslog = Logger.logObject.getter(v22);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v23, "[CameraSceneDelegate] Received an unknown scene, ignoring.", v24, 2u);
        swift_slowDealloc(v24, -1, -1);
      }
      goto LABEL_15;
    }
  }
  v25 = objc_msgSend(v10, "_FBSScene");
  v26 = objc_msgSend(v25, "settings");

  v27 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v28 = swift_dynamicCastObjCClass(v26, v27);

  if (v28)
  {
    v29 = objc_allocWithZone((Class)type metadata accessor for CameraWindowManager());
    v30 = v11;
    v31 = sub_100006E78(v10, 2);
    oslog = *(NSObject **)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager) = v31;

LABEL_15:
    return;
  }
  v32 = objc_msgSend(v10, "_FBSScene");
  v33 = objc_msgSend(v32, "settings");

  v57 = (uint64_t)v33;
  v34 = sub_100007A38();
  v35 = sub_10000383C((uint64_t *)&unk_100032A90);
  if ((swift_dynamicCast(&v56, &v57, v34, v35, 6) & 1) != 0)
  {

    objc_msgSend(v10, "_safeAreaInsetsForInterfaceOrientation:", 1);
    if (qword_100032738 != -1)
    {
      *(double *)&osloga = v36;
      v53 = v37;
      swift_once(&qword_100032738, sub_100007E68);
      v37 = v53;
      v36 = *(double *)&osloga;
    }
    v38 = v36 + v37;
    v39 = type metadata accessor for Logger(0);
    v40 = sub_100007524(v39, (uint64_t)qword_1000350A8);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = swift_slowAlloc(32, -1);
      v57 = v44;
      *(_DWORD *)v43 = 136315138;
      LOBYTE(v56) = v38 != 0.0;
      v45 = String.init<A>(describing:)(&v56, &type metadata for LayoutConfig);
      v56 = (id)sub_10000934C(v45, v46, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "[CameraSceneDelegate] received UICarPlayApplicationSceneSettings - orientation %s", v43, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      v47 = v43;
      v48 = v38 != 0.0;
      swift_slowDealloc(v47, -1, -1);
    }
    else
    {
      v48 = v38 != 0.0;
    }

    v49 = objc_allocWithZone((Class)type metadata accessor for CameraWindowManager());
    v50 = v11;
    v51 = sub_100006E78(v10, v48);
    v52 = *(void **)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager) = v51;

  }
  else
  {

  }
}

unint64_t sub_100007A38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032A88;
  if (!qword_100032A88)
  {
    v1 = objc_opt_self(FBSSceneSettings);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100032A88);
  }
  return result;
}

id sub_100007B54()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraAppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for CameraAppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease();
  exit((int)v8);
}

uint64_t type metadata accessor for CameraAppDelegate()
{
  return objc_opt_self(_TtC9CarCamera17CameraAppDelegate);
}

unint64_t sub_100007C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032BF0;
  if (!qword_100032BF0)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_100022934, v1);
    atomic_store(result, (unint64_t *)&qword_100032BF0);
  }
  return result;
}

void sub_100007C78()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = objc_msgSend(v0, "bundleIdentifier");

  if (v1)
  {
    v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v4 = v3;

    qword_100035088 = v2;
    unk_100035090 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100007D00(uint64_t a1)
{
  return sub_100007DD0(a1, 0x72656D6143726143, 0xEF73746E65764561, &static OS_os_log.carevents);
}

uint64_t *OS_os_log.carevents.unsafeMutableAddressor()
{
  if (qword_100032728 != -1)
    swift_once(&qword_100032728, sub_100007D00);
  return &static OS_os_log.carevents;
}

id static OS_os_log.carevents.getter()
{
  if (qword_100032728 != -1)
    swift_once(&qword_100032728, sub_100007D00);
  return (id)static OS_os_log.carevents;
}

uint64_t sub_100007DAC(uint64_t a1)
{
  return sub_100007DD0(a1, 0xD000000000000012, 0x8000000100023F00, &qword_1000350A0);
}

uint64_t sub_100007DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_100007F78();
  if (qword_100032720 != -1)
    swift_once(&qword_100032720, sub_100007C78);
  v7 = qword_100035088;
  v8 = unk_100035090;
  swift_bridgeObjectRetain(unk_100035090);
  result = OS_os_log.init(subsystem:category:)(v7, v8, a2, a3);
  *a4 = result;
  return result;
}

uint64_t sub_100007E68(uint64_t a1)
{
  return sub_100007EB0(a1, qword_1000350A8, &qword_100032728, (id *)&static OS_os_log.carevents, (uint64_t)sub_100007D00);
}

uint64_t sub_100007E8C(uint64_t a1)
{
  return sub_100007EB0(a1, qword_1000350C0, &qword_100032730, (id *)&qword_1000350A0, (uint64_t)sub_100007DAC);
}

uint64_t sub_100007EB0(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4, uint64_t a5)
{
  uint64_t v9;

  v9 = type metadata accessor for Logger(0);
  sub_100007F38(v9, a2);
  sub_100007524(v9, (uint64_t)a2);
  if (*a3 != -1)
    swift_once(a3, a5);
  return Logger.init(_:)(*a4);
}

uint64_t *sub_100007F38(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100007F78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C00;
  if (!qword_100032C00)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100032C00);
  }
  return result;
}

uint64_t destroy for ButtonBarView(uint64_t a1)
{

  sub_100003B28(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  return swift_release(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for ButtonBarView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = v4;
  sub_100003AF0(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  v9 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v9;
  swift_retain(v9);
  return a1;
}

uint64_t assignWithCopy for ButtonBarView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a2 + 24);
  sub_100003AF0(v7, v8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  sub_100003B28(v9, v10);
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v11;
  swift_retain(v11);
  swift_release(v12);
  return a1;
}

__n128 initializeWithTake for ButtonBarView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ButtonBarView(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = v5;
  sub_100003B28(v6, v7);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarView()
{
  return &type metadata for ButtonBarView;
}

uint64_t sub_1000081E4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024CA0, 1);
}

uint64_t sub_1000081F4@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t WitnessTable;
  _QWORD *v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id v66[3];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;

  v2 = v1;
  v57 = a1;
  v51 = type metadata accessor for TapGesture(0);
  v52 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v47 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_10000383C(&qword_100032C08);
  v56 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v49 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_10000383C(&qword_100032C10);
  v53 = *(_QWORD *)(v54 - 8);
  __chkstk_darwin(v54);
  v50 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = *((_QWORD *)v1 + 4);
  sub_100008C54(v48 + 32, (uint64_t)v58);
  v6 = v60;
  v7 = v61;
  sub_100008C98(v58, v60);
  v8 = type metadata accessor for ModifiedContent(0, v6, &type metadata for _AllowsHitTestingModifier);
  v67 = v8;
  v9 = sub_100008CBC();
  v64 = v7;
  v65 = v9;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v8);
  v68 = WitnessTable;
  v11 = sub_100008D00(v66);
  v12 = View.allowsHitTesting(_:)(1, v6, v7);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v47 - v14;
  (*(void (**)(char *, _QWORD *, uint64_t, __n128))(v16 + 16))((char *)&v47 - v14, v11, v8, v13);
  v17 = AnyView.init<A>(_:)(v15, v8, WitnessTable);
  v18 = *((_QWORD *)v2 + 2);
  v19 = *((_BYTE *)v2 + 24);
  sub_100003AF0(v18, v19);
  LOBYTE(v8) = sub_100008D3C(v18, v19);
  sub_100003B28(v18, v19);
  sub_100003AF0(v18, v19);
  v20 = sub_100008D3C(v18, v19);
  v21 = sub_100003B28(v18, v19);
  if ((v8 & 1) != 0)
    v22 = 0x403C000000000000;
  else
    v22 = 0x4040000000000000;
  if ((v20 & 1) != 0)
    v23 = 0x403C000000000000;
  else
    v23 = 0x4040000000000000;
  v24 = static Alignment.center.getter(v21);
  _FrameLayout.init(width:height:alignment:)(&v69, v22, 0, v23, 0, v24, v25);
  v26 = v69;
  v27 = v70;
  v28 = v71;
  v29 = v72;
  v30 = v73;
  v31 = v74;
  sub_10000998C(v66);
  sub_10000998C(v58);
  v58[0] = v17;
  v58[1] = v26;
  v59 = v27;
  v60 = v28;
  LOBYTE(v61) = v29;
  v62 = v30;
  v63 = v31;
  v32 = v47;
  TapGesture.init(count:)(1);
  *(_OWORD *)v66 = *v2;
  v33 = swift_allocObject(&unk_10002D808, 56, 7);
  v34 = v2[1];
  *(_OWORD *)(v33 + 16) = *v2;
  *(_OWORD *)(v33 + 32) = v34;
  *(_QWORD *)(v33 + 48) = *((_QWORD *)v2 + 4);
  v35 = swift_allocObject(&unk_10002D830, 32, 7);
  *(_QWORD *)(v35 + 16) = sub_100008F3C;
  *(_QWORD *)(v35 + 24) = v33;
  sub_100003AF0(v18, v19);
  sub_100008F88(v66);
  swift_retain(v48);
  v36 = v49;
  v37 = v51;
  Gesture.onEnded(_:)(sub_100008F68, v35, v51, &protocol witness table for TapGesture);
  swift_release(v35);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v32, v37);
  v39 = static GestureMask.all.getter(v38);
  v40 = sub_10000383C(&qword_100032C20);
  v41 = sub_100008FB0();
  v42 = sub_100009014();
  v43 = v50;
  v44 = v39;
  v45 = v55;
  View.simultaneousGesture<A>(_:including:)(v36, v44, v40, v55, v41, v42);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v36, v45);
  swift_release(v58[0]);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v53 + 32))(v57, v43, v54);
}

uint64_t sub_100008648(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];

  v3[2] = a1;
  v1 = static Animation.default.getter();
  withAnimation<A>(_:_:)(v1, sub_100009060, v3, (char *)&type metadata for () + 8);
  return swift_release(v1);
}

uint64_t sub_1000086A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (*a1)
  {
    v1 = *(_QWORD *)(*a1 + OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController);
    v2 = swift_retain(v1);
    sub_100008728(v2);
    return swift_release(v1);
  }
  else
  {
    v4 = a1[1];
    v5 = type metadata accessor for CameraModel(0);
    v6 = sub_100009078();
    result = EnvironmentObject.error()(0, v4, v5, v6);
    __break(1u);
  }
  return result;
}

void sub_100008728(uint64_t a1)
{
  __int128 *v1;
  Swift::String *v2;
  void (*object)(Swift::String *);
  uint64_t countAndFlagsBits;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;

  v2 = (Swift::String *)*((_QWORD *)v1 + 4);
  object = (void (*)(Swift::String *))v2[5]._object;
  if (object)
  {
    countAndFlagsBits = v2[6]._countAndFlagsBits;
    v6 = qword_100032740;
    swift_retain(countAndFlagsBits);
    if (v6 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v7 = type metadata accessor for Logger(0);
    sub_100007524(v7, (uint64_t)qword_1000350C0);
    v26 = *v1;
    v24 = *((_QWORD *)v1 + 2);
    v25 = *((_BYTE *)v1 + 24);
    sub_100008F88((id *)&v26);
    sub_100006C7C((uint64_t)&v24);
    swift_retain(v2);
    sub_100008F88((id *)&v26);
    sub_100006C7C((uint64_t)&v24);
    v8 = swift_retain(v2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      *(_DWORD *)v11 = 136315138;
      v23 = v12;
      swift_retain(v2);
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      v21 = 0xD000000000000012;
      v22 = 0x8000000100023F20;
      String.append(_:)(v2[1]);
      v13._countAndFlagsBits = 62;
      v13._object = (void *)0xE100000000000000;
      String.append(_:)(v13);
      swift_release(v2);
      v21 = sub_10000934C(0xD000000000000012, 0x8000000100023F20, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v11 + 4, v11 + 12);
      swift_bridgeObjectRelease();
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[ButtonBarView] performing action [%s]", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);

      swift_release(v2);
    }
    object(v2);
    if (a1)
    {
      swift_retain(a1);
      sub_10001C9D0(v2);
      swift_release(a1);
    }
    sub_100006B6C((uint64_t)object, countAndFlagsBits);
  }
  else
  {
    if (qword_100032740 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v14 = type metadata accessor for Logger(0);
    sub_100007524(v14, (uint64_t)qword_1000350C0);
    v26 = *v1;
    v24 = *((_QWORD *)v1 + 2);
    v25 = *((_BYTE *)v1 + 24);
    swift_retain(v2);
    sub_100008F88((id *)&v26);
    sub_100006C7C((uint64_t)&v24);
    swift_retain(v2);
    sub_100008F88((id *)&v26);
    v15 = sub_100006C7C((uint64_t)&v24);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      *(_DWORD *)v18 = 136315138;
      v23 = v19;
      swift_retain(v2);
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      v21 = 0xD000000000000012;
      v22 = 0x8000000100023F20;
      String.append(_:)(v2[1]);
      v20._countAndFlagsBits = 62;
      v20._object = (void *)0xE100000000000000;
      String.append(_:)(v20);
      swift_release(v2);
      v21 = sub_10000934C(0xD000000000000012, 0x8000000100023F20, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease();
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[ButtonBarView ] performing action false ❌ [%s]", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);

    }
    else
    {
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);
      swift_release(v2);
      sub_1000090C0((id *)&v26);
      sub_1000090E8((uint64_t)&v24);

      swift_release(v2);
    }
  }
}

uint64_t sub_100008C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_100008C98(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008CBC()
{
  unint64_t result;

  result = qword_100032C18;
  if (!qword_100032C18)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AllowsHitTestingModifier, &type metadata for _AllowsHitTestingModifier);
    atomic_store(result, (unint64_t *)&qword_100032C18);
  }
  return result;
}

_QWORD *sub_100008D00(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100008D3C(uint64_t a1, char a2)
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
    v15 = sub_10000934C(0x6F4374756F79614CLL, 0xEC0000006769666ELL, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(&v16, v7, a1);
  sub_100003B28(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100008F04()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100008F3C()
{
  uint64_t v0;

  return sub_100008648(v0 + 16);
}

uint64_t sub_100008F44()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008F68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id *sub_100008F88(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

unint64_t sub_100008FB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C28;
  if (!qword_100032C28)
  {
    v1 = sub_100003908(&qword_100032C20);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032C28);
  }
  return result;
}

unint64_t sub_100009014()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C30;
  if (!qword_100032C30)
  {
    v1 = sub_100003908(&qword_100032C08);
    result = swift_getWitnessTable(&protocol conformance descriptor for _EndedGesture<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100032C30);
  }
  return result;
}

uint64_t sub_100009060()
{
  uint64_t v0;

  return sub_1000086A4(*(_QWORD **)(v0 + 16));
}

unint64_t sub_100009078()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032810;
  if (!qword_100032810)
  {
    v1 = type metadata accessor for CameraModel(255);
    result = swift_getWitnessTable(&unk_100022F50, v1);
    atomic_store(result, (unint64_t *)&qword_100032810);
  }
  return result;
}

id *sub_1000090C0(id *a1)
{

  return a1;
}

uint64_t sub_1000090E8(uint64_t a1)
{
  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_100009114@<X0>(_QWORD *a1@<X8>)
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
  uint64_t EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000383C((uint64_t *)&unk_100032C40);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100009A5C(v2, (uint64_t)v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v10, v8);
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    v12 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, v10, v12);
  }
  else
  {
    v14 = *v10;
    v15 = static os_log_type_t.fault.getter(EnumCaseMultiPayload);
    v16 = static Log.runtimeIssuesLog.getter();
    v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      v23 = a1;
      v20 = v19;
      v25 = v19;
      *(_DWORD *)v18 = 136315138;
      v24 = sub_10000934C(0x686353726F6C6F43, 0xEB00000000656D65, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v18 + 4, v18 + 12);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      v21 = v20;
      a1 = v23;
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(a1, v7, v14);
    swift_release(v14);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000934C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000941C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000099AC((uint64_t)v12, *a3);
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
      sub_1000099AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000998C(v12);
  return v7;
}

uint64_t sub_10000941C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000095D4(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000095D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100009668(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100009840(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100009840(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100009668(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000097DC(v4, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000097DC(uint64_t a1, uint64_t a2)
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
    return _swiftEmptyArrayStorage;
  v4 = sub_10000383C(&qword_100032C38);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100009840(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000383C(&qword_100032C38);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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
    swift_bridgeObjectRelease();
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000998C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000099AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000099EC()
{
  _QWORD v1[4];

  v1[0] = sub_100003908(&qword_100032C20);
  v1[1] = sub_100003908(&qword_100032C08);
  v1[2] = sub_100008FB0();
  v1[3] = sub_100009014();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.simultaneousGesture<A>(_:including:)>>, 1);
}

uint64_t sub_100009A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000383C((uint64_t *)&unk_100032C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009AA4()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;

  KeyPath = swift_getKeyPath(&unk_100023018);
  v2 = swift_getKeyPath(&unk_100023040);
  static Published.subscript.getter(v0, KeyPath, v2);
  swift_release(KeyPath);
  return swift_release(v2);
}

uint64_t sub_100009B08()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022FD0);
  v2 = swift_getKeyPath(&unk_100022FF8);
  static Published.subscript.getter(v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100009B78()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022F88);
  v2 = swift_getKeyPath(&unk_100022FB0);
  static Published.subscript.getter(v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

unint64_t sub_100009BE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  unint64_t result;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000383C(&qword_100032EA8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(v1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(v1);
    return (unint64_t)v4;
  }
  v26 = v3 + 64;
  swift_retain(v3);
  v25 = v1;
  v6 = v1 + 64;
  while (1)
  {
    v27 = v5;
    v7 = *(_QWORD *)(v6 - 32);
    v8 = *(_QWORD *)(v6 - 24);
    v9 = *(void **)(v6 - 8);
    v11 = *(id *)v6;
    v10 = *(_QWORD *)(v6 + 8);
    v12 = *(_BYTE *)(v6 + 16);
    v13 = *(void **)(v6 + 24);
    v30 = *(_QWORD *)(v6 + 32);
    v31 = *(_QWORD *)(v6 - 16);
    v14 = *(_QWORD *)(v6 + 48);
    v28 = *(_BYTE *)(v6 + 56);
    v29 = *(_BYTE *)(v6 + 40);
    v15 = *(id *)v6;
    swift_bridgeObjectRetain(v8);
    v16 = v9;
    sub_100003AF0(v10, v12);
    swift_retain(v14);
    v17 = v13;
    result = sub_10000D748(v7, v8);
    if ((v19 & 1) != 0)
      break;
    *(_QWORD *)(v26 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v4[6] + 16 * result);
    *v20 = v7;
    v20[1] = v8;
    v21 = v4[7] + 80 * result;
    *(_QWORD *)v21 = v31;
    *(_QWORD *)(v21 + 8) = v16;
    *(_QWORD *)(v21 + 16) = v11;
    *(_QWORD *)(v21 + 24) = v10;
    *(_BYTE *)(v21 + 32) = v12;
    *(_QWORD *)(v21 + 40) = v13;
    *(_QWORD *)(v21 + 48) = v30;
    *(_BYTE *)(v21 + 56) = v29;
    *(_QWORD *)(v21 + 64) = v14;
    *(_BYTE *)(v21 + 72) = v28;
    v22 = v4[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v4[2] = v24;
    v6 += 96;
    v5 = v27 - 1;
    if (v27 == 1)
    {
      swift_release(v4);
      v1 = v25;
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100009D8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000383C(&qword_100032EA0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_10000D748(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_100009EA4(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  objc_super v56;
  _QWORD v57[3];

  v55 = a1;
  v2 = sub_10000383C(&qword_100032E80);
  v53 = *(_QWORD *)(v2 - 8);
  v54 = v2;
  __chkstk_darwin(v2);
  v52 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000383C(&qword_100032E88);
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000383C(&qword_100032E90);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000383C(&qword_100032E58);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v49 - v15;
  v17 = &v1[OBJC_IVAR____TtC9CarCamera11CameraModel__cameraCloseButton];
  v18 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  sub_10000EF8C((uint64_t)v16, (uint64_t)v14);
  v19 = v1;
  Published.init(initialValue:)(v14, v11);
  sub_10000EFD4((uint64_t)v16);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v17, v10, v7);
  v20 = &v19[OBJC_IVAR____TtC9CarCamera11CameraModel__visibleButtons];
  v57[0] = _swiftEmptyArrayStorage;
  v21 = sub_10000383C(&qword_1000328C8);
  Published.init(initialValue:)(v57, v21);
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v20, v6, v51);
  v22 = &v19[OBJC_IVAR____TtC9CarCamera11CameraModel__submenuParentIdentifier];
  v57[0] = 0;
  v57[1] = 0;
  v23 = sub_10000383C(&qword_100032998);
  v24 = v52;
  Published.init(initialValue:)(v57, v23);
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v22, v24, v54);
  *(_QWORD *)&v19[OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons] = _swiftEmptyArrayStorage;
  v25 = OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict;
  *(_QWORD *)&v19[v25] = sub_100009BE8((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)&v19[OBJC_IVAR____TtC9CarCamera11CameraModel_camera] = 0;
  v26 = OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict;
  *(_QWORD *)&v19[v26] = sub_100009D8C((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)&v19[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups] = _swiftEmptyArrayStorage;
  v19[OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost] = 0;
  v19[OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost] = 0;
  v27 = &v19[OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable];
  swift_beginAccess(&v19[OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable], v57, 33, 0);
  v28 = type metadata accessor for CAFCarObservable(0);
  v29 = sub_100005CF4(&qword_100032E98, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCarObservable, (uint64_t)&protocol conformance descriptor for CAFCarObservable);
  v30 = v55;
  *(_QWORD *)v27 = ObservedObject.init(wrappedValue:)(v30, v28, v29);
  *((_QWORD *)v27 + 1) = v31;
  swift_endAccess(v57);
  v32 = type metadata accessor for ButtonBarLayout(0);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  *(_QWORD *)&v19[OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController] = sub_10001E76C();

  v33 = (objc_class *)type metadata accessor for CameraModel(0);
  v56.receiver = v19;
  v56.super_class = v33;
  v34 = (char *)objc_msgSendSuper2(&v56, "init");
  v35 = *(_QWORD *)&v34[OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController];
  v36 = *(void **)(v35 + 24);
  *(_QWORD *)(v35 + 24) = v34;
  v37 = v34;
  swift_retain(v35);

  v38 = *(void **)(v35 + 24);
  if (v38)
  {
    v39 = v38;
    sub_10001B674((uint64_t)v39);
    swift_release(v35);

  }
  else
  {
    swift_release(v35);
    v39 = v37;
  }

  v40 = (void *)CAFCarObservable.observed.getter();
  objc_msgSend(v40, "registerObserver:", v37);

  v41 = (void *)dispatch thunk of CAFCarObservable.automakerExteriorCamera.getter();
  if (v41)
  {
    v42 = v41;
    sub_10000B358(v41);

  }
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v43 = type metadata accessor for Logger(0);
  v44 = sub_100007524(v43, (uint64_t)qword_1000350A8);
  v45 = Logger.logObject.getter(v44);
  v46 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "[CAMERAMODEL] CameraModel did init", v47, 2u);
    swift_slowDealloc(v47, -1, -1);
  }

  return v37;
}

uint64_t sub_10000A40C(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v29[15];
  char v30;
  _QWORD v31[2];

  v3 = v2;
  v5 = sub_10000383C(&qword_100032E58);
  __chkstk_darwin(v5);
  v7 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v10 = &v29[-v9];
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100007524(v11, (uint64_t)qword_1000350A8);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v15 = 67109120;
    LODWORD(v31[0]) = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, (char *)v31 + 4, v15 + 4, v15 + 8);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[CAMERAMODEL] CAFCameraGeneral didUpdateUserDismissible %{BOOL}d", v15, 8u);
    swift_slowDealloc(v15, -1, -1);
  }

  if ((a2 & 1) != 0)
  {
    v16 = sub_10000F854(0, &qword_100032ED8, CAFCameraGeneral_ptr);
    v17 = sub_10000F88C();
    v18 = CAFObserved<>.observable.getter(v16, v17);
    KeyPath = swift_getKeyPath(&unk_100023060);
    v20 = type metadata accessor for CAFCameraGeneralObservable(0);
    v21 = sub_100005CF4(&qword_100032EE8, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCameraGeneralObservable, (uint64_t)&protocol conformance descriptor for CAFCameraGeneralObservable);
    *(_QWORD *)v10 = ObservedObject.init(wrappedValue:)(v18, v20, v21);
    *((_QWORD *)v10 + 1) = v22;
    *((_QWORD *)v10 + 2) = KeyPath;
    v10[24] = 0;
    v30 = 0;
    State.init(wrappedValue:)(v31, &v30, &type metadata for Bool);
    v23 = v31[1];
    v10[32] = v31[0];
    *((_QWORD *)v10 + 5) = v23;
    v24 = (int *)type metadata accessor for CameraCloseButton(0);
    UUID.init()(v24);
    v10[v24[8]] = 0;
    v10[v24[9]] = 0;
    v10[v24[10]] = 0;
    (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(*((_QWORD *)v24 - 1) + 56))(v10, 0, 1, v24);
  }
  else
  {
    v25 = type metadata accessor for CameraCloseButton(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v10, 1, 1, v25);
  }
  v26 = swift_getKeyPath(&unk_100023018);
  v27 = swift_getKeyPath(&unk_100023040);
  sub_10000EF8C((uint64_t)v10, (uint64_t)v7);
  static Published.subscript.setter(v7, v3, v26, v27);
  return sub_10000EFD4((uint64_t)v10);
}

uint64_t sub_10000A81C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  if (a2)
  {
    v4 = qword_100032738;
    swift_bridgeObjectRetain(a2);
    if (v4 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v5 = type metadata accessor for Logger(0);
    sub_100007524(v5, (uint64_t)qword_1000350A8);
    v6 = a1;
    swift_bridgeObjectRetain(a2);
    v7 = v6;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc(22, -1);
      v11 = swift_slowAlloc(64, -1);
      v22 = v11;
      *(_DWORD *)v10 = 136315394;
      v12 = objc_msgSend(v7, "identifier");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v15 = v14;

      v21 = sub_10000934C(v13, v15, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v10 + 4, v10 + 12);

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      v16 = swift_bridgeObjectRetain(a2);
      v17 = Array.description.getter(v16, &type metadata for String);
      v19 = v18;
      swift_bridgeObjectRelease();
      v21 = sub_10000934C(v17, v19, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v10 + 14, v10 + 22);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERAMODEL] CAFCameraButtonObserver %s didUpdateChildrenIdentifiers %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy(v11, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
  return sub_10000AA88();
}

uint64_t sub_10000AA88()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  __int16 v44;
  _QWORD *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  _QWORD *v70;
  char v71[24];
  _QWORD *v72;
  _BYTE v73[80];
  _BYTE v74[80];
  _BYTE v75[80];
  _QWORD v76[4];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  char v87;
  __int128 v88;
  char v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  char v93[8];
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[2];

  v1 = v0;
  if (qword_100032738 != -1)
    goto LABEL_40;
  while (1)
  {
    v2 = type metadata accessor for Logger(0);
    v3 = sub_100007524(v2, (uint64_t)qword_1000350A8);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERAMODEL] updateArrangment", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }

    v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups);
    swift_beginAccess(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups, v71, 0, 0);
    v8 = *v7;
    if ((unint64_t)*v7 >> 62)
      break;
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v8);
    if (!v9)
      goto LABEL_45;
LABEL_6:
    v72 = _swiftEmptyArrayStorage;
    result = sub_10000ED10(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      return result;
    }
    v57 = v1;
    v11 = 0;
    v12 = v72;
    v61 = v8 & 0xC000000000000001;
    v59 = v8 + 32;
    v60 = v9;
    while (v11 != v9)
    {
      v62 = v12;
      v63 = v11;
      if (v61)
        v13 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      else
        v13 = (char *)*(id *)(v59 + 8 * v11);
      v1 = (unint64_t)v13;
      v14 = &v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
      sub_100013020(*(_QWORD *)&v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent], *(_QWORD *)&v13[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8], (uint64_t)v73);
      sub_10000F23C((uint64_t)v73, (uint64_t)&v95);
      if (*((_QWORD *)&v95 + 1)
        && (v96 = v95,
            sub_100005C78((uint64_t)&v96),
            v15 = sub_10000F284((uint64_t)v73),
            v16 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v15),
            sub_100005CA0((uint64_t)&v96),
            (v16 & 0x100) == 0)
        && (_BYTE)v16)
      {
        v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents);
        v18 = *(_QWORD *)(v17 + 16);
        if (v18)
        {
          v58 = v14;
          v19 = (unint64_t *)(swift_bridgeObjectRetain(v17) + 40);
          v70 = _swiftEmptyArrayStorage;
          v64 = v1;
          do
          {
            v21 = *(v19 - 1);
            v22 = *v19;
            swift_bridgeObjectRetain(*v19);
            sub_100013020(v21, v22, (uint64_t)v76);
            v24 = v76[0];
            v23 = v76[1];
            v25 = v76[2];
            v26 = v76[3];
            v27 = v77;
            v65 = v79;
            v66 = v78;
            v28 = v81;
            v68 = v80;
            v29 = v82;
            swift_bridgeObjectRelease();
            sub_10000F23C((uint64_t)v76, (uint64_t)v93);
            if (v94)
            {
              if ((swift_isUniquelyReferenced_nonNull_native(v70) & 1) != 0)
                v30 = v70;
              else
                v30 = sub_10000D520(0, v70[2] + 1, 1, v70);
              v32 = v30[2];
              v31 = v30[3];
              if (v32 >= v31 >> 1)
                v30 = sub_10000D520((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
              v30[2] = v32 + 1;
              v70 = v30;
              v20 = &v30[10 * v32];
              v20[4] = v24;
              v20[5] = v23;
              v20[6] = v25;
              v20[7] = v26;
              *((_BYTE *)v20 + 64) = v27 & 1;
              v20[9] = v66;
              v20[10] = v65;
              *((_BYTE *)v20 + 88) = v68 & 1;
              v20[12] = v28;
              *((_BYTE *)v20 + 104) = v29 & 1;
            }
            v19 += 2;
            --v18;
            v1 = v64;
          }
          while (v18);
          swift_bridgeObjectRelease();
          v14 = v58;
        }
        else
        {
          v70 = _swiftEmptyArrayStorage;
        }
        sub_100013020(*(_QWORD *)v14, *((_QWORD *)v14 + 1), (uint64_t)v75);
        result = sub_10000F23C((uint64_t)v75, (uint64_t)&v92);
        if (!*((_QWORD *)&v92 + 1))
          goto LABEL_51;
        v97[0] = v92;
        sub_100005C78((uint64_t)v97);
        v43 = sub_10000F284((uint64_t)v75);
        v44 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v43);
        result = sub_100005CA0((uint64_t)v97);
        if ((v44 & 0x100) != 0 || !(_BYTE)v44)
          goto LABEL_51;
        if (v70[2] < (unint64_t)v44)
          goto LABEL_39;
        v45 = &v70[10 * v44];
        v46 = (void *)*(v45 - 5);
        v67 = *(v45 - 6);
        v34 = (void *)*(v45 - 4);
        v35 = *(v45 - 3);
        v42 = *((_BYTE *)v45 - 16);
        v69 = *(_OWORD *)(v45 - 1);
        v41 = *((_BYTE *)v45 + 8);
        v38 = v45[2];
        v40 = *((_BYTE *)v45 + 24);
        v47 = v34;
        v33 = v46;
        sub_100003AF0(v35, v42);
        swift_retain(v38);
        v48 = (id)v69;

        swift_bridgeObjectRelease();
      }
      else
      {
        sub_100013020(*(_QWORD *)v14, *((_QWORD *)v14 + 1), (uint64_t)v74);
        result = sub_10000F23C((uint64_t)v74, (uint64_t)&v83);
        v33 = v84;
        if (!v84)
          goto LABEL_50;
        v67 = v83;
        v34 = v85;
        v35 = v86;
        v36 = v87;
        v69 = v88;
        v37 = v89;
        v38 = v90;
        v39 = v91;

        v40 = v39 & 1;
        v41 = v37 & 1;
        v42 = v36 & 1;
      }
      v12 = v62;
      v49 = v63;
      v72 = v62;
      v1 = v62[2];
      v50 = v62[3];
      if (v1 >= v50 >> 1)
      {
        sub_10000ED10(v50 > 1, v1 + 1, 1);
        v49 = v63;
        v12 = v72;
      }
      v11 = v49 + 1;
      v12[2] = v1 + 1;
      v51 = &v12[10 * v1];
      v51[4] = v67;
      v51[5] = v33;
      v51[6] = v34;
      v51[7] = v35;
      *((_BYTE *)v51 + 64) = v42;
      *(_OWORD *)(v51 + 9) = v69;
      *((_BYTE *)v51 + 88) = v41;
      v51[12] = v38;
      *((_BYTE *)v51 + 104) = v40;
      v9 = v60;
      if (v11 == v60)
      {
        swift_bridgeObjectRelease();
        v1 = v57;
        goto LABEL_46;
      }
    }
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once(&qword_100032738, sub_100007E68);
  }
  if (v8 < 0)
    v52 = *v7;
  else
    v52 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v9 = _CocoaArrayWrapper.endIndex.getter(v52);
  if (v9)
    goto LABEL_6;
LABEL_45:
  swift_bridgeObjectRelease();
  v12 = _swiftEmptyArrayStorage;
LABEL_46:
  v72 = v12;
  sub_10000C734(&v72);
  v53 = OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons;
  v54 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons);
  v55 = (uint64_t)v72;
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRetain(v55);
  v56 = sub_10000D2C4(v54, v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0)
    return swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v53) = v55;
  swift_bridgeObjectRelease();
  sub_10000C7A0();
  return sub_10000C5D0();
}

uint64_t sub_10000B100(void *a1, char a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350A8);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc(15, -1);
    v9 = swift_slowAlloc(32, -1);
    v16 = v9;
    *(_DWORD *)v8 = 136315394;
    v10 = objc_msgSend(v5, "identifier");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v15 = sub_10000934C(v11, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 256;
    LOBYTE(v15) = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, (char *)&v15 + 1, v8 + 14, v8 + 15);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[CAMERAMODEL] CAFCameraButtonObserver %s didUpdateSelectedEntryIndex %hhu", (uint8_t *)v8, 0xFu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  return sub_10000AA88();
}

void sub_10000B358(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  os_log_t oslog;
  NSObject *osloga;
  id v22;
  uint64_t v23;

  v2 = v1;
  v3 = OBJC_IVAR____TtC9CarCamera11CameraModel_camera;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera))
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v4 = type metadata accessor for Logger(0);
    v5 = sub_100007524(v4, (uint64_t)qword_1000350A8);
    osloga = Logger.logObject.getter(v5);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v6, "[CAMERAMODEL] already connected", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

  }
  else
  {
    v9 = OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost;
    if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedInstantOnSignpost) & 1) == 0)
    {
      CAFSignpostEmit_InstantOn();
      *(_BYTE *)(v2 + v9) = 1;
    }
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v10 = type metadata accessor for Logger(0);
    sub_100007524(v10, (uint64_t)qword_1000350A8);
    v11 = a1;
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      oslog = (os_log_t)swift_slowAlloc(8, -1);
      v22 = v11;
      *(_DWORD *)v14 = 138412290;
      v15 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v14 + 4, v14 + 12);
      oslog->isa = (Class)v11;

      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[CAMERAMODEL] connecting to %@", v14, 0xCu);
      v16 = sub_10000383C((uint64_t *)&unk_100032EF0);
      swift_arrayDestroy(oslog, 1, v16);
      swift_slowDealloc(oslog, -1, -1);
      swift_slowDealloc(v14, -1, -1);

    }
    else
    {

    }
    objc_msgSend(v11, "registerObserver:", v2, oslog, v22);
    v17 = objc_msgSend(v11, "cameraGeneral");
    objc_msgSend(v17, "registerObserver:", v2);

    v18 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v11;
    v19 = v11;

    sub_10000B644();
  }
}

void sub_10000B644()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t p_name;
  uint64_t v38;
  id v39;
  unsigned int v40;
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  _QWORD *v58;
  id v59;
  void *v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  uint64_t v98;
  _QWORD v99[2];
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  NSObject *v103;
  NSObject *v104;
  _QWORD *v105;
  NSObject *v106;
  _QWORD v107[3];
  _QWORD *v108;
  char v109[24];

  v2 = v0;
  v3 = sub_10000383C(&qword_100032E58);
  v4 = __chkstk_darwin(v3);
  v6 = (uint64_t)v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (uint64_t)v99 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)v99 - v10;
  v12 = *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
  if (!v12)
  {
    if (qword_100032738 != -1)
LABEL_55:
      swift_once(&qword_100032738, sub_100007E68);
    v19 = type metadata accessor for Logger(0);
    v20 = sub_100007524(v19, (uint64_t)qword_1000350A8);
    v104 = Logger.logObject.getter(v20);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v104, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v104, v21, "[CAMERAMODEL] update missing accessory", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }
LABEL_16:

    return;
  }
  v104 = v12;
  if (!-[NSObject receivedAllValues](v104, "receivedAllValues"))
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_100007524(v23, (uint64_t)qword_1000350A8);
    v103 = Logger.logObject.getter(v24);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v103, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, v25, "[CAMERAMODEL] camera has not receivedAllValues", v26, 2u);
      swift_slowDealloc(v26, -1, -1);

      return;
    }

    goto LABEL_16;
  }
  v13 = (char *)v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict;
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict, v109, 0, 0);
  if (*(_QWORD *)(*(_QWORD *)v13 + 16))
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_100007524(v14, (uint64_t)qword_1000350A8);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[CAMERAMODEL] already updated", v18, 2u);
      swift_slowDealloc(v18, -1, -1);

    }
    else
    {

    }
    return;
  }
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v27 = type metadata accessor for Logger(0);
  v28 = sub_100007524(v27, (uint64_t)qword_1000350A8);
  v29 = v104;
  v99[1] = v28;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  v104 = v30;
  v32 = os_log_type_enabled(v30, (os_log_type_t)v31);
  v100 = v29;
  if (!v32)
  {

    v104 = v29;
    goto LABEL_27;
  }
  LODWORD(v102) = v31;
  v103 = v2;
  v1 = swift_slowAlloc(22, -1);
  v33 = swift_slowAlloc(8, -1);
  *(_DWORD *)v1 = 138412546;
  v106 = v29;
  v34 = v29;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, v107, v1 + 4, v1 + 12);
  *(_QWORD *)v33 = v12;

  *(_WORD *)(v1 + 12) = 2048;
  v35 = objc_msgSend((id)v34, "cameraButtons");
  if (v35)
  {
    v36 = sub_10000F854(0, (unint64_t *)&qword_100032ED0, CAFCameraButton_ptr);
    p_name = static Array._unconditionallyBridgeFromObjectiveC(_:)(v35, v36);

    if ((unint64_t)p_name >> 62)
      goto LABEL_80;
    v35 = *(NSObject **)((p_name & 0xFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  while (1)
  {
    v2 = v103;
    v106 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, v107, v1 + 14, v1 + 22);

    _os_log_impl((void *)&_mh_execute_header, v104, (os_log_type_t)v102, "[CAMERAMODEL] updating %@ buttons.count=%ld", (uint8_t *)v1, 0x16u);
    v38 = sub_10000383C((uint64_t *)&unk_100032EF0);
    swift_arrayDestroy(v33, 1, v38);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v1, -1, -1);
    v29 = v100;
LABEL_27:

    p_name = (uint64_t)&stru_100030FF8.name;
    v39 = -[NSObject cameraGeneral](v29, "cameraGeneral");
    v40 = objc_msgSend(v39, "userDismissible");

    if (v40)
    {
      KeyPath = swift_getKeyPath(&unk_100023018);
      v42 = swift_getKeyPath(&unk_100023040);
      static Published.subscript.getter(v2, KeyPath, v42);
      swift_release(KeyPath);
      swift_release(v42);
      v1 = type metadata accessor for CameraCloseButton(0);
      v43 = *(_QWORD *)(v1 - 8);
      LODWORD(KeyPath) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48))(v11, 1, v1);
      sub_10000EFD4((uint64_t)v11);
      if ((_DWORD)KeyPath == 1)
      {
        v44 = -[NSObject cameraGeneral](v29, "cameraGeneral");
        v45 = sub_10000F854(0, &qword_100032ED8, CAFCameraGeneral_ptr);
        v46 = sub_10000F88C();
        v47 = CAFObserved<>.observable.getter(v45, v46);

        v48 = swift_getKeyPath(&unk_100023060);
        p_name = type metadata accessor for CAFCameraGeneralObservable(0);
        v49 = sub_100005CF4(&qword_100032EE8, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCameraGeneralObservable, (uint64_t)&protocol conformance descriptor for CAFCameraGeneralObservable);
        *(_QWORD *)v9 = ObservedObject.init(wrappedValue:)(v47, p_name, v49);
        *(_QWORD *)(v9 + 8) = v50;
        *(_QWORD *)(v9 + 16) = v48;
        *(_BYTE *)(v9 + 24) = 0;
        LOBYTE(v108) = 0;
        v51 = State.init(wrappedValue:)(&v106, &v108, &type metadata for Bool);
        v52 = v107[0];
        *(_BYTE *)(v9 + 32) = (_BYTE)v106;
        *(_QWORD *)(v9 + 40) = v52;
        UUID.init()(v51);
        *(_BYTE *)(v9 + *(int *)(v1 + 32)) = 0;
        *(_BYTE *)(v9 + *(int *)(v1 + 36)) = 0;
        *(_BYTE *)(v9 + *(int *)(v1 + 40)) = 0;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v9, 0, 1, v1);
        v53 = swift_getKeyPath(&unk_100023018);
        v54 = swift_getKeyPath(&unk_100023040);
        sub_10000EF8C(v9, v6);
        static Published.subscript.setter(v6, v2, v53, v54);
        sub_10000EFD4(v9);
      }
    }
    v108 = _swiftEmptyArrayStorage;
    v55 = -[NSObject cameraButtons](v29, "cameraButtons");
    v11 = (char *)v29;
    if (v55)
    {
      v56 = v55;
      v57 = sub_10000F854(0, (unint64_t *)&qword_100032ED0, CAFCameraButton_ptr);
      v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v56, v57);

      if (!((unint64_t)v6 >> 62))
      {
        p_name = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v6);
        if (p_name)
          goto LABEL_33;
        goto LABEL_60;
      }
      if (v6 < 0)
        v86 = v6;
      else
        v86 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(v6, 2);
      p_name = _CocoaArrayWrapper.endIndex.getter(v86);
      swift_bridgeObjectRelease();
      if (!p_name)
      {
LABEL_60:
        swift_bridgeObjectRelease_n(v6, 2);
        v11 = (char *)v100;
        goto LABEL_61;
      }
LABEL_33:
      v58 = (Class *)((char *)&v2->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict);
      v102 = v6;
      v103 = (v6 & 0xC000000000000001);
      v9 = 4;
      v101 = p_name;
      while (1)
      {
        if (v103)
          v59 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9 - 4, v6);
        else
          v59 = *(id *)(v6 + 8 * v9);
        v60 = v59;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        v104 = (v9 - 3);
        v61 = v2;
        objc_msgSend(v59, "registerObserver:", v2);
        v62 = objc_msgSend(v60, "identifier");
        v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
        v65 = v64;

        swift_beginAccess(v58, &v106, 33, 0);
        v66 = v60;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v58);
        v105 = (_QWORD *)*v58;
        v68 = v105;
        *v58 = 0x8000000000000000;
        v70 = sub_10000D748(v63, v65);
        v71 = v68[2];
        v72 = (v69 & 1) == 0;
        v73 = v71 + v72;
        if (__OFADD__(v71, v72))
          goto LABEL_53;
        v1 = v69;
        if (v68[3] >= v73)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v76 = v105;
            if ((v69 & 1) != 0)
              goto LABEL_46;
          }
          else
          {
            sub_100014710();
            v76 = v105;
            if ((v1 & 1) != 0)
              goto LABEL_46;
          }
        }
        else
        {
          sub_100014014(v73, isUniquelyReferenced_nonNull_native);
          v74 = sub_10000D748(v63, v65);
          if ((v1 & 1) != (v75 & 1))
          {
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
            __break(1u);
            return;
          }
          v70 = v74;
          v76 = v105;
          if ((v1 & 1) != 0)
          {
LABEL_46:
            v77 = v76[7];
            v78 = 8 * v70;

            *(_QWORD *)(v77 + v78) = v66;
            goto LABEL_50;
          }
        }
        v76[(v70 >> 6) + 8] |= 1 << v70;
        v79 = (uint64_t *)(v76[6] + 16 * v70);
        *v79 = v63;
        v79[1] = v65;
        *(_QWORD *)(v76[7] + 8 * v70) = v66;
        v80 = v76[2];
        v81 = __OFADD__(v80, 1);
        v82 = v80 + 1;
        if (v81)
          goto LABEL_54;
        v76[2] = v82;
        swift_bridgeObjectRetain(v65);
LABEL_50:
        *v58 = v76;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess(&v106);
        v83 = objc_msgSend(v66, "childrenIdentifiers");
        if (v83)
        {
          v84 = v83;
          v85 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v83, &type metadata for String);

          sub_100013B28(v85);
        }

        ++v9;
        p_name = (uint64_t)v101;
        v2 = v61;
        v6 = v102;
        if (v104 == v101)
          goto LABEL_60;
      }
    }
LABEL_61:
    v87 = objc_msgSend(v11, "cameraButtons");
    if (!v87)
      goto LABEL_75;
    v88 = v87;
    v89 = sub_10000F854(0, (unint64_t *)&qword_100032ED0, CAFCameraButton_ptr);
    v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v88, v89);

    if ((unint64_t)v33 >> 62)
    {
      if (v33 < 0)
        v93 = v33;
      else
        v93 = v33 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v33);
      v34 = _CocoaArrayWrapper.endIndex.getter(v93);
      if (!v34)
        goto LABEL_74;
    }
    else
    {
      v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v33);
      if (!v34)
        goto LABEL_74;
    }
    if (v34 >= 1)
      break;
    __break(1u);
LABEL_80:
    if (p_name < 0)
      v98 = p_name;
    else
      v98 = p_name & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(p_name);
    v35 = _CocoaArrayWrapper.endIndex.getter(v98);

    swift_bridgeObjectRelease_n(p_name, 2);
  }
  v90 = 0;
  do
  {
    if ((v33 & 0xC000000000000001) != 0)
      v91 = specialized _ArrayBuffer._getElementSlowPath(_:)(v90, v33);
    else
      v91 = *(id *)(v33 + 8 * v90 + 32);
    v92 = v91;
    ++v90;
    v106 = v91;
    sub_10000C2D0((id *)&v106, v2, &v108);

  }
  while (v34 != v90);
LABEL_74:
  swift_bridgeObjectRelease_n(v33, 2);
LABEL_75:
  sub_10000AA88();
  v94 = v2;
  v95 = Logger.logObject.getter(v94);
  v96 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v95, v96))
  {
    v97 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v97 = 134217984;
    v106 = (*(_QWORD **)((char *)&v94->isa + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons))[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, v107, v97 + 4, v97 + 12);

    _os_log_impl((void *)&_mh_execute_header, v95, v96, "[CAMERAMODEL] showing %ld buttons", v97, 0xCu);
    swift_slowDealloc(v97, -1, -1);
  }
  else
  {

    v95 = v94;
  }

  sub_10000C960();
  swift_bridgeObjectRelease();
}

void sub_10000C2D0(id *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  char *v14;
  id v15;
  char *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  char *v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE v32[24];

  v5 = *a1;
  v6 = objc_msgSend(*a1, "childrenIdentifiers");
  if (v6)
  {
    v7 = v6;
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String);

    if (*(_QWORD *)(v8 + 16))
    {
      v9 = objc_msgSend(v5, "identifier");
      v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      v12 = v11;

      v13 = objc_allocWithZone((Class)type metadata accessor for CameraButtonGroup());
      v14 = a2;
      v15 = sub_100014A60(v10, v12, v8, v14);

      v16 = &v14[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups];
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  v17 = (_QWORD *)*a3;
  swift_bridgeObjectRetain(*a3);
  v18 = objc_msgSend(v5, "identifier");
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  v21 = v20;

  LOBYTE(v18) = sub_10000C50C(v19, v21, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
    return;
  v22 = objc_msgSend(v5, "identifier");
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  v25 = v24;

  v26 = objc_allocWithZone((Class)type metadata accessor for CameraButtonGroup());
  v27 = a2;
  v15 = sub_100014A60(v23, v25, (uint64_t)_swiftEmptyArrayStorage, v27);

  v16 = &v27[OBJC_IVAR____TtC9CarCamera11CameraModel_menuGroups];
LABEL_7:
  swift_beginAccess(v16, v32, 33, 0);
  v28 = v15;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v30 = *(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v29 = *(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v30 >= v29 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
  v31 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v28);
  specialized Array._endMutation()(v31);
  swift_endAccess(v32);

}

uint64_t sub_10000C50C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C5D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v1 = v0;
  v2 = OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons;
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons);
  swift_bridgeObjectRetain(v11);
  sub_10000C734(&v11);
  v3 = v11;
  v4 = *(_QWORD *)(v0 + v2);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v4);
  v5 = sub_10000D2C4(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    return swift_bridgeObjectRelease();
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v7 = type metadata accessor for Logger(0);
  sub_100007524(v7, (uint64_t)qword_1000350A8);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERAMODEL] sort order updated", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  *(_QWORD *)(v1 + v2) = v3;
  swift_bridgeObjectRelease();
  return sub_10000C7A0();
}

void sub_10000C734(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_10000EEA0(v2);
  v3 = v2[2];
  v4[0] = (uint64_t)(v2 + 4);
  v4[1] = v3;
  sub_10000D88C(v4);
  *a1 = v2;
}

uint64_t sub_10000C7A0()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons];
  v2 = v0;
  v3 = swift_bridgeObjectRetain(v1);
  sub_10000F430(v3, (uint64_t)v2);
  v5 = v4;
  swift_bridgeObjectRelease();

  KeyPath = swift_getKeyPath(&unk_100022FD0);
  v7 = swift_getKeyPath(&unk_100022FF8);
  static Published.subscript.getter(v2, KeyPath, v7);
  swift_release(KeyPath);
  swift_release(v7);
  LOBYTE(v7) = sub_10000D2C4(v5, v15);
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
    return swift_bridgeObjectRelease();
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v9 = type metadata accessor for Logger(0);
  sub_100007524(v9, (uint64_t)qword_1000350A8);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[CAMERAMODEL] visibility updated", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13 = swift_getKeyPath(&unk_100022FD0);
  v14 = swift_getKeyPath(&unk_100022FF8);
  v15 = v5;
  return static Published.subscript.setter(&v15, v2, v13, v14);
}

void sub_10000C960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v1 = OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_hasEmittedFinalizedSignpost) & 1) != 0)
    return;
  v2 = v0;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v4, "receivedAllValues"))
    {
      if (qword_100032768 != -1)
        swift_once(&qword_100032768, sub_1000201B8);
      v5 = *(id *)(qword_100035118 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carManager);
      v6 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();

      CAFSignpostEmit_Finalized(v6);
      *(_BYTE *)(v2 + v1) = 1;
      return;
    }

  }
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100007524(v7, (uint64_t)qword_1000350A8);
  oslog = Logger.logObject.getter(v8);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "camera.receivedAllValues false", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

id sub_10000CB2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraModel(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CC70()
{
  return type metadata accessor for CameraModel(0);
}

uint64_t type metadata accessor for CameraModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100032E40;
  if (!qword_100032E40)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CameraModel);
  return result;
}

void sub_10000CCB4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[12];

  v8[0] = &unk_100022EE0;
  sub_10000CDC8(319, &qword_100032E50, &qword_100032E58);
  if (v3 <= 0x3F)
  {
    v8[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000CDC8(319, (unint64_t *)&unk_100032E60, &qword_1000328C8);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_10000CDC8(319, (unint64_t *)&unk_100032E70, &qword_100032998);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        v8[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
        v8[5] = (char *)&value witness table for Builtin.NativeObject + 64;
        v8[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
        v8[7] = &unk_100022EF8;
        v8[8] = (char *)&value witness table for Builtin.BridgeObject + 64;
        v8[9] = (char *)&value witness table for Builtin.BridgeObject + 64;
        v8[10] = &unk_100022F10;
        v8[11] = &unk_100022F10;
        swift_updateClassMetadata2(a1, 256, 12, v8, a1 + 80);
      }
    }
  }
}

void sub_10000CDC8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_100003908(a3);
    v6 = type metadata accessor for Published(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000CE14@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CameraModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

void sub_10000CE50(uint64_t a1, unint64_t a2)
{
  char *v2;
  void *v3;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char v19;
  id v20;
  uint64_t KeyPath;
  void *v22;
  uint64_t v23;
  id v24;
  char *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30[24];

  v3 = v2;
  v6 = &v2[OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict];
  swift_beginAccess(v6, v30, 0, 0);
  v7 = *(_QWORD *)v6;
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(v7);
    v8 = sub_10000D748(a1, a2);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(v7 + 56) + 80 * v8;
      v11 = *(void **)(v10 + 8);
      v12 = *(void **)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      v14 = *(_BYTE *)(v10 + 32);
      v15 = *(void **)(v10 + 40);
      v16 = *(_QWORD *)(v10 + 64);
      v26 = v12;
      v17 = v11;
      v27 = v13;
      v18 = v13;
      v19 = v14;
      sub_100003AF0(v18, v14);
      v28 = v16;
      swift_retain(v16);
      v20 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
        KeyPath = swift_getKeyPath(&unk_100022F88);
        v22 = v17;
        v23 = swift_getKeyPath(&unk_100022FB0);
        v29[0] = a1;
        v29[1] = a2;
        swift_bridgeObjectRetain(a2);
        v24 = v26;
        v25 = v3;
        static Published.subscript.setter(v29, v25, KeyPath, v23);
        *(_QWORD *)&v25[OBJC_IVAR____TtC9CarCamera11CameraModel_topButtons] = sub_100012838(a1, a2);
        swift_bridgeObjectRelease();
        sub_10000C7A0();

      }
      else
      {

      }
      sub_100003B28(v27, v19);
      swift_release(v28);

    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_10000D024(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v7[3];
  _OWORD v8[2];
  __int128 v9[3];
  _OWORD v10[2];

  v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 9) = *(__int128 *)((char *)a1 + 57);
  v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 9) = *(__int128 *)((char *)a2 + 57);
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_10000EEC8(v7, v9) & 1;
}

void *sub_10000D07C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000D088(uint64_t *a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = *a1;
  KeyPath = swift_getKeyPath(&unk_100023018);
  v3 = swift_getKeyPath(&unk_100023040);
  static Published.subscript.getter(v1, KeyPath, v3);
  swift_release(KeyPath);
  return swift_release(v3);
}

uint64_t sub_10000D0F0(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_10000383C(&qword_100032E58);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - v8;
  sub_10000EF8C(a1, (uint64_t)&v14 - v8);
  v10 = *a2;
  KeyPath = swift_getKeyPath(&unk_100023018);
  v12 = swift_getKeyPath(&unk_100023040);
  sub_10000EF8C((uint64_t)v9, (uint64_t)v6);
  static Published.subscript.setter(v6, v10, KeyPath, v12);
  return sub_10000EFD4((uint64_t)v9);
}

uint64_t sub_10000D1D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022FD0);
  v5 = swift_getKeyPath(&unk_100022FF8);
  static Published.subscript.getter(v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000D250(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022FD0);
  v5 = swift_getKeyPath(&unk_100022FF8);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10000D2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  id v35;
  uint64_t v36;
  char v37;
  void *v38;
  uint64_t v39;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = a1 + 48;
    v4 = a2 + 48;
    do
    {
      v28 = v2;
      v6 = *(_BYTE *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 48);
      v38 = *(void **)(v3 + 24);
      v8 = *(_QWORD *)(v3 + 8);
      v9 = *(void **)(v3 - 8);
      v10 = *(void **)v4;
      v11 = *(_QWORD *)(v4 + 8);
      v12 = *(_BYTE *)(v4 + 16);
      v30 = *(void **)(v4 + 24);
      v32 = *(void **)(v4 - 8);
      v13 = *(_QWORD *)(v4 + 48);
      v35 = *(id *)v3;
      v14 = v9;
      v36 = v8;
      v37 = v6;
      v15 = v6;
      v16 = v13;
      sub_100003AF0(v8, v15);
      v29 = v10;
      v34 = v38;
      v39 = v7;
      swift_retain(v7);
      v17 = v32;
      v18 = v11;
      v33 = v12;
      sub_100003AF0(v11, v12);
      swift_retain(v13);
      v19 = v14;
      v31 = v30;
      v20 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
      v22 = v21;

      v23 = v17;
      v24 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
      v26 = v25;

      if (v20 == v24 && v22 == v26)
      {

        swift_bridgeObjectRelease_n(v22, 2);
        sub_100003B28(v18, v33);

        swift_release(v16);
        sub_100003B28(v36, v37);
        swift_release(v39);

      }
      else
      {
        v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, v24, v26, 0);

        swift_bridgeObjectRelease(v22);
        swift_bridgeObjectRelease(v26);
        sub_100003B28(v18, v33);

        swift_release(v16);
        sub_100003B28(v36, v37);
        swift_release(v39);

        if ((v5 & 1) == 0)
          return 0;
      }
      v3 += 80;
      v4 += 80;
      v2 = v28 - 1;
    }
    while (v28 != 1);
  }
  return 1;
}

_QWORD *sub_10000D520(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
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
      v10 = sub_10000383C(&qword_100032EB8);
      v11 = (_QWORD *)swift_allocObject(v10, 80 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 80);
      v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[10 * v8 + 4])
          memmove(v13, a4 + 4, 80 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v13 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10000F334(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10000D63C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

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
      v10 = sub_10000383C(&qword_100032EC8);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10000F754(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000D748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000D7AC(a1, a2, v5);
}

unint64_t sub_10000D7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

void sub_10000D88C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  Swift::Int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  Swift::Int v14;
  Swift::Int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  char v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  uint64_t v53;
  Swift::Int v54;
  Swift::Int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  Swift::Int v60;
  uint64_t v61;
  Swift::Int v62;
  Swift::Int v63;
  void *v64;
  uint64_t v65;
  char v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _OWORD *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  uint64_t v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  uint64_t v114;
  char v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  BOOL v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  unint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  _QWORD *v151;
  Swift::Int v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  Swift::Int v156;
  Swift::Int v157;
  Swift::Int v158;
  unsigned __int8 v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  Swift::Int v163;
  Swift::Int v164;
  Swift::Int v165;
  Swift::Int v166;
  unsigned __int8 v167;
  char v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  __int128 v179;
  id v180;
  id v181;
  __int128 v182;
  id v183;
  char v184;
  id v185;
  char v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  char v191;

  v2 = v1;
  v4 = a1[1];
  v5 = _minimumMergeRunLength(_:)(v4);
  if (v5 >= v4)
  {
    if (v4 < 0)
      goto LABEL_138;
    if (v4)
      sub_10000E3A8(0, v4, 1, a1);
    return;
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_146;
  v152 = v5;
  v149 = a1;
  if (v4 < 2)
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
    v9 = (char *)&_swiftEmptyArrayStorage + 32;
    v151 = &_swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      v13 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
LABEL_101:
      if (v13 >= 2)
      {
        v139 = *v149;
        do
        {
          v140 = v13 - 2;
          if (v13 < 2)
            goto LABEL_133;
          if (!v139)
            goto LABEL_145;
          v132 = v10;
          v141 = v10 + 32;
          v142 = *(_QWORD *)&v10[16 * v140 + 32];
          v143 = *(_QWORD *)&v10[16 * v13 + 24];
          v144 = v9;
          sub_10000E5F0((char *)(v139 + 80 * v142), (char *)(v139 + 80 * *(_QWORD *)&v141[16 * v13 - 16]), v139 + 80 * v143, v9);
          if (v2)
            goto LABEL_113;
          if (v143 < v142)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native(v132) & 1) == 0)
            v132 = sub_10000ECFC((uint64_t)v132);
          if (v140 >= *((_QWORD *)v132 + 2))
            goto LABEL_135;
          v145 = &v132[16 * v140 + 32];
          *(_QWORD *)v145 = v142;
          *((_QWORD *)v145 + 1) = v143;
          v146 = *((_QWORD *)v132 + 2);
          if (v13 > v146)
            goto LABEL_136;
          v10 = v132;
          memmove(&v132[16 * v13 + 16], &v132[16 * v13 + 32], 16 * (v146 - v13));
          *((_QWORD *)v132 + 2) = v146 - 1;
          v13 = v146 - 1;
          v9 = v144;
        }
        while (v146 > 2);
      }
      v147 = v10;
LABEL_115:
      swift_bridgeObjectRelease(v147);
      v151[2] = 0;
      swift_bridgeObjectRelease(v151);
      return;
    }
  }
  else
  {
    v7 = v6 >> 1;
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6 >> 1, &type metadata for CameraActionButton);
    *(_QWORD *)(v8 + 16) = v7;
    v151 = (_QWORD *)v8;
    v9 = (char *)(v8 + 32);
  }
  v11 = 0;
  v12 = *a1;
  v150 = *a1 + 112;
  v148 = *a1 - 80;
  v10 = (char *)&_swiftEmptyArrayStorage;
  v161 = v9;
  v162 = *a1;
  v157 = v4;
  while (1)
  {
    v14 = v11;
    v15 = v11 + 1;
    v155 = v10;
    v158 = v11;
    if (v11 + 1 >= v4)
    {
LABEL_33:
      if (v15 >= v4)
        goto LABEL_53;
      goto LABEL_34;
    }
    v153 = v2;
    v16 = v12 + 80 * v15;
    v18 = *(void **)(v16 + 8);
    v17 = *(void **)(v16 + 16);
    v19 = *(_QWORD *)(v16 + 24);
    v190 = v19;
    v20 = *(_BYTE *)(v16 + 32);
    v184 = v20;
    v21 = *(void **)(v16 + 40);
    v22 = *(_QWORD *)(v16 + 64);
    v23 = v12 + 80 * v14;
    v24 = *(void **)(v23 + 8);
    v25 = *(void **)(v23 + 16);
    v26 = *(_QWORD *)(v23 + 24);
    v27 = *(_BYTE *)(v23 + 32);
    v176 = *(void **)(v23 + 40);
    v173 = *(_QWORD *)(v23 + 64);
    v180 = v17;
    v28 = v18;
    sub_100003AF0(v19, v20);
    v29 = v25;
    v188 = v21;
    swift_retain(v22);
    v30 = v24;
    v31 = v26;
    sub_100003AF0(v26, v27);
    swift_retain(v173);
    v32 = v28;
    v33 = v176;
    v167 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

    v34 = v30;
    v159 = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

    v35 = v27;
    v4 = v157;
    v14 = v158;
    sub_100003B28(v31, v35);

    swift_release(v173);
    sub_100003B28(v190, v184);
    swift_release(v22);

    v15 = v158 + 2;
    if (v158 + 2 < v157)
    {
      v36 = v150 + 80 * v158;
      while (1)
      {
        v163 = v15;
        v37 = *(void **)(v36 + 56);
        v38 = *(_QWORD *)(v36 + 72);
        v39 = *(_BYTE *)(v36 + 80);
        v40 = *(void **)(v36 + 88);
        v41 = *(_QWORD *)(v36 + 112);
        v42 = *(void **)(v36 - 24);
        v43 = *(void **)(v36 - 16);
        v44 = *(_QWORD *)(v36 - 8);
        v169 = *(_BYTE *)v36;
        v177 = *(void **)(v36 + 8);
        v171 = *(_QWORD *)(v36 + 32);
        v181 = *(id *)(v36 + 64);
        v45 = v37;
        sub_100003AF0(v38, v39);
        v174 = v43;
        v185 = v40;
        swift_retain(v41);
        v46 = v42;
        sub_100003AF0(v44, v169);
        swift_retain(v171);
        v47 = v45;
        v48 = v177;
        LODWORD(v177) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

        v49 = v46;
        LOBYTE(v46) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

        sub_100003B28(v44, v169);
        swift_release(v171);

        sub_100003B28(v38, v39);
        swift_release(v41);

        if (v167 < v159 == v177 >= v46)
          break;
        v15 = v163 + 1;
        v36 += 80;
        v4 = v157;
        if (v157 == v163 + 1)
        {
          v15 = v157;
          goto LABEL_22;
        }
      }
      v4 = v157;
      v15 = v163;
LABEL_22:
      v14 = v158;
    }
    v2 = v153;
    v10 = v155;
    v50 = v162;
    if (v167 >= v159)
      break;
    if (v15 < v14)
      goto LABEL_139;
    if (v14 >= v15)
      goto LABEL_33;
    v51 = v14;
    v52 = 80 * v15;
    v53 = 80 * v51;
    v164 = v15;
    v54 = v15;
    v55 = v51;
    do
    {
      if (v55 != --v54)
      {
        if (!v50)
          goto LABEL_144;
        v56 = v50 + v52;
        v57 = *(_QWORD *)(v50 + v53);
        v58 = *(_QWORD *)(v50 + v53 + 8);
        v59 = *(_BYTE *)(v50 + v53 + 32);
        v191 = *(_BYTE *)(v50 + v53 + 56);
        v189 = *(_QWORD *)(v50 + v53 + 64);
        v186 = *(_BYTE *)(v50 + v53 + 72);
        v179 = *(_OWORD *)(v50 + v53 + 16);
        v182 = *(_OWORD *)(v50 + v53 + 40);
        memmove((void *)(v50 + v53), (const void *)(v50 + v52 - 80), 0x50uLL);
        v50 = v162;
        *(_QWORD *)(v56 - 80) = v57;
        *(_QWORD *)(v56 - 72) = v58;
        *(_OWORD *)(v56 - 64) = v179;
        *(_BYTE *)(v56 - 48) = v59;
        *(_OWORD *)(v56 - 40) = v182;
        *(_BYTE *)(v56 - 24) = v191;
        *(_QWORD *)(v56 - 16) = v189;
        *(_BYTE *)(v56 - 8) = v186;
        v10 = v155;
      }
      ++v55;
      v52 -= 80;
      v53 += 80;
    }
    while (v55 < v54);
    v4 = v157;
    v14 = v158;
    v15 = v164;
    if (v164 < v157)
      goto LABEL_34;
LABEL_53:
    if (v15 < v14)
      goto LABEL_132;
    if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
      v10 = sub_10000EB50(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v89 = *((_QWORD *)v10 + 2);
    v88 = *((_QWORD *)v10 + 3);
    v13 = v89 + 1;
    v9 = v161;
    v12 = v162;
    if (v89 >= v88 >> 1)
    {
      v138 = sub_10000EB50((char *)(v88 > 1), v89 + 1, 1, v10);
      v9 = v161;
      v12 = v162;
      v10 = v138;
    }
    *((_QWORD *)v10 + 2) = v13;
    v90 = v10 + 32;
    v91 = &v10[16 * v89 + 32];
    *(_QWORD *)v91 = v158;
    *((_QWORD *)v91 + 1) = v15;
    v166 = v15;
    if (v89)
    {
      while (1)
      {
        v92 = v13 - 1;
        if (v13 >= 4)
        {
          v97 = &v90[16 * v13];
          v98 = *((_QWORD *)v97 - 8);
          v99 = *((_QWORD *)v97 - 7);
          v103 = __OFSUB__(v99, v98);
          v100 = v99 - v98;
          if (v103)
            goto LABEL_121;
          v102 = *((_QWORD *)v97 - 6);
          v101 = *((_QWORD *)v97 - 5);
          v103 = __OFSUB__(v101, v102);
          v95 = v101 - v102;
          v96 = v103;
          if (v103)
            goto LABEL_122;
          v104 = v13 - 2;
          v105 = &v90[16 * v13 - 32];
          v107 = *(_QWORD *)v105;
          v106 = *((_QWORD *)v105 + 1);
          v103 = __OFSUB__(v106, v107);
          v108 = v106 - v107;
          if (v103)
            goto LABEL_124;
          v103 = __OFADD__(v95, v108);
          v109 = v95 + v108;
          if (v103)
            goto LABEL_127;
          if (v109 >= v100)
          {
            v127 = &v90[16 * v92];
            v129 = *(_QWORD *)v127;
            v128 = *((_QWORD *)v127 + 1);
            v103 = __OFSUB__(v128, v129);
            v130 = v128 - v129;
            if (v103)
              goto LABEL_131;
            v120 = v95 < v130;
            goto LABEL_90;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v121 = *((_QWORD *)v10 + 4);
            v122 = *((_QWORD *)v10 + 5);
            v103 = __OFSUB__(v122, v121);
            v114 = v122 - v121;
            v115 = v103;
            goto LABEL_84;
          }
          v94 = *((_QWORD *)v10 + 4);
          v93 = *((_QWORD *)v10 + 5);
          v103 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          v96 = v103;
        }
        if ((v96 & 1) != 0)
          goto LABEL_123;
        v104 = v13 - 2;
        v110 = &v90[16 * v13 - 32];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v113 = __OFSUB__(v111, v112);
        v114 = v111 - v112;
        v115 = v113;
        if (v113)
          goto LABEL_126;
        v116 = &v90[16 * v92];
        v118 = *(_QWORD *)v116;
        v117 = *((_QWORD *)v116 + 1);
        v103 = __OFSUB__(v117, v118);
        v119 = v117 - v118;
        if (v103)
          goto LABEL_129;
        if (__OFADD__(v114, v119))
          goto LABEL_130;
        if (v114 + v119 >= v95)
        {
          v120 = v95 < v119;
LABEL_90:
          if (v120)
            v92 = v104;
          goto LABEL_92;
        }
LABEL_84:
        if ((v115 & 1) != 0)
          goto LABEL_125;
        v123 = &v90[16 * v92];
        v125 = *(_QWORD *)v123;
        v124 = *((_QWORD *)v123 + 1);
        v103 = __OFSUB__(v124, v125);
        v126 = v124 - v125;
        if (v103)
          goto LABEL_128;
        if (v126 < v114)
          goto LABEL_14;
LABEL_92:
        v131 = v92 - 1;
        if (v92 - 1 >= v13)
        {
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
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v12)
          goto LABEL_143;
        v132 = v10;
        v133 = &v90[16 * v131];
        v134 = *(_QWORD *)v133;
        v135 = &v90[16 * v92];
        v136 = *((_QWORD *)v135 + 1);
        sub_10000E5F0((char *)(v12 + 80 * *(_QWORD *)v133), (char *)(v12 + 80 * *(_QWORD *)v135), v12 + 80 * v136, v9);
        if (v2)
        {
LABEL_113:
          v147 = v132;
          goto LABEL_115;
        }
        if (v136 < v134)
          goto LABEL_118;
        if (v92 > *((_QWORD *)v132 + 2))
          goto LABEL_119;
        *(_QWORD *)v133 = v134;
        *(_QWORD *)&v90[16 * v131 + 8] = v136;
        v137 = *((_QWORD *)v132 + 2);
        if (v92 >= v137)
          goto LABEL_120;
        v10 = v132;
        v13 = v137 - 1;
        memmove(&v90[16 * v92], v135 + 16, 16 * (v137 - 1 - v92));
        *((_QWORD *)v132 + 2) = v137 - 1;
        v9 = v161;
        v12 = v162;
        if (v137 <= 2)
          goto LABEL_14;
      }
    }
    v13 = 1;
LABEL_14:
    v4 = v157;
    v11 = v166;
    if (v166 >= v157)
      goto LABEL_101;
  }
  if (v15 >= v4)
    goto LABEL_53;
LABEL_34:
  if (__OFSUB__(v15, v14))
    goto LABEL_137;
  if (v15 - v14 >= v152)
    goto LABEL_53;
  if (__OFADD__(v14, v152))
    goto LABEL_140;
  if (v14 + v152 >= v4)
    v60 = v4;
  else
    v60 = v14 + v152;
  if (v60 >= v14)
  {
    if (v15 != v60)
    {
      v154 = v2;
      v61 = v148 + 80 * v15;
      v156 = v60;
      do
      {
        v63 = v14;
        v160 = v61;
        v165 = v15;
        while (1)
        {
          v64 = *(void **)(v61 + 88);
          v65 = *(_QWORD *)(v61 + 104);
          v66 = *(_BYTE *)(v61 + 112);
          v67 = *(void **)(v61 + 120);
          v68 = *(_QWORD *)(v61 + 144);
          v69 = *(void **)(v61 + 8);
          v70 = *(void **)(v61 + 16);
          v170 = *(_QWORD *)(v61 + 24);
          v168 = *(_BYTE *)(v61 + 32);
          v178 = *(void **)(v61 + 40);
          v172 = *(_QWORD *)(v61 + 64);
          v183 = *(id *)(v61 + 96);
          v71 = v64;
          sub_100003AF0(v65, v66);
          v175 = v70;
          v187 = v67;
          swift_retain(v68);
          v72 = v69;
          sub_100003AF0(v170, v168);
          swift_retain(v172);
          v73 = v71;
          v74 = v178;
          LODWORD(v178) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

          v75 = v72;
          LOBYTE(v72) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

          sub_100003B28(v170, v168);
          swift_release(v172);

          sub_100003B28(v65, v66);
          swift_release(v68);

          if (v178 >= v72)
            break;
          v62 = v165;
          if (!v162)
            goto LABEL_142;
          v76 = (_OWORD *)(v61 + 80);
          v77 = *(_QWORD *)(v61 + 80);
          v78 = *(_QWORD *)(v61 + 88);
          v79 = *(_BYTE *)(v61 + 112);
          v80 = *(_BYTE *)(v61 + 136);
          v81 = *(_QWORD *)(v61 + 144);
          v82 = *(_BYTE *)(v61 + 152);
          v83 = *(_OWORD *)(v61 + 96);
          v84 = *(_OWORD *)(v61 + 120);
          v85 = *(_OWORD *)(v61 + 48);
          *(_OWORD *)(v61 + 112) = *(_OWORD *)(v61 + 32);
          *(_OWORD *)(v61 + 128) = v85;
          *(_OWORD *)(v61 + 144) = *(_OWORD *)(v61 + 64);
          v87 = *(_OWORD *)v61;
          v86 = *(_OWORD *)(v61 + 16);
          *(_OWORD *)(v61 + 16) = v83;
          *(_QWORD *)v61 = v77;
          *(_QWORD *)(v61 + 8) = v78;
          *(_BYTE *)(v61 + 32) = v79;
          *(_OWORD *)(v61 + 40) = v84;
          *(_BYTE *)(v61 + 56) = v80;
          *(_QWORD *)(v61 + 64) = v81;
          *(_BYTE *)(v61 + 72) = v82;
          v61 -= 80;
          ++v63;
          *v76 = v87;
          v76[1] = v86;
          if (v165 == v63)
            goto LABEL_44;
        }
        v62 = v165;
LABEL_44:
        v15 = v62 + 1;
        v14 = v158;
        v61 = v160 + 80;
      }
      while (v15 != v156);
      v15 = v156;
      v2 = v154;
      v10 = v155;
    }
    goto LABEL_53;
  }
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
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_10000E3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  char v41;
  id v42;

  v33 = a3;
  if (a3 != a2)
  {
    v32 = *a4;
    v4 = *a4 + 80 * a3 - 80;
LABEL_5:
    v5 = a1;
    v31 = v4;
    while (1)
    {
      v6 = *(void **)(v4 + 88);
      v7 = *(_QWORD *)(v4 + 104);
      v8 = *(_BYTE *)(v4 + 112);
      v41 = v8;
      v9 = *(void **)(v4 + 120);
      v10 = *(_QWORD *)(v4 + 144);
      v11 = *(void **)(v4 + 16);
      v34 = *(void **)(v4 + 8);
      v35 = *(_BYTE *)(v4 + 32);
      v39 = *(void **)(v4 + 40);
      v36 = *(_QWORD *)(v4 + 24);
      v37 = *(_QWORD *)(v4 + 64);
      v40 = *(id *)(v4 + 96);
      v12 = v6;
      sub_100003AF0(v7, v8);
      v38 = v11;
      v42 = v9;
      swift_retain(v10);
      v13 = v34;
      sub_100003AF0(v36, v35);
      swift_retain(v37);
      v14 = v12;
      v15 = v39;
      LODWORD(v39) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      v16 = v13;
      LOBYTE(v13) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      sub_100003B28(v36, v35);
      swift_release(v37);

      sub_100003B28(v7, v41);
      swift_release(v10);

      if (v39 >= v13)
      {
LABEL_4:
        v4 = v31 + 80;
        if (++v33 == a2)
          return;
        goto LABEL_5;
      }
      if (!v32)
        break;
      v17 = (_OWORD *)(v4 + 80);
      v18 = *(_QWORD *)(v4 + 80);
      v19 = *(_QWORD *)(v4 + 88);
      v20 = *(_BYTE *)(v4 + 112);
      v21 = *(_BYTE *)(v4 + 136);
      v22 = *(_QWORD *)(v4 + 144);
      v23 = *(_BYTE *)(v4 + 152);
      v24 = *(_OWORD *)(v4 + 96);
      v25 = *(_OWORD *)(v4 + 120);
      v26 = *(_OWORD *)(v4 + 48);
      *(_OWORD *)(v4 + 112) = *(_OWORD *)(v4 + 32);
      *(_OWORD *)(v4 + 128) = v26;
      *(_OWORD *)(v4 + 144) = *(_OWORD *)(v4 + 64);
      v28 = *(_OWORD *)v4;
      v27 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = v24;
      *(_QWORD *)v4 = v18;
      *(_QWORD *)(v4 + 8) = v19;
      *(_BYTE *)(v4 + 32) = v20;
      *(_OWORD *)(v4 + 40) = v25;
      *(_BYTE *)(v4 + 56) = v21;
      *(_QWORD *)(v4 + 64) = v22;
      *(_BYTE *)(v4 + 72) = v23;
      v4 -= 80;
      ++v5;
      *v17 = v28;
      v17[1] = v27;
      if (v33 == v5)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_10000E5F0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  char *v26;
  const void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void *v31;
  uint64_t v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t result;
  char *v48;
  char *v49;
  char *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *__dstb;
  char *__dsta;
  id v65;
  id v66;
  char v67;
  id v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  const void *v74;
  char *v75;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = a2 - __src;
  v8 = (a2 - __src) / 80;
  v9 = a3 - (_QWORD)a2;
  v10 = (uint64_t)(a3 - (_QWORD)a2) / 80;
  v75 = __src;
  v74 = __dst;
  if (v8 >= v10)
  {
    if (v9 < -79)
      goto LABEL_44;
    v28 = 80 * v10;
    if (__dst != a2 || &a2[v28] <= __dst)
      memmove(__dst, a2, 80 * v10);
    v29 = &v4[v28];
    v73 = &v4[v28];
    v75 = v5;
    if (v6 >= v5 || v9 < 80)
    {
LABEL_43:
      sub_10000EC48((void **)&v75, &v74, &v73);
      return 1;
    }
    v30 = (char *)(a3 - 80);
    v72 = v6;
    v49 = v4;
    while (1)
    {
      __dsta = v30;
      v70 = v30 + 80;
      v31 = (void *)*((_QWORD *)v29 - 9);
      v32 = *((_QWORD *)v29 - 7);
      v69 = v32;
      v33 = *(v29 - 48);
      v67 = v33;
      v34 = (void *)*((_QWORD *)v29 - 5);
      v35 = *((_QWORD *)v29 - 2);
      v36 = (void *)*((_QWORD *)v5 - 8);
      v51 = (void *)*((_QWORD *)v5 - 9);
      v53 = *((_QWORD *)v5 - 7);
      v37 = *(v5 - 48);
      v59 = (void *)*((_QWORD *)v5 - 5);
      v55 = *((_QWORD *)v5 - 2);
      v62 = *((id *)v29 - 8);
      v38 = v31;
      sub_100003AF0(v32, v33);
      v57 = v36;
      v66 = v34;
      swift_retain(v35);
      v39 = v51;
      sub_100003AF0(v53, v37);
      swift_retain(v55);
      v40 = v38;
      v41 = v59;
      LODWORD(v59) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      v42 = v39;
      LOBYTE(v39) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

      sub_100003B28(v53, v37);
      swift_release(v55);

      sub_100003B28(v69, v67);
      swift_release(v35);

      if (v59 < v39)
        break;
      v45 = v29 - 80;
      v73 = v29 - 80;
      v44 = __dsta;
      if (v70 < v29 || __dsta >= v29)
      {
        memmove(__dsta, v29 - 80, 0x50uLL);
        v43 = v5;
        v29 -= 80;
        goto LABEL_41;
      }
      v46 = v72;
      if (v70 != v29)
        memmove(__dsta, v29 - 80, 0x50uLL);
      v43 = v5;
      v29 -= 80;
      if (v45 <= v49)
        goto LABEL_43;
LABEL_42:
      v30 = v44 - 80;
      v5 = v43;
      if (v43 <= v46)
        goto LABEL_43;
    }
    v43 = v5 - 80;
    v44 = __dsta;
    if (v70 != v5 || __dsta >= v5)
      memmove(__dsta, v5 - 80, 0x50uLL);
    v75 = v5 - 80;
LABEL_41:
    v46 = v72;
    if (v29 <= v49)
      goto LABEL_43;
    goto LABEL_42;
  }
  if (v7 >= -79)
  {
    v11 = 80 * v8;
    if (__dst != __src || &__src[v11] <= __dst)
      memmove(__dst, __src, v11);
    v50 = &v4[v11];
    v73 = &v4[v11];
    if ((unint64_t)v5 < a3 && v7 >= 80)
    {
      v12 = v4;
      while (1)
      {
        v48 = v4;
        v13 = (void *)*((_QWORD *)v5 + 1);
        v14 = *((_QWORD *)v5 + 3);
        v71 = v6;
        v15 = v5[32];
        v16 = (void *)*((_QWORD *)v5 + 5);
        v17 = (void *)*((_QWORD *)v5 + 8);
        v18 = (void *)*((_QWORD *)v12 + 2);
        v54 = (void *)*((_QWORD *)v12 + 1);
        v56 = *((_QWORD *)v12 + 3);
        v19 = v12[32];
        v61 = (void *)*((_QWORD *)v12 + 5);
        __dstb = v17;
        v58 = *((_QWORD *)v12 + 8);
        v65 = *((id *)v5 + 2);
        v20 = v13;
        sub_100003AF0(v14, v15);
        v60 = v18;
        v68 = v16;
        swift_retain(v17);
        v21 = v54;
        LOBYTE(v18) = v19;
        sub_100003AF0(v56, v19);
        swift_retain(v58);
        v22 = v20;
        v23 = v61;
        LODWORD(v61) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

        v24 = v21;
        LOBYTE(v21) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

        sub_100003B28(v56, (char)v18);
        swift_release(v58);

        sub_100003B28(v14, v15);
        swift_release(__dstb);

        if (v61 >= v21)
        {
          v4 = v12 + 80;
          v26 = v71;
          v27 = v12;
          v25 = v5;
          if (v71 == v12)
          {
            v12 += 80;
            if (v71 < v4)
              goto LABEL_19;
          }
          else
          {
            v12 += 80;
          }
        }
        else
        {
          v25 = v5 + 80;
          v26 = v71;
          v27 = v5;
          if (v71 == v5)
          {
            v4 = v48;
            if (v71 < v25)
              goto LABEL_19;
          }
          else
          {
            v4 = v48;
          }
        }
        memmove(v26, v27, 0x50uLL);
LABEL_19:
        v6 = v26 + 80;
        if (v12 < v50)
        {
          v5 = v25;
          if ((unint64_t)v25 < a3)
            continue;
        }
        v74 = v4;
        v75 = v6;
        goto LABEL_43;
      }
    }
    goto LABEL_43;
  }
LABEL_44:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_10000EB50(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_10000383C(&qword_100032EC0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10000EC48(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  size_t v6;
  char v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -80)
  {
    v7 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v7, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = 80 * (v4 / 80);
    if (result != v3 || result >= &v3[v6])
      return (char *)memmove(result, v3, v6);
  }
  return result;
}

char *sub_10000ECFC(uint64_t a1)
{
  return sub_10000EB50(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000ED10(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000ED2C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000ED2C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
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
    v10 = sub_10000383C(&qword_100032EB8);
    v11 = (char *)swift_allocObject(v10, 80 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 80);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  v15 = 80 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_QWORD *sub_10000EEA0(_QWORD *a1)
{
  return sub_10000D520(0, a1[2], 0, a1);
}

_QWORD *sub_10000EEB4(_QWORD *a1)
{
  return sub_10000D63C(0, a1[2], 0, a1);
}

uint64_t sub_10000EEC8(__int128 *a1, __int128 *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  __int128 v13;
  __int128 v14;

  v14 = *a1;
  v3 = *((id *)&v14 + 1);
  v4 = ((uint64_t (*)(void))dispatch thunk of CAFCameraButtonObservable.symbolName.getter)();
  v6 = v5;
  sub_100005CA0((uint64_t)&v14);
  v13 = *a2;
  v7 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter(*((id *)&v13 + 1));
  v9 = v8;
  sub_100005CA0((uint64_t)&v13);
  if (v4 == v7 && v6 == v9)
    v11 = 1;
  else
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_10000EF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000383C(&qword_100032E58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EFD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000383C(&qword_100032E58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000F014(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[24];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[25];

  v3 = v2;
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100007524(v6, (uint64_t)qword_1000350A8);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERAMODEL] promoteChild", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  if (a2)
  {
    v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict);
    swift_beginAccess(v3 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict, v20, 0, 0);
    v12 = *v11;
    if (*(_QWORD *)(v12 + 16))
    {
      swift_bridgeObjectRetain(a2);
      swift_bridgeObjectRetain(v12);
      v13 = sub_10000D748(a1, a2);
      if ((v14 & 1) != 0)
      {
        v15 = (__int128 *)(*(_QWORD *)(v12 + 56) + 80 * v13);
        v21 = *v15;
        v17 = v15[2];
        v16 = v15[3];
        v18 = *(__int128 *)((char *)v15 + 57);
        v22 = v15[1];
        v23 = v17;
        *(_OWORD *)&v24[9] = v18;
        *(_OWORD *)v24 = v16;
        sub_100005C14((uint64_t)&v21);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((_QWORD)v22)
        {
          v19 = (id)v22;
          sub_100015784();
          sub_100012AA8(a1, a2);

        }
        sub_10000F1D8((uint64_t)&v21);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t sub_10000F1D8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);

  sub_100003B28(v3, v4);
  swift_release(v6);
  return a1;
}

uint64_t sub_10000F23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000383C(&qword_100032EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F284(uint64_t a1)
{
  sub_10000F2D0(*(_QWORD *)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return a1;
}

uint64_t sub_10000F2D0(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;

  if (a2)
  {

    sub_100003B28(a4, a5 & 1);
    return swift_release(a9);
  }
  return result;
}

uint64_t sub_10000F334(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 80 * a1 + 32;
  v6 = a3 + 80 * v4;
  if (v5 >= v6 || v5 + 80 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10000F430(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return;
  v3 = 0;
  v32 = -(uint64_t)v2;
  v30 = a1 + 56;
  v4 = _swiftEmptyArrayStorage;
  v29 = *(_QWORD *)(a1 + 16);
  do
  {
    v31 = v4;
    if (v3 <= v2)
      v5 = v2;
    else
      v5 = v3;
    v40 = -(uint64_t)v5;
    v6 = v30 + 80 * v3;
    v7 = v3 + 1;
    while (1)
    {
      if (v40 + v7 == 1)
      {
        __break(1u);
        return;
      }
      v44 = v7;
      v8 = *(void **)(v6 - 16);
      v39 = *(_QWORD *)(v6 - 24);
      v10 = *(void **)(v6 - 8);
      v9 = *(_QWORD *)v6;
      v11 = *(_BYTE *)(v6 + 8);
      v12 = *(void **)(v6 + 16);
      v36 = *(_QWORD *)(v6 + 24);
      v13 = *(_QWORD *)(v6 + 40);
      v34 = *(_BYTE *)(v6 + 48);
      v35 = *(_BYTE *)(v6 + 32);
      KeyPath = swift_getKeyPath(&unk_100022F88);
      v15 = swift_getKeyPath(&unk_100022FB0);
      v38 = v10;
      v43 = v10;
      v16 = v8;
      sub_100003AF0(v9, v11);
      swift_retain(v13);
      v37 = v12;
      v17 = v12;
      static Published.subscript.getter(a2, KeyPath, v15);
      swift_release(KeyPath);
      swift_release(v15);
      if (!v46)
        goto LABEL_12;
      v41 = v17;
      v42 = v11;
      v18 = v16;
      v19 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
      v21 = v20;

      if (v19 == v45 && v46 == v21)
        break;
      v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v45);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = v41;
      v11 = v42;
      if ((v22 & 1) != 0)
        goto LABEL_16;
LABEL_12:
      v23 = v16;
      v24 = (void *)CAFCameraButtonObservable.observed.getter();

      v25 = objc_msgSend(v24, "hidden");
      if ((v25 & 1) == 0)
        goto LABEL_16;

      sub_100003B28(v9, v11);
      swift_release(v13);

      v7 = v44 + 1;
      v6 += 80;
      if (v32 + v44 + 1 == 1)
        return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = v42;
LABEL_16:
    v4 = v31;
    if ((swift_isUniquelyReferenced_nonNull_native(v31) & 1) == 0)
    {
      sub_10000ED10(0, v31[2] + 1, 1);
      v4 = v31;
    }
    v27 = v4[2];
    v26 = v4[3];
    if (v27 >= v26 >> 1)
    {
      sub_10000ED10(v26 > 1, v27 + 1, 1);
      v4 = v31;
    }
    v4[2] = v27 + 1;
    v28 = &v4[10 * v27];
    v28[4] = v39;
    v28[5] = v16;
    v28[6] = v38;
    v28[7] = v9;
    *((_BYTE *)v28 + 64) = v11;
    v28[9] = v37;
    v28[10] = v36;
    *((_BYTE *)v28 + 88) = v35;
    v28[12] = v13;
    *((_BYTE *)v28 + 104) = v34;
    v3 = v44;
    v2 = v29;
  }
  while (v32 + v44);
}

uint64_t sub_10000F754(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000F854(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_10000F88C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032EE0;
  if (!qword_100032EE0)
  {
    v1 = sub_10000F854(255, &qword_100032ED8, CAFCameraGeneral_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for CAFCameraGeneral, v1);
    atomic_store(result, (unint64_t *)&qword_100032EE0);
  }
  return result;
}

void sub_10000F8EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13[3];

  v1 = v0;
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350A8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v13[0] = v7;
    *(_DWORD *)v6 = 136315138;
    v12 = sub_10000934C(0xD00000000000001BLL, 0x80000001000243E0, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, v13, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERAMODEL] %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = v1 + OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable;
  swift_beginAccess(v1 + OBJC_IVAR____TtC9CarCamera11CameraModel__carObservable, v13, 0, 0);
  v9 = *(id *)(v8 + 8);
  v10 = (void *)CAFCarObservable.observed.getter();

  v11 = objc_msgSend(v10, "automakerExteriorCamera");
  if (v11)
  {
    sub_10000B358(v11);

  }
}

void sub_10000FACC(void *a1, char a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350A8);
  v11 = a1;
  v5 = Logger.logObject.getter(v11);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc(18, -1);
    v8 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 67109378;
    HIDWORD(v13) = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)&v13 + 4, &v14, v7 + 4, v7 + 8);
    *(_WORD *)(v7 + 8) = 2112;
    v12 = v11;
    v9 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v7 + 10, v7 + 18);
    *v8 = v11;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[CAMERAMODEL] CAFCameraGeneral didUpdateOn %{BOOL}d %@", (uint8_t *)v7, 0x12u);
    v10 = sub_10000383C((uint64_t *)&unk_100032EF0);
    swift_arrayDestroy(v8, 1, v10);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_10000FCA4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char v8;
  uint64_t v9;

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350A8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(5, -1);
    *(_DWORD *)v6 = 16777472;
    v8 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 5);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERAMODEL] CAFCameraButtonObserver didUpdateSortOrder %hhu", v6, 5u);
    swift_slowDealloc(v6, -1, -1);
  }

  return sub_10000C5D0();
}

uint64_t sub_10000FDB4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  int v8;
  uint64_t v9;

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350A8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 67109120;
    v8 = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CAMERAMODEL] CAFCameraButtonObserver didUpdateHidden %{BOOL}d", v6, 8u);
    swift_slowDealloc(v6, -1, -1);
  }

  return sub_10000C7A0();
}

uint64_t sub_10000FECC@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t KeyPath;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _OWORD v96[2];
  _BYTE v97[241];
  char v98;
  _OWORD v99[18];

  v82 = a1;
  v69 = sub_10000383C(&qword_100032FC0);
  __chkstk_darwin(v69);
  v71 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_10000383C(&qword_100032FC8);
  __chkstk_darwin(v81);
  v70 = (uint64_t)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v73 = (uint64_t)&v65 - v5;
  v78 = sub_10000383C(&qword_100032FD0);
  __chkstk_darwin(v78);
  v80 = (uint64_t)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_10000383C(&qword_100032FD8);
  __chkstk_darwin(v79);
  v72 = (uint64_t *)((char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v74 = sub_10000383C(&qword_100032FE0);
  __chkstk_darwin(v74);
  v9 = (uint64_t *)((char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for ColorScheme(0);
  v76 = *(_QWORD *)(v10 - 8);
  v77 = v10;
  __chkstk_darwin(v10);
  v75 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_10000383C(&qword_100032FE8);
  __chkstk_darwin(v66);
  v13 = (_OWORD *)((char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v67 = sub_10000383C(&qword_100032FF0);
  __chkstk_darwin(v67);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v68 = (uint64_t)&v65 - v17;
  v18 = *(_QWORD *)v1;
  v19 = *(_BYTE *)(v1 + 8);
  sub_100003AF0(*(_QWORD *)v1, v19);
  v20 = sub_100008D3C(v18, v19);
  v21 = sub_100003B28(v18, v19);
  if ((v20 & 1) != 0)
  {
    v46 = static VerticalAlignment.center.getter(v21);
    v47 = sub_100010CAC(v1, (uint64_t)&v83);
    *(_OWORD *)&v97[183] = v94;
    *(_OWORD *)&v97[199] = v95;
    *(_OWORD *)&v97[215] = v96[0];
    *(_OWORD *)&v97[225] = *(_OWORD *)((char *)v96 + 10);
    *(_OWORD *)&v97[119] = v90;
    *(_OWORD *)&v97[135] = v91;
    *(_OWORD *)&v97[151] = v92;
    *(_OWORD *)&v97[167] = v93;
    *(_OWORD *)&v97[55] = v86;
    *(_OWORD *)&v97[71] = v87;
    *(_OWORD *)&v97[87] = v88;
    *(_OWORD *)&v97[103] = v89;
    *(_OWORD *)&v97[7] = v83;
    *(_OWORD *)&v97[23] = v84;
    v98 = 1;
    *(_OWORD *)&v97[39] = v85;
    v48 = static SafeAreaRegions.all.getter(v47);
    v49 = static Edge.Set.all.getter();
    *(_OWORD *)((char *)&v99[13] + 1) = *(_OWORD *)&v97[192];
    *(_OWORD *)((char *)&v99[14] + 1) = *(_OWORD *)&v97[208];
    *(_OWORD *)((char *)&v99[15] + 1) = *(_OWORD *)&v97[224];
    *(_OWORD *)((char *)&v99[9] + 1) = *(_OWORD *)&v97[128];
    *(_OWORD *)((char *)&v99[10] + 1) = *(_OWORD *)&v97[144];
    *(_OWORD *)((char *)&v99[11] + 1) = *(_OWORD *)&v97[160];
    *(_OWORD *)((char *)&v99[12] + 1) = *(_OWORD *)&v97[176];
    *(_OWORD *)((char *)&v99[5] + 1) = *(_OWORD *)&v97[64];
    *(_OWORD *)((char *)&v99[6] + 1) = *(_OWORD *)&v97[80];
    *(_OWORD *)((char *)&v99[7] + 1) = *(_OWORD *)&v97[96];
    *(_OWORD *)((char *)&v99[8] + 1) = *(_OWORD *)&v97[112];
    *(_OWORD *)((char *)&v99[1] + 1) = *(_OWORD *)v97;
    *(_OWORD *)((char *)&v99[2] + 1) = *(_OWORD *)&v97[16];
    *(_OWORD *)((char *)&v99[3] + 1) = *(_OWORD *)&v97[32];
    v99[0] = (unint64_t)v46;
    LOBYTE(v99[1]) = 1;
    BYTE1(v99[16]) = v97[240];
    *(_OWORD *)((char *)&v99[4] + 1) = *(_OWORD *)&v97[48];
    *((_QWORD *)&v99[16] + 1) = v48;
    LOBYTE(v99[17]) = v49;
    KeyPath = swift_getKeyPath(&unk_100023100);
    v52 = v75;
    v51 = v76;
    v53 = v77;
    (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v75, enum case for ColorScheme.dark(_:), v77);
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))((char *)v9 + *(int *)(v74 + 28), v52, v53);
    *v9 = KeyPath;
    v54 = v71;
    sub_1000038C4((uint64_t)v9, (uint64_t)&v71[*(int *)(v69 + 36)], &qword_100032FE0);
    memcpy(v54, v99, 0x111uLL);
    sub_100011768((uint64_t)v99);
    sub_100003A24((uint64_t)v9, &qword_100032FE0);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
    v55 = sub_100011870((uint64_t)&v83);
    v56 = static Color.black.getter(v55);
    LOBYTE(v53) = static Edge.Set.all.getter();
    v57 = v70;
    sub_1000038C4((uint64_t)v54, v70, &qword_100032FC0);
    v58 = v81;
    v59 = v57 + *(int *)(v81 + 36);
    *(_QWORD *)v59 = v56;
    *(_BYTE *)(v59 + 8) = v53;
    sub_100003A24((uint64_t)v54, &qword_100032FC0);
    v38 = &qword_100032FC8;
    v60 = v73;
    sub_100005D34(v57, v73, &qword_100032FC8);
    v61 = v80;
    sub_1000038C4(v60, v80, &qword_100032FC8);
    swift_storeEnumTagMultiPayload(v61, v78, 1);
    v62 = sub_100005E44(&qword_100032FF8, &qword_100032FD8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v63 = sub_10001197C();
    _ConditionalContent<>.init(storage:)(v61, v79, v58, v62, v63);
    v45 = v60;
  }
  else
  {
    v22 = static VerticalAlignment.center.getter(v21);
    sub_1000106B4((uint64_t *)v1, (uint64_t)&v83);
    *(_OWORD *)&v97[87] = v88;
    *(_OWORD *)&v97[103] = v89;
    *(_OWORD *)&v97[119] = v90;
    *(_OWORD *)&v97[23] = v84;
    *(_OWORD *)&v97[39] = v85;
    *(_OWORD *)&v97[55] = v86;
    *(_OWORD *)&v97[71] = v87;
    v98 = 1;
    *(_WORD *)&v97[135] = v91;
    *(_OWORD *)&v97[7] = v83;
    v24 = static SafeAreaRegions.all.getter(v23);
    v25 = static Edge.Set.all.getter();
    *(_OWORD *)((char *)&v99[6] + 1) = *(_OWORD *)&v97[80];
    *(_OWORD *)((char *)&v99[7] + 1) = *(_OWORD *)&v97[96];
    *(_OWORD *)((char *)&v99[8] + 1) = *(_OWORD *)&v97[112];
    *(_OWORD *)((char *)&v99[8] + 10) = *(_OWORD *)&v97[121];
    *(_OWORD *)((char *)&v99[2] + 1) = *(_OWORD *)&v97[16];
    *(_OWORD *)((char *)&v99[3] + 1) = *(_OWORD *)&v97[32];
    *(_OWORD *)((char *)&v99[4] + 1) = *(_OWORD *)&v97[48];
    *(_OWORD *)((char *)&v99[5] + 1) = *(_OWORD *)&v97[64];
    v99[0] = (unint64_t)v22;
    LOBYTE(v99[1]) = 1;
    *(_OWORD *)((char *)&v99[1] + 1) = *(_OWORD *)v97;
    *(_QWORD *)&v99[10] = v24;
    BYTE8(v99[10]) = v25;
    v26 = swift_getKeyPath(&unk_100023100);
    v28 = v75;
    v27 = v76;
    v29 = v77;
    (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v75, enum case for ColorScheme.dark(_:), v77);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v9 + *(int *)(v74 + 28), v28, v29);
    *v9 = v26;
    sub_1000038C4((uint64_t)v9, (uint64_t)v13 + *(int *)(v66 + 36), &qword_100032FE0);
    v30 = v99[9];
    v13[8] = v99[8];
    v13[9] = v30;
    *(_OWORD *)((char *)v13 + 153) = *(_OWORD *)((char *)&v99[9] + 9);
    v31 = v99[5];
    v13[4] = v99[4];
    v13[5] = v31;
    v32 = v99[7];
    v13[6] = v99[6];
    v13[7] = v32;
    v33 = v99[1];
    *v13 = v99[0];
    v13[1] = v33;
    v34 = v99[3];
    v13[2] = v99[2];
    v13[3] = v34;
    sub_100011B08((uint64_t)v99);
    sub_100003A24((uint64_t)v9, &qword_100032FE0);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    v35 = sub_100011C24((uint64_t)&v83);
    v36 = static Color.black.getter(v35);
    LOBYTE(v29) = static Edge.Set.all.getter();
    sub_1000038C4((uint64_t)v13, (uint64_t)v15, &qword_100032FE8);
    v37 = &v15[*(int *)(v67 + 36)];
    *(_QWORD *)v37 = v36;
    v37[8] = v29;
    sub_100003A24((uint64_t)v13, &qword_100032FE8);
    v38 = &qword_100032FF0;
    v39 = v68;
    sub_100005D34((uint64_t)v15, v68, &qword_100032FF0);
    sub_1000038C4(v39, (uint64_t)v15, &qword_100032FF0);
    v40 = (uint64_t)v72;
    *v72 = 0;
    *(_BYTE *)(v40 + 8) = 1;
    v41 = sub_10000383C(&qword_100033048);
    sub_1000038C4((uint64_t)v15, v40 + *(int *)(v41 + 48), &qword_100032FF0);
    sub_100003A24((uint64_t)v15, &qword_100032FF0);
    v42 = v80;
    sub_1000038C4(v40, v80, &qword_100032FD8);
    swift_storeEnumTagMultiPayload(v42, v78, 0);
    v43 = sub_100005E44(&qword_100032FF8, &qword_100032FD8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v44 = sub_10001197C();
    _ConditionalContent<>.init(storage:)(v42, v79, v81, v43, v44);
    sub_100003A24(v40, &qword_100032FD8);
    v45 = v39;
  }
  return sub_100003A24(v45, v38);
}

__n128 sub_1000106B4@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  int v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  Swift::String v41;
  Swift::String_optional v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t v45;
  _QWORD *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  int v53;
  int v54;
  double v55;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __n128 result;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[138];
  _BYTE v75[7];
  _BYTE v76[7];
  _DWORD v77[2];
  char v78;
  _DWORD v79[2];
  char v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  _BYTE v89[7];
  double v90;
  uint64_t v91;
  Swift::String v92;
  char v93;
  _BYTE v94[7];
  uint64_t (*v95)();
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  char v101;
  _OWORD v102[8];
  __int16 v103;
  Swift::String v104;

  v5 = a1[2];
  v4 = (void *)a1[3];
  v6 = *((unsigned __int8 *)a1 + 32);
  v7 = type metadata accessor for CameraCAFManager(0);
  v8 = sub_100005CF4(&qword_1000328F8, type metadata accessor for CameraCAFManager, (uint64_t)&unk_100023C60);
  v9 = (void *)StateObject.wrappedValue.getter(v5, v4, v6, v7, v8);
  KeyPath = swift_getKeyPath(&unk_100023130);
  v11 = swift_getKeyPath(&unk_100023158);
  static Published.subscript.getter(v9, KeyPath, v11);

  swift_release(KeyPath);
  v12 = swift_release(v11);
  v13 = *(_QWORD *)&v102[0];
  if (*(_QWORD *)&v102[0])
  {
    v73 = v5;
    v72 = swift_getKeyPath(&unk_100023178);
    v14 = type metadata accessor for CameraModel(0);
    v15 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
    v16 = EnvironmentObject.init()(v14, v15);
    v70 = v17;
    v71 = v16;
    v18 = static ObservableObject.environmentStore.getter(v14, v15);
    v19 = *(id *)&v102[0];
    v20 = static Edge.Set.bottom.getter(v19);
    v21 = v20;
    v22 = static Edge.Set.top.getter(v20);
    v23 = Edge.Set.init(rawValue:)(0);
    v24 = Edge.Set.init(rawValue:)(v23);
    if (Edge.Set.init(rawValue:)(v24 & v21) != v21)
      v23 = Edge.Set.init(rawValue:)(v23 | v21);
    v25 = Edge.Set.init(rawValue:)(v23);
    if (Edge.Set.init(rawValue:)(v25 & v22) != v22)
      LOBYTE(v23) = Edge.Set.init(rawValue:)(v23 | v22);
    v26 = EdgeInsets.init(_all:)(4.0);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v100 = *a1;
    v101 = *((_BYTE *)a1 + 8);
    v33 = swift_allocObject(&unk_10002D948, 80, 7);
    v34 = *((_OWORD *)a1 + 1);
    *(_OWORD *)(v33 + 24) = *(_OWORD *)a1;
    *(_QWORD *)(v33 + 16) = v19;
    *(_OWORD *)(v33 + 40) = v34;
    *(_OWORD *)(v33 + 56) = *((_OWORD *)a1 + 2);
    *(_QWORD *)(v33 + 72) = a1[6];
    LOBYTE(v79[0]) = 0;
    LOBYTE(v77[0]) = 0;
    v82 = v72;
    LOBYTE(v83) = 0;
    v84 = v71;
    v85 = v70;
    v86 = v18;
    v87 = v13;
    v88 = v23;
    v90 = v26;
    v91 = v28;
    v92._countAndFlagsBits = v30;
    v92._object = v32;
    v93 = 0;
    v95 = sub_100011E48;
    v96 = v33;
    v97 = 0;
    v98 = 0;
    sub_100011E64((uint64_t)&v82);
    sub_100005D34((uint64_t)&v82, (uint64_t)v74, &qword_100033050);
    sub_100006C7C((uint64_t)&v100);
    sub_100005470(v73, v4, v6);
    v35 = sub_10000383C(&qword_100033058);
    v36 = sub_10000383C(&qword_100033060);
    v37 = sub_100003970(&qword_100033068, &qword_100033058, (void (*)(void))sub_100011D58);
    v38 = sub_100005E44(&qword_100033098, &qword_100033060, (uint64_t)&protocol conformance descriptor for VStack<A>);
    _ConditionalContent<>.init(storage:)(v74, v35, v36, v37, v38);
  }
  else
  {
    v39 = static HorizontalAlignment.center.getter(v12);
    v40 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v104._object = (void *)0xE000000000000000;
    v41._countAndFlagsBits = 0x494C414954494E49;
    v41._object = (void *)0xEC000000474E495ALL;
    v42.value._countAndFlagsBits = 0x6172656D6143;
    v42.value._object = (void *)0xE600000000000000;
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    v104._countAndFlagsBits = 0;
    v44 = NSLocalizedString(_:tableName:bundle:value:comment:)(v41, v42, (NSBundle)v40, v43, v104);

    v45 = swift_getKeyPath(&unk_100023178);
    LOBYTE(v82) = 1;
    v46 = State.init(wrappedValue:)(v102, &v82, &type metadata for Bool);
    v47 = v102[0];
    v48 = *((_QWORD *)&v102[0] + 1);
    v49 = static Edge.Set.bottom.getter(v46);
    v50 = v49;
    v51 = static Edge.Set.top.getter(v49);
    v52 = Edge.Set.init(rawValue:)(0);
    v53 = Edge.Set.init(rawValue:)(v52);
    if (Edge.Set.init(rawValue:)(v53 & v50) != v50)
      v52 = Edge.Set.init(rawValue:)(v52 | v50);
    v54 = Edge.Set.init(rawValue:)(v52);
    if (Edge.Set.init(rawValue:)(v54 & v51) != v51)
      LOBYTE(v52) = Edge.Set.init(rawValue:)(v52 | v51);
    v55 = EdgeInsets.init(_all:)(4.0);
    v57 = v56;
    v59 = v58;
    v61 = v60;
    sub_100003AF0(v45, 0);
    swift_retain(v48);
    swift_bridgeObjectRetain(v44._object);
    sub_100003B28(v45, 0);
    swift_bridgeObjectRelease();
    swift_release(v48);
    v81 = 1;
    v80 = 1;
    v78 = 0;
    v74[136] = 0;
    *(_DWORD *)((char *)&v84 + 1) = v100;
    HIDWORD(v84) = *(_DWORD *)((char *)&v100 + 3);
    *(_DWORD *)((char *)&v86 + 1) = v79[0];
    HIDWORD(v86) = *(_DWORD *)((char *)v79 + 3);
    *(_DWORD *)&v89[3] = *(_DWORD *)((char *)v77 + 3);
    *(_DWORD *)v89 = v77[0];
    HIDWORD(v90) = *(_DWORD *)&v76[3];
    *(_DWORD *)((char *)&v90 + 1) = *(_DWORD *)v76;
    *(_DWORD *)&v94[3] = *(_DWORD *)&v75[3];
    *(_DWORD *)v94 = *(_DWORD *)v75;
    v82 = v39;
    v83 = 0;
    LOBYTE(v84) = 1;
    v85 = 0;
    LOBYTE(v86) = 1;
    v87 = v45;
    v88 = 0;
    LOBYTE(v90) = v47;
    v91 = v48;
    v92 = v44;
    v93 = v52;
    v95 = *(uint64_t (**)())&v55;
    v96 = v57;
    v97 = v59;
    v98 = v61;
    v99 = 0;
    sub_100011D4C((uint64_t)&v82);
    sub_100005D34((uint64_t)&v82, (uint64_t)v74, &qword_100033050);
    v62 = sub_10000383C(&qword_100033058);
    v63 = sub_10000383C(&qword_100033060);
    v64 = sub_100003970(&qword_100033068, &qword_100033058, (void (*)(void))sub_100011D58);
    v65 = sub_100005E44(&qword_100033098, &qword_100033060, (uint64_t)&protocol conformance descriptor for VStack<A>);
    _ConditionalContent<>.init(storage:)(v74, v62, v63, v64, v65);
  }
  v66 = v102[7];
  *(_OWORD *)(a2 + 96) = v102[6];
  *(_OWORD *)(a2 + 112) = v66;
  *(_WORD *)(a2 + 128) = v103;
  v67 = v102[3];
  *(_OWORD *)(a2 + 32) = v102[2];
  *(_OWORD *)(a2 + 48) = v67;
  v68 = v102[5];
  *(_OWORD *)(a2 + 64) = v102[4];
  *(_OWORD *)(a2 + 80) = v68;
  result = (__n128)v102[1];
  *(_OWORD *)a2 = v102[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100010CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  __int128 v48;
  _BYTE v49[144];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  _BYTE v54[214];
  char v55;
  _QWORD v56[2];
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  _OWORD v73[8];
  char v74;
  _BYTE v75[136];
  char v76;
  char v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(unsigned __int8 *)(a1 + 32);
  v7 = type metadata accessor for CameraCAFManager(0);
  v8 = sub_100005CF4(&qword_1000328F8, type metadata accessor for CameraCAFManager, (uint64_t)&unk_100023C60);
  v41 = v4;
  v9 = (char *)StateObject.wrappedValue.getter(v4, v5, v6, v7, v8);
  v10 = objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus], "currentSession");
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "configuration");

    LOBYTE(v11) = objc_msgSend(v12, "rightHandDrive");
    if ((v11 & 1) != 0)
    {
      v46 = 0;
      v47 = 1;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v46 = 1;
  v47 = 0;
LABEL_6:
  v14 = static VerticalAlignment.center.getter(v13);
  sub_1000110B4((uint64_t *)a1, (uint64_t)v73);
  *(_OWORD *)&v75[87] = v73[5];
  *(_OWORD *)&v75[103] = v73[6];
  *(_OWORD *)&v75[119] = v73[7];
  *(_OWORD *)&v75[23] = v73[1];
  *(_OWORD *)&v75[39] = v73[2];
  *(_OWORD *)&v75[55] = v73[3];
  *(_OWORD *)&v75[71] = v73[4];
  v76 = 1;
  v75[135] = v74;
  *(_OWORD *)&v75[7] = v73[0];
  v16 = static Alignment.center.getter(v15);
  _FrameLayout.init(width:height:alignment:)(&v79, 0x4046000000000000, 0, 0, 1, v16, v17);
  v44 = v81;
  v45 = v79;
  v42 = v84;
  v43 = v83;
  v78 = v80;
  v77 = v82;
  v18 = (char *)StateObject.wrappedValue.getter(v41, v5, v6, v7, v8);
  v19 = objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus], "currentSession");
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "configuration");

    LOBYTE(v20) = objc_msgSend(v21, "rightHandDrive");
    v22 = v20 ^ 1;
  }
  else
  {

    v22 = 1;
  }
  v48 = (unint64_t)v14;
  v49[0] = 1;
  v23 = *(_OWORD *)&v75[80];
  *(_OWORD *)&v49[97] = *(_OWORD *)&v75[96];
  v24 = *(_OWORD *)&v75[64];
  *(_OWORD *)&v49[81] = *(_OWORD *)&v75[80];
  v25 = *(_OWORD *)&v75[96];
  *(_OWORD *)&v49[113] = *(_OWORD *)&v75[112];
  v26 = *(_QWORD *)&v75[128];
  *(_QWORD *)&v49[129] = *(_QWORD *)&v75[128];
  v27 = *(_OWORD *)v75;
  *(_OWORD *)&v49[17] = *(_OWORD *)&v75[16];
  v28 = *(_OWORD *)&v75[16];
  *(_OWORD *)&v49[33] = *(_OWORD *)&v75[32];
  v29 = *(_OWORD *)&v75[32];
  *(_OWORD *)&v49[49] = *(_OWORD *)&v75[48];
  v30 = *(_OWORD *)&v75[48];
  *(_OWORD *)&v49[65] = *(_OWORD *)&v75[64];
  *(_OWORD *)&v49[1] = *(_OWORD *)v75;
  *(_OWORD *)&v54[150] = *(_OWORD *)&v49[128];
  *(_OWORD *)&v54[86] = *(_OWORD *)&v49[64];
  *(_OWORD *)&v54[102] = *(_OWORD *)&v49[80];
  *(_OWORD *)&v54[118] = *(_OWORD *)&v49[96];
  *(_OWORD *)&v54[134] = *(_OWORD *)&v49[112];
  *(_OWORD *)&v54[22] = *(_OWORD *)v49;
  *(_OWORD *)&v54[38] = *(_OWORD *)&v49[16];
  *(_OWORD *)&v54[54] = *(_OWORD *)&v49[32];
  v31 = v78;
  v32 = v77;
  *(_QWORD *)&v50 = v45;
  BYTE8(v50) = v78;
  *(_QWORD *)&v51 = v44;
  BYTE8(v51) = v77;
  *(_QWORD *)&v52 = v43;
  *((_QWORD *)&v52 + 1) = v42;
  *(_OWORD *)&v54[70] = *(_OWORD *)&v49[48];
  *(_OWORD *)&v54[6] = (unint64_t)v14;
  *(_OWORD *)&v54[166] = v50;
  *(_OWORD *)&v54[182] = v51;
  *(_OWORD *)&v54[198] = v52;
  v33 = *(_OWORD *)&v54[176];
  *(_OWORD *)(a2 + 170) = *(_OWORD *)&v54[160];
  *(_OWORD *)(a2 + 186) = v33;
  *(_OWORD *)(a2 + 202) = *(_OWORD *)&v54[192];
  v34 = *(_OWORD *)&v54[112];
  *(_OWORD *)(a2 + 106) = *(_OWORD *)&v54[96];
  *(_OWORD *)(a2 + 122) = v34;
  v35 = *(_OWORD *)&v54[144];
  *(_OWORD *)(a2 + 138) = *(_OWORD *)&v54[128];
  *(_OWORD *)(a2 + 154) = v35;
  v36 = *(_OWORD *)&v54[48];
  *(_OWORD *)(a2 + 42) = *(_OWORD *)&v54[32];
  *(_OWORD *)(a2 + 58) = v36;
  v37 = *(_OWORD *)&v54[80];
  *(_OWORD *)(a2 + 74) = *(_OWORD *)&v54[64];
  *(_OWORD *)(a2 + 90) = v37;
  v38 = *(_OWORD *)&v54[16];
  *(_OWORD *)(a2 + 10) = *(_OWORD *)v54;
  *(_OWORD *)(a2 + 26) = v38;
  v63 = v23;
  v64 = v25;
  v65 = *(_OWORD *)&v75[112];
  v59 = v28;
  v60 = v29;
  v61 = v30;
  v62 = v24;
  v55 = v46;
  v53 = (char)v20;
  v39 = *(_QWORD *)&v54[206];
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v47;
  *(_BYTE *)(a2 + 9) = v46;
  *(_QWORD *)(a2 + 216) = v39;
  *(_QWORD *)(a2 + 224) = 0;
  *(_BYTE *)(a2 + 232) = v22;
  *(_BYTE *)(a2 + 233) = (_BYTE)v20;
  v56[0] = v14;
  v56[1] = 0;
  v57 = 1;
  v66 = v26;
  v58 = v27;
  v67 = v45;
  v68 = v31;
  v69 = v44;
  v70 = v32;
  v71 = v43;
  v72 = v42;
  sub_100011E6C((uint64_t)&v48, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1000117C8);
  return sub_100011E6C((uint64_t)v56, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1000118D4);
}

__n128 sub_1000110B4@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __n128 result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[136];
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  char v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t (*v57)();
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  _OWORD v63[8];
  char v64;

  v5 = a1[2];
  v4 = (void *)a1[3];
  v6 = *((unsigned __int8 *)a1 + 32);
  v7 = type metadata accessor for CameraCAFManager(0);
  v8 = sub_100005CF4(&qword_1000328F8, type metadata accessor for CameraCAFManager, (uint64_t)&unk_100023C60);
  v9 = (void *)StateObject.wrappedValue.getter(v5, v4, v6, v7, v8);
  KeyPath = swift_getKeyPath(&unk_100023130);
  v11 = swift_getKeyPath(&unk_100023158);
  static Published.subscript.getter(v9, KeyPath, v11);

  swift_release(KeyPath);
  swift_release(v11);
  v12 = *(_QWORD *)&v63[0];
  if (*(_QWORD *)&v63[0])
  {
    v44 = v5;
    v43 = swift_getKeyPath(&unk_100023178);
    v13 = type metadata accessor for CameraModel(0);
    v14 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
    v15 = EnvironmentObject.init()(v13, v14);
    v41 = v16;
    v42 = v15;
    v17 = static ObservableObject.environmentStore.getter(v13, v14);
    v18 = *(id *)&v63[0];
    v19 = static Edge.Set.leading.getter(v18);
    v20 = static Edge.Set.trailing.getter();
    v21 = Edge.Set.init(rawValue:)(0);
    v22 = Edge.Set.init(rawValue:)(v21);
    if (Edge.Set.init(rawValue:)(v22 & v19) != v19)
      v21 = Edge.Set.init(rawValue:)(v21 | v19);
    v23 = Edge.Set.init(rawValue:)(v21);
    if (Edge.Set.init(rawValue:)(v23 & v20) != v20)
      LOBYTE(v21) = Edge.Set.init(rawValue:)(v21 | v20);
    v24 = EdgeInsets.init(_all:)(4.0);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v61 = *a1;
    v62 = *((_BYTE *)a1 + 8);
    v31 = swift_allocObject(&unk_10002D970, 80, 7);
    v32 = *((_OWORD *)a1 + 1);
    *(_OWORD *)(v31 + 24) = *(_OWORD *)a1;
    *(_QWORD *)(v31 + 16) = v18;
    *(_OWORD *)(v31 + 40) = v32;
    *(_OWORD *)(v31 + 56) = *((_OWORD *)a1 + 2);
    *(_QWORD *)(v31 + 72) = a1[6];
    v46 = v43;
    v47 = 0;
    v48 = v42;
    v49 = v41;
    *(_QWORD *)&v50 = v17;
    *((_QWORD *)&v50 + 1) = v12;
    v51 = v21;
    v52 = v24;
    v53 = v26;
    v54 = v28;
    v55 = v30;
    v56 = 0;
    v57 = sub_100011FF4;
    v58 = v31;
    v59 = 0;
    v60 = 0;
    sub_100011F64((uint64_t)&v46);
    sub_100005D34((uint64_t)&v46, (uint64_t)v45, &qword_1000330A0);
    sub_100006C7C((uint64_t)&v61);
    sub_100005470(v44, v4, v6);
  }
  else
  {
    v33 = swift_getKeyPath(&unk_100023178);
    LOBYTE(v46) = 1;
    State.init(wrappedValue:)(v63, &v46, &type metadata for Bool);
    v46 = v33;
    v47 = 0;
    LOBYTE(v48) = v63[0];
    v49 = *((_QWORD *)&v63[0] + 1);
    v50 = xmmword_100023090;
    sub_100011ED4((uint64_t)&v46);
    sub_100005D34((uint64_t)&v46, (uint64_t)v45, &qword_1000330A0);
  }
  v34 = sub_10000383C(&qword_100033058);
  v35 = sub_100003970(&qword_100033068, &qword_100033058, (void (*)(void))sub_100011D58);
  v36 = sub_100011EE0();
  _ConditionalContent<>.init(storage:)(v45, v34, &type metadata for CameraSpinnerView, v35, v36);
  v37 = v63[7];
  *(_OWORD *)(a2 + 96) = v63[6];
  *(_OWORD *)(a2 + 112) = v37;
  *(_BYTE *)(a2 + 128) = v64;
  v38 = v63[3];
  *(_OWORD *)(a2 + 32) = v63[2];
  *(_OWORD *)(a2 + 48) = v38;
  v39 = v63[5];
  *(_OWORD *)(a2 + 64) = v63[4];
  *(_OWORD *)(a2 + 80) = v39;
  result = (__n128)v63[1];
  *(_OWORD *)a2 = v63[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100011444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v3;
  double v4;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController);
  v3 = *(double *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize);
  v4 = *(double *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize + 8);
  *(_OWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize) = *(_OWORD *)(a2 + 40);
  swift_retain(v2);
  sub_10001B468(v3, v4);
  return swift_release(v2);
}

uint64_t sub_1000114A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FECC(a1);
}

void destroy for ContentView(uint64_t a1)
{
  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_1000054AC(*(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for ContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(void **)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  sub_100005470(v6, v7, v8);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for ContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  char v13;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(void **)(a2 + 24);
  v10 = *(_BYTE *)(a2 + 32);
  sub_100005470(v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(void **)(a1 + 24);
  v13 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = v10;
  sub_1000054AC(v11, v12, v13);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for ContentView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *((_BYTE *)a2 + 32);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(void **)(a1 + 24);
  v11 = *(_BYTE *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_BYTE *)(a1 + 32) = v8;
  sub_1000054AC(v9, v10, v11);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_100011750(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024F4C, 1);
}

uint64_t sub_100011768(uint64_t a1)
{
  sub_1000117C8(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(void **)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(void **)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_BYTE *)(a1 + 192));
  return a1;
}

void sub_1000117C8(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  id v21;
  id v22;

  if ((a17 & 1) != 0)
  {
    sub_100003AF0(a1, a2 & 1);
    swift_bridgeObjectRetain(a6);
    swift_retain(a4);
  }
  else
  {
    sub_100003AF0(a1, a2 & 1);
    v21 = a6;
    v22 = a3;
    swift_retain(a5);
    sub_100006A44(a13, a14);
    sub_100006A44(a15, a16);
  }
}

uint64_t sub_100011870(uint64_t a1)
{
  sub_1000118D4(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(void **)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_BYTE *)(a1 + 168));
  return a1;
}

uint64_t sub_1000118D4(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if ((a17 & 1) != 0)
  {
    sub_100003B28(a1, a2 & 1);
    swift_release(a4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100003B28(a1, a2 & 1);
    swift_release(a5);

    sub_100006B6C(a13, a14);
    return sub_100006B6C(a15, a16);
  }
}

unint64_t sub_10001197C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033000;
  if (!qword_100033000)
  {
    v1 = sub_100003908(&qword_100032FC8);
    sub_100011A00();
    sub_100005E44(&qword_100033038, &qword_100033040, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033000);
  }
  return result;
}

unint64_t sub_100011A00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033008;
  if (!qword_100033008)
  {
    v1 = sub_100003908(&qword_100032FC0);
    sub_100011A84();
    sub_100005E44(&qword_100033030, &qword_100032FE0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033008);
  }
  return result;
}

unint64_t sub_100011A84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033010;
  if (!qword_100033010)
  {
    v1 = sub_100003908(&qword_100033018);
    sub_100005E44(&qword_100033020, &qword_100033028, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033010);
  }
  return result;
}

uint64_t sub_100011B08(uint64_t a1)
{
  sub_100011B74(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_BYTE *)(a1 + 152), *(_BYTE *)(a1 + 153));
  return a1;
}

void sub_100011B74(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  id v21;
  id v22;

  if ((a18 & 1) != 0)
  {
    sub_100003AF0((uint64_t)a6, a7 & 1);
    swift_bridgeObjectRetain(a11);
    swift_retain(a9);
  }
  else
  {
    sub_100003AF0(a1, a2 & 1);
    v21 = a6;
    v22 = a3;
    swift_retain(a5);
    sub_100006A44(a13, a14);
    sub_100006A44(a15, a16);
  }
}

uint64_t sub_100011C24(uint64_t a1)
{
  sub_100011C8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128), *(_BYTE *)(a1 + 129));
  return a1;
}

uint64_t sub_100011C8C(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  if ((a18 & 1) != 0)
  {
    sub_100003B28((uint64_t)a6, a7 & 1);
    swift_release(a9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100003B28(a1, a2 & 1);
    swift_release(a5);

    sub_100006B6C(a13, a14);
    return sub_100006B6C(a15, a16);
  }
}

uint64_t sub_100011D4C(uint64_t result)
{
  *(_BYTE *)(result + 129) = 1;
  return result;
}

uint64_t sub_100011D58()
{
  return sub_100003970(&qword_100033070, &qword_100033078, (void (*)(void))sub_100011D7C);
}

unint64_t sub_100011D7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033080;
  if (!qword_100033080)
  {
    v1 = sub_100003908(&qword_100033088);
    sub_100011E00();
    sub_100005E44(&qword_100032868, &qword_100032870, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033080);
  }
  return result;
}

unint64_t sub_100011E00()
{
  unint64_t result;

  result = qword_100033090;
  if (!qword_100033090)
  {
    result = swift_getWitnessTable(&unk_1000231B0, &type metadata for CameraView);
    atomic_store(result, (unint64_t *)&qword_100033090);
  }
  return result;
}

uint64_t sub_100011E48()
{
  uint64_t v0;

  return sub_100011444(*(_QWORD *)(v0 + 16), v0 + 24);
}

uint64_t sub_100011E64(uint64_t result)
{
  *(_BYTE *)(result + 129) = 0;
  return result;
}

uint64_t sub_100011E6C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 152);
  a2(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), v4);
  return a1;
}

uint64_t sub_100011ED4(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

unint64_t sub_100011EE0()
{
  unint64_t result;

  result = qword_1000330A8;
  if (!qword_1000330A8)
  {
    result = swift_getWitnessTable(&unk_100022D34, &type metadata for CameraSpinnerView);
    atomic_store(result, (unint64_t *)&qword_1000330A8);
  }
  return result;
}

uint64_t sub_100011F28()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  sub_1000054AC(*(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100011F64(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

unint64_t sub_100011F70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000330B0;
  if (!qword_1000330B0)
  {
    v1 = sub_100003908(&qword_1000330B8);
    sub_100005E44(&qword_100032FF8, &qword_100032FD8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    sub_10001197C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000330B0);
  }
  return result;
}

uint64_t initializeWithCopy for CameraView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v8 = v6;
  return a1;
}

uint64_t assignWithCopy for CameraView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *(void **)(a1 + 16);
  v9 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  v10 = v9;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for CameraView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for CameraView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  *(_QWORD *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraView()
{
  return &type metadata for CameraView;
}

uint64_t sub_1000121E0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024F90, 1);
}

uint64_t sub_1000121F0@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  _BYTE v44[136];
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t KeyPath;
  char v52;
  uint64_t v53;
  char v54;
  id v55;
  char v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int16 v70;

  v9 = a2 & 1;
  sub_100003AF0(a1, a2 & 1);
  v10 = sub_100008D3C(a1, v9);
  v11 = sub_100003B28(a1, v9);
  v12 = static HorizontalAlignment.center.getter(v11);
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    v31 = static HorizontalAlignment.center.getter(v12);
    if (a3)
    {
      v45 = v13;
      v46 = 0;
      v47 = 1;
      v48 = v31;
      v49 = 0;
      LOBYTE(v50) = 1;
      KeyPath = swift_getKeyPath(&unk_100023200);
      v52 = 0;
      v53 = (uint64_t)a3;
      sub_100011D4C((uint64_t)&v45);
      sub_1000124DC((uint64_t)&v45, (uint64_t)v44);
      v32 = a3;
LABEL_10:
      v33 = sub_10000383C(&qword_1000330C8);
      v34 = sub_10000383C(&qword_1000330D0);
      v35 = sub_100012524(&qword_1000330D8, &qword_1000330C8);
      v36 = sub_100012524(&qword_1000330E0, &qword_1000330D0);
      result = _ConditionalContent<>.init(storage:)(v44, v33, v34, v35, v36);
      v38 = v69;
      *(_OWORD *)(a5 + 96) = v68;
      *(_OWORD *)(a5 + 112) = v38;
      *(_WORD *)(a5 + 128) = v70;
      v39 = v65;
      *(_OWORD *)(a5 + 32) = v64;
      *(_OWORD *)(a5 + 48) = v39;
      v40 = v67;
      *(_OWORD *)(a5 + 64) = v66;
      *(_OWORD *)(a5 + 80) = v40;
      v41 = v63;
      *(_OWORD *)a5 = v62;
      *(_OWORD *)(a5 + 16) = v41;
      return result;
    }
  }
  else
  {
    v14 = static VerticalAlignment.center.getter(v12);
    if (a3)
    {
      v15 = v14;
      v16 = swift_getKeyPath(&unk_100023200);
      v17 = a3;
      v18 = static Edge.Set.leading.getter(v17);
      v19 = static Edge.Set.trailing.getter();
      v20 = Edge.Set.init(rawValue:)(0);
      v21 = Edge.Set.init(rawValue:)(v20);
      if (Edge.Set.init(rawValue:)(v21 & v18) != v18)
        v20 = Edge.Set.init(rawValue:)(v20 | v18);
      v22 = Edge.Set.init(rawValue:)(v20);
      if (Edge.Set.init(rawValue:)(v22 & v19) != v19)
        LOBYTE(v20) = Edge.Set.init(rawValue:)(v20 | v19);
      v23 = EdgeInsets.init(_all:)(4.0);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      sub_100003AF0(v16, 0);
      v30 = v17;
      sub_100003B28(v16, 0);

      v45 = v13;
      v46 = 0;
      v47 = 1;
      v48 = 0;
      LOBYTE(v49) = 1;
      v50 = v15;
      KeyPath = 0;
      v52 = 1;
      v53 = v16;
      v54 = 0;
      v55 = v30;
      v56 = v20;
      v57 = v23;
      v58 = v25;
      v59 = v27;
      v60 = v29;
      v61 = 0;
      sub_100011E64((uint64_t)&v45);
      sub_1000124DC((uint64_t)&v45, (uint64_t)v44);
      goto LABEL_10;
    }
  }
  v42 = type metadata accessor for CameraModel(0);
  v43 = sub_100009078();
  result = EnvironmentObject.error()(0, a4, v42, v43);
  __break(1u);
  return result;
}

uint64_t sub_1000124BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000121F0(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1000124DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000383C(&qword_1000330C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012524(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100003908(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012568()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000330E8;
  if (!qword_1000330E8)
  {
    v1 = sub_100003908(&qword_1000330F0);
    sub_100012524(&qword_1000330D8, &qword_1000330C8);
    sub_100012524(&qword_1000330E0, &qword_1000330D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000330E8);
  }
  return result;
}

uint64_t sub_1000125F4@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  char *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[80];
  _BYTE v31[80];
  __int128 v32;
  void *v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[2];

  v2 = v1;
  v4 = *(_QWORD *)&v1[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8];
  sub_100013020(v4, v5, (uint64_t)v30);
  sub_10000F23C((uint64_t)v30, (uint64_t)&v40);
  if (*((_QWORD *)&v40 + 1)
    && (v41 = v40,
        sub_100005C78((uint64_t)&v41),
        v6 = sub_10000F284((uint64_t)v30),
        v7 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v6),
        sub_100005CA0((uint64_t)&v41),
        (v7 & 0x100) == 0)
    && (_BYTE)v7)
  {
    v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents];
    v9 = v2;
    v10 = swift_bridgeObjectRetain(v8);
    v11 = sub_1000148C0(v10);
    swift_bridgeObjectRelease();

    sub_100013020(v4, v5, (uint64_t)v31);
    result = sub_10000F23C((uint64_t)v31, (uint64_t)&v32);
    if (*((_QWORD *)&v32 + 1)
      && (v42[0] = v32,
          sub_100005C78((uint64_t)v42),
          v13 = sub_10000F284((uint64_t)v31),
          v14 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v13),
          result = sub_100005CA0((uint64_t)v42),
          (v14 & 0x100) == 0)
      && (_BYTE)v14)
    {
      v15 = v14 - 1;
      if (v15 < v11[2])
      {
        v16 = &v11[10 * (int)v15];
        v18 = v16[4];
        v17 = (void *)v16[5];
        v20 = (void *)v16[6];
        v19 = v16[7];
        v21 = *((_BYTE *)v16 + 64);
        v29 = *(_OWORD *)(v16 + 9);
        v22 = *((_BYTE *)v16 + 88);
        v23 = v16[12];
        v24 = *((_BYTE *)v16 + 104);
        v25 = v20;
        v26 = v17;
        sub_100003AF0(v19, v21);
        swift_retain(v23);
        v27 = (id)v29;
        result = swift_bridgeObjectRelease();
        v28 = v29;
LABEL_11:
        *(_QWORD *)a1 = v18;
        *(_QWORD *)(a1 + 8) = v26;
        *(_QWORD *)(a1 + 16) = v20;
        *(_QWORD *)(a1 + 24) = v19;
        *(_BYTE *)(a1 + 32) = v21;
        *(_OWORD *)(a1 + 40) = v28;
        *(_BYTE *)(a1 + 56) = v22;
        *(_QWORD *)(a1 + 64) = v23;
        *(_BYTE *)(a1 + 72) = v24;
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    sub_100013020(v4, v5, (uint64_t)v31);
    result = sub_10000F23C((uint64_t)v31, (uint64_t)&v32);
    v26 = (id)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v18 = v32;
      v20 = v33;
      v19 = v34;
      v28 = v36;
      v23 = v38;
      v24 = v39 & 1;
      v22 = v37 & 1;
      v21 = v35 & 1;
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100012838(uint64_t a1, unint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int16 v7;
  _QWORD *v8;
  uint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  _BYTE v26[80];
  _BYTE v27[80];
  _BYTE v28[80];
  __int128 v29;
  __int128 v30;
  _OWORD v31[3];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;

  v3 = v2;
  sub_100013020(a1, a2, (uint64_t)v26);
  sub_10000F23C((uint64_t)v26, (uint64_t)v31);
  if (!*((_QWORD *)&v31[0] + 1))
    return (uint64_t)_swiftEmptyArrayStorage;
  v35 = v31[2];
  v36[0] = v32[0];
  *(_OWORD *)((char *)v36 + 9) = *(_OWORD *)((char *)v32 + 9);
  v33 = v31[0];
  v34 = v31[1];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8];
  sub_100013020(v4, v5, (uint64_t)v27);
  sub_10000F23C((uint64_t)v27, (uint64_t)&v30);
  if (*((_QWORD *)&v30 + 1))
  {
    v37 = v30;
    sub_100005C78((uint64_t)&v37);
    v6 = sub_10000F284((uint64_t)v27);
    v7 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v6);
    sub_100005CA0((uint64_t)&v37);
    if ((v7 & 0x100) == 0)
    {
      if ((_BYTE)v7)
      {
        v8 = *(_QWORD **)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents];
        swift_bridgeObjectRetain(v8);
        sub_100013020(v4, v5, (uint64_t)v28);
        sub_10000F23C((uint64_t)v28, (uint64_t)&v29);
        if (!*((_QWORD *)&v29 + 1)
          || (v38 = v29,
              sub_100005C78((uint64_t)&v38),
              v9 = sub_10000F284((uint64_t)v28),
              v10 = dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.getter(v9),
              sub_100005CA0((uint64_t)&v38),
              (v10 & 0x100) != 0))
        {
          v11 = -1;
        }
        else
        {
          v11 = v10 - 1;
        }
        swift_bridgeObjectRetain(v5);
        result = swift_isUniquelyReferenced_nonNull_native(v8);
        if ((result & 1) != 0)
        {
          if ((v11 & 0x8000000000000000) == 0)
            goto LABEL_13;
        }
        else
        {
          result = (uint64_t)sub_10000EEB4(v8);
          v8 = (_QWORD *)result;
          if ((v11 & 0x8000000000000000) == 0)
          {
LABEL_13:
            if (v11 < v8[2])
            {
              v17 = &v8[2 * v11];
              v17[4] = v4;
              v17[5] = v5;
              swift_bridgeObjectRelease();
              v18 = v3;
              v19 = swift_bridgeObjectRetain(v8);
              v15 = sub_1000148C0(v19);
              swift_bridgeObjectRelease_n(v8, 2);
              goto LABEL_15;
            }
LABEL_19:
            __break(1u);
            return result;
          }
        }
        __break(1u);
        goto LABEL_19;
      }
    }
  }
  v12 = *(_QWORD *)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents];
  v13 = v3;
  v14 = swift_bridgeObjectRetain(v12);
  v15 = sub_1000148C0(v14);
  swift_bridgeObjectRelease();
LABEL_15:

  v20 = sub_10000383C(&qword_100032EB8);
  v21 = (_OWORD *)swift_allocObject(v20, 112, 7);
  v22 = v35;
  v23 = v36[0];
  v24 = v33;
  v21[3] = v34;
  v21[4] = v22;
  v21[5] = v23;
  *(_OWORD *)((char *)v21 + 89) = *(_OWORD *)((char *)v36 + 9);
  v21[1] = xmmword_100023230;
  v21[2] = v24;
  v25 = v21;
  sub_1000139D0((uint64_t)v15);
  return (uint64_t)v25;
}

void sub_100012AA8(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint8_t *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _BYTE v30[72];
  uint64_t v31[10];
  _OWORD v32[2];

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100012F3C(a1, a2, *(_QWORD **)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_identFlatList]);
  if ((v10 & 1) == 0)
  {
    v11 = v9;
    sub_100013020(*(_QWORD *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent], *(_QWORD *)&v2[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent + 8], (uint64_t)&v29);
    sub_10000F23C((uint64_t)&v29, (uint64_t)v31);
    if (v31[1])
    {
      v32[0] = *(_OWORD *)v31;
      sub_100005C78((uint64_t)v32);
      sub_10000F284((uint64_t)&v29);
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_20;
      if (v11 >= 0x100)
        goto LABEL_21;
      dispatch thunk of CAFCameraButtonObservable.selectedEntryIndex.setter(v11);
      sub_100005CA0((uint64_t)v32);
    }
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v12 = sub_100007524(v5, (uint64_t)qword_1000350A8);
    v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_13;
    v16 = (uint8_t *)swift_slowAlloc(5, -1);
    *(_DWORD *)v16 = 16777472;
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11 < 0x100)
      {
        if ((((v11 + 1) >> 8) & 1) == 0)
        {
          v17 = v16;
          v28 = v11 + 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v16 + 4, v16 + 5);
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "[CameraButtonGroup] promoteChild updating selectedEntryIndex %hhu", v17, 5u);
          swift_slowDealloc(v17, -1, -1);
LABEL_13:

          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          return;
        }
        __break(1u);
        goto LABEL_20;
      }
LABEL_21:
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
      goto LABEL_22;
    }
LABEL_20:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
LABEL_22:
    __break(1u);
    return;
  }
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  sub_100007524(v5, (uint64_t)qword_1000350A8);
  swift_bridgeObjectRetain_n(a2, 2);
  v18 = v2;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v22 = swift_slowAlloc(64, -1);
    v31[0] = v22;
    *(_DWORD *)v21 = 136315394;
    swift_bridgeObjectRetain(a2);
    v29 = sub_10000934C(a1, a2, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v21 + 12) = 2080;
    v23 = swift_bridgeObjectRetain(*(_QWORD *)&v18[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents]);
    v24 = Array.description.getter(v23, &type metadata for String);
    v26 = v25;
    swift_bridgeObjectRelease();
    v29 = sub_10000934C(v24, v26, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v21 + 14, v21 + 22);

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "[CameraButtonGroup] promoteChild failed finding child %s in parent child list %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
}

uint64_t sub_100012F3C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  v9 = v7 == a1 && v8 == a2;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0) & 1) != 0)
    return 0;
  v11 = 0;
  v12 = a3 + 7;
  v13 = 1;
  while (1)
  {
    if (v3 == v13)
      return 0;
    ++v11;
    v14 = *(v12 - 1);
    v15 = *v12;
    if (v14 == a1 && v15 == a2)
      break;
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0);
    result = v13++;
    v12 += 2;
    if ((v17 & 1) != 0)
      return result;
  }
  return v11;
}

void sub_100013020(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v3;
  void *v4;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  id v22;
  id v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unsigned int v57;
  id v58;
  uint64_t v59;
  uint64_t KeyPath;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66[24];
  char v67[24];
  __int128 v68;
  void *v69;
  uint64_t v70;
  char v71;
  void *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;

  v4 = v3;
  v8 = *(_QWORD *)&v3[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_model];
  v9 = (uint64_t *)(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict);
  swift_beginAccess(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict, v67, 0, 0);
  v10 = *v9;
  if (!*(_QWORD *)(*v9 + 16))
  {
LABEL_5:
    v28 = (uint64_t *)(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict);
    swift_beginAccess(v8 + OBJC_IVAR____TtC9CarCamera11CameraModel_serviceDict, v66, 0, 0);
    v29 = *v28;
    if (*(_QWORD *)(v29 + 16))
    {
      swift_bridgeObjectRetain(a2);
      swift_bridgeObjectRetain(v29);
      v30 = sub_10000D748(a1, a2);
      if ((v31 & 1) != 0)
      {
        v58 = *(id *)(*(_QWORD *)(v29 + 56) + 8 * v30);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v32 = sub_10001398C();
        v33 = sub_100005CF4(&qword_100033140, (uint64_t (*)(uint64_t))sub_10001398C, (uint64_t)&protocol conformance descriptor for CAFCameraButton);
        v34 = CAFObserved<>.observable.getter(v32, v33);
        KeyPath = swift_getKeyPath(&unk_100023290);
        v35 = type metadata accessor for CameraModel(0);
        v36 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
        v37 = (void *)EnvironmentObject.init()(v35, v36);
        v39 = v38;
        v56 = a1;
        v40 = type metadata accessor for CAFCameraButtonObservable(0);
        v41 = sub_100005CF4(&qword_100033148, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCameraButtonObservable, (uint64_t)&protocol conformance descriptor for CAFCameraButtonObservable);
        v55 = v4;
        v42 = v41;
        v27 = v39;
        v62 = ObservedObject.init(wrappedValue:)(v34, v40, v42);
        v44 = v43;
        LOBYTE(v64) = 0;
        State.init(wrappedValue:)(&v68, &v64, &type metadata for Bool);
        LODWORD(v39) = v68;
        v19 = *((_QWORD *)&v68 + 1);
        *(_QWORD *)&v68 = v62;
        *((_QWORD *)&v68 + 1) = v44;
        v69 = v4;
        v70 = KeyPath;
        v71 = 0;
        v72 = v37;
        v73 = v27;
        v74 = v39;
        v75 = v19;
        v76 = 0;
        swift_beginAccess(v9, &v64, 33, 0);
        swift_bridgeObjectRetain(a2);
        v14 = v44;
        v45 = v55;
        sub_100003AF0(KeyPath, 0);
        swift_retain(v19);
        v46 = *v9;
        v47 = v37;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v46);
        v63 = *v9;
        *v9 = 0x8000000000000000;
        sub_100014320(&v68, v56, a2, isUniquelyReferenced_nonNull_native);
        *v9 = v63;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess(&v64);

        v24 = v39;
        v25 = v37;
        v16 = v4;
        v15 = KeyPath;
        v26 = v62;
        v17 = 0;
LABEL_15:
        v20 = 0;
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v49 = type metadata accessor for Logger(0);
    sub_100007524(v49, (uint64_t)qword_1000350A8);
    v50 = swift_bridgeObjectRetain_n(a2, 2);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(12, -1);
      v54 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v68 = v54;
      *(_DWORD *)v53 = 136315138;
      swift_bridgeObjectRetain(a2);
      v64 = sub_10000934C(a1, a2, (uint64_t *)&v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v53 + 4, v53 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "[CameraButtonGroup] button failed  %s", v53, 0xCu);
      swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1, -1);
      swift_slowDealloc(v53, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    v26 = 0;
    v14 = 0;
    v16 = 0;
    v15 = 0;
    v17 = 0;
    v25 = 0;
    v27 = 0;
    v24 = 0;
    v19 = 0;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v10);
  v11 = sub_10000D748(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v13 = *(_QWORD *)(v10 + 56) + 80 * v11;
  v14 = *(id *)(v13 + 8);
  v16 = *(void **)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 24);
  v17 = *(unsigned __int8 *)(v13 + 32);
  v18 = *(void **)(v13 + 40);
  v59 = *(_QWORD *)(v13 + 48);
  v61 = *(_QWORD *)v13;
  v57 = *(unsigned __int8 *)(v13 + 56);
  v19 = *(_QWORD *)(v13 + 64);
  v20 = *(_BYTE *)(v13 + 72);
  v21 = v16;
  v22 = v14;
  sub_100003AF0(v15, v17);
  swift_retain(v19);
  v23 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = v57;
  v25 = v18;
  v27 = v59;
  v26 = v61;
LABEL_16:
  *(_QWORD *)a3 = v26;
  *(_QWORD *)(a3 + 8) = v14;
  *(_QWORD *)(a3 + 16) = v16;
  *(_QWORD *)(a3 + 24) = v15;
  *(_QWORD *)(a3 + 32) = v17;
  *(_QWORD *)(a3 + 40) = v25;
  *(_QWORD *)(a3 + 48) = v27;
  *(_QWORD *)(a3 + 56) = v24;
  *(_QWORD *)(a3 + 64) = v19;
  *(_BYTE *)(a3 + 72) = v20;
}

uint64_t sub_100013548(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23[10];
  __int128 v24;

  if (*(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents) + 16))
  {
    sub_1000125F4((uint64_t)v23);
    v24 = *(_OWORD *)v23;
    v5 = v23[1];
    v6 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    v8 = v7;
    sub_100005CA0((uint64_t)&v24);
    sub_10000F1D8((uint64_t)v23);
    if (v6 == a1 && v8 == a2)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v6);
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return 1;
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v19 = type metadata accessor for Logger(0);
    sub_100007524(v19, (uint64_t)qword_1000350A8);
    v20 = swift_bridgeObjectRetain_n(a2, 2);
    v14 = Logger.logObject.getter(v20);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v22 = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain(a2);
      v21 = sub_10000934C(a1, a2, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      v18 = "[CameraButtonGroup] already showing children of %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_bridgeObjectRelease_n(a2, 2);
    return 0;
  }
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v12 = type metadata accessor for Logger(0);
  sub_100007524(v12, (uint64_t)qword_1000350A8);
  v13 = swift_bridgeObjectRetain_n(a2, 2);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v14, v15))
    goto LABEL_18;
  v16 = (uint8_t *)swift_slowAlloc(12, -1);
  v17 = swift_slowAlloc(32, -1);
  v23[0] = (id)v17;
  *(_DWORD *)v16 = 136315138;
  swift_bridgeObjectRetain(a2);
  *(_QWORD *)&v24 = sub_10000934C(a1, a2, (uint64_t *)v23);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, (char *)&v24 + 8, v16 + 4, v16 + 12);
  swift_bridgeObjectRelease_n(a2, 3);
  v18 = "[CameraButtonGroup] menu group has no children %s";
LABEL_17:
  _os_log_impl((void *)&_mh_execute_header, v14, v15, v18, v16, 0xCu);
  swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v17, -1, -1);
  swift_slowDealloc(v16, -1, -1);

  return 0;
}

id sub_1000138A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraButtonGroup();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CameraButtonGroup()
{
  return objc_opt_self(_TtC9CarCamera17CameraButtonGroup);
}

uint64_t sub_100013954@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CameraButtonGroup();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

unint64_t sub_10001398C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032ED0;
  if (!qword_100032ED0)
  {
    v1 = objc_opt_self(CAFCameraButton);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100032ED0);
  }
  return result;
}

uint64_t sub_1000139D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_10000D520(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[10 * v8 + 4];
  if (a1 + 32 < v9 + 80 * v2 && v9 < a1 + 32 + 80 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v16 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v16, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100013B28(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;
  char v17;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_10000D63C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v17 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v17, 1092, 0);
  __break(1u);
  return result;
}

Swift::Int sub_100013C7C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t i;
  char v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  __int128 v54;
  _QWORD v55[10];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000383C(&qword_100032EA8);
  v48 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v44 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v46 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v45 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    v49 = v8;
    for (i = v5; ; v5 = i)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v50 = v14;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v23 >= v45)
          goto LABEL_36;
        v24 = v46[v23];
        v25 = v14 + 1;
        if (!v24)
        {
          v25 = v14 + 2;
          if (v14 + 2 >= v45)
            goto LABEL_36;
          v24 = v46[v25];
          if (!v24)
          {
            v26 = v14 + 3;
            if (v14 + 3 >= v45)
            {
LABEL_36:
              swift_release(v5);
              v3 = v44;
              if ((v48 & 1) != 0)
              {
                v43 = 1 << *(_BYTE *)(v5 + 32);
                if (v43 >= 64)
                  bzero(v46, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v46 = -1 << v43;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v46[v26];
            if (!v24)
            {
              while (1)
              {
                v25 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_43;
                if (v25 >= v45)
                  goto LABEL_36;
                v24 = v46[v25];
                ++v26;
                if (v24)
                  goto LABEL_33;
              }
            }
            v25 = v14 + 3;
          }
        }
LABEL_33:
        v11 = (v24 - 1) & v24;
        v50 = v25;
        v22 = __clz(__rbit64(v24)) + (v25 << 6);
      }
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
      v32 = *v31;
      v33 = v31[1];
      v34 = *(_QWORD *)(v5 + 56) + 80 * v22;
      v35 = *(void **)(v34 + 8);
      v51 = *(_QWORD *)v34;
      v36 = *(void **)(v34 + 16);
      v37 = *(_QWORD *)(v34 + 24);
      v38 = *(_BYTE *)(v34 + 32);
      v54 = *(_OWORD *)(v34 + 40);
      v39 = *(_QWORD *)(v34 + 64);
      v52 = *(_BYTE *)(v34 + 72);
      v53 = *(_BYTE *)(v34 + 56);
      if ((v48 & 1) == 0)
      {
        v40 = v36;
        swift_bridgeObjectRetain(v33);
        v41 = v35;
        sub_100003AF0(v37, v38);
        swift_retain(v39);
        v42 = (id)v54;
        v8 = v49;
      }
      Hasher.init(_seed:)(v55, *(_QWORD *)(v8 + 40));
      String.hash(into:)(v55, v32, v33);
      result = Hasher._finalize()();
      v8 = v49;
      v15 = -1 << *(_BYTE *)(v49 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v29 = v17 == v28;
          if (v17 == v28)
            v17 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v30 == -1);
        v18 = __clz(__rbit64(~v30)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = (_QWORD *)(*(_QWORD *)(v49 + 48) + 16 * v18);
      *v19 = v32;
      v19[1] = v33;
      v20 = *(_QWORD *)(v49 + 56) + 80 * v18;
      v14 = v50;
      *(_QWORD *)v20 = v51;
      *(_QWORD *)(v20 + 8) = v35;
      *(_QWORD *)(v20 + 16) = v36;
      *(_QWORD *)(v20 + 24) = v37;
      *(_BYTE *)(v20 + 32) = v38;
      *(_OWORD *)(v20 + 40) = v54;
      *(_BYTE *)(v20 + 56) = v53;
      *(_QWORD *)(v20 + 64) = v39;
      *(_BYTE *)(v20 + 72) = v52;
      ++*(_QWORD *)(v49 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100014014(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000383C(&qword_100032EA0);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100014320(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v5 = v4;
  v10 = *v4;
  v12 = sub_10000D748(a2, a3);
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
    sub_10001449C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1000146D4((uint64_t)a1, v18[7] + 80 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = (_OWORD *)(v18[7] + 80 * v12);
    *v23 = *a1;
    v24 = a1[1];
    v25 = a1[2];
    v26 = a1[3];
    *(_OWORD *)((char *)v23 + 57) = *(_OWORD *)((char *)a1 + 57);
    v23[2] = v25;
    v23[3] = v26;
    v23[1] = v24;
    v27 = v18[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v18[2] = v29;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100013C7C(v15, a4 & 1);
  v20 = sub_10000D748(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1000146D4((uint64_t)a1, v18[7] + 80 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

id sub_10001449C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  id v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 v37;

  sub_10000383C(&qword_100032EA8);
  v35 = v0;
  v1 = *v0;
  v2 = static _DictionaryStorage.copy(original:)(*v0);
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (id)swift_release(v1);
    *v35 = v3;
    return result;
  }
  result = (id)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v36 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    v32 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v32 >= v11)
      goto LABEL_26;
    v33 = *(_QWORD *)(v36 + 8 * v32);
    ++v7;
    if (!v33)
    {
      v7 = v32 + 1;
      if (v32 + 1 >= v11)
        goto LABEL_26;
      v33 = *(_QWORD *)(v36 + 8 * v7);
      if (!v33)
        break;
    }
LABEL_25:
    v10 = (v33 - 1) & v33;
    v13 = __clz(__rbit64(v33)) + (v7 << 6);
LABEL_12:
    v14 = 16 * v13;
    v15 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v13);
    v16 = *v15;
    v17 = v15[1];
    v18 = 80 * v13;
    v19 = *(_QWORD *)(v1 + 56) + v18;
    v20 = *(_QWORD *)v19;
    v21 = *(void **)(v19 + 8);
    v22 = *(void **)(v19 + 16);
    v23 = *(_QWORD *)(v19 + 24);
    v24 = *(_BYTE *)(v19 + 32);
    v25 = *(_BYTE *)(v19 + 56);
    v26 = *(_QWORD *)(v19 + 64);
    v27 = *(_BYTE *)(v19 + 72);
    v28 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v14);
    v37 = *(_OWORD *)(v19 + 40);
    *v28 = v16;
    v28[1] = v17;
    v29 = *(_QWORD *)(v3 + 56) + v18;
    *(_QWORD *)v29 = v20;
    *(_QWORD *)(v29 + 8) = v21;
    *(_QWORD *)(v29 + 16) = v22;
    *(_QWORD *)(v29 + 24) = v23;
    *(_BYTE *)(v29 + 32) = v24;
    *(_OWORD *)(v29 + 40) = v37;
    *(_BYTE *)(v29 + 56) = v25;
    *(_QWORD *)(v29 + 64) = v26;
    *(_BYTE *)(v29 + 72) = v27;
    v30 = v22;
    swift_bridgeObjectRetain(v17);
    v31 = v21;
    sub_100003AF0(v23, v24);
    swift_retain(v26);
    result = (id)v37;
  }
  v34 = v32 + 2;
  if (v34 >= v11)
    goto LABEL_26;
  v33 = *(_QWORD *)(v36 + 8 * v34);
  if (v33)
  {
    v7 = v34;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v7 >= v11)
      goto LABEL_26;
    v33 = *(_QWORD *)(v36 + 8 * v7);
    ++v34;
    if (v33)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000146D4(uint64_t a1, uint64_t a2)
{
  assignWithTake for CameraActionButton(a2, a1);
  return a2;
}

id sub_100014710()
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
  sub_10000383C(&qword_100032EA0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
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
    swift_bridgeObjectRetain(v18);
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

_QWORD *sub_1000148C0(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE v27[8];
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v2 = (unint64_t *)(swift_bridgeObjectRetain(a1) + 40);
  v3 = _swiftEmptyArrayStorage;
  do
  {
    v5 = *(v2 - 1);
    v6 = *v2;
    swift_bridgeObjectRetain(*v2);
    sub_100013020(v5, v6, (uint64_t)v20);
    v7 = v20[0];
    v8 = v20[2];
    v9 = v20[3];
    v16 = v20[1];
    v17 = v21;
    v18 = v23;
    v19 = v22;
    v10 = v25;
    v29 = v24;
    v11 = v26;
    swift_bridgeObjectRelease();
    sub_10000F23C((uint64_t)v20, (uint64_t)v27);
    if (v28)
    {
      v15 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        v3 = sub_10000D520(0, v3[2] + 1, 1, v3);
      v13 = v3[2];
      v12 = v3[3];
      if (v13 >= v12 >> 1)
        v3 = sub_10000D520((_QWORD *)(v12 > 1), v13 + 1, 1, v3);
      v3[2] = v13 + 1;
      v4 = &v3[10 * v13];
      v4[4] = v7;
      v4[5] = v16;
      v4[6] = v8;
      v4[7] = v9;
      *((_BYTE *)v4 + 64) = v17 & 1;
      v4[9] = v19;
      v4[10] = v18;
      *((_BYTE *)v4 + 88) = v29 & 1;
      v4[12] = v15;
      *((_BYTE *)v4 + 104) = v11 & 1;
    }
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

id sub_100014A60(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  void *v25;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;

  v9 = qword_100032738;
  v10 = v4;
  if (v9 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v11 = type metadata accessor for Logger(0);
  sub_100007524(v11, (uint64_t)qword_1000350A8);
  v12 = swift_bridgeObjectRetain_n(a2, 2);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v25 = a4;
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    v28 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain(a2);
    v26 = sub_10000934C(a1, a2, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[CameraButtonGroup] init %s", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    v17 = v15;
    a4 = v25;
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  *(_QWORD *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_model] = a4;
  v18 = (uint64_t *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_parentIdent];
  *v18 = a1;
  v18[1] = a2;
  *(_QWORD *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_childrenIdents] = a3;
  v19 = sub_10000383C(&qword_100032EC8);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100023230;
  *(_QWORD *)(v20 + 32) = a1;
  *(_QWORD *)(v20 + 40) = a2;
  v28 = v20;
  swift_bridgeObjectRetain(a2);
  v21 = a4;
  v22 = swift_bridgeObjectRetain(a3);
  sub_100013B28(v22);
  *(_QWORD *)&v10[OBJC_IVAR____TtC9CarCamera17CameraButtonGroup_identFlatList] = v28;

  v23 = (objc_class *)type metadata accessor for CameraButtonGroup();
  v27.receiver = v10;
  v27.super_class = v23;
  return objc_msgSendSuper2(&v27, "init");
}

uint64_t destroy for CameraActionButton(uint64_t a1)
{

  sub_100003B28(*(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return swift_release(*(_QWORD *)(a1 + 64));
}

uint64_t initializeWithCopy for CameraActionButton(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(_BYTE *)(a2 + 32);
  v8 = v4;
  v9 = v6;
  sub_100003AF0(v5, v7);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v7;
  v10 = *(void **)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v12;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v13 = v10;
  swift_retain(v12);
  return a1;
}

uint64_t assignWithCopy for CameraActionButton(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(void **)(a1 + 16);
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_BYTE *)(a2 + 32);
  sub_100003AF0(v10, v11);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v10;
  *(_BYTE *)(a1 + 32) = v11;
  sub_100003B28(v12, v13);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v15;
  v16 = v15;

  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v17 = *(_QWORD *)(a1 + 64);
  v18 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v18;
  swift_retain(v18);
  swift_release(v17);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

__n128 initializeWithTake for CameraActionButton(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CameraActionButton(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;

  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = v5;
  sub_100003B28(v6, v7);
  v8 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release(v9);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraActionButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CameraActionButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CameraActionButton()
{
  return &type metadata for CameraActionButton;
}

_QWORD *sub_100014FBC(_QWORD *a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, __n128);
  __n128 v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v19);
  }
  else
  {
    v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[2];
    v9 = *((_BYTE *)a2 + 24);
    v10 = v7;
    sub_100003AF0(v8, v9);
    v4[2] = v8;
    *((_BYTE *)v4 + 24) = v9;
    *((_BYTE *)v4 + 32) = *((_BYTE *)a2 + 32);
    v11 = a2[5];
    v4[5] = v11;
    v12 = a3[7];
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = type metadata accessor for UUID(0);
    v16 = *(void (**)(char *, uint64_t, uint64_t, __n128))(*(_QWORD *)(v15 - 8) + 16);
    v17 = swift_retain(v11);
    v16(v13, v14, v15, v17);
    v18 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    *((_BYTE *)v4 + v18) = *((_BYTE *)a2 + v18);
    *((_BYTE *)v4 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  }
  return v4;
}

uint64_t sub_1000150B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100003B28(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 40));
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_100015114(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, __n128);
  __n128 v16;
  uint64_t v17;

  v6 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a2 + 24);
  v9 = v6;
  sub_100003AF0(v7, v8);
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for UUID(0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(_QWORD *)(v14 - 8) + 16);
  v16 = swift_retain(v10);
  v15(v12, v13, v14, v16);
  v17 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1000151E4(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(void **)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v8 = v6;

  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_BYTE *)(a2 + 24);
  sub_100003AF0(v9, v10);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 24) = v10;
  sub_100003B28(v11, v12);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v14;
  swift_retain(v14);
  swift_release(v13);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1000152D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100015374(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;

  v8 = *(_BYTE *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v8;
  sub_100003B28(v9, v10);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10001543C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015448);
}

uint64_t sub_100015448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1000154C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000154D0);
}

uint64_t sub_1000154D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CameraCloseButton(uint64_t a1)
{
  return sub_100017B9C(a1, qword_1000331A8, (uint64_t)&nominal type descriptor for CameraCloseButton);
}

uint64_t sub_100015558(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_100023338;
  v4[1] = &unk_100023350;
  v4[2] = &unk_100023368;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    v4[4] = &unk_100023380;
    v4[5] = &unk_100023380;
    v4[6] = &unk_100023380;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_1000155EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100025140, 1);
}

_QWORD *sub_1000155FC@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_1000032F8();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for LayoutConfigKey, &type metadata for LayoutConfigKey, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_100015648(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_1000032F8();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for LayoutConfigKey, &type metadata for LayoutConfigKey, v1);
}

uint64_t sub_100015690()
{
  __int128 *v0;
  uint64_t v1;
  __int128 v3;

  v3 = *v0;
  v1 = dispatch thunk of CAFCameraButtonObservable.identifier.getter(*((id *)&v3 + 1));
  sub_100005CA0((uint64_t)&v3);
  return v1;
}

uint64_t sub_1000156E0(char a1, char a2)
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
    v3 = 0x656C63726943;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0x8000000100023DB0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000011;
  else
    v5 = 0x656C63726943;
  if ((a2 & 1) != 0)
    v6 = 0x8000000100023DB0;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_100015784()
{
  __int128 *v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  const char *v34;
  id v35;
  id v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  void (*v50)(uint64_t, unint64_t, uint64_t, void (*)(char), uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;

  v1 = v0;
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v2 = type metadata accessor for Logger(0);
  sub_100007524(v2, (uint64_t)qword_1000350A8);
  sub_100005C14((uint64_t)v0);
  v3 = sub_100005C14((uint64_t)v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)&v54 = v7;
    v55 = *v0;
    v8 = *((id *)&v55 + 1);
    v9 = dispatch thunk of CAFCameraButtonObservable.identifier.getter();
    v11 = v10;
    sub_100005CA0((uint64_t)&v55);
    v53 = sub_10000934C(v9, v11, (uint64_t *)&v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease();
    sub_10000F1D8((uint64_t)v1);
    sub_10000F1D8((uint64_t)v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CameraActionButton] %s sending action", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    sub_10000F1D8((uint64_t)v0);
    sub_10000F1D8((uint64_t)v0);
  }

  v54 = *v1;
  v12 = *((id *)&v54 + 1);
  v13 = (void *)CAFCameraButtonObservable.observed.getter(v12);
  sub_100005CA0((uint64_t)&v54);
  v14 = objc_msgSend(v13, "hasButtonAction");

  if (v14)
  {
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[CameraActionButton] sendAction to vehicle with .performAction", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    v19 = v12;
    dispatch thunk of CAFCameraButtonObservable.buttonAction.setter(1);
    sub_100005CA0((uint64_t)&v54);
    return;
  }
  v20 = v12;
  v21 = dispatch thunk of CAFCameraButtonObservable.contentURLAction.getter();
  v23 = v22;
  v24 = sub_100005CA0((uint64_t)&v54);
  if (!v23)
  {
LABEL_17:
    v31 = Logger.logObject.getter(v24);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      v34 = "[CameraActionButton] nothing to do";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v34, v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }
LABEL_31:

    return;
  }
  v25 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0)
    v25 = v21 & 0xFFFFFFFFFFFFLL;
  if (!v25)
  {
    v24 = swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v26 = swift_bridgeObjectRetain_n(v23, 2);
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    v30 = swift_slowAlloc(32, -1);
    v53 = v30;
    *(_DWORD *)v29 = 136315138;
    swift_bridgeObjectRetain(v23);
    v52 = sub_10000934C(v21, v23, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v29 + 4, v29 + 12);
    swift_bridgeObjectRelease_n(v23, 3);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "[CameraActionButton] RequestContent URL button pressed (URL: %s)", v29, 0xCu);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v29, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v23, 2);
  }
  v35 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v36 = objc_msgSend(v35, "connectedScenes");

  v37 = sub_100019434();
  v38 = sub_100005CF4(&qword_100033260, (uint64_t (*)(uint64_t))sub_100019434, (uint64_t)&protocol conformance descriptor for NSObject);
  v39 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v36, v37, v38);

  v40 = (void *)sub_100016DC4(v39);
  swift_bridgeObjectRelease();
  if (!v40)
  {
LABEL_28:
    v51 = swift_bridgeObjectRelease();
    v31 = Logger.logObject.getter(v51);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      v34 = "[CameraActionButton] RequestContent failed, missing window scene.";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v41 = objc_opt_self(UIWindowScene);
  v42 = swift_dynamicCastObjCClass(v40, v41);
  if (!v42)
  {

    goto LABEL_28;
  }
  v43 = v42;
  v44 = qword_100032768;
  v45 = v40;
  if (v44 != -1)
    swift_once(&qword_100032768, sub_1000201B8);
  v46 = *(_QWORD *)(qword_100035118 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager);
  if (v46)
  {
    v47 = swift_allocObject(&unk_10002DBC0, 105, 7);
    *(_QWORD *)(v47 + 16) = v21;
    *(_QWORD *)(v47 + 24) = v23;
    v48 = v1[3];
    *(_OWORD *)(v47 + 64) = v1[2];
    *(_OWORD *)(v47 + 80) = v48;
    *(_OWORD *)(v47 + 89) = *(__int128 *)((char *)v1 + 57);
    v49 = v1[1];
    *(_OWORD *)(v47 + 32) = *v1;
    *(_OWORD *)(v47 + 48) = v49;
    v50 = *(void (**)(uint64_t, unint64_t, uint64_t, void (*)(char), uint64_t))(*(_QWORD *)v46 + 112);
    sub_100005C14((uint64_t)v1);
    swift_bridgeObjectRetain(v23);
    swift_retain(v46);
    v50(v21, v23, v43, sub_1000194C0, v47);
    swift_release(v46);
    swift_release(v47);
  }
  swift_bridgeObjectRelease();

}

uint64_t sub_100015DE8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100015E08(uint64_t a1)
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

uint64_t sub_100015E84(char *a1, char *a2)
{
  return sub_1000156E0(*a1, *a2);
}

Swift::Int sub_100015E90()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 0xD000000000000011;
  else
    v2 = 0x656C63726943;
  if (v1)
    v3 = 0x8000000100023DB0;
  else
    v3 = 0xE600000000000000;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100015F10(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000011;
  else
    v2 = 0x656C63726943;
  if (*v1)
    v3 = 0x8000000100023DB0;
  else
    v3 = 0xE600000000000000;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100015F6C(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 0xD000000000000011;
  else
    v3 = 0x656C63726943;
  if (v2)
    v4 = 0x8000000100023DB0;
  else
    v4 = 0xE600000000000000;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100015FE8@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10002CF28, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_100016044(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x656C63726943;
  if (*v1)
    v2 = 0xD000000000000011;
  v3 = 0x8000000100023DB0;
  if (!*v1)
    v3 = 0xE600000000000000;
  *a1 = v2;
  a1[1] = v3;
}

_QWORD *sub_100016084@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  _BYTE *v5;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  _OWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v11 = type metadata accessor for RoundedRectangle(0);
  v13 = __chkstk_darwin(v11);
  v15 = (_OWORD *)((char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((*v5 & 1) != 0)
  {
    v16 = (char *)v15 + *(int *)(v12 + 20);
    v17 = enum case for RoundedCornerStyle.continuous(_:);
    v18 = type metadata accessor for RoundedCornerStyle(0, v13);
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v16, v17, v18);
    __asm { FMOV            V0.2D, #8.0 }
    *v15 = _Q0;
    RoundedRectangle.path(in:)(&v32, v19, a2, a3, a4, a5);
    v25 = v32;
    v26 = v33;
    v27 = v34;
    v28 = v35;
    v29 = v36;
    result = (_QWORD *)sub_100019964((uint64_t)v15, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  }
  else
  {
    result = Circle.path(in:)(&v32, a2, a3, a4, a5);
    v25 = v32;
    v26 = v33;
    v27 = v34;
    v28 = v35;
    v29 = v36;
  }
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v26;
  *(_QWORD *)(a1 + 16) = v27;
  *(_QWORD *)(a1 + 24) = v28;
  *(_BYTE *)(a1 + 32) = v29;
  return result;
}

uint64_t sub_1000161CC()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_1000161E4(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_100016240;
}

void sub_100016240(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_100016270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10001AB48();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000162C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10001AB48();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100016310(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AB48();
  return Shape.body.getter(a1, v2);
}

uint64_t sub_100016348@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64x2_t v19;
  int16x8_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t *v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t (**v30)(char *);
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[16];
  _OWORD *v35;
  char v36;
  unsigned __int32 v37;

  v2 = v1;
  v33 = a1;
  v3 = sub_10000383C(&qword_1000331F8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000383C(&qword_100033200);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_10000383C(&qword_100033208);
  __chkstk_darwin(v32);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_OWORD *)swift_allocObject(&unk_10002DB48, 89, 7);
  v14 = v2[3];
  v13[3] = v2[2];
  v13[4] = v14;
  *(_OWORD *)((char *)v13 + 73) = *(_OWORD *)((char *)v2 + 57);
  v15 = v2[1];
  v13[1] = *v2;
  v13[2] = v15;
  v35 = v2;
  sub_100005C14((uint64_t)v2);
  v16 = sub_10000383C(&qword_100033210);
  v17 = sub_100017AA0();
  Button.init(action:label:)(sub_100017A78, v13, sub_100017A98, v34, v16, v17);
  v18 = sub_100016B48();
  v36 = v18 & 1;
  v19 = (uint64x2_t)vdupq_n_s64(v18);
  v20 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v19, (uint64x2_t)xmmword_1000232E0), (int32x4_t)vshlq_u64(v19, (uint64x2_t)xmmword_1000232D0));
  *(int8x8_t *)v20.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v20), (int8x8_t)0x1000100010001);
  v37 = vmovn_s16(v20).u32[0];
  v21 = sub_100005E44(&qword_100033238, &qword_1000331F8, (uint64_t)&protocol conformance descriptor for Button<A>);
  v22 = sub_100017BD0();
  View.buttonStyle<A>(_:)(&v36, v3, &type metadata for CustomButtonStyle, v21, v22);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  LOBYTE(v21) = sub_100016B48();
  KeyPath = swift_getKeyPath(&unk_100023438);
  v24 = swift_allocObject(&unk_10002DB70, 17, 7);
  *(_BYTE *)(v24 + 16) = v21 & 1;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  v25 = (uint64_t *)&v12[*(int *)(v32 + 36)];
  *v25 = KeyPath;
  v25[1] = (uint64_t)sub_1000192C4;
  v25[2] = v24;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v26 = (_OWORD *)swift_allocObject(&unk_10002DB98, 89, 7);
  v27 = v2[3];
  v26[3] = v2[2];
  v26[4] = v27;
  *(_OWORD *)((char *)v26 + 73) = *(_OWORD *)((char *)v2 + 57);
  v28 = v2[1];
  v26[1] = *v2;
  v26[2] = v28;
  v29 = v33;
  sub_1000038C4((uint64_t)v12, v33, &qword_100033208);
  v30 = (uint64_t (**)(char *))(v29 + *(int *)(sub_10000383C(&qword_100033248) + 36));
  *v30 = sub_100019328;
  v30[1] = (uint64_t (*)(char *))v26;
  sub_100005C14((uint64_t)v2);
  return sub_100003A24((uint64_t)v12, &qword_100033208);
}

void sub_100016654()
{
  __int128 *v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  uint64_t v24;

  v1 = v0;
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350A8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[CameraActionButton] performCameraAction entry", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  sub_100005D34((uint64_t)(v1 + 1), (uint64_t)&v23, &qword_100033250);
  sub_100005D34((uint64_t)&v23, (uint64_t)&v24, &qword_100033250);
  if (!v24)
    goto LABEL_10;
  v22 = *v1;
  v7 = (void *)*((_QWORD *)&v22 + 1);
  sub_100008F88(&v23);
  v8 = sub_100005C78((uint64_t)&v22);
  v9 = dispatch thunk of CAFCameraButtonObservable.identifier.getter(v8);
  v11 = v10;
  sub_100005CA0((uint64_t)&v22);
  LOBYTE(v9) = sub_100013548(v9, v11);
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    sub_1000090C0(&v23);
LABEL_10:
    sub_100015784();
    return;
  }
  sub_100005C14((uint64_t)v1);
  v12 = sub_100005C14((uint64_t)v1);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    v21 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = dispatch thunk of CAFCameraButtonObservable.identifier.getter(v7);
    v19 = v18;
    sub_100005CA0((uint64_t)&v22);
    v20 = sub_10000934C(v17, v19, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease();
    sub_10000F1D8((uint64_t)v1);
    sub_10000F1D8((uint64_t)v1);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[CameraActionButton] service %s will reveal children", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    sub_10000F1D8((uint64_t)v1);
    sub_10000F1D8((uint64_t)v1);
  }
  sub_1000090C0(&v23);

}

uint64_t sub_10001692C@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __n128 v5;
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
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64x2_t v21;
  int16x8_t v22;
  uint64_t v23;
  __int128 v25;

  v4 = type metadata accessor for CameraShapeImage(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Image.ResizingMode(0, v5);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *a1;
  v12 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter(*((id *)&v25 + 1));
  v14 = v13;
  sub_100005CA0((uint64_t)&v25);
  v15 = Image.init(automakerSymbolName:)(v12, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v8);
  v16 = Image.resizable(capInsets:resizingMode:)(v11, v15, 0.0, 0.0, 0.0, 0.0);
  swift_release(v15);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v17 = sub_100016B48();
  *(_QWORD *)v7 = swift_getKeyPath(&unk_1000234B0);
  v7[8] = 0;
  v18 = &v7[*(int *)(v4 + 20)];
  *(_QWORD *)v18 = swift_getKeyPath(&unk_1000234D8);
  v19 = sub_10000383C((uint64_t *)&unk_100032C40);
  swift_storeEnumTagMultiPayload(v18, v19, 0);
  v20 = &v7[*(int *)(v4 + 24)];
  *v20 = v17 & 1;
  v21 = (uint64x2_t)vdupq_n_s64(v17);
  v22 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v21, (uint64x2_t)xmmword_1000232E0), (int32x4_t)vshlq_u64(v21, (uint64x2_t)xmmword_1000232D0));
  *(int8x8_t *)v22.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v22), (int8x8_t)0x1000100010001);
  *(_DWORD *)(v20 + 1) = vmovn_s16(v22).u32[0];
  v23 = sub_10000383C(&qword_100033210);
  sub_1000197A8((uint64_t)v7, a2 + *(int *)(v23 + 36), type metadata accessor for CameraShapeImage);
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  return sub_100019964((uint64_t)v7, type metadata accessor for CameraShapeImage);
}

uint64_t sub_100016B48()
{
  _OWORD *v0;
  _OWORD *v1;
  id v2;
  __int16 v3;
  id v4;
  char v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t KeyPath;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  const mach_header_64 *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;

  v1 = v0;
  v29 = *v0;
  v2 = *((id *)&v29 + 1);
  v3 = dispatch thunk of CAFCameraButtonObservable.buttonAction.getter();
  sub_100005CA0((uint64_t)&v29);
  if ((v3 & 0x100) != 0)
  {
    v6 = 0;
  }
  else
  {
    v4 = v2;
    v5 = dispatch thunk of CAFCameraButtonObservable.disabled.getter();
    sub_100005CA0((uint64_t)&v29);
    v6 = (v5 & 1) != 0 || v3 != 0;
  }
  v7 = v2;
  v8 = (void *)CAFCameraButtonObservable.observed.getter(v7);
  sub_100005CA0((uint64_t)&v29);
  v9 = objc_msgSend(v8, "selected");

  if ((v9 & 1) != 0)
  {
    v10 = 256;
  }
  else
  {
    v11 = (void *)*((_QWORD *)v1 + 5);
    if (!v11)
    {
      v24 = *((_QWORD *)v1 + 6);
      v25 = type metadata accessor for CameraModel(0);
      v26 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
      result = EnvironmentObject.error()(0, v24, v25, v26);
      __break(1u);
      return result;
    }
    KeyPath = swift_getKeyPath(&unk_100023468);
    v13 = swift_getKeyPath(&unk_100023490);
    v14 = v11;
    static Published.subscript.getter(v14, KeyPath, v13);

    swift_release(KeyPath);
    swift_release(v13);
    v10 = *((_QWORD *)&v28 + 1);
    v15 = (void *)CAFCameraButtonObservable.observed.getter(v7);
    sub_100005CA0((uint64_t)&v29);
    v16 = objc_msgSend(v15, "identifier");

    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v18;

    if (*((_QWORD *)&v28 + 1))
    {
      if (v28 == __PAIR128__(v19, v17))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v10 = 256;
      }
      else
      {
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, *((_QWORD *)&v28 + 1), v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          v10 = 256;
        else
          v10 = 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v28 = *(_OWORD *)((char *)v1 + 56);
  sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v27);
  v21 = &_mh_execute_header;
  if (!*((_BYTE *)v1 + 72))
    v21 = 0;
  v22 = 0x10000;
  if (!v27)
    v22 = 0;
  return v10 | v6 | v22 | (unint64_t)v21;
}

uint64_t sub_100016DC4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v3 = a1;
    else
      v3 = a1 & 0xFFFFFFFFFFFFFF8;
    v4 = __CocoaSet.startIndex.getter(v3);
    v6 = v5;
    v7 = __CocoaSet.endIndex.getter(v3);
    v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_100019720(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_100019714(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_1000194CC(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_100019714(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100016ED0(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if ((a1 & 1) != 0)
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v7 = type metadata accessor for Logger(0);
    sub_100007524(v7, (uint64_t)qword_1000350A8);
    v8 = swift_bridgeObjectRetain_n(a3, 2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v26 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain(a3);
      v25 = sub_10000934C(a2, a3, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v11 + 4, v11 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "RequestContent opened url %s successfully", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
    v19 = *(_QWORD *)(a4 + 40);
    if (v19)
    {
      v20 = *(void **)(v19 + OBJC_IVAR____TtC9CarCamera11CameraModel_camera);
      if (v20)
      {
        v21 = objc_msgSend(v20, "cameraGeneral");
        objc_msgSend(v21, "setOn:", 0);

      }
    }
    else
    {
      v22 = *(_QWORD *)(a4 + 48);
      v23 = type metadata accessor for CameraModel(0);
      v24 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
      EnvironmentObject.error()(0, v22, v23, v24);
      __break(1u);
    }
  }
  else
  {
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v13 = type metadata accessor for Logger(0);
    sub_100007524(v13, (uint64_t)qword_1000350A8);
    v14 = swift_bridgeObjectRetain_n(a3, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v26 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain(a3);
      v25 = sub_10000934C(a2, a3, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[CameraActionButton] equestContent opening url %s was not successful", v17, 0xCu);
      swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
  }
}

uint64_t sub_100017260@<X0>(uint64_t a1@<X8>)
{
  return sub_100016348(a1);
}

uint64_t sub_1000172A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (**v36)(char *);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[16];
  uint64_t v49;
  _BYTE v50[8];
  uint64_t v51;
  uint64_t v52;

  v2 = v1;
  v47 = a1;
  v3 = (int *)type metadata accessor for CameraCloseButton(0);
  v4 = *((_QWORD *)v3 - 1);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v6;
  v7 = sub_10000383C(&qword_1000331F8);
  v8 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  v40 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000383C(&qword_100033200);
  v45 = *(_QWORD *)(v11 - 8);
  v46 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_10000383C(&qword_100033208);
  __chkstk_darwin(v44);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000197A8(v2, (uint64_t)v6, type metadata accessor for CameraCloseButton);
  v16 = *(unsigned __int8 *)(v4 + 80);
  v42 = ((v16 + 16) & ~v16) + v5;
  v43 = (v16 + 16) & ~v16;
  v17 = v43;
  v41 = v16 | 7;
  v18 = swift_allocObject(&unk_10002DBE8, v42, v16 | 7);
  sub_1000197F0((uint64_t)v6, v18 + v17);
  v49 = v2;
  v19 = sub_10000383C(&qword_100033210);
  v20 = sub_100017AA0();
  Button.init(action:label:)(sub_100019834, v18, sub_10001986C, v48, v19, v20);
  v21 = v3[8];
  LOBYTE(v17) = *(_BYTE *)(v2 + v21);
  LOBYTE(v6) = *(_BYTE *)(v2 + v3[9]);
  v22 = *(_QWORD *)(v2 + 40);
  v50[0] = *(_BYTE *)(v2 + 32);
  v51 = v22;
  sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v52);
  v23 = *(_BYTE *)(v2 + v3[10]);
  v50[0] = v17;
  v50[1] = (_BYTE)v6;
  v50[2] = v52;
  v50[3] = 1;
  v50[4] = v23;
  v24 = sub_100005E44(&qword_100033238, &qword_1000331F8, (uint64_t)&protocol conformance descriptor for Button<A>);
  v25 = sub_100017BD0();
  v26 = v39;
  View.buttonStyle<A>(_:)(v50, v39, &type metadata for CustomButtonStyle, v24, v25);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v26);
  LOBYTE(v6) = *(_BYTE *)(v2 + v21);
  v27 = *(_QWORD *)(v2 + 40);
  v50[0] = *(_BYTE *)(v2 + 32);
  v51 = v27;
  State.wrappedValue.getter(&v52);
  KeyPath = swift_getKeyPath(&unk_100023438);
  v29 = swift_allocObject(&unk_10002DC10, 17, 7);
  *(_BYTE *)(v29 + 16) = (_BYTE)v6;
  v31 = v45;
  v30 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v15, v13, v46);
  v32 = (uint64_t *)&v15[*(int *)(v44 + 36)];
  *v32 = KeyPath;
  v32[1] = (uint64_t)sub_10001AF34;
  v32[2] = v29;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v30);
  v33 = (uint64_t)v38;
  sub_1000197A8(v2, (uint64_t)v38, type metadata accessor for CameraCloseButton);
  v34 = swift_allocObject(&unk_10002DC38, v42, v41);
  sub_1000197F0(v33, v34 + v43);
  v35 = v47;
  sub_1000038C4((uint64_t)v15, v47, &qword_100033208);
  v36 = (uint64_t (**)(char *))(v35 + *(int *)(sub_10000383C(&qword_100033248) + 36));
  *v36 = sub_100019928;
  v36[1] = (uint64_t (*)(char *))v34;
  return sub_100003A24((uint64_t)v15, &qword_100033208);
}

void sub_100017640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for CameraCloseButton(0);
  __chkstk_darwin(v2);
  v4 = (id *)((char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(id *)(v0 + 8);
  dispatch thunk of CAFCameraGeneralObservable.on.setter(0);

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v6 = type metadata accessor for Logger(0);
  sub_100007524(v6, (uint64_t)qword_1000350A8);
  v7 = sub_1000197A8(v1, (uint64_t)v4, type metadata accessor for CameraCloseButton);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 67109120;
    v11 = v4[1];
    v12 = dispatch thunk of CAFCameraGeneralObservable.on.getter();

    sub_100019964((uint64_t)v4, type metadata accessor for CameraCloseButton);
    v14 = v12 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v10 + 4, v10 + 8);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[CAMERA] camera.On visiblity button button pressed: %{BOOL}d", v10, 8u);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    sub_100019964((uint64_t)v4, type metadata accessor for CameraCloseButton);
  }

}

uint64_t sub_1000177F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;

  v4 = type metadata accessor for CameraShapeImage(0);
  v5 = __chkstk_darwin(v4);
  v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for Image.ResizingMode(0, v5);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = &v23[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = Image.init(systemName:)(0x6B72616D78, 0xE500000000000000, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v8);
  v14 = Image.resizable(capInsets:resizingMode:)(v12, v13, 0.0, 0.0, 0.0, 0.0);
  swift_release(v13);
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
  v15 = (int *)type metadata accessor for CameraCloseButton(0);
  LOBYTE(v13) = *(_BYTE *)(a1 + v15[8]);
  LOBYTE(v9) = *(_BYTE *)(a1 + v15[9]);
  v16 = *(_QWORD *)(a1 + 40);
  v23[8] = *(_BYTE *)(a1 + 32);
  v24 = v16;
  sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v25);
  v17 = v25;
  LOBYTE(a1) = *(_BYTE *)(a1 + v15[10]);
  *(_QWORD *)v7 = swift_getKeyPath(&unk_1000234B0);
  v7[8] = 0;
  v18 = &v7[*(int *)(v4 + 20)];
  *v18 = swift_getKeyPath(&unk_1000234D8);
  v19 = sub_10000383C((uint64_t *)&unk_100032C40);
  swift_storeEnumTagMultiPayload(v18, v19, 0);
  v20 = &v7[*(int *)(v4 + 24)];
  *v20 = v13;
  v20[1] = v9;
  v20[2] = v17;
  v20[3] = 1;
  v20[4] = a1;
  v21 = sub_10000383C(&qword_100033210);
  sub_1000197A8((uint64_t)v7, a2 + *(int *)(v21 + 36), type metadata accessor for CameraShapeImage);
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  return sub_100019964((uint64_t)v7, type metadata accessor for CameraShapeImage);
}

uint64_t sub_100017A0C(char *a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[9];
  uint64_t v7;

  v2 = *a1;
  v3 = *(_QWORD *)(a2 + 40);
  v6[1] = *(_BYTE *)(a2 + 32);
  v7 = v3;
  v6[0] = v2;
  v4 = sub_10000383C(&qword_100032990);
  return State.wrappedValue.setter(v6, v4);
}

uint64_t sub_100017A64(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100025118, 1);
}

void sub_100017A78()
{
  sub_100016654();
}

uint64_t sub_100017A98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10001692C(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_100017AA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033218;
  if (!qword_100033218)
  {
    v1 = sub_100003908(&qword_100033210);
    sub_100017B24();
    sub_100005CF4(&qword_100033230, type metadata accessor for CameraShapeImage, (uint64_t)&unk_100023818);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033218);
  }
  return result;
}

unint64_t sub_100017B24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033220;
  if (!qword_100033220)
  {
    v1 = sub_100003908(&qword_100033228);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033220);
  }
  return result;
}

uint64_t type metadata accessor for CameraShapeImage(uint64_t a1)
{
  return sub_100017B9C(a1, (uint64_t *)&unk_1000332C8, (uint64_t)&nominal type descriptor for CameraShapeImage);
}

uint64_t sub_100017B9C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

unint64_t sub_100017BD0()
{
  unint64_t result;

  result = qword_100033240;
  if (!qword_100033240)
  {
    result = swift_getWitnessTable(&unk_1000237E0, &type metadata for CustomButtonStyle);
    atomic_store(result, (unint64_t *)&qword_100033240);
  }
  return result;
}

uint64_t sub_100017C14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t (**v27)(char *);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[16];
  uint64_t v34;
  __int128 v35;
  unsigned __int8 v36;
  __int128 v37;

  v2 = v1;
  v32 = a1;
  v3 = sub_10000383C(&qword_1000331F8);
  v29 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_10000383C(&qword_100033200);
  v6 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_10000383C(&qword_100033208);
  __chkstk_darwin(v30);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject(&unk_10002DE48, 49, 7);
  v12 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v11 + 32) = v12;
  *(_BYTE *)(v11 + 48) = *(_BYTE *)(v2 + 32);
  v34 = v2;
  sub_10001AA44(v2);
  v13 = sub_10000383C(&qword_100033210);
  v14 = sub_100017AA0();
  Button.init(action:label:)(sub_10001AA34, v11, sub_10001AA3C, v33, v13, v14);
  v15 = *(_BYTE *)(v2 + 10);
  v16 = *(_BYTE *)(v2 + 11);
  v37 = *(_OWORD *)(v2 + 16);
  v35 = *(_OWORD *)(v2 + 16);
  sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v36);
  v17 = *(_BYTE *)(v2 + 32);
  LOBYTE(v35) = v15;
  BYTE1(v35) = v16;
  WORD1(v35) = v36;
  BYTE4(v35) = v17;
  v18 = sub_100005E44(&qword_100033238, &qword_1000331F8, (uint64_t)&protocol conformance descriptor for Button<A>);
  v19 = sub_100017BD0();
  View.buttonStyle<A>(_:)(&v35, v3, &type metadata for CustomButtonStyle, v18, v19);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v3);
  v35 = v37;
  State.wrappedValue.getter(&v36);
  KeyPath = swift_getKeyPath(&unk_100023438);
  v21 = swift_allocObject(&unk_10002DE70, 17, 7);
  *(_BYTE *)(v21 + 16) = v15;
  v22 = v31;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v31);
  v23 = (uint64_t *)&v10[*(int *)(v30 + 36)];
  *v23 = KeyPath;
  v23[1] = (uint64_t)sub_10001AF34;
  v23[2] = v21;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  v24 = swift_allocObject(&unk_10002DE98, 49, 7);
  v25 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v24 + 32) = v25;
  *(_BYTE *)(v24 + 48) = *(_BYTE *)(v2 + 32);
  v26 = v32;
  sub_1000038C4((uint64_t)v10, v32, &qword_100033208);
  v27 = (uint64_t (**)(char *))(v26 + *(int *)(sub_10000383C(&qword_100033248) + 36));
  *v27 = sub_10001AAC0;
  v27[1] = (uint64_t (*)(char *))v24;
  sub_10001AA44(v2);
  return sub_100003A24((uint64_t)v10, &qword_100033208);
}

void sub_100017F30()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100007524(v0, (uint64_t)qword_1000350A8);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "[CAMERA] NavigationButton action", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

}

uint64_t sub_100017FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  char v15;
  __n128 v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v34 = a2;
  v3 = type metadata accessor for CameraShapeImage(0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Image.ResizingMode(0, v4);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_10000383C(&qword_100033210);
  __chkstk_darwin(v33);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AB0C((_BYTE *)(a1 + 9), (_BYTE *)&v36 + 1);
  v13 = *(_QWORD *)a1;
  v14 = *(_BYTE *)(a1 + 8);
  sub_100003AF0(*(_QWORD *)a1, v14);
  v15 = sub_100008D3C(v13, v14);
  sub_100003B28(v13, v14);
  sub_10001AB0C((_BYTE *)&v36 + 1, (_BYTE *)&v36 + 2);
  v17 = BYTE2(v36) >> 6;
  if (v17)
  {
    if (v17 != 1)
    {
      v22 = 0xE500000000000000;
      v18 = 0x6B72616D78;
      goto LABEL_9;
    }
    v18 = 0x2E6E6F7276656863;
    BYTE2(v36) &= 0x3Fu;
    v19 = (v15 & 1) == 0;
    v20 = 0xEA00000000007075;
    v21 = 0xEC0000007466656CLL;
  }
  else
  {
    v18 = 0x2E6E6F7276656863;
    BYTE2(v36) &= 0x3Fu;
    v19 = (v15 & 1) == 0;
    v20 = 0xEC0000006E776F64;
    v21 = 0xED00007468676972;
  }
  if (v19)
    v22 = v21;
  else
    v22 = v20;
LABEL_9:
  v23 = Image.init(systemName:)(v18, v22, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
  v24 = Image.resizable(capInsets:resizingMode:)(v10, v23, 0.0, 0.0, 0.0, 0.0);
  swift_release(v23);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v25 = *(_BYTE *)(a1 + 10);
  v26 = *(_BYTE *)(a1 + 11);
  v35 = *(_OWORD *)(a1 + 16);
  sub_10000383C(&qword_100032990);
  State.wrappedValue.getter(&v36);
  v27 = v36;
  v28 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)v6 = swift_getKeyPath(&unk_1000234B0);
  v6[8] = 0;
  v29 = &v6[*(int *)(v3 + 20)];
  *(_QWORD *)v29 = swift_getKeyPath(&unk_1000234D8);
  v30 = sub_10000383C((uint64_t *)&unk_100032C40);
  swift_storeEnumTagMultiPayload(v29, v30, 0);
  v31 = &v6[*(int *)(v3 + 24)];
  *v31 = v25;
  v31[1] = v26;
  v31[2] = v27;
  v31[3] = 0;
  v31[4] = v28;
  sub_1000197A8((uint64_t)v6, (uint64_t)&v12[*(int *)(v33 + 36)], type metadata accessor for CameraShapeImage);
  *(_QWORD *)v12 = v24;
  *((_QWORD *)v12 + 1) = 0;
  *((_WORD *)v12 + 8) = 1;
  sub_100019964((uint64_t)v6, type metadata accessor for CameraShapeImage);
  return sub_100005D34((uint64_t)v12, v34, &qword_100033210);
}

uint64_t sub_10001830C@<X0>(uint64_t a1@<X8>)
{
  return sub_100017C14(a1);
}

uint64_t sub_100018344()
{
  uint64_t result;

  result = static Color.primary.getter();
  qword_1000350F0 = result;
  return result;
}

uint64_t sub_100018360()
{
  uint64_t result;

  result = static Color.clear.getter();
  qword_1000350F8 = result;
  return result;
}

uint64_t sub_10001837C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = static Color.secondary.getter();
  v1 = Color.opacity(_:)(0.2);
  result = swift_release(v0);
  qword_100035100 = v1;
  return result;
}

uint64_t sub_1000183BC()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(UIColor), "_carSystemFocusColor");
  result = Color.init(_:)(v0);
  qword_100035108 = result;
  return result;
}

uint64_t sub_1000183F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  __n128 v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  __n128 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v6 = a2 & 1;
  v7 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v45 = *(_QWORD *)(v7 - 8);
  v46 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_10000383C(&qword_1000333F8);
  __chkstk_darwin(v41);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_10000383C(&qword_100033400);
  __chkstk_darwin(v43);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_10000383C(&qword_100033408);
  __chkstk_darwin(v42);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_10000383C(&qword_100033410);
  __chkstk_darwin(v48);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_10000383C(&qword_100033418);
  v18 = __chkstk_darwin(v49);
  v44 = (uint64_t)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = ButtonStyleConfiguration.isPressed.getter(v18);
  v52 = a3;
  v50 = a2;
  if ((v20 & 1) == 0 || (a2 & 0x100) != 0)
  {
    if ((a2 & 0x1000000) != 0)
    {
      if (qword_100032760 != -1)
        swift_once(&qword_100032760, sub_1000183BC);
      v21 = &qword_100035108;
    }
    else
    {
      if (qword_100032758 != -1)
        swift_once(&qword_100032758, sub_10001837C);
      v21 = &qword_100035100;
    }
  }
  else
  {
    if (qword_100032748 != -1)
      swift_once(&qword_100032748, sub_100018344);
    v21 = &qword_1000350F0;
  }
  v22 = *v21;
  v23 = swift_retain(*v21);
  v51 = a1;
  ButtonStyleConfiguration.label.getter(v23);
  v24 = v22;
  v47 = v6;
  if (v6)
  {
    if (qword_100032750 != -1)
      swift_once(&qword_100032750, sub_100018360);
    v24 = qword_1000350F8;
  }
  v25 = swift_retain(v24);
  v26 = static Edge.Set.all.getter(v25);
  v28 = v45;
  v27 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v11, v9, v46);
  v29 = &v11[*(int *)(v41 + 36)];
  *(_QWORD *)v29 = v24;
  v29[8] = v26;
  v30 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v9, v27);
  v31 = static Color.primary.getter(v30);
  KeyPath = swift_getKeyPath(&unk_100023868);
  sub_1000038C4((uint64_t)v11, (uint64_t)v13, &qword_1000333F8);
  v33 = (uint64_t *)&v13[*(int *)(v43 + 36)];
  *v33 = KeyPath;
  v33[1] = v31;
  sub_100003A24((uint64_t)v11, &qword_1000333F8);
  sub_1000038C4((uint64_t)v13, (uint64_t)v15, &qword_100033400);
  v34 = &v15[*(int *)(v42 + 36)];
  *v34 = BYTE4(v50) & 1;
  *(_WORD *)(v34 + 1) = 256;
  sub_100003A24((uint64_t)v13, &qword_100033400);
  v35 = swift_getKeyPath(&unk_100023438);
  v36 = swift_allocObject(&unk_10002DE20, 17, 7);
  *(_BYTE *)(v36 + 16) = v47;
  sub_1000038C4((uint64_t)v15, (uint64_t)v17, &qword_100033408);
  v37 = (uint64_t *)&v17[*(int *)(v48 + 36)];
  *v37 = v35;
  v37[1] = (uint64_t)sub_10001AF34;
  v37[2] = v36;
  sub_100003A24((uint64_t)v15, &qword_100033408);
  LOBYTE(v35) = ButtonStyleConfiguration.isPressed.getter(v38);
  swift_release(v22);
  v39 = v44;
  sub_1000038C4((uint64_t)v17, v44, &qword_100033410);
  *(_BYTE *)(v39 + *(int *)(v49 + 36)) = v35 & 1;
  sub_100003A24((uint64_t)v17, &qword_100033410);
  return sub_100005D34(v39, v52, &qword_100033418);
}

uint64_t sub_100018860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;
  const mach_header_64 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = &_mh_execute_header;
  if (!v2[4])
    v3 = 0;
  v4 = 0x1000000;
  if (!v2[3])
    v4 = 0;
  v5 = 0x10000;
  if (!v2[2])
    v5 = 0;
  v6 = 256;
  if (!v2[1])
    v6 = 0;
  return sub_1000183F8(a1, v6 | *v2 | v5 | v4 | (unint64_t)v3, a2);
}

uint64_t sub_1000188B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  _BYTE *v18;
  __n128 v19;
  double v20;
  char v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t KeyPath;
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  double v50;
  double v51;
  unint64_t v52;
  char *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD v63[3];

  v55 = a1;
  v62 = a2;
  v3 = sub_10000383C(&qword_100033370);
  __chkstk_darwin(v3);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000383C(&qword_100033378);
  __chkstk_darwin(v6);
  v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_10000383C(&qword_100033380);
  __chkstk_darwin(v56);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_10000383C(&qword_100033388);
  __chkstk_darwin(v57);
  v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_10000383C(&qword_100033390);
  __chkstk_darwin(v61);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10000383C(&qword_100033398);
  v59 = *(_QWORD *)(v15 - 8);
  v60 = v15;
  __chkstk_darwin(v15);
  v58 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100018D70();
  v18 = (_BYTE *)(v2 + *(int *)(type metadata accessor for CameraShapeImage(0) + 24));
  v19.n128_u64[0] = 0x3FCC28F5C28F5C29;
  if (v18[3])
    v19.n128_f64[0] = 0.3;
  v20 = v17 * v19.n128_f64[0];
  v21 = static Edge.Set.all.getter(v19);
  v22 = EdgeInsets.init(_all:)(v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = sub_10000383C(&qword_1000333A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v5, v55, v29);
  v30 = &v5[*(int *)(v3 + 36)];
  *v30 = v21;
  *((double *)v30 + 1) = v22;
  *((_QWORD *)v30 + 2) = v24;
  *((_QWORD *)v30 + 3) = v26;
  *((_QWORD *)v30 + 4) = v28;
  v30[40] = 0;
  v31 = sub_100018D70();
  sub_100018D70();
  v33 = v32;
  v35 = static Alignment.center.getter(v34);
  _FrameLayout.init(width:height:alignment:)(v63, *(_QWORD *)&v31, 0, v33, 0, v35, v36);
  sub_1000038C4((uint64_t)v5, (uint64_t)v8, &qword_100033370);
  v37 = &v8[*(int *)(v6 + 36)];
  v38 = v63[1];
  *(_OWORD *)v37 = v63[0];
  *((_OWORD *)v37 + 1) = v38;
  *((_OWORD *)v37 + 2) = v63[2];
  sub_100003A24((uint64_t)v5, &qword_100033370);
  if (v18[1] == 1)
  {
    if (qword_100032748 != -1)
      swift_once(&qword_100032748, sub_100018344);
    v39 = &qword_1000350F0;
  }
  else if (v18[3] == 1)
  {
    if (qword_100032760 != -1)
      swift_once(&qword_100032760, sub_1000183BC);
    v39 = &qword_100035108;
  }
  else
  {
    if (qword_100032758 != -1)
      swift_once(&qword_100032758, sub_10001837C);
    v39 = &qword_100035100;
  }
  v40 = *v39;
  v41 = swift_retain(*v39);
  v42 = static Edge.Set.all.getter(v41);
  sub_1000038C4((uint64_t)v8, (uint64_t)v10, &qword_100033378);
  v43 = &v10[*(int *)(v56 + 36)];
  *(_QWORD *)v43 = v40;
  v43[8] = v42;
  sub_100003A24((uint64_t)v8, &qword_100033378);
  v44 = sub_100018E84();
  KeyPath = swift_getKeyPath(&unk_100023868);
  sub_1000038C4((uint64_t)v10, (uint64_t)v12, &qword_100033380);
  v46 = (uint64_t *)&v12[*(int *)(v57 + 36)];
  *v46 = KeyPath;
  v46[1] = v44;
  sub_100003A24((uint64_t)v10, &qword_100033380);
  LOBYTE(KeyPath) = v18[4];
  sub_1000038C4((uint64_t)v12, (uint64_t)v14, &qword_100033388);
  v47 = v61;
  v48 = &v14[*(int *)(v61 + 36)];
  *v48 = KeyPath;
  *(_WORD *)(v48 + 1) = 256;
  v49 = sub_100003A24((uint64_t)v12, &qword_100033388);
  if (v18[3] == 1)
    static Font.Weight.heavy.getter(v49);
  else
    v50 = static Font.Weight.regular.getter(v49);
  v51 = v50;
  v52 = sub_10001A7A4();
  v53 = v58;
  View.fontWeight(_:)(*(_QWORD *)&v51, 0, v47, v52);
  sub_100003A24((uint64_t)v14, &qword_100033390);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v59 + 32))(v62, v53, v60);
}

double sub_100018D70()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  char v3;
  char v4;
  double v5;

  v1 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CameraShapeImage(0) + 24) + 3);
  v2 = *(_QWORD *)v0;
  v3 = *(_BYTE *)(v0 + 8);
  sub_100003AF0(v2, v3);
  v4 = sub_100008D3C(v2, v3);
  sub_100003B28(v2, v3);
  if (v1 == 1)
  {
    sub_100003AF0(v2, v3);
    sub_100008D3C(v2, v3);
    sub_100003B28(v2, v3);
    if ((v4 & 1) != 0)
      return 16.8;
    else
      return 19.2;
  }
  else
  {
    if ((v4 & 1) != 0)
      v5 = 28.0;
    else
      v5 = 32.0;
    sub_100003AF0(v2, v3);
    sub_100008D3C(v2, v3);
    sub_100003B28(v2, v3);
  }
  return v5;
}

uint64_t sub_100018E84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  int v17;
  __n128 v18;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  int v25;
  int v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;

  v1 = type metadata accessor for ColorScheme(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)((char *)&v33 - v6);
  v8 = type metadata accessor for CameraShapeImage(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v33 - v14;
  v16 = (_BYTE *)(v0 + *(int *)(v12 + 24));
  if ((v16[3] & 1) != 0)
  {
    v17 = v16[2];
    sub_1000197A8(v0, (uint64_t)v10, type metadata accessor for CameraShapeImage);
    if (v17 == 1)
    {
      sub_100019964((uint64_t)v10, type metadata accessor for CameraShapeImage);
      return static Color.secondary.getter(v18);
    }
    else
    {
      v21 = v10[*(int *)(v8 + 24) + 1];
      v22 = sub_100019964((uint64_t)v10, type metadata accessor for CameraShapeImage);
      if (v21 == 1)
        return static Color.secondary.getter(v23);
      else
        return static Color.black.getter(v22);
    }
  }
  else
  {
    if (*v16 == 1)
      v20 = static Color.secondary.getter(v13);
    else
      v20 = static Color.primary.getter(v12);
    v24 = v20;
    v25 = v16[2];
    sub_1000197A8(v0, (uint64_t)v15, type metadata accessor for CameraShapeImage);
    if (v25 == 1)
    {
      sub_100019964((uint64_t)v15, type metadata accessor for CameraShapeImage);
    }
    else
    {
      v26 = v15[*(int *)(v8 + 24) + 1];
      sub_100019964((uint64_t)v15, type metadata accessor for CameraShapeImage);
      if (v26 != 1)
        return v24;
    }
    sub_100009114(v7);
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for ColorScheme.dark(_:), v1);
    v27 = static ColorScheme.== infix(_:_:)(v7, v4);
    v28 = *(void (**)(char *, uint64_t))(v2 + 8);
    v28(v4, v1);
    v29 = ((uint64_t (*)(_QWORD *, uint64_t))v28)(v7, v1);
    if ((v27 & 1) != 0)
      v30 = static Color.black.getter(v29);
    else
      v30 = static Color.white.getter(v29);
    v31 = v30;
    swift_release(v24);
    return v31;
  }
}

_QWORD *sub_1000190DC(_BYTE *a1, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  _QWORD *result;
  uint64_t v4;

  result = a2(&v4);
  *a1 = v4;
  return result;
}

double sub_10001911C@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100023468);
  v5 = swift_getKeyPath(&unk_100023490);
  static Published.subscript.getter(v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)&v7;
  *a2 = v7;
  return result;
}

uint64_t sub_100019198(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100023468);
  v6 = swift_getKeyPath(&unk_100023490);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_100019214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001923C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100019264@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100019290(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_1000192B4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_1000192C4(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1000192E0()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 80));
  return swift_deallocObject(v0, 89, 7);
}

uint64_t sub_100019328(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v5;
  __int128 v6;

  v2 = *a1;
  v6 = *(_OWORD *)(v1 + 72);
  v5 = v2;
  v3 = sub_10000383C(&qword_100032990);
  return State.wrappedValue.setter(&v5, v3);
}

_QWORD *sub_10001937C@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_1000032F8();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for LayoutConfigKey, &type metadata for LayoutConfigKey, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_1000193C8(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_1000032F8();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for LayoutConfigKey, &type metadata for LayoutConfigKey, v1);
}

uint64_t sub_100019410()
{
  return EnvironmentValues.colorScheme.getter();
}

unint64_t sub_100019434()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033258;
  if (!qword_100033258)
  {
    v1 = objc_opt_self(UIScene);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100033258);
  }
  return result;
}

uint64_t sub_100019470()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  sub_100003B28(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  swift_release(*(_QWORD *)(v0 + 96));
  return swift_deallocObject(v0, 105, 7);
}

void sub_1000194C0(char a1)
{
  uint64_t v1;

  sub_100016ED0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + 32);
}

void sub_1000194CC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  void *v24;

  v7 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v12 = __CocoaSet.Index.element.getter(v7, a2);
        v23 = v12;
        v13 = sub_100019434();
        swift_unknownObjectRetain(v12, v14);
        swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v13, 7);
        v4 = v24;
        swift_unknownObjectRelease(v12);
        v15 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v16 = -1 << *(_BYTE *)(a4 + 32);
        v7 = v15 & ~v16;
        if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        {
          v17 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          v18 = static NSObject.== infix(_:_:)(v17);

          if ((v18 & 1) == 0)
          {
            v19 = ~v16;
            do
            {
              v7 = (v7 + 1) & v19;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v21 = static NSObject.== infix(_:_:)(v20);

            }
            while ((v21 & 1) == 0);
          }

LABEL_20:
          v22 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v8 = a4;
  else
    v8 = a4 & 0xFFFFFFFFFFFFFF8;
  v9 = __CocoaSet.element(at:)(a1, a2, v8);
  v23 = v9;
  v10 = sub_100019434();
  swift_unknownObjectRetain(v9, v11);
  swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_100019714(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_100019720(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_1000197A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000197F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100019834()
{
  type metadata accessor for CameraCloseButton(0);
  sub_100017640();
}

uint64_t sub_10001986C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000177F8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100019874()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100019888()
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
  uint64_t v9;

  v1 = type metadata accessor for CameraCloseButton(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;

  sub_100003B28(*(_QWORD *)(v7 + 16), *(_BYTE *)(v7 + 24));
  swift_release(*(_QWORD *)(v7 + 40));
  v8 = v7 + *(int *)(v1 + 28);
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100019928(char *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CameraCloseButton(0) - 8) + 80);
  return sub_100017A0C(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_100019964(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for NavigationButton(uint64_t a1)
{
  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 24));
}

uint64_t initializeWithCopy for NavigationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_retain(v6);
  return a1;
}

uint64_t assignWithCopy for NavigationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  *(_BYTE *)(a1 + 11) = *(_BYTE *)(a2 + 11);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  swift_retain(v9);
  swift_release(v8);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for NavigationButton(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100003B28(v6, v7);
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
  *(_BYTE *)(a1 + 11) = *((_BYTE *)a2 + 11);
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_release(v8);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NavigationButton(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NavigationButton(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NavigationButton()
{
  return &type metadata for NavigationButton;
}

ValueMetadata *type metadata accessor for IsPressedButtonStyleKey()
{
  return &type metadata for IsPressedButtonStyleKey;
}

uint64_t initializeBufferWithCopyOfBuffer for CameraButtonConfiguration(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CustomButtonStyle()
{
  return &type metadata for CustomButtonStyle;
}

unint64_t sub_100019C4C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v15);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_100003AF0(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)(a1 + v9);
    v11 = (uint64_t *)(a2 + v9);
    v12 = sub_10000383C((uint64_t *)&unk_100032C40);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v16 = *v11;
      *v10 = *v11;
      swift_retain(v16);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
    v17 = *(int *)(a3 + 24);
    v18 = a1 + v17;
    v19 = a2 + v17;
    *(_DWORD *)v18 = *(_DWORD *)v19;
    *(_BYTE *)(v18 + 4) = *(_BYTE *)(v19 + 4);
  }
  return a1;
}

uint64_t sub_100019D5C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  sub_100003B28(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v5 = sub_10000383C((uint64_t *)&unk_100032C40);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for ColorScheme(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t sub_100019DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(int *)(a3 + 20);
  v9 = (uint64_t *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = sub_10000383C((uint64_t *)&unk_100032C40);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    v13 = 1;
  }
  else
  {
    v14 = *v10;
    *v9 = *v10;
    swift_retain(v14);
    v13 = 0;
  }
  swift_storeEnumTagMultiPayload(v9, v11, v13);
  v15 = *(int *)(a3 + 24);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_DWORD *)v16 = *(_DWORD *)v17;
  *(_BYTE *)(v16 + 4) = *(_BYTE *)(v17 + 4);
  return a1;
}

uint64_t sub_100019EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_100003AF0(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100003B28(v8, v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 20);
    v11 = (uint64_t *)(a1 + v10);
    v12 = (uint64_t *)(a2 + v10);
    sub_100003A24(a1 + v10, (uint64_t *)&unk_100032C40);
    v13 = sub_10000383C((uint64_t *)&unk_100032C40);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
      v15 = 1;
    }
    else
    {
      v16 = *v12;
      *v11 = *v12;
      swift_retain(v16);
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v13, v15);
  }
  v17 = *(int *)(a3 + 24);
  v18 = (_BYTE *)(a1 + v17);
  v19 = (_BYTE *)(a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  v18[2] = v19[2];
  v18[3] = v19[3];
  v18[4] = v19[4];
  return a1;
}

uint64_t sub_100019FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 20);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_10000383C((uint64_t *)&unk_100032C40);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for ColorScheme(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  *(_BYTE *)(v12 + 4) = *(_BYTE *)(v13 + 4);
  return a1;
}

uint64_t sub_10001A0B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100003B28(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    v10 = *(int *)(a3 + 20);
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    sub_100003A24(a1 + v10, (uint64_t *)&unk_100032C40);
    v13 = sub_10000383C((uint64_t *)&unk_100032C40);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for ColorScheme(0);
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload(v11, v13, 1);
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = *(int *)(a3 + 24);
  v16 = (_BYTE *)(a1 + v15);
  v17 = (char *)a2 + v15;
  *v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  v16[3] = v17[3];
  v16[4] = v17[4];
  return a1;
}

uint64_t sub_10001A1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A1DC);
}

uint64_t sub_10001A1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1)
      return (v4 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v8 = sub_10000383C(&qword_100033268);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_10001A254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A260);
}

uint64_t sub_10001A260(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 8) = -(char)a2;
  }
  else
  {
    v7 = sub_10000383C(&qword_100033268);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_10001A2D4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100023350;
  sub_10001A350(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_100023588;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10001A350(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000332D8)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000332D8);
  }
}

uint64_t storeEnumTagSinglePayload for CameraButtonShapeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001A3F0 + 4 * byte_1000232F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001A424 + 4 * byte_1000232F0[v4]))();
}

uint64_t sub_10001A424(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A42C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001A434);
  return result;
}

uint64_t sub_10001A440(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001A448);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001A44C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A454(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CameraButtonShapeType()
{
  return &type metadata for CameraButtonShapeType;
}

unint64_t sub_10001A474()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033310;
  if (!qword_100033310)
  {
    v1 = sub_100003908(&qword_100033248);
    sub_10001A4F8();
    sub_100005E44(&qword_100033330, &qword_100033338, (uint64_t)&protocol conformance descriptor for _PreferenceActionModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033310);
  }
  return result;
}

unint64_t sub_10001A4F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100033318;
  if (!qword_100033318)
  {
    v1 = sub_100003908(&qword_100033208);
    v2[0] = sub_100003908(&qword_1000331F8);
    v2[1] = &type metadata for CustomButtonStyle;
    v2[2] = sub_100005E44(&qword_100033238, &qword_1000331F8, (uint64_t)&protocol conformance descriptor for Button<A>);
    v2[3] = sub_100017BD0();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    sub_100005E44(&qword_100033320, &qword_100033328, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033318);
  }
  return result;
}

uint64_t sub_10001A5D8()
{
  return sub_100005E44(&qword_100033340, &qword_100033348, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

unint64_t sub_10001A608()
{
  unint64_t result;

  result = qword_100033350;
  if (!qword_100033350)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyAnimatableData, &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_100033350);
  }
  return result;
}

unint64_t sub_10001A650()
{
  unint64_t result;

  result = qword_100033358;
  if (!qword_100033358)
  {
    result = swift_getWitnessTable(&unk_100023608, &type metadata for CameraButtonShapeType);
    atomic_store(result, (unint64_t *)&qword_100033358);
  }
  return result;
}

unint64_t sub_10001A698()
{
  unint64_t result;

  result = qword_100033360;
  if (!qword_100033360)
  {
    result = swift_getWitnessTable(&unk_1000235B8, &type metadata for CameraButtonShapeType);
    atomic_store(result, (unint64_t *)&qword_100033360);
  }
  return result;
}

unint64_t sub_10001A6E0()
{
  unint64_t result;

  result = qword_100033368;
  if (!qword_100033368)
  {
    result = swift_getWitnessTable(&unk_100023720, &type metadata for CameraButtonShapeType);
    atomic_store(result, (unint64_t *)&qword_100033368);
  }
  return result;
}

uint64_t sub_10001A724(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000251D4, 1);
}

uint64_t sub_10001A734(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000251AC, 1);
}

uint64_t sub_10001A744(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100025184, 1);
}

uint64_t sub_10001A754@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001A77C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_10001A7A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000333A8;
  if (!qword_1000333A8)
  {
    v1 = sub_100003908(&qword_100033390);
    sub_10001A828();
    sub_100005E44(&qword_1000333E8, &qword_1000333F0, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000333A8);
  }
  return result;
}

unint64_t sub_10001A828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000333B0;
  if (!qword_1000333B0)
  {
    v1 = sub_100003908(&qword_100033388);
    sub_10001A8AC();
    sub_100005E44(&qword_1000333D8, &qword_1000333E0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000333B0);
  }
  return result;
}

unint64_t sub_10001A8AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000333B8;
  if (!qword_1000333B8)
  {
    v1 = sub_100003908(&qword_100033380);
    sub_10001A930();
    sub_100005E44(&qword_100033038, &qword_100033040, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000333B8);
  }
  return result;
}

unint64_t sub_10001A930()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000333C0;
  if (!qword_1000333C0)
  {
    v1 = sub_100003908(&qword_100033378);
    sub_10001A99C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000333C0);
  }
  return result;
}

unint64_t sub_10001A99C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000333C8;
  if (!qword_1000333C8)
  {
    v1 = sub_100003908(&qword_100033370);
    sub_100005E44(&qword_1000333D0, &qword_1000333A0, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000333C8);
  }
  return result;
}

uint64_t sub_10001AA20()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

void sub_10001AA34()
{
  sub_100017F30();
}

uint64_t sub_10001AA3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100017FFC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10001AA44(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100003AF0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_retain(v2);
  return a1;
}

uint64_t sub_10001AA7C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001AA90()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 49, 7);
}

uint64_t sub_10001AAC0(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v5;
  __int128 v6;

  v2 = *a1;
  v6 = *(_OWORD *)(v1 + 32);
  v5 = v2;
  v3 = sub_10000383C(&qword_100032990);
  return State.wrappedValue.setter(&v5, v3);
}

_BYTE *sub_10001AB0C(_BYTE *a1, _BYTE *a2)
{
  initializeBufferWithCopyOfBuffer for LayoutConfig(a2, a1);
  return a2;
}

unint64_t sub_10001AB48()
{
  unint64_t result;

  result = qword_100033420;
  if (!qword_100033420)
  {
    result = swift_getWitnessTable(&unk_100023658, &type metadata for CameraButtonShapeType);
    atomic_store(result, (unint64_t *)&qword_100033420);
  }
  return result;
}

uint64_t _s9CarCamera25CameraButtonConfigurationVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[5])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s9CarCamera25CameraButtonConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraButtonConfiguration()
{
  return &type metadata for CameraButtonConfiguration;
}

uint64_t sub_10001AC34()
{
  _QWORD v1[2];

  v1[0] = sub_100003908(&qword_100033390);
  v1[1] = sub_10001A7A4();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.fontWeight(_:)>>, 1);
}

unint64_t sub_10001AC84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033428;
  if (!qword_100033428)
  {
    v1 = sub_100003908(&qword_100033418);
    sub_10001AD08();
    sub_100005E44(&qword_100033458, &qword_100033460, (uint64_t)&protocol conformance descriptor for _PreferenceWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033428);
  }
  return result;
}

unint64_t sub_10001AD08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033430;
  if (!qword_100033430)
  {
    v1 = sub_100003908(&qword_100033410);
    sub_10001AD8C();
    sub_100005E44(&qword_100033320, &qword_100033328, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033430);
  }
  return result;
}

unint64_t sub_10001AD8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033438;
  if (!qword_100033438)
  {
    v1 = sub_100003908(&qword_100033408);
    sub_10001AE10();
    sub_100005E44(&qword_1000333E8, &qword_1000333F0, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033438);
  }
  return result;
}

unint64_t sub_10001AE10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033440;
  if (!qword_100033440)
  {
    v1 = sub_100003908(&qword_100033400);
    sub_10001AE94();
    sub_100005E44(&qword_1000333D8, &qword_1000333E0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033440);
  }
  return result;
}

unint64_t sub_10001AE94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033448;
  if (!qword_100033448)
  {
    v1 = sub_100003908(&qword_1000333F8);
    sub_100005CF4(&qword_100033450, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label, (uint64_t)&protocol conformance descriptor for ButtonStyleConfiguration.Label);
    sub_100005E44(&qword_100033038, &qword_100033040, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033448);
  }
  return result;
}

BOOL sub_10001AF38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

double sub_10001AF4C@<D0>(uint64_t a1@<X8>)
{
  return sub_10001AFF8((uint64_t)&unk_1000239C0, (uint64_t)&unk_1000239E8, a1);
}

uint64_t sub_10001AF60()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100023A98);
  v2 = swift_getKeyPath(&unk_100023AC0);
  static Published.subscript.getter(v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

double sub_10001AFD0@<D0>(uint64_t a1@<X8>)
{
  return sub_10001AFF8((uint64_t)&unk_100023A08, (uint64_t)&unk_100023A30, a1);
}

double sub_10001AFE4@<D0>(uint64_t a1@<X8>)
{
  return sub_10001AFF8((uint64_t)&unk_100023A50, (uint64_t)&unk_100023A78, a1);
}

double sub_10001AFF8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v7;
  double result;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  KeyPath = swift_getKeyPath(a1);
  v7 = swift_getKeyPath(a2);
  static Published.subscript.getter(v3, KeyPath, v7);
  swift_release(KeyPath);
  swift_release(v7);
  result = *(double *)&v9;
  *(_OWORD *)a3 = v9;
  *(_OWORD *)(a3 + 16) = v10;
  *(_QWORD *)(a3 + 32) = v11;
  return result;
}

void sub_10001B070(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
  if (v2 <= a1)
  {
    if (v2 < a1
      && *(double *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize) > 0.0
      && *(uint64_t *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount) >= 1)
    {
      v3 = 0;
      goto LABEL_9;
    }
  }
  else if (*(double *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize) > 0.0
         && *(uint64_t *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount) > 0)
  {
    v3 = 1;
LABEL_9:
    *(_BYTE *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState + 56) = v3;
    sub_10001D9CC(0xD000000000000011, 0x80000001000245F0);
  }
}

void sub_10001B114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t KeyPath;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350C0);
  v4 = swift_retain_n(v1, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  v7 = &qword_100033000;
  if (os_log_type_enabled(v5, v6))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    *(_DWORD *)v8 = 136315138;
    v25 = 0;
    v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange + 8);
    v28 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
    v29 = v9;
    v26 = 0xE000000000000000;
    v27 = v10;
    _print_unlocked<A, B>(_:_:)(&v28, &v25, &type metadata for Int, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v11._countAndFlagsBits = 3026478;
    v11._object = (void *)0xE300000000000000;
    String.append(_:)(v11);
    v7 = &qword_100033000;
    _print_unlocked<A, B>(_:_:)(&v27, &v25, &type metadata for Int, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v3 = v26;
    v25 = (_QWORD *)sub_10000934C((uint64_t)v25, v26, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v8 + 4, v8 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[visibleIndexRange] %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v12 = v1 + v7[147];
  v13 = *(_QWORD *)(v12 + 8);
  v14 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
    goto LABEL_20;
  }
  v5 = *(NSObject **)v12;
  if ((*(_QWORD *)v12 & 0x8000000000000000) != 0)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries);
  v15 = *(_QWORD *)(v3 + 16);
  if (v15 < (unint64_t)v5 || (uint64_t)v15 < v14)
    goto LABEL_21;
  if (v14 < 0)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRelease();
    v22 = sub_10001EE20(v3, v3 + 32, (uint64_t)v5, (2 * v14) | 1);
    goto LABEL_18;
  }
  v17 = type metadata accessor for __ContiguousArrayStorageBase(0);
  v18 = swift_bridgeObjectRetain(v3);
  v19 = swift_unknownObjectRetain_n(v18, 2);
  v20 = (_QWORD *)swift_dynamicCastClass(v19, v17);
  if (!v20)
  {
    swift_bridgeObjectRelease();
    v20 = _swiftEmptyArrayStorage;
  }
  v21 = v20[2];
  swift_release(v20);
  if (v21 != v14 - (_QWORD)v5)
    goto LABEL_23;
  v22 = (_QWORD *)swift_dynamicCastClass(v3, v17);
  if (!v22)
  {
    swift_bridgeObjectRelease();
    v22 = _swiftEmptyArrayStorage;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath(&unk_100023A98);
  v24 = swift_getKeyPath(&unk_100023AC0);
  v25 = v22;
  swift_retain(v1);
  static Published.subscript.setter(&v25, v1, KeyPath, v24);
  sub_10001C4FC();
}

void sub_10001B468(double a1, double a2)
{
  uint64_t v2;
  double *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  __int128 v21;
  uint64_t v22;

  v3 = (double *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize);
  if (*(double *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize) != a1
    || *(double *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize + 8) != a2)
  {
    v5 = v2;
    if (qword_100032740 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v6 = type metadata accessor for Logger(0);
    sub_100007524(v6, (uint64_t)qword_1000350C0);
    v7 = swift_retain_n(v2, 2);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = swift_slowAlloc(32, -1);
      v22 = v11;
      *(_DWORD *)v10 = 136315138;
      v21 = *(_OWORD *)v3;
      type metadata accessor for CGSize(0);
      v13 = String.init<A>(describing:)(&v21, v12);
      *(_QWORD *)&v21 = sub_10000934C(v13, v14, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, (char *)&v21 + 8, v10 + 4, v10 + 12);
      swift_release_n(v5, 2);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "fullSize %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

      swift_release_n(v5, 2);
    }
    v15 = *v3;
    v16 = v3[1] + -50.0;
    v17 = (double *)(v5 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
    v18 = *(double *)(v5 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
    v19 = *(double *)(v5 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize + 8);
    *v17 = *v3;
    v17[1] = v16;
    if (v18 != v15 || v19 != v16)
      sub_10001C1E0();
  }
}

uint64_t sub_10001B674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];

  v2 = v1;
  v4 = sub_10000383C(&qword_1000337F8);
  v21 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = sub_10000383C(&qword_100033800);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess(a1 + OBJC_IVAR____TtC9CarCamera11CameraModel__visibleButtons, v22, 33, 0);
  v11 = sub_10000383C(&qword_100032E88);
  Published.projectedValue.getter(v11);
  swift_endAccess(v22);
  v12 = swift_allocObject(&unk_10002E1B0, 24, 7);
  swift_weakInit(v12 + 16, v1);
  v13 = sub_10001F4C4(&qword_100033808, &qword_100033800);
  v14 = Publisher<>.sink(receiveValue:)(sub_10001F4B4, v12, v7, v13);
  swift_release(v12);
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  v15 = v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_cancellables;
  swift_beginAccess(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_cancellables, v22, 33, 0);
  AnyCancellable.store(in:)(v15);
  swift_endAccess(v22);
  swift_release(v14);
  swift_beginAccess(a1 + OBJC_IVAR____TtC9CarCamera11CameraModel__cameraCloseButton, v22, 33, 0);
  v16 = sub_10000383C(&qword_100032E90);
  Published.projectedValue.getter(v16);
  swift_endAccess(v22);
  v17 = swift_allocObject(&unk_10002E1B0, 24, 7);
  swift_weakInit(v17 + 16, v2);
  v18 = sub_10001F4C4(&qword_100033810, &qword_1000337F8);
  v19 = Publisher<>.sink(receiveValue:)(sub_10001F4BC, v17, v4, v18);
  swift_release(v17);
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v6, v4);
  swift_beginAccess(v15, v22, 33, 0);
  AnyCancellable.store(in:)(v15);
  swift_endAccess(v22);
  return swift_release(v19);
}

uint64_t sub_10001B8F8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t result;
  uint64_t v10;
  _BYTE v11[24];

  v2 = *a1;
  v3 = a2 + 16;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100007524(v4, (uint64_t)qword_1000350C0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[ButtonBarLayout] model.$visibleButtons has changed", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  swift_beginAccess(v3, v11, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v10 = result;
    sub_10001D450(v2, 0, 0, 1);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_10001BA1C(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t Strong;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[24];

  v4 = sub_10000383C(&qword_100032E58);
  __chkstk_darwin(v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CameraCloseButton(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v38 - v12;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v14 = a2 + 16;
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100007524(v15, (uint64_t)qword_1000350C0);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "model.$cameraCloseButton has changed", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  sub_10000EF8C(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000EFD4((uint64_t)v6);
    swift_beginAccess(v14, v41, 0, 0);
    result = swift_weakLoadStrong(v14);
    if (result)
    {
      v21 = result;
      KeyPath = swift_getKeyPath(&unk_1000239C0);
      v23 = swift_getKeyPath(&unk_1000239E8);
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
      swift_retain(v21);
      static Published.subscript.setter(&v38, v21, KeyPath, v23);
      sub_10001BD98();
      return swift_release(v21);
    }
  }
  else
  {
    sub_1000197F0((uint64_t)v6, (uint64_t)v13);
    swift_beginAccess(v14, v41, 0, 0);
    Strong = swift_weakLoadStrong(v14);
    if (Strong)
    {
      v25 = Strong;
      v26 = type metadata accessor for ButtonBarEntity();
      v27 = swift_allocObject(v26, 104, 7);
      sub_10001F504((uint64_t)v13, (uint64_t)v11);
      v28 = sub_10001F2A0((uint64_t)v11, 0, 0, (uint64_t)sub_1000214A8, 0, v27);
      v29 = type metadata accessor for CameraModel(0);
      v30 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
      v31 = (void *)EnvironmentObject.init()(v29, v30);
      v33 = v32;
      v34 = swift_getKeyPath(&unk_100023B28);
      v35 = swift_getKeyPath(&unk_1000239C0);
      v36 = swift_getKeyPath(&unk_1000239E8);
      *(_QWORD *)&v38 = v31;
      *((_QWORD *)&v38 + 1) = v33;
      v39 = (unint64_t)v34;
      v40 = v28;
      v37 = v31;
      swift_retain(v34);
      swift_retain(v28);
      swift_retain(v25);
      static Published.subscript.setter(&v38, v25, v35, v36);
      sub_10001BD98();
      swift_release(v25);
      swift_release(v28);
      swift_release(v34);

    }
    return sub_10001F548((uint64_t)v13);
  }
  return result;
}

void sub_10001BD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double *v3;
  double *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22[3];
  uint64_t v23;
  uint64_t v24;

  v3 = (double *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
  if (*(_BYTE *)(v1 + 16))
    v4 = (double *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize + 8);
  else
    v4 = (double *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
  v5 = 36.0;
  if (*(_BYTE *)(v1 + 16))
    v5 = 32.0;
  v6 = *v4 / v5;
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    swift_once(&qword_100032740, sub_100007E8C);
    goto LABEL_16;
  }
  v0 = v1;
  v2 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount;
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount) = (uint64_t)v6;
  if (v7 != (uint64_t)v6)
    sub_10001C08C();
  KeyPath = swift_getKeyPath(&unk_1000239C0);
  v9 = swift_getKeyPath(&unk_1000239E8);
  static Published.subscript.getter(v0, KeyPath, v9);
  swift_release(KeyPath);
  swift_release(v9);
  sub_100005B3C(v22[0], (uint64_t)v22[1], (uint64_t)v22[2], v23, v24);
  if (v24)
  {
    v10 = *(_QWORD *)(v0 + v2);
    v11 = v10 - 1;
    if (__OFSUB__(v10, 1))
    {
      __break(1u);
      return;
    }
    *(_QWORD *)(v0 + v2) = v11;
    if (v10 != v11)
      sub_10001C08C();
  }
  if (qword_100032740 != -1)
    goto LABEL_22;
LABEL_16:
  v12 = type metadata accessor for Logger(0);
  sub_100007524(v12, (uint64_t)qword_1000350C0);
  v13 = swift_retain_n(v0, 4);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(22, -1);
    v17 = (void *)swift_slowAlloc(32, -1);
    v22[0] = v17;
    *(_DWORD *)v16 = 136315394;
    v18 = CGSize.debugDescription.getter(*v3, v3[1]);
    v21 = sub_10000934C(v18, v19, (uint64_t *)v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v16 + 4, v16 + 12);
    swift_release_n(v0, 2);
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2048;
    v20 = *(_QWORD *)(v0 + v2);
    swift_release(v0);
    v21 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v16 + 14, v16 + 22);
    swift_release(v0);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[ButtonBarLayout] fitCount for contentSize %s is %ld", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

    swift_release_n(v0, 4);
  }
}

void sub_10001C08C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v2 = type metadata accessor for Logger(0);
  sub_100007524(v2, (uint64_t)qword_1000350C0);
  v3 = swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v6 = 134217984;
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v6 + 4, v6 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[ButtonBarLayout] fitCountDidChange %ld", v6, 0xCu);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  sub_10001D9CC(0xD000000000000013, 0x8000000100024680);
}

void sub_10001C1E0()
{
  uint64_t v0;
  uint64_t v1;
  double *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = (double *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
  if (*(double *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize) <= 0.0)
  {
    if (qword_100032740 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v11 = type metadata accessor for Logger(0);
    sub_100007524(v11, (uint64_t)qword_1000350C0);
    v12 = swift_retain_n(v0, 2);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v20 = v16;
      *(_DWORD *)v15 = 136315138;
      v17 = CGSize.debugDescription.getter(*v2, v2[1]);
      v19 = sub_10000934C(v17, v18, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v15 + 4, v15 + 12);
      swift_release_n(v1, 2);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[ButtonBarLayout] invalid contentSize %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

    }
    else
    {

      swift_release_n(v1, 2);
    }
  }
  else
  {
    if (qword_100032740 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v3 = type metadata accessor for Logger(0);
    sub_100007524(v3, (uint64_t)qword_1000350C0);
    v4 = swift_retain_n(v0, 2);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = swift_slowAlloc(32, -1);
      v20 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = CGSize.debugDescription.getter(*v2, v2[1]);
      v19 = sub_10000934C(v9, v10, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v7 + 4, v7 + 12);
      swift_release_n(v1, 2);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[ButtonBarLayout] frameDidUpdate %s", v7, 0xCu);
      swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);

    }
    else
    {

      swift_release_n(v1, 2);
    }
    sub_10001C4FC();
    sub_10001BD98();
  }
}

void sub_10001C4FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
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
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  __int16 v59;
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  char v65;
  __int16 v66;
  char v67;
  uint64_t v68;
  char v69;

  v1 = v0;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007524(v2, (uint64_t)qword_1000350C0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[ButtonBarLayout] updateNavigationButtons", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange + 8);
  if (v8 < *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries) + 16);
  if (v8 >= v9 - 1)
  {
    KeyPath = swift_getKeyPath(&unk_100023A08);
    v32 = swift_getKeyPath(&unk_100023A30);
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    swift_retain(v1);
    v28 = v1;
    v29 = KeyPath;
    v30 = v32;
    goto LABEL_13;
  }
  v10 = __OFSUB__(v9, v8);
  v11 = v9 - v8;
  if (v10)
    goto LABEL_21;
  v12 = v11 - 1;
  if (__OFSUB__(v11, 1))
  {
LABEL_22:
    __break(1u);
    return;
  }
  v13 = swift_getKeyPath(&unk_100023A08);
  v14 = swift_getKeyPath(&unk_100023A30);
  static Published.subscript.getter(v1, v13, v14);
  swift_release(v13);
  swift_release(v14);
  sub_100005B3C((void *)v53, *((uint64_t *)&v53 + 1), v54, SBYTE8(v54), v55);
  if (!v55 && v12 > 1)
  {
    v15 = *(_BYTE *)(v1 + 16);
    v16 = swift_getKeyPath(&unk_100023B28);
    LOBYTE(v63) = 0;
    State.init(wrappedValue:)(&v53, &v63, &type metadata for Bool);
    v63 = v16;
    v64 = 0;
    v65 = v15;
    v66 = 0;
    v67 = v53;
    v68 = *((_QWORD *)&v53 + 1);
    v69 = 0;
    v17 = type metadata accessor for ButtonBarEntity();
    v18 = swift_allocObject(v17, 104, 7);
    v19 = sub_10001F130((uint64_t)&v63, 0xD000000000000015, 0x8000000100024660, (uint64_t)sub_1000214B4, 0, v18);
    v20 = type metadata accessor for CameraModel(0);
    v21 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
    v22 = EnvironmentObject.init()(v20, v21);
    v24 = v23;
    v25 = swift_getKeyPath(&unk_100023B28);
    v26 = swift_getKeyPath(&unk_100023A08);
    v27 = swift_getKeyPath(&unk_100023A30);
    *(_QWORD *)&v53 = v22;
    *((_QWORD *)&v53 + 1) = v24;
    v54 = (unint64_t)v25;
    v55 = v19;
    swift_retain(v1);
    v28 = v1;
    v29 = v26;
    v30 = v27;
LABEL_13:
    static Published.subscript.setter(&v53, v28, v29, v30);
  }
  v33 = *v7;
  v34 = swift_getKeyPath(&unk_100023A50);
  v35 = swift_getKeyPath(&unk_100023A78);
  if (v33 < 1)
  {
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    swift_retain(v1);
    v50 = v1;
    v51 = v34;
    v52 = v35;
  }
  else
  {
    static Published.subscript.getter(v1, v34, v35);
    swift_release(v34);
    swift_release(v35);
    v36 = v55;
    sub_100005B3C((void *)v53, *((uint64_t *)&v53 + 1), v54, SBYTE8(v54), v55);
    if (v36)
      return;
    v37 = *(_BYTE *)(v1 + 16) | 0x40;
    v38 = swift_getKeyPath(&unk_100023B28);
    LOBYTE(v56) = 0;
    State.init(wrappedValue:)(&v53, &v56, &type metadata for Bool);
    v56 = v38;
    v57 = 0;
    v58 = v37;
    v59 = 0;
    v60 = v53;
    v61 = *((_QWORD *)&v53 + 1);
    v62 = 0;
    v39 = type metadata accessor for ButtonBarEntity();
    v40 = swift_allocObject(v39, 104, 7);
    v41 = sub_10001F130((uint64_t)&v56, 0xD000000000000019, 0x8000000100024640, (uint64_t)sub_1000214B4, 0, v40);
    v42 = type metadata accessor for CameraModel(0);
    v43 = sub_100005CF4((unint64_t *)&qword_100032810, type metadata accessor for CameraModel, (uint64_t)&unk_100022F50);
    v44 = EnvironmentObject.init()(v42, v43);
    v46 = v45;
    v47 = swift_getKeyPath(&unk_100023B28);
    v48 = swift_getKeyPath(&unk_100023A50);
    v49 = swift_getKeyPath(&unk_100023A78);
    *(_QWORD *)&v53 = v44;
    *((_QWORD *)&v53 + 1) = v46;
    v54 = (unint64_t)v47;
    v55 = v41;
    swift_retain(v1);
    v50 = v1;
    v51 = v48;
    v52 = v49;
  }
  static Published.subscript.setter(&v53, v50, v51, v52);
}

void sub_10001C9D0(Swift::String *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t countAndFlagsBits;
  BOOL v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  void (*object)(Swift::String *);
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void (*v43)(Swift::String *);
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;

  v2 = v1;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350C0);
  v5 = swift_retain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    *(_DWORD *)v8 = 136315138;
    v47 = v9;
    swift_retain(a1);
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v45 = 0xD000000000000012;
    v46 = 0x8000000100023F20;
    String.append(_:)(a1[1]);
    v10._countAndFlagsBits = 62;
    v10._object = (void *)0xE100000000000000;
    String.append(_:)(v10);
    swift_release(a1);
    v45 = sub_10000934C(0xD000000000000012, 0x8000000100023F20, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v8 + 4, v8 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[ButtonBarLayout] handleAction - %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    v11 = v9;
    v2 = v1;
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    v13 = *(void **)(v1 + 24);
    if (v13)
      goto LABEL_5;
  }
  else
  {

    v12 = swift_release_n(a1, 2);
    v13 = *(void **)(v1 + 24);
    if (v13)
    {
LABEL_5:
      v14 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState + 40);
      if (v14)
      {
        v15 = *(_QWORD *)(v14 + 16);
        v16 = *(void **)(v14 + 24);
        countAndFlagsBits = a1[1]._countAndFlagsBits;
        v18 = v15 == countAndFlagsBits && v16 == a1[1]._object;
        if (v18 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, countAndFlagsBits) & 1) != 0)
        {
          v19 = v13;
          swift_retain(v14);
          sub_10001D290((uint64_t)a1, 0);

          swift_release(v14);
        }
        else
        {
          v33 = v13;
          v34 = swift_retain(v14);
          v35 = Logger.logObject.getter(v34);
          v36 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v37 = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "[ButtonBarEntity] performAction", v37, 2u);
            swift_slowDealloc(v37, -1, -1);
          }

          object = (void (*)(Swift::String *))a1[5]._object;
          if (object)
          {
            v39 = a1[6]._countAndFlagsBits;
            swift_retain(v39);
            object(a1);
            sub_100006B6C((uint64_t)object, v39);
          }
          swift_retain(v14);
          sub_10001D290((uint64_t)a1, v14);

          swift_release_n(v14, 2);
        }
        return;
      }
      v23 = v13;
      v24 = sub_10001E178((uint64_t)a1);
      v26 = (uint64_t)a1[4]._object;
      v25 = a1[5]._countAndFlagsBits;
      if ((v24 & 1) != 0)
      {
        if (v25)
        {
          swift_bridgeObjectRetain(a1[5]._countAndFlagsBits);
          sub_10001D014(a1);
          if (qword_100032738 != -1)
            swift_once(&qword_100032738, sub_100007E68);
          v27 = sub_100007524(v4, (uint64_t)qword_1000350A8);
          v28 = Logger.logObject.getter(v27);
          v29 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v28, v29))
          {
            v30 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v30 = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "[ButtonBarLayout] enterSubmenu", v30, 2u);
            swift_slowDealloc(v30, -1, -1);
          }

          sub_10000CE50(v26, v25);
          swift_bridgeObjectRelease();
          v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
          *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page) = 0;
          goto LABEL_29;
        }
      }
      else if (v25)
      {
        if (v26 == 0xD000000000000015 && v25 == 0x8000000100024660
          || (_stringCompareWithSmolCheck(_:_:expecting:)(a1[4]._object, a1[5]._countAndFlagsBits, 0xD000000000000015) & 1) != 0)
        {
          v31 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page;
          v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
          v32 = v24 + 1;
          if (__OFADD__(v24, 1))
          {
            __break(1u);
            return;
          }
        }
        else
        {
          if (v26 != 0xD000000000000019 || v25 != 0x8000000100024640)
          {
            v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v25, 0xD000000000000019);
            if ((v24 & 1) == 0)
              goto LABEL_41;
          }
          v31 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page;
          v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
          v32 = v24 - 1;
          if (__OFSUB__(v24, 1))
          {
            __break(1u);
            goto LABEL_41;
          }
        }
        *(_QWORD *)(v2 + v31) = v32;
LABEL_29:
        sub_10001B070(v24);
LABEL_45:

        return;
      }
LABEL_41:
      v40 = Logger.logObject.getter(v24);
      v41 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "[ButtonBarEntity] performAction", v42, 2u);
        swift_slowDealloc(v42, -1, -1);
      }

      v43 = (void (*)(Swift::String *))a1[5]._object;
      if (v43)
      {
        v44 = a1[6]._countAndFlagsBits;
        swift_retain(v44);
        v43(a1);
        sub_100006B6C((uint64_t)v43, v44);
      }
      goto LABEL_45;
    }
  }
  v20 = Logger.logObject.getter(v12);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "[ButtonBarLayout] model nil", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }

}

uint64_t sub_10001D014(Swift::String *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = v1;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350C0);
  v5 = swift_retain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    *(_DWORD *)v8 = 136315138;
    v17 = v9;
    swift_retain(a1);
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v15 = 0xD000000000000012;
    v16 = 0x8000000100023F20;
    String.append(_:)(a1[1]);
    v10._countAndFlagsBits = 62;
    v10._object = (void *)0xE100000000000000;
    String.append(_:)(v10);
    swift_release(a1);
    v15 = sub_10000934C(0xD000000000000012, 0x8000000100023F20, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v8 + 4, v8 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[ButtonBarLayout] saveTransitionState - %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release_n(a1, 2);
  }
  v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries);
  v12 = v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v12 + 8) = *(_OWORD *)(v1 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
  *(_BYTE *)(v12 + 24) = 0;
  v13 = *(_QWORD *)(v12 + 40);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
  *(_QWORD *)(v12 + 40) = a1;
  swift_retain(a1);
  result = swift_release(v13);
  *(_BYTE *)(v12 + 56) = 2;
  *(_QWORD *)(v12 + 48) = -1;
  return result;
}

uint64_t sub_10001D290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];

  v3 = v2;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100007524(v6, (uint64_t)qword_1000350C0);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[ButtonBarLayout] showTopLevel", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = *(void **)(v3 + 24);
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 80);
    if (a2)
    {
      a2 = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRetain(a2);
    }
    KeyPath = swift_getKeyPath(&unk_100023AE0);
    v15 = swift_getKeyPath(&unk_100023B08);
    v20[0] = 0;
    v20[1] = 0;
    swift_bridgeObjectRetain(v13);
    v16 = v11;
    static Published.subscript.setter(v20, v16, KeyPath, v15);
    if (a2)
    {
      sub_10000F014(v12, v13);

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AA88();

    }
    swift_bridgeObjectRelease();
  }
  v17 = (_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState);
  v18 = v17[5];
  v17[5] = 0;
  swift_release(v18);
  *v17 = _swiftEmptyArrayStorage;
  return swift_bridgeObjectRelease();
}

void sub_10001D450(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t type;
  NSObject *log;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = v4;
    if (qword_100032740 != -1)
      swift_once(&qword_100032740, sub_100007E8C);
    v11 = type metadata accessor for Logger(0);
    sub_100007524(v11, (uint64_t)qword_1000350C0);
    v12 = swift_bridgeObjectRetain(a1);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v15 = 134217984;
      v59 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[ButtonBarLayout] updateDatasource - %ld", v15, 0xCu);
      swift_slowDealloc(v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v16 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries;
    *(_QWORD *)(v6 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries) = a1;
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v6 + v16);
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v51 = a4;
      v52 = a2;
      v53 = a3;
      v54 = v6;
      v19 = swift_bridgeObjectRetain(v17) + 48;
      do
      {
        v58 = v18;
        v20 = *(void **)(v19 - 8);
        v21 = *(_BYTE *)(v19 + 16);
        v22 = *(_QWORD *)(v19 + 48);
        v23 = *(void **)(v19 + 24);
        v24 = *(_QWORD *)(v19 + 8);
        v25 = *(id *)v19;
        v26 = v20;
        sub_100003AF0(v24, v21);
        swift_retain(v22);
        v27 = v26;
        v28 = v25;
        v29 = v23;
        sub_100003AF0(v24, v21);
        v30 = v29;
        swift_retain(v22);
        v31 = v27;
        v32 = v28;
        sub_100003AF0(v24, v21);
        v33 = v30;
        swift_retain(v22);
        v34 = v31;
        v35 = v32;
        sub_100003AF0(v24, v21);
        v36 = v33;
        swift_retain(v22);
        v37 = v34;
        v38 = v35;
        sub_100003AF0(v24, v21);
        v39 = v36;
        v40 = swift_retain(v22);
        v41 = Logger.logObject.getter(v40);
        v42 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v41, v42))
        {
          log = v41;
          v43 = swift_slowAlloc(15, -1);
          v57 = swift_slowAlloc(32, -1);
          v59 = v57;
          *(_DWORD *)v43 = 136315394;
          type = v42;
          v44 = v37;
          v45 = dispatch thunk of CAFCameraButtonObservable.symbolName.getter();
          v47 = v46;

          *(_QWORD *)(v43 + 4) = sub_10000934C(v45, v47, &v59);
          swift_bridgeObjectRelease();
          sub_100003B28(v24, v21);

          swift_release(v22);
          sub_100003B28(v24, v21);
          swift_release(v22);

          *(_WORD *)(v43 + 12) = 256;
          v48 = v44;
          LOBYTE(v47) = dispatch thunk of CAFCameraButtonObservable.sortOrder.getter();

          sub_100003B28(v24, v21);
          swift_release(v22);

          *(_BYTE *)(v43 + 14) = v47;
          sub_100003B28(v24, v21);
          swift_release(v22);

          _os_log_impl((void *)&_mh_execute_header, log, type, "[ButtonBarLayout] updateDatasource  ORDER %s [%hhu]", (uint8_t *)v43, 0xFu);
          swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v57, -1, -1);
          swift_slowDealloc(v43, -1, -1);

          sub_100003B28(v24, v21);
        }
        else
        {

          sub_100003B28(v24, v21);
          swift_release(v22);

          sub_100003B28(v24, v21);
          swift_release(v22);

          sub_100003B28(v24, v21);
          swift_release(v22);

          sub_100003B28(v24, v21);
          swift_release(v22);

          sub_100003B28(v24, v21);
        }
        swift_release(v22);

        v19 += 80;
        v18 = v58 - 1;
      }
      while (v58 != 1);
      swift_bridgeObjectRelease();
      a3 = v53;
      v6 = v54;
      a2 = v52;
      a4 = v51;
    }
    if ((a4 & 1) != 0)
    {
      sub_10001D9CC(0xD000000000000020, 0x8000000100024610);
    }
    else
    {
      v49 = (_QWORD *)(v6 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
      *v49 = a2;
      v49[1] = a3;
      sub_10001B114();
      v50 = *(_QWORD *)(v6 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
      *(_QWORD *)(v6 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page) = *(_QWORD *)(v6
                                                                                     + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState
                                                                                     + 32);
      sub_10001B070(v50);
    }
  }
}

void sub_10001D9CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v3 = v2;
  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v6 = type metadata accessor for Logger(0);
  sub_100007524(v6, (uint64_t)qword_1000350C0);
  swift_retain_n(v2, 12);
  v7 = swift_bridgeObjectRetain_n(a2, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  v10 = &qword_100033000;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc(72, -1);
    v54 = swift_slowAlloc(160, -1);
    v57 = v54;
    *(_DWORD *)v11 = 136316674;
    swift_bridgeObjectRetain(a2);
    v58 = (void *)sub_10000934C(a1, a2, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v11 + 12) = 2048;
    v12 = *(void **)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
    swift_release(v2);
    v58 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 14, v11 + 22);
    swift_release(v2);
    *(_WORD *)(v11 + 22) = 2048;
    v13 = *(void **)(*(_QWORD *)(v2 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries) + 16);
    swift_release(v2);
    v58 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 24, v11 + 32);
    swift_release(v2);
    *(_WORD *)(v11 + 32) = 2080;
    KeyPath = swift_getKeyPath(&unk_1000239C0);
    v15 = swift_getKeyPath(&unk_1000239E8);
    static Published.subscript.getter(v2, KeyPath, v15);
    swift_release(KeyPath);
    swift_release(v15);
    v16 = v62;
    sub_100005B3C(v58, v59, v60, v61, v62);
    if (v16)
      v17 = 0x656C6269736976;
    else
      v17 = 0x6E6564646968;
    if (v16)
      v18 = 0xE700000000000000;
    else
      v18 = 0xE600000000000000;
    v58 = (void *)sub_10000934C(v17, v18, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 34, v11 + 42);
    swift_release_n(v3, 2);
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 42) = 2080;
    v19 = swift_getKeyPath(&unk_100023A08);
    v20 = swift_getKeyPath(&unk_100023A30);
    static Published.subscript.getter(v3, v19, v20);
    swift_release(v19);
    swift_release(v20);
    v21 = v62;
    sub_100005B3C(v58, v59, v60, v61, v62);
    if (v21)
      v22 = 0x656C6269736976;
    else
      v22 = 0x6E6564646968;
    if (v21)
      v23 = 0xE700000000000000;
    else
      v23 = 0xE600000000000000;
    v58 = (void *)sub_10000934C(v22, v23, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 44, v11 + 52);
    swift_release_n(v3, 2);
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 52) = 2080;
    v24 = swift_getKeyPath(&unk_100023A50);
    v25 = swift_getKeyPath(&unk_100023A78);
    static Published.subscript.getter(v3, v24, v25);
    swift_release(v24);
    swift_release(v25);
    v26 = v62;
    sub_100005B3C(v58, v59, v60, v61, v62);
    if (v26)
      v27 = 0x656C6269736976;
    else
      v27 = 0x6E6564646968;
    if (v26)
      v28 = 0xE700000000000000;
    else
      v28 = 0xE600000000000000;
    v58 = (void *)sub_10000934C(v27, v28, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 54, v11 + 62);
    swift_release_n(v3, 2);
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 62) = 2080;
    v29 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
    v55 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange + 8);
    v56 = v29;
    v58 = 0;
    v59 = 0xE000000000000000;
    _print_unlocked<A, B>(_:_:)(&v56, &v58, &type metadata for Int, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v30._countAndFlagsBits = 3026478;
    v30._object = (void *)0xE300000000000000;
    String.append(_:)(v30);
    v10 = &qword_100033000;
    _print_unlocked<A, B>(_:_:)(&v55, &v58, &type metadata for Int, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v58 = (void *)sub_10000934C((uint64_t)v58, v59, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v11 + 64, v11 + 72);
    swift_release_n(v3, 2);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[updateVisibleIndex] REASON: %s\npage: %ld\nallServices count: %ld\nCloseButton: %s\nNextButton*: %s\nPreviousButton*: %s\nIncoming range: %s", (uint8_t *)v11, 0x48u);
    swift_arrayDestroy(v54, 5, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v54, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_release_n(v2, 12);
  }
  v31 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount;
  v32 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount);
  if (v32 < 1)
    return;
  v33 = OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page;
  v34 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page);
  v35 = v34 * v32;
  if ((unsigned __int128)(v34 * (__int128)v32) >> 64 != (v34 * v32) >> 63)
  {
    __break(1u);
    goto LABEL_48;
  }
  v36 = __OFADD__(v35, v32);
  v37 = v35 + v32;
  if (v36)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v38 = v10[149];
  if (*(_QWORD *)(*(_QWORD *)(v3 + v38) + 16) - 1 >= v37)
    v39 = (char *)v37;
  else
    v39 = (char *)(*(_QWORD *)(*(_QWORD *)(v3 + v38) + 16) - 1);
  v40 = swift_getKeyPath(&unk_1000239C0);
  v41 = swift_getKeyPath(&unk_1000239E8);
  static Published.subscript.getter(v3, v40, v41);
  swift_release(v40);
  swift_release(v41);
  v42 = v62;
  v43 = sub_100005B3C(v58, v59, v60, v61, v62);
  if (v42)
  {
    v36 = __OFSUB__(v39--, 1);
    if (v36)
      goto LABEL_52;
  }
  v44 = *(_QWORD *)(*(_QWORD *)(v3 + v38) + 16);
  v36 = __OFSUB__(v44, v39);
  v45 = v44 - (_QWORD)v39;
  if (v36)
    goto LABEL_49;
  v36 = __OFSUB__(v45, 1);
  v46 = v45 - 1;
  if (v36)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    return;
  }
  if (v46 == 1)
  {
    v36 = __OFADD__(v39++, 1);
    if (v36)
      goto LABEL_54;
  }
  if (__OFSUB__(v39, v35))
    goto LABEL_51;
  if ((uint64_t)&v39[-v35] >= 1)
  {
    if ((uint64_t)v39 >= v35)
    {
      v47 = (uint64_t *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
      *v47 = v35;
      v47[1] = (uint64_t)v39;
      sub_10001B114();
      return;
    }
    goto LABEL_53;
  }
  v48 = Logger.logObject.getter(v43);
  v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc(22, -1);
    *(_DWORD *)v50 = 134218240;
    v58 = (void *)v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 4, v50 + 12);
    *(_WORD *)(v50 + 12) = 2048;
    v58 = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 14, v50 + 22);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "[visibleIndexRange] start=%ld, end=%ld EXITING", (uint8_t *)v50, 0x16u);
    swift_slowDealloc(v50, -1, -1);
  }

  v51 = *(_QWORD *)(v3 + v33);
  v52 = v51 < 1;
  v53 = v51 - 1;
  if (!v52)
  {
    *(_QWORD *)(v3 + v33) = v53;
    if (*(double *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize) > 0.0 && *(uint64_t *)(v3 + v31) >= 1)
    {
      *(_BYTE *)(v3 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState + 56) = 0;
      sub_10001D9CC(0xD000000000000011, 0x80000001000245F0);
    }
  }
}

uint64_t sub_10001E178(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  _BYTE v22[24];

  v2 = *(_QWORD *)(a1 + 80);
  if (!v2)
    goto LABEL_9;
  v3 = *(_QWORD *)(v1 + 24);
  if (!v3)
    goto LABEL_9;
  v4 = *(_QWORD *)(a1 + 72);
  v5 = (uint64_t *)(v3 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict);
  swift_beginAccess(v3 + OBJC_IVAR____TtC9CarCamera11CameraModel_buttonDict, v22, 0, 0);
  v6 = *v5;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_9;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v6);
  v7 = sub_10000D748(v4, v2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    v20 = 0;
    return v20 & 1;
  }
  v9 = *(_QWORD *)(v6 + 56) + 80 * v7;
  v10 = *(void **)(v9 + 8);
  v11 = *(void **)(v9 + 16);
  v12 = *(_QWORD *)(v9 + 24);
  v13 = *(_BYTE *)(v9 + 32);
  v14 = *(void **)(v9 + 40);
  v15 = *(_QWORD *)(v9 + 64);
  v16 = v11;
  v17 = v10;
  sub_100003AF0(v12, v13);
  swift_retain(v15);
  v18 = v14;
  swift_bridgeObjectRelease();
  if (!v11)
  {

    swift_bridgeObjectRelease();
    sub_100003B28(v12, v13);
    swift_release(v15);

    goto LABEL_9;
  }
  v19 = v16;
  v20 = sub_100013548(v4, v2);

  swift_bridgeObjectRelease();
  sub_100003B28(v12, v13);
  swift_release(v15);

  return v20 & 1;
}

uint64_t sub_10001E308()
{
  id *v0;
  char *v1;
  uint64_t v2;
  void (*v3)(char *, uint64_t);
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (char *)v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__closeButton;
  v2 = sub_10000383C(&qword_1000337E8);
  v3 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v4 = (char *)v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleActionButtons;
  v5 = sub_10000383C(&qword_100032E88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v3((char *)v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__nextButton, v2);
  v3((char *)v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__previousButton, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = *(uint64_t *)((char *)v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState + 40);
  swift_bridgeObjectRelease();
  swift_release(v6);
  return swift_deallocClassInstance(v0, *((unsigned int *)*v0 + 12), *((unsigned __int16 *)*v0 + 26));
}

uint64_t sub_10001E404()
{
  return type metadata accessor for ButtonBarLayout(0);
}

uint64_t type metadata accessor for ButtonBarLayout(uint64_t a1)
{
  uint64_t result;

  result = qword_1000334E8;
  if (!qword_1000334E8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ButtonBarLayout);
  return result;
}

void sub_10001E448(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[14];

  v7[0] = &unk_100023910;
  v7[1] = &unk_100023928;
  sub_10000CDC8(319, &qword_1000334F8, (uint64_t *)&unk_100033500);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    v7[2] = v4;
    sub_10000CDC8(319, (unint64_t *)&unk_100032E60, &qword_1000328C8);
    if (v6 <= 0x3F)
    {
      v7[3] = *(_QWORD *)(v5 - 8) + 64;
      v7[4] = v4;
      v7[5] = v4;
      v7[6] = (char *)&value witness table for Builtin.Int64 + 64;
      v7[7] = (char *)&value witness table for Builtin.Int64 + 64;
      v7[8] = &unk_100023940;
      v7[9] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v7[10] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v7[11] = &unk_100023940;
      v7[12] = &unk_100023940;
      v7[13] = &unk_100023958;
      swift_updateClassMetadata2(a1, 256, 14, v7, a1 + 80);
    }
  }
}

uint64_t destroy for ButtonBarLayoutState(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return swift_release(a1[5]);
}

uint64_t initializeWithCopy for ButtonBarLayoutState(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  v4 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for ButtonBarLayoutState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_OWORD *)(a2 + 1);
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  *(_OWORD *)(a1 + 1) = v6;
  a1[4] = a2[4];
  v7 = a1[5];
  v8 = a2[5];
  a1[5] = v8;
  swift_retain(v8);
  swift_release(v7);
  a1[6] = a2[6];
  *((_BYTE *)a1 + 56) = *((_BYTE *)a2 + 56);
  return a1;
}

__n128 initializeWithTake for ButtonBarLayoutState(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for ButtonBarLayoutState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  v5 = a1[5];
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_release(v5);
  a1[6] = a2[6];
  *((_BYTE *)a1 + 56) = *((_BYTE *)a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonBarLayoutState(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonBarLayoutState(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonBarLayoutState()
{
  return &type metadata for ButtonBarLayoutState;
}

uint64_t sub_10001E76C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v1 = sub_10000383C(&qword_100032E88);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000383C(&qword_1000337E8);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100035080)
  {
    v10 = *(unsigned __int8 *)(qword_100035080 + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig);
    if (v10 != 2)
    {
      *(_BYTE *)(v0 + 16) = v10 & 1;
      *(_QWORD *)(v0 + 24) = 0;
      v11 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__closeButton;
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      v12 = sub_10000383C((uint64_t *)&unk_100033500);
      Published.init(initialValue:)(&v22, v12);
      v13 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
      v13(v11, v9, v5);
      v14 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__visibleActionButtons;
      *(_QWORD *)&v22 = _swiftEmptyArrayStorage;
      v15 = sub_10000383C(&qword_1000328C8);
      Published.init(initialValue:)(&v22, v15);
      (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v14, v4, v1);
      v16 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__nextButton;
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      Published.init(initialValue:)(&v22, v12);
      v13(v16, v9, v5);
      v17 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout__previousButton;
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      Published.init(initialValue:)(&v22, v12);
      v13(v17, v9, v5);
      *(_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_page) = 0;
      *(_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fitCount) = 0;
      v18 = (_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_visibleIndexRange);
      *v18 = 0;
      v18[1] = 0;
      *(_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_cancellables) = &_swiftEmptySetSingleton;
      *(_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_allServiceEntries) = _swiftEmptyArrayStorage;
      v19 = (_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_contentSize);
      *v19 = 0;
      v19[1] = 0;
      v20 = (_QWORD *)(v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_fullSize);
      *v20 = 0;
      v20[1] = 0;
      v21 = v0 + OBJC_IVAR____TtC9CarCamera15ButtonBarLayout_layoutState;
      *(_QWORD *)v21 = _swiftEmptyArrayStorage;
      *(_QWORD *)(v21 + 8) = 0;
      *(_QWORD *)(v21 + 16) = 0;
      *(_BYTE *)(v21 + 24) = 1;
      *(_QWORD *)(v21 + 32) = 0;
      *(_QWORD *)(v21 + 40) = 0;
      *(_QWORD *)(v21 + 48) = -1;
      *(_BYTE *)(v21 + 56) = 2;
      return v0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001E9FC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ButtonBarLayout(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

double sub_10001EA38@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_1000239C0, (uint64_t)&unk_1000239E8, a2);
}

void sub_10001EA4C(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD v10[5];

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000239C0);
  v9 = swift_getKeyPath(&unk_1000239E8);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  sub_100005AF4(v2, v3, v4, v5, v6);
  swift_retain(v7);
  static Published.subscript.setter(v10, v7, KeyPath, v9);
  sub_10001BD98();
}

uint64_t sub_10001EAFC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100023A98);
  v5 = swift_getKeyPath(&unk_100023AC0);
  static Published.subscript.getter(v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

void sub_10001EB78(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100023A98);
  v5 = swift_getKeyPath(&unk_100023AC0);
  v6 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  static Published.subscript.setter(&v6, v3, KeyPath, v5);
  sub_10001C4FC();
}

double sub_10001EBF4@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_100023A08, (uint64_t)&unk_100023A30, a2);
}

uint64_t sub_10001EC08(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001ECC4(a1, a2, a3, a4, (uint64_t)&unk_100023A08, (uint64_t)&unk_100023A30);
}

double sub_10001EC1C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_100023A50, (uint64_t)&unk_100023A78, a2);
}

double sub_10001EC30@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(v6, KeyPath, v8);
  swift_release(KeyPath);
  swift_release(v8);
  result = *(double *)&v10;
  *(_OWORD *)a4 = v10;
  *(_OWORD *)(a4 + 16) = v11;
  *(_QWORD *)(a4 + 32) = v12;
  return result;
}

uint64_t sub_10001ECB0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001ECC4(a1, a2, a3, a4, (uint64_t)&unk_100023A50, (uint64_t)&unk_100023A78);
}

uint64_t sub_10001ECC4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  _QWORD v16[5];

  v7 = *(void **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v14 = swift_getKeyPath(a6);
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v9;
  v16[3] = v10;
  v16[4] = v11;
  sub_100005AF4(v7, v8, v9, v10, v11);
  swift_retain(v12);
  return static Published.subscript.setter(v16, v12, KeyPath, v14);
}

double sub_10001ED68@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_1000239C0, (uint64_t)&unk_1000239E8, a2);
}

double sub_10001ED90@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_100023A08, (uint64_t)&unk_100023A30, a2);
}

uint64_t sub_10001EDB4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001ECC4(a1, a2, a3, a4, (uint64_t)&unk_100023A08, (uint64_t)&unk_100023A30);
}

double sub_10001EDD8@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC30(a1, (uint64_t)&unk_100023A50, (uint64_t)&unk_100023A78, a2);
}

uint64_t sub_10001EDFC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001ECC4(a1, a2, a3, a4, (uint64_t)&unk_100023A50, (uint64_t)&unk_100023A78);
}

_QWORD *sub_10001EE20(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_16;
  if (!v5)
    return _swiftEmptyArrayStorage;
  if (v5 > 0)
  {
    v8 = sub_10000383C(&qword_100032EB8);
    v9 = (_QWORD *)swift_allocObject(v8, 80 * v5 + 32, 7);
    v10 = j__malloc_size(v9);
    v9[2] = v5;
    v9[3] = 2 * ((uint64_t)(v10 - 32) / 80);
    if (v4 != a3)
      goto LABEL_5;
    goto LABEL_15;
  }
  v9 = _swiftEmptyArrayStorage;
  if (v4 == a3)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  if (v5 < 0)
  {
LABEL_17:
    result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_18;
  }
  v11 = (unint64_t)(v9 + 4);
  v12 = a2 + 80 * a3;
  if (v12 >= (unint64_t)&v9[10 * v5 + 4] || v11 >= v12 + 80 * v5)
  {
    swift_arrayInitWithCopy(v11);
    return v9;
  }
  result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001EFB8(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v26[5];

  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v26[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[3] = &type metadata for CameraActionButton;
  v26[4] = sub_10001F730();
  v16 = (_OWORD *)swift_allocObject(&unk_10002E268, 89, 7);
  v26[0] = v16;
  v17 = a1[3];
  v16[3] = a1[2];
  v16[4] = v17;
  *(_OWORD *)((char *)v16 + 73) = *(_OWORD *)((char *)a1 + 57);
  v18 = a1[1];
  v16[1] = *a1;
  v16[2] = v18;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  sub_100008C54((uint64_t)v26, a6 + 32);
  *(_QWORD *)(a6 + 72) = a2;
  *(_QWORD *)(a6 + 80) = a3;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a6 + 88);
  v20 = *(_QWORD *)(a6 + 96);
  *(_QWORD *)(a6 + 88) = a4;
  *(_QWORD *)(a6 + 96) = a5;
  swift_retain(a5);
  v21 = sub_100006B6C(v19, v20);
  if (a3)
  {
    swift_release(a5);
    sub_10000998C(v26);
  }
  else
  {
    v22 = UUID.init()(v21);
    a2 = UUID.uuidString.getter(v22);
    a3 = v23;
    swift_release(a5);
    sub_10000998C(v26);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  return a6;
}

uint64_t sub_10001F130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v25[5];

  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v25[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[3] = &type metadata for NavigationButton;
  v25[4] = sub_10001F41C();
  v16 = swift_allocObject(&unk_10002E188, 49, 7);
  v25[0] = v16;
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v16 + 32) = v17;
  *(_BYTE *)(v16 + 48) = *(_BYTE *)(a1 + 32);
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  sub_100008C54((uint64_t)v25, a6 + 32);
  *(_QWORD *)(a6 + 72) = a2;
  *(_QWORD *)(a6 + 80) = a3;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a6 + 88);
  v19 = *(_QWORD *)(a6 + 96);
  *(_QWORD *)(a6 + 88) = a4;
  *(_QWORD *)(a6 + 96) = a5;
  swift_retain(a5);
  v20 = sub_100006B6C(v18, v19);
  if (a3)
  {
    swift_release(a5);
    sub_10000998C(v25);
  }
  else
  {
    v21 = UUID.init()(v20);
    a2 = UUID.uuidString.getter(v21);
    a3 = v22;
    swift_release(a5);
    sub_10000998C(v25);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  return a6;
}

uint64_t sub_10001F2A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v24[5];

  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v24[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = type metadata accessor for CameraCloseButton(0);
  v24[4] = sub_100005CF4(&qword_100033818, type metadata accessor for CameraCloseButton, (uint64_t)&unk_100023398);
  v16 = sub_100008D00(v24);
  sub_1000197F0(a1, (uint64_t)v16);
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  sub_100008C54((uint64_t)v24, a6 + 32);
  *(_QWORD *)(a6 + 72) = a2;
  *(_QWORD *)(a6 + 80) = a3;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a6 + 88);
  v18 = *(_QWORD *)(a6 + 96);
  *(_QWORD *)(a6 + 88) = a4;
  *(_QWORD *)(a6 + 96) = a5;
  swift_retain(a5);
  v19 = sub_100006B6C(v17, v18);
  if (a3)
  {
    swift_release(a5);
    sub_10000998C(v24);
  }
  else
  {
    v20 = UUID.init()(v19);
    a2 = UUID.uuidString.getter(v20);
    a3 = v21;
    swift_release(a5);
    sub_10000998C(v24);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  return a6;
}

unint64_t sub_10001F41C()
{
  unint64_t result;

  result = qword_1000337F0;
  if (!qword_1000337F0)
  {
    result = swift_getWitnessTable(&unk_100023790, &type metadata for NavigationButton);
    atomic_store(result, (unint64_t *)&qword_1000337F0);
  }
  return result;
}

uint64_t sub_10001F460()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 49, 7);
}

uint64_t sub_10001F490()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F4B4(uint64_t *a1)
{
  uint64_t v1;

  return sub_10001B8F8(a1, v1);
}

uint64_t sub_10001F4BC(uint64_t a1)
{
  uint64_t v1;

  return sub_10001BA1C(a1, v1);
}

uint64_t sub_10001F4C4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100003908(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for Published<A>.Publisher, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001F504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F548(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CameraCloseButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for PageDirection(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PageDirection(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001F660 + 4 * byte_1000238D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001F694 + 4 * byte_1000238D0[v4]))();
}

uint64_t sub_10001F694(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001F69C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001F6A4);
  return result;
}

uint64_t sub_10001F6B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001F6B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001F6BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001F6C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10001F6D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PageDirection()
{
  return &type metadata for PageDirection;
}

unint64_t sub_10001F6EC()
{
  unint64_t result;

  result = qword_100033820;
  if (!qword_100033820)
  {
    result = swift_getWitnessTable(&unk_100023BA0, &type metadata for PageDirection);
    atomic_store(result, (unint64_t *)&qword_100033820);
  }
  return result;
}

unint64_t sub_10001F730()
{
  unint64_t result;

  result = qword_100033828;
  if (!qword_100033828)
  {
    result = swift_getWitnessTable(&unk_1000233E8, &type metadata for CameraActionButton);
    atomic_store(result, (unint64_t *)&qword_100033828);
  }
  return result;
}

uint64_t sub_10001F774()
{
  uint64_t v0;

  sub_100003B28(*(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 80));
  return swift_deallocObject(v0, 89, 7);
}

void sub_10001F814()
{
  unsigned __int8 *v0;
  void *v1;
  int v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  Class isa;
  uint64_t KeyPath;
  char v84;
  id (*v85)();
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  objc_super v92;

  v1 = v0;
  v92.receiver = v0;
  v92.super_class = (Class)type metadata accessor for CameraViewController();
  objc_msgSendSuper2(&v92, "viewDidLoad");
  if (!qword_100035080)
  {
    __break(1u);
    goto LABEL_28;
  }
  v2 = v0[OBJC_IVAR____TtC9CarCamera20CameraViewController_presentationMode];
  *(_BYTE *)(qword_100035080 + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig) = v2 & 1;
  v3 = objc_msgSend(v0, "view");
  if (!v3)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v4 = v3;
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;

  KeyPath = swift_getKeyPath(&unk_100023BF8);
  v84 = 0;
  v85 = sub_100003F18;
  v86 = 0;
  v87 = 0;
  v88 = v6;
  v89 = v8;
  v90 = swift_getKeyPath(&unk_100023BF8);
  v91 = v2 & 1;
  v9 = objc_allocWithZone((Class)sub_10000383C(&qword_100033860));
  v10 = (void *)UIHostingController.init(rootView:)(&KeyPath);
  v11 = objc_msgSend(v10, "view");
  if (!v11)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v12 = v11;
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v1, "addChildViewController:", v10);
  v14 = objc_msgSend(v10, "view");
  if (!v14)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v15 = v14;
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = objc_msgSend(v1, "view");
  if (!v16)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v17 = v16;
  v18 = objc_msgSend(v10, "view");
  if (!v18)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v19 = v18;
  objc_msgSend(v17, "addSubview:", v18);

  objc_msgSend(v10, "didMoveToParentViewController:", v1);
  v20 = sub_10000383C(&qword_100033868);
  v21 = swift_allocObject(v20, 64, 7);
  *(_OWORD *)(v21 + 16) = xmmword_100023BD0;
  v22 = objc_msgSend(v10, "view");
  v23 = v22;
  if (v2 == 2)
  {
    if (v22)
    {
      v24 = objc_msgSend(v22, "topAnchor");

      v25 = objc_msgSend(v1, "view");
      if (v25)
      {
        v26 = v25;
        v27 = objc_msgSend(v25, "safeAreaLayoutGuide");

        v28 = objc_msgSend(v27, "topAnchor");
        v29 = objc_msgSend(v24, "constraintEqualToAnchor:", v28);

        *(_QWORD *)(v21 + 32) = v29;
        v30 = objc_msgSend(v10, "view");
        if (v30)
        {
          v31 = v30;
          v32 = objc_msgSend(v30, "bottomAnchor");

          v33 = objc_msgSend(v1, "view");
          if (v33)
          {
            v34 = v33;
            v35 = objc_msgSend(v33, "safeAreaLayoutGuide");

            v36 = objc_msgSend(v35, "bottomAnchor");
            v37 = objc_msgSend(v32, "constraintEqualToAnchor:", v36);

            *(_QWORD *)(v21 + 40) = v37;
            v38 = objc_msgSend(v10, "view");
            if (v38)
            {
              v39 = v38;
              v40 = objc_msgSend(v38, "leadingAnchor");

              v41 = objc_msgSend(v1, "view");
              if (v41)
              {
                v42 = v41;
                v43 = objc_msgSend(v41, "safeAreaLayoutGuide");

                v44 = objc_msgSend(v43, "leadingAnchor");
                v45 = objc_msgSend(v40, "constraintEqualToAnchor:", v44);

                *(_QWORD *)(v21 + 48) = v45;
                v46 = objc_msgSend(v10, "view");
                if (v46)
                {
                  v47 = v46;
                  v48 = objc_msgSend(v46, "trailingAnchor");

                  v49 = objc_msgSend(v1, "view");
                  if (v49)
                  {
                    v50 = v49;
                    v51 = (void *)objc_opt_self(NSLayoutConstraint);
                    v52 = objc_msgSend(v50, "safeAreaLayoutGuide");

                    v53 = objc_msgSend(v52, "trailingAnchor");
                    v54 = objc_msgSend(v48, "constraintEqualToAnchor:", v53);

                    *(_QWORD *)(v21 + 56) = v54;
LABEL_26:
                    KeyPath = v21;
                    specialized Array._endMutation()(v55);
                    sub_10002010C();
                    isa = Array._bridgeToObjectiveC()().super.isa;
                    swift_bridgeObjectRelease();
                    objc_msgSend(v51, "activateConstraints:", isa);

                    CAFSignpostEmit_Rendered();
                    return;
                  }
                  goto LABEL_40;
                }
LABEL_39:
                __break(1u);
LABEL_40:
                __break(1u);
                goto LABEL_41;
              }
LABEL_38:
              __break(1u);
              goto LABEL_39;
            }
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!v22)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v56 = objc_msgSend(v22, "topAnchor");

  v57 = objc_msgSend(v1, "view");
  if (!v57)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v58 = v57;
  v59 = objc_msgSend(v57, "topAnchor");

  v60 = objc_msgSend(v56, "constraintEqualToAnchor:", v59);
  *(_QWORD *)(v21 + 32) = v60;
  v61 = objc_msgSend(v10, "view");
  if (!v61)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v62 = v61;
  v63 = objc_msgSend(v61, "bottomAnchor");

  v64 = objc_msgSend(v1, "view");
  if (!v64)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v65 = v64;
  v66 = objc_msgSend(v64, "bottomAnchor");

  v67 = objc_msgSend(v63, "constraintEqualToAnchor:", v66);
  *(_QWORD *)(v21 + 40) = v67;
  v68 = objc_msgSend(v10, "view");
  if (!v68)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v69 = v68;
  v70 = objc_msgSend(v68, "leadingAnchor");

  v71 = objc_msgSend(v1, "view");
  if (!v71)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v72 = v71;
  v73 = objc_msgSend(v71, "leadingAnchor");

  v74 = objc_msgSend(v70, "constraintEqualToAnchor:", v73);
  *(_QWORD *)(v21 + 48) = v74;
  v75 = objc_msgSend(v10, "view");
  if (!v75)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v76 = v75;
  v77 = objc_msgSend(v75, "trailingAnchor");

  v78 = objc_msgSend(v1, "view");
  if (v78)
  {
    v79 = v78;
    v51 = (void *)objc_opt_self(NSLayoutConstraint);
    v80 = objc_msgSend(v79, "trailingAnchor");

    v81 = objc_msgSend(v77, "constraintEqualToAnchor:", v80);
    *(_QWORD *)(v21 + 56) = v81;
    goto LABEL_26;
  }
LABEL_48:
  __break(1u);
}

id sub_1000200B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CameraViewController()
{
  return objc_opt_self(_TtC9CarCamera20CameraViewController);
}

unint64_t sub_10002010C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033870;
  if (!qword_100033870)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100033870);
  }
  return result;
}

uint64_t sub_100020148()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100023C98);
  v2 = swift_getKeyPath(&unk_100023CC0);
  static Published.subscript.getter(v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

void sub_1000201B8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  char *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD v27[3];
  objc_super v28;

  v0 = sub_10000383C(&qword_100033948);
  v26 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v2 = (char *)&v27[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000383C(&qword_100033950);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v27[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone((Class)CAFCarManager), "init");
  v8 = sub_10000F854(0, &qword_100033958, CAFCarManager_ptr);
  v9 = sub_10002104C(&qword_100033960, &qword_100033958, CAFCarManager_ptr, (uint64_t)&protocol conformance descriptor for CAFCarManager);
  v10 = (void *)CAFObserved<>.observable.getter(v8, v9);

  v11 = (objc_class *)type metadata accessor for CameraCAFManager(0);
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR____TtC9CarCamera16CameraCAFManager__model];
  v27[0] = 0;
  v14 = v12;
  v15 = sub_10000383C(&qword_100033940);
  Published.init(initialValue:)(v27, v15);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, v3);
  *(_QWORD *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_cancellables] = &_swiftEmptySetSingleton;
  v16 = OBJC_IVAR____TtC9CarCamera16CameraCAFManager_sessionStatus;
  *(_QWORD *)&v14[v16] = objc_msgSend(objc_allocWithZone((Class)CARSessionStatus), "initWithOptions:", 1);
  v17 = objc_msgSend(objc_allocWithZone((Class)CARSessionStatus), "init");
  *(_QWORD *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carManager] = v10;
  v18 = v10;

  v28.receiver = v14;
  v28.super_class = v11;
  v19 = (char *)objc_msgSendSuper2(&v28, "init");
  v20 = *(void **)&v19[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus];
  v21 = v19;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter(objc_msgSend(v20, "addSessionObserver:", v21));
  v22 = swift_allocObject(&unk_10002E2F0, 24, 7);
  swift_unknownObjectWeakInit(v22 + 16, v21);
  v23 = sub_100005E44(&qword_100033968, &qword_100033948, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v24 = Publisher<>.sink(receiveValue:)(sub_10002103C, v22, v0, v23);
  swift_release(v22);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v2, v0);
  v25 = &v21[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_cancellables];
  swift_beginAccess(&v21[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_cancellables], v27, 33, 0);
  AnyCancellable.store(in:)(v25);
  swift_endAccess(v27);
  swift_release(v24);
  sub_100020778();

  qword_100035118 = (uint64_t)v21;
}

uint64_t sub_1000204CC(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  char *v18;
  uint64_t KeyPath;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;

  v2 = *a1;
  v3 = a2 + 16;
  if (qword_100032738 != -1)
    swift_once(&qword_100032738, sub_100007E68);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350A8);
  v5 = v2;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    if (v2)
    {
      v22 = v5;
      v10 = v5;
    }
    else
    {
      v22 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v8 + 4, v8 + 12);
    *v9 = v2;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[CAMERA] currentCar %@", v8, 0xCu);
    v11 = sub_10000383C((uint64_t *)&unk_100032EF0);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  swift_beginAccess(v3, &v22, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v13 = result;
    if (v2)
    {
      v14 = sub_10000F854(0, &qword_100033970, CAFCar_ptr);
      v15 = sub_10002104C((unint64_t *)&unk_100033978, &qword_100033970, CAFCar_ptr, (uint64_t)&protocol conformance descriptor for CAFCar);
      v16 = (void *)CAFObserved<>.observable.getter(v14, v15);
      v17 = objc_allocWithZone((Class)type metadata accessor for CameraModel(0));
      v18 = sub_100009EA4(v16);
    }
    else
    {
      v18 = 0;
    }
    KeyPath = swift_getKeyPath(&unk_100023C98);
    v20 = swift_getKeyPath(&unk_100023CC0);
    v21 = v18;
    return static Published.subscript.setter(&v21, v13, KeyPath, v20);
  }
  return result;
}

id sub_100020778()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_carSessionStatus), "currentSession"));
  if (result)
  {
    v3 = result;
    if (qword_100032738 != -1)
      swift_once(&qword_100032738, sub_100007E68);
    v4 = type metadata accessor for Logger(0);
    sub_100007524(v4, (uint64_t)qword_1000350A8);
    v5 = Logger.logObject.getter();
    v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[CAMERA] Created Request Content Manager", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = type metadata accessor for CAFUIRequestContentManager(0);
    swift_allocObject(v8, 25, 7);
    v9 = v3;
    v10 = CAFUIRequestContentManager.init(session:)();
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager) = v10;

    return (id)swift_release(v11);
  }
  return result;
}

uint64_t sub_1000208C8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v3 - 8);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS(0, v4);
  v7 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject(&unk_10002E2F0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v1);
  sub_10000F854(0, &qword_100033988, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_10002E318, 32, 7);
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_1000210B8;
  v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100020B90;
  aBlock[3] = &unk_10002E330;
  v13 = _Block_copy(aBlock);
  v14 = v24;
  swift_retain(v10);
  v15 = a1;
  v16 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = _swiftEmptyArrayStorage;
  v17 = sub_1000210D8();
  v18 = sub_10000383C(&qword_100033998);
  v19 = sub_100005E44((unint64_t *)&unk_1000339A0, &qword_100033998, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v3, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  return swift_release(v10);
}

void sub_100020AF4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession);
    *(_QWORD *)(Strong + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession) = a2;
    v7 = a2;

  }
  swift_beginAccess(v3, &v10, 0, 0);
  v8 = swift_unknownObjectWeakLoadStrong(v3);
  if (v8)
  {
    v9 = (void *)v8;
    sub_100020778();

  }
}

uint64_t sub_100020B90(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100020C10(uint64_t a1)
{
  uint64_t v1;
  char *Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = *(void **)&Strong[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession];
    *(_QWORD *)&Strong[OBJC_IVAR____TtC9CarCamera16CameraCAFManager_currentSession] = 0;

  }
}

id sub_100020CE4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraCAFManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100020DBC()
{
  return type metadata accessor for CameraCAFManager(0);
}

uint64_t type metadata accessor for CameraCAFManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100033928;
  if (!qword_100033928)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CameraCAFManager);
  return result;
}

void sub_100020E00(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[7];

  sub_100020E98(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = "\b";
    v4[3] = "\b";
    v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
  }
}

void sub_100020E98(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100033938)
  {
    v2 = sub_100003908(&qword_100033940);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100033938);
  }
}

uint64_t sub_100020EF0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CameraCAFManager(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100020F2C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100023C98);
  v5 = swift_getKeyPath(&unk_100023CC0);
  static Published.subscript.getter(v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100020FA8(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100023C98);
  v5 = swift_getKeyPath(&unk_100023CC0);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_100021018()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002103C(void **a1)
{
  uint64_t v1;

  return sub_1000204CC(a1, v1);
}

uint64_t sub_10002104C(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_10000F854(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002108C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_1000210B8()
{
  uint64_t v0;

  sub_100020AF4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000210C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000210D0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000210D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033990;
  if (!qword_100033990)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100033990);
  }
  return result;
}

uint64_t sub_100021120()
{
  uint64_t v0;
  uint64_t v1;
  __n128 v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v18 = *(_QWORD *)(v1 - 8);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for DispatchQoS(0, v2);
  v5 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_10002E2F0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, v0);
  sub_10000F854(0, &qword_100033988, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10002132C;
  v20 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100020B90;
  aBlock[3] = &unk_10002E358;
  v10 = _Block_copy(aBlock);
  v11 = v20;
  swift_retain(v8);
  v12 = swift_release(v11);
  static DispatchQoS.unspecified.getter(v12);
  aBlock[0] = _swiftEmptyArrayStorage;
  v13 = sub_1000210D8();
  v14 = sub_10000383C(&qword_100033998);
  v15 = sub_100005E44((unint64_t *)&unk_1000339A0, &qword_100033998, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v14, v15, v1, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return swift_release(v8);
}

void sub_10002132C()
{
  uint64_t v0;

  sub_100020C10(v0);
}

uint64_t sub_10002133C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease();
  sub_10000998C(v0 + 4);
  swift_bridgeObjectRelease();
  sub_100006B6C(v0[11], v0[12]);
  return swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for ButtonBarEntity()
{
  return objc_opt_self(_TtC9CarCamera15ButtonBarEntity);
}

uint64_t sub_100021398@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

unint64_t sub_1000213A8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;

  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(0xE000000000000000);
  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain(v1);
  v3._countAndFlagsBits = v2;
  v3._object = v1;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v1);
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0xD000000000000012;
}

unint64_t sub_100021444()
{
  return sub_1000213A8();
}

uint64_t sub_100021464(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  v4 = *(_QWORD *)(*a1 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  if (v4 == v6 && v5 == v7)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v6, v7, 0);
}

void *sub_100021490()
{
  return &protocol witness table for String;
}

void sub_10002149C(Swift::String *a1)
{
  sub_1000214C0(a1, "[ButtonBarEntity] Action: %s");
}

void sub_1000214A8(Swift::String *a1)
{
  sub_1000214C0(a1, "[ButtonBarEntity] CameraCloseButton action %s");
}

void sub_1000214B4(Swift::String *a1)
{
  sub_1000214C0(a1, "[ButtonBarEntity] NavigationButton action %s");
}

void sub_1000214C0(Swift::String *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (qword_100032740 != -1)
    swift_once(&qword_100032740, sub_100007E8C);
  v4 = type metadata accessor for Logger(0);
  sub_100007524(v4, (uint64_t)qword_1000350C0);
  v5 = swift_retain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    *(_DWORD *)v8 = 136315138;
    v13 = v9;
    swift_retain(a1);
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000012;
    v12 = 0x8000000100023F20;
    String.append(_:)(a1[1]);
    v10._countAndFlagsBits = 62;
    v10._object = (void *)0xE100000000000000;
    String.append(_:)(v10);
    swift_release(a1);
    v11 = sub_10000934C(0xD000000000000012, 0x8000000100023F20, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, a2, v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release_n(a1, 2);
  }
}

uint64_t sub_1000216C4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9CarCameraP33_CDDC2F4429D723DDEC62F5FF7F8E6A3019ResourceBundleClass);
}
