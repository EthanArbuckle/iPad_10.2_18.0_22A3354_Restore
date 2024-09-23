uint64_t sub_100004B74()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100004BB4()
{
  return 1;
}

uint64_t sub_100004BBC()
{
  return 1;
}

uint64_t sub_100004BC4(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_10000526C(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v2 + qword_10001E5F0) - 8) + 8))(a1);
  return v5;
}

void *sub_100004C24(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_100004C64(a1, a2);
}

void *sub_100004C64(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v13;

  v5 = *(_QWORD *)((swift_isaMask & *v2) + qword_10001E5F0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v13 - v7);
  v9 = (void *)UIHostingController.init(coder:rootView:)(a1, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11 = v9;
  v10(a2, v5);
  if (v9)

  return v9;
}

id sub_100004D24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for SecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_10001E5F0), *(_QWORD *)((swift_isaMask & *v4) + qword_10001E5F0 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100004D98(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_100004D24(v3, v4, v5, v6);
}

id sub_100004DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for SecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_10001E5F0), *(_QWORD *)((swift_isaMask & *v4) + qword_10001E5F0 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t type metadata accessor for SecureHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000052E8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureHostingController);
}

uint64_t sub_100004E20(uint64_t a1, uint64_t a2)
{
  return sub_100005180(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004E44(uint64_t a1, id *a2)
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

uint64_t sub_100004EB8(uint64_t a1, id *a2)
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

uint64_t sub_100004F34@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100004F78@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004FA0(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100005028(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005394(&qword_10001DB70, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_100012D4C);
  v3 = sub_100005394(&qword_10001DB78, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_100012CEC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000050AC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000050F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005394(&qword_10001E190, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012DDC);
  v3 = sub_100005394(&qword_10001DB80, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012BD8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005174(uint64_t a1, uint64_t a2)
{
  return sub_100005180(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005180(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_1000051BC(uint64_t a1)
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

Swift::Int sub_1000051FC(uint64_t a1)
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

uint64_t sub_10000526C(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  __chkstk_darwin(a1, a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return UIHostingController.init(rootView:)(v2);
}

uint64_t sub_1000052E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void type metadata accessor for Role(uint64_t a1)
{
  sub_1000054F0(a1, &qword_10001DB30, (uint64_t)&unk_100018D70);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_1000054F0(a1, &qword_10001DB38, (uint64_t)&unk_100018D98);
}

uint64_t sub_10000533C()
{
  return sub_100005394(&qword_10001DB40, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012B9C);
}

uint64_t sub_100005368()
{
  return sub_100005394(&qword_10001DB48, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012B70);
}

uint64_t sub_100005394(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000053D4()
{
  return sub_100005394(&qword_10001DB50, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_100012CB0);
}

uint64_t sub_100005400()
{
  return sub_100005394(&qword_10001DB58, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_100012C84);
}

uint64_t sub_10000542C()
{
  return sub_100005394(&qword_10001DB60, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_100012D20);
}

uint64_t sub_100005458()
{
  return sub_100005394(&qword_10001DB68, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012C0C);
}

__n128 initializeWithTake for FullAmbientActivityView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005494(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000054B4(uint64_t result, int a2, int a3)
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
  sub_1000054F0(a1, &qword_10001DB88, (uint64_t)&unk_100018E18);
}

void sub_1000054F0(uint64_t a1, unint64_t *a2, uint64_t a3)
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

ValueMetadata *type metadata accessor for FullAmbientActivityView()
{
  return &type metadata for FullAmbientActivityView;
}

uint64_t destroy for MinimalLiveActivity(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

_QWORD *_s21ScreenContinuityShell23FullAmbientActivityViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  return a1;
}

uint64_t *_s21ScreenContinuityShell23FullAmbientActivityViewVwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a1[1];
  v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  return a1;
}

_QWORD *_s21ScreenContinuityShell23FullAmbientActivityViewVwta_0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t _s21ScreenContinuityShell23FullAmbientActivityViewVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_10000569C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MinimalLiveActivity()
{
  return &type metadata for MinimalLiveActivity;
}

uint64_t sub_1000056E8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001393C, 1);
}

uint64_t sub_1000056F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v6 = sub_100006D84(&qword_10001DB90);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006D84(&qword_10001DB98);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006D84(&qword_10001DBA0);
  v17 = __chkstk_darwin(v15, v16);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v17);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v20 = sub_100006D84(&qword_10001DBA8);
  sub_100005920(a1, a2, (uint64_t)&v9[*(int *)(v20 + 44)]);
  v21 = sub_10000749C(&qword_10001DBB0, &qword_10001DB90, (uint64_t)&protocol conformance descriptor for VStack<A>);
  View.allowsSecureDrawing()(v6, v21);
  v22 = sub_100007100((uint64_t)v9, &qword_10001DB90);
  v23 = static Alignment.center.getter(v22);
  v25 = sub_1000065F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, INFINITY, 0, v23, v24, &qword_10001DB98, &qword_10001DBA0);
  v26 = (*(uint64_t (**)(char *, uint64_t, __n128))(v11 + 8))(v14, v10, v25);
  LOBYTE(v6) = static Edge.Set.all.getter(v26);
  sub_1000070BC((uint64_t)v19, a3, &qword_10001DBA0);
  v27 = a3 + *(int *)(sub_100006D84(&qword_10001DBB8) + 36);
  *(_BYTE *)v27 = v6;
  *(_OWORD *)(v27 + 8) = 0u;
  *(_OWORD *)(v27 + 24) = 0u;
  *(_BYTE *)(v27 + 40) = 1;
  return sub_100007100((uint64_t)v19, &qword_10001DBA0);
}

uint64_t sub_100005920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v17;
  uint64_t v19;

  v6 = sub_100006D84(&qword_10001DBC0);
  v8 = __chkstk_darwin(v6, v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  v13 = (char *)&v19 - v12;
  if (qword_10001DA88 != -1)
    swift_once(&qword_10001DA88, sub_10000BC90);
  v14 = qword_10001E640;
  *(_QWORD *)v13 = static HorizontalAlignment.center.getter();
  *((_QWORD *)v13 + 1) = v14;
  v13[16] = 0;
  v15 = sub_100006D84(&qword_10001DBC8);
  sub_100005A78(a1, a2, (uint64_t)&v13[*(int *)(v15 + 44)]);
  sub_1000070BC((uint64_t)v13, (uint64_t)v10, &qword_10001DBC0);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  v16 = sub_100006D84(&qword_10001DBD0);
  sub_1000070BC((uint64_t)v10, a3 + *(int *)(v16 + 48), &qword_10001DBC0);
  v17 = a3 + *(int *)(v16 + 64);
  *(_QWORD *)v17 = 0;
  *(_BYTE *)(v17 + 8) = 1;
  sub_100007100((uint64_t)v13, &qword_10001DBC0);
  return sub_100007100((uint64_t)v10, &qword_10001DBC0);
}

uint64_t sub_100005A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  uint64_t v106;
  int v107;
  char *v108;
  uint64_t v109;
  char *v110;
  int v111;
  char *v112;
  char *v113;
  uint64_t KeyPath;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t *v128;
  char v129[16];
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;

  v125 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v125, v6);
  v128 = (uint64_t *)((char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v118 = type metadata accessor for PlainButtonStyle(0);
  v120 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118, v8);
  v113 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_100006D84(&qword_10001DBD8);
  v117 = *(_QWORD *)(v115 - 8);
  __chkstk_darwin(v115, v10);
  v110 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006D84(&qword_10001DBE0);
  v121 = *(_QWORD *)(v12 - 8);
  v122 = v12;
  __chkstk_darwin(v12, v13);
  v112 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_100006D84(&qword_10001DBE8);
  __chkstk_darwin(v119, v15);
  v108 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_100006D84(&qword_10001DBF0);
  v18 = __chkstk_darwin(v124, v17);
  v127 = (char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v20);
  v126 = (uint64_t)&v105 - v21;
  v22 = sub_100006D84(&qword_10001DBF8);
  __chkstk_darwin(v22, v23);
  v25 = (char *)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_100006D84(&qword_10001DC00);
  __chkstk_darwin(v26, v27);
  v29 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = a1;
  v133 = a2;
  v30 = a1;
  v105 = a1;
  v31 = a2;
  v106 = a2;
  v32 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v134, v32);
  v33 = v134;
  v34 = v134[10];
  v35 = v134[11];
  swift_bridgeObjectRetain(v35);
  swift_release(v33);
  v36 = Image.init(_internalSystemName:)(v34, v35);
  static SymbolRenderingMode.monochrome.getter();
  v37 = type metadata accessor for SymbolRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v29, 0, 1, v37);
  v123 = Image.symbolRenderingMode(_:)(v29, v36);
  swift_release(v36);
  v38 = sub_100007100((uint64_t)v29, &qword_10001DC00);
  v111 = static HierarchicalShapeStyle.secondary.getter(v38);
  v39 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v25, 1, 1, v39);
  v116 = static Font.system(size:weight:design:)(0, 1, v25, 45.0);
  sub_100007100((uint64_t)v25, &qword_10001DBF8);
  KeyPath = swift_getKeyPath(&unk_100012F08);
  v132 = v30;
  v133 = v31;
  State.wrappedValue.getter(&v134, v32);
  v40 = v134;
  v42 = v134[4];
  v41 = v134[5];
  swift_bridgeObjectRetain(v41);
  swift_release(v40);
  v132 = v42;
  v133 = v41;
  v43 = sub_100006EA8();
  v44 = Text.init<A>(_:)(&v132, &type metadata for String, v43);
  v46 = v45;
  v48 = v47;
  v50 = v49 & 1;
  v51 = static Font.title.getter();
  v52 = Text.font(_:)(v51, v44, v46, v50, v48);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  swift_release(v51);
  v59 = v56 & 1;
  sub_100006EEC(v44, v46, v50);
  v60 = swift_bridgeObjectRelease(v48);
  LODWORD(v132) = static HierarchicalShapeStyle.tertiary.getter(v60);
  v61 = Text.foregroundStyle<A>(_:)(&v132, v52, v54, v59, v58, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v63 = v62;
  v107 = v64;
  v109 = v65;
  v66 = v52;
  v67 = (uint64_t)v108;
  sub_100006EEC(v66, v54, v59);
  swift_bridgeObjectRelease(v58);
  v68 = swift_allocObject(&unk_100019010, 32, 7);
  v69 = v105;
  *(_QWORD *)(v68 + 16) = v105;
  v70 = v106;
  *(_QWORD *)(v68 + 24) = v106;
  v130 = v69;
  v131 = v70;
  swift_retain(v70);
  swift_retain(v69);
  v71 = sub_100006D84(&qword_10001DC18);
  v72 = sub_100007240(&qword_10001DC20, &qword_10001DC18, (void (*)(void))sub_100006F38);
  v73 = v110;
  v74 = Button.init(action:label:)(sub_100006F28, v68, sub_100006F30, v129, v71, v72);
  v75 = v113;
  PlainButtonStyle.init()(v74);
  v76 = sub_10000749C(&qword_10001DC38, &qword_10001DBD8, (uint64_t)&protocol conformance descriptor for Button<A>);
  v77 = sub_100006F9C();
  v78 = v112;
  v79 = v115;
  v80 = v118;
  View.buttonStyle<A>(_:)(v75, v115, v118, v76, v77);
  (*(void (**)(char *, uint64_t))(v120 + 8))(v75, v80);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v73, v79);
  v81 = objc_msgSend((id)objc_opt_self(UIColor), "darkGrayColor");
  v82 = Color.init(_:)(v81);
  LOBYTE(v80) = static Edge.Set.all.getter();
  v83 = v121;
  v84 = v78;
  v85 = v78;
  v86 = v122;
  (*(void (**)(uint64_t, char *, uint64_t))(v121 + 16))(v67, v84, v122);
  v87 = v67 + *(int *)(v119 + 36);
  *(_QWORD *)v87 = v82;
  *(_BYTE *)(v87 + 8) = v80;
  (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v86);
  if (qword_10001DAA0 != -1)
    swift_once(&qword_10001DAA0, sub_10000BCC0);
  v88 = v107 & 1;
  v89 = qword_10001E658;
  v90 = v128;
  v91 = (char *)v128 + *(int *)(v125 + 20);
  v92 = enum case for RoundedCornerStyle.continuous(_:);
  v93 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 104))(v91, v92, v93);
  *v90 = v89;
  v90[1] = v89;
  v94 = (uint64_t)v127;
  v95 = (uint64_t)&v127[*(int *)(v124 + 36)];
  sub_100006FE4((uint64_t)v90, v95);
  *(_WORD *)(v95 + *(int *)(sub_100006D84(&qword_10001DC48) + 36)) = 256;
  sub_1000070BC(v67, v94, &qword_10001DBE8);
  sub_100007028((uint64_t)v90);
  sub_100007100(v67, &qword_10001DBE8);
  v96 = v126;
  sub_100007064(v94, v126);
  sub_1000070BC(v96, v94, &qword_10001DBF0);
  v97 = v123;
  *(_QWORD *)a3 = v123;
  *(_DWORD *)(a3 + 8) = v111;
  v98 = KeyPath;
  v99 = v116;
  *(_QWORD *)(a3 + 16) = KeyPath;
  *(_QWORD *)(a3 + 24) = v99;
  *(_QWORD *)(a3 + 32) = v61;
  *(_QWORD *)(a3 + 40) = v63;
  *(_BYTE *)(a3 + 48) = v88;
  LOBYTE(v95) = v88;
  v100 = v63;
  v101 = v61;
  v102 = v109;
  *(_QWORD *)(a3 + 56) = v109;
  v103 = sub_100006D84(&qword_10001DC50);
  sub_1000070BC(v94, a3 + *(int *)(v103 + 64), &qword_10001DBF0);
  swift_retain(v97);
  swift_retain(v98);
  swift_retain(v99);
  sub_1000070AC(v101, v100, v95);
  swift_bridgeObjectRetain(v102);
  sub_100007100(v96, &qword_10001DBF0);
  sub_100007100(v94, &qword_10001DBF0);
  sub_100006EEC(v101, v100, v95);
  swift_release(v99);
  swift_release(v98);
  swift_release(v97);
  return swift_bridgeObjectRelease(v102);
}

uint64_t sub_1000062CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v3, v0);
  v1 = v3;
  sub_1000101C4();
  return swift_release(v1);
}

void sub_100006318(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  int v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  int v48;
  int v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v54 = a1;
  v55 = a2;
  v4 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v56, v4);
  v5 = v56;
  v7 = *(_QWORD *)(v56 + 64);
  v6 = *(_QWORD *)(v56 + 72);
  swift_bridgeObjectRetain(v6);
  swift_release(v5);
  v54 = v7;
  v55 = v6;
  v8 = sub_100006EA8();
  v9 = Text.init<A>(_:)(&v54, &type metadata for String, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14 & 1;
  v16 = static Font.title.getter();
  v17 = Text.font(_:)(v16, v9, v11, v15, v13);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  swift_release(v16);
  sub_100006EEC(v9, v11, v15);
  v24 = swift_bridgeObjectRelease(v13);
  LODWORD(v54) = static HierarchicalShapeStyle.primary.getter(v24);
  v25 = Text.foregroundStyle<A>(_:)(&v54, v17, v19, v21 & 1, v23, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_100006EEC(v17, v19, v21 & 1);
  v32 = swift_bridgeObjectRelease(v23);
  v33 = static Edge.Set.top.getter(v32);
  v34 = static Edge.Set.bottom.getter();
  v35 = Edge.Set.init(rawValue:)(0);
  v36 = Edge.Set.init(rawValue:)(v35);
  if (Edge.Set.init(rawValue:)(v36 & v33) != v33)
    v35 = Edge.Set.init(rawValue:)(v35 | v33);
  v37 = Edge.Set.init(rawValue:)(v35);
  if (Edge.Set.init(rawValue:)(v37 & v34) != v34)
    LOBYTE(v35) = Edge.Set.init(rawValue:)(v35 | v34);
  if (qword_10001DA90 != -1)
    swift_once(&qword_10001DA90, sub_10000BCA0);
  v38 = EdgeInsets.init(_all:)(*(double *)&qword_10001E648);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = static Edge.Set.leading.getter();
  v46 = static Edge.Set.trailing.getter();
  v47 = Edge.Set.init(rawValue:)(0);
  v48 = Edge.Set.init(rawValue:)(v47);
  if (Edge.Set.init(rawValue:)(v48 & v45) != v45)
    v47 = Edge.Set.init(rawValue:)(v47 | v45);
  v49 = Edge.Set.init(rawValue:)(v47);
  if (Edge.Set.init(rawValue:)(v49 & v46) != v46)
    LOBYTE(v47) = Edge.Set.init(rawValue:)(v47 | v46);
  if (qword_10001DA98 != -1)
    swift_once(&qword_10001DA98, sub_10000BCB0);
  v50 = EdgeInsets.init(_all:)(*(double *)&qword_10001E650);
  *(_QWORD *)a3 = v25;
  *(_QWORD *)(a3 + 8) = v27;
  *(_BYTE *)(a3 + 16) = v29 & 1;
  *(_QWORD *)(a3 + 24) = v31;
  *(_BYTE *)(a3 + 32) = v35;
  *(double *)(a3 + 40) = v38;
  *(_QWORD *)(a3 + 48) = v40;
  *(_QWORD *)(a3 + 56) = v42;
  *(_QWORD *)(a3 + 64) = v44;
  *(_BYTE *)(a3 + 72) = 0;
  *(_BYTE *)(a3 + 80) = v47;
  *(double *)(a3 + 88) = v50;
  *(_QWORD *)(a3 + 96) = v51;
  *(_QWORD *)(a3 + 104) = v52;
  *(_QWORD *)(a3 + 112) = v53;
  *(_BYTE *)(a3 + 120) = 0;
}

__n128 sub_1000065F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v32;
  double v33;
  double v34;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __n128 result;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _OWORD v51[7];

  v18 = a9;
  v19 = a16;
  v21 = a14;
  v20 = a15;
  v22 = a12;
  v23 = a10;
  v24 = a2 & 1;
  v25 = a1;
  if ((_DWORD)v24)
    v25 = -INFINITY;
  v26 = a4 & 1;
  v27 = a3;
  if ((_DWORD)v26)
    v27 = v25;
  v28 = a6 & 1;
  v29 = a8 & 1;
  v30 = a5;
  if ((a6 & 1) != 0)
    v30 = v27;
  if (v25 > v27 || v27 > v30)
    goto LABEL_22;
  v32 = a7;
  if ((a8 & 1) != 0)
    v32 = -INFINITY;
  v33 = a10;
  if ((a11 & 1) != 0)
    v33 = v32;
  v34 = a12;
  if ((a13 & 1) != 0)
    v34 = v33;
  if (v32 > v33 || v33 > v34)
  {
LABEL_22:
    v49 = a7;
    v50 = a5;
    v47 = a1;
    v48 = a3;
    v46 = v24;
    v36 = v26;
    v38 = static os_log_type_t.fault.getter();
    v39 = (void *)static Log.runtimeIssuesLog.getter();
    v40 = v38;
    v18 = a9;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v39, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v26 = v36;
    v21 = a14;
    v20 = a15;
    v24 = v46;
    v23 = a10;
    v22 = a12;
    a1 = v47;
    a3 = v48;
    a7 = v49;
    a5 = v50;
    v19 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v51, *(_QWORD *)&a1, v24, *(_QWORD *)&a3, v26, *(_QWORD *)&a5, v28, *(_QWORD *)&a7, v29, *(_QWORD *)&v23, a11 & 1, *(_QWORD *)&v22, a13 & 1, v21, v20);
  v41 = sub_100006D84(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v18, v17, v41);
  v42 = v18 + *(int *)(sub_100006D84(a17) + 36);
  v43 = v51[5];
  *(_OWORD *)(v42 + 64) = v51[4];
  *(_OWORD *)(v42 + 80) = v43;
  *(_OWORD *)(v42 + 96) = v51[6];
  v44 = v51[1];
  *(_OWORD *)v42 = v51[0];
  *(_OWORD *)(v42 + 16) = v44;
  result = (__n128)v51[3];
  *(_OWORD *)(v42 + 32) = v51[2];
  *(__n128 *)(v42 + 48) = result;
  return result;
}

uint64_t sub_1000067D4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  const void *v15;
  const void *v16;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    v20 = a10;
    a1 = v40;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  memcpy(a9, v16, 0x129uLL);
  v35 = v44[5];
  a9[23] = v44[4];
  a9[24] = v35;
  a9[25] = v44[6];
  v36 = v44[1];
  a9[19] = v44[0];
  a9[20] = v36;
  v37 = v44[3];
  a9[21] = v44[2];
  a9[22] = v37;
  return sub_10000713C((uint64_t)v16);
}

uint64_t sub_100006984@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1000056F8(*v1, v1[1], a1);
}

uint64_t sub_10000698C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
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

  v55 = a3;
  v5 = type metadata accessor for Material(0);
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006D84(&qword_10001DBF8);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006D84(&qword_10001DC00);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100006D84(&qword_10001DC58);
  v17 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52, v18);
  v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100006D84(&qword_10001DC60);
  v23 = __chkstk_darwin(v21, v22);
  v25 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = static VerticalAlignment.center.getter(v23);
  v56 = a1;
  v57 = a2;
  v27 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v62, v27);
  v28 = v62;
  v30 = *(_QWORD *)(v62 + 80);
  v29 = *(_QWORD *)(v62 + 88);
  swift_bridgeObjectRetain(v29);
  swift_release(v28);
  v31 = Image.init(_internalSystemName:)(v30, v29);
  static SymbolRenderingMode.monochrome.getter();
  v32 = type metadata accessor for SymbolRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v16, 0, 1, v32);
  v33 = Image.symbolRenderingMode(_:)(v16, v31);
  swift_release(v31);
  sub_100007100((uint64_t)v16, &qword_10001DC00);
  v34 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v12, 1, 1, v34);
  v35 = static Font.system(size:weight:design:)(0, 1, v12, 20.0);
  sub_100007100((uint64_t)v12, &qword_10001DBF8);
  KeyPath = swift_getKeyPath(&unk_100012F08);
  v56 = v26;
  v57 = 0;
  v58 = 1;
  v59 = v33;
  v60 = KeyPath;
  v61 = v35;
  v37 = sub_100006D84(&qword_10001DC68);
  v38 = sub_10000749C(&qword_10001DC70, &qword_10001DC68, (uint64_t)&protocol conformance descriptor for HStack<A>);
  View.allowsSecureDrawing()(v37, v38);
  swift_release(v35);
  swift_release(KeyPath);
  v39 = swift_release(v33);
  v40 = static Alignment.center.getter(v39);
  v42 = sub_1000065F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v25, 0.0, 1, INFINITY, 0, v40, v41, &qword_10001DC58, &qword_10001DC60);
  v43 = (*(uint64_t (**)(char *, uint64_t, __n128))(v17 + 8))(v20, v52, v42);
  v44 = static Material.thin.getter(v43);
  LOBYTE(v35) = static Edge.Set.all.getter(v44);
  v45 = sub_100006D84(&qword_10001DC78);
  v47 = v54;
  v46 = v55;
  v48 = v55 + *(int *)(v45 + 36);
  v49 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v48, v8, v54);
  *(_BYTE *)(v48 + *(int *)(sub_100006D84(&qword_10001DC80) + 36)) = v35;
  sub_1000070BC((uint64_t)v25, v46, &qword_10001DC60);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v8, v47);
  return sub_100007100((uint64_t)v25, &qword_10001DC60);
}

uint64_t sub_100006D54()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006D6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_10000698C(*v1, v1[1], a1);
}

uint64_t sub_100006D74(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013914, 1);
}

uint64_t sub_100006D84(uint64_t *a1)
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

uint64_t sub_100006DC4(uint64_t *a1)
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

uint64_t sub_100006E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100006E30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100006E58(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100006E80(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_100006EA8()
{
  unint64_t result;

  result = qword_10001DC10;
  if (!qword_10001DC10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001DC10);
  }
  return result;
}

uint64_t sub_100006EEC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100006EFC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006F28()
{
  return sub_1000062CC();
}

void sub_100006F30(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_100006318(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100006F38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DC28;
  if (!qword_10001DC28)
  {
    v1 = sub_100006DC4(&qword_10001DC30);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DC28);
  }
  return result;
}

unint64_t sub_100006F9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DC40;
  if (!qword_10001DC40)
  {
    v1 = type metadata accessor for PlainButtonStyle(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for PlainButtonStyle, v1);
    atomic_store(result, (unint64_t *)&qword_10001DC40);
  }
  return result;
}

uint64_t sub_100006FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007028(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006D84(&qword_10001DBF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000070AC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000070BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006D84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007100(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006D84(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000713C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_BYTE *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 128);
  v12 = *(_BYTE *)(a1 + 136);
  v13 = *(_QWORD *)(a1 + 144);
  v14 = *(_QWORD *)(a1 + 152);
  v15 = *(_QWORD *)(a1 + 168);
  swift_retain(*(_QWORD *)(a1 + 40));
  swift_retain(v2);
  swift_retain(v3);
  sub_1000070AC(v4, v5, v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v8);
  sub_1000070AC(v9, v10, v12);
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  swift_retain(v15);
  return a1;
}

uint64_t sub_100007214()
{
  return sub_100007240(&qword_10001DC88, &qword_10001DBB8, (void (*)(void))sub_1000072AC);
}

uint64_t sub_100007240(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006DC4(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000072AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10001DC90;
  if (!qword_10001DC90)
  {
    v1 = sub_100006DC4(&qword_10001DBA0);
    v2[0] = sub_100006DC4(&qword_10001DB90);
    v2[1] = sub_10000749C(&qword_10001DBB0, &qword_10001DB90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DC90);
  }
  return result;
}

unint64_t sub_100007364()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DC98;
  if (!qword_10001DC98)
  {
    v1 = sub_100006DC4(&qword_10001DC78);
    sub_1000073E8();
    sub_10000749C(&qword_10001DCA8, &qword_10001DC80, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DC98);
  }
  return result;
}

unint64_t sub_1000073E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10001DCA0;
  if (!qword_10001DCA0)
  {
    v1 = sub_100006DC4(&qword_10001DC60);
    v2[0] = sub_100006DC4(&qword_10001DC68);
    v2[1] = sub_10000749C(&qword_10001DC70, &qword_10001DC68, (uint64_t)&protocol conformance descriptor for HStack<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DCA0);
  }
  return result;
}

uint64_t sub_10000749C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006DC4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000074E4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ScreenContinuityShellBundleMarkerClass()
{
  return objc_opt_self(_TtC21ScreenContinuityShellP33_D738224F0A7896064111655A5519EE6038ScreenContinuityShellBundleMarkerClass);
}

id sub_100007514()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ScreenContinuityShellBundleMarkerClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_10001E600 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for LiveActivityDisplayingVendor()
{
  return objc_opt_self(_TtC21ScreenContinuityShell28LiveActivityDisplayingVendor);
}

unint64_t sub_100007588@<X0>(_QWORD *a1@<X8>)
{
  objc_class *v2;
  id v3;
  unint64_t result;

  v2 = (objc_class *)type metadata accessor for ScreenContinuityActivity();
  v3 = objc_msgSend(objc_allocWithZone(v2), "init");
  a1[3] = v2;
  result = sub_1000075DC();
  a1[4] = result;
  *a1 = v3;
  return result;
}

unint64_t sub_1000075DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DDE8;
  if (!qword_10001DDE8)
  {
    v1 = type metadata accessor for ScreenContinuityActivity();
    result = swift_getWitnessTable(&unk_1000131B4, v1);
    atomic_store(result, (unint64_t *)&qword_10001DDE8);
  }
  return result;
}

uint64_t sub_100007624()
{
  return 0;
}

uint64_t sub_100007630()
{
  return 0;
}

void sub_10000763C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100007648(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A2C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007670(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A2C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007698(_QWORD *a1)
{
  return sub_10000A27C(a1);
}

uint64_t sub_1000076BC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007800(a1, a2, a3, &qword_10001DEB8, (uint64_t (*)(void))sub_10000A2C0, (uint64_t)&type metadata for ScreenContinuityAttributes.ContentState.CodingKeys);
}

Swift::Int sub_1000076E8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  return Hasher._finalize()();
}

Swift::Int sub_100007720(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  return Hasher._finalize()();
}

uint64_t sub_100007750()
{
  return 1;
}

uint64_t sub_100007758@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_100007784(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A304();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000077AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A304();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000077D4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007800(a1, a2, a3, &qword_10001DEC8, (uint64_t (*)(void))sub_10000A304, (uint64_t)&type metadata for ScreenContinuityAttributes.CodingKeys);
}

uint64_t sub_100007800(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v9 = sub_100006D84(a4);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v15 = a1[4];
  sub_10000A29C(a1, v14);
  v16 = a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)(a6, a6, v16, v14, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

BOOL sub_1000078D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000078E4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100007928()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100007950(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_1000079F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenContinuityActivity();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ScreenContinuityActivity()
{
  return objc_opt_self(_TtC21ScreenContinuityShell24ScreenContinuityActivity);
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes()
{
  return &type metadata for ScreenContinuityAttributes;
}

unint64_t sub_100007A90()
{
  unint64_t result;

  result = qword_10001DE28;
  if (!qword_10001DE28)
  {
    result = swift_getWitnessTable(&unk_100013084, &type metadata for ScreenContinuityAttributes);
    atomic_store(result, (unint64_t *)&qword_10001DE28);
  }
  return result;
}

unint64_t sub_100007AD8()
{
  unint64_t result;

  result = qword_10001DE30;
  if (!qword_10001DE30)
  {
    result = swift_getWitnessTable(&unk_10001305C, &type metadata for ScreenContinuityAttributes);
    atomic_store(result, (unint64_t *)&qword_10001DE30);
  }
  return result;
}

unint64_t sub_100007B20()
{
  unint64_t result;

  result = qword_10001DE38;
  if (!qword_10001DE38)
  {
    result = swift_getWitnessTable(&unk_10001318C, &type metadata for ScreenContinuityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10001DE38);
  }
  return result;
}

unint64_t sub_100007B68()
{
  unint64_t result;

  result = qword_10001DE40;
  if (!qword_10001DE40)
  {
    result = swift_getWitnessTable(&unk_100013164, &type metadata for ScreenContinuityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10001DE40);
  }
  return result;
}

unint64_t sub_100007BB0()
{
  unint64_t result;

  result = qword_10001DE48;
  if (!qword_10001DE48)
  {
    result = swift_getWitnessTable(&unk_1000130FC, &type metadata for ScreenContinuityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10001DE48);
  }
  return result;
}

unint64_t sub_100007BF8()
{
  unint64_t result;

  result = qword_10001DE50[0];
  if (!qword_10001DE50[0])
  {
    result = swift_getWitnessTable(&unk_10001313C, &type metadata for ScreenContinuityAttributes.ContentState);
    atomic_store(result, qword_10001DE50);
  }
  return result;
}

uint64_t sub_100007C3C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1[6] = v0;
  v2 = type metadata accessor for ActivityPresentationOptions(0);
  v1[7] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[8] = v3;
  v1[9] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006D84(&qword_10001DE98);
  v1[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006D84(&qword_10001DE78);
  v1[11] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[12] = v6;
  v1[13] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v1[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v1[15] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[16] = swift_task_alloc(v9);
  v1[17] = swift_task_alloc(v9);
  v1[18] = swift_task_alloc(v9);
  v1[19] = swift_task_alloc(v9);
  v1[20] = swift_task_alloc(v9);
  v1[21] = swift_task_alloc(v9);
  v1[22] = swift_task_alloc(v9);
  v10 = type metadata accessor for MainActor(0);
  v1[23] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_100007D94, v11, v12);
}

uint64_t sub_100007D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
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
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, _QWORD, uint64_t);
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
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
  NSObject *v77;
  os_log_type_t v78;
  _BOOL4 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  void (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = swift_release(*(_QWORD *)(v0 + 184));
  static Logger.angel.getter(v4);
  v5._countAndFlagsBits = 0xD000000000000077;
  v5._object = (void *)0x8000000100015610;
  v6._object = (void *)0x8000000100015900;
  v6._countAndFlagsBits = 0xD000000000000012;
  Logger.debugMarker(_:line:function:message:)(v5, 36, v6, (Swift::String_optional)0);
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v1, v2);
  sub_100006D84(&qword_10001DE80);
  v8 = static Activity.activities.getter();
  v9 = v8;
  if ((unint64_t)v8 >> 62)
  {
    if (v8 >= 0)
      v8 &= 0xFFFFFFFFFFFFFF8uLL;
    v10 = _CocoaArrayWrapper.endIndex.getter(v8);
  }
  else
  {
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v11 = swift_bridgeObjectRelease(v9);
  if (v10)
  {
    v12 = static Logger.angel.getter(v11);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "We already have an activity running", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }
    v16 = *(_QWORD *)(v0 + 144);
LABEL_7:
    v17 = *(_QWORD *)(v0 + 112);

    v7(v16, v17);
    goto LABEL_8;
  }
  v28 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v29 = objc_msgSend(v28, "bundleIdentifier");

  if (!v29)
  {
    v50 = static Logger.angel.getter(v30);
    v13 = Logger.logObject.getter(v50);
    v51 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v51, "Bundle identifier is nil", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }
    v16 = *(_QWORD *)(v0 + 152);
    goto LABEL_7;
  }
  v95 = (uint64_t *)(v0 + 40);
  v96 = v7;
  v31 = *(_QWORD *)(v0 + 104);
  v32 = *(_QWORD *)(v0 + 72);
  v33 = *(_QWORD *)(v0 + 80);
  v97 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  v35 = v34;

  v36 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v33, 1, 1, v36);
  v37 = sub_100007B20();
  v38 = sub_100007B68();
  v39 = sub_100007BB0();
  ActivityContent.init(state:staleDate:relevanceScore:)(v39, v33, &type metadata for ScreenContinuityAttributes.ContentState, v37, v38, v39, 0.0);
  v40 = sub_100006D84(&qword_10001DEA0);
  v41 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
  v42 = *(_QWORD *)(v41 - 8);
  v43 = *(_QWORD *)(v42 + 72);
  v44 = *(unsigned __int8 *)(v42 + 80);
  v45 = (v44 + 32) & ~v44;
  v46 = swift_allocObject(v40, v45 + 2 * v43, v44 | 7);
  *(_OWORD *)(v46 + 16) = xmmword_100012FD0;
  v47 = v46 + v45;
  v48 = *(void (**)(uint64_t, _QWORD, uint64_t))(v42 + 104);
  v48(v47, enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:), v41);
  v48(v47 + v43, enum case for ActivityPresentationOptions.ActivityPresentationDestination.ambient(_:), v41);
  ActivityPresentationOptions.init(destinations:)(v46);
  v49 = ActivityPresentationOptions.isUserDismissalAllowedOnLockScreen.setter(0);
  v53 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)(v49, v31, v32, v97, v35, 1, &_swiftEmptyArrayStorage, 1, 0);
  v54 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRelease(v35);
  v55 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity;
  v56 = *(_QWORD *)(v54 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity);
  *(_QWORD *)(v54 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity) = v53;
  v57 = swift_release(v56);
  v58 = *(_QWORD *)(v54 + v55);
  if (v58)
  {
    v59 = swift_retain(v58);
    v60 = Activity.id.getter(v59);
    v62 = v61;
    sub_1000087B4(v60, v61);
    v75 = swift_bridgeObjectRelease(v62);
    static Logger.angel.getter(v75);
    v76 = swift_retain_n(v58, 2);
    v77 = Logger.logObject.getter(v76);
    v78 = static os_log_type_t.info.getter();
    v79 = os_log_type_enabled(v77, v78);
    v80 = *(_QWORD *)(v0 + 168);
    v81 = *(_QWORD *)(v0 + 112);
    v82 = *(_QWORD *)(v0 + 88);
    v83 = *(_QWORD *)(v0 + 96);
    v84 = *(_QWORD *)(v0 + 72);
    v93 = *(_QWORD *)(v0 + 104);
    v94 = *(_QWORD *)(v0 + 64);
    v98 = *(_QWORD *)(v0 + 56);
    if (v79)
    {
      v92 = *(_QWORD *)(v0 + 88);
      v91 = *(_QWORD *)(v0 + 112);
      v85 = (uint8_t *)swift_slowAlloc(12, -1);
      v90 = v80;
      v86 = swift_slowAlloc(32, -1);
      v99 = v86;
      *(_DWORD *)v85 = 136446210;
      v87 = Activity.id.getter(v86);
      v89 = v88;
      *v95 = sub_100009B68(v87, v88, &v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v95, v0 + 48, v85 + 4, v85 + 12);
      swift_bridgeObjectRelease(v89);
      swift_release_n(v58, 2);
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Successfully requested activity with id %{public}s", v85, 0xCu);
      swift_arrayDestroy(v86, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v86, -1, -1);
      swift_slowDealloc(v85, -1, -1);

      swift_release(v58);
      v96(v90, v91);
      (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v84, v98);
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v93, v92);
    }
    else
    {

      swift_release_n(v58, 3);
      v96(v80, v81);
      (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v84, v98);
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v93, v82);
    }
  }
  else
  {
    v63 = static Logger.angel.getter(v57);
    v64 = Logger.logObject.getter(v63);
    v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "No activity was returned", v66, 2u);
      swift_slowDealloc(v66, -1, -1);
    }
    v67 = *(_QWORD *)(v0 + 160);
    v69 = *(_QWORD *)(v0 + 104);
    v68 = *(_QWORD *)(v0 + 112);
    v70 = *(_QWORD *)(v0 + 88);
    v71 = *(_QWORD *)(v0 + 96);
    v73 = *(_QWORD *)(v0 + 64);
    v72 = *(_QWORD *)(v0 + 72);
    v74 = *(_QWORD *)(v0 + 56);

    v96(v67, v68);
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v69, v70);
  }
LABEL_8:
  v18 = *(_QWORD *)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 152);
  v19 = *(_QWORD *)(v0 + 160);
  v22 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 144);
  v23 = *(_QWORD *)(v0 + 128);
  v24 = *(_QWORD *)(v0 + 104);
  v26 = *(_QWORD *)(v0 + 72);
  v25 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 176));
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000087B4(uint64_t a1, unint64_t a2)
{
  char *v2;
  char *v3;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint8_t *v36;
  unint64_t v37;
  _BYTE *v38;
  _QWORD *v39;
  unint64_t v40;
  id v41;
  char *v42;
  NSString v43;
  NSString v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char *v64;
  uint64_t v65;
  void (*v66)(uint64_t, _QWORD, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char v69;
  void (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  void *v76;
  char *v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  char *v83;
  id v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  unint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t aBlock[5];
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;

  v104 = a2;
  v3 = v2;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v8 = __chkstk_darwin(v5, v7);
  v10 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v8, v11);
  v14 = (char *)&v92 - v13;
  v16 = __chkstk_darwin(v12, v15);
  v18 = (char *)&v92 - v17;
  __chkstk_darwin(v16, v19);
  v21 = (char *)&v92 - v20;
  v22 = type metadata accessor for ActivityState(0);
  v24 = __chkstk_darwin(v22, v23);
  v26 = __chkstk_darwin(v24, v25);
  v30 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion;
  if (*(_QWORD *)&v3[OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion])
  {
    v31 = static Logger.angel.getter(v26);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = v6;
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "We already have an assertion running", v35, 2u);
      v36 = v35;
      v6 = v34;
      swift_slowDealloc(v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
    v37 = sub_10000A1E8();
    swift_allocError(&type metadata for ScreenContinuityActivity.ProminenceAssertionError, v37, 0, 0);
    *v38 = 0;
    swift_willThrow();
    return;
  }
  v95 = v29;
  v96 = (char *)&v92 - v27;
  v97 = v28;
  v98 = v26;
  v99 = v18;
  v100 = (uint64_t)v14;
  v94 = v21;
  v102 = v6;
  v103 = v5;
  v39 = (_QWORD *)swift_allocObject(&unk_1000190B0, 40, 7);
  v40 = v104;
  v39[2] = a1;
  v39[3] = v40;
  v39[4] = v3;
  v41 = objc_allocWithZone((Class)SNAProminentPresentationAssertion);
  swift_bridgeObjectRetain_n(v40, 2);
  v42 = v3;
  v43 = String._bridgeToObjectiveC()();
  v101 = a1;
  v44 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v40);
  aBlock[4] = (uint64_t)sub_10000A258;
  v106 = v39;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009AF4;
  aBlock[3] = (uint64_t)&unk_1000190C8;
  v45 = _Block_copy(aBlock);
  swift_release(v106);
  v46 = objc_msgSend(v41, "initWithExplanation:sessionIdentifier:invalidationHandler:", v43, v44, v45);
  _Block_release(v45);

  if (objc_msgSend(v46, "state") == (id)1)
  {
    v47 = *(void **)&v3[v30];
    *(_QWORD *)&v3[v30] = v46;
    v48 = v46;

    v49 = v100;
    static Logger.angel.getter(v50);
    v51 = swift_bridgeObjectRetain_n(v40, 2);
    v52 = Logger.logObject.getter(v51);
    v53 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc(12, -1);
      v55 = swift_slowAlloc(32, -1);
      aBlock[0] = v55;
      *(_DWORD *)v54 = 136446210;
      swift_bridgeObjectRetain(v40);
      v107 = sub_100009B68(v101, v40, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v54 + 4, v54 + 12);
      swift_bridgeObjectRelease_n(v40, 3);
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "Assertion acquired [id: %{public}s", v54, 0xCu);
      swift_arrayDestroy(v55, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v54, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v40, 2);
    }
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v49, v103);
    return;
  }
  v56 = *(_QWORD *)&v42[OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity];
  v57 = v103;
  v58 = v40;
  if (!v56)
    goto LABEL_21;
  v93 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity;
  v100 = swift_retain(v56);
  v59 = Activity.id.getter();
  v61 = v60;
  if (v59 == v101 && v60 == v40)
  {
    v62 = swift_bridgeObjectRelease(v40);
  }
  else
  {
    v63 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v60, v101, v40, 0);
    v62 = swift_bridgeObjectRelease(v61);
    if ((v63 & 1) == 0)
    {
LABEL_20:
      v56 = swift_release(v100);
      v57 = v103;
LABEL_21:
      v83 = v99;
      static Logger.angel.getter(v56);
      swift_bridgeObjectRetain_n(v58, 2);
      v84 = v46;
      v85 = Logger.logObject.getter(v84);
      v86 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v85, v86))
      {
        v87 = swift_slowAlloc(22, -1);
        v88 = swift_slowAlloc(32, -1);
        aBlock[0] = v88;
        *(_DWORD *)v87 = 136446466;
        swift_bridgeObjectRetain(v58);
        v107 = sub_100009B68(v101, v58, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v87 + 4, v87 + 12);
        swift_bridgeObjectRelease_n(v58, 3);
        *(_WORD *)(v87 + 12) = 2050;
        v89 = objc_msgSend(v84, "state");

        v107 = (uint64_t)v89;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v87 + 14, v87 + 22);

        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Acquire assertion failed [id:%{public}s, \nstate: %{public}lu]", (uint8_t *)v87, 0x16u);
        swift_arrayDestroy(v88, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v88, -1, -1);
        swift_slowDealloc(v87, -1, -1);

        (*(void (**)(char *, uint64_t))(v102 + 8))(v99, v57);
      }
      else
      {

        swift_bridgeObjectRelease_n(v58, 2);
        (*(void (**)(char *, uint64_t))(v102 + 8))(v83, v57);
      }
      v90 = sub_10000A1E8();
      swift_allocError(&type metadata for ScreenContinuityActivity.ProminenceAssertionError, v90, 0, 0);
      *v91 = 2;
      swift_willThrow();

      return;
    }
  }
  v64 = v96;
  dispatch thunk of Activity.activityState.getter(v62);
  v65 = v95;
  v66 = *(void (**)(uint64_t, _QWORD, uint64_t))(v95 + 104);
  v68 = v97;
  v67 = v98;
  v66(v97, enum case for ActivityState.dismissed(_:), v98);
  v69 = static ActivityState.== infix(_:_:)(v64, v68);
  v70 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
  v70(v68, v67);
  v71 = ((uint64_t (*)(char *, uint64_t))v70)(v64, v67);
  if ((v69 & 1) == 0)
  {
    v72 = v96;
    dispatch thunk of Activity.activityState.getter(v71);
    v74 = v97;
    v73 = v98;
    v66(v97, enum case for ActivityState.ended(_:), v98);
    v75 = static ActivityState.== infix(_:_:)(v72, v74);
    v70(v74, v73);
    v71 = ((uint64_t (*)(char *, uint64_t))v70)(v72, v73);
    if ((v75 & 1) == 0)
      goto LABEL_20;
  }
  v76 = v46;
  v77 = v94;
  v78 = static Logger.angel.getter(v71);
  v79 = Logger.logObject.getter(v78);
  v80 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v81 = 0;
    _os_log_impl((void *)&_mh_execute_header, v79, v80, "Assertion acquisition failed due to activity having already ended", v81, 2u);
    swift_slowDealloc(v81, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v102 + 8))(v77, v103);
  v82 = *(_QWORD *)&v42[v93];
  *(_QWORD *)&v42[v93] = 0;

  swift_release(v100);
  swift_release(v82);
}

uint64_t sub_100009030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  result = __chkstk_darwin(v1, v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion;
  v8 = *(void **)(v0 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v9, "invalidate");
    v10 = *(void **)(v0 + v7);
    *(_QWORD *)(v0 + v7) = 0;

    v11 = static Logger.angel.getter();
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Assertion Released", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
  return result;
}

uint64_t sub_100009158()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[4] = v0;
  v2 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006D84(&qword_10001DE70);
  v1[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v1[9] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[10] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[11] = swift_task_alloc(v7);
  v1[12] = swift_task_alloc(v7);
  v8 = type metadata accessor for MainActor(0);
  v1[13] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v1[14] = v9;
  v1[15] = v10;
  return swift_task_switch(sub_100009248, v9, v10);
}

uint64_t sub_100009248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 96);
  v4 = *(_QWORD *)(v1 + 72);
  v5 = *(_QWORD *)(v1 + 80);
  static Logger.angel.getter(a1);
  v6._countAndFlagsBits = 0xD000000000000077;
  v6._object = (void *)0x8000000100015610;
  v7._object = (void *)0x8000000100015690;
  v7._countAndFlagsBits = 0xD000000000000015;
  Logger.debugMarker(_:line:function:message:)(v6, 92, v7, (Swift::String_optional)0);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v3, v4);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity);
  *(_QWORD *)(v1 + 128) = v9;
  if (v9)
  {
    v10 = swift_retain(v9);
    static Logger.angel.getter(v10);
    v11 = swift_retain_n(v9, 2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.info.getter();
    v14 = os_log_type_enabled(v12, v13);
    v15 = *(_QWORD *)(v1 + 88);
    v16 = *(_QWORD *)(v1 + 72);
    if (v14)
    {
      v34 = *(_QWORD *)(v1 + 88);
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v36 = v18;
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v1 + 16) = v9;
      swift_retain(v9);
      v19 = sub_100006D84(&qword_10001DE80);
      v20 = String.init<A>(describing:)(v1 + 16, v19);
      v22 = v21;
      *(_QWORD *)(v1 + 24) = sub_100009B68(v20, v21, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v22);
      swift_release_n(v9, 2);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Ending activity %{public}s", v17, 0xCu);
      swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v17, -1, -1);

      v24 = v16;
      v23 = v34;
    }
    else
    {
      swift_release_n(v9, 2);

      v23 = v15;
      v24 = v16;
    }
    v8(v23, v24);
    v29 = *(_QWORD *)(v1 + 64);
    v30 = sub_100009030();
    dispatch thunk of Activity.content.getter(v30);
    v31 = sub_100006D84(&qword_10001DE78);
    v32 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v29, 0, 1, v31);
    static ActivityUIDismissalPolicy.immediate.getter(v32);
    v35 = (char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
        + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:);
    v33 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                     + 1));
    *(_QWORD *)(v1 + 136) = v33;
    *v33 = v1;
    v33[1] = sub_100009560;
    return ((uint64_t (*)(_QWORD, _QWORD))v35)(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 56));
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 104));
    v25 = *(_QWORD *)(v1 + 88);
    v27 = *(_QWORD *)(v1 + 56);
    v26 = *(_QWORD *)(v1 + 64);
    swift_task_dealloc(*(_QWORD *)(v1 + 96));
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009560()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 56);
  v3 = *(_QWORD *)(*v0 + 64);
  v4 = *(_QWORD *)(*v0 + 40);
  v5 = *(_QWORD *)(*v0 + 48);
  swift_task_dealloc(*(_QWORD *)(*v0 + 136));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_100009AB4(v3);
  return swift_task_switch(sub_1000095DC, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
}

uint64_t sub_1000095DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 104));
  swift_release(v1);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 96));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100009644(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v10, v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter(v13);
  v16 = a1;
  swift_bridgeObjectRetain(a4);
  swift_errorRetain(a2);
  v17 = v16;
  swift_bridgeObjectRetain(a4);
  v18 = swift_errorRetain(a2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v33 = v11;
    v34 = v10;
    v35 = a5;
    v21 = swift_slowAlloc(42, -1);
    v31 = (uint64_t *)swift_slowAlloc(8, -1);
    v32 = swift_slowAlloc(32, -1);
    v37 = v32;
    *(_DWORD *)v21 = 136446978;
    swift_bridgeObjectRetain(a4);
    v36 = sub_100009B68(a3, a4, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(a4, 3);
    *(_WORD *)(v21 + 12) = 2050;
    v22 = objc_msgSend(v17, "state");

    v36 = (uint64_t)v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 14, v21 + 22);

    *(_WORD *)(v21 + 22) = 2050;
    v23 = objc_msgSend(v17, "invalidationReason");

    v36 = (uint64_t)v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 24, v21 + 32);

    *(_WORD *)(v21 + 32) = 2112;
    if (a2)
    {
      swift_errorRetain(a2);
      v24 = _swift_stdlib_bridgeErrorToNSError(a2);
      v36 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 34, v21 + 42);
    }
    else
    {
      v36 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 34, v21 + 42);
      v24 = 0;
    }
    v26 = v33;
    v25 = v34;
    v27 = v31;
    *v31 = v24;
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Assertion invalidated [id: %{public}s, \nstate: %{public}lu, \ninvalidationReason: %{public}lu, \nerror: %@],", (uint8_t *)v21, 0x2Au);
    v28 = sub_100006D84(&qword_10001DEA8);
    swift_arrayDestroy(v27, 1, v28);
    swift_slowDealloc(v27, -1, -1);
    v29 = v32;
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v25);
    a5 = v35;
  }
  else
  {
    swift_bridgeObjectRelease_n(a4, 2);

    swift_errorRelease(a2);
    swift_errorRelease(a2);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  v30 = *(void **)(a5 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion);
  *(_QWORD *)(a5 + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion) = 0;

}

uint64_t sub_1000099DC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10001DE94);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100009A24;
  return sub_100007C3C();
}

uint64_t sub_100009A24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100009A6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10001DE6C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000A658;
  return sub_100009158();
}

uint64_t sub_100009AB4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006D84(&qword_10001DE70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100009AF4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(id, void *);
  id v7;
  id v8;

  v6 = *(void (**)(id, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(v8, a3);
  swift_release(v5);

}

uint64_t sub_100009B68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100009C38(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000A1A8((uint64_t)v12, *a3);
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
      sub_10000A1A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A27C(v12);
  return v7;
}

uint64_t sub_100009C38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100009DF0(a5, a6);
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

uint64_t sub_100009DF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100009E84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000A05C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000A05C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100009E84(uint64_t a1, unint64_t a2)
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
      v5 = sub_100009FF8(v4, 0);
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

_QWORD *sub_100009FF8(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006D84(&qword_10001DE88);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000A05C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006D84(&qword_10001DE88);
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

uint64_t sub_10000A1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000A1E8()
{
  unint64_t result;

  result = qword_10001DEB0;
  if (!qword_10001DEB0)
  {
    result = swift_getWitnessTable(&unk_1000133C0, &type metadata for ScreenContinuityActivity.ProminenceAssertionError);
    atomic_store(result, (unint64_t *)&qword_10001DEB0);
  }
  return result;
}

uint64_t sub_10000A22C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10000A258(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100009644(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_10000A264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A274(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A27C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_10000A29C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000A2C0()
{
  unint64_t result;

  result = qword_10001DEC0;
  if (!qword_10001DEC0)
  {
    result = swift_getWitnessTable(&unk_100013370, &type metadata for ScreenContinuityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DEC0);
  }
  return result;
}

unint64_t sub_10000A304()
{
  unint64_t result;

  result = qword_10001DED0;
  if (!qword_10001DED0)
  {
    result = swift_getWitnessTable(&unk_100013320, &type metadata for ScreenContinuityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DED0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.CodingKeys()
{
  return &type metadata for ScreenContinuityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.ContentState.CodingKeys()
{
  return &type metadata for ScreenContinuityAttributes.ContentState.CodingKeys;
}

_BYTE *initializeBufferWithCopyOfBuffer for ScreenContinuityActivity.ProminenceAssertionError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenContinuityActivity.ProminenceAssertionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScreenContinuityActivity.ProminenceAssertionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000A450 + 4 * byte_100013015[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000A484 + 4 * byte_100013010[v4]))();
}

uint64_t sub_10000A484(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A48C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000A494);
  return result;
}

uint64_t sub_10000A4A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000A4A8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000A4AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A4B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A4C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A4C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenContinuityActivity.ProminenceAssertionError()
{
  return &type metadata for ScreenContinuityActivity.ProminenceAssertionError;
}

ValueMetadata *type metadata accessor for ScreenContinuityAttributes.ContentState()
{
  return &type metadata for ScreenContinuityAttributes.ContentState;
}

unint64_t sub_10000A4F4()
{
  unint64_t result;

  result = qword_10001DED8;
  if (!qword_10001DED8)
  {
    result = swift_getWitnessTable(&unk_100013258, &type metadata for ScreenContinuityActivity.ProminenceAssertionError);
    atomic_store(result, (unint64_t *)&qword_10001DED8);
  }
  return result;
}

unint64_t sub_10000A53C()
{
  unint64_t result;

  result = qword_10001DEE0;
  if (!qword_10001DEE0)
  {
    result = swift_getWitnessTable(&unk_1000132D0, &type metadata for ScreenContinuityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DEE0);
  }
  return result;
}

unint64_t sub_10000A584()
{
  unint64_t result;

  result = qword_10001DEE8;
  if (!qword_10001DEE8)
  {
    result = swift_getWitnessTable(&unk_1000132F8, &type metadata for ScreenContinuityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DEE8);
  }
  return result;
}

unint64_t sub_10000A5CC()
{
  unint64_t result;

  result = qword_10001DEF0;
  if (!qword_10001DEF0)
  {
    result = swift_getWitnessTable(&unk_100013280, &type metadata for ScreenContinuityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DEF0);
  }
  return result;
}

unint64_t sub_10000A614()
{
  unint64_t result;

  result = qword_10001DEF8;
  if (!qword_10001DEF8)
  {
    result = swift_getWitnessTable(&unk_1000132A8, &type metadata for ScreenContinuityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001DEF8);
  }
  return result;
}

id sub_10000A76C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return objc_opt_self(_TtC21ScreenContinuityShell21ActivitySceneDelegate);
}

_QWORD *sub_10000A7CC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjectType;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSBundle v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v37[5];
  Swift::String v38;

  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v37[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v37[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[3] = type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives(0);
  v37[4] = &protocol witness table for LSAppWorkspaceBackedApplicationLaunchPrimitives;
  v37[0] = a3;
  String.LocalizationValue.init(stringLiteral:)(0x6920656E6F685069, 0xED0000657355206ELL);
  if (qword_10001DA70 != -1)
    swift_once(&qword_10001DA70, sub_100007514);
  v16 = qword_10001E600;
  v17 = (id)qword_10001E600;
  ((void (*)(void))static Locale.current.getter)();
  a4[6] = String.init(localized:table:bundle:locale:comment:)(v15, 0, 0, v16, v11, "Live Activity title string", 26, 2);
  a4[7] = v18;
  String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100015B60);
  static Locale.current.getter(v17);
  a4[8] = String.init(localized:table:bundle:locale:comment:)(v15, 0, 0, v16, v11, "Live Activity button string", 27, 2);
  a4[9] = v19;
  a4[10] = 0xD00000000000001BLL;
  a4[11] = 0x8000000100015BA0;
  ObservationRegistrar.init()();
  a4[12] = a1;
  a4[13] = a2;
  sub_10000BABC((uint64_t)v37, (uint64_t)(a4 + 14));
  ObjectType = swift_getObjectType(a1);
  swift_unknownObjectRetain(a1);
  v22 = dispatch thunk of LiveActivityDelegate.clientName.getter(ObjectType, a2);
  a4[2] = v22;
  a4[3] = v21;
  if (v21)
  {
    v23 = v21;
    v24.super.isa = (Class)qword_10001E600;
    swift_bridgeObjectRetain(v21);
    v38._countAndFlagsBits = 0xD00000000000001CLL;
    v38._object = (void *)0x8000000100015C60;
    v25._object = (void *)0x8000000100015C30;
    v25._countAndFlagsBits = 0x1000000000000028;
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, v24, v26, v38);
    v28 = sub_100006D84(&qword_10001DFE0);
    v29 = swift_allocObject(v28, 72, 7);
    *(_OWORD *)(v29 + 16) = xmmword_100013400;
    *(_QWORD *)(v29 + 56) = &type metadata for String;
    *(_QWORD *)(v29 + 64) = sub_10000BB00();
    *(_QWORD *)(v29 + 32) = v22;
    *(_QWORD *)(v29 + 40) = v23;
    v30 = static String.localizedStringWithFormat(_:_:)(v27._countAndFlagsBits, v27._object, v29);
    v32 = v31;
    swift_unknownObjectRelease(a1);
    swift_bridgeObjectRelease(v27._object);
    swift_bridgeObjectRelease(v29);
  }
  else
  {
    String.LocalizationValue.init(stringLiteral:)(0xD000000000000025, 0x8000000100015BC0);
    v33 = qword_10001E600;
    static Locale.current.getter((id)qword_10001E600);
    v30 = String.init(localized:table:bundle:locale:comment:)(v15, v22, 0, v33, v11, "Live Activity title string if no client name was provided", 57, 2);
    v32 = v34;
    swift_unknownObjectRelease(a1);
  }
  sub_10000A27C(v37);
  a4[4] = v30;
  a4[5] = v32;
  return a4;
}

char *sub_10000AB40(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  objc_class *v23;
  char *v24;
  char *result;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  char *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  char *v39;
  id v40;
  id v41;
  char *v42;
  id v43;
  char *v44;
  id v45;
  id v46;
  char *v47;
  id v48;
  char *v49;
  id v50;
  id v51;
  char *v52;
  id v53;
  char *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  Class isa;
  objc_super v60;
  _QWORD v61[4];

  v9 = type metadata accessor for UIHostingControllerSizingOptions(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone((Class)sub_100006D84(&qword_10001DFA8));
  *(double *)v61 = a3;
  *(double *)&v61[1] = a4;
  v61[2] = a1;
  v61[3] = a2;
  swift_retain(a2);
  swift_retain(a1);
  v15 = v4;
  v16 = (void *)UIHostingController.init(rootView:)(v61);
  v17 = sub_100006D84(&qword_10001DFB0);
  v18 = swift_allocObject(v17, ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72), *(unsigned __int8 *)(v10 + 80) | 7);
  *(_OWORD *)(v18 + 16) = xmmword_100013400;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  v61[0] = v18;
  v19 = sub_10000B9EC();
  v20 = sub_100006D84(&qword_10001DFC0);
  v21 = sub_10000BA34();
  dispatch thunk of SetAlgebra.init<A>(_:)(v61, v20, v21, v9, v19);
  dispatch thunk of UIHostingController.sizingOptions.setter(v13);
  *(_QWORD *)&v15[qword_10001E398] = v16;
  v22 = v16;

  v23 = (objc_class *)sub_100006D84(&qword_10001DF90);
  v60.receiver = v15;
  v60.super_class = v23;
  v24 = (char *)objc_msgSendSuper2(&v60, "initWithNibName:bundle:", 0, 0);
  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v26 = result;
  v27 = qword_10001E398;
  result = (char *)objc_msgSend(*(id *)&v24[qword_10001E398], "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v28 = result;
  objc_msgSend(v26, "addSubview:", result);

  objc_msgSend(v24, "addChildViewController:", *(_QWORD *)&v24[v27]);
  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v29 = result;
  v30 = (void *)objc_opt_self(UIColor);
  v31 = objc_msgSend(v30, "clearColor");
  objc_msgSend(v29, "setBackgroundColor:", v31);

  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v32 = result;
  v33 = objc_msgSend(v30, "clearColor");
  objc_msgSend(v32, "setBackgroundColor:", v33);

  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v34 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v35 = sub_100006D84(&qword_10001DFD0);
  v36 = swift_allocObject(v35, 64, 7);
  *(_OWORD *)(v36 + 16) = xmmword_100013410;
  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v37 = result;
  v38 = objc_msgSend(result, "topAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v39 = result;
  v40 = objc_msgSend(result, "topAnchor");

  v41 = objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  *(_QWORD *)(v36 + 32) = v41;
  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v42 = result;
  v43 = objc_msgSend(result, "leadingAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v44 = result;
  v45 = objc_msgSend(result, "leadingAnchor");

  v46 = objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  *(_QWORD *)(v36 + 40) = v46;
  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v47 = result;
  v48 = objc_msgSend(result, "trailingAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v49 = result;
  v50 = objc_msgSend(result, "trailingAnchor");

  v51 = objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  *(_QWORD *)(v36 + 48) = v51;
  result = (char *)objc_msgSend(v22, "view");
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v52 = result;
  v53 = objc_msgSend(result, "bottomAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (result)
  {
    v54 = result;
    v55 = (void *)objc_opt_self(NSLayoutConstraint);
    v56 = objc_msgSend(v54, "bottomAnchor");

    v57 = objc_msgSend(v53, "constraintEqualToAnchor:", v56);
    *(_QWORD *)(v36 + 56) = v57;
    v61[0] = v36;
    specialized Array._endMutation()();
    v58 = v61[0];
    sub_10000BA80();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v58);
    objc_msgSend(v55, "activateConstraints:", isa);

    return v24;
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_10000B148(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  Swift::String v19;
  Swift::String v20;
  void (*v21)(_BYTE *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  char *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  double Width;
  double Height;
  __int128 v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  _BYTE v104[4];
  int v105;
  id v106;
  _BYTE *v107;
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  _QWORD *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  CGRect v118;
  CGRect v119;

  v3 = v2;
  v113 = a2;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v8 = __chkstk_darwin(v5, v7);
  v10 = &v104[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __chkstk_darwin(v8, v11);
  v14 = &v104[-v13];
  v16 = __chkstk_darwin(v12, v15);
  v18 = &v104[-v17];
  static Logger.angel.getter(v16);
  v19._countAndFlagsBits = 0xD00000000000001FLL;
  v20._countAndFlagsBits = 0xD000000000000079;
  v20._object = (void *)0x8000000100015A40;
  v19._object = (void *)0x8000000100015AC0;
  Logger.debugMarker(_:line:function:message:)(v20, 18, v19, (Swift::String_optional)0);
  v21 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v21(v18, v5);
  v22 = type metadata accessor for ActivityScene(0);
  v23 = swift_dynamicCastClass(a1, v22);
  if (v23)
  {
    v24 = v23;
    v107 = v14;
    type metadata accessor for AngelServer(0);
    v25 = a1;
    v26 = (void *)static AngelServer.sharedInstance.getter();
    v27 = AngelServer.liveActivityDelegate.getter();
    v29 = v28;

    v30 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivitySecureWindow()), "initWithWindowScene:", v24);
    v31 = OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window;
    v32 = *(void **)(v3 + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = v30;
    v33 = v30;

    v34 = *(void **)(v3 + v31);
    if (!v34)
    {

      swift_unknownObjectRelease(v27);
      return;
    }
    v109 = v33;
    v111 = v25;
    v35 = type metadata accessor for LSAppWorkspaceBackedApplicationLaunchPrimitives(0);
    swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
    v108 = v34;
    v36 = LSAppWorkspaceBackedApplicationLaunchPrimitives.init()();
    v37 = type metadata accessor for LiveActivityViewModel(0);
    v38 = (_QWORD *)swift_allocObject(v37, *(unsigned int *)(v37 + 48), *(unsigned __int16 *)(v37 + 52));
    swift_unknownObjectRetain(v27);
    swift_retain(v36);
    v110 = v27;
    v112 = sub_10000A7CC(v27, v29, v36, v38);
    v39 = objc_msgSend(v113, "role");
    v40 = (void *)static UISceneSessionRole.activityAmbient.getter();
    v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    v43 = v42;
    v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
    v46 = v44;
    if (v41 == v45 && v43 == v44)
    {

      swift_bridgeObjectRelease_n(v43, 2);
    }
    else
    {
      v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v43, v45, v44, 0);

      swift_bridgeObjectRelease(v43);
      swift_bridgeObjectRelease(v46);
      if ((v51 & 1) == 0)
      {
        v106 = v39;
        v59 = (void *)static UISceneSessionRole.activityAmbientCompact.getter();
        v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
        v62 = v61;
        v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
        v65 = v63;
        if (v60 == v64 && v62 == v63)
        {
          v66 = v106;

          swift_bridgeObjectRelease_n(v62, 2);
        }
        else
        {
          v105 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v62, v64, v63, 0);
          v67 = v106;

          swift_bridgeObjectRelease(v62);
          v68 = v65;
          v66 = v67;
          v69 = swift_bridgeObjectRelease(v68);
          if ((v105 & 1) == 0)
          {
            v77 = (void *)static UISceneSessionRole.activityListItem.getter(v69);
            v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
            v80 = v79;
            v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
            v83 = v81;
            if (v78 == v82 && v80 == v81)
            {

              swift_bridgeObjectRelease_n(v80, 2);
            }
            else
            {
              v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v78, v80, v82, v81, 0);

              swift_bridgeObjectRelease(v80);
              v56 = (id)swift_bridgeObjectRelease(v83);
              if ((v84 & 1) == 0)
              {
LABEL_28:
                static Logger.angel.getter(v56);
                v95 = v113;
                v96 = Logger.logObject.getter(v95);
                v97 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v96, v97))
                {
                  v98 = (uint8_t *)swift_slowAlloc(12, -1);
                  v99 = swift_slowAlloc(32, -1);
                  v114 = v99;
                  *(_DWORD *)v98 = 136446210;
                  v116 = objc_msgSend(v95, "role");
                  type metadata accessor for Role(0);
                  v101 = String.init<A>(describing:)(&v116, v100);
                  v103 = v102;
                  v116 = (id)sub_100009B68(v101, v102, &v114);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, &v117, v98 + 4, v98 + 12);

                  swift_bridgeObjectRelease(v103);
                  _os_log_impl((void *)&_mh_execute_header, v96, v97, "Session role %{public}s not supported", v98, 0xCu);
                  swift_arrayDestroy(v99, 1, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v99, -1, -1);
                  swift_slowDealloc(v98, -1, -1);

                }
                else
                {

                }
                v21(v107, v5);
                _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ALL, 0x8000000100015B20, "ScreenContinuityShell/ActivitySceneDelegate.swift", 49, 2, 55, 0);
                __break(1u);
                return;
              }
            }
            v85 = v36;
            v76 = v108;
            objc_msgSend(v108, "frame");
            Width = CGRectGetWidth(v118);
            objc_msgSend(v76, "frame");
            Height = CGRectGetHeight(v119);
            v74 = v110;
            v73 = v111;
            if (qword_10001DA80 != -1)
              swift_once(&qword_10001DA80, sub_10000BC7C);
            v88 = xmmword_10001E630;
            v89 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
            v90 = ActivitySceneMetrics.init(size:cornerRadius:)(*(double *)&v88, *((double *)&v88 + 1), 0.0);
            dispatch thunk of ActivityScene.resolvedMetrics.setter(v90);
            v91 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
            dispatch thunk of ActivityScene.backgroundTintColor.setter(v91);
            v21 = (void (*)(_BYTE *, uint64_t))v112;
            v116 = v112;
            swift_retain(v112);
            State.init(wrappedValue:)(&v114, &v116, v37);
            v92 = v114;
            v93 = v115;
            v94 = objc_allocWithZone((Class)sub_100006D84(&qword_10001DF90));
            v55 = sub_10000AB40(v92, v93, Width, Height);
            swift_release(v92);
            swift_release(v93);
            v75 = v109;
            v36 = v85;
            goto LABEL_19;
          }
        }

        v21 = (void (*)(_BYTE *, uint64_t))v112;
        v116 = v112;
        swift_retain(v112);
        State.init(wrappedValue:)(&v114, &v116, v37);
        v70 = v114;
        v71 = v115;
        v72 = objc_allocWithZone((Class)sub_100006D84(&qword_10001DF98));
        v114 = v70;
        v115 = v71;
        v55 = (char *)UIHostingController.init(rootView:)(&v114);
        goto LABEL_18;
      }
    }

    v21 = (void (*)(_BYTE *, uint64_t))v112;
    v116 = v112;
    swift_retain(v112);
    State.init(wrappedValue:)(&v114, &v116, v37);
    v52 = v114;
    v53 = v115;
    v54 = objc_allocWithZone((Class)sub_100006D84(&qword_10001DFA0));
    v114 = v52;
    v115 = v53;
    v55 = (char *)UIHostingController.init(rootView:)(&v114);
    v56 = objc_msgSend(v55, "view");
    if (v56)
    {
      v57 = v56;
      v58 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
      objc_msgSend(v57, "setBackgroundColor:", v58);

LABEL_18:
      v74 = v110;
      v73 = v111;
      v76 = v108;
      v75 = v109;
LABEL_19:
      objc_msgSend(v76, "setRootViewController:", v55);
      objc_msgSend(v76, "makeKeyAndVisible");

      swift_release(v21);
      swift_release(v36);
      swift_unknownObjectRelease(v74);

      return;
    }
    __break(1u);
    goto LABEL_28;
  }
  v47 = static Logger.angel.getter(0);
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "ActivityScene is missing", v50, 2u);
    swift_slowDealloc(v50, -1, -1);
  }

  v21(v10, v5);
}

unint64_t sub_10000B9EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DFB8;
  if (!qword_10001DFB8)
  {
    v1 = type metadata accessor for UIHostingControllerSizingOptions(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for UIHostingControllerSizingOptions, v1);
    atomic_store(result, (unint64_t *)&qword_10001DFB8);
  }
  return result;
}

unint64_t sub_10000BA34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DFC8;
  if (!qword_10001DFC8)
  {
    v1 = sub_100006DC4(&qword_10001DFC0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001DFC8);
  }
  return result;
}

unint64_t sub_10000BA80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DFD8;
  if (!qword_10001DFD8)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001DFD8);
  }
  return result;
}

uint64_t sub_10000BABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000BB00()
{
  unint64_t result;

  result = qword_10001DFE8;
  if (!qword_10001DFE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001DFE8);
  }
  return result;
}

uint64_t sub_10000BB44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_100006D84((uint64_t *)&unk_10001E0B0);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  sub_10000BC24(v4, qword_10001E610);
  v5 = sub_10000BC64(v4, (uint64_t)qword_10001E610);
  URL.init(string:)(0xD000000000000048, 0x8000000100015C80);
  v6 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  __break(1u);
  return result;
}

uint64_t *sub_10000BC24(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000BC64(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

double sub_10000BC7C()
{
  double result;

  result = 0.0;
  xmmword_10001E630 = xmmword_100013440;
  return result;
}

void sub_10000BC90()
{
  qword_10001E640 = 0x4024000000000000;
}

void sub_10000BCA0()
{
  qword_10001E648 = 0x4024000000000000;
}

void sub_10000BCB0()
{
  qword_10001E650 = 0x4034000000000000;
}

void sub_10000BCC0()
{
  qword_10001E658 = 0x4039000000000000;
}

void sub_10000BCD0()
{
  qword_10001E0C0 = 0x7265536C6C656853;
  *(_QWORD *)algn_10001E0C8 = 0xEB00000000726576;
}

id sub_10000BD40()
{
  return sub_10000C0BC(type metadata accessor for Application);
}

uint64_t sub_10000BD4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _BYTE v10[24];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[24];

  v3 = v1 + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor;
  swift_beginAccess(v3, v17, 0, 0);
  if (*(_QWORD *)(v3 + 24))
  {
    sub_10000BABC(v3, (uint64_t)&v14);
    if (!*((_QWORD *)&v15 + 1))
    {
LABEL_5:
      v5 = type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor();
      v6 = swift_allocObject(v5, 16, 7);
      *((_QWORD *)&v15 + 1) = v5;
      v16 = sub_100005394(&qword_10001E228, (uint64_t (*)(uint64_t))type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor, (uint64_t)&unk_1000136F4);
      *(_QWORD *)&v14 = v6;
      sub_10000BABC((uint64_t)&v14, (uint64_t)&v11);
      swift_beginAccess(v3, v10, 33, 0);
      v7 = *((_QWORD *)&v12 + 1);
      if (*(_QWORD *)(v3 + 24))
      {
        sub_10000A27C((_QWORD *)v3);
        if (v7)
        {
LABEL_7:
          sub_10000DCE0(&v11, v3);
LABEL_10:
          swift_endAccess(v10);
          return sub_10000DCE0(&v14, a1);
        }
      }
      else if (*((_QWORD *)&v12 + 1))
      {
        goto LABEL_7;
      }
      v8 = v12;
      *(_OWORD *)v3 = v11;
      *(_OWORD *)(v3 + 16) = v8;
      *(_QWORD *)(v3 + 32) = v13;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = *(_OWORD *)(v3 + 16);
    v14 = *(_OWORD *)v3;
    v15 = v4;
    v16 = *(_QWORD *)(v3 + 32);
    if (!*((_QWORD *)&v4 + 1))
      goto LABEL_5;
  }
  return sub_10000DCE0(&v14, a1);
}

id sub_10000BE94()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  objc_class *v20;
  _QWORD v22[2];
  uint64_t v23;
  objc_super v24;
  void *v25;

  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6, v7);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v10, v11);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue;
  v22[0] = sub_10000DCF8();
  v14 = v0;
  static DispatchQoS.unspecified.getter();
  v25 = &_swiftEmptyArrayStorage;
  v15 = sub_100005394(&qword_10001E238, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v16 = sub_100006D84(&qword_10001E240);
  v17 = sub_10000DD34();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v16, v17, v6, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002DLL, 0x8000000100015E70, v13, v9, v5, 0);
  *(_QWORD *)(v22[1] + v23) = v18;
  v19 = &v14[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor];
  *((_QWORD *)v19 + 4) = 0;
  *(_OWORD *)v19 = 0u;
  *((_OWORD *)v19 + 1) = 0u;

  v20 = (objc_class *)type metadata accessor for AppDelegate();
  v24.receiver = v14;
  v24.super_class = v20;
  return objc_msgSendSuper2(&v24, "init");
}

id sub_10000C0B0()
{
  return sub_10000C0BC(type metadata accessor for AppDelegate);
}

id sub_10000C0BC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_10000C13C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t (*v71)(char *, uint64_t);
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;

  v4 = sub_100006D84(&qword_10001E1A0);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v11 = __chkstk_darwin(v8, v10);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v11, v14);
  v17 = (char *)&v66 - v16;
  v19 = __chkstk_darwin(v15, v18);
  v21 = (char *)&v66 - v20;
  v23 = __chkstk_darwin(v19, v22);
  v25 = (char *)&v66 - v24;
  v26 = (const char *)XPC_EVENT_KEY_NAME.getter(v23);
  v73 = a1;
  if (xpc_dictionary_get_string(a1, v26))
  {
    v71 = (uint64_t (*)(char *, uint64_t))v9;
    v68 = a2;
    v27 = String.init(cString:)();
    v29 = v28;
    static Logger.angel.getter(v27);
    v30 = swift_bridgeObjectRetain_n(v29, 2);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.info.getter();
    v33 = os_log_type_enabled(v31, v32);
    v69 = v7;
    v72 = v27;
    if (v33)
    {
      v70 = v8;
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = swift_slowAlloc(32, -1);
      v75 = v35;
      v67 = v17;
      *(_DWORD *)v34 = 136315138;
      swift_bridgeObjectRetain(v29);
      v74 = sub_100009B68(v27, v29, &v75);
      v8 = v70;
      v17 = v67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v34 + 4, v34 + 12);
      swift_bridgeObjectRelease_n(v29, 3);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Received %s event from rapport", v34, 0xCu);
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v29, 2);
    }
    v41 = (void (*)(char *, uint64_t))*((_QWORD *)v71 + 1);
    v41(v21, v8);
    if (qword_10001DAA8 != -1)
      swift_once(&qword_10001DAA8, sub_10000BCD0);
    v42 = v72;
    if (v72 == qword_10001E0C0 && v29 == *(_QWORD *)algn_10001E0C8
      || (v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v72, v29, qword_10001E0C0, *(_QWORD *)algn_10001E0C8, 0),
          (v43 & 1) != 0))
    {
      v44 = swift_bridgeObjectRelease(v29);
      v45 = static Logger.angel.getter(v44);
      v46 = Logger.logObject.getter(v45);
      v47 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = (uint8_t *)swift_slowAlloc(12, -1);
        v49 = swift_slowAlloc(32, -1);
        v71 = (uint64_t (*)(char *, uint64_t))v41;
        v50 = v49;
        v75 = v49;
        *(_DWORD *)v48 = 136446210;
        v70 = v8;
        v51 = qword_10001E0C0;
        v52 = *(_QWORD *)algn_10001E0C8;
        swift_bridgeObjectRetain(*(_QWORD *)algn_10001E0C8);
        v74 = sub_100009B68(v51, v52, &v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v48 + 4, v48 + 12);
        swift_bridgeObjectRelease(v52);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Received %{public}s event from rapport, starting session bootstrap", v48, 0xCu);
        swift_arrayDestroy(v50, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1, -1);
        swift_slowDealloc(v48, -1, -1);

        v53 = v71(v17, v70);
      }
      else
      {

        v53 = ((uint64_t (*)(char *, uint64_t))v41)(v17, v8);
      }
      v54 = (uint64_t)v69;
      static TaskPriority.userInitiated.getter(v53);
      v55 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v54, 0, 1, v55);
      v56 = swift_allocObject(&unk_100019368, 24, 7);
      swift_unknownObjectWeakInit(v56 + 16, v68);
      v57 = (_QWORD *)swift_allocObject(&unk_100019390, 48, 7);
      v57[2] = 0;
      v57[3] = 0;
      v57[4] = v56;
      v58 = v73;
      v57[5] = v73;
      swift_unknownObjectRetain(v58);
      v59 = sub_10000D19C(v54, (uint64_t)&unk_10001E210, (uint64_t)v57);
      swift_release(v59);
      return sub_10000DBC4(v54);
    }
    else
    {
      static Logger.angel.getter(v43);
      v60 = swift_bridgeObjectRetain(v29);
      v61 = Logger.logObject.getter(v60);
      v62 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc(12, -1);
        v64 = swift_slowAlloc(32, -1);
        v71 = (uint64_t (*)(char *, uint64_t))v41;
        v65 = v64;
        v75 = v64;
        *(_DWORD *)v63 = 136446210;
        swift_bridgeObjectRetain(v29);
        v74 = sub_100009B68(v42, v29, &v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v63 + 4, v63 + 12);
        swift_bridgeObjectRelease_n(v29, 3);
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%{public}s is unknown, ignoring and replying if needed", v63, 0xCu);
        swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1, -1);
        swift_slowDealloc(v63, -1, -1);

        v71(v13, v8);
      }
      else
      {

        swift_bridgeObjectRelease_n(v29, 2);
        v41(v13, v8);
      }
      return sub_10000C7E4(v73);
    }
  }
  else
  {
    v36 = static Logger.angel.getter(0);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Unable to parse XPC event name, event malformed, returning without replying", v39, 2u);
      swift_slowDealloc(v39, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v25, v8);
  }
}

uint64_t sub_10000C7E4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  xpc_object_t reply;
  xpc_object_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = xpc_dictionary_get_BOOL(a1, "replyRequired");
  if ((_DWORD)result)
  {
    reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      v9 = reply;
      xpc_dictionary_send_reply();
      return swift_unknownObjectRelease(v9);
    }
    else
    {
      v10 = static Logger.angel.getter();
      v11 = Logger.logObject.getter(v10);
      v12 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to create reply, a RunningBoardAssertion has probably leaked", v13, 2u);
        swift_slowDealloc(v13, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t sub_10000C914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5[12] = a4;
  v5[13] = a5;
  v6 = type metadata accessor for Logger(0);
  v5[14] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[15] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[16] = swift_task_alloc(v8);
  v5[17] = swift_task_alloc(v8);
  v5[18] = swift_task_alloc(v8);
  return swift_task_switch(sub_10000C990, 0, 0);
}

uint64_t sub_10000C990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 96) + 16;
  swift_beginAccess(v1, v0 + 56, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 152) = Strong;
  if (Strong)
  {
    v3 = static Logger.angel.getter(Strong);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting Bootstrap", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }
    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 112);
    v9 = *(_QWORD *)(v0 + 120);

    v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(_QWORD *)(v0 + 160) = v10;
    v10(v7, v8);
    *(_QWORD *)(v0 + 168) = type metadata accessor for AngelServer(0);
    v11 = type metadata accessor for MainActor(0);
    *(_QWORD *)(v0 + 176) = v11;
    *(_QWORD *)(v0 + 184) = static MainActor.shared.getter(v11);
    v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
    return swift_task_switch(sub_10000CB04, v12, v13);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 136);
    swift_task_dealloc(*(_QWORD *)(v0 + 144));
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000CB04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 184));
  *(_QWORD *)(v0 + 192) = static AngelServer.sharedInstance.getter(v1);
  return swift_task_switch(sub_10000CB4C, 0, 0);
}

uint64_t sub_10000CB4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v1 + 200) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000CBAC, v3, v4);
}

uint64_t sub_10000CBAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 200));
  sub_10000BD4C(v0 + 16);
  return swift_task_switch(sub_10000CBF8, 0, 0);
}

uint64_t sub_10000CBF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v1 + 208) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000CC58, v3, v4);
}

uint64_t sub_10000CC58()
{
  _QWORD *v0;
  _QWORD *v1;

  swift_release(v0[26]);
  AngelServer.provideDisplayRegistrarVendorIfNeeded(_:)(v0 + 2);
  sub_10000A27C(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to AngelServer.bootstrapSession() + 1));
  v0[27] = v1;
  *v1 = v0;
  v1[1] = sub_10000CCC4;
  return AngelServer.bootstrapSession()();
}

uint64_t sub_10000CCC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 216);
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10000CF90;
  else
    v3 = sub_10000CD28;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000CD28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = static Logger.angel.getter(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Bootstrap complete, replying to Rapport", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v6 = *(void **)(v1 + 192);
  v8 = *(void **)(v1 + 152);
  v7 = *(void (**)(uint64_t, uint64_t))(v1 + 160);
  v9 = *(_QWORD *)(v1 + 136);
  v11 = *(void **)(v1 + 104);
  v10 = *(_QWORD *)(v1 + 112);

  v7(v9, v10);
  sub_10000C7E4(v11);

  v12 = *(_QWORD *)(v1 + 136);
  v13 = *(_QWORD *)(v1 + 128);
  swift_task_dealloc(*(_QWORD *)(v1 + 144));
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000CE28()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 232));
  return swift_task_switch(sub_10000CE7C, 0, 0);
}

uint64_t sub_10000CE7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 224);
  sub_10000C7E4(*(void **)(v0 + 104));
  v2 = swift_errorRelease(v1);
  v3 = static Logger.angel.getter(v2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Bootstrap complete, replying to Rapport", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }
  v7 = *(void **)(v0 + 192);
  v9 = *(void **)(v0 + 152);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  v10 = *(_QWORD *)(v0 + 136);
  v12 = *(void **)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 112);

  v8(v10, v11);
  sub_10000C7E4(v12);

  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 128);
  swift_task_dealloc(*(_QWORD *)(v0 + 144));
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CF90(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;

  v2 = v1;
  v3 = v1[28];
  static Logger.angel.getter(a1);
  swift_errorRetain(v3);
  v4 = swift_errorRetain(v3);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = v1[28];
    v8 = v1[16];
    v21 = v1[14];
    v22 = (void (*)(uint64_t, uint64_t))v1[20];
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    *(_DWORD *)v9 = 136446210;
    v23 = v10;
    v1[10] = v7;
    swift_errorRetain(v7);
    v11 = sub_100006D84(&qword_10001E220);
    v12 = String.init<A>(describing:)(v1 + 10, v11);
    v14 = v13;
    v2[11] = sub_100009B68(v12, v13, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 11, v2 + 12, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to bootstrap session, tearing down session: %{public}s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    v22(v8, v21);
  }
  else
  {
    v15 = v1[28];
    v16 = (void (*)(uint64_t, uint64_t))v2[20];
    v17 = v2[16];
    v18 = v2[14];
    swift_errorRelease(v2[28]);
    swift_errorRelease(v15);

    v16(v17, v18);
  }
  v19 = (_QWORD *)swift_task_alloc(async function pointer to AngelServer.tearDown()[1]);
  v2[29] = v19;
  *v19 = v2;
  v19[1] = sub_10000CE28;
  return AngelServer.tearDown()();
}

uint64_t sub_10000D19C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v23[4];

  v6 = sub_100006D84(&qword_10001E1A0);
  __chkstk_darwin(v6, v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DC04(a1, (uint64_t)v9);
  v10 = type metadata accessor for TaskPriority(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_10000DBC4((uint64_t)v9);
    v12 = 4096;
    v13 = *(_QWORD *)(a3 + 16);
    if (v13)
    {
LABEL_3:
      v14 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v13);
      swift_unknownObjectRetain(v13);
      v16 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v14);
      v18 = v17;
      swift_unknownObjectRelease(v13);
      goto LABEL_6;
    }
  }
  else
  {
    v19 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    v12 = v19 | 0x1000;
    v13 = *(_QWORD *)(a3 + 16);
    if (v13)
      goto LABEL_3;
  }
  v16 = 0;
  v18 = 0;
LABEL_6:
  v20 = swift_allocObject(&unk_1000193B8, 32, 7);
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = a3;
  if (v18 | v16)
  {
    v23[0] = 0;
    v23[1] = 0;
    v21 = v23;
    v23[2] = v16;
    v23[3] = v18;
  }
  else
  {
    v21 = 0;
  }
  return swift_task_create(v12, v21, (char *)&type metadata for () + 8, &unk_10001E218, v20);
}

uint64_t sub_10000D324(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

int main(int argc, const char **argv, const char **envp)
{
  +[AppDelegate main]_0();
  return 0;
}

uint64_t type metadata accessor for Application()
{
  return objc_opt_self(_TtC21ScreenContinuityShell11Application);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC21ScreenContinuityShell11AppDelegate);
}

uint64_t sub_10000D8B0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  _QWORD aBlock[3];
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v5 = __chkstk_darwin(v2, v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.angel.getter(v5);
  v8._countAndFlagsBits = 0xD000000000000062;
  v8._object = (void *)0x8000000100015D80;
  v9._object = (void *)0x8000000100015DF0;
  v9._countAndFlagsBits = 0xD00000000000002DLL;
  Logger.debugMarker(_:line:function:message:)(v8, 78, v9, (Swift::String_optional)0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  v10 = type metadata accessor for OnenessFeatureFlags(0);
  v19 = (void *)v10;
  v20 = sub_100005394(&qword_10001E198, (uint64_t (*)(uint64_t))&type metadata accessor for OnenessFeatureFlags, (uint64_t)&protocol conformance descriptor for OnenessFeatureFlags);
  v11 = sub_10000DA74(aBlock);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v11, enum case for OnenessFeatureFlags.Shell(_:), v10);
  LOBYTE(v10) = isFeatureEnabled(_:)(aBlock);
  sub_10000A27C(aBlock);
  if ((v10 & 1) != 0)
  {
    v12 = *(NSObject **)&v1[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue];
    v13 = swift_allocObject(&unk_100019318, 24, 7);
    *(_QWORD *)(v13 + 16) = v1;
    v20 = (uint64_t)sub_10000DAD4;
    v21 = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D324;
    v19 = &unk_100019330;
    v14 = _Block_copy(aBlock);
    v15 = v21;
    v16 = v1;
    swift_release(v15);
    xpc_set_event_stream_handler("com.apple.rapport.matching", v12, v14);
    _Block_release(v14);
  }
  return 1;
}

_QWORD *sub_10000DA74(_QWORD *a1)
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

uint64_t sub_10000DAB0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DAD4(void *a1)
{
  uint64_t v1;

  return sub_10000C13C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000DADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000DAEC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000DAF4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DB18()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_unknownObjectRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000DB4C(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10001E1AC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100009A24;
  return sub_10000C914(a1, v4, v5, v7, v6);
}

uint64_t sub_10000DBC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006D84(&qword_10001E1A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006D84(&qword_10001E1A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DC4C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DC70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001E5EC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100009A24;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001E5E8 + dword_10001E5E8))(a1, v4);
}

uint64_t sub_10000DCE0(__int128 *a1, uint64_t a2)
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

unint64_t sub_10000DCF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E230;
  if (!qword_10001E230)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E230);
  }
  return result;
}

unint64_t sub_10000DD34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E248;
  if (!qword_10001E248)
  {
    v1 = sub_100006DC4(&qword_10001E240);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001E248);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LockscreenActivityView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for LockscreenActivityView(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 16));
  return swift_release(*(_QWORD *)(a1 + 24));
}

uint64_t initializeWithCopy for LockscreenActivityView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for LockscreenActivityView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = a2[2];
  v5 = a1[2];
  a1[2] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a1[3];
  v7 = a2[3];
  a1[3] = v7;
  swift_retain(v7);
  swift_release(v6);
  return a1;
}

__n128 initializeWithTake for LockscreenActivityView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for LockscreenActivityView(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *a2;
  swift_release(*(_QWORD *)(a1 + 16));
  v4 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LockscreenActivityView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LockscreenActivityView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LockscreenActivityView()
{
  return &type metadata for LockscreenActivityView;
}

uint64_t sub_10000DF68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013BD4, 1);
}

uint64_t sub_10000DF78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
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
  char *v21;
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
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (**v37)();
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t OpaqueTypeConformance2;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD v58[26];
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int16 v77;
  char v78;
  __int128 v79;
  __int128 v80;
  char v81;
  _OWORD v82[14];
  char v83;
  _BYTE v84[232];
  char v85;
  char v86;
  _BYTE v87[424];

  v52 = a1;
  v53 = a2;
  v57 = a3;
  v54 = sub_100006D84(&qword_10001DC80);
  __chkstk_darwin(v54, v9);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Material(0);
  v48 = *(_QWORD *)(v12 - 8);
  v49 = v12;
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_100006D84(&qword_10001E260);
  __chkstk_darwin(v47, v16);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_100006D84(&qword_10001E268);
  __chkstk_darwin(v51, v19);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_100006D84(&qword_10001E270);
  v23 = *(_QWORD *)(v22 - 8);
  v55 = v22;
  v56 = v23;
  v25 = __chkstk_darwin(v22, v24);
  v50 = (char *)&v47 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = static VerticalAlignment.center.getter(v25);
  v28 = sub_10000E498(a1, a2, (uint64_t)v82);
  *(_OWORD *)&v84[183] = v82[11];
  *(_OWORD *)&v84[199] = v82[12];
  *(_OWORD *)&v84[215] = v82[13];
  *(_OWORD *)&v84[119] = v82[7];
  *(_OWORD *)&v84[135] = v82[8];
  *(_OWORD *)&v84[151] = v82[9];
  *(_OWORD *)&v84[167] = v82[10];
  *(_OWORD *)&v84[55] = v82[3];
  *(_OWORD *)&v84[71] = v82[4];
  *(_OWORD *)&v84[87] = v82[5];
  *(_OWORD *)&v84[103] = v82[6];
  *(_OWORD *)&v84[7] = v82[0];
  *(_OWORD *)&v84[23] = v82[1];
  v85 = 1;
  v84[231] = v83;
  *(_OWORD *)&v84[39] = v82[2];
  v29 = static Edge.Set.all.getter(v28);
  v73 = *(_OWORD *)&v84[176];
  v74 = *(_OWORD *)&v84[192];
  v75 = *(_OWORD *)&v84[208];
  v69 = *(_OWORD *)&v84[112];
  v70 = *(_OWORD *)&v84[128];
  v71 = *(_OWORD *)&v84[144];
  v72 = *(_OWORD *)&v84[160];
  v65 = *(_OWORD *)&v84[48];
  v66 = *(_OWORD *)&v84[64];
  v67 = *(_OWORD *)&v84[80];
  v68 = *(_OWORD *)&v84[96];
  v62 = *(_OWORD *)v84;
  v63 = *(_OWORD *)&v84[16];
  v86 = 1;
  v59 = v27;
  v60 = 0;
  v61 = 1;
  v76 = *(_QWORD *)&v84[224];
  v64 = *(_OWORD *)&v84[32];
  v77 = 256;
  v78 = v29;
  v79 = 0u;
  v80 = 0u;
  v81 = 1;
  v30 = static Alignment.center.getter(v29);
  sub_1000067D4(0.0, 1, 0.0, 1, a4, 0, 0.0, 1, v58, 0.0, 1, INFINITY, 0, v30, v31);
  sub_10000ED60((uint64_t *)v82);
  v32 = memcpy(v87, v58, 0x1A0uLL);
  v33 = static Material.thin.getter(v32);
  LOBYTE(v27) = static Edge.Set.all.getter(v33);
  v35 = v48;
  v34 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v11, v15, v49);
  v11[*(int *)(v54 + 36)] = v27;
  sub_1000070BC((uint64_t)v11, (uint64_t)&v18[*(int *)(v47 + 36)], &qword_10001DC80);
  memcpy(v18, v87, 0x1A0uLL);
  sub_10000713C((uint64_t)v87);
  sub_100007100((uint64_t)v11, &qword_10001DC80);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v34);
  sub_10000EE38((uint64_t)v87);
  sub_1000070BC((uint64_t)v18, (uint64_t)v21, &qword_10001E260);
  v36 = v51;
  v37 = (uint64_t (**)())&v21[*(int *)(v51 + 36)];
  *v37 = sub_10000ECE4;
  v37[1] = 0;
  sub_100007100((uint64_t)v18, &qword_10001E260);
  v38 = sub_10000EFB4(&qword_10001E278, &qword_10001E268, (void (*)(void))sub_10000EF10);
  v39 = v50;
  v40 = v36;
  View.allowsSecureDrawing()(v36, v38);
  sub_100007100((uint64_t)v21, &qword_10001E268);
  v41 = swift_allocObject(&unk_100019468, 48, 7);
  *(double *)(v41 + 16) = a4;
  *(double *)(v41 + 24) = a5;
  v42 = v52;
  *(_QWORD *)(v41 + 32) = v52;
  v43 = v53;
  *(_QWORD *)(v41 + 40) = v53;
  swift_retain(v43);
  swift_retain(v42);
  *(_QWORD *)&v58[0] = v40;
  *((_QWORD *)&v58[0] + 1) = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v58, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
  v45 = v55;
  View.onTapGesture(count:perform:)(1, sub_10000F0F0, v41, v55, OpaqueTypeConformance2);
  swift_release(v41);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v39, v45);
}

uint64_t sub_10000E498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  double v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  _BYTE v70[7];
  _BYTE v71[7];
  char v72;
  _BYTE v73[7];
  _BYTE v74[7];
  char v75;
  _BYTE v76[7];
  char v77;
  char v78;
  _BYTE v79[7];
  _BYTE v80[7];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _OWORD v91[2];
  char v92;
  _BYTE v93[7];
  uint64_t v94;
  uint64_t v95;
  char v96;
  _BYTE v97[7];
  uint64_t v98;
  uint64_t v99;
  char v100;
  _BYTE v101[7];
  uint64_t v102;
  uint64_t v103;
  char v104;
  _BYTE v105[7];
  uint64_t v106;
  uint64_t v107;
  char v108;
  _BYTE v109[7];
  uint64_t v110;
  uint64_t v111;
  char v112;
  _BYTE v113[7];
  uint64_t v114;
  uint64_t v115;
  char v116;
  _BYTE v117[7];
  char v118;
  _BYTE v119[7];
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;

  v6 = sub_100006D84(&qword_10001DBF8);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006D84(&qword_10001DC00);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = a1;
  v95 = a2;
  v14 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v81, v14);
  v15 = v81;
  v17 = *(_QWORD *)(v81 + 80);
  v16 = *(_QWORD *)(v81 + 88);
  swift_bridgeObjectRetain(v16);
  swift_release(v15);
  v18 = Image.init(_internalSystemName:)(v17, v16);
  static SymbolRenderingMode.monochrome.getter();
  v19 = type metadata accessor for SymbolRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 0, 1, v19);
  v68 = Image.symbolRenderingMode(_:)(v13, v18);
  swift_release(v18);
  sub_100007100((uint64_t)v13, &qword_10001DC00);
  v20 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v9, 1, 1, v20);
  v21 = static Font.system(size:weight:design:)(0, 1, v9, 25.0);
  sub_100007100((uint64_t)v9, &qword_10001DBF8);
  KeyPath = swift_getKeyPath(&unk_100013538);
  v67 = static HorizontalAlignment.leading.getter();
  v23 = sub_10000E948(a1, a2, (uint64_t)&v94);
  v65 = v95;
  v66 = v94;
  LOBYTE(v15) = v96;
  v63 = v99;
  v64 = v98;
  LOBYTE(v9) = v100;
  v61 = v103;
  v62 = v102;
  v59 = v107;
  v60 = v106;
  LOBYTE(a1) = v108;
  v57 = v111;
  v58 = v110;
  LOBYTE(v13) = v112;
  v77 = 1;
  v75 = v96;
  v72 = v104;
  v69 = v112;
  LOBYTE(v17) = v104;
  LOBYTE(a2) = static Edge.Set.leading.getter(v23);
  v24 = EdgeInsets.init(_all:)(5.0);
  *(_DWORD *)v117 = *(_DWORD *)v80;
  *(_DWORD *)&v117[3] = *(_DWORD *)&v80[3];
  *(_DWORD *)v119 = *(_DWORD *)v79;
  *(_DWORD *)&v119[3] = *(_DWORD *)&v79[3];
  DWORD1(v82) = *(_DWORD *)&v76[3];
  v25 = *(_DWORD *)v76;
  *(_DWORD *)((char *)&v82 + 1) = *(_DWORD *)v76;
  HIDWORD(v83) = *(_DWORD *)&v74[3];
  v26 = *(_DWORD *)v74;
  *(_DWORD *)((char *)&v83 + 9) = *(_DWORD *)v74;
  DWORD1(v85) = *(_DWORD *)&v73[3];
  v27 = *(_DWORD *)v73;
  *(_DWORD *)((char *)&v85 + 1) = *(_DWORD *)v73;
  HIDWORD(v86) = *(_DWORD *)&v71[3];
  v28 = *(_DWORD *)v71;
  *(_DWORD *)((char *)&v86 + 9) = *(_DWORD *)v71;
  DWORD1(v88) = *(_DWORD *)&v70[3];
  v29 = *(_DWORD *)v70;
  *(_DWORD *)((char *)&v88 + 1) = *(_DWORD *)v70;
  HIDWORD(v89) = *(_DWORD *)&v80[3];
  *(_DWORD *)((char *)&v89 + 9) = *(_DWORD *)v80;
  DWORD1(v90) = *(_DWORD *)&v79[3];
  *(_DWORD *)((char *)&v90 + 1) = *(_DWORD *)v79;
  *(_DWORD *)(a3 + 209) = *(_DWORD *)v93;
  v31 = v66;
  v30 = v67;
  v81 = (unint64_t)v67;
  LOBYTE(v82) = 1;
  v33 = v64;
  v32 = v65;
  *((_QWORD *)&v82 + 1) = v66;
  *(_QWORD *)&v83 = v65;
  BYTE8(v83) = v15;
  v34 = v62;
  v35 = v63;
  *(_QWORD *)&v84 = v64;
  *((_QWORD *)&v84 + 1) = v63;
  LOBYTE(v85) = (_BYTE)v9;
  v36 = v60;
  v37 = v61;
  *((_QWORD *)&v85 + 1) = v62;
  *(_QWORD *)&v86 = v61;
  BYTE8(v86) = v17;
  v38 = v58;
  v39 = v59;
  *(_QWORD *)&v87 = v60;
  *((_QWORD *)&v87 + 1) = v59;
  LOBYTE(v88) = a1;
  v40 = v57;
  *((_QWORD *)&v88 + 1) = v58;
  *(_QWORD *)&v89 = v57;
  BYTE8(v89) = (_BYTE)v13;
  LOBYTE(v90) = a2;
  *((double *)&v90 + 1) = v24;
  *(_QWORD *)&v91[0] = v41;
  *((_QWORD *)&v91[0] + 1) = v42;
  *(_QWORD *)&v91[1] = v43;
  BYTE8(v91[1]) = 0;
  v44 = *(_OWORD *)((char *)v91 + 9);
  *(_DWORD *)(a3 + 212) = *(_DWORD *)&v93[3];
  v45 = v83;
  *(_OWORD *)(a3 + 72) = v84;
  v46 = v81;
  v47 = v82;
  *(_OWORD *)(a3 + 56) = v45;
  *(_OWORD *)(a3 + 40) = v47;
  *(_OWORD *)(a3 + 24) = v46;
  v48 = v87;
  *(_OWORD *)(a3 + 136) = v88;
  v49 = v85;
  v50 = v86;
  *(_OWORD *)(a3 + 120) = v48;
  *(_OWORD *)(a3 + 104) = v50;
  *(_OWORD *)(a3 + 88) = v49;
  v51 = v89;
  v52 = v90;
  v53 = v91[0];
  *(_OWORD *)(a3 + 193) = v44;
  *(_OWORD *)(a3 + 184) = v53;
  *(_OWORD *)(a3 + 168) = v52;
  *(_OWORD *)(a3 + 152) = v51;
  v54 = v68;
  *(_QWORD *)a3 = v68;
  *(_QWORD *)(a3 + 8) = KeyPath;
  *(_QWORD *)(a3 + 16) = v21;
  *(_QWORD *)(a3 + 216) = 0;
  *(_BYTE *)(a3 + 224) = 1;
  v78 = 0;
  v92 = 1;
  v94 = v30;
  v95 = 0;
  v96 = 1;
  *(_DWORD *)v97 = v25;
  *(_DWORD *)&v97[3] = *(_DWORD *)&v76[3];
  v98 = v31;
  v99 = v32;
  v100 = v15;
  *(_DWORD *)v101 = v26;
  *(_DWORD *)&v101[3] = *(_DWORD *)&v74[3];
  v102 = v33;
  v103 = v35;
  v104 = (char)v9;
  *(_DWORD *)v105 = v27;
  *(_DWORD *)&v105[3] = *(_DWORD *)&v73[3];
  v106 = v34;
  v107 = v37;
  v108 = v17;
  *(_DWORD *)&v109[3] = *(_DWORD *)&v71[3];
  *(_DWORD *)v109 = v28;
  v110 = v36;
  v111 = v39;
  v112 = a1;
  *(_DWORD *)&v113[3] = *(_DWORD *)&v70[3];
  *(_DWORD *)v113 = v29;
  v114 = v38;
  v115 = v40;
  v116 = (char)v13;
  v118 = a2;
  v120 = v24;
  v121 = v41;
  v122 = v42;
  v123 = v43;
  v124 = 0;
  v55 = v54;
  swift_retain(v54);
  swift_retain(KeyPath);
  swift_retain(v21);
  sub_10000F104((uint64_t)&v81);
  sub_10000F1A0((uint64_t)&v94);
  swift_release(v21);
  swift_release(KeyPath);
  return swift_release(v55);
}

uint64_t sub_10000E948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t KeyPath;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;

  v71 = a1;
  v72 = a2;
  v68 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v73, v68);
  v4 = v73;
  v6 = v73[6];
  v5 = v73[7];
  swift_bridgeObjectRetain(v5);
  swift_release(v4);
  v71 = v6;
  v72 = v5;
  v67 = sub_100006EA8();
  v7 = Text.init<A>(_:)(&v71, &type metadata for String, v67);
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  v14 = static Font.Weight.semibold.getter();
  v15 = Text.fontWeight(_:)(*(_QWORD *)&v14, 0, v7, v9, v13, v11);
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  sub_100006EEC(v7, v9, v13);
  v22 = swift_bridgeObjectRelease(v11);
  v23 = static Font.subheadline.getter(v22);
  v24 = Text.font(_:)(v23, v15, v17, v21, v19);
  v26 = v25;
  LOBYTE(v13) = v27;
  v29 = v28;
  swift_release(v23);
  sub_100006EEC(v15, v17, v21);
  v30 = swift_bridgeObjectRelease(v19);
  LODWORD(v71) = static HierarchicalShapeStyle.primary.getter(v30);
  v31 = Text.foregroundStyle<A>(_:)(&v71, v24, v26, v13 & 1, v29, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v64 = v32;
  v65 = v31;
  v66 = v33;
  v63 = v34 & 1;
  sub_100006EEC(v24, v26, v13 & 1);
  swift_bridgeObjectRelease(v29);
  KeyPath = swift_getKeyPath(&unk_100013568);
  v71 = a1;
  v72 = a2;
  State.wrappedValue.getter(&v73, v68);
  v35 = v73;
  v37 = v73[4];
  v36 = v73[5];
  swift_bridgeObjectRetain(v36);
  swift_release(v35);
  v71 = v37;
  v72 = v36;
  v38 = Text.init<A>(_:)(&v71, &type metadata for String, v67);
  v40 = v39;
  v42 = v41;
  v44 = v43 & 1;
  v45 = static Font.subheadline.getter(v38);
  v46 = Text.font(_:)(v45, v38, v40, v44, v42);
  v48 = v47;
  LOBYTE(v21) = v49;
  v51 = v50;
  swift_release(v45);
  LOBYTE(v45) = v21 & 1;
  sub_100006EEC(v38, v40, v44);
  v52 = swift_bridgeObjectRelease(v42);
  LODWORD(v71) = static HierarchicalShapeStyle.primary.getter(v52);
  v53 = Text.foregroundStyle<A>(_:)(&v71, v46, v48, v21 & 1, v51, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v55 = v54;
  v57 = v56;
  LOBYTE(v21) = v58 & 1;
  sub_100006EEC(v46, v48, v45);
  swift_bridgeObjectRelease(v51);
  v59 = swift_getKeyPath(&unk_100013568);
  v60 = swift_getKeyPath(&unk_100013598);
  LOBYTE(v71) = v63;
  *(_QWORD *)a3 = v65;
  *(_QWORD *)(a3 + 8) = v64;
  *(_BYTE *)(a3 + 16) = v63;
  *(_QWORD *)(a3 + 24) = v66;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_BYTE *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 48) = v53;
  *(_QWORD *)(a3 + 56) = v55;
  *(_BYTE *)(a3 + 64) = v21;
  *(_QWORD *)(a3 + 72) = v57;
  *(_QWORD *)(a3 + 80) = v59;
  *(_BYTE *)(a3 + 88) = 0;
  *(_QWORD *)(a3 + 96) = v60;
  *(_QWORD *)(a3 + 104) = 2;
  *(_BYTE *)(a3 + 112) = 0;
  sub_1000070AC(v65, v64, v63);
  swift_bridgeObjectRetain(v66);
  swift_retain(KeyPath);
  sub_1000070AC(v53, v55, v21);
  swift_bridgeObjectRetain(v57);
  swift_retain(v59);
  swift_retain(v60);
  sub_100006EEC(v53, v55, v21);
  swift_release(v60);
  swift_release(v59);
  swift_bridgeObjectRelease(v57);
  sub_100006EEC(v65, v64, v71);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v66);
}

uint64_t sub_10000ECE4()
{
  return Transaction.animation.setter(0);
}

uint64_t sub_10000ED08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = sub_100006D84(&qword_10001DC08);
  State.wrappedValue.getter(&v3, v0);
  v1 = v3;
  sub_100010604();
  return swift_release(v1);
}

uint64_t sub_10000ED54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000DF78(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(double *)v1, *(double *)(v1 + 8));
}

uint64_t *sub_10000ED60(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *((_BYTE *)a1 + 64);
  v7 = a1[9];
  v8 = a1[10];
  v9 = a1[12];
  v10 = a1[13];
  v12 = *((_BYTE *)a1 + 112);
  v14 = a1[16];
  v15 = a1[15];
  v13 = a1[18];
  swift_release(a1[1]);
  swift_release(v2);
  swift_release(v3);
  sub_100006EEC(v4, v5, v6);
  swift_release(v8);
  swift_bridgeObjectRelease(v7);
  sub_100006EEC(v9, v10, v12);
  swift_release(v13);
  swift_release(v14);
  swift_bridgeObjectRelease(v15);
  return a1;
}

uint64_t sub_10000EE38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_BYTE *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 128);
  v12 = *(_BYTE *)(a1 + 136);
  v14 = *(_QWORD *)(a1 + 152);
  v15 = *(_QWORD *)(a1 + 144);
  v13 = *(_QWORD *)(a1 + 168);
  swift_release(*(_QWORD *)(a1 + 32));
  swift_release(v2);
  swift_release(v3);
  sub_100006EEC(v4, v5, v6);
  swift_release(v8);
  swift_bridgeObjectRelease(v7);
  sub_100006EEC(v9, v10, v12);
  swift_release(v13);
  swift_release(v14);
  swift_bridgeObjectRelease(v15);
  return a1;
}

unint64_t sub_10000EF10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E280;
  if (!qword_10001E280)
  {
    v1 = sub_100006DC4(&qword_10001E260);
    sub_10000EFB4(&qword_10001E288, &qword_10001E290, (void (*)(void))sub_10000F01C);
    sub_10000749C(&qword_10001DCA8, &qword_10001DC80, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E280);
  }
  return result;
}

uint64_t sub_10000EFB4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006DC4(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F01C()
{
  return sub_10000EFB4(&qword_10001E298, &qword_10001E2A0, (void (*)(void))sub_10000F040);
}

unint64_t sub_10000F040()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E2A8;
  if (!qword_10001E2A8)
  {
    v1 = sub_100006DC4(&qword_10001E2B0);
    sub_10000749C(&qword_10001E2B8, (uint64_t *)&unk_10001E2C0, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E2A8);
  }
  return result;
}

uint64_t sub_10000F0C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F0F0()
{
  return sub_10000ED08();
}

uint64_t sub_10000F104(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_BYTE *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 120);
  sub_1000070AC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  sub_1000070AC(v4, v5, v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v8);
  swift_retain(v9);
  return a1;
}

uint64_t sub_10000F1A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_BYTE *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 120);
  sub_100006EEC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  sub_100006EEC(v4, v5, v6);
  swift_release(v9);
  swift_release(v8);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t sub_10000F23C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F264(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000F288@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000F2B8(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10000F2E4()
{
  uint64_t v0;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_100006DC4(&qword_10001E270);
  v3 = sub_100006DC4(&qword_10001E268);
  v4 = sub_10000EFB4(&qword_10001E278, &qword_10001E268, (void (*)(void))sub_10000EF10);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
  v3 = v0;
  v4 = OpaqueTypeConformance2;
  return swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>, 1);
}

id sub_10000F3AC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry()
{
  return objc_opt_self(_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry);
}

uint64_t sub_10000F434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)(v1
                + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile);
  objc_msgSend(v7, "setDelegate:", v1);
  v8 = static Logger.angel.getter(objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry), "registerDisplayProfile:", v7));
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Registered displayProfile with displayProfileRegistry", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_10000F55C()
{
  return sub_10000F434();
}

id sub_10000F57C()
{
  _QWORD *v0;

  return objc_msgSend(*(id *)(*v0+ OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry), "activate");
}

id sub_10000F598(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t (*v18)(_BYTE *, uint64_t);
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  _BYTE v44[12];
  int v45;
  uint64_t v46;
  uint64_t (*v47)(_BYTE *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;

  v50 = a1;
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v3, v5);
  v51 = &v44[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v6, v8);
  v11 = &v44[-v10];
  v13 = __chkstk_darwin(v9, v12);
  v15 = &v44[-v14];
  static Logger.angel.getter(v13);
  v16._countAndFlagsBits = 0xD000000000000094;
  v16._object = (void *)0x8000000100015F10;
  v17._object = (void *)0x8000000100015FB0;
  v17._countAndFlagsBits = 0xD000000000000029;
  Logger.debugMarker(_:line:function:message:)(v16, 54, v17, (Swift::String_optional)0);
  v18 = *(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8);
  v19 = v18(v15, v3);
  static Logger.angel.getter(v19);
  v20 = a2;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.debug.getter();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc(18, -1);
    v47 = v18;
    v25 = v24;
    v46 = swift_slowAlloc(32, -1);
    v53 = v46;
    *(_DWORD *)v25 = 136315394;
    v26 = v20;
    v27 = objc_msgSend(v26, "description");
    v48 = v3;
    v28 = v27;
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v45 = v23;
    v30 = v29;
    v32 = v31;

    v52 = sub_100009B68(v30, v32, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v25 + 4, v25 + 12);

    swift_bridgeObjectRelease(v32);
    *(_WORD *)(v25 + 12) = 1024;
    v33 = objc_msgSend(v26, "identity");
    LODWORD(v28) = objc_msgSend(v33, "isContinuityDisplay");

    LODWORD(v52) = (_DWORD)v28;
    v3 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, (char *)&v52 + 4, v25 + 14, v25 + 18);

    _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v45, "rootDisplayConfiguration: %s, isContinuityDisplay: %{BOOL}d", (uint8_t *)v25, 0x12u);
    v34 = v46;
    swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    v35 = v25;
    v18 = v47;
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {

  }
  v18(v11, v3);
  sub_10000F9D4();
  v36 = static NSObject.== infix(_:_:)(v50, *(_QWORD *)(v49+ OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile));
  if ((v36 & 1) != 0)
  {
    v37 = objc_msgSend(v20, "identity");
    v38 = objc_msgSend(v37, "isContinuityDisplay");

  }
  else
  {
    v39 = static Logger.angel.getter(v36);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Display profile did not match, returning false", v42, 2u);
      swift_slowDealloc(v42, -1, -1);
    }

    v18(v51, v3);
    return 0;
  }
  return v38;
}

unint64_t sub_10000F9D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E368;
  if (!qword_10001E368)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E368);
  }
  return result;
}

id sub_10000FB78()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivitySecureWindow()
{
  return objc_opt_self(_TtC21ScreenContinuityShell20ActivitySecureWindow);
}

uint64_t sub_10000FBC8(uint64_t a1)
{
  char *v2;

  v2 = (char *)&value witness table for Builtin.UnknownObject + 64;
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

double sub_10000FC0C(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  sub_10000FC4C();
  v3 = v2;

  return v3;
}

id sub_10000FC4C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + qword_10001E398), "preferredContentSize");
}

void sub_10000FC64(void *a1)
{
  id v1;

  v1 = a1;
  sub_10000FCB0();

}

id sub_10000FCB0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + qword_10001E398), "setPreferredContentSize:");
}

void sub_10000FCC8()
{
  sub_10000FFDC();
}

uint64_t sub_10000FCF4(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = v1;
  return a1;
}

uint64_t sub_10000FD0C()
{
  return 1;
}

uint64_t sub_10000FD14()
{
  return 1;
}

void sub_10000FD1C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  objc_super v7;

  v6 = (objc_class *)type metadata accessor for LiveActivityHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), *(_QWORD *)((swift_isaMask & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v6;
  objc_msgSendSuper2(&v7, "viewIsAppearing:", a1 & 1);
  sub_10000FE08();
}

void sub_10000FD7C(void *a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a1;
  sub_10000FD1C(a3, (uint64_t)v6, v4, v5);

}

void sub_10000FDBC(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;

  swift_unknownObjectRetain(a3);
  v5 = a1;
  sub_100010034();
  swift_unknownObjectRelease(a3);

}

void sub_10000FE08()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v1 = objc_msgSend(v0, "view");
  if (v1)
  {
    v2 = v1;
    v13 = objc_msgSend(v1, "window");

    if (v13)
    {
      v3 = objc_msgSend(v13, "windowScene");
      if (v3)
      {
        v4 = v3;
        v5 = type metadata accessor for ActivityScene(0);
        if (swift_dynamicCastClass(v4, v5))
        {
          objc_msgSend(v0, "preferredContentSize");
          v7 = v6;
          objc_msgSend(v0, "preferredContentSize");
          v9 = v8 + 20.0;
          v10 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
          v11 = ActivitySceneMetrics.init(size:cornerRadius:)(v7, v9, 0.0);
          dispatch thunk of ActivityScene.resolvedMetrics.setter(v11);
          v12 = v13;
          v13 = v4;
        }
        else
        {
          v12 = v4;
        }

      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000FF38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_100010038();
}

id sub_10000FF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for LiveActivityHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), *(_QWORD *)((swift_isaMask & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_10000FFC0(uint64_t a1)
{

}

uint64_t type metadata accessor for LiveActivityHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000052E8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LiveActivityHostingController);
}

void sub_10000FFDC()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100016220, "ScreenContinuityShell/LiveActivityHostingController.swift", 57, 2, 48, 0);
  __break(1u);
}

void sub_100010038()
{
  _swift_stdlib_reportUnimplementedInitializer("ScreenContinuityShell.LiveActivityHostingController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

void sub_100010064(_QWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  id v4;
  objc_class *v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v2 = (void *)static ContinuityDisplayProfile.profile.getter();
  type metadata accessor for DefaultDisplayTransformer(0);
  v3 = static DefaultDisplayTransformer.defaultRegistry.getter();
  v4 = objc_msgSend(objc_allocWithZone((Class)SSKDisplayProfileRegistry), "initWithDisplayTransformerRegistry:", v3);
  v5 = (objc_class *)type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile] = v2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry] = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v7 = v2;
  v8 = v4;
  v9 = objc_msgSendSuper2(&v10, "init");
  a1[3] = v5;
  a1[4] = sub_10001017C();

  swift_unknownObjectRelease(v3);
  *a1 = v9;
}

uint64_t type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistryVendor()
{
  return objc_opt_self(_TtC21ScreenContinuityShell49ShellSceneKitBackedConnectedDisplayRegistryVendor);
}

void sub_100010168(_QWORD *a1@<X8>)
{
  sub_100010064(a1);
}

unint64_t sub_10001017C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E4C0;
  if (!qword_10001E4C0)
  {
    v1 = type metadata accessor for ShellSceneKitBackedConnectedDisplayRegistry();
    result = swift_getWitnessTable(&unk_10001361C, v1);
    atomic_store(result, (unint64_t *)&qword_10001E4C0);
  }
  return result;
}

uint64_t sub_1000101C4()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;

  v1 = v0;
  v2 = sub_100006D84(&qword_10001E1A0);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static Logger.angel.getter(v9);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Tear down remote session from live activity button", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 1, 1, v16);
  type metadata accessor for MainActor(0);
  v17 = swift_retain(v1);
  v18 = static MainActor.shared.getter(v17);
  v19 = (_QWORD *)swift_allocObject(&unk_1000195D0, 40, 7);
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v1;
  v20 = sub_1000104C0((uint64_t)v5, (uint64_t)&unk_10001E5E0, (uint64_t)v19);
  return swift_release(v20);
}

uint64_t sub_10001036C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[3] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[4] = v6;
  v4[5] = v7;
  return swift_task_switch(sub_1000103D8, v6, v7);
}

uint64_t sub_1000103D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 104);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1 + 96));
  v4 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of LiveActivityDelegate.tearDownFromLiveActivity()[1]);
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_100010444;
  return dispatch thunk of LiveActivityDelegate.tearDownFromLiveActivity()(ObjectType, v2);
}

uint64_t sub_100010444()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 48));
  return swift_task_switch(sub_100010490, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_100010490()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000104C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000DBC4(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000195F8, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10001E218, v16);
}

uint64_t sub_100010604()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v5 = __chkstk_darwin(v2, v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Logger.angel.getter(v5);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unlock and open settings URL from live activty", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  if (qword_10001DA78 != -1)
    swift_once(&qword_10001DA78, sub_10000BB44);
  v12 = type metadata accessor for URL(0);
  v13 = sub_10000BC64(v12, (uint64_t)qword_10001E610);
  v14 = v1 + 14;
  v16 = v1[17];
  v15 = v1[18];
  sub_10000A29C(v14, v16);
  return dispatch thunk of ApplicationLaunchPrimitives.openApplication(at:)(v13, v16, v15);
}

_QWORD *sub_100010760()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  swift_bridgeObjectRelease(v0[9]);
  swift_bridgeObjectRelease(v0[11]);
  swift_unknownObjectRelease(v0[12]);
  sub_10000A27C(v0 + 14);
  v1 = (char *)v0 + OBJC_IVAR____TtC21ScreenContinuityShell21LiveActivityViewModel___observationRegistrar;
  v2 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1000107DC()
{
  uint64_t v0;

  sub_100010760();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100010800()
{
  return type metadata accessor for LiveActivityViewModel(0);
}

uint64_t type metadata accessor for LiveActivityViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_10001E4F8;
  if (!qword_10001E4F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LiveActivityViewModel);
  return result;
}

uint64_t sub_100010844(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[8];

  v4[0] = &unk_100013788;
  v4[1] = &unk_1000137A0;
  v4[2] = &unk_1000137A0;
  v4[3] = &unk_1000137A0;
  v4[4] = &unk_1000137A0;
  v4[5] = &unk_1000137A0;
  v4[6] = &unk_1000137B8;
  result = type metadata accessor for ObservationRegistrar(319);
  if (v3 <= 0x3F)
  {
    v4[7] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 8, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1000108D8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100010904(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10001E5DC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100009A24;
  return sub_10001036C(a1, v4, v5, v6);
}

uint64_t sub_100010970(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000109D4;
  return v6(a1);
}

uint64_t sub_1000109D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100010A20()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}
