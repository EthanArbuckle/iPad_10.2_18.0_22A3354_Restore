void sub_100005A5C()
{
  void *v0;
  void *v1;
  id v2;
  char v3;
  os_log_type_t v4;
  char v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t (*v54)();
  Class isa;
  uint64_t (*v56)();
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  char v61;
  char v62;
  objc_super v63;

  v1 = v0;
  v63.receiver = v0;
  v63.super_class = (Class)type metadata accessor for TripViewController();
  v2 = objc_msgSendSuper2(&v63, "viewDidLoad");
  v3 = *((_BYTE *)v0 + OBJC_IVAR____TtC4Trip18TripViewController_presentationMode);
  v4 = static os_log_type_t.debug.getter(v2);
  sub_1000191DC(v4, 0xD000000000000020, 0x8000000100023550, 0xD000000000000017, 0x8000000100023530, 19);
  v62 = 0;
  State.init(wrappedValue:)(&v56, &v62, &type metadata for Bool);
  v5 = (char)v56;
  v6 = v57;
  v56 = sub_100006658;
  v57 = 0;
  v58 = 0;
  v59 = v5;
  v60 = v6;
  v61 = v3;
  v7 = objc_allocWithZone((Class)sub_1000064D4(&qword_100032A90));
  v8 = (void *)UIHostingController.init(rootView:)(&v56);
  v9 = objc_msgSend(v8, "view");
  if (!v9)
  {
    __break(1u);
    goto LABEL_15;
  }
  v10 = v9;
  v11 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v1, "addChildViewController:", v8);
  v12 = objc_msgSend(v8, "view");
  if (!v12)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v13 = v12;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = objc_msgSend(v1, "view");
  if (!v14)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15 = v14;
  v16 = objc_msgSend(v8, "view");
  if (!v16)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v17 = v16;
  objc_msgSend(v15, "addSubview:", v16);

  objc_msgSend(v8, "didMoveToParentViewController:", v1);
  v18 = sub_1000064D4(&qword_100032A98);
  v19 = swift_allocObject(v18, 64, 7);
  *(_OWORD *)(v19 + 16) = xmmword_100022260;
  v20 = objc_msgSend(v8, "view");
  if (!v20)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, "topAnchor");

  v23 = objc_msgSend(v1, "view");
  if (!v23)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v24 = v23;
  v25 = objc_msgSend(v23, "safeAreaLayoutGuide");

  v26 = objc_msgSend(v25, "topAnchor");
  v27 = objc_msgSend(v22, "constraintEqualToAnchor:", v26);

  *(_QWORD *)(v19 + 32) = v27;
  v28 = objc_msgSend(v8, "view");
  if (!v28)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, "bottomAnchor");

  v31 = objc_msgSend(v1, "view");
  if (!v31)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, "safeAreaLayoutGuide");

  v34 = objc_msgSend(v33, "bottomAnchor");
  v35 = objc_msgSend(v30, "constraintEqualToAnchor:", v34);

  *(_QWORD *)(v19 + 40) = v35;
  v36 = objc_msgSend(v8, "view");
  if (!v36)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, "leadingAnchor");

  v39 = objc_msgSend(v1, "view");
  if (!v39)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, "safeAreaLayoutGuide");

  v42 = objc_msgSend(v41, "leadingAnchor");
  v43 = objc_msgSend(v38, "constraintEqualToAnchor:", v42);

  *(_QWORD *)(v19 + 48) = v43;
  v44 = objc_msgSend(v8, "view");
  if (!v44)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v45 = v44;
  v46 = objc_msgSend(v44, "trailingAnchor");

  v47 = objc_msgSend(v1, "view");
  if (v47)
  {
    v48 = v47;
    v49 = (void *)objc_opt_self(NSLayoutConstraint);
    v50 = objc_msgSend(v48, "safeAreaLayoutGuide");

    v51 = objc_msgSend(v50, "trailingAnchor");
    v52 = objc_msgSend(v46, "constraintEqualToAnchor:", v51);

    *(_QWORD *)(v19 + 56) = v52;
    v56 = (uint64_t (*)())v19;
    specialized Array._endMutation()(v53);
    v54 = v56;
    sub_100006514();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v54);
    objc_msgSend(v49, "activateConstraints:", isa);

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_100006050()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TripViewController()
{
  return objc_opt_self(_TtC4Trip18TripViewController);
}

uint64_t initializeBufferWithCopyOfBuffer for TripsContentView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000060D4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000060E0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100006100(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_100006564(a1, &qword_100032A28, (uint64_t)&unk_10002D060);
}

uint64_t sub_100006140(uint64_t a1, uint64_t a2)
{
  return sub_100006208(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000614C(uint64_t a1)
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

Swift::Int sub_10000618C(uint64_t a1)
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

uint64_t sub_1000061FC(uint64_t a1, uint64_t a2)
{
  return sub_100006208(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006208(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100006244(uint64_t a1, id *a2)
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

uint64_t sub_1000062B8(uint64_t a1, id *a2)
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

uint64_t sub_100006334@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100006374@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000639C(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100006424@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100006468(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000065F0((unint64_t *)&qword_100032AC8, (uint64_t)&unk_100022404);
  v3 = sub_1000065F0((unint64_t *)&unk_100032AD0, (uint64_t)&unk_100022358);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000064D4(uint64_t *a1)
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

unint64_t sub_100006514()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032AA0;
  if (!qword_100032AA0)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100032AA0);
  }
  return result;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100006564(a1, &qword_100032AA8, (uint64_t)&unk_10002D090);
}

void sub_100006564(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_1000065A8()
{
  return sub_1000065F0(&qword_100032AB0, (uint64_t)&unk_10002231C);
}

uint64_t sub_1000065CC()
{
  return sub_1000065F0(&qword_100032AB8, (uint64_t)&unk_1000222F0);
}

uint64_t sub_1000065F0(unint64_t *a1, uint64_t a2)
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

uint64_t sub_100006630()
{
  return sub_1000065F0(&qword_100032AC0, (uint64_t)&unk_10002238C);
}

uint64_t sub_100006658()
{
  if (qword_1000329A8 != -1)
    swift_once(&qword_1000329A8, sub_100007680);
  return swift_retain(qword_100035680);
}

uint64_t sub_100006698@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  void *v12;
  id v13;
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
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _BYTE v37[7];
  _BYTE v38[7];
  _BYTE v39[7];
  _BYTE v40[7];
  _BYTE v41[56];
  char v42;
  _BYTE v43[7];
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)();
  uint64_t v47;
  char v48;
  _BYTE v49[7];
  uint64_t v50;
  char v51;
  _BYTE v52[7];
  uint64_t v53;
  uint64_t v54;
  char v55;
  _BYTE v56[7];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id (*v60)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  _QWORD v65[2];
  char v66;

  v2 = v1;
  v4 = *(_QWORD *)v1;
  v5 = *(_QWORD *)(v1 + 8);
  v6 = *(unsigned __int8 *)(v1 + 16);
  v7 = type metadata accessor for TripCAFManager(0);
  v8 = sub_100006FC8(&qword_100032C00, type metadata accessor for TripCAFManager, (uint64_t)&unk_100022554);
  v9 = StateObject.wrappedValue.getter(v4, v5, v6, v7, v8);
  KeyPath = swift_getKeyPath(&unk_1000224B8);
  v11 = swift_getKeyPath(&unk_1000224E0);
  static Published.subscript.getter(v65, v9, KeyPath, v11);
  swift_release(v9);
  swift_release(KeyPath);
  swift_release(v11);
  v12 = (void *)v65[0];
  if (v65[0])
  {
    v36 = swift_getKeyPath(&unk_100022500);
    type metadata accessor for TripModel(0);
    sub_100006FC8(&qword_100032C10, type metadata accessor for TripModel, (uint64_t)&unk_100022650);
    v13 = v12;
    v14 = ObservedObject.init(wrappedValue:)();
    v33 = v15;
    v34 = v14;
    v35 = *(_BYTE *)(v2 + 40);
    v64 = *(_OWORD *)(v2 + 24);
    *(_OWORD *)v41 = *(_OWORD *)(v2 + 24);
    v16 = sub_1000064D4(&qword_100032C18);
    State.projectedValue.getter(v65, v16);
    v31 = v65[1];
    v32 = v65[0];
    v30 = v66;
    v17 = type metadata accessor for ConsoleMetrics();
    swift_allocObject(v17, 152, 7);
    v29 = sub_10001D1DC();
    v18 = type metadata accessor for ClusterMetrics();
    swift_allocObject(v18, 152, 7);
    v28 = sub_10001D4E4();
    v19 = type metadata accessor for WidgetMetrics();
    swift_allocObject(v19, 152, 7);
    v20 = sub_10001D850();
    v21 = a1;
    v22 = swift_getKeyPath(&unk_100022500);
    v23 = swift_allocObject(&unk_10002D1F0, 72, 7);
    v24 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v23 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v23 + 32) = v24;
    *(_OWORD *)(v23 + 41) = *(_OWORD *)(v2 + 25);
    *(_QWORD *)(v23 + 64) = v13;
    sub_100006BA8(v4, v5);
    v25 = sub_10000704C((uint64_t)&v64);
    *(_DWORD *)v43 = *(_DWORD *)v40;
    *(_DWORD *)&v43[3] = *(_DWORD *)&v40[3];
    *(_DWORD *)v49 = *(_DWORD *)v39;
    *(_DWORD *)&v49[3] = *(_DWORD *)&v39[3];
    *(_DWORD *)v52 = *(_DWORD *)v38;
    *(_DWORD *)&v52[3] = *(_DWORD *)&v38[3];
    *(_DWORD *)v56 = *(_DWORD *)v37;
    *(_DWORD *)&v56[3] = *(_DWORD *)&v37[3];
    *(_QWORD *)v41 = v36;
    memset(&v41[8], 0, 48);
    v42 = 0;
    v44 = v34;
    v45 = v33;
    v46 = sub_10001DC10;
    v47 = 0;
    v48 = 0;
    v50 = v22;
    a1 = v21;
    v51 = v35;
    v53 = v32;
    v54 = v31;
    v55 = v30;
    v57 = v29;
    v58 = v28;
    v59 = v20;
    v60 = sub_100007040;
    v61 = v23;
    v62 = static Alignment.center.getter(v25);
    v63 = v26;
    nullsub_1(v41);
  }
  else
  {
    sub_100006F54((uint64_t)v41);
  }
  sub_100006F78((uint64_t)v41, (uint64_t)v65);
  return sub_100006F78((uint64_t)v65, a1);
}

id sub_1000069D0@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  char v24;

  v21 = a3;
  v7 = type metadata accessor for GeometryProxy(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static Color.clear.getter(v10);
  v13 = *a2;
  v24 = *((_BYTE *)a2 + 16);
  v22 = *(__int128 *)((char *)a2 + 24);
  v23 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 57) & ~v14;
  v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (_OWORD *)swift_allocObject(&unk_10002D218, v16 + 8, v14 | 7);
  v18 = a2[1];
  v17[1] = *a2;
  v17[2] = v18;
  *(_OWORD *)((char *)v17 + 41) = *(__int128 *)((char *)a2 + 25);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v17 + v15, v11, v7);
  *(_QWORD *)((char *)v17 + v16) = v21;
  *a4 = v12;
  a4[1] = (uint64_t)sub_100007114;
  a4[3] = 0;
  a4[4] = 0;
  a4[2] = (uint64_t)v17;
  sub_100007158((uint64_t *)&v23);
  sub_10000704C((uint64_t)&v22);
  return v21;
}

void sub_100006B0C(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  __int128 v6;

  v2 = GeometryProxy.size.getter() < 400.0;
  v6 = *(_OWORD *)(a1 + 24);
  v5 = v2;
  v3 = sub_1000064D4(&qword_100032C18);
  v4 = State.wrappedValue.setter(&v5, v3);
  sub_10000B2EC(v4);
}

uint64_t sub_100006B8C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006BA8(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t destroy for TripsContentView(uint64_t *a1)
{
  sub_100006BE0(*a1, a1[1]);
  return swift_release(a1[4]);
}

uint64_t sub_100006BE0(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t initializeWithCopy for TripsContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100006BA8(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_retain(v7);
  return a1;
}

uint64_t assignWithCopy for TripsContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100006BA8(*(_QWORD *)a2, v5);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_100006BE0(v7, v8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_retain(v10);
  swift_release(v9);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for TripsContentView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TripsContentView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_100006BE0(v5, v6);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v7);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripsContentView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TripsContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TripsContentView()
{
  return &type metadata for TripsContentView;
}

uint64_t sub_100006E24(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100025CA0, 1);
}

__n128 sub_100006E34@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned __int8 v5;
  unint64_t v6;
  __n128 result;
  _QWORD v8[3];
  unsigned __int8 v9;
  __n128 v10;
  unint64_t v11;

  v2 = sub_100007188();
  EnvironmentValues.subscript.getter(v8, &type metadata for LayoutConfigurationKey, &type metadata for LayoutConfigurationKey, v2);
  v3 = v8[1];
  v4 = v8[2];
  v5 = v9;
  v6 = v11;
  result = v10;
  a1->n128_u8[0] = v8[0];
  a1->n128_u64[1] = v3;
  a1[1].n128_u64[0] = v4;
  a1[1].n128_u8[8] = v5;
  a1[2] = result;
  a1[3].n128_u64[0] = v6;
  return result;
}

uint64_t sub_100006EA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE v9[8];
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = *(_BYTE *)a1;
  v10 = v1;
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v7 = sub_100007188();
  swift_retain(v1);
  swift_retain(v2);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return EnvironmentValues.subscript.setter(v9, &type metadata for LayoutConfigurationKey, &type metadata for LayoutConfigurationKey, v7);
}

double sub_100006F54(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 192) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100006F78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000064D4(&qword_100032C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006FC8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100007008()
{
  uint64_t v0;

  sub_100006BE0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 48));

  return swift_deallocObject(v0, 72, 7);
}

id sub_100007040@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1000069D0(a1, (__int128 *)(v2 + 16), *(void **)(v2 + 64), a2);
}

uint64_t sub_10000704C(uint64_t a1)
{
  swift_retain(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_100007078()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 57) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100006BE0(v0[2], v0[3]);
  swift_release(v0[6]);
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100007114()
{
  uint64_t v0;

  type metadata accessor for GeometryProxy(0);
  sub_100006B0C(v0 + 16);
}

uint64_t *sub_100007158(uint64_t *a1)
{
  sub_100006BA8(*a1, a1[1]);
  return a1;
}

unint64_t sub_100007188()
{
  unint64_t result;

  result = qword_100032C20;
  if (!qword_100032C20)
  {
    result = swift_getWitnessTable("ɩ", &type metadata for LayoutConfigurationKey);
    atomic_store(result, (unint64_t *)&qword_100032C20);
  }
  return result;
}

unint64_t sub_1000071D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C28;
  if (!qword_100032C28)
  {
    v1 = sub_100007234(&qword_100032C08);
    sub_100007278();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100032C28);
  }
  return result;
}

uint64_t sub_100007234(uint64_t *a1)
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

unint64_t sub_100007278()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C30;
  if (!qword_100032C30)
  {
    v1 = sub_100007234(&qword_100032C38);
    sub_1000072FC();
    sub_1000073C4(&qword_100032C68, &qword_100032C70, (uint64_t)&protocol conformance descriptor for _BackgroundModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032C30);
  }
  return result;
}

unint64_t sub_1000072FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032C40;
  if (!qword_100032C40)
  {
    v1 = sub_100007234(&qword_100032C48);
    sub_100007380();
    sub_1000073C4(&qword_100032C58, &qword_100032C60, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100032C40);
  }
  return result;
}

unint64_t sub_100007380()
{
  unint64_t result;

  result = qword_100032C50;
  if (!qword_100032C50)
  {
    result = swift_getWitnessTable(&unk_1000230E4, &type metadata for TripsTabView);
    atomic_store(result, (unint64_t *)&qword_100032C50);
  }
  return result;
}

uint64_t sub_1000073C4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007234(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

char *sub_100007404(void *a1, char a2)
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
  v8 = OBJC_IVAR____TtC4Trip17TripWindowManager_window;
  *(_QWORD *)&v6[OBJC_IVAR____TtC4Trip17TripWindowManager_window] = v7;
  objc_msgSend(v7, "setAutoresizesSubviews:", 1);
  objc_msgSend(*(id *)&v6[v8], "setHidden:", 0);
  v9 = *(id *)&v6[v8];
  objc_msgSend(v9, "makeKeyAndVisible");

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for TripWindowManager();
  v10 = (char *)objc_msgSendSuper2(&v19, "init");
  v11 = *(void **)&v10[OBJC_IVAR____TtC4Trip17TripWindowManager_window];
  v12 = (objc_class *)type metadata accessor for TripViewController();
  v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC4Trip18TripViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  v14 = v10;
  v15 = v11;
  v16 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v15, "setRootViewController:", v16, v18.receiver, v18.super_class);

  return v14;
}

id sub_100007580()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripWindowManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TripWindowManager()
{
  return objc_opt_self(_TtC4Trip17TripWindowManager);
}

uint64_t sub_1000075E0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022590);
  v2 = swift_getKeyPath(&unk_1000225B8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

id sub_100007650()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)CAFCarManager), "init");
  qword_100032CA8 = (uint64_t)result;
  return result;
}

uint64_t sub_100007680()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (qword_1000329A0 != -1)
    swift_once(&qword_1000329A0, sub_100007650);
  v0 = (void *)qword_100032CA8;
  v1 = sub_100007E6C(0, &qword_100032E00, CAFCarManager_ptr);
  v2 = sub_100007EA4(&qword_100032E08, &qword_100032E00, CAFCarManager_ptr, (uint64_t)&protocol conformance descriptor for CAFCarManager);
  v3 = v0;
  v4 = (void *)CAFObserved<>.observable.getter(v1, v2);

  v5 = type metadata accessor for TripCAFManager(0);
  v6 = swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  result = sub_100007758(v4);
  qword_100035680 = v6;
  return result;
}

uint64_t sub_100007758(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  os_log_type_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v23[3];

  v2 = v1;
  v4 = sub_1000064D4(&qword_100032E10);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v23[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000064D4(&qword_100032DF8);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v23[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v2 + OBJC_IVAR____TtC4Trip14TripCAFManager__model;
  v23[0] = 0;
  v13 = sub_1000064D4((uint64_t *)&unk_100032D08);
  Published.init(initialValue:)(v23, v13);
  v14 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v15 = v2 + OBJC_IVAR____TtC4Trip14TripCAFManager_cancellables;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC4Trip14TripCAFManager_cancellables) = &_swiftEmptySetSingleton;
  v16 = static os_log_type_t.debug.getter(v14);
  sub_1000191DC(v16, 0xD00000000000001CLL, 0x8000000100023660, 0xD000000000000011, 0x8000000100023680, 22);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC4Trip14TripCAFManager_carManager) = a1;
  v17 = a1;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  v18 = swift_allocObject(&unk_10002D280, 24, 7);
  swift_weakInit(v18 + 16, v2);
  v19 = sub_100007E20();
  v20 = Publisher<>.sink(receiveValue:)(sub_100007E18, v18, v4, v19);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess(v15, v23, 33, 0);
  AnyCancellable.store(in:)(v15);
  swift_endAccess(v23);
  swift_release(v20);

  return v2;
}

uint64_t sub_100007964(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t KeyPath;
  uint64_t v17;
  _QWORD v18[3];
  id v19;

  v2 = *a1;
  v3 = a2 + 16;
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease(0xE000000000000000);
  v18[0] = 0xD000000000000012;
  v18[1] = 0x80000001000236A0;
  v19 = v2;
  v2;
  v4 = sub_1000064D4(&qword_100032E20);
  v5._countAndFlagsBits = String.init<A>(describing:)(&v19, v4);
  object = v5._object;
  String.append(_:)(v5);
  v7 = swift_bridgeObjectRelease(object);
  v8 = static os_log_type_t.info.getter(v7);
  sub_1000191DC(v8, 0xD000000000000012, 0x80000001000236A0, 0xD000000000000011, 0x8000000100023680, 26);
  swift_bridgeObjectRelease(0x80000001000236A0);
  swift_beginAccess(v3, v18, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v10 = result;
    if (v2)
    {
      v11 = sub_100007E6C(0, &qword_100032E28, CAFCar_ptr);
      v12 = sub_100007EA4((unint64_t *)&unk_100032E30, &qword_100032E28, CAFCar_ptr, (uint64_t)&protocol conformance descriptor for CAFCar);
      v13 = (void *)CAFObserved<>.observable.getter(v11, v12);
      v14 = objc_allocWithZone((Class)type metadata accessor for TripModel(0));
      v15 = sub_100009B4C(v13);
    }
    else
    {
      v15 = 0;
    }
    KeyPath = swift_getKeyPath(&unk_100022590);
    v17 = swift_getKeyPath(&unk_1000225B8);
    v19 = v15;
    return static Published.subscript.setter(&v19, v10, KeyPath, v17);
  }
  return result;
}

uint64_t sub_100007B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Trip14TripCAFManager__model;
  v2 = sub_1000064D4(&qword_100032DF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip14TripCAFManager_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100007B90()
{
  return type metadata accessor for TripCAFManager(0);
}

uint64_t type metadata accessor for TripCAFManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100032CF0;
  if (!qword_100032CF0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TripCAFManager);
  return result;
}

void sub_100007BD4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_100007C5C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_100007C5C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100032D00)
  {
    v2 = sub_100007234((uint64_t *)&unk_100032D08);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100032D00);
  }
}

void *sub_100007CB4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100007CC0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for TripCAFManager(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100007CFC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022590);
  v5 = swift_getKeyPath(&unk_1000225B8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100007D7C(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022590);
  v5 = swift_getKeyPath(&unk_1000225B8);
  v8 = v2;
  v6 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_100007DF4()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007E18(void **a1)
{
  uint64_t v1;

  return sub_100007964(a1, v1);
}

unint64_t sub_100007E20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032E18;
  if (!qword_100032E18)
  {
    v1 = sub_100007234(&qword_100032E10);
    result = swift_getWitnessTable(&protocol conformance descriptor for Published<A>.Publisher, v1);
    atomic_store(result, (unint64_t *)&qword_100032E18);
  }
  return result;
}

uint64_t sub_100007E6C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007EA4(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100007E6C(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_100007EE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  id v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v48;
  void *v49;
  unsigned int v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  Swift::String v61;
  Swift::String_optional v62;
  Swift::String v63;
  Swift::String v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  Swift::String v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  id v92;
  Swift::String v93;
  Swift::String_optional v94;
  Swift::String v95;
  Swift::String v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  unsigned int v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  Swift::String v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  id v123;
  Swift::String v124;
  Swift::String_optional v125;
  Swift::String v126;
  Swift::String v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  unsigned int v138;
  void *v139;
  id v140;
  uint64_t v141;
  void *v142;
  void *v143;
  Swift::String v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  Swift::String v149;
  Swift::String_optional v150;
  Swift::String v151;
  Swift::String v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  unsigned int v162;
  void *v163;
  id v164;
  uint64_t v165;
  void *v166;
  void *v167;
  Swift::String v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  Swift::String v173;
  Swift::String_optional v174;
  Swift::String v175;
  Swift::String v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  void *v184;
  unsigned int v185;
  void *v186;
  id v187;
  uint64_t v188;
  void *v189;
  void *v190;
  Swift::String v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  uint64_t v195;
  void *v196;
  id v197;
  id v198;
  uint64_t v199;
  char *v200;
  char *v201;
  uint64_t v202;
  void (*v203)(char *, uint64_t);
  char *v204;
  uint64_t v205;
  id v206;
  Swift::String v207;
  Swift::String_optional v208;
  Swift::String v209;
  Swift::String v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  unint64_t v216;
  uint64_t v217;
  char *v218;
  char *v219;
  char *v220;
  uint64_t v221;
  char *v222;
  char *v223;
  char *v224;
  char *v225;
  char *v226;
  char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  id v238;
  char *v239;
  char *v240;
  uint64_t v241;
  uint64_t v242;
  unint64_t v243;
  unint64_t v244;
  Swift::String v245;
  Swift::String v246;
  Swift::String v247;
  Swift::String v248;
  Swift::String v249;
  Swift::String v250;

  v1 = v0;
  sub_1000064D4(&qword_1000330C0);
  ((void (*)(void))__chkstk_darwin)();
  v227 = (char *)&v218 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v241 = sub_1000064D4(&qword_1000330B0);
  v237 = *(_QWORD *)(v241 - 8);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v218 = (char *)&v218 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v219 = (char *)&v218 - v6;
  __chkstk_darwin(v5);
  v8 = (char *)&v218 - v7;
  v9 = sub_1000064D4(&qword_1000330C8);
  __chkstk_darwin(v9);
  v234 = (char *)&v218 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000064D4(&qword_1000330D0);
  v235 = *(_QWORD *)(v11 - 8);
  v236 = v11;
  __chkstk_darwin(v11);
  v240 = (char *)&v218 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000064D4(&qword_1000330D8);
  __chkstk_darwin(v13);
  v239 = (char *)&v218 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000064D4(&qword_1000330E0);
  v232 = *(_QWORD *)(v15 - 8);
  v233 = v15;
  __chkstk_darwin(v15);
  v226 = (char *)&v218 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000064D4(&qword_1000330E8);
  __chkstk_darwin(v17);
  v224 = (char *)&v218 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1000064D4(&qword_1000330F0);
  v230 = *(_QWORD *)(v19 - 8);
  v231 = v19;
  v20 = __chkstk_darwin(v19);
  v220 = (char *)&v218 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v225 = (char *)&v218 - v22;
  v23 = sub_1000064D4(&qword_1000330F8);
  __chkstk_darwin(v23);
  v25 = (char *)&v218 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1000064D4(&qword_100033100);
  v228 = *(_QWORD *)(v26 - 8);
  v229 = v26;
  __chkstk_darwin(v26);
  v223 = (char *)&v218 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000064D4(&qword_100033108);
  __chkstk_darwin(v28);
  v30 = (char *)&v218 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_1000064D4(&qword_100033098);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = __chkstk_darwin(v31);
  v35 = (char *)&v218 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __chkstk_darwin(v33);
  v38 = (char *)&v218 - v37;
  v39 = (void *)CAFTripObservable.observed.getter(v36);
  v40 = objc_msgSend(v39, "car");

  if (v40)
  {
    v238 = (id)CAFCar.dimesionObservable.getter();

    v244 = (unint64_t)_swiftEmptyArrayStorage;
    dispatch thunk of CAFTripObservable.distance.getter();
    v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31);
    v222 = v8;
    v221 = v1;
    if (v41 == 1)
    {
      v42 = sub_10000D68C((uint64_t)v30, &qword_100033108);
      v43 = v236;
      v44 = (uint64_t)v239;
      v45 = v230;
    }
    else
    {
      v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v32 + 32))(v38, v30, v31);
      v49 = (void *)CAFTripObservable.observed.getter(v48);
      v50 = objc_msgSend(v49, "distanceInvalid");

      v45 = v230;
      if (v50)
      {
        v242 = 2108717;
        v243 = 0xE300000000000000;
        v51 = (void *)dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter();
        v52 = objc_msgSend(v51, "symbol");

        v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
        v55 = v54;

        v56._countAndFlagsBits = v53;
        v56._object = v55;
        String.append(_:)(v56);
        swift_bridgeObjectRelease(v55);
        v57 = v242;
        v58 = v243;
      }
      else
      {
        Measurement<>.toVehicleRangeUnit(using:)(v238);
        v57 = Measurement<>.formattedString(maximumFractionDigits:)(1, v31);
        v58 = v59;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v31);
      }
      v60 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v245._object = (void *)0xE000000000000000;
      v61._countAndFlagsBits = 0x45434E4154534944;
      v61._object = (void *)0xE800000000000000;
      v62.value._countAndFlagsBits = 1885958740;
      v62.value._object = (void *)0xE400000000000000;
      v63._countAndFlagsBits = 0;
      v63._object = (void *)0xE000000000000000;
      v245._countAndFlagsBits = 0;
      v64 = NSLocalizedString(_:tableName:bundle:value:comment:)(v61, v62, (NSBundle)v60, v63, v245);

      v65 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v65, *(unsigned int *)(v65 + 48), *(unsigned __int16 *)(v65 + 52));
      v66 = sub_10001474C(v57, v58, v64._countAndFlagsBits, (uint64_t)v64._object, 0xD000000000000038, 0x8000000100023880, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v68 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v67 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v68 >= v67 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v67 > 1, v68 + 1, 1);
      v69 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v68, v66);
      specialized Array._endMutation()(v69);
      v42 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v38, v31);
      v43 = v236;
      v44 = (uint64_t)v239;
    }
    dispatch thunk of CAFTripObservable.duration.getter(v42);
    v71 = v228;
    v70 = v229;
    v72 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v228 + 48))(v25, 1, v229);
    v73 = v241;
    v74 = v237;
    if (v72 == 1)
    {
      v75 = sub_10000D68C((uint64_t)v25, &qword_1000330F8);
      v76 = (uint64_t)v227;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v223, v25, v70);
      v242 = 0x202D2D3A2D2DLL;
      v243 = 0xE600000000000000;
      v77 = objc_msgSend((id)objc_opt_self(NSUnitDuration), "hours");
      v78 = v70;
      v79 = objc_msgSend(v77, "symbol");

      v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
      v82 = v81;

      v83._countAndFlagsBits = v80;
      v83._object = v82;
      String.append(_:)(v83);
      v84 = swift_bridgeObjectRelease(v82);
      v86 = v242;
      v85 = v243;
      v87 = (void *)CAFTripObservable.observed.getter(v84);
      LOBYTE(v82) = objc_msgSend(v87, "durationInvalid");

      if ((v82 & 1) == 0)
      {
        v88 = objc_msgSend(objc_allocWithZone((Class)NSDateComponentsFormatter), "init");
        objc_msgSend(v88, "setUnitsStyle:", 5);
        objc_msgSend(v88, "setAllowedUnits:", 224);
        Measurement.value.getter(v78);
        v89 = objc_msgSend(v88, "stringFromTimeInterval:");
        if (v89)
        {
          v90 = v89;
          swift_bridgeObjectRelease(v85);
          v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
          v85 = v91;

        }
      }
      v92 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v246._object = (void *)0xE000000000000000;
      v93._countAndFlagsBits = 0x4E4F495441525544;
      v93._object = (void *)0xE800000000000000;
      v94.value._countAndFlagsBits = 1885958740;
      v94.value._object = (void *)0xE400000000000000;
      v95._countAndFlagsBits = 0;
      v95._object = (void *)0xE000000000000000;
      v246._countAndFlagsBits = 0;
      v96 = NSLocalizedString(_:tableName:bundle:value:comment:)(v93, v94, (NSBundle)v92, v95, v246);

      if (qword_1000329B8 != -1)
        swift_once(&qword_1000329B8, sub_100018B1C);
      v97 = qword_1000356F8;
      v98 = unk_100035700;
      v99 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v99, *(unsigned int *)(v99 + 48), *(unsigned __int16 *)(v99 + 52));
      swift_bridgeObjectRetain(v98);
      v100 = sub_10001474C(v86, v85, v96._countAndFlagsBits, (uint64_t)v96._object, v97, v98, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v102 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v101 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v102 >= v101 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v101 > 1, v102 + 1, 1);
      v103 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v102, v100);
      specialized Array._endMutation()(v103);
      v75 = (*(uint64_t (**)(char *, uint64_t))(v228 + 8))(v223, v229);
      v76 = (uint64_t)v227;
      v43 = v236;
      v44 = (uint64_t)v239;
    }
    v104 = v231;
    v105 = (uint64_t)v224;
    dispatch thunk of CAFTripObservable.averageSpeed.getter(v75);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v105, 1, v104) == 1)
    {
      v106 = sub_10000D68C(v105, &qword_1000330E8);
      v107 = v240;
      v108 = v233;
      v109 = (uint64_t)v234;
    }
    else
    {
      v110 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 32))(v225, v105, v104);
      v111 = (void *)CAFTripObservable.observed.getter(v110);
      v112 = objc_msgSend(v111, "averageSpeedInvalid");

      if (v112)
      {
        v242 = 2108717;
        v243 = 0xE300000000000000;
        v113 = (void *)dispatch thunk of CAFDimensionObservable.vehicleSpeedUnit.getter();
        v114 = objc_msgSend(v113, "symbol");

        v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
        v117 = v116;

        v118._countAndFlagsBits = v115;
        v118._object = v117;
        String.append(_:)(v118);
        swift_bridgeObjectRelease(v117);
        v119 = v242;
        v120 = v243;
      }
      else
      {
        v121 = v220;
        Measurement<>.toVehicleSpeedUnit(using:)(v238);
        v119 = Measurement<>.formattedString(maximumFractionDigits:)(1, v104);
        v120 = v122;
        (*(void (**)(char *, uint64_t))(v45 + 8))(v121, v104);
      }
      v123 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v247._object = (void *)0xE000000000000000;
      v124._countAndFlagsBits = 0x4445455053;
      v124._object = (void *)0xE500000000000000;
      v125.value._countAndFlagsBits = 1885958740;
      v125.value._object = (void *)0xE400000000000000;
      v126._countAndFlagsBits = 0;
      v126._object = (void *)0xE000000000000000;
      v247._countAndFlagsBits = 0;
      v127 = NSLocalizedString(_:tableName:bundle:value:comment:)(v124, v125, (NSBundle)v123, v126, v247);

      v128 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v128, *(unsigned int *)(v128 + 48), *(unsigned __int16 *)(v128 + 52));
      v129 = sub_10001474C(v119, v120, v127._countAndFlagsBits, (uint64_t)v127._object, 0xD000000000000026, 0x8000000100023850, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v131 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v130 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v131 >= v130 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v130 > 1, v131 + 1, 1);
      v132 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v131, v129);
      specialized Array._endMutation()(v132);
      v106 = (*(uint64_t (**)(char *, uint64_t))(v230 + 8))(v225, v231);
      v107 = v240;
      v73 = v241;
      v108 = v233;
      v109 = (uint64_t)v234;
      v74 = v237;
      v44 = (uint64_t)v239;
    }
    dispatch thunk of CAFTripObservable.energy.getter(v106);
    v133 = v232;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v232 + 48))(v44, 1, v108) == 1)
    {
      v134 = sub_10000D68C(v44, &qword_1000330D8);
    }
    else
    {
      v135 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v133 + 32))(v226, v44, v108);
      v136 = v108;
      v137 = (void *)CAFTripObservable.observed.getter(v135);
      v138 = objc_msgSend(v137, "energyInvalid");

      if (v138)
      {
        v242 = 2108717;
        v243 = 0xE300000000000000;
        v139 = (void *)Measurement.unit.getter(v136);
        v140 = objc_msgSend(v139, "symbol");

        v141 = static String._unconditionallyBridgeFromObjectiveC(_:)(v140);
        v143 = v142;

        v144._countAndFlagsBits = v141;
        v144._object = v143;
        String.append(_:)(v144);
        swift_bridgeObjectRelease(v143);
        v145 = v242;
        v146 = v243;
      }
      else
      {
        v145 = Measurement<>.formattedString(maximumFractionDigits:)(1, v136);
        v146 = v147;
      }
      v148 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v248._object = (void *)0xE000000000000000;
      v149._countAndFlagsBits = 0x594752454E45;
      v149._object = (void *)0xE600000000000000;
      v150.value._countAndFlagsBits = 1885958740;
      v150.value._object = (void *)0xE400000000000000;
      v151._countAndFlagsBits = 0;
      v151._object = (void *)0xE000000000000000;
      v248._countAndFlagsBits = 0;
      v152 = NSLocalizedString(_:tableName:bundle:value:comment:)(v149, v150, (NSBundle)v148, v151, v248);

      v153 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v153, *(unsigned int *)(v153 + 48), *(unsigned __int16 *)(v153 + 52));
      v154 = sub_10001474C(v145, v146, v152._countAndFlagsBits, (uint64_t)v152._object, 0xD000000000000017, 0x8000000100023830, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v156 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v155 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v156 >= v155 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v155 > 1, v156 + 1, 1);
      v157 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v156, v154);
      specialized Array._endMutation()(v157);
      v134 = (*(uint64_t (**)(char *, uint64_t))(v232 + 8))(v226, v233);
      v109 = (uint64_t)v234;
      v107 = v240;
      v73 = v241;
    }
    dispatch thunk of CAFTripObservable.energyEfficiency.getter(v134);
    v158 = v235;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v235 + 48))(v109, 1, v43) == 1)
    {
      v159 = sub_10000D68C(v109, &qword_1000330C8);
    }
    else
    {
      v160 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v158 + 32))(v107, v109, v43);
      v161 = (void *)CAFTripObservable.observed.getter(v160);
      v162 = objc_msgSend(v161, "energyEfficiencyInvalid");

      if (v162)
      {
        v242 = 2108717;
        v243 = 0xE300000000000000;
        v163 = (void *)Measurement.unit.getter(v43);
        v164 = objc_msgSend(v163, "symbol");

        v165 = static String._unconditionallyBridgeFromObjectiveC(_:)(v164);
        v167 = v166;

        v168._countAndFlagsBits = v165;
        v168._object = v167;
        String.append(_:)(v168);
        swift_bridgeObjectRelease(v167);
        v169 = v242;
        v170 = v243;
      }
      else
      {
        v169 = Measurement<>.formattedString(maximumFractionDigits:)(1, v43);
        v170 = v171;
      }
      v172 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v249._object = (void *)0xE000000000000000;
      v173._object = (void *)0x80000001000237F0;
      v173._countAndFlagsBits = 0xD000000000000011;
      v174.value._countAndFlagsBits = 1885958740;
      v174.value._object = (void *)0xE400000000000000;
      v175._countAndFlagsBits = 0;
      v175._object = (void *)0xE000000000000000;
      v249._countAndFlagsBits = 0;
      v176 = NSLocalizedString(_:tableName:bundle:value:comment:)(v173, v174, (NSBundle)v172, v175, v249);

      v177 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v177, *(unsigned int *)(v177 + 48), *(unsigned __int16 *)(v177 + 52));
      v178 = sub_10001474C(v169, v170, v176._countAndFlagsBits, (uint64_t)v176._object, 0xD000000000000011, 0x8000000100023810, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v180 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v179 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v180 >= v179 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v179 > 1, v180 + 1, 1);
      v181 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v180, v178);
      specialized Array._endMutation()(v181);
      v159 = (*(uint64_t (**)(char *, uint64_t))(v235 + 8))(v240, v43);
    }
    v182 = v222;
    dispatch thunk of CAFTripObservable.fuelEfficiency.getter(v159);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v76, 1, v73) == 1)
    {

      sub_10000D68C(v76, &qword_1000330C0);
    }
    else
    {
      v183 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 32))(v182, v76, v73);
      v184 = (void *)CAFTripObservable.observed.getter(v183);
      v185 = objc_msgSend(v184, "fuelEfficiencyInvalid");

      if (v185)
      {
        v242 = 2108717;
        v243 = 0xE300000000000000;
        v186 = (void *)dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter();
        v187 = objc_msgSend(v186, "symbol");

        v188 = static String._unconditionallyBridgeFromObjectiveC(_:)(v187);
        v190 = v189;

        v191._countAndFlagsBits = v188;
        v191._object = v190;
        String.append(_:)(v191);
        swift_bridgeObjectRelease(v190);
        v192 = v242;
        v193 = v243;
      }
      else
      {
        v194 = Measurement.value.getter(v73);
        v196 = (void *)CAFTripObservable.observed.getter(v195);
        v197 = objc_msgSend(v196, "fuelEfficiencyRange");

        LODWORD(v196) = objc_msgSend(v197, "maximumValue");
        if (v194 == (double)v196)
        {
          v198 = objc_msgSend((id)objc_opt_self(NSUnitFuelEfficiency), "millilitersPer100Kilometers");
          v199 = sub_100007E6C(0, &qword_1000330B8, NSUnitFuelEfficiency_ptr);
          v200 = v219;
          Measurement.init(value:unit:)(v198, v199, INFINITY);
          v201 = v218;
          Measurement<>.toVehicleFuelEfficiencyUnit(using:)(v238);
          v192 = Measurement<>.formattedString(maximumFractionDigits:)(1, v73);
          v193 = v202;
          v203 = *(void (**)(char *, uint64_t))(v74 + 8);
          v203(v201, v73);
          v203(v200, v73);
        }
        else
        {
          v204 = v219;
          Measurement<>.toVehicleFuelEfficiencyUnit(using:)(v238);
          v192 = Measurement<>.formattedString(maximumFractionDigits:)(1, v73);
          v193 = v205;
          (*(void (**)(char *, uint64_t))(v74 + 8))(v204, v73);
        }
      }
      v206 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v250._object = (void *)0xE000000000000000;
      v207._countAndFlagsBits = 0x4646455F4C455546;
      v207._object = (void *)0xEF59434E45494349;
      v208.value._countAndFlagsBits = 1885958740;
      v208.value._object = (void *)0xE400000000000000;
      v209._countAndFlagsBits = 0;
      v209._object = (void *)0xE000000000000000;
      v250._countAndFlagsBits = 0;
      v210 = NSLocalizedString(_:tableName:bundle:value:comment:)(v207, v208, (NSBundle)v206, v209, v250);

      if (qword_1000329C0 != -1)
        swift_once(&qword_1000329C0, sub_100018B44);
      v211 = qword_100035708;
      v212 = unk_100035710;
      v213 = type metadata accessor for CardCellConfiguration(0);
      swift_allocObject(v213, *(unsigned int *)(v213 + 48), *(unsigned __int16 *)(v213 + 52));
      swift_bridgeObjectRetain(v212);
      v214 = sub_10001474C(v192, v193, v210._countAndFlagsBits, (uint64_t)v210._object, v211, v212, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v216 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v215 = *(_QWORD *)((v244 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v216 >= v215 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v215 > 1, v216 + 1, 1);
      v217 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v216, v214);
      specialized Array._endMutation()(v217);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v222, v73);
    }
    return (_QWORD *)v244;
  }
  else
  {
    v46 = static os_log_type_t.error.getter();
    sub_1000191DC(v46, 0xD00000000000001CLL, 0x80000001000237B0, 0xD000000000000012, 0x80000001000237D0, 17);
    return _swiftEmptyArrayStorage;
  }
}

_QWORD *sub_1000092C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  os_log_type_t v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  Swift::String v32;
  Swift::String_optional v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  Swift::String v45;

  v0 = sub_1000064D4(&qword_100033098);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)CAFOdometerObservable.observed.getter(v2);
  v6 = objc_msgSend(v5, "car");

  if (!v6)
  {
    v18 = static os_log_type_t.error.getter();
    sub_1000191DC(v18, 0xD00000000000001CLL, 0x80000001000237B0, 0xD000000000000012, 0x80000001000237D0, 110);
    return _swiftEmptyArrayStorage;
  }
  v7 = (void *)CAFCar.dimesionObservable.getter();

  sub_100007E6C(0, (unint64_t *)&unk_1000330A0, NSObject_ptr);
  v42 = v7;
  v8 = (void *)dispatch thunk of CAFDimensionObservable.vehicleRangeUnit.getter();
  v9 = (void *)objc_opt_self(NSUnitLength);
  v10 = objc_msgSend(v9, "kilometers");
  v11 = static NSObject.== infix(_:_:)(v8, v10);

  v13 = (void *)CAFOdometerObservable.observed.getter(v12);
  v14 = v13;
  if ((v11 & 1) == 0)
  {
    v20 = objc_msgSend(v13, "distanceMilesInvalid");

    if (v20)
    {
      v43 = 2108717;
      v44 = 0xE300000000000000;
      v16 = objc_msgSend(v9, "miles");
      v17 = objc_msgSend(v16, "symbol");
      goto LABEL_8;
    }
    dispatch thunk of CAFOdometerObservable.distanceMiles.getter();
LABEL_11:
    v26 = Measurement<>.formattedString(maximumFractionDigits:)(1, v0);
    v27 = v28;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    goto LABEL_12;
  }
  v15 = objc_msgSend(v13, "distanceKMInvalid");

  if (!v15)
  {
    dispatch thunk of CAFOdometerObservable.distanceKM.getter();
    goto LABEL_11;
  }
  v43 = 2108717;
  v44 = 0xE300000000000000;
  v16 = objc_msgSend(v9, "kilometers");
  v17 = objc_msgSend(v16, "symbol");
LABEL_8:
  v21 = v17;

  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;

  v25._countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(v24);
  v26 = v43;
  v27 = v44;
LABEL_12:
  v29 = sub_1000064D4(&qword_100032A98);
  v30 = swift_allocObject(v29, 40, 7);
  *(_OWORD *)(v30 + 16) = xmmword_1000225E0;
  v31 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v45._object = (void *)0xE000000000000000;
  v32._countAndFlagsBits = 0x524554454D4F444FLL;
  v32._object = (void *)0xE800000000000000;
  v33.value._countAndFlagsBits = 1885958740;
  v33.value._object = (void *)0xE400000000000000;
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, v33, (NSBundle)v31, v34, v45);

  if (qword_1000329C8 != -1)
    swift_once(&qword_1000329C8, sub_100018B74);
  v36 = qword_100035718;
  v37 = unk_100035720;
  v38 = type metadata accessor for CardCellConfiguration(0);
  swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
  swift_bridgeObjectRetain(v37);
  v39 = sub_10001474C(v26, v27, v35._countAndFlagsBits, (uint64_t)v35._object, v36, v37, 1);
  *(_QWORD *)(v30 + 32) = v39;
  v43 = v30;
  specialized Array._endMutation()(v39);
  v19 = v43;

  return (_QWORD *)v19;
}

_QWORD *sub_1000096A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  double v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  Swift::String v36;
  Swift::String_optional v37;
  Swift::String v38;
  Swift::String v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  unint64_t v46;
  Swift::String v47;

  v0 = sub_1000064D4(&qword_1000330B0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v45 - v6;
  v8 = (void *)CAFFuelConsumptionObservable.observed.getter(v5);
  v9 = objc_msgSend(v8, "car");

  if (v9)
  {
    v10 = (void *)CAFCar.dimesionObservable.getter();

    v12 = (void *)CAFFuelConsumptionObservable.observed.getter(v11);
    v13 = objc_msgSend(v12, "fuelEfficiencyInvalid");

    if (v13)
    {
      v45 = 2108717;
      v46 = 0xE300000000000000;
      v14 = (void *)dispatch thunk of CAFDimensionObservable.vehicleFuelEfficiencyUnit.getter();
      v15 = objc_msgSend(v14, "symbol");

      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      v19._countAndFlagsBits = v16;
      v19._object = v18;
      String.append(_:)(v19);
      swift_bridgeObjectRelease(v18);
      v20 = v45;
      v21 = v46;
    }
    else
    {
      dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter();
      v24 = Measurement.value.getter(v0);
      v25 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
      v26 = v25(v7, v0);
      v27 = (void *)CAFFuelConsumptionObservable.observed.getter(v26);
      v28 = objc_msgSend(v27, "fuelEfficiencyRange");

      LODWORD(v27) = objc_msgSend(v28, "maximumValue");
      if (v24 == (double)v27)
      {
        v29 = objc_msgSend((id)objc_opt_self(NSUnitFuelEfficiency), "millilitersPer100Kilometers");
        v30 = sub_100007E6C(0, &qword_1000330B8, NSUnitFuelEfficiency_ptr);
        Measurement.init(value:unit:)(v29, v30, INFINITY);
        Measurement<>.toVehicleFuelEfficiencyUnit(using:)(v10);
        v20 = Measurement<>.formattedString(maximumFractionDigits:)(1, v0);
        v21 = v31;
        v25(v4, v0);
      }
      else
      {
        dispatch thunk of CAFFuelConsumptionObservable.fuelEfficiency.getter();
        Measurement<>.toVehicleFuelEfficiencyUnit(using:)(v10);
        v25(v4, v0);
        v20 = Measurement<>.formattedString(maximumFractionDigits:)(1, v0);
        v21 = v32;
      }
      v25(v7, v0);
    }
    v33 = sub_1000064D4(&qword_100032A98);
    v34 = swift_allocObject(v33, 40, 7);
    *(_OWORD *)(v34 + 16) = xmmword_1000225E0;
    v35 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v47._object = (void *)0xE000000000000000;
    v36._countAndFlagsBits = 0x4646455F4C455546;
    v36._object = (void *)0xEF59434E45494349;
    v37.value._countAndFlagsBits = 1885958740;
    v37.value._object = (void *)0xE400000000000000;
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    v47._countAndFlagsBits = 0;
    v39 = NSLocalizedString(_:tableName:bundle:value:comment:)(v36, v37, (NSBundle)v35, v38, v47);

    if (qword_1000329C0 != -1)
      swift_once(&qword_1000329C0, sub_100018B44);
    v40 = qword_100035708;
    v41 = unk_100035710;
    v42 = type metadata accessor for CardCellConfiguration(0);
    swift_allocObject(v42, *(unsigned int *)(v42 + 48), *(unsigned __int16 *)(v42 + 52));
    swift_bridgeObjectRetain(v41);
    v43 = sub_10001474C(v20, v21, v39._countAndFlagsBits, (uint64_t)v39._object, v40, v41, 0);
    *(_QWORD *)(v34 + 32) = v43;
    v45 = v34;
    specialized Array._endMutation()(v43);
    v23 = v45;

  }
  else
  {
    v22 = static os_log_type_t.error.getter();
    sub_1000191DC(v22, 0xD00000000000001CLL, 0x80000001000237B0, 0xD000000000000012, 0x80000001000237D0, 141);
    return _swiftEmptyArrayStorage;
  }
  return (_QWORD *)v23;
}

uint64_t sub_100009ADC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022688);
  v2 = swift_getKeyPath(&unk_1000226B0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

id sub_100009B4C(void *a1)
{
  _BYTE *v1;
  char *v3;
  os_log_type_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD aBlock[5];
  uint64_t v20;
  objc_super v21;
  _QWORD *v22;

  *(_QWORD *)&v1[OBJC_IVAR____TtC4Trip9TripModel_tripComputer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC4Trip9TripModel_odometer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption] = 0;
  v1[OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost] = 0;
  v3 = v1;
  v4 = static os_log_type_t.info.getter(v3);
  sub_1000191DC(v4, 0xD000000000000018, 0x8000000100023DF0, 0xD000000000000014, 0x8000000100023E10, 172);
  v5 = &v3[OBJC_IVAR____TtC4Trip9TripModel__carObservable];
  swift_beginAccess(&v3[OBJC_IVAR____TtC4Trip9TripModel__carObservable], aBlock, 33, 0);
  type metadata accessor for CAFCarObservable(0);
  sub_10000D5E4();
  v6 = a1;
  *(_QWORD *)v5 = ObservedObject.init(wrappedValue:)();
  *((_QWORD *)v5 + 1) = v7;
  swift_endAccess(aBlock);
  swift_beginAccess(&v3[OBJC_IVAR____TtC4Trip9TripModel__cardmodels], aBlock, 33, 0);
  v22 = _swiftEmptyArrayStorage;
  v8 = sub_1000064D4(&qword_100033090);
  Published.init(initialValue:)(&v22, v8);
  swift_endAccess(aBlock);

  v9 = (objc_class *)type metadata accessor for TripModel(0);
  v21.receiver = v3;
  v21.super_class = v9;
  v10 = objc_msgSendSuper2(&v21, "init");
  v11 = (void *)CAFCarObservable.observed.getter();
  objc_msgSend(v11, "registerObserver:", v10);

  sub_10000A900();
  v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_1000329E8 != -1)
    swift_once(&qword_1000329E8, sub_100020480);
  v13 = static NSNotificationName.ClusterEvent;
  v14 = objc_msgSend((id)objc_opt_self(NSOperationQueue), "mainQueue");
  v15 = swift_allocObject(&unk_10002D318, 24, 7);
  swift_unknownObjectWeakInit(v15 + 16, v10);
  aBlock[4] = sub_10000D650;
  v20 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009F8C;
  aBlock[3] = &unk_10002D330;
  v16 = _Block_copy(aBlock);
  swift_release(v20);
  v17 = objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v13, 0, v14, v16);

  _Block_release(v16);
  swift_unknownObjectRelease(v17);

  return v10;
}

void sub_100009E28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  _OWORD v12[2];
  _BYTE v13[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = Notification.userInfo.getter();
    if (v5)
    {
      v6 = v5;
      strcpy((char *)&v9, "ClusterEvent");
      BYTE13(v9) = 0;
      HIWORD(v9) = -5120;
      AnyHashable.init<A>(_:)(v11, &v9, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v6 + 16) && (v7 = sub_100020AB4((uint64_t)v11), (v8 & 1) != 0))
      {
        sub_10000D6D8(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v9);
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
      }
      swift_bridgeObjectRelease(v6);
      sub_10000D658((uint64_t)v11);
      if (*((_QWORD *)&v10 + 1))
      {
        sub_10000D6C8(&v9, v12);
        sub_10000D6D8((uint64_t)v12, (uint64_t)v11);
        if ((swift_dynamicCast(&v9, v11, (char *)&type metadata for Any + 8, &type metadata for ClusterEventType, 6) & 1) != 0)
        {
          if ((v9 & 1) != 0)
            sub_10000B6C4();
          else
            sub_10000B400();
        }

        sub_10000D714(v12);
      }
      else
      {

        sub_10000D68C((uint64_t)&v9, &qword_100033168);
      }
    }
    else
    {

    }
  }
}

uint64_t sub_100009F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_10000A030()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  objc_super v6;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_1000329E8 != -1)
    swift_once(&qword_1000329E8, sub_100020480);
  static String._unconditionallyBridgeFromObjectiveC(_:)(static NSNotificationName.ClusterEvent);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "removeObserver:", v4);

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for TripModel(0);
  return objc_msgSendSuper2(&v6, "dealloc");
}

uint64_t sub_10000A26C()
{
  return type metadata accessor for TripModel(0);
}

uint64_t type metadata accessor for TripModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100033078;
  if (!qword_100033078)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TripModel);
  return result;
}

_QWORD *sub_10000A2B0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  _QWORD *v17;

  KeyPath = swift_getKeyPath(&unk_100022688);
  v2 = swift_getKeyPath(&unk_1000226B0);
  static Published.subscript.getter(&v17, v0, KeyPath, v2);
  swift_release(KeyPath);
  result = (_QWORD *)swift_release(v2);
  v4 = (uint64_t)v17;
  v17 = &_swiftEmptyArrayStorage;
  if (!((unint64_t)v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_23:
    swift_bridgeObjectRelease(v4);
    return &_swiftEmptyArrayStorage;
  }
  if (v4 < 0)
    v15 = v4;
  else
    v15 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  v5 = _CocoaArrayWrapper.endIndex.getter(v15);
  result = (_QWORD *)swift_bridgeObjectRelease(v4);
  if (!v5)
    goto LABEL_23;
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v4);
      }
      else
      {
        v9 = *(_QWORD *)(v4 + 8 * i + 32);
        swift_retain(v9);
      }
      v10 = swift_getKeyPath(&unk_100022718);
      v11 = swift_getKeyPath(&unk_100022740);
      static Published.subscript.getter(&v16, v9, v10, v11);
      swift_release(v10);
      swift_release(v11);
      v12 = v16;
      if ((unint64_t)v16 >> 62)
      {
        if (v16 < 0)
          v14 = v16;
        else
          v14 = v16 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v16);
        v13 = _CocoaArrayWrapper.endIndex.getter(v14);
        swift_bridgeObjectRelease(v12);
      }
      else
      {
        v13 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v12);
      if (v13)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v7 = v17[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
        v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v9);
        specialized ContiguousArray._endMutation()(v8);
      }
      else
      {
        swift_release(v9);
      }
    }
    swift_bridgeObjectRelease(v4);
    return v17;
  }
  return result;
}

uint64_t sub_10000A900()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  Swift::String v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  Swift::String v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  os_log_type_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  os_log_type_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v50[3];
  uint64_t v51;
  unint64_t v52;

  v1 = v0;
  v50[0] = 0;
  v50[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(99);
  v51 = 0;
  v52 = 0xE000000000000000;
  v2._countAndFlagsBits = 0x646F4D706972545BLL;
  v2._object = (void *)0xEC000000205D6C65;
  String.append(_:)(v2);
  v3 = OBJC_IVAR____TtC4Trip9TripModel_tripComputer;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip9TripModel_tripComputer);
  if (v4)
    v5 = 0x612065766168;
  else
    v5 = 28526;
  if (v4)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE200000000000000;
  v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 0x6D6F437069727420;
  v8._object = (void *)0xEF202C7265747570;
  String.append(_:)(v8);
  v9 = OBJC_IVAR____TtC4Trip9TripModel_consumption;
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip9TripModel_consumption);
  if (v10)
    v11 = 0x612065766168;
  else
    v11 = 28526;
  if (v10)
    v12 = 0xE600000000000000;
  else
    v12 = 0xE200000000000000;
  v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease(v12);
  v14._countAndFlagsBits = 0x706D75736E6F6320;
  v14._object = (void *)0xEF20202E6E6F6974;
  String.append(_:)(v14);
  v15 = v0 + OBJC_IVAR____TtC4Trip9TripModel__carObservable;
  swift_beginAccess(v0 + OBJC_IVAR____TtC4Trip9TripModel__carObservable, v50, 0, 0);
  v16 = *(id *)(v15 + 8);
  v17 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v17)
    v18 = 0x612065766168;
  else
    v18 = 28526;
  if (v17)
    v19 = 0xE600000000000000;
  else
    v19 = 0xE200000000000000;
  v20 = v19;
  String.append(_:)(*(Swift::String *)&v18);
  swift_bridgeObjectRelease(v19);
  v21._countAndFlagsBits = 0xD00000000000001DLL;
  v21._object = (void *)0x8000000100023AF0;
  String.append(_:)(v21);
  v22 = *(id *)(v15 + 8);
  v23 = (void *)dispatch thunk of CAFCarObservable.fuel.getter();

  if (v23)
    v24 = 0x612065766168;
  else
    v24 = 28526;
  if (v23)
    v25 = 0xE600000000000000;
  else
    v25 = 0xE200000000000000;
  v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease(v25);
  v27._countAndFlagsBits = 0xD000000000000014;
  v27._object = (void *)0x8000000100023B10;
  String.append(_:)(v27);
  v28 = v51;
  v29 = v52;
  v31 = static os_log_type_t.info.getter(v30);
  sub_1000191DC(v31, v28, v29, 0xD000000000000011, 0x8000000100023B30, 241);
  swift_bridgeObjectRelease(v29);
  if (!*(_QWORD *)(v1 + v3))
  {
    v32 = *(id *)(v15 + 8);
    v33 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

    if (v33)
    {
      v35 = static os_log_type_t.info.getter(v34);
      sub_1000191DC(v35, 0xD000000000000033, 0x8000000100023B80, 0xD000000000000011, 0x8000000100023B30, 244);
      v36 = *(void **)(v1 + v3);
      *(_QWORD *)(v1 + v3) = v33;
      v37 = v33;

      objc_msgSend(v37, "registerObserver:", v1);
      v38 = objc_msgSend(v37, "odometer");
      v39 = *(void **)(v1 + OBJC_IVAR____TtC4Trip9TripModel_odometer);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC4Trip9TripModel_odometer) = v38;

      v40 = objc_msgSend(v37, "odometer");
      objc_msgSend(v40, "registerObserver:", v1);

    }
  }
  if (!*(_QWORD *)(v1 + v9))
  {
    v41 = *(id *)(v15 + 8);
    v42 = (void *)dispatch thunk of CAFCarObservable.fuel.getter();

    if (v42)
    {
      v44 = static os_log_type_t.info.getter(v43);
      sub_1000191DC(v44, 0xD00000000000002DLL, 0x8000000100023B50, 0xD000000000000011, 0x8000000100023B30, 255);
      v45 = objc_msgSend(v42, "fuelConsumption");
      v46 = *(void **)(v1 + v9);
      *(_QWORD *)(v1 + v9) = v45;

      v47 = *(void **)(v1 + v9);
      if (v47)
      {
        v48 = v47;
        objc_msgSend(v48, "registerObserver:", v1);

      }
    }
  }
  return sub_10000ACD8();
}

uint64_t sub_10000ACD8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  void *object;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  _QWORD *v26;
  void *v27;
  id v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  Swift::String v44;
  void *v45;
  Swift::String v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  uint64_t KeyPath;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;

  v1 = v0;
  _StringGuts.grow(_:)(36);
  swift_bridgeObjectRelease(0xE000000000000000);
  v60 = 0xD000000000000013;
  v61 = 0x80000001000239D0;
  v2 = OBJC_IVAR____TtC4Trip9TripModel_tripComputer;
  v3 = *(void **)&v0[OBJC_IVAR____TtC4Trip9TripModel_tripComputer];
  if (v3)
  {
    v4 = objc_msgSend(v3, "trips");
    if (v4)
    {
      v5 = v4;
      v6 = sub_100007E6C(0, &qword_100033138, CAFTrip_ptr);
      v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

      if ((unint64_t)v7 >> 62)
      {
        if (v7 < 0)
          v55 = v7;
        else
          v55 = v7 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v7);
        _CocoaArrayWrapper.endIndex.getter(v55);
        swift_bridgeObjectRelease(v7);
      }
      swift_bridgeObjectRelease(v7);
    }
  }
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(object);
  v10._countAndFlagsBits = 0x706D75736E6F6320;
  v10._object = (void *)0xED00003D6E6F6974;
  String.append(_:)(v10);
  v11 = OBJC_IVAR____TtC4Trip9TripModel_consumption;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption])
    v12 = 5457241;
  else
    v12 = 20302;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC4Trip9TripModel_consumption])
    v13 = 0xE300000000000000;
  else
    v13 = 0xE200000000000000;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  v15 = swift_bridgeObjectRelease(v13);
  v16 = static os_log_type_t.info.getter(v15);
  sub_1000191DC(v16, v60, v61, 0xD000000000000011, 0x80000001000239F0, 265);
  swift_bridgeObjectRelease(v61);
  v59 = (uint64_t)_swiftEmptyArrayStorage;
  v17 = *(void **)&v1[v2];
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v18, "trips");
    if (v19)
    {
      v20 = v19;
      v21 = sub_100007E6C(0, &qword_100033138, CAFTrip_ptr);
      v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);

      if ((unint64_t)v22 >> 62)
      {
        if (v22 < 0)
          v56 = v22;
        else
          v56 = v22 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v22);
        v57 = _CocoaArrayWrapper.endIndex.getter(v56);
        swift_bridgeObjectRelease(v22);
        if (v57)
        {
          v58 = swift_bridgeObjectRetain(v22);
          v23 = (uint64_t)sub_10000C49C(v58);
          swift_bridgeObjectRelease(v22);
LABEL_16:
          v60 = v23;
          sub_10000C590(&v60);
          swift_bridgeObjectRelease(v22);
          v24 = v60;
          v25 = v18;
          v26 = sub_10000D3A0(v24, v25);
          swift_release(v24);

          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          v59 = (uint64_t)v26;
          v27 = *(void **)&v1[v11];
          if (!v27)
            goto LABEL_26;
          goto LABEL_20;
        }
      }
      else
      {
        v23 = v22 & 0xFFFFFFFFFFFFFF8;
        if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          swift_bridgeObjectRetain(v22);
          goto LABEL_16;
        }
      }

      swift_bridgeObjectRelease(v22);
      v27 = *(void **)&v1[v11];
      if (!v27)
        goto LABEL_26;
      goto LABEL_20;
    }

  }
  v27 = *(void **)&v1[v11];
  if (!v27)
    goto LABEL_26;
LABEL_20:
  v28 = v27;
  v29 = static os_log_type_t.debug.getter(v28);
  sub_1000191DC(v29, 0xD000000000000029, 0x8000000100023A10, 0xD000000000000011, 0x80000001000239F0, 279);
  v30 = sub_100007E6C(0, &qword_100033118, CAFFuelConsumption_ptr);
  v31 = sub_100007EA4(&qword_100033120, &qword_100033118, CAFFuelConsumption_ptr, (uint64_t)&protocol conformance descriptor for CAFFuelConsumption);
  v32 = (void *)CAFObserved<>.observable.getter(v30, v31);
  v33 = *(void **)&v1[OBJC_IVAR____TtC4Trip9TripModel_odometer];
  if (v33)
  {
    v34 = sub_100007E6C(0, &qword_100033128, CAFOdometer_ptr);
    v35 = sub_100007EA4(&qword_100033130, &qword_100033128, CAFOdometer_ptr, (uint64_t)&protocol conformance descriptor for CAFOdometer);
    v36 = v33;
    v37 = (void *)CAFObserved<>.observable.getter(v34, v35);

  }
  else
  {
    v37 = 0;
  }
  v38 = type metadata accessor for InfoCard(0);
  swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
  v39 = sub_1000154FC(v32, v37, 1, 0);
  v40 = swift_retain(v39);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v40);
  v42 = *(_QWORD *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v41 = *(_QWORD *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v42 >= v41 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v41 > 1, v42 + 1, 1);
  v43 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v42, v39);
  specialized Array._endMutation()(v43);

  swift_release(v39);
LABEL_26:
  v60 = 0;
  v61 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease(v61);
  v60 = 0x75205D706972545BLL;
  v61 = 0xEF20646574616470;
  if ((unint64_t)v59 >> 62)
  {
    if (v59 < 0)
      v54 = v59;
    else
      v54 = v59 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v59);
    _CocoaArrayWrapper.endIndex.getter(v54);
    swift_bridgeObjectRelease(v59);
  }
  v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v45 = v44._object;
  String.append(_:)(v44);
  swift_bridgeObjectRelease(v45);
  v46._countAndFlagsBits = 0x2E736472616320;
  v46._object = (void *)0xE700000000000000;
  String.append(_:)(v46);
  v47 = v60;
  v48 = v61;
  v50 = static os_log_type_t.info.getter(v49);
  sub_1000191DC(v50, v47, v48, 0xD000000000000011, 0x80000001000239F0, 284);
  swift_bridgeObjectRelease(v48);
  KeyPath = swift_getKeyPath(&unk_100022688);
  v52 = swift_getKeyPath(&unk_1000226B0);
  v60 = v59;
  return static Published.subscript.setter(&v60, v1, KeyPath, v52);
}

void sub_10000B2EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  _BYTE v10[24];

  v2 = OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC4Trip9TripModel_hasEmittedFinalizedSignpost) & 1) == 0)
  {
    v3 = v1;
    v4 = *(void **)(v1 + OBJC_IVAR____TtC4Trip9TripModel_tripComputer);
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v5, "receivedAllValues"))
      {
        v6 = v1 + OBJC_IVAR____TtC4Trip9TripModel__carObservable;
        swift_beginAccess(v3 + OBJC_IVAR____TtC4Trip9TripModel__carObservable, v10, 0, 0);
        v7 = *(id *)(v6 + 8);
        v8 = (void *)CAFCarObservable.observed.getter();

        CAFSignpostEmit_Finalized(v8);
        *(_BYTE *)(v3 + v2) = 1;
        return;
      }

    }
    v9 = static os_log_type_t.info.getter(a1);
    sub_1000191DC(v9, 0xD000000000000024, 0x8000000100023980, 0xD000000000000017, 0x80000001000239B0, 295);
  }
}

uint64_t sub_10000B400()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
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
  Swift::String v17;
  void *object;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  KeyPath = swift_getKeyPath(&unk_100022688);
  v2 = swift_getKeyPath(&unk_1000226B0);
  static Published.subscript.getter(&v26, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v26;
  if ((unint64_t)v26 >> 62)
  {
    if (v26 < 0)
      v23 = v26;
    else
      v23 = v26 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v26);
    v4 = _CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = swift_bridgeObjectRelease(v3);
  if (v4)
  {
    if (qword_1000329D0 != -1)
      swift_once(&qword_1000329D0, sub_10001FB74);
    v6 = qword_100035728;
    v7 = swift_getKeyPath(&unk_1000226D0);
    v8 = swift_getKeyPath(&unk_1000226F8);
    static Published.subscript.getter(&v26, v6, v7, v8);
    swift_release(v7);
    swift_release(v8);
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      v6 = (uint64_t)sub_10000A2B0();
      if (!((unint64_t)v6 >> 62))
      {
        v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_9:
        swift_bridgeObjectRelease(v6);
        v11 = qword_100035728;
        v12 = swift_getKeyPath(&unk_1000226D0);
        v13 = swift_getKeyPath(&unk_1000226F8);
        if (v9 >= v10)
          v26 = 0;
        else
          v26 = v9;
        swift_retain(v11);
        static Published.subscript.setter(&v26, v11, v12, v13);
        v26 = 0;
        v27 = 0xE000000000000000;
        _StringGuts.grow(_:)(21);
        swift_bridgeObjectRelease(v27);
        v26 = 0xD000000000000013;
        v27 = 0x8000000100023960;
        v14 = qword_100035728;
        v15 = swift_getKeyPath(&unk_1000226D0);
        v16 = swift_getKeyPath(&unk_1000226F8);
        static Published.subscript.getter(&v25, v14, v15, v16);
        swift_release(v15);
        swift_release(v16);
        v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
        object = v17._object;
        String.append(_:)(v17);
        v19 = swift_bridgeObjectRelease(object);
        v20 = v26;
        v21 = v27;
        v22 = static os_log_type_t.info.getter(v19);
        sub_1000191DC(v22, v20, v21, 0x7478654E776F6873, 0xEE00292864726143, 327);
        return swift_bridgeObjectRelease(v21);
      }
    }
    if (v6 < 0)
      v24 = v6;
    else
      v24 = v6 & 0xFFFFFFFFFFFFFF8;
    v10 = _CocoaArrayWrapper.endIndex.getter(v24);
    goto LABEL_9;
  }
  return result;
}

void sub_10000B6C4()
{
  uint64_t v0;
  uint64_t KeyPath;
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
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  void *object;
  uint64_t v34;
  __int128 v35;
  os_log_type_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  Swift::String v52;
  Swift::String v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  Swift::String v57;
  void *v58;
  Swift::String v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  os_log_type_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  Swift::String v71;
  Swift::String v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  Swift::String v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 aBlock;
  void (*v82)(uint64_t, void *);
  void *v83;
  uint64_t (*v84)(uint64_t);
  uint64_t v85;
  uint64_t v86;

  KeyPath = swift_getKeyPath(&unk_100022688);
  v2 = swift_getKeyPath(&unk_1000226B0);
  static Published.subscript.getter(&aBlock, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = aBlock;
  if ((unint64_t)aBlock >> 62)
  {
    if ((uint64_t)aBlock < 0)
      v80 = aBlock;
    else
      v80 = aBlock & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(aBlock);
    v4 = _CocoaArrayWrapper.endIndex.getter(v80);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v3);
  if (v4)
  {
    if (qword_1000329D0 != -1)
      swift_once(&qword_1000329D0, sub_10001FB74);
    v5 = qword_100035728;
    v6 = swift_getKeyPath(&unk_1000226D0);
    v7 = swift_getKeyPath(&unk_1000226F8);
    static Published.subscript.getter(&aBlock, v5, v6, v7);
    swift_release(v6);
    swift_release(v7);
    v8 = aBlock;
    v9 = (uint64_t)sub_10000A2B0();
    v10 = v9;
    if ((unint64_t)v9 >> 62)
    {
      if (v9 >= 0)
        v9 &= 0xFFFFFFFFFFFFFF8uLL;
      v11 = _CocoaArrayWrapper.endIndex.getter(v9);
    }
    else
    {
      v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v10);
    if (v8 < v11)
    {
      v12 = sub_10000A2B0();
      swift_bridgeObjectRelease(v12);
      if ((v8 & 0x8000000000000000) == 0)
      {
        v13 = (unint64_t)sub_10000A2B0();
        v14 = v13;
        if ((v13 & 0xC000000000000001) != 0)
        {
          v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v13);
        }
        else
        {
          if ((unint64_t)v8 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          v15 = *(_QWORD *)(v13 + 8 * v8 + 32);
          swift_retain(v15);
        }
        swift_bridgeObjectRelease(v14);
        v16 = type metadata accessor for TripCard(0);
        v17 = swift_dynamicCastClass(v15, v16);
        if (v17)
        {
          v18 = *(void **)(v17 + OBJC_IVAR____TtC4Trip8TripCard_trip);
          swift_retain(v15);
          v19 = v18;
          v20 = (void *)CAFTripObservable.observed.getter(v19);
          v21 = objc_msgSend(v20, "hasReset");

          if (v21)
          {
            *(_QWORD *)&aBlock = 0;
            *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(28);
            swift_bridgeObjectRelease(*((_QWORD *)&aBlock + 1));
            strcpy((char *)&aBlock, "reseting trip ");
            HIBYTE(aBlock) = -18;
            v23 = objc_msgSend(v19, "description");
            v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
            v26 = v25;

            v27._countAndFlagsBits = v24;
            v27._object = v26;
            String.append(_:)(v27);
            swift_bridgeObjectRelease(v26);
            v28._countAndFlagsBits = 0x65646E6920746120;
            v28._object = (void *)0xEA00000000002078;
            String.append(_:)(v28);
            v29 = qword_100035728;
            v30 = swift_getKeyPath(&unk_1000226D0);
            v31 = swift_getKeyPath(&unk_1000226F8);
            static Published.subscript.getter(&v86, v29, v30, v31);
            swift_release(v30);
            swift_release(v31);
            v32._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
            object = v32._object;
            String.append(_:)(v32);
            v34 = swift_bridgeObjectRelease(object);
            v35 = aBlock;
            v36 = static os_log_type_t.info.getter(v34);
            sub_1000191DC(v36, v35, *((unint64_t *)&v35 + 1), 0xD000000000000013, 0x80000001000238E0, 347);
            v37 = swift_bridgeObjectRelease(*((_QWORD *)&v35 + 1));
            v38 = (void *)CAFTripObservable.observed.getter(v37);
            v39 = swift_allocObject(&unk_10002D2C8, 24, 7);
            *(_QWORD *)(v39 + 16) = v19;
            v84 = sub_10000D380;
            v85 = v39;
            *(_QWORD *)&aBlock = _NSConcreteStackBlock;
            *((_QWORD *)&aBlock + 1) = 1107296256;
            v82 = sub_10000C208;
            v83 = &unk_10002D2E0;
            v40 = _Block_copy(&aBlock);
            v41 = v85;
            v42 = v19;
            swift_release(v41);
            objc_msgSend(v38, "resetWithCompletion:", v40);

            swift_release_n(v15, 2);
            _Block_release(v40);

          }
          else
          {
            v43 = (void *)CAFTripObservable.observed.getter(v22);
            v44 = objc_msgSend(v43, "hasTripReset");

            if (v44
              && (v46 = (void *)CAFTripObservable.observed.getter(v45),
                  v47 = objc_msgSend(v46, "tripReset"),
                  v46,
                  (v47 & 1) == 0))
            {
              dispatch thunk of CAFTripObservable.tripReset.setter(1);
              *(_QWORD *)&aBlock = 0;
              *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
              _StringGuts.grow(_:)(43);
              swift_bridgeObjectRelease(*((_QWORD *)&aBlock + 1));
              strcpy((char *)&aBlock, "reseting trip ");
              HIBYTE(aBlock) = -18;
              v67 = objc_msgSend(v19, "description");
              v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v67);
              v70 = v69;

              v71._countAndFlagsBits = v68;
              v71._object = v70;
              String.append(_:)(v71);
              swift_bridgeObjectRelease(v70);
              v72._countAndFlagsBits = 0xD000000000000019;
              v72._object = (void *)0x8000000100023900;
              String.append(_:)(v72);
              v73 = qword_100035728;
              v74 = swift_getKeyPath(&unk_1000226D0);
              v75 = swift_getKeyPath(&unk_1000226F8);
              static Published.subscript.getter(&v86, v73, v74, v75);
              swift_release(v74);
              swift_release(v75);
              v76._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
              v77 = v76._object;
              String.append(_:)(v76);
              v78 = swift_bridgeObjectRelease(v77);
              v61 = *((_QWORD *)&aBlock + 1);
              v79 = aBlock;
              v63 = static os_log_type_t.info.getter(v78);
              v64 = v79;
              v65 = v61;
              v66 = 357;
            }
            else
            {
              *(_QWORD *)&aBlock = 0;
              *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
              _StringGuts.grow(_:)(45);
              swift_bridgeObjectRelease(*((_QWORD *)&aBlock + 1));
              strcpy((char *)&aBlock, "reseting trip ");
              HIBYTE(aBlock) = -18;
              v48 = objc_msgSend(v19, "description");
              v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
              v51 = v50;

              v52._countAndFlagsBits = v49;
              v52._object = v51;
              String.append(_:)(v52);
              swift_bridgeObjectRelease(v51);
              v53._countAndFlagsBits = 0x65646E6920746120;
              v53._object = (void *)0xEA00000000002078;
              String.append(_:)(v53);
              v54 = qword_100035728;
              v55 = swift_getKeyPath(&unk_1000226D0);
              v56 = swift_getKeyPath(&unk_1000226F8);
              static Published.subscript.getter(&v86, v54, v55, v56);
              swift_release(v55);
              swift_release(v56);
              v57._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
              v58 = v57._object;
              String.append(_:)(v57);
              swift_bridgeObjectRelease(v58);
              v59._countAndFlagsBits = 0xD000000000000011;
              v59._object = (void *)0x80000001000238C0;
              String.append(_:)(v59);
              v61 = *((_QWORD *)&aBlock + 1);
              v60 = aBlock;
              v63 = static os_log_type_t.error.getter(v62);
              v64 = v60;
              v65 = v61;
              v66 = 359;
            }
            sub_1000191DC(v63, v64, v65, 0xD000000000000013, 0x80000001000238E0, v66);
            swift_bridgeObjectRelease(v61);

            swift_release_n(v15, 2);
          }
        }
        else
        {
          swift_release(v15);
        }
      }
    }
  }
}

uint64_t sub_10000BE3C(uint64_t a1, void *a2)
{
  Swift::String v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  Swift::String v14;
  void *object;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  void *v33;
  Swift::String v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint64_t v39;
  _QWORD v40[2];

  if (a1)
  {
    v40[0] = 0;
    v40[1] = 0xE000000000000000;
    swift_errorRetain();
    _StringGuts.grow(_:)(50);
    v4._countAndFlagsBits = 0x676E697465736572;
    v4._object = (void *)0xEE00207069727420;
    String.append(_:)(v4);
    v5 = objc_msgSend(a2, "description");
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;

    v9._countAndFlagsBits = v6;
    v9._object = v8;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v8);
    v10._countAndFlagsBits = 0x65646E6920746120;
    v10._object = (void *)0xEA00000000002078;
    String.append(_:)(v10);
    if (qword_1000329D0 != -1)
      swift_once(&qword_1000329D0, sub_10001FB74);
    v11 = qword_100035728;
    KeyPath = swift_getKeyPath(&unk_1000226D0);
    v13 = swift_getKeyPath(&unk_1000226F8);
    static Published.subscript.getter(&v39, v11, KeyPath, v13);
    swift_release(KeyPath);
    swift_release(v13);
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    object = v14._object;
    String.append(_:)(v14);
    swift_bridgeObjectRelease(object);
    v16._countAndFlagsBits = 0xD000000000000014;
    v16._object = (void *)0x8000000100023940;
    String.append(_:)(v16);
    v39 = a1;
    v17 = sub_1000064D4(&qword_100033110);
    v18 = _print_unlocked<A, B>(_:_:)(&v39, v40, v17, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v19 = v40[0];
    v20 = v40[1];
    v21 = static os_log_type_t.error.getter(v18);
    sub_1000191DC(v21, v19, v20, 0xD000000000000013, 0x80000001000238E0, 350);
    swift_bridgeObjectRelease(v20);
    return swift_errorRelease(a1);
  }
  else
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease(0xE000000000000000);
    strcpy((char *)v40, "reseting trip ");
    HIBYTE(v40[1]) = -18;
    v23 = objc_msgSend(a2, "description");
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
    v26 = v25;

    v27._countAndFlagsBits = v24;
    v27._object = v26;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(v26);
    v28._countAndFlagsBits = 0x65646E6920746120;
    v28._object = (void *)0xEA00000000002078;
    String.append(_:)(v28);
    if (qword_1000329D0 != -1)
      swift_once(&qword_1000329D0, sub_10001FB74);
    v29 = qword_100035728;
    v30 = swift_getKeyPath(&unk_1000226D0);
    v31 = swift_getKeyPath(&unk_1000226F8);
    static Published.subscript.getter(&v39, v29, v30, v31);
    swift_release(v30);
    swift_release(v31);
    v32._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v33 = v32._object;
    String.append(_:)(v32);
    swift_bridgeObjectRelease(v33);
    v34._countAndFlagsBits = 0x6465656363757320;
    v34._object = (void *)0xEA00000000006465;
    String.append(_:)(v34);
    v35 = v40[0];
    v36 = v40[1];
    v38 = static os_log_type_t.info.getter(v37);
    sub_1000191DC(v38, v35, v36, 0xD000000000000013, 0x80000001000238E0, 352);
    return swift_bridgeObjectRelease(v36);
  }
}

void sub_10000C208(uint64_t a1, void *a2)
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

void sub_10000C288(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = &unk_100022608;
  sub_10000C318(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_100022620;
    v4[3] = &unk_100022620;
    v4[4] = &unk_100022620;
    v4[5] = &unk_100022638;
    swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
  }
}

void sub_10000C318(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100033088)
  {
    v2 = sub_100007234(&qword_100033090);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100033088);
  }
}

uint64_t sub_10000C370@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for TripModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000C3AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022688);
  v5 = swift_getKeyPath(&unk_1000226B0);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000C428(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022688);
  v5 = swift_getKeyPath(&unk_1000226B0);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

_QWORD *sub_10000C49C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return &_swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = &_swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_1000064D4(&qword_100032A98);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_100016818((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_10000C590(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_10000D338(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_10000C608(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

void sub_10000C608(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  void *v14;
  id v15;
  id v16;
  unsigned int v17;
  id *v18;
  void *v19;
  id v20;
  id v21;
  unsigned int v22;
  uint64_t *v23;
  Swift::Int v24;
  Swift::Int v25;
  uint64_t *v26;
  uint64_t v27;
  Swift::Int v28;
  uint64_t v29;
  void *v30;
  Swift::Int v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  Swift::Int v105;
  unsigned int v106;
  Swift::Int v107;
  Swift::Int v108;
  Swift::Int v109;
  Swift::Int v110;
  void **v111;
  uint64_t v112;

  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_10000CD78(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_140;
  v105 = v4;
  v100 = a1;
  if (v3 < 2)
  {
    v9 = (char *)&_swiftEmptyArrayStorage;
    v112 = (uint64_t)&_swiftEmptyArrayStorage;
    v111 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v12 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
LABEL_98:
      if (v12 >= 2)
      {
        v93 = *v100;
        do
        {
          v94 = v12 - 2;
          if (v12 < 2)
            goto LABEL_127;
          if (!v93)
            goto LABEL_139;
          v95 = *(_QWORD *)&v9[16 * v94 + 32];
          v96 = *(_QWORD *)&v9[16 * v12 + 24];
          sub_10000CE68((id *)(v93 + 8 * v95), (id *)(v93 + 8 * *(_QWORD *)&v9[16 * v12 + 16]), v93 + 8 * v96, v111);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_128;
          if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
            v9 = sub_10000D324((uint64_t)v9);
          if (v94 >= *((_QWORD *)v9 + 2))
            goto LABEL_129;
          v97 = &v9[16 * v94 + 32];
          *(_QWORD *)v97 = v95;
          *((_QWORD *)v97 + 1) = v96;
          v98 = *((_QWORD *)v9 + 2);
          if (v12 > v98)
            goto LABEL_130;
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v98 - v12));
          *((_QWORD *)v9 + 2) = v98 - 1;
          v12 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_109:
      v99 = swift_bridgeObjectRelease(v9);
      *(_QWORD *)((v112 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v99);
      swift_bridgeObjectRelease(v112);
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_100007E6C(0, &qword_100033138, CAFTrip_ptr);
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6, v7);
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v111 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v112 = v8;
  }
  v10 = 0;
  v11 = *a1;
  v101 = *a1 - 8;
  v102 = *a1 + 16;
  v9 = (char *)&_swiftEmptyArrayStorage;
  v108 = v3;
  while (1)
  {
    v13 = v10++;
    v109 = v13;
    if (v10 < v3)
    {
      v14 = *(void **)(v11 + 8 * v13);
      v15 = *(id *)(v11 + 8 * v10);
      v16 = v14;
      v106 = objc_msgSend(v15, "sortOrder");
      v17 = objc_msgSend(v16, "sortOrder");

      v3 = v108;
      v10 = v13 + 2;
      if (v13 + 2 < v108)
      {
        v103 = v9;
        v18 = (id *)(v102 + 8 * v13);
        while (1)
        {
          v19 = *(v18 - 1);
          v20 = *v18;
          v21 = v19;
          v22 = objc_msgSend(v20, "sortOrder");
          LODWORD(v19) = objc_msgSend(v21, "sortOrder");

          if (v106 < v17 == v22 >= v19)
            break;
          ++v10;
          ++v18;
          v3 = v108;
          if (v108 == v10)
          {
            v10 = v108;
            v9 = v103;
            goto LABEL_22;
          }
        }
        v9 = v103;
        v3 = v108;
LABEL_22:
        v13 = v109;
      }
      if (v106 < v17)
      {
        if (v10 < v13)
          goto LABEL_133;
        if (v13 < v10)
        {
          v23 = (uint64_t *)(v101 + 8 * v10);
          v24 = v10;
          v25 = v13;
          v26 = (uint64_t *)(v11 + 8 * v13);
          do
          {
            if (v25 != --v24)
            {
              if (!v11)
                goto LABEL_138;
              v27 = *v26;
              *v26 = *v23;
              *v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
          }
          while (v25 < v24);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v13))
        goto LABEL_131;
      if (v10 - v13 < v105)
        break;
    }
LABEL_48:
    if (v10 < v13)
      goto LABEL_126;
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      v9 = sub_10000D184(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v40 = *((_QWORD *)v9 + 2);
    v39 = *((_QWORD *)v9 + 3);
    v12 = v40 + 1;
    if (v40 >= v39 >> 1)
      v9 = sub_10000D184((char *)(v39 > 1), v40 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v41 = v9 + 32;
    v42 = &v9[16 * v40 + 32];
    *(_QWORD *)v42 = v13;
    *((_QWORD *)v42 + 1) = v10;
    if (v40)
    {
      v110 = v10;
      while (1)
      {
        v43 = v12 - 1;
        if (v12 >= 4)
        {
          v48 = &v41[16 * v12];
          v49 = *((_QWORD *)v48 - 8);
          v50 = *((_QWORD *)v48 - 7);
          v54 = __OFSUB__(v50, v49);
          v51 = v50 - v49;
          if (v54)
            goto LABEL_115;
          v53 = *((_QWORD *)v48 - 6);
          v52 = *((_QWORD *)v48 - 5);
          v54 = __OFSUB__(v52, v53);
          v46 = v52 - v53;
          v47 = v54;
          if (v54)
            goto LABEL_116;
          v55 = v12 - 2;
          v56 = &v41[16 * v12 - 32];
          v58 = *(_QWORD *)v56;
          v57 = *((_QWORD *)v56 + 1);
          v54 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          if (v54)
            goto LABEL_118;
          v54 = __OFADD__(v46, v59);
          v60 = v46 + v59;
          if (v54)
            goto LABEL_121;
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            v80 = *(_QWORD *)v78;
            v79 = *((_QWORD *)v78 + 1);
            v54 = __OFSUB__(v79, v80);
            v81 = v79 - v80;
            if (v54)
              goto LABEL_125;
            v71 = v46 < v81;
            goto LABEL_86;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v72 = *((_QWORD *)v9 + 4);
            v73 = *((_QWORD *)v9 + 5);
            v54 = __OFSUB__(v73, v72);
            v65 = v73 - v72;
            v66 = v54;
            goto LABEL_80;
          }
          v45 = *((_QWORD *)v9 + 4);
          v44 = *((_QWORD *)v9 + 5);
          v54 = __OFSUB__(v44, v45);
          v46 = v44 - v45;
          v47 = v54;
        }
        if ((v47 & 1) != 0)
          goto LABEL_117;
        v55 = v12 - 2;
        v61 = &v41[16 * v12 - 32];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v64 = __OFSUB__(v62, v63);
        v65 = v62 - v63;
        v66 = v64;
        if (v64)
          goto LABEL_120;
        v67 = &v41[16 * v43];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v54 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v54)
          goto LABEL_123;
        if (__OFADD__(v65, v70))
          goto LABEL_124;
        if (v65 + v70 >= v46)
        {
          v71 = v46 < v70;
LABEL_86:
          if (v71)
            v43 = v55;
          goto LABEL_88;
        }
LABEL_80:
        if ((v66 & 1) != 0)
          goto LABEL_119;
        v74 = &v41[16 * v43];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v54 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v54)
          goto LABEL_122;
        if (v77 < v65)
          goto LABEL_14;
LABEL_88:
        v82 = v43 - 1;
        if (v43 - 1 >= v12)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
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
          goto LABEL_135;
        }
        v83 = v11;
        if (!v11)
          goto LABEL_137;
        v84 = v9;
        v85 = &v41[16 * v82];
        v86 = *(_QWORD *)v85;
        v87 = v41;
        v88 = v43;
        v89 = &v41[16 * v43];
        v90 = *((_QWORD *)v89 + 1);
        v91 = v83;
        sub_10000CE68((id *)(v83 + 8 * *(_QWORD *)v85), (id *)(v83 + 8 * *(_QWORD *)v89), v83 + 8 * v90, v111);
        if (v1)
        {
          v9 = v84;
          goto LABEL_109;
        }
        if (v90 < v86)
          goto LABEL_112;
        if (v88 > *((_QWORD *)v84 + 2))
          goto LABEL_113;
        *(_QWORD *)v85 = v86;
        *(_QWORD *)&v87[16 * v82 + 8] = v90;
        v92 = *((_QWORD *)v84 + 2);
        if (v88 >= v92)
          goto LABEL_114;
        v9 = v84;
        v12 = v92 - 1;
        memmove(v89, v89 + 16, 16 * (v92 - 1 - v88));
        v41 = v87;
        *((_QWORD *)v84 + 2) = v92 - 1;
        v11 = v91;
        v10 = v110;
        if (v92 <= 2)
          goto LABEL_14;
      }
    }
    v12 = 1;
LABEL_14:
    v3 = v108;
    if (v10 >= v108)
      goto LABEL_98;
  }
  if (__OFADD__(v13, v105))
    goto LABEL_134;
  if (v13 + v105 >= v3)
    v28 = v3;
  else
    v28 = v13 + v105;
  if (v28 >= v13)
  {
    if (v10 != v28)
    {
      v104 = v9;
      v29 = v101 + 8 * v10;
      v107 = v28;
      do
      {
        v30 = *(void **)(v11 + 8 * v10);
        v31 = v13;
        v32 = v29;
        do
        {
          v33 = *(void **)v32;
          v34 = v30;
          v35 = v33;
          v36 = objc_msgSend(v34, "sortOrder");
          v37 = objc_msgSend(v35, "sortOrder");

          if (v36 >= v37)
            break;
          if (!v11)
            goto LABEL_136;
          v38 = *(void **)v32;
          v30 = *(void **)(v32 + 8);
          *(_QWORD *)v32 = v30;
          *(_QWORD *)(v32 + 8) = v38;
          v32 -= 8;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 8;
        v13 = v109;
      }
      while (v10 != v107);
      v10 = v107;
      v9 = v104;
    }
    goto LABEL_48;
  }
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
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_10000CD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v17 = v6;
    while (1)
    {
      v9 = *(void **)v6;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, "sortOrder");
      v13 = objc_msgSend(v11, "sortOrder");

      if (v12 >= v13)
      {
LABEL_4:
        ++v4;
        v6 = v17 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v5)
        break;
      v14 = *(void **)v6;
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v7;
      *(_QWORD *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_10000CE68(id *__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  id *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  id *v20;
  void **v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  void *v26;
  id v27;
  id v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t result;
  id *v32;
  id *v35;
  char *v36;
  void **v37;
  id *v38;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v38 = __src;
  v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v22 = &a4[v11];
      v36 = (char *)v22;
      v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v23 = (id *)(a3 - 8);
        v24 = v4;
        v32 = v5;
        do
        {
          v35 = v4;
          v25 = v23 + 1;
          v26 = *--v24;
          v27 = *(v22 - 1);
          v28 = v26;
          v29 = objc_msgSend(v27, "sortOrder");
          v30 = objc_msgSend(v28, "sortOrder");

          if (v29 >= v30)
          {
            v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22)
              *v23 = *(v22 - 1);
            v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35)
              *v23 = *v24;
            v38 = v24;
          }
          if (v24 <= v32)
            break;
          --v23;
          v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v12 = &a4[v8];
    v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v13 = a4;
      do
      {
        v14 = v5;
        v15 = *v13;
        v16 = *v4;
        v17 = v15;
        v18 = objc_msgSend(v16, "sortOrder");
        v19 = objc_msgSend(v17, "sortOrder");

        if (v18 >= v19)
        {
          v21 = v14;
          if (v14 != v13)
            *v14 = *v13;
          v37 = ++v13;
          v20 = v4;
        }
        else
        {
          v20 = v4 + 1;
          v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4)
            *v14 = *v4;
        }
        v5 = v21 + 1;
        if (v13 >= v12)
          break;
        v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      v38 = v5;
    }
LABEL_43:
    sub_10000D27C((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_10000D184(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000064D4(&qword_100033148);
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

char *sub_10000D27C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_10000D324(uint64_t a1)
{
  return sub_10000D184(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000D338(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_10000D35C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D380(uint64_t a1)
{
  uint64_t v1;

  return sub_10000BE3C(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000D388(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D398(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

_QWORD *sub_10000D3A0(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v3)
      break;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v3);
    if (v3 < 0)
    {
      __break(1u);
      return result;
    }
    v5 = 0;
    v21 = v2 & 0xC000000000000001;
    v6 = v2;
    while (v3 != v5)
    {
      if (v21)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      ++v5;
      v9 = sub_100007E6C(0, &qword_100033138, CAFTrip_ptr);
      v10 = sub_100007EA4(&qword_100033140, &qword_100033138, CAFTrip_ptr, (uint64_t)&protocol conformance descriptor for CAFTrip);
      v11 = (void *)CAFObserved<>.observable.getter(v9, v10);
      v12 = objc_msgSend(a2, "odometer");
      v13 = sub_100007E6C(0, &qword_100033128, CAFOdometer_ptr);
      v14 = sub_100007EA4(&qword_100033130, &qword_100033128, CAFOdometer_ptr, (uint64_t)&protocol conformance descriptor for CAFOdometer);
      v15 = (void *)CAFObserved<>.observable.getter(v13, v14);

      v16 = type metadata accessor for TripCard(0);
      swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
      v17 = sub_100016EAC(v11, v15);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v18 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
      v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v17);
      specialized ContiguousArray._endMutation()(v19);
      v2 = v6;
      if (v3 == v5)
        return _swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_14:
    if (v2 < 0)
      v20 = v2;
    else
      v20 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v3 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v2);
  }
  return result;
}

unint64_t sub_10000D5E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033160;
  if (!qword_100033160)
  {
    v1 = type metadata accessor for CAFCarObservable(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for CAFCarObservable, v1);
    atomic_store(result, (unint64_t *)&qword_100033160);
  }
  return result;
}

uint64_t sub_10000D62C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000D650(uint64_t a1)
{
  uint64_t v1;

  sub_100009E28(a1, v1);
}

uint64_t sub_10000D658(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000D68C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000064D4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_10000D6C8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D714(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *initializeBufferWithCopyOfBuffer for TripPresentationMode(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TripMeasurementStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TripMeasurementStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_10000D824 + 4 * byte_100022765[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000D858 + 4 * byte_100022760[v4]))();
}

uint64_t sub_10000D858(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D860(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000D868);
  return result;
}

uint64_t sub_10000D874(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000D87CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000D880(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D888(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D894(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000D89C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TripMeasurementStyle()
{
  return &type metadata for TripMeasurementStyle;
}

unint64_t sub_10000D8B8()
{
  unint64_t result;

  result = qword_100033230;
  if (!qword_100033230)
  {
    result = swift_getWitnessTable(&unk_1000227D8, &type metadata for TripMeasurementStyle);
    atomic_store(result, (unint64_t *)&qword_100033230);
  }
  return result;
}

BOOL sub_10000D8FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000D910()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D954()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D97C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000D9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) != 0)
  {
    swift_retain(a2);
    swift_retain(a3);
    swift_retain(a5);
    swift_retain(a6);
    a1 = a7;
  }
  return swift_retain(a1);
}

uint64_t destroy for TripMeasurementView(uint64_t a1)
{
  sub_10000DA4C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  return swift_release(*(_QWORD *)(a1 + 72));
}

uint64_t sub_10000DA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) != 0)
  {
    swift_release(a3);
    swift_release(a5);
    swift_release(a6);
    swift_release(a7);
    a1 = a2;
  }
  return swift_release(a1);
}

uint64_t initializeWithCopy for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  v12 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v12;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain(v12);
  return a1;
}

uint64_t assignWithCopy for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  sub_10000DA4C(v12, v13, v14, v15, v16, v17, v18, v19);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v20 = *(_QWORD *)(a2 + 72);
  v21 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v20;
  swift_retain(v20);
  swift_release(v21);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

__n128 initializeWithTake for TripMeasurementView(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for TripMeasurementView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  sub_10000DA4C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = *(_QWORD *)(a2 + 72);
  v16 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v15;
  swift_release(v16);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripMeasurementView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TripMeasurementView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TripMeasurementView()
{
  return &type metadata for TripMeasurementView;
}

uint64_t sub_10000DD70(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100025F64, 1);
}

void sub_10000DD80(uint64_t a1@<X8>)
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
  int v24;
  _QWORD v25[8];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  __int128 v43;

  v42 = a1;
  v2 = sub_1000064D4(&qword_100033238);
  __chkstk_darwin(v2);
  v25[5] = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1000064D4(&qword_100033240);
  v4 = __chkstk_darwin(v32);
  v25[4] = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v25[7] = (char *)v25 - v6;
  v29 = sub_1000064D4(&qword_100033248);
  __chkstk_darwin(v29);
  v31 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_1000064D4(&qword_100033250);
  __chkstk_darwin(v37);
  v33 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000064D4(&qword_100033258);
  __chkstk_darwin(v9);
  v25[2] = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1000064D4(&qword_100033260);
  v11 = __chkstk_darwin(v30);
  v25[1] = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v25[6] = (char *)v25 - v13;
  v14 = sub_1000064D4(&qword_100033268);
  __chkstk_darwin(v14);
  v28 = sub_1000064D4(&qword_100033270);
  v15 = __chkstk_darwin(v28);
  __chkstk_darwin(v15);
  v25[3] = (char *)v25 - v16;
  v39 = sub_1000064D4(&qword_100033278);
  __chkstk_darwin(v39);
  v41 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1000064D4(&qword_100033280);
  __chkstk_darwin(v34);
  v36 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1000064D4(&qword_100033288);
  __chkstk_darwin(v26);
  v35 = sub_1000064D4(&qword_100033290);
  __chkstk_darwin(v35);
  v27 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_1000064D4(&qword_100033298);
  __chkstk_darwin(v40);
  v38 = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000064D4(&qword_1000332A0);
  __chkstk_darwin(v21);
  v22 = sub_1000064D4(&qword_1000332A8);
  v23 = __chkstk_darwin(v22);
  __chkstk_darwin(v23);
  v43 = *(_OWORD *)(v1 + 64);
  v24 = *(unsigned __int8 *)(*((_QWORD *)&v43 + 1) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle);
  if (v24 == 5)
    v24 = *(unsigned __int8 *)(v1 + 80);
  __asm { BR              X10 }
}

uint64_t sub_10000E208()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  sub_10000EB34(v5);
  KeyPath = swift_getKeyPath(&unk_100022868);
  v9 = swift_getKeyPath(&unk_100022890);
  v10 = swift_retain(v4);
  static Published.subscript.getter(v0 + 25, v10, KeyPath, v9);
  swift_release(KeyPath);
  swift_release(v9);
  sub_100013874(v7 - 128);
  if (*((_BYTE *)v0 + 200))
    v11 = 0.0;
  else
    v11 = 1.0;
  sub_1000142AC(v5, v1, &qword_1000332A0);
  *(double *)(v1 + *(int *)(v2 + 36)) = v11;
  sub_10000D68C(v5, &qword_1000332A0);
  sub_100013F2C(v1, v3, &qword_1000332A8);
  sub_1000142AC(v3, v6, &qword_1000332A8);
  ((void (*)(uint64_t, _QWORD, _QWORD))swift_storeEnumTagMultiPayload)(v6, v0[8], 0);
  v12 = sub_1000139D8(&qword_1000332C8, &qword_1000332A8, (void (*)(void))sub_10001395C);
  v13 = sub_1000139D8(&qword_1000332E8, &qword_100033270, (void (*)(void))sub_100013A44);
  v14 = v0[9];
  ((void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))_ConditionalContent<>.init(storage:))(v6, v2, v0[10], v12, v13);
  v15 = v0[18];
  sub_1000142AC(v14, v15, &qword_100033290);
  ((void (*)(uint64_t, _QWORD, _QWORD))swift_storeEnumTagMultiPayload)(v15, v0[16], 0);
  v16 = sub_1000138C0();
  v17 = sub_100013AC0();
  v18 = v0[20];
  ((void (*)(uint64_t, _QWORD, _QWORD, unint64_t, unint64_t))_ConditionalContent<>.init(storage:))(v15, v0[17], v0[19], v16, v17);
  sub_10000D68C(v14, &qword_100033290);
  v19 = v0[23];
  sub_1000142AC(v18, v19, &qword_100033298);
  ((void (*)(uint64_t, _QWORD, _QWORD))swift_storeEnumTagMultiPayload)(v19, v0[21], 0);
  v20 = sub_1000064D4(&qword_1000332B0);
  v21 = sub_10001389C();
  v22 = sub_100013C54();
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t, unint64_t))_ConditionalContent<>.init(storage:))(v19, v0[22], v20, v21, v22);
  sub_10000D68C(v18, &qword_100033298);
  return sub_10000D68C(v3, &qword_1000332A8);
}

uint64_t sub_10000EB34@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  _QWORD v23[3];
  uint64_t v24;
  char **v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];

  v3 = sub_1000064D4(&qword_1000332E0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = static HorizontalAlignment.center.getter(v4);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = sub_1000064D4(&qword_100033368);
  sub_10000F1AC((uint64_t)v1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  v8 = v1[1];
  v30[0] = *v1;
  v30[1] = v8;
  v31[0] = v1[2];
  *(_OWORD *)((char *)v31 + 9) = *(_OWORD *)((char *)v1 + 41);
  sub_100013D10((uint64_t)v30, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v26);
  sub_100013D10((uint64_t)v30, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v9 = *((_QWORD *)&v26 + 1);
  v10 = v27;
  v11 = *((_QWORD *)&v28 + 1);
  v12 = v28;
  v13 = v29;
  if ((_BYTE)v26)
  {
    if (v26 == 1)
    {
      v14 = type metadata accessor for ClusterMetrics();
      v15 = (char **)&off_10002D948;
      v24 = v14;
      v25 = (char **)&off_10002D948;
      v23[0] = v11;
    }
    else
    {
      v14 = type metadata accessor for WidgetMetrics();
      v15 = &off_10002D8B8;
      v24 = v14;
      v25 = &off_10002D8B8;
      v23[0] = v13;
      v13 = v11;
    }
    v11 = v12;
  }
  else
  {
    v14 = type metadata accessor for ConsoleMetrics();
    v15 = (char **)&off_10002D9D8;
    v24 = v14;
    v25 = (char **)&off_10002D9D8;
    v23[0] = v12;
  }
  swift_release(v13);
  swift_release(v11);
  swift_release(v10);
  swift_release(v9);
  sub_100013D4C(v23, v14);
  v16 = ((double (__cdecl *)())v15[3])();
  v18 = static Alignment.center.getter(v17);
  _FrameLayout.init(width:height:alignment:)(&v26, 0, 1, *(_QWORD *)&v16, 0, v18, v19);
  sub_1000142AC((uint64_t)v6, a1, &qword_1000332E0);
  v20 = (_OWORD *)(a1 + *(int *)(sub_1000064D4(&qword_1000332A0) + 36));
  v21 = v27;
  *v20 = v26;
  v20[1] = v21;
  v20[2] = v28;
  sub_10000D68C((uint64_t)v6, &qword_1000332E0);
  return sub_10000D714(v23);
}

uint64_t sub_10000ED5C@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  _QWORD v23[3];
  uint64_t v24;
  char **v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];

  v3 = sub_1000064D4(&qword_100033300);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = static HorizontalAlignment.leading.getter(v4);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = sub_1000064D4(&qword_1000333A0);
  sub_10000FFDC((uint64_t)v1, &v6[*(int *)(v7 + 44)]);
  v8 = v1[1];
  v30[0] = *v1;
  v30[1] = v8;
  v31[0] = v1[2];
  *(_OWORD *)((char *)v31 + 9) = *(_OWORD *)((char *)v1 + 41);
  sub_100013D10((uint64_t)v30, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v26);
  sub_100013D10((uint64_t)v30, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v9 = *((_QWORD *)&v26 + 1);
  v10 = v27;
  v11 = *((_QWORD *)&v28 + 1);
  v12 = v28;
  v13 = v29;
  if ((_BYTE)v26)
  {
    if (v26 == 1)
    {
      v14 = type metadata accessor for ClusterMetrics();
      v15 = (char **)&off_10002D948;
      v24 = v14;
      v25 = (char **)&off_10002D948;
      v23[0] = v11;
    }
    else
    {
      v14 = type metadata accessor for WidgetMetrics();
      v15 = &off_10002D8B8;
      v24 = v14;
      v25 = &off_10002D8B8;
      v23[0] = v13;
      v13 = v11;
    }
    v11 = v12;
  }
  else
  {
    v14 = type metadata accessor for ConsoleMetrics();
    v15 = (char **)&off_10002D9D8;
    v24 = v14;
    v25 = (char **)&off_10002D9D8;
    v23[0] = v12;
  }
  swift_release(v13);
  swift_release(v11);
  swift_release(v10);
  swift_release(v9);
  sub_100013D4C(v23, v14);
  v16 = ((double (__cdecl *)())v15[3])();
  v18 = static Alignment.center.getter(v17);
  _FrameLayout.init(width:height:alignment:)(&v26, 0, 1, *(_QWORD *)&v16, 0, v18, v19);
  sub_1000142AC((uint64_t)v6, a1, &qword_100033300);
  v20 = (_OWORD *)(a1 + *(int *)(sub_1000064D4(&qword_100033268) + 36));
  v21 = v27;
  *v20 = v26;
  v20[1] = v21;
  v20[2] = v28;
  sub_10000D68C((uint64_t)v6, &qword_100033300);
  return sub_10000D714(v23);
}

uint64_t sub_10000EF84@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(_OWORD *)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  _OWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char **v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t v29;
  uint64_t *v30;
  _QWORD v31[3];
  uint64_t v32;
  char **v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  _OWORD v39[3];

  v30 = a4;
  v10 = sub_1000064D4(a1);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v13 = static HorizontalAlignment.leading.getter(v11);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 1;
  sub_1000064D4(a2);
  a3(v5);
  v14 = v5[1];
  v38[0] = *v5;
  v38[1] = v14;
  v39[0] = v5[2];
  *(_OWORD *)((char *)v39 + 9) = *(_OWORD *)((char *)v5 + 41);
  sub_100013D10((uint64_t)v38, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v34);
  sub_100013D10((uint64_t)v38, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v15 = *((_QWORD *)&v34 + 1);
  v16 = v35;
  v18 = *((_QWORD *)&v36 + 1);
  v17 = v36;
  v19 = v37;
  if ((_BYTE)v34)
  {
    if (v34 == 1)
    {
      v20 = type metadata accessor for ClusterMetrics();
      v21 = (char **)&off_10002D948;
      v32 = v20;
      v33 = (char **)&off_10002D948;
      v31[0] = v18;
    }
    else
    {
      v20 = type metadata accessor for WidgetMetrics();
      v21 = &off_10002D8B8;
      v32 = v20;
      v33 = &off_10002D8B8;
      v31[0] = v19;
      v19 = v18;
    }
    v18 = v17;
  }
  else
  {
    v20 = type metadata accessor for ConsoleMetrics();
    v21 = (char **)&off_10002D9D8;
    v32 = v20;
    v33 = (char **)&off_10002D9D8;
    v31[0] = v17;
  }
  swift_release(v19);
  swift_release(v18);
  swift_release(v16);
  swift_release(v15);
  sub_100013D4C(v31, v20);
  v22 = ((double (__cdecl *)())v21[2])();
  v24 = static Alignment.center.getter(v23);
  _FrameLayout.init(width:height:alignment:)(&v34, 0, 1, *(_QWORD *)&v22, 0, v24, v25);
  sub_1000142AC((uint64_t)v13, a5, a1);
  v26 = (_OWORD *)(a5 + *(int *)(sub_1000064D4(v30) + 36));
  v27 = v35;
  *v26 = v34;
  v26[1] = v27;
  v26[2] = v36;
  sub_10000D68C((uint64_t)v13, a1);
  return sub_10000D714(v31);
}

uint64_t sub_10000F1AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
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
  uint64_t v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char **v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD v56[15];
  uint64_t v57;
  _OWORD v58[16];
  char v59;
  _OWORD v60[17];
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[49];
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
  _BYTE v75[31];
  _OWORD v76[3];
  _OWORD v77[2];
  _OWORD v78[3];

  v51 = type metadata accessor for Divider(0);
  v4 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000064D4(&qword_100033370);
  __chkstk_darwin(v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000064D4(&qword_100033378);
  v54 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v53 = (uint64_t)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v52 = (uint64_t)&v48 - v13;
  v14 = sub_1000064D4(&qword_100033380);
  v15 = __chkstk_darwin(v14);
  v55 = (uint64_t)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v48 - v18;
  v20 = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1)
  {
    v49 = (char *)&v48 - v18;
    v50 = a2;
    v21 = Divider.init()(v17, 1);
    v22 = *(_QWORD *)(a1 + 88);
    v23 = static Alignment.center.getter(v21);
    _FrameLayout.init(width:height:alignment:)(v76, 0, 1, v22, 0, v23, v24);
    v25 = v51;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v51);
    v26 = &v9[*(int *)(v7 + 36)];
    v27 = v76[1];
    *(_OWORD *)v26 = v76[0];
    *((_OWORD *)v26 + 1) = v27;
    *((_OWORD *)v26 + 2) = v76[2];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v25);
    v28 = *(_OWORD *)(a1 + 16);
    v77[0] = *(_OWORD *)a1;
    v77[1] = v28;
    v78[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v78 + 9) = *(_OWORD *)(a1 + 41);
    sub_100013D10((uint64_t)v77, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)&v61);
    sub_100013D10((uint64_t)v77, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v51 = v62;
    v48 = *(_QWORD *)v63;
    v29 = *(_QWORD *)&v63[16];
    v30 = *(_QWORD *)&v63[24];
    v31 = *(_QWORD *)&v63[32];
    v32 = v9;
    if ((_BYTE)v61)
    {
      if (v61 == 1)
      {
        v33 = type metadata accessor for ClusterMetrics();
        v34 = (char **)&off_10002D948;
        *(_QWORD *)&v63[16] = &off_10002D948;
        *(_QWORD *)&v63[8] = v33;
        v61 = v30;
      }
      else
      {
        v33 = type metadata accessor for WidgetMetrics();
        v34 = &off_10002D8B8;
        *(_QWORD *)&v63[16] = &off_10002D8B8;
        *(_QWORD *)&v63[8] = v33;
        v61 = v31;
        v31 = v30;
      }
      v30 = v29;
    }
    else
    {
      v33 = type metadata accessor for ConsoleMetrics();
      v34 = (char **)&off_10002D9D8;
      *(_QWORD *)&v63[16] = &off_10002D9D8;
      *(_QWORD *)&v63[8] = v33;
      v61 = v29;
    }
    swift_release(v31);
    swift_release(v30);
    swift_release(v48);
    swift_release(v51);
    sub_100013D4C(&v61, v33);
    v35 = ((uint64_t (__cdecl *)())v34[13])();
    v36 = static Edge.Set.all.getter();
    v37 = (uint64_t)v32;
    v38 = (uint64_t)v32;
    v39 = v53;
    sub_1000142AC(v38, v53, &qword_100033370);
    v40 = v39 + *(int *)(v10 + 36);
    *(_QWORD *)v40 = v35;
    *(_BYTE *)(v40 + 8) = v36;
    sub_10000D68C(v37, &qword_100033370);
    sub_10000D714(&v61);
    v41 = v52;
    sub_100013F2C(v39, v52, &qword_100033378);
    v19 = v49;
    sub_100013F2C(v41, (uint64_t)v49, &qword_100033378);
    v20 = 0;
    a2 = v50;
  }
  v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v19, v20, 1, v10);
  v43 = static VerticalAlignment.center.getter(v42);
  sub_10000F774(a1, (uint64_t)v56);
  *(_OWORD *)((char *)&v58[12] + 7) = v56[12];
  *(_OWORD *)((char *)&v58[13] + 7) = v56[13];
  *(_OWORD *)((char *)&v58[14] + 7) = v56[14];
  *(_OWORD *)((char *)&v58[8] + 7) = v56[8];
  *(_OWORD *)((char *)&v58[9] + 7) = v56[9];
  *(_OWORD *)((char *)&v58[10] + 7) = v56[10];
  *(_OWORD *)((char *)&v58[11] + 7) = v56[11];
  *(_OWORD *)((char *)&v58[4] + 7) = v56[4];
  *(_OWORD *)((char *)&v58[5] + 7) = v56[5];
  *(_OWORD *)((char *)&v58[6] + 7) = v56[6];
  *(_OWORD *)((char *)&v58[7] + 7) = v56[7];
  *(_OWORD *)((char *)v58 + 7) = v56[0];
  *(_OWORD *)((char *)&v58[1] + 7) = v56[1];
  *(_OWORD *)((char *)&v58[2] + 7) = v56[2];
  v59 = 1;
  *(_QWORD *)((char *)&v58[15] + 7) = v57;
  *(_OWORD *)((char *)&v58[3] + 7) = v56[3];
  v44 = v55;
  sub_1000142AC((uint64_t)v19, v55, &qword_100033380);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v45 = sub_1000064D4(&qword_100033388);
  sub_1000142AC(v44, a2 + *(int *)(v45 + 48), &qword_100033380);
  v46 = *(int *)(v45 + 64);
  *(_OWORD *)((char *)&v60[13] + 1) = v58[12];
  *(_OWORD *)((char *)&v60[14] + 1) = v58[13];
  *(_OWORD *)((char *)&v60[15] + 1) = v58[14];
  v60[16] = *(_OWORD *)((char *)&v58[14] + 15);
  *(_OWORD *)((char *)&v60[9] + 1) = v58[8];
  *(_OWORD *)((char *)&v60[10] + 1) = v58[9];
  *(_OWORD *)((char *)&v60[11] + 1) = v58[10];
  *(_OWORD *)((char *)&v60[12] + 1) = v58[11];
  *(_OWORD *)((char *)&v60[5] + 1) = v58[4];
  *(_OWORD *)((char *)&v60[6] + 1) = v58[5];
  *(_OWORD *)((char *)&v60[7] + 1) = v58[6];
  *(_OWORD *)((char *)&v60[8] + 1) = v58[7];
  *(_OWORD *)((char *)&v60[3] + 1) = v58[2];
  *(_OWORD *)((char *)&v60[4] + 1) = v58[3];
  *(_OWORD *)((char *)&v60[1] + 1) = v58[0];
  v60[0] = (unint64_t)v43;
  LOBYTE(v60[1]) = 1;
  *(_OWORD *)((char *)&v60[2] + 1) = v58[1];
  memcpy((void *)(a2 + v46), v60, 0x110uLL);
  sub_100013D70((uint64_t)v60);
  sub_10000D68C((uint64_t)v19, &qword_100033380);
  v73 = v58[12];
  v74 = v58[13];
  *(_OWORD *)v75 = v58[14];
  *(_OWORD *)&v75[15] = *(_OWORD *)((char *)&v58[14] + 15);
  v69 = v58[8];
  v70 = v58[9];
  v71 = v58[10];
  v72 = v58[11];
  v65 = v58[4];
  v66 = v58[5];
  v67 = v58[6];
  v68 = v58[7];
  *(_OWORD *)&v63[1] = v58[0];
  *(_OWORD *)&v63[17] = v58[1];
  *(_OWORD *)&v63[33] = v58[2];
  v61 = v43;
  v62 = 0;
  v63[0] = 1;
  v64 = v58[3];
  sub_100013E4C((uint64_t)&v61);
  return sub_10000D68C(v44, &qword_100033380);
}

uint64_t *sub_10000F774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char **v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char **v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char **v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  __n128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v57;
  uint64_t v58;
  int v59;
  _OWORD *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t KeyPath;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[56];
  _BYTE v76[7];
  char v77;
  _BYTE v78[7];
  char v79;
  _BYTE v80[7];
  char v81;
  _BYTE v82[7];
  char v83;
  __n128 v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[3];
  uint64_t v96;
  char **v97;
  _BYTE v98[7];
  unsigned __int8 v99;
  _BYTE v100[7];
  _OWORD v101[2];
  _OWORD v102[3];

  v4 = sub_1000064D4(&qword_100033390);
  __chkstk_darwin(v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName);
  v8 = *v7;
  v9 = v7[1];
  swift_bridgeObjectRetain(v9);
  v66 = Image.init(automakerSymbolName:)(v8, v9);
  v10 = *(_OWORD *)(a1 + 16);
  v101[0] = *(_OWORD *)a1;
  v101[1] = v10;
  v102[0] = *(_OWORD *)(a1 + 32);
  v60 = (_OWORD *)a1;
  *(_OWORD *)((char *)v102 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v84);
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v11 = v84.n128_u64[1];
  v12 = v85;
  v14 = *((_QWORD *)&v87 + 1);
  v13 = v87;
  v15 = v88;
  if (v84.n128_u8[0])
  {
    if (v84.n128_u8[0] == 1)
    {
      v16 = type metadata accessor for ClusterMetrics();
      v17 = (char **)&off_10002D948;
      v86 = v16;
      *(_QWORD *)&v87 = &off_10002D948;
      v84.n128_u64[0] = v14;
    }
    else
    {
      v16 = type metadata accessor for WidgetMetrics();
      v17 = &off_10002D8B8;
      v86 = v16;
      *(_QWORD *)&v87 = &off_10002D8B8;
      v84.n128_u64[0] = v15;
      v15 = v14;
    }
    v14 = v13;
  }
  else
  {
    v16 = type metadata accessor for ConsoleMetrics();
    v17 = (char **)&off_10002D9D8;
    v86 = v16;
    *(_QWORD *)&v87 = &off_10002D9D8;
    v84.n128_u64[0] = v13;
  }
  swift_release(v15);
  swift_release(v14);
  swift_release(v12);
  swift_release(v11);
  sub_100013D4C(&v84, v16);
  v18 = ((double (__cdecl *)())v17[7])();
  v19 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 1, 1, v19);
  v65 = static Font.system(size:weight:design:)(0, 1, v6, v18);
  sub_10000D68C((uint64_t)v6, &qword_100033390);
  sub_10000D714(&v84);
  KeyPath = swift_getKeyPath(&unk_1000228B0);
  v63 = static Edge.Set.trailing.getter();
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v84);
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v20 = v84.n128_u64[1];
  v21 = v85;
  v23 = *((_QWORD *)&v87 + 1);
  v22 = v87;
  v24 = v88;
  if (v84.n128_u8[0])
  {
    if (v84.n128_u8[0] == 1)
    {
      v25 = type metadata accessor for ClusterMetrics();
      v26 = (char **)&off_10002D948;
      v86 = v25;
      *(_QWORD *)&v87 = &off_10002D948;
      v84.n128_u64[0] = v23;
    }
    else
    {
      v25 = type metadata accessor for WidgetMetrics();
      v26 = &off_10002D8B8;
      v86 = v25;
      *(_QWORD *)&v87 = &off_10002D8B8;
      v84.n128_u64[0] = v24;
      v24 = v23;
    }
    v23 = v22;
  }
  else
  {
    v25 = type metadata accessor for ConsoleMetrics();
    v26 = (char **)&off_10002D9D8;
    v86 = v25;
    *(_QWORD *)&v87 = &off_10002D9D8;
    v84.n128_u64[0] = v22;
  }
  swift_release(v24);
  swift_release(v23);
  swift_release(v21);
  swift_release(v20);
  sub_100013D4C(&v84, v25);
  v62 = ((uint64_t (__cdecl *)())v26[6])();
  v61 = swift_getKeyPath(&unk_1000228E0);
  sub_10000D714(&v84);
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v84);
  sub_100013D10((uint64_t)v101, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v27 = v84.n128_u64[1];
  v28 = v85;
  v30 = *((_QWORD *)&v87 + 1);
  v29 = v87;
  v31 = v88;
  if (v84.n128_u8[0])
  {
    if (v84.n128_u8[0] == 1)
    {
      v32 = type metadata accessor for ClusterMetrics();
      v33 = (char **)&off_10002D948;
      v96 = v32;
      v97 = (char **)&off_10002D948;
      v95[0] = v30;
    }
    else
    {
      v32 = type metadata accessor for WidgetMetrics();
      v33 = &off_10002D8B8;
      v96 = v32;
      v97 = &off_10002D8B8;
      v95[0] = v31;
      v31 = v30;
    }
    v30 = v29;
  }
  else
  {
    v32 = type metadata accessor for ConsoleMetrics();
    v33 = (char **)&off_10002D9D8;
    v96 = v32;
    v97 = (char **)&off_10002D9D8;
    v95[0] = v29;
  }
  swift_release(v31);
  swift_release(v30);
  swift_release(v28);
  swift_release(v27);
  sub_100013D4C(v95, v32);
  v34 = ((double (__cdecl *)())v33[5])();
  v36 = static Alignment.center.getter(v35);
  _FrameLayout.init(width:height:alignment:)(&v67, *(_QWORD *)&v34, 0, 0, 1, v36, v37);
  v99 = 1;
  v38 = sub_10000D714(v95);
  v39 = v99;
  v59 = v99;
  v58 = static HorizontalAlignment.leading.getter(v38);
  sub_10000FE20(v60, &v84);
  v40 = v85;
  v41 = v86;
  v42 = v87;
  LOBYTE(v34) = BYTE8(v87);
  v43 = v88;
  v44 = v89;
  v45 = v90;
  LODWORD(v60) = v90;
  v46 = v91;
  v47 = v84;
  *(_QWORD *)&v70 = v66;
  *((_QWORD *)&v70 + 1) = KeyPath;
  *(_QWORD *)&v71 = v65;
  BYTE8(v71) = v63;
  *(_DWORD *)((char *)&v71 + 9) = *(_DWORD *)v100;
  HIDWORD(v71) = *(_DWORD *)&v100[3];
  v72 = 0u;
  v73 = 0u;
  LOBYTE(v74) = v39;
  DWORD1(v74) = *(_DWORD *)&v98[3];
  *(_DWORD *)((char *)&v74 + 1) = *(_DWORD *)v98;
  *((_QWORD *)&v74 + 1) = v61;
  *(_QWORD *)v75 = v62;
  *(_OWORD *)&v75[40] = v69;
  *(_OWORD *)&v75[24] = v68;
  *(_OWORD *)&v75[8] = v67;
  v48 = v70;
  v49 = v71;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = v48;
  *(_OWORD *)(a2 + 16) = v49;
  v50 = v74;
  v51 = *(_OWORD *)v75;
  v52 = *(_OWORD *)&v75[32];
  v53 = *(_QWORD *)&v75[48];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v75[16];
  *(_OWORD *)(a2 + 112) = v52;
  *(_OWORD *)(a2 + 64) = v50;
  *(_OWORD *)(a2 + 80) = v51;
  v83 = 1;
  v81 = v40;
  v79 = LOBYTE(v34);
  v77 = v45;
  *(_DWORD *)(a2 + 153) = *(_DWORD *)v82;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v82[3];
  v54 = v81;
  *(_DWORD *)(a2 + 177) = *(_DWORD *)v80;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v80[3];
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v78[3];
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v78;
  *(_DWORD *)(a2 + 236) = *(_DWORD *)&v76[3];
  *(_DWORD *)(a2 + 233) = *(_DWORD *)v76;
  *(_QWORD *)(a2 + 128) = v53;
  *(_QWORD *)(a2 + 136) = v58;
  *(_QWORD *)(a2 + 144) = 0;
  *(_BYTE *)(a2 + 152) = 1;
  *(__n128 *)(a2 + 160) = v47;
  *(_BYTE *)(a2 + 176) = v54;
  *(_QWORD *)(a2 + 184) = v41;
  *(_QWORD *)(a2 + 192) = v42;
  *(_BYTE *)(a2 + 200) = LOBYTE(v34);
  *(_OWORD *)(a2 + 208) = v43;
  *(_QWORD *)(a2 + 224) = v44;
  *(_BYTE *)(a2 + 232) = v45;
  *(_QWORD *)(a2 + 240) = v46;
  sub_100014010((uint64_t *)&v70);
  sub_100013E3C(v41, v42, SLOBYTE(v34));
  swift_bridgeObjectRetain(v43);
  v55 = (char)v60;
  sub_100013E3C(*((uint64_t *)&v43 + 1), v44, (char)v60);
  swift_bridgeObjectRetain(v46);
  sub_100013F1C(v41, v42, SLOBYTE(v34));
  swift_bridgeObjectRelease(v43);
  sub_100013F1C(*((uint64_t *)&v43 + 1), v44, v55);
  swift_bridgeObjectRelease(v46);
  v84.n128_u64[0] = v66;
  v84.n128_u64[1] = KeyPath;
  v85 = v65;
  LOBYTE(v86) = v63;
  *(_DWORD *)((char *)&v86 + 1) = *(_DWORD *)v100;
  HIDWORD(v86) = *(_DWORD *)&v100[3];
  v87 = 0u;
  v88 = 0u;
  LOBYTE(v89) = v59;
  *(_DWORD *)((char *)&v89 + 1) = *(_DWORD *)v98;
  HIDWORD(v89) = *(_DWORD *)&v98[3];
  v90 = v61;
  v91 = v62;
  v94 = v69;
  v93 = v68;
  v92 = v67;
  return sub_100014070((uint64_t *)&v84);
}

__n128 sub_10000FE20@<Q0>(_OWORD *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char **v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 v16;
  unint64_t v17;
  unsigned __int8 v18;
  unint64_t v19;
  __n128 result;
  __n128 v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  __n128 v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  char **v31;
  _OWORD v32[2];
  _OWORD v33[3];

  v4 = static HorizontalAlignment.leading.getter();
  v5 = a1[1];
  v32[0] = *a1;
  v32[1] = v5;
  v33[0] = a1[2];
  *(_OWORD *)((char *)v33 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100013D10((uint64_t)v32, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v22);
  sub_100013D10((uint64_t)v32, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v6 = v23;
  v7 = v24;
  v9 = v25.n128_u64[1];
  v8 = v26;
  v10 = v27;
  if ((_BYTE)v22)
  {
    if (v22 == 1)
    {
      v11 = type metadata accessor for ClusterMetrics();
      v12 = (char **)&off_10002D948;
      v30 = v11;
      v31 = (char **)&off_10002D948;
      v29[0] = v8;
    }
    else
    {
      v11 = type metadata accessor for WidgetMetrics();
      v12 = &off_10002D8B8;
      v30 = v11;
      v31 = &off_10002D8B8;
      v29[0] = v10;
      v10 = v8;
    }
    v8 = v9;
  }
  else
  {
    v11 = type metadata accessor for ConsoleMetrics();
    v12 = (char **)&off_10002D9D8;
    v30 = v11;
    v31 = (char **)&off_10002D9D8;
    v29[0] = v9;
  }
  swift_release(v10);
  swift_release(v8);
  swift_release(v7);
  swift_release(v6);
  sub_100013D4C(v29, v11);
  v13 = ((double (__cdecl *)())v12[14])();
  sub_1000105E0((uint64_t)a1, (uint64_t)&v22);
  v14 = v22;
  v15 = v23;
  v16 = v24;
  v21 = v25;
  v17 = v26;
  v18 = v27;
  v19 = v28;
  sub_10000D714(v29);
  a2->n128_u64[0] = v4;
  a2->n128_f64[1] = v13;
  a2[1].n128_u8[0] = 0;
  a2[1].n128_u64[1] = v14;
  a2[2].n128_u64[0] = v15;
  a2[2].n128_u8[8] = v16;
  result = v21;
  a2[3] = v21;
  a2[4].n128_u64[0] = v17;
  a2[4].n128_u8[8] = v18;
  a2[5].n128_u64[0] = v19;
  return result;
}

uint64_t sub_10000FFDC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char **v31;
  uint64_t v32;
  uint64_t v33;
  char **v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char **v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  char **v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char **v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[3];
  uint64_t v80;
  char **v81;
  _OWORD v82[3];
  _OWORD v83[2];
  _OWORD v84[2];
  _OWORD v85[2];
  _OWORD v86[3];

  v69 = a2;
  v3 = type metadata accessor for Divider(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000064D4(&qword_100033370);
  __chkstk_darwin(v7);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000064D4(&qword_100033378);
  v67 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v66 = (uint64_t)&v64 - v14;
  v15 = sub_1000064D4(&qword_100033380);
  v16 = __chkstk_darwin(v15);
  v68 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v21 = (char *)&v64 - v20;
  v22 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType);
  v70 = (char *)&v64 - v20;
  if (v22 == 1)
  {
    v23 = Divider.init()(v18, v19);
    v24 = *(_QWORD *)(a1 + 88);
    v25 = static Alignment.center.getter(v23);
    _FrameLayout.init(width:height:alignment:)(v82, 0, 1, v24, 0, v25, v26);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    v27 = &v9[*(int *)(v7 + 36)];
    v28 = v82[1];
    *(_OWORD *)v27 = v82[0];
    *((_OWORD *)v27 + 1) = v28;
    *((_OWORD *)v27 + 2) = v82[2];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v29 = *(_OWORD *)(a1 + 16);
    v85[0] = *(_OWORD *)a1;
    v85[1] = v29;
    v86[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v86 + 9) = *(_OWORD *)(a1 + 41);
    sub_100013D10((uint64_t)v85, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)&v71);
    sub_100013D10((uint64_t)v85, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v64 = v73;
    v65 = (char **)v72;
    v31 = v75;
    v30 = v76;
    v32 = v77;
    if ((_BYTE)v71)
    {
      if (v71 == 1)
      {
        v33 = type metadata accessor for ClusterMetrics();
        v34 = (char **)&off_10002D948;
        v74 = v33;
        v75 = (char **)&off_10002D948;
        v71 = v30;
      }
      else
      {
        v33 = type metadata accessor for WidgetMetrics();
        v34 = &off_10002D8B8;
        v74 = v33;
        v75 = &off_10002D8B8;
        v71 = v32;
        v32 = v30;
      }
      v30 = (uint64_t)v31;
    }
    else
    {
      v33 = type metadata accessor for ConsoleMetrics();
      v34 = (char **)&off_10002D9D8;
      v74 = v33;
      v75 = (char **)&off_10002D9D8;
      v71 = (uint64_t)v31;
    }
    swift_release(v32);
    swift_release(v30);
    swift_release(v64);
    swift_release(v65);
    sub_100013D4C(&v71, v33);
    v36 = ((uint64_t (__cdecl *)())v34[13])();
    v37 = static Edge.Set.all.getter();
    sub_1000142AC((uint64_t)v9, (uint64_t)v13, &qword_100033370);
    v38 = &v13[*(int *)(v10 + 36)];
    *(_QWORD *)v38 = v36;
    v38[8] = v37;
    sub_10000D68C((uint64_t)v9, &qword_100033370);
    sub_10000D714(&v71);
    v39 = v66;
    sub_100013F2C((uint64_t)v13, v66, &qword_100033378);
    v21 = v70;
    sub_100013F2C(v39, (uint64_t)v70, &qword_100033378);
    v35 = 0;
  }
  else
  {
    v35 = 1;
  }
  v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56))(v21, v35, 1, v10);
  v41 = static HorizontalAlignment.leading.getter(v40);
  v42 = *(_OWORD *)(a1 + 16);
  v83[0] = *(_OWORD *)a1;
  v83[1] = v42;
  v84[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v84 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v83, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v71);
  sub_100013D10((uint64_t)v83, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v43 = v72;
  v44 = v73;
  v46 = v75;
  v45 = v76;
  v47 = v77;
  v67 = v41;
  if ((_BYTE)v71)
  {
    if (v71 == 1)
    {
      v48 = type metadata accessor for ClusterMetrics();
      v49 = (char **)&off_10002D948;
      v80 = v48;
      v81 = (char **)&off_10002D948;
      v79[0] = v45;
    }
    else
    {
      v48 = type metadata accessor for WidgetMetrics();
      v49 = &off_10002D8B8;
      v80 = v48;
      v81 = &off_10002D8B8;
      v79[0] = v47;
      v47 = v45;
    }
    v45 = (uint64_t)v46;
  }
  else
  {
    v48 = type metadata accessor for ConsoleMetrics();
    v49 = (char **)&off_10002D9D8;
    v80 = v48;
    v81 = (char **)&off_10002D9D8;
    v79[0] = v46;
  }
  swift_release(v47);
  swift_release(v45);
  swift_release(v44);
  swift_release(v43);
  sub_100013D4C(v79, v48);
  v50 = ((double (__cdecl *)())v49[14])();
  sub_1000105E0(a1, (uint64_t)&v71);
  v52 = v71;
  v51 = v72;
  v53 = v73;
  v54 = v74;
  v55 = v76;
  v56 = v77;
  v65 = v75;
  v66 = v78;
  sub_10000D714(v79);
  v57 = v68;
  sub_1000142AC((uint64_t)v70, v68, &qword_100033380);
  v58 = v69;
  *v69 = 0;
  *((_BYTE *)v58 + 8) = 1;
  v59 = sub_1000064D4(&qword_1000333A8);
  sub_1000142AC(v57, (uint64_t)v58 + *(int *)(v59 + 48), &qword_100033380);
  v60 = (double *)((char *)v58 + *(int *)(v59 + 64));
  v61 = v66;
  *(_QWORD *)v60 = v67;
  v60[1] = v50;
  *((_BYTE *)v60 + 16) = 0;
  *((_QWORD *)v60 + 3) = v52;
  *((_QWORD *)v60 + 4) = v51;
  *((_BYTE *)v60 + 40) = v53;
  v62 = (uint64_t)v65;
  *((_QWORD *)v60 + 6) = v54;
  *((_QWORD *)v60 + 7) = v62;
  *((_QWORD *)v60 + 8) = v55;
  *((_BYTE *)v60 + 72) = v56;
  *((_QWORD *)v60 + 10) = v61;
  sub_100013E3C(v52, v51, v53);
  swift_bridgeObjectRetain(v54);
  sub_100013E3C(v62, v55, v56);
  swift_bridgeObjectRetain(v61);
  sub_10000D68C((uint64_t)v70, &qword_100033380);
  sub_100013F1C(v52, v51, v53);
  swift_bridgeObjectRelease(v54);
  sub_100013F1C(v62, v55, v56);
  swift_bridgeObjectRelease(v61);
  return sub_10000D68C(v57, &qword_100033380);
}

uint64_t sub_1000105E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  char **v15;
  char **v16;
  uint64_t v17;
  char **v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  char **v30;
  char **v31;
  uint64_t v32;
  char **v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  char **v50;
  char **v51;
  uint64_t v52;
  char **v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char **v64;
  char **v65;
  char **v66;
  uint64_t v67;
  char **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  char v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  char v87;
  uint64_t v88;
  char **v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char **v94;
  char **v95;
  char **v96;
  _OWORD v97[2];
  _OWORD v98[3];

  v80 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  *(_QWORD *)&v97[0] = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  *((_QWORD *)&v97[0] + 1) = v3;
  v4 = sub_1000140D4();
  swift_bridgeObjectRetain(v3);
  v81 = v4;
  v5 = Text.init<A>(_:)(v97, &type metadata for String, v4);
  v7 = v6;
  v86 = v8;
  v10 = v9;
  v11 = *(_OWORD *)(a1 + 16);
  v97[0] = *(_OWORD *)a1;
  v97[1] = v11;
  v98[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v98 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v12 = v91;
  v13 = v92;
  v14 = v94;
  v15 = v95;
  v16 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v17 = type metadata accessor for ClusterMetrics();
      v18 = (char **)&off_10002D948;
      v93 = v17;
      v94 = (char **)&off_10002D948;
      v90 = v15;
    }
    else
    {
      v17 = type metadata accessor for WidgetMetrics();
      v18 = &off_10002D8B8;
      v93 = v17;
      v94 = &off_10002D8B8;
      v90 = v16;
      v16 = v15;
    }
    v15 = v14;
  }
  else
  {
    v17 = type metadata accessor for ConsoleMetrics();
    v18 = (char **)&off_10002D9D8;
    v93 = v17;
    v94 = (char **)&off_10002D9D8;
    v90 = v14;
  }
  swift_release(v16);
  swift_release(v15);
  swift_release(v13);
  swift_release(v12);
  sub_100013D4C(&v90, v17);
  v19 = ((uint64_t (__cdecl *)())v18[10])();
  v20 = v86 & 1;
  v21 = Text.font(_:)(v19, v5, v7, v86 & 1, v10);
  v23 = v22;
  v87 = v24;
  v26 = v25;
  sub_100013F1C(v5, v7, v20);
  swift_release(v19);
  swift_bridgeObjectRelease(v10);
  sub_10000D714(&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v27 = v91;
  v28 = v92;
  v30 = v94;
  v29 = v95;
  v31 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v32 = type metadata accessor for ClusterMetrics();
      v33 = (char **)&off_10002D948;
      v93 = v32;
      v94 = (char **)&off_10002D948;
      v90 = v29;
    }
    else
    {
      v32 = type metadata accessor for WidgetMetrics();
      v33 = &off_10002D8B8;
      v93 = v32;
      v94 = &off_10002D8B8;
      v90 = v31;
      v31 = v29;
    }
    v29 = v30;
  }
  else
  {
    v32 = type metadata accessor for ConsoleMetrics();
    v33 = (char **)&off_10002D9D8;
    v93 = v32;
    v94 = (char **)&off_10002D9D8;
    v90 = v30;
  }
  swift_release(v31);
  swift_release(v29);
  swift_release(v28);
  swift_release(v27);
  sub_100013D4C(&v90, v32);
  v34 = ((uint64_t (__cdecl *)())v33[11])();
  v35 = v87 & 1;
  v36 = Text.foregroundColor(_:)(v34, v21, v23, v87 & 1, v26);
  v84 = v37;
  v85 = v36;
  v79 = v38;
  v88 = v39;
  sub_100013F1C(v21, v23, v35);
  swift_release(v34);
  swift_bridgeObjectRelease(v26);
  sub_10000D714(&v90);
  v40 = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  v90 = *(char ***)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  v91 = v40;
  swift_bridgeObjectRetain(v40);
  v41 = Text.init<A>(_:)(&v90, &type metadata for String, v81);
  v43 = v42;
  v82 = v44;
  v46 = v45;
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v47 = v91;
  v48 = v92;
  v49 = v94;
  v50 = v95;
  v51 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v52 = type metadata accessor for ClusterMetrics();
      v53 = (char **)&off_10002D948;
      v93 = v52;
      v94 = (char **)&off_10002D948;
      v90 = v50;
    }
    else
    {
      v52 = type metadata accessor for WidgetMetrics();
      v53 = &off_10002D8B8;
      v93 = v52;
      v94 = &off_10002D8B8;
      v90 = v51;
      v51 = v50;
    }
    v50 = v49;
  }
  else
  {
    v52 = type metadata accessor for ConsoleMetrics();
    v53 = (char **)&off_10002D9D8;
    v93 = v52;
    v94 = (char **)&off_10002D9D8;
    v90 = v49;
  }
  swift_release(v51);
  swift_release(v50);
  swift_release(v48);
  swift_release(v47);
  sub_100013D4C(&v90, v52);
  v54 = ((uint64_t (__cdecl *)())v53[12])();
  v55 = v82 & 1;
  v56 = Text.font(_:)(v54, v41, v43, v82 & 1, v46);
  v58 = v57;
  v83 = v59;
  v61 = v60;
  sub_100013F1C(v41, v43, v55);
  swift_release(v54);
  swift_bridgeObjectRelease(v46);
  sub_10000D714(&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v62 = v91;
  v63 = v92;
  v64 = v94;
  v65 = v95;
  v66 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v67 = type metadata accessor for ClusterMetrics();
      v68 = (char **)&off_10002D948;
      v93 = v67;
      v94 = (char **)&off_10002D948;
      v90 = v65;
    }
    else
    {
      v67 = type metadata accessor for WidgetMetrics();
      v68 = &off_10002D8B8;
      v93 = v67;
      v94 = &off_10002D8B8;
      v90 = v66;
      v66 = v65;
    }
    v65 = v64;
  }
  else
  {
    v67 = type metadata accessor for ConsoleMetrics();
    v68 = (char **)&off_10002D9D8;
    v93 = v67;
    v94 = (char **)&off_10002D9D8;
    v90 = v64;
  }
  swift_release(v66);
  swift_release(v65);
  swift_release(v63);
  swift_release(v62);
  v69 = v83 & 1;
  sub_100013D4C(&v90, v67);
  v70 = ((uint64_t (__cdecl *)())v68[13])();
  v71 = Text.foregroundColor(_:)(v70, v56, v58, v69, v61);
  v73 = v72;
  v75 = v74;
  v77 = v76 & 1;
  sub_100013F1C(v56, v58, v69);
  swift_release(v70);
  swift_bridgeObjectRelease(v61);
  sub_10000D714(&v90);
  LOBYTE(v90) = v79 & 1;
  *(_QWORD *)a2 = v85;
  *(_QWORD *)(a2 + 8) = v84;
  *(_BYTE *)(a2 + 16) = v79 & 1;
  *(_QWORD *)(a2 + 24) = v88;
  *(_QWORD *)(a2 + 32) = v71;
  *(_QWORD *)(a2 + 40) = v73;
  *(_BYTE *)(a2 + 48) = v77;
  *(_QWORD *)(a2 + 56) = v75;
  sub_100013E3C(v85, v84, v79 & 1);
  swift_bridgeObjectRetain(v88);
  sub_100013E3C(v71, v73, v77);
  swift_bridgeObjectRetain(v75);
  sub_100013F1C(v71, v73, v77);
  swift_bridgeObjectRelease(v75);
  sub_100013F1C(v85, v84, (char)v90);
  return swift_bridgeObjectRelease(v88);
}

uint64_t sub_100010C74@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v14;
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
  char *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char **v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _OWORD v62[13];
  uint64_t v63;
  _OWORD v64[14];
  char v65;
  __int128 v66;
  _OWORD v67[14];
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[49];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[31];
  _OWORD v81[3];
  _OWORD v82[2];
  _OWORD v83[3];

  v60 = a2;
  v56 = type metadata accessor for Divider(0);
  v3 = *(_QWORD *)(v56 - 8);
  __chkstk_darwin(v56);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000064D4(&qword_100033370);
  __chkstk_darwin(v6);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000064D4(&qword_100033378);
  v59 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v58 = (uint64_t)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v57 = (uint64_t)&v54 - v12;
  v13 = sub_1000064D4(&qword_100033380);
  v14 = __chkstk_darwin(v13);
  v61 = (uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v54 - v17;
  v19 = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1)
  {
    v20 = Divider.init()(v16, 1);
    v21 = *(_QWORD *)(a1 + 88);
    v22 = static Alignment.center.getter(v20);
    _FrameLayout.init(width:height:alignment:)(v81, 0, 1, v21, 0, v22, v23);
    v24 = v56;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v56);
    v25 = &v8[*(int *)(v6 + 36)];
    v26 = v81[1];
    *(_OWORD *)v25 = v81[0];
    *((_OWORD *)v25 + 1) = v26;
    *((_OWORD *)v25 + 2) = v81[2];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v24);
    v27 = *(_OWORD *)(a1 + 16);
    v82[0] = *(_OWORD *)a1;
    v82[1] = v27;
    v83[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v83 + 9) = *(_OWORD *)(a1 + 41);
    sub_100013D10((uint64_t)v82, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)&v68);
    sub_100013D10((uint64_t)v82, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v55 = a1;
    v56 = v69;
    v54 = *(_QWORD *)v70;
    v28 = *(_QWORD *)&v70[16];
    v29 = *(_QWORD *)&v70[24];
    v30 = *(_QWORD *)&v70[32];
    if ((_BYTE)v68)
    {
      if (v68 == 1)
      {
        v31 = type metadata accessor for ClusterMetrics();
        v32 = (char **)&off_10002D948;
        *(_QWORD *)&v70[16] = &off_10002D948;
        *(_QWORD *)&v70[8] = v31;
        v68 = v29;
      }
      else
      {
        v31 = type metadata accessor for WidgetMetrics();
        v32 = &off_10002D8B8;
        *(_QWORD *)&v70[16] = &off_10002D8B8;
        *(_QWORD *)&v70[8] = v31;
        v68 = v30;
        v30 = v29;
      }
      v29 = v28;
    }
    else
    {
      v31 = type metadata accessor for ConsoleMetrics();
      v32 = (char **)&off_10002D9D8;
      *(_QWORD *)&v70[16] = &off_10002D9D8;
      *(_QWORD *)&v70[8] = v31;
      v68 = v28;
    }
    swift_release(v30);
    swift_release(v29);
    swift_release(v54);
    swift_release(v56);
    sub_100013D4C(&v68, v31);
    v33 = ((uint64_t (__cdecl *)())v32[13])();
    v34 = static Edge.Set.all.getter();
    v35 = (uint64_t)v8;
    v36 = (uint64_t)v8;
    v37 = v58;
    sub_1000142AC(v36, v58, &qword_100033370);
    v38 = v37 + *(int *)(v9 + 36);
    *(_QWORD *)v38 = v33;
    *(_BYTE *)(v38 + 8) = v34;
    sub_10000D68C(v35, &qword_100033370);
    sub_10000D714(&v68);
    v39 = v57;
    sub_100013F2C(v37, v57, &qword_100033378);
    sub_100013F2C(v39, (uint64_t)v18, &qword_100033378);
    v19 = 0;
    a1 = v55;
  }
  v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v18, v19, 1, v9);
  v41 = static VerticalAlignment.center.getter(v40);
  sub_100011248(a1, (uint64_t)v62);
  *(_OWORD *)((char *)&v64[10] + 7) = v62[10];
  *(_OWORD *)((char *)&v64[11] + 7) = v62[11];
  *(_OWORD *)((char *)&v64[12] + 7) = v62[12];
  *(_OWORD *)((char *)&v64[6] + 7) = v62[6];
  *(_OWORD *)((char *)&v64[7] + 7) = v62[7];
  *(_OWORD *)((char *)&v64[8] + 7) = v62[8];
  *(_OWORD *)((char *)&v64[9] + 7) = v62[9];
  *(_OWORD *)((char *)&v64[2] + 7) = v62[2];
  *(_OWORD *)((char *)&v64[3] + 7) = v62[3];
  *(_OWORD *)((char *)&v64[4] + 7) = v62[4];
  *(_OWORD *)((char *)&v64[5] + 7) = v62[5];
  *(_OWORD *)((char *)v64 + 7) = v62[0];
  v65 = 1;
  *(_QWORD *)((char *)&v64[13] + 7) = v63;
  *(_OWORD *)((char *)&v64[1] + 7) = v62[1];
  v42 = v61;
  sub_1000142AC((uint64_t)v18, v61, &qword_100033380);
  v43 = v60;
  *v60 = 0;
  *((_BYTE *)v43 + 8) = 1;
  v44 = sub_1000064D4(&qword_1000333B8);
  sub_1000142AC(v42, (uint64_t)v43 + *(int *)(v44 + 48), &qword_100033380);
  v45 = (_OWORD *)((char *)v43 + *(int *)(v44 + 64));
  v66 = (unint64_t)v41;
  LOBYTE(v67[0]) = 1;
  *(_OWORD *)((char *)&v67[10] + 1) = v64[10];
  *(_OWORD *)((char *)&v67[11] + 1) = v64[11];
  *(_OWORD *)((char *)&v67[12] + 1) = v64[12];
  v67[13] = *(_OWORD *)((char *)&v64[12] + 15);
  *(_OWORD *)((char *)&v67[6] + 1) = v64[6];
  *(_OWORD *)((char *)&v67[7] + 1) = v64[7];
  *(_OWORD *)((char *)&v67[8] + 1) = v64[8];
  *(_OWORD *)((char *)&v67[9] + 1) = v64[9];
  *(_OWORD *)((char *)&v67[2] + 1) = v64[2];
  *(_OWORD *)((char *)&v67[3] + 1) = v64[3];
  *(_OWORD *)((char *)&v67[4] + 1) = v64[4];
  *(_OWORD *)((char *)&v67[5] + 1) = v64[5];
  *(_OWORD *)((char *)v67 + 1) = v64[0];
  *(_OWORD *)((char *)&v67[1] + 1) = v64[1];
  v46 = v67[12];
  v45[12] = v67[11];
  v45[13] = v46;
  v45[14] = v67[13];
  v47 = v67[8];
  v45[8] = v67[7];
  v45[9] = v47;
  v48 = v67[10];
  v45[10] = v67[9];
  v45[11] = v48;
  v49 = v67[4];
  v45[4] = v67[3];
  v45[5] = v49;
  v50 = v67[6];
  v45[6] = v67[5];
  v45[7] = v50;
  v51 = v67[0];
  *v45 = v66;
  v45[1] = v51;
  v52 = v67[2];
  v45[2] = v67[1];
  v45[3] = v52;
  sub_100014118((uint64_t)&v66);
  sub_10000D68C((uint64_t)v18, &qword_100033380);
  v78 = v64[10];
  v79 = v64[11];
  *(_OWORD *)v80 = v64[12];
  *(_OWORD *)&v80[15] = *(_OWORD *)((char *)&v64[12] + 15);
  v74 = v64[6];
  v75 = v64[7];
  v76 = v64[8];
  v77 = v64[9];
  *(_OWORD *)&v70[33] = v64[2];
  v71 = v64[3];
  v72 = v64[4];
  v73 = v64[5];
  *(_OWORD *)&v70[1] = v64[0];
  v68 = v41;
  v69 = 0;
  v70[0] = 1;
  *(_OWORD *)&v70[17] = v64[1];
  sub_1000141E0((uint64_t)&v68);
  return sub_10000D68C(v42, &qword_100033380);
}

uint64_t *sub_100011248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char **v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char **v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char **v85;
  uint64_t v86;
  char v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char **v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  char v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v126;
  int v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  uint64_t KeyPath;
  uint64_t v141;
  uint64_t v142;
  char v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _DWORD v147[2];
  _DWORD v148[4];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[56];
  _BYTE v155[7];
  char v156;
  _BYTE v157[7];
  char v158;
  _BYTE v159[7];
  char v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  char v167;
  _BYTE v168[7];
  uint64_t v169;
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[3];
  uint64_t v175;
  char **v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _DWORD v180[2];
  _DWORD v181[2];
  _QWORD v182[3];
  uint64_t v183;
  char **v184;
  _BYTE v185[7];
  unsigned __int8 v186;
  _BYTE v187[7];
  _OWORD v188[2];
  _OWORD v189[3];

  v134 = a2;
  v3 = sub_1000064D4(&qword_100033390);
  __chkstk_darwin(v3);
  v5 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName);
  v7 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName + 8);
  swift_bridgeObjectRetain(v7);
  v142 = Image.init(automakerSymbolName:)(v6, v7);
  v8 = *(_OWORD *)(a1 + 16);
  v188[0] = *(_OWORD *)a1;
  v188[1] = v8;
  v189[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v189 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v9 = v162;
  v10 = v163;
  v11 = *((_QWORD *)&v165 + 1);
  v12 = v165;
  v13 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v14 = type metadata accessor for ClusterMetrics();
      v15 = (char **)&off_10002D948;
      v164 = v14;
      *(_QWORD *)&v165 = &off_10002D948;
      v161 = v11;
    }
    else
    {
      v14 = type metadata accessor for WidgetMetrics();
      v15 = &off_10002D8B8;
      v164 = v14;
      *(_QWORD *)&v165 = &off_10002D8B8;
      v161 = v13;
      v13 = v11;
    }
    v11 = v12;
  }
  else
  {
    v14 = type metadata accessor for ConsoleMetrics();
    v15 = (char **)&off_10002D9D8;
    v164 = v14;
    *(_QWORD *)&v165 = &off_10002D9D8;
    v161 = v12;
  }
  swift_release(v13);
  swift_release(v11);
  swift_release(v10);
  swift_release(v9);
  sub_100013D4C(&v161, v14);
  v16 = ((double (__cdecl *)())v15[7])();
  v17 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v141 = static Font.system(size:weight:design:)(0, 1, v5, v16);
  sub_10000D68C((uint64_t)v5, &qword_100033390);
  sub_10000D714(&v161);
  KeyPath = swift_getKeyPath(&unk_1000228B0);
  v139 = static Edge.Set.trailing.getter();
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v18 = v162;
  v19 = v163;
  v20 = *((_QWORD *)&v165 + 1);
  v21 = v165;
  v22 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v23 = type metadata accessor for ClusterMetrics();
      v24 = (char **)&off_10002D948;
      v164 = v23;
      *(_QWORD *)&v165 = &off_10002D948;
      v161 = v20;
    }
    else
    {
      v23 = type metadata accessor for WidgetMetrics();
      v24 = &off_10002D8B8;
      v164 = v23;
      *(_QWORD *)&v165 = &off_10002D8B8;
      v161 = v22;
      v22 = v20;
    }
    v20 = v21;
  }
  else
  {
    v23 = type metadata accessor for ConsoleMetrics();
    v24 = (char **)&off_10002D9D8;
    v164 = v23;
    *(_QWORD *)&v165 = &off_10002D9D8;
    v161 = v21;
  }
  swift_release(v22);
  swift_release(v20);
  swift_release(v19);
  swift_release(v18);
  sub_100013D4C(&v161, v23);
  v138 = ((uint64_t (__cdecl *)())v24[6])();
  v137 = swift_getKeyPath(&unk_1000228E0);
  sub_10000D714(&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v25 = v162;
  v26 = v163;
  v27 = *((_QWORD *)&v165 + 1);
  v28 = v165;
  v29 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v30 = type metadata accessor for ClusterMetrics();
      v31 = (char **)&off_10002D948;
      v183 = v30;
      v184 = (char **)&off_10002D948;
      v182[0] = v27;
    }
    else
    {
      v30 = type metadata accessor for WidgetMetrics();
      v31 = &off_10002D8B8;
      v183 = v30;
      v184 = &off_10002D8B8;
      v182[0] = v29;
      v29 = v27;
    }
    v27 = v28;
  }
  else
  {
    v30 = type metadata accessor for ConsoleMetrics();
    v31 = (char **)&off_10002D9D8;
    v183 = v30;
    v184 = (char **)&off_10002D9D8;
    v182[0] = v28;
  }
  swift_release(v29);
  swift_release(v27);
  swift_release(v26);
  swift_release(v25);
  sub_100013D4C(v182, v30);
  v32 = ((double (__cdecl *)())v31[5])();
  v34 = static Alignment.center.getter(v33);
  _FrameLayout.init(width:height:alignment:)(&v177, *(_QWORD *)&v32, 0, 0, 1, v34, v35);
  v186 = 1;
  sub_10000D714(v182);
  v181[0] = *(_DWORD *)v187;
  *(_DWORD *)((char *)v181 + 3) = *(_DWORD *)&v187[3];
  v136 = v186;
  v180[0] = *(_DWORD *)v185;
  *(_DWORD *)((char *)v180 + 3) = *(_DWORD *)&v185[3];
  v36 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  v161 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  v162 = v36;
  v37 = sub_1000140D4();
  swift_bridgeObjectRetain(v36);
  v129 = v37;
  v133 = Text.init<A>(_:)(&v161, &type metadata for String, v37);
  v39 = v38;
  LODWORD(v132) = v40;
  v42 = v41;
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v43 = v162;
  v44 = v163;
  v46 = *((_QWORD *)&v165 + 1);
  v45 = v165;
  v47 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v48 = type metadata accessor for ClusterMetrics();
      v49 = (char **)&off_10002D948;
      v164 = v48;
      *(_QWORD *)&v165 = &off_10002D948;
      v161 = v46;
    }
    else
    {
      v48 = type metadata accessor for WidgetMetrics();
      v49 = &off_10002D8B8;
      v164 = v48;
      *(_QWORD *)&v165 = &off_10002D8B8;
      v161 = v47;
      v47 = v46;
    }
    v46 = v45;
  }
  else
  {
    v48 = type metadata accessor for ConsoleMetrics();
    v49 = (char **)&off_10002D9D8;
    v164 = v48;
    *(_QWORD *)&v165 = &off_10002D9D8;
    v161 = v45;
  }
  swift_release(v47);
  swift_release(v46);
  swift_release(v44);
  swift_release(v43);
  sub_100013D4C(&v161, v48);
  v50 = ((uint64_t (__cdecl *)())v49[10])();
  v51 = v132 & 1;
  v52 = v133;
  v128 = Text.font(_:)(v50, v133, v39, v132 & 1, v42);
  v54 = v53;
  LODWORD(v132) = v55;
  v56 = v42;
  v58 = v57;
  sub_100013F1C(v52, v39, v51);
  swift_release(v50);
  swift_bridgeObjectRelease(v56);
  sub_10000D714(&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v59 = v162;
  v60 = v163;
  v61 = *((_QWORD *)&v165 + 1);
  v62 = v165;
  v63 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v64 = type metadata accessor for ClusterMetrics();
      v65 = (char **)&off_10002D948;
      v164 = v64;
      *(_QWORD *)&v165 = &off_10002D948;
      v161 = v61;
    }
    else
    {
      v64 = type metadata accessor for WidgetMetrics();
      v65 = &off_10002D8B8;
      v164 = v64;
      *(_QWORD *)&v165 = &off_10002D8B8;
      v161 = v63;
      v63 = v61;
    }
    v61 = v62;
  }
  else
  {
    v64 = type metadata accessor for ConsoleMetrics();
    v65 = (char **)&off_10002D9D8;
    v164 = v64;
    *(_QWORD *)&v165 = &off_10002D9D8;
    v161 = v62;
  }
  swift_release(v63);
  swift_release(v61);
  swift_release(v60);
  swift_release(v59);
  sub_100013D4C(&v161, v64);
  v66 = ((uint64_t (__cdecl *)())v65[11])();
  v67 = v132 & 1;
  v68 = v128;
  v69 = Text.foregroundColor(_:)(v66, v128, v54, v132 & 1, v58);
  v131 = v70;
  v132 = v69;
  LODWORD(v130) = v71;
  v133 = v72;
  sub_100013F1C(v68, v54, v67);
  swift_release(v66);
  swift_bridgeObjectRelease(v58);
  sub_10000D714(&v161);
  v73 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  v161 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  v162 = v73;
  swift_bridgeObjectRetain(v73);
  v74 = Text.init<A>(_:)(&v161, &type metadata for String, v129);
  v76 = v75;
  LODWORD(v135) = v77;
  v129 = v78;
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v79 = v162;
  v80 = v163;
  v82 = *((_QWORD *)&v165 + 1);
  v81 = v165;
  v83 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v84 = type metadata accessor for ClusterMetrics();
      v85 = (char **)&off_10002D948;
      v164 = v84;
      *(_QWORD *)&v165 = &off_10002D948;
      v161 = v82;
    }
    else
    {
      v84 = type metadata accessor for WidgetMetrics();
      v85 = &off_10002D8B8;
      v164 = v84;
      *(_QWORD *)&v165 = &off_10002D8B8;
      v161 = v83;
      v83 = v82;
    }
    v82 = v81;
  }
  else
  {
    v84 = type metadata accessor for ConsoleMetrics();
    v85 = (char **)&off_10002D9D8;
    v164 = v84;
    *(_QWORD *)&v165 = &off_10002D9D8;
    v161 = v81;
  }
  swift_release(v83);
  swift_release(v82);
  swift_release(v80);
  swift_release(v79);
  sub_100013D4C(&v161, v84);
  v86 = ((uint64_t (__cdecl *)())v85[12])();
  v87 = v135 & 1;
  v88 = v129;
  v89 = Text.font(_:)(v86, v74, v76, v135 & 1, v129);
  v128 = v90;
  v127 = v91;
  v135 = v92;
  sub_100013F1C(v74, v76, v87);
  swift_release(v86);
  swift_bridgeObjectRelease(v88);
  sub_10000D714(&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v161);
  sub_100013D10((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v93 = v162;
  v94 = v163;
  v96 = *((_QWORD *)&v165 + 1);
  v95 = v165;
  v97 = v166;
  if ((_BYTE)v161)
  {
    if (v161 == 1)
    {
      v98 = type metadata accessor for ClusterMetrics();
      v99 = (char **)&off_10002D948;
      v176 = (char **)&off_10002D948;
      v175 = v98;
      v174[0] = v96;
    }
    else
    {
      v98 = type metadata accessor for WidgetMetrics();
      v99 = &off_10002D8B8;
      v176 = &off_10002D8B8;
      v175 = v98;
      v174[0] = v97;
      v97 = v96;
    }
    v96 = v95;
  }
  else
  {
    v98 = type metadata accessor for ConsoleMetrics();
    v99 = (char **)&off_10002D9D8;
    v176 = (char **)&off_10002D9D8;
    v175 = v98;
    v174[0] = v95;
  }
  swift_release(v97);
  swift_release(v96);
  swift_release(v94);
  swift_release(v93);
  v100 = v127 & 1;
  v101 = v130 & 1;
  sub_100013D4C(v174, v98);
  v102 = ((uint64_t (__cdecl *)())v99[13])();
  v103 = v89;
  v104 = v89;
  v105 = v128;
  v106 = v135;
  v107 = Text.foregroundColor(_:)(v102, v103, v128, v100, v135);
  v109 = v108;
  v130 = v110;
  v112 = v111 & 1;
  sub_100013F1C(v104, v105, v100);
  swift_release(v102);
  swift_bridgeObjectRelease(v106);
  sub_10000D714(v174);
  v148[0] = v181[0];
  *(_DWORD *)((char *)v148 + 3) = *(_DWORD *)((char *)v181 + 3);
  v147[0] = v180[0];
  *(_DWORD *)((char *)v147 + 3) = *(_DWORD *)((char *)v180 + 3);
  v144 = v177;
  v145 = v178;
  v146 = v179;
  v143 = v101;
  *(_QWORD *)&v149 = v142;
  *((_QWORD *)&v149 + 1) = KeyPath;
  *(_QWORD *)&v150 = v141;
  BYTE8(v150) = v139;
  HIDWORD(v150) = *(_DWORD *)((char *)v181 + 3);
  *(_DWORD *)((char *)&v150 + 9) = v181[0];
  v152 = 0u;
  v151 = 0u;
  LOBYTE(v153) = v136;
  DWORD1(v153) = *(_DWORD *)((char *)v180 + 3);
  *(_DWORD *)((char *)&v153 + 1) = v180[0];
  *((_QWORD *)&v153 + 1) = v137;
  *(_QWORD *)v154 = v138;
  *(_OWORD *)&v154[40] = v179;
  *(_OWORD *)&v154[24] = v178;
  *(_OWORD *)&v154[8] = v177;
  v113 = v149;
  v114 = v150;
  v115 = v134;
  *(_OWORD *)(v134 + 32) = 0u;
  *(_OWORD *)(v115 + 48) = 0u;
  *(_OWORD *)v115 = v113;
  *(_OWORD *)(v115 + 16) = v114;
  v116 = v153;
  v117 = *(_OWORD *)v154;
  v118 = *(_OWORD *)&v154[32];
  v119 = *(_QWORD *)&v154[48];
  *(_OWORD *)(v115 + 96) = *(_OWORD *)&v154[16];
  *(_OWORD *)(v115 + 112) = v118;
  *(_OWORD *)(v115 + 64) = v116;
  *(_OWORD *)(v115 + 80) = v117;
  v160 = v101;
  v158 = 1;
  v156 = v112;
  *(_DWORD *)(v115 + 153) = *(_DWORD *)v159;
  *(_DWORD *)(v115 + 156) = *(_DWORD *)&v159[3];
  v120 = v158;
  *(_DWORD *)(v115 + 177) = *(_DWORD *)v157;
  *(_DWORD *)(v115 + 180) = *(_DWORD *)&v157[3];
  *(_DWORD *)(v115 + 201) = *(_DWORD *)v155;
  *(_DWORD *)(v115 + 204) = *(_DWORD *)&v155[3];
  v122 = v131;
  v121 = v132;
  *(_QWORD *)(v115 + 128) = v119;
  *(_QWORD *)(v115 + 136) = v121;
  *(_QWORD *)(v115 + 144) = v122;
  *(_BYTE *)(v115 + 152) = v101;
  v123 = v133;
  *(_QWORD *)(v115 + 160) = v133;
  *(_QWORD *)(v115 + 168) = 0;
  *(_BYTE *)(v115 + 176) = v120;
  *(_QWORD *)(v115 + 184) = v107;
  *(_QWORD *)(v115 + 192) = v109;
  *(_BYTE *)(v115 + 200) = v112;
  v124 = v130;
  *(_QWORD *)(v115 + 208) = v130;
  sub_100014010((uint64_t *)&v149);
  sub_100013E3C(v121, v122, v101);
  swift_bridgeObjectRetain(v123);
  sub_100013E3C(v107, v109, v112);
  swift_bridgeObjectRetain(v124);
  sub_100013F1C(v107, v109, v112);
  swift_bridgeObjectRelease(v124);
  sub_100013F1C(v121, v122, v143);
  swift_bridgeObjectRelease(v123);
  v161 = v142;
  v162 = KeyPath;
  v163 = v141;
  LOBYTE(v164) = v139;
  *(_DWORD *)((char *)&v164 + 1) = v148[0];
  HIDWORD(v164) = *(_DWORD *)((char *)v148 + 3);
  v165 = 0u;
  v166 = 0u;
  v167 = v136;
  *(_DWORD *)v168 = v147[0];
  *(_DWORD *)&v168[3] = *(_DWORD *)((char *)v147 + 3);
  v169 = v137;
  v170 = v138;
  v173 = v146;
  v172 = v145;
  v171 = v144;
  return sub_100014070(&v161);
}

uint64_t sub_100011F34@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  char *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  char **v32;
  char **v33;
  uint64_t v34;
  uint64_t v35;
  char **v36;
  uint64_t v37;
  char v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;
  char **v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char **v62;
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char **v71;
  char **v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  _OWORD v77[3];
  _OWORD v78[2];
  _OWORD v79[2];

  v64 = a2;
  v3 = type metadata accessor for Divider(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000064D4(&qword_100033370);
  __chkstk_darwin(v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000064D4(&qword_100033378);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v59 - v15;
  v17 = sub_1000064D4(&qword_100033380);
  v18 = __chkstk_darwin(v17);
  v66 = (uint64_t)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v59 - v21;
  v23 = 1;
  v24 = *(_BYTE *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) == 1;
  v65 = (uint64_t)&v59 - v21;
  if (v24)
  {
    v63 = v16;
    v25 = Divider.init()(v20, 1);
    v26 = *(_QWORD *)(a1 + 88);
    v27 = static Alignment.center.getter(v25);
    _FrameLayout.init(width:height:alignment:)(v77, 0, 1, v26, 0, v27, v28);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    v29 = &v9[*(int *)(v7 + 36)];
    v30 = v77[1];
    *(_OWORD *)v29 = v77[0];
    *((_OWORD *)v29 + 1) = v30;
    *((_OWORD *)v29 + 2) = v77[2];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v31 = *(_OWORD *)(a1 + 16);
    v78[0] = *(_OWORD *)a1;
    v78[1] = v31;
    v79[0] = *(_OWORD *)(a1 + 32);
    *(_OWORD *)((char *)v79 + 9) = *(_OWORD *)(a1 + 41);
    sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)&v67);
    sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v62 = (char **)v68;
    v61 = v69;
    v33 = v71;
    v32 = v72;
    v34 = v73;
    if ((_BYTE)v67)
    {
      if (v67 == 1)
      {
        v35 = type metadata accessor for ClusterMetrics();
        v36 = (char **)&off_10002D948;
        v71 = (char **)&off_10002D948;
        v70 = v35;
        v67 = (uint64_t)v32;
      }
      else
      {
        v35 = type metadata accessor for WidgetMetrics();
        v36 = &off_10002D8B8;
        v71 = &off_10002D8B8;
        v70 = v35;
        v67 = v34;
        v34 = (uint64_t)v32;
      }
      v32 = v33;
    }
    else
    {
      v35 = type metadata accessor for ConsoleMetrics();
      v36 = (char **)&off_10002D9D8;
      v71 = (char **)&off_10002D9D8;
      v70 = v35;
      v67 = (uint64_t)v33;
    }
    swift_release(v34);
    swift_release(v32);
    swift_release(v61);
    swift_release(v62);
    sub_100013D4C(&v67, v35);
    v37 = ((uint64_t (__cdecl *)())v36[13])();
    v38 = static Edge.Set.all.getter();
    sub_1000142AC((uint64_t)v9, (uint64_t)v14, &qword_100033370);
    v39 = &v14[*(int *)(v10 + 36)];
    *(_QWORD *)v39 = v37;
    v39[8] = v38;
    sub_10000D68C((uint64_t)v9, &qword_100033370);
    sub_10000D714(&v67);
    v40 = (uint64_t)v63;
    sub_100013F2C((uint64_t)v14, (uint64_t)v63, &qword_100033378);
    v41 = v40;
    v42 = v65;
    sub_100013F2C(v41, v65, &qword_100033378);
    v22 = (char *)v42;
    v23 = 0;
  }
  v43 = (uint64_t)v22;
  v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v22, v23, 1, v10);
  v63 = (char *)static VerticalAlignment.center.getter(v44);
  sub_1000124C8(a1, (uint64_t)&v67);
  v45 = v67;
  v46 = v68;
  v47 = v69;
  v48 = v70;
  v62 = v71;
  LODWORD(v61) = v72;
  v49 = v73;
  v50 = v74;
  v51 = v75;
  v60 = v76;
  v52 = v66;
  sub_1000142AC(v43, v66, &qword_100033380);
  v53 = v64;
  *v64 = 0;
  *((_BYTE *)v53 + 8) = 1;
  v54 = sub_1000064D4(&qword_1000333C8);
  sub_1000142AC(v52, (uint64_t)v53 + *(int *)(v54 + 48), &qword_100033380);
  v55 = (char *)v53 + *(int *)(v54 + 64);
  *(_QWORD *)v55 = v63;
  *((_QWORD *)v55 + 1) = 0;
  v55[16] = 1;
  *((_QWORD *)v55 + 3) = v45;
  *((_QWORD *)v55 + 4) = v46;
  v55[40] = v47;
  v56 = v62;
  *((_QWORD *)v55 + 6) = v48;
  *((_QWORD *)v55 + 7) = v56;
  v55[64] = v61;
  *((_QWORD *)v55 + 9) = v49;
  *((_QWORD *)v55 + 10) = v50;
  v55[88] = v51;
  v57 = v60;
  *((_QWORD *)v55 + 12) = v60;
  sub_100013E3C(v45, v46, v47);
  swift_bridgeObjectRetain(v48);
  sub_100013E3C(v49, v50, v51);
  swift_bridgeObjectRetain(v57);
  sub_10000D68C(v65, &qword_100033380);
  sub_100013F1C(v45, v46, v47);
  swift_bridgeObjectRelease(v48);
  sub_100013F1C(v49, v50, v51);
  swift_bridgeObjectRelease(v57);
  return sub_10000D68C(v66, &qword_100033380);
}

uint64_t sub_1000124C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  char **v15;
  char **v16;
  uint64_t v17;
  char **v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  char **v30;
  char **v31;
  uint64_t v32;
  char **v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  char **v50;
  char **v51;
  uint64_t v52;
  char **v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char **v64;
  char **v65;
  char **v66;
  uint64_t v67;
  char **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  char v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  char v87;
  uint64_t v88;
  char **v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char **v94;
  char **v95;
  char **v96;
  _OWORD v97[2];
  _OWORD v98[3];

  v80 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  *(_QWORD *)&v97[0] = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  *((_QWORD *)&v97[0] + 1) = v3;
  v4 = sub_1000140D4();
  swift_bridgeObjectRetain(v3);
  v81 = v4;
  v5 = Text.init<A>(_:)(v97, &type metadata for String, v4);
  v7 = v6;
  v86 = v8;
  v10 = v9;
  v11 = *(_OWORD *)(a1 + 16);
  v97[0] = *(_OWORD *)a1;
  v97[1] = v11;
  v98[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v98 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v12 = v91;
  v13 = v92;
  v14 = v94;
  v15 = v95;
  v16 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v17 = type metadata accessor for ClusterMetrics();
      v18 = (char **)&off_10002D948;
      v93 = v17;
      v94 = (char **)&off_10002D948;
      v90 = v15;
    }
    else
    {
      v17 = type metadata accessor for WidgetMetrics();
      v18 = &off_10002D8B8;
      v93 = v17;
      v94 = &off_10002D8B8;
      v90 = v16;
      v16 = v15;
    }
    v15 = v14;
  }
  else
  {
    v17 = type metadata accessor for ConsoleMetrics();
    v18 = (char **)&off_10002D9D8;
    v93 = v17;
    v94 = (char **)&off_10002D9D8;
    v90 = v14;
  }
  swift_release(v16);
  swift_release(v15);
  swift_release(v13);
  swift_release(v12);
  sub_100013D4C(&v90, v17);
  v19 = ((uint64_t (__cdecl *)())v18[10])();
  v20 = v86 & 1;
  v21 = Text.font(_:)(v19, v5, v7, v86 & 1, v10);
  v23 = v22;
  v87 = v24;
  v26 = v25;
  sub_100013F1C(v5, v7, v20);
  swift_release(v19);
  swift_bridgeObjectRelease(v10);
  sub_10000D714(&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v27 = v91;
  v28 = v92;
  v29 = v94;
  v30 = v95;
  v31 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v32 = type metadata accessor for ClusterMetrics();
      v33 = (char **)&off_10002D948;
      v93 = v32;
      v94 = (char **)&off_10002D948;
      v90 = v30;
    }
    else
    {
      v32 = type metadata accessor for WidgetMetrics();
      v33 = &off_10002D8B8;
      v93 = v32;
      v94 = &off_10002D8B8;
      v90 = v31;
      v31 = v30;
    }
    v30 = v29;
  }
  else
  {
    v32 = type metadata accessor for ConsoleMetrics();
    v33 = (char **)&off_10002D9D8;
    v93 = v32;
    v94 = (char **)&off_10002D9D8;
    v90 = v29;
  }
  swift_release(v31);
  swift_release(v30);
  swift_release(v28);
  swift_release(v27);
  sub_100013D4C(&v90, v32);
  v34 = ((uint64_t (__cdecl *)())v33[11])();
  v35 = v87 & 1;
  v36 = Text.foregroundColor(_:)(v34, v21, v23, v87 & 1, v26);
  v84 = v37;
  v85 = v36;
  v79 = v38;
  v88 = v39;
  sub_100013F1C(v21, v23, v35);
  swift_release(v34);
  swift_bridgeObjectRelease(v26);
  sub_10000D714(&v90);
  v40 = *(_QWORD *)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  v90 = *(char ***)(v80 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  v91 = v40;
  swift_bridgeObjectRetain(v40);
  v41 = Text.init<A>(_:)(&v90, &type metadata for String, v81);
  v43 = v42;
  v82 = v44;
  v46 = v45;
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v47 = v91;
  v48 = v92;
  v49 = v94;
  v50 = v95;
  v51 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v52 = type metadata accessor for ClusterMetrics();
      v53 = (char **)&off_10002D948;
      v93 = v52;
      v94 = (char **)&off_10002D948;
      v90 = v50;
    }
    else
    {
      v52 = type metadata accessor for WidgetMetrics();
      v53 = &off_10002D8B8;
      v93 = v52;
      v94 = &off_10002D8B8;
      v90 = v51;
      v51 = v50;
    }
    v50 = v49;
  }
  else
  {
    v52 = type metadata accessor for ConsoleMetrics();
    v53 = (char **)&off_10002D9D8;
    v93 = v52;
    v94 = (char **)&off_10002D9D8;
    v90 = v49;
  }
  swift_release(v51);
  swift_release(v50);
  swift_release(v48);
  swift_release(v47);
  sub_100013D4C(&v90, v52);
  v54 = ((uint64_t (__cdecl *)())v53[12])();
  v55 = v82 & 1;
  v56 = Text.font(_:)(v54, v41, v43, v82 & 1, v46);
  v58 = v57;
  v83 = v59;
  v61 = v60;
  sub_100013F1C(v41, v43, v55);
  swift_release(v54);
  swift_bridgeObjectRelease(v46);
  sub_10000D714(&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v90);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v62 = v91;
  v63 = v92;
  v64 = v94;
  v65 = v95;
  v66 = v96;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      v67 = type metadata accessor for ClusterMetrics();
      v68 = (char **)&off_10002D948;
      v93 = v67;
      v94 = (char **)&off_10002D948;
      v90 = v65;
    }
    else
    {
      v67 = type metadata accessor for WidgetMetrics();
      v68 = &off_10002D8B8;
      v93 = v67;
      v94 = &off_10002D8B8;
      v90 = v66;
      v66 = v65;
    }
    v65 = v64;
  }
  else
  {
    v67 = type metadata accessor for ConsoleMetrics();
    v68 = (char **)&off_10002D9D8;
    v93 = v67;
    v94 = (char **)&off_10002D9D8;
    v90 = v64;
  }
  swift_release(v66);
  swift_release(v65);
  swift_release(v63);
  swift_release(v62);
  v69 = v83 & 1;
  sub_100013D4C(&v90, v67);
  v70 = ((uint64_t (__cdecl *)())v68[13])();
  v71 = Text.foregroundColor(_:)(v70, v56, v58, v69, v61);
  v73 = v72;
  v75 = v74;
  v77 = v76 & 1;
  sub_100013F1C(v56, v58, v69);
  swift_release(v70);
  swift_bridgeObjectRelease(v61);
  sub_10000D714(&v90);
  LOBYTE(v90) = v79 & 1;
  *(_QWORD *)a2 = v85;
  *(_QWORD *)(a2 + 8) = v84;
  *(_BYTE *)(a2 + 16) = v79 & 1;
  *(_QWORD *)(a2 + 24) = v88;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v71;
  *(_QWORD *)(a2 + 56) = v73;
  *(_BYTE *)(a2 + 64) = v77;
  *(_QWORD *)(a2 + 72) = v75;
  sub_100013E3C(v85, v84, v79 & 1);
  swift_bridgeObjectRetain(v88);
  sub_100013E3C(v71, v73, v77);
  swift_bridgeObjectRetain(v75);
  sub_100013F1C(v71, v73, v77);
  swift_bridgeObjectRelease(v75);
  sub_100013F1C(v85, v84, (char)v90);
  return swift_bridgeObjectRelease(v88);
}

uint64_t *sub_100012B64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char **v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char **v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char **v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char **v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char **v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  char v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  uint64_t KeyPath;
  uint64_t v141;
  uint64_t v142;
  char v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _DWORD v147[2];
  _DWORD v148[4];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[56];
  _BYTE v155[7];
  char v156;
  _BYTE v157[7];
  char v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  char v165;
  _BYTE v166[7];
  uint64_t v167;
  uint64_t v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD v172[3];
  uint64_t v173;
  char **v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _DWORD v178[2];
  _DWORD v179[2];
  _QWORD v180[3];
  uint64_t v181;
  char **v182;
  _BYTE v183[7];
  unsigned __int8 v184;
  _BYTE v185[7];
  _OWORD v186[2];
  _OWORD v187[3];

  v134 = a2;
  v3 = sub_1000064D4(&qword_100033390);
  __chkstk_darwin(v3);
  v5 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName);
  v7 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName + 8);
  swift_bridgeObjectRetain(v7);
  v142 = Image.init(systemName:)(v6, v7);
  v8 = *(_OWORD *)(a1 + 16);
  v186[0] = *(_OWORD *)a1;
  v186[1] = v8;
  v187[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v187 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v9 = v160;
  v10 = v161;
  v12 = *((_QWORD *)&v163 + 1);
  v11 = v163;
  v13 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v14 = type metadata accessor for ClusterMetrics();
      v15 = (char **)&off_10002D948;
      v162 = v14;
      *(_QWORD *)&v163 = &off_10002D948;
      v159 = v12;
    }
    else
    {
      v14 = type metadata accessor for WidgetMetrics();
      v15 = &off_10002D8B8;
      v162 = v14;
      *(_QWORD *)&v163 = &off_10002D8B8;
      v159 = v13;
      v13 = v12;
    }
    v12 = v11;
  }
  else
  {
    v14 = type metadata accessor for ConsoleMetrics();
    v15 = (char **)&off_10002D9D8;
    v162 = v14;
    *(_QWORD *)&v163 = &off_10002D9D8;
    v159 = v11;
  }
  swift_release(v13);
  swift_release(v12);
  swift_release(v10);
  swift_release(v9);
  sub_100013D4C(&v159, v14);
  v16 = ((double (__cdecl *)())v15[17])();
  v17 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v141 = static Font.system(size:weight:design:)(0, 1, v5, v16);
  sub_10000D68C((uint64_t)v5, &qword_100033390);
  sub_10000D714(&v159);
  KeyPath = swift_getKeyPath(&unk_1000228B0);
  v139 = static Edge.Set.trailing.getter();
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v18 = v160;
  v19 = v161;
  v21 = *((_QWORD *)&v163 + 1);
  v20 = v163;
  v22 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v23 = type metadata accessor for ClusterMetrics();
      v24 = (char **)&off_10002D948;
      v162 = v23;
      *(_QWORD *)&v163 = &off_10002D948;
      v159 = v21;
    }
    else
    {
      v23 = type metadata accessor for WidgetMetrics();
      v24 = &off_10002D8B8;
      v162 = v23;
      *(_QWORD *)&v163 = &off_10002D8B8;
      v159 = v22;
      v22 = v21;
    }
    v21 = v20;
  }
  else
  {
    v23 = type metadata accessor for ConsoleMetrics();
    v24 = (char **)&off_10002D9D8;
    v162 = v23;
    *(_QWORD *)&v163 = &off_10002D9D8;
    v159 = v20;
  }
  swift_release(v22);
  swift_release(v21);
  swift_release(v19);
  swift_release(v18);
  sub_100013D4C(&v159, v23);
  v138 = ((uint64_t (__cdecl *)())v24[6])();
  v137 = swift_getKeyPath(&unk_1000228E0);
  sub_10000D714(&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v25 = v160;
  v26 = v161;
  v28 = *((_QWORD *)&v163 + 1);
  v27 = v163;
  v29 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v30 = type metadata accessor for ClusterMetrics();
      v31 = (char **)&off_10002D948;
      v181 = v30;
      v182 = (char **)&off_10002D948;
      v180[0] = v28;
    }
    else
    {
      v30 = type metadata accessor for WidgetMetrics();
      v31 = &off_10002D8B8;
      v181 = v30;
      v182 = &off_10002D8B8;
      v180[0] = v29;
      v29 = v28;
    }
    v28 = v27;
  }
  else
  {
    v30 = type metadata accessor for ConsoleMetrics();
    v31 = (char **)&off_10002D9D8;
    v181 = v30;
    v182 = (char **)&off_10002D9D8;
    v180[0] = v27;
  }
  swift_release(v29);
  swift_release(v28);
  swift_release(v26);
  swift_release(v25);
  sub_100013D4C(v180, v30);
  v32 = ((double (__cdecl *)())v31[5])();
  v34 = static Alignment.center.getter(v33);
  _FrameLayout.init(width:height:alignment:)(&v175, *(_QWORD *)&v32, 0, 0, 1, v34, v35);
  v184 = 1;
  sub_10000D714(v180);
  v179[0] = *(_DWORD *)v185;
  *(_DWORD *)((char *)v179 + 3) = *(_DWORD *)&v185[3];
  v136 = v184;
  v178[0] = *(_DWORD *)v183;
  *(_DWORD *)((char *)v178 + 3) = *(_DWORD *)&v183[3];
  v36 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8);
  v159 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  v160 = v36;
  v37 = sub_1000140D4();
  swift_bridgeObjectRetain(v36);
  v130 = v37;
  v38 = Text.init<A>(_:)(&v159, &type metadata for String, v37);
  v40 = v39;
  LODWORD(v132) = v41;
  v133 = v42;
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v43 = v160;
  v44 = v161;
  v46 = *((_QWORD *)&v163 + 1);
  v45 = v163;
  v47 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v48 = type metadata accessor for ClusterMetrics();
      v49 = (char **)&off_10002D948;
      v162 = v48;
      *(_QWORD *)&v163 = &off_10002D948;
      v159 = v46;
    }
    else
    {
      v48 = type metadata accessor for WidgetMetrics();
      v49 = &off_10002D8B8;
      v162 = v48;
      *(_QWORD *)&v163 = &off_10002D8B8;
      v159 = v47;
      v47 = v46;
    }
    v46 = v45;
  }
  else
  {
    v48 = type metadata accessor for ConsoleMetrics();
    v49 = (char **)&off_10002D9D8;
    v162 = v48;
    *(_QWORD *)&v163 = &off_10002D9D8;
    v159 = v45;
  }
  swift_release(v47);
  swift_release(v46);
  swift_release(v44);
  swift_release(v43);
  sub_100013D4C(&v159, v48);
  v50 = ((uint64_t (*)(uint64_t, uint64_t))v49[15])(v48, (uint64_t)v49);
  v51 = v132 & 1;
  v52 = v133;
  v53 = Text.font(_:)(v50, v38, v40, v132 & 1, v133);
  v55 = v54;
  LODWORD(v132) = v56;
  v128 = v57;
  sub_100013F1C(v38, v40, v51);
  swift_release(v50);
  swift_bridgeObjectRelease(v52);
  sub_10000D714(&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v58 = v160;
  v59 = v161;
  v61 = *((_QWORD *)&v163 + 1);
  v60 = v163;
  v62 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v63 = type metadata accessor for ClusterMetrics();
      v64 = (char **)&off_10002D948;
      v162 = v63;
      *(_QWORD *)&v163 = &off_10002D948;
      v159 = v61;
    }
    else
    {
      v63 = type metadata accessor for WidgetMetrics();
      v64 = &off_10002D8B8;
      v162 = v63;
      *(_QWORD *)&v163 = &off_10002D8B8;
      v159 = v62;
      v62 = v61;
    }
    v61 = v60;
  }
  else
  {
    v63 = type metadata accessor for ConsoleMetrics();
    v64 = (char **)&off_10002D9D8;
    v162 = v63;
    *(_QWORD *)&v163 = &off_10002D9D8;
    v159 = v60;
  }
  swift_release(v62);
  swift_release(v61);
  swift_release(v59);
  swift_release(v58);
  sub_100013D4C(&v159, v63);
  v65 = ((uint64_t (__cdecl *)())v64[11])();
  v66 = v132 & 1;
  v67 = v128;
  v68 = Text.foregroundColor(_:)(v65, v53, v55, v132 & 1, v128);
  v131 = v69;
  v132 = v68;
  LODWORD(v129) = v70;
  v133 = v71;
  sub_100013F1C(v53, v55, v66);
  swift_release(v65);
  swift_bridgeObjectRelease(v67);
  sub_10000D714(&v159);
  v72 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
  v159 = *(_QWORD *)(v135 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  v160 = v72;
  swift_bridgeObjectRetain(v72);
  v73 = Text.init<A>(_:)(&v159, &type metadata for String, v130);
  v75 = v74;
  LODWORD(v130) = v76;
  v135 = v77;
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v78 = v160;
  v79 = v161;
  v81 = *((_QWORD *)&v163 + 1);
  v80 = v163;
  v82 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v83 = type metadata accessor for ClusterMetrics();
      v84 = (char **)&off_10002D948;
      v162 = v83;
      *(_QWORD *)&v163 = &off_10002D948;
      v159 = v81;
    }
    else
    {
      v83 = type metadata accessor for WidgetMetrics();
      v84 = &off_10002D8B8;
      v162 = v83;
      *(_QWORD *)&v163 = &off_10002D8B8;
      v159 = v82;
      v82 = v81;
    }
    v81 = v80;
  }
  else
  {
    v83 = type metadata accessor for ConsoleMetrics();
    v84 = (char **)&off_10002D9D8;
    v162 = v83;
    *(_QWORD *)&v163 = &off_10002D9D8;
    v159 = v80;
  }
  swift_release(v82);
  swift_release(v81);
  swift_release(v79);
  swift_release(v78);
  sub_100013D4C(&v159, v83);
  v85 = ((uint64_t (*)(uint64_t, uint64_t))v84[16])(v83, (uint64_t)v84);
  v86 = v130 & 1;
  v87 = v135;
  v88 = Text.font(_:)(v85, v73, v75, v130 & 1, v135);
  v130 = v89;
  LODWORD(v128) = v90;
  v92 = v91;
  sub_100013F1C(v73, v75, v86);
  swift_release(v85);
  swift_bridgeObjectRelease(v87);
  sub_10000D714(&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v159);
  sub_100013D10((uint64_t)v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v93 = v160;
  v94 = v161;
  v96 = *((_QWORD *)&v163 + 1);
  v95 = v163;
  v97 = v164;
  if ((_BYTE)v159)
  {
    if (v159 == 1)
    {
      v98 = type metadata accessor for ClusterMetrics();
      v99 = (char **)&off_10002D948;
      v174 = (char **)&off_10002D948;
      v173 = v98;
      v172[0] = v96;
    }
    else
    {
      v98 = type metadata accessor for WidgetMetrics();
      v99 = &off_10002D8B8;
      v174 = &off_10002D8B8;
      v173 = v98;
      v172[0] = v97;
      v97 = v96;
    }
    v96 = v95;
  }
  else
  {
    v98 = type metadata accessor for ConsoleMetrics();
    v99 = (char **)&off_10002D9D8;
    v174 = (char **)&off_10002D9D8;
    v173 = v98;
    v172[0] = v95;
  }
  swift_release(v97);
  swift_release(v96);
  swift_release(v94);
  swift_release(v93);
  v100 = v128 & 1;
  v101 = v129 & 1;
  sub_100013D4C(v172, v98);
  v102 = ((uint64_t (__cdecl *)())v99[13])();
  v103 = v130;
  v104 = v92;
  v105 = Text.foregroundColor(_:)(v102, v88, v130, v100, v92);
  v129 = v106;
  v135 = v107;
  v109 = v108 & 1;
  sub_100013F1C(v88, v103, v100);
  swift_release(v102);
  swift_bridgeObjectRelease(v104);
  sub_10000D714(v172);
  v110 = swift_getKeyPath(&unk_100022910);
  v130 = v110;
  v148[0] = v179[0];
  *(_DWORD *)((char *)v148 + 3) = *(_DWORD *)((char *)v179 + 3);
  v147[0] = v178[0];
  *(_DWORD *)((char *)v147 + 3) = *(_DWORD *)((char *)v178 + 3);
  HIDWORD(v150) = *(_DWORD *)((char *)v179 + 3);
  v144 = v175;
  v145 = v176;
  v146 = v177;
  v143 = v101;
  *(_QWORD *)&v149 = v142;
  *((_QWORD *)&v149 + 1) = KeyPath;
  *(_QWORD *)&v150 = v141;
  BYTE8(v150) = v139;
  *(_DWORD *)((char *)&v150 + 9) = v179[0];
  v152 = 0u;
  v151 = 0u;
  LOBYTE(v153) = v136;
  DWORD1(v153) = *(_DWORD *)((char *)v178 + 3);
  *(_DWORD *)((char *)&v153 + 1) = v178[0];
  *((_QWORD *)&v153 + 1) = v137;
  *(_QWORD *)v154 = v138;
  *(_OWORD *)&v154[40] = v177;
  *(_OWORD *)&v154[24] = v176;
  *(_OWORD *)&v154[8] = v175;
  v111 = v149;
  v112 = v150;
  v113 = v153;
  v114 = v134;
  *(_OWORD *)(v134 + 32) = 0u;
  *(_OWORD *)(v114 + 48) = 0u;
  *(_OWORD *)v114 = v111;
  *(_OWORD *)(v114 + 16) = v112;
  v115 = *(_OWORD *)v154;
  v116 = *(_OWORD *)&v154[32];
  v117 = *(_QWORD *)&v154[48];
  *(_OWORD *)(v114 + 96) = *(_OWORD *)&v154[16];
  *(_OWORD *)(v114 + 112) = v116;
  *(_OWORD *)(v114 + 64) = v113;
  *(_OWORD *)(v114 + 80) = v115;
  v158 = v101;
  LOBYTE(v102) = v109;
  v156 = v109;
  *(_DWORD *)(v114 + 153) = *(_DWORD *)v157;
  *(_DWORD *)(v114 + 156) = *(_DWORD *)&v157[3];
  *(_DWORD *)(v114 + 185) = *(_DWORD *)v155;
  *(_DWORD *)(v114 + 188) = *(_DWORD *)&v155[3];
  v118 = v109;
  v120 = v131;
  v119 = v132;
  *(_QWORD *)(v114 + 128) = v117;
  *(_QWORD *)(v114 + 136) = v119;
  *(_QWORD *)(v114 + 144) = v120;
  *(_BYTE *)(v114 + 152) = v101;
  v121 = v133;
  *(_QWORD *)(v114 + 160) = v133;
  *(_QWORD *)(v114 + 168) = v105;
  v122 = v129;
  *(_QWORD *)(v114 + 176) = v129;
  *(_BYTE *)(v114 + 184) = v118;
  v123 = v135;
  *(_QWORD *)(v114 + 192) = v135;
  *(_QWORD *)(v114 + 200) = v110;
  *(_BYTE *)(v114 + 208) = 1;
  sub_100014010((uint64_t *)&v149);
  sub_100013E3C(v119, v120, v101);
  swift_bridgeObjectRetain(v121);
  v124 = v105;
  sub_100013E3C(v105, v122, v102);
  v125 = v123;
  swift_bridgeObjectRetain(v123);
  v126 = v130;
  swift_retain(v130);
  sub_100013F1C(v124, v122, v102);
  swift_release(v126);
  swift_bridgeObjectRelease(v125);
  sub_100013F1C(v119, v120, v143);
  swift_bridgeObjectRelease(v121);
  v159 = v142;
  v160 = KeyPath;
  v161 = v141;
  LOBYTE(v162) = v139;
  *(_DWORD *)((char *)&v162 + 1) = v148[0];
  HIDWORD(v162) = *(_DWORD *)((char *)v148 + 3);
  v163 = 0u;
  v164 = 0u;
  v165 = v136;
  *(_DWORD *)v166 = v147[0];
  *(_DWORD *)&v166[3] = *(_DWORD *)((char *)v147 + 3);
  v167 = v137;
  v168 = v138;
  v171 = v146;
  v170 = v145;
  v169 = v144;
  return sub_100014070(&v159);
}

void sub_10001382C(uint64_t a1@<X8>)
{
  sub_10000DD80(a1);
}

uint64_t sub_100013874(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10001389C()
{
  return sub_100014370(&qword_1000332B8, &qword_100033298, (void (*)(void))sub_1000138C0, (void (*)(void))sub_100013AC0);
}

unint64_t sub_1000138C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000332C0;
  if (!qword_1000332C0)
  {
    v1 = sub_100007234(&qword_100033290);
    sub_1000139D8(&qword_1000332C8, &qword_1000332A8, (void (*)(void))sub_10001395C);
    sub_1000139D8(&qword_1000332E8, &qword_100033270, (void (*)(void))sub_100013A44);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000332C0);
  }
  return result;
}

unint64_t sub_10001395C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000332D0;
  if (!qword_1000332D0)
  {
    v1 = sub_100007234(&qword_1000332A0);
    sub_100013CD0(&qword_1000332D8, &qword_1000332E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000332D0);
  }
  return result;
}

uint64_t sub_1000139D8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007234(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013A44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000332F0;
  if (!qword_1000332F0)
  {
    v1 = sub_100007234(&qword_100033268);
    sub_100013CD0(&qword_1000332F8, &qword_100033300);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000332F0);
  }
  return result;
}

unint64_t sub_100013AC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033308;
  if (!qword_100033308)
  {
    v1 = sub_100007234(&qword_100033250);
    sub_1000139D8(&qword_100033310, &qword_100033260, (void (*)(void))sub_100013B5C);
    sub_1000139D8(&qword_100033330, &qword_100033240, (void (*)(void))sub_100013BD8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033308);
  }
  return result;
}

unint64_t sub_100013B5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033318;
  if (!qword_100033318)
  {
    v1 = sub_100007234(&qword_100033258);
    sub_100013CD0(&qword_100033320, &qword_100033328);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033318);
  }
  return result;
}

unint64_t sub_100013BD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033338;
  if (!qword_100033338)
  {
    v1 = sub_100007234(&qword_100033238);
    sub_100013CD0(&qword_100033340, &qword_100033348);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033338);
  }
  return result;
}

unint64_t sub_100013C54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033350;
  if (!qword_100033350)
  {
    v1 = sub_100007234(&qword_1000332B0);
    sub_100013CD0(&qword_100033358, &qword_100033360);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033350);
  }
  return result;
}

uint64_t sub_100013CD0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100007234(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013D10(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return a1;
}

_QWORD *sub_100013D4C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100013D70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 208);
  v7 = *(_QWORD *)(a1 + 216);
  v8 = *(_BYTE *)(a1 + 224);
  v9 = *(_QWORD *)(a1 + 232);
  v10 = *(_QWORD *)(a1 + 240);
  v12 = *(_BYTE *)(a1 + 256);
  v13 = *(_QWORD *)(a1 + 248);
  v14 = *(_QWORD *)(a1 + 264);
  swift_retain(*(_QWORD *)(a1 + 104));
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  sub_100013E3C(v6, v7, v8);
  swift_bridgeObjectRetain(v9);
  sub_100013E3C(v10, v13, v12);
  swift_bridgeObjectRetain(v14);
  return a1;
}

uint64_t sub_100013E3C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100013E4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 208);
  v7 = *(_QWORD *)(a1 + 216);
  v8 = *(_BYTE *)(a1 + 224);
  v9 = *(_QWORD *)(a1 + 232);
  v10 = *(_QWORD *)(a1 + 240);
  v12 = *(_BYTE *)(a1 + 256);
  v13 = *(_QWORD *)(a1 + 248);
  v14 = *(_QWORD *)(a1 + 264);
  swift_release(*(_QWORD *)(a1 + 96));
  swift_release(v3);
  swift_release(v2);
  swift_release(v4);
  swift_release(v5);
  sub_100013F1C(v6, v7, v8);
  swift_bridgeObjectRelease(v9);
  sub_100013F1C(v10, v13, v12);
  swift_bridgeObjectRelease(v14);
  return a1;
}

uint64_t sub_100013F1C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100013F2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000064D4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013F70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013F98(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100013FC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013FE8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t *sub_100014010(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[9];
  swift_retain(a1[10]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t *sub_100014070(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[10];
  swift_release(a1[9]);
  swift_release(v3);
  swift_release(v2);
  swift_release(v4);
  swift_release(v5);
  return a1;
}

unint64_t sub_1000140D4()
{
  unint64_t result;

  result = qword_100033398;
  if (!qword_100033398)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100033398);
  }
  return result;
}

uint64_t sub_100014118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 160);
  v7 = *(_QWORD *)(a1 + 168);
  v8 = *(_BYTE *)(a1 + 176);
  v9 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 208);
  v12 = *(_BYTE *)(a1 + 224);
  v13 = *(_QWORD *)(a1 + 216);
  v14 = *(_QWORD *)(a1 + 232);
  swift_retain(*(_QWORD *)(a1 + 104));
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  sub_100013E3C(v6, v7, v8);
  swift_bridgeObjectRetain(v9);
  sub_100013E3C(v10, v13, v12);
  swift_bridgeObjectRetain(v14);
  return a1;
}

uint64_t sub_1000141E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 160);
  v7 = *(_QWORD *)(a1 + 168);
  v8 = *(_BYTE *)(a1 + 176);
  v9 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 208);
  v12 = *(_BYTE *)(a1 + 224);
  v13 = *(_QWORD *)(a1 + 216);
  v14 = *(_QWORD *)(a1 + 232);
  swift_release(*(_QWORD *)(a1 + 96));
  swift_release(v3);
  swift_release(v2);
  swift_release(v4);
  swift_release(v5);
  sub_100013F1C(v6, v7, v8);
  swift_bridgeObjectRelease(v9);
  sub_100013F1C(v10, v13, v12);
  swift_bridgeObjectRelease(v14);
  return a1;
}

uint64_t sub_1000142AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000064D4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000142F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100014318(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10001433C()
{
  return sub_100014370(&qword_1000333D0, &qword_1000333D8, (void (*)(void))sub_10001389C, (void (*)(void))sub_100013C54);
}

uint64_t sub_100014370(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_100007234(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

id sub_1000144A4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripAppDelegate();
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

  v3 = type metadata accessor for TripAppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for TripAppDelegate()
{
  return objc_opt_self(_TtC4Trip15TripAppDelegate);
}

unint64_t sub_10001457C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100032AC8;
  if (!qword_100032AC8)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_100022404, v1);
    atomic_store(result, (unint64_t *)&qword_100032AC8);
  }
  return result;
}

uint64_t sub_1000145C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000064D4(&qword_100033098);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_100014628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_1000330C0, a2);
}

uint64_t sub_100014634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_1000330C8, a2);
}

uint64_t sub_100014640@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  sub_1000142AC(a1, a3, a2);
  v5 = sub_1000064D4(a2);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a3, 0, 1, v5);
}

uint64_t sub_10001468C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_1000330D8, a2);
}

uint64_t sub_100014698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_1000330F8, a2);
}

uint64_t sub_1000146A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_100033108, a2);
}

uint64_t sub_1000146B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014640(a1, &qword_1000330E8, a2);
}

uint64_t sub_1000146BC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022CA0);
  v2 = swift_getKeyPath(&unk_100022CC8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

BOOL sub_100014734(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10001474C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char v29;

  v27 = a7;
  v28 = a1;
  v13 = sub_1000064D4(&qword_100033AF8);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration__isClipped;
  v29 = 0;
  Published.init(initialValue:)(&v29, &type metadata for Bool);
  v18 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v17, v16, v13);
  UUID.init()(v18);
  *(_BYTE *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle) = 5;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v19 = (void *)sub_100016C08((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v19 = &_swiftEmptySetSingleton;
  }
  v20 = v28;
  v21 = v27 & 1;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_cancellables) = v19;
  v22 = (_QWORD *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title);
  *v22 = v20;
  v22[1] = a2;
  v23 = (_QWORD *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle);
  *v23 = a3;
  v23[1] = a4;
  v24 = (_QWORD *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName);
  *v24 = a5;
  v24[1] = a6;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) = v21;
  return v7;
}

uint64_t sub_1000148CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration__isClipped;
  v2 = sub_1000064D4(&qword_100033AF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_title + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_symbolImageName + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100014994()
{
  return type metadata accessor for CardCellConfiguration(0);
}

uint64_t type metadata accessor for CardCellConfiguration(uint64_t a1)
{
  return sub_100015EA8(a1, (uint64_t *)&unk_1000334A0, (uint64_t)&nominal type descriptor for CardCellConfiguration);
}

void sub_1000149B0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[8];

  sub_100014E8C(319, (unint64_t *)&unk_1000334B0, (uint64_t)&type metadata for Bool);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v4 = type metadata accessor for UUID(319);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = &unk_100022988;
      v6[3] = &unk_100022988;
      v6[4] = &unk_100022988;
      v6[5] = &unk_1000229A0;
      v6[6] = &unk_1000229B8;
      v6[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
      swift_updateClassMetadata2(a1, 256, 8, v6, a1 + 80);
    }
  }
}

uint64_t sub_100014A74@<X0>(uint64_t a1@<X8>)
{
  return sub_100014F70(&OBJC_IVAR____TtC4Trip21CardCellConfiguration_id, a1);
}

uint64_t sub_100014A80@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CardCellConfiguration(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100014ABC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022C58);
  v2 = swift_getKeyPath(&unk_100022C80);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100014B2C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100022C10);
  v2 = swift_getKeyPath(&unk_100022C38);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100014B9C(char a1, char a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v4 = a1 & 1;
  v5 = sub_1000064D4(&qword_100033B20);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000064D4(&qword_100033B18);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin();
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()(v11);
  v14 = v2 + OBJC_IVAR____TtC4Trip9CardModel__name;
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  Published.init(initialValue:)(v18, &type metadata for String);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v14, v13, v9);
  v15 = v2 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  v18[0] = _swiftEmptyArrayStorage;
  v16 = sub_1000064D4((uint64_t *)&unk_100033640);
  Published.init(initialValue:)(v18, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v15, v8, v5);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC4Trip9CardModel_cardLayoutType) = v4;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC4Trip9CardModel_showsTitle) = a2;
  return v2;
}

uint64_t sub_100014D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  v2 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  v4 = sub_1000064D4(&qword_100033B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  v6 = sub_1000064D4(&qword_100033B20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100014DB4()
{
  return type metadata accessor for CardModel(0);
}

uint64_t type metadata accessor for CardModel(uint64_t a1)
{
  return sub_100015EA8(a1, (uint64_t *)&unk_100033620, (uint64_t)&nominal type descriptor for CardModel);
}

void sub_100014DD0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[5];

  v2 = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    v8[1] = &unk_1000229A0;
    v8[2] = &unk_1000229A0;
    sub_100014E8C(319, &qword_100033630, (uint64_t)&type metadata for String);
    if (v5 <= 0x3F)
    {
      v8[3] = *(_QWORD *)(v4 - 8) + 64;
      sub_100014ED0(319);
      if (v7 <= 0x3F)
      {
        v8[4] = *(_QWORD *)(v6 - 8) + 64;
        swift_updateClassMetadata2(a1, 256, 5, v8, a1 + 80);
      }
    }
  }
}

void sub_100014E8C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = type metadata accessor for Published(0, a3);
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_100014ED0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100033638)
  {
    v2 = sub_100007234((uint64_t *)&unk_100033640);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100033638);
  }
}

uint64_t sub_100014F28@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CardModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100014F64@<X0>(uint64_t a1@<X8>)
{
  return sub_100014F70(&OBJC_IVAR____TtC4Trip9CardModel_id, a1);
}

uint64_t sub_100014F70@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2 + *a1;
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_100014FB4(_QWORD *a1, _QWORD *a2)
{
  return static UUID.== infix(_:_:)(*a1 + OBJC_IVAR____TtC4Trip9CardModel_id, *a2 + OBJC_IVAR____TtC4Trip9CardModel_id);
}

uint64_t *sub_100014FD0(uint64_t *result, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  Swift::String v5;
  os_log_type_t v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14[2];

  v2 = (void *)result[1];
  if (v2)
  {
    v4 = *result;
    strcpy((char *)v14, "[TripCard] - ");
    HIWORD(v14[1]) = -4864;
    v5._countAndFlagsBits = v4;
    v5._object = v2;
    String.append(_:)(v5);
    v6 = static os_log_type_t.debug.getter();
    sub_1000191DC(v6, v14[0], v14[1], 0xD000000000000014, 0x8000000100024040, 87);
    swift_bridgeObjectRelease(v14[1]);
    v7 = String._bridgeToObjectiveC()();
    v8 = sub_100018A34(v7);

    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    KeyPath = swift_getKeyPath(&unk_100022C58);
    v13 = swift_getKeyPath(&unk_100022C80);
    v14[0] = v9;
    v14[1] = v11;
    swift_retain(a2);
    return (uint64_t *)static Published.subscript.setter(v14, a2, KeyPath, v13);
  }
  return result;
}

uint64_t sub_1000150F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    sub_100015148();
    return swift_release(v4);
  }
  return result;
}

uint64_t sub_100015148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  double v7;
  uint64_t (*v8)(char *, uint64_t);
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *object;
  Swift::String v15;
  uint64_t v16;
  unint64_t v17;
  os_log_type_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD v25[2];
  unint64_t v26;
  unint64_t v27;

  v1 = v0;
  v2 = sub_1000064D4(&qword_100033098);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((dispatch thunk of CAFTripObservable.showOdometer.getter(v4) & 1) == 0
    || (dispatch thunk of CAFOdometerObservable.distanceKM.getter(),
        v7 = Measurement.value.getter(v2),
        v8 = *(uint64_t (**)(char *, uint64_t))(v3 + 8),
        v9 = v8(v6, v2),
        v7 == 0.0)
    || (dispatch thunk of CAFOdometerObservable.distanceMiles.getter(v9),
        v10 = Measurement.value.getter(v2),
        v8(v6, v2),
        v10 == 0.0))
  {
    v11 = (uint64_t)sub_100007EE4();
  }
  else
  {
    v22 = sub_100007EE4();
    v23 = sub_1000092C0();
    v26 = (unint64_t)v22;
    sub_100016454((uint64_t)v23);
    v11 = v26;
  }
  v26 = 0;
  v27 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease(v27);
  v26 = 0xD000000000000015;
  v27 = 0x8000000100024000;
  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0)
      v24 = v11;
    else
      v24 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v11);
    v12 = _CocoaArrayWrapper.endIndex.getter(v24);
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25[1] = v12;
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(object);
  v15._countAndFlagsBits = 0x736C6C656320;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  v16 = v26;
  v17 = v27;
  v18 = static os_log_type_t.debug.getter();
  sub_1000191DC(v18, v16, v17, 0x6543657461647075, 0xED00002928736C6CLL, 134);
  swift_bridgeObjectRelease(v17);
  KeyPath = swift_getKeyPath(&unk_100022C10);
  v20 = swift_getKeyPath(&unk_100022C38);
  v26 = v11;
  swift_retain(v1);
  return static Published.subscript.setter(&v26, v1, KeyPath, v20);
}

uint64_t sub_1000153BC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip8TripCard_cancellables));
}

uint64_t sub_1000153F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  v2 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  v4 = sub_1000064D4(&qword_100033B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  v6 = sub_1000064D4(&qword_100033B20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip8TripCard_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000154D0()
{
  return type metadata accessor for TripCard(0);
}

uint64_t type metadata accessor for TripCard(uint64_t a1)
{
  return sub_100015EA8(a1, qword_1000337A8, (uint64_t)&nominal type descriptor for TripCard);
}

uint64_t sub_1000154EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015EE8(a1, a2, a3, (uint64_t)&value witness table for Builtin.UnknownObject + 64);
}

uint64_t sub_1000154FC(void *a1, void *a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  Swift::String v19;
  Swift::String_optional v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  char *v31;
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
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  Swift::String v51;
  Swift::String v52;

  v5 = v4;
  v9 = a3 & 1;
  v10 = sub_1000064D4(&qword_100033DF8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain(v5);
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v14 = (void *)sub_100016C08((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v14 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables) = v14;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_consumption) = a1;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC4Trip8InfoCard_odometer) = a2;
  v15 = a2;
  v16 = a1;
  swift_release(v5);
  sub_100014B9C(v9, a4 & 1);
  v17 = (void *)objc_opt_self(NSBundle);
  swift_retain_n(v5, 2);
  v18 = objc_msgSend(v17, "mainBundle");
  v52._object = (void *)0xE000000000000000;
  v19._countAndFlagsBits = 0x5F454C4349484556;
  v19._object = (void *)0xEC0000004F464E49;
  v20.value._countAndFlagsBits = 1885958740;
  v20.value._object = (void *)0xE400000000000000;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v52._countAndFlagsBits = 0;
  v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, v20, (NSBundle)v18, v21, v52);

  KeyPath = swift_getKeyPath(&unk_100022C58);
  v24 = swift_getKeyPath(&unk_100022C80);
  v51 = v22;
  v25 = static Published.subscript.setter(&v51, v5, KeyPath, v24);
  if (a2)
  {
    v48 = v15;
    v51._countAndFlagsBits = dispatch thunk of CAFFuelConsumptionObservable.$fuelEfficiency.getter(v48);
    v50 = dispatch thunk of CAFOdometerObservable.$distanceMiles.getter(v51._countAndFlagsBits);
    v49 = dispatch thunk of CAFOdometerObservable.$distanceKM.getter(v50);
    v26 = sub_1000064D4(&qword_100033E00);
    v27 = sub_1000064D4(&qword_100033D58);
    v47 = v11;
    v28 = v16;
    v29 = v15;
    v30 = v27;
    v31 = v13;
    v32 = v10;
    v33 = sub_1000073C4(&qword_100033E08, &qword_100033E00, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    v34 = sub_1000073C4(&qword_100033D60, &qword_100033D58, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    v35 = v30;
    v36 = v30;
    v15 = v29;
    v16 = v28;
    Publishers.CombineLatest3.init(_:_:_:)(&v51, &v50, &v49, v26, v35, v36, v33, v34, v34);
    v37 = swift_allocObject(&unk_10002D688, 24, 7);
    swift_weakInit(v37 + 16, v5);
    v38 = sub_1000073C4(&qword_100033E10, &qword_100033DF8, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest3<A, B, C>);
    v39 = Publisher<>.sink(receiveValue:)(sub_100018A94, v37, v32, v38);
    swift_release(v37);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v32);
    v40 = v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables;
    swift_beginAccess(v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables, &v51, 33, 0);
    AnyCancellable.store(in:)(v40);
    swift_endAccess(&v51);

  }
  else
  {
    v51._countAndFlagsBits = dispatch thunk of CAFFuelConsumptionObservable.$fuelEfficiency.getter(v25);
    v41 = swift_allocObject(&unk_10002D688, 24, 7);
    swift_weakInit(v41 + 16, v5);
    v42 = sub_1000064D4(&qword_100033E00);
    v43 = sub_1000073C4(&qword_100033E08, &qword_100033E00, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    v39 = Publisher<>.sink(receiveValue:)(sub_100018A94, v41, v42, v43);
    swift_release(v41);
    swift_release(v51._countAndFlagsBits);
    v44 = v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables;
    swift_beginAccess(v5 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables, &v51, 33, 0);
    AnyCancellable.store(in:)(v44);
    swift_endAccess(&v51);
  }
  swift_release(v39);
  sub_1000159A0();
  swift_release(v5);

  return v5;
}

uint64_t sub_100015948(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _BYTE v7[24];

  v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  result = swift_weakLoadStrong(v4);
  if (result)
  {
    v6 = result;
    a3();
    return swift_release(v6);
  }
  return result;
}

uint64_t sub_1000159A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  Swift::String v13;
  Swift::String_optional v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  double v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  void *object;
  Swift::String v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  unint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v3 = v0;
  v4 = sub_1000064D4(&qword_100033098);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = (uint64_t)_swiftEmptyArrayStorage;
  v8 = (uint64_t)sub_1000096A0();
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
  if (v10)
  {
    if ((v9 & 0xC000000000000001) != 0)
    {
      v1 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v9);
    }
    else
    {
      v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v11)
      {
        __break(1u);
        goto LABEL_27;
      }
      v1 = *(_QWORD *)(v9 + 32);
      swift_retain(v1);
    }
    swift_bridgeObjectRelease(v9);
    *(_BYTE *)(v1 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_preferredCellStyle) = 4;
    v12 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v13._countAndFlagsBits = 0xD000000000000017;
    v45._object = (void *)0xE000000000000000;
    v13._object = (void *)0x8000000100023F80;
    v14.value._countAndFlagsBits = 1885958740;
    v14.value._object = (void *)0xE400000000000000;
    v15._countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    v45._countAndFlagsBits = 0;
    v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v45);

    v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle + 8);
    *(Swift::String *)(v1 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_subtitle) = v16;
    swift_bridgeObjectRelease(v17);
    v18 = swift_retain(v1);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
    v2 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v11 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v2 < v11 >> 1)
    {
LABEL_8:
      v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v2, v1);
      specialized Array._endMutation()(v19);
      swift_release(v1);
      goto LABEL_10;
    }
LABEL_27:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v2 + 1, 1);
    goto LABEL_8;
  }
  swift_bridgeObjectRelease(v9);
LABEL_10:
  v20 = *(void **)(v3 + OBJC_IVAR____TtC4Trip8InfoCard_odometer);
  if (v20)
  {
    v21 = v20;
    dispatch thunk of CAFOdometerObservable.distanceKM.getter();
    v22 = Measurement.value.getter(v4);
    v23 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v24 = v23(v7, v4);
    if (v22 != 0.0)
    {
      dispatch thunk of CAFOdometerObservable.distanceMiles.getter(v24);
      v25 = Measurement.value.getter(v4);
      v23(v7, v4);
      if (v25 != 0.0)
      {
        v26 = sub_1000092C0();
        sub_100016454((uint64_t)v26);
      }
    }

  }
  v42 = 0;
  v43 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease(v43);
  v42 = 0xD000000000000015;
  v43 = 0x8000000100023FA0;
  v27 = v44;
  if ((unint64_t)v44 >> 62)
  {
    if (v44 < 0)
      v40 = v44;
    else
      v40 = v44 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v44);
    v28 = _CocoaArrayWrapper.endIndex.getter(v40);
    swift_bridgeObjectRelease(v27);
  }
  else
  {
    v28 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v41 = v28;
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v29._object;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(object);
  v31._countAndFlagsBits = 0x736C6C656320;
  v31._object = (void *)0xE600000000000000;
  String.append(_:)(v31);
  v32 = v42;
  v33 = v43;
  v35 = static os_log_type_t.debug.getter(v34);
  sub_1000191DC(v35, v32, v33, 0x6543657461647075, 0xED00002928736C6CLL, 182);
  swift_bridgeObjectRelease(v33);
  v36 = v44;
  KeyPath = swift_getKeyPath(&unk_100022C10);
  v38 = swift_getKeyPath(&unk_100022C38);
  v42 = v36;
  swift_retain(v3);
  return static Published.subscript.setter(&v42, v3, KeyPath, v38);
}

uint64_t sub_100015D78()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables));
}

uint64_t sub_100015DB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC4Trip9CardModel_id;
  v2 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC4Trip9CardModel__name;
  v4 = sub_1000064D4(&qword_100033B18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC4Trip9CardModel__cells;
  v6 = sub_1000064D4(&qword_100033B20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC4Trip8InfoCard_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100015E8C()
{
  return type metadata accessor for InfoCard(0);
}

uint64_t type metadata accessor for InfoCard(uint64_t a1)
{
  return sub_100015EA8(a1, qword_100033958, (uint64_t)&nominal type descriptor for InfoCard);
}

uint64_t sub_100015EA8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100015EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015EE8(a1, a2, a3, (uint64_t)"\b");
}

uint64_t sub_100015EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[3];

  v5[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v5[1] = a4;
  v5[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  return swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 280);
}

_BYTE *sub_100015F44(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CardLayoutType()
{
  return &type metadata for CardLayoutType;
}

uint64_t getEnumTagSinglePayload for ClusterEventType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s4Trip14CardLayoutTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001603C + 4 * byte_100022965[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100016070 + 4 * asc_100022960[v4]))();
}

uint64_t sub_100016070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100016078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100016080);
  return result;
}

uint64_t sub_10001608C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100016094);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100016098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000160A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CardCellDataType()
{
  return &type metadata for CardCellDataType;
}

unint64_t sub_1000160C0()
{
  unint64_t result;

  result = qword_100033AD8;
  if (!qword_100033AD8)
  {
    result = swift_getWitnessTable(&unk_100022A74, &type metadata for CardCellDataType);
    atomic_store(result, (unint64_t *)&qword_100033AD8);
  }
  return result;
}

unint64_t sub_100016108()
{
  unint64_t result;

  result = qword_100033AE0;
  if (!qword_100033AE0)
  {
    result = swift_getWitnessTable(&unk_100022ADC, &type metadata for CardLayoutType);
    atomic_store(result, (unint64_t *)&qword_100033AE0);
  }
  return result;
}

uint64_t sub_10001614C()
{
  return sub_100006FC8(&qword_100033AE8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
}

uint64_t sub_100016178@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022CA0);
  v5 = swift_getKeyPath(&unk_100022CC8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_1000161F4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022CA0);
  v5 = swift_getKeyPath(&unk_100022CC8);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100016264@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022C58);
  v5 = swift_getKeyPath(&unk_100022C80);
  static Published.subscript.getter(v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v8[1];
  *a2 = v8[0];
  a2[1] = v7;
  return result;
}

uint64_t sub_1000162E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022C58);
  v6 = swift_getKeyPath(&unk_100022C80);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v4);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_100016360@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022C10);
  v5 = swift_getKeyPath(&unk_100022C38);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_1000163DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100022C10);
  v5 = swift_getKeyPath(&unk_100022C38);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100016454(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10001660C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
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
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001660C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t *v20[4];

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000073C4(&qword_100033AF0, (uint64_t *)&unk_100033640, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_1000064D4((uint64_t *)&unk_100033640);
          v15 = sub_100016A34(v20, i, a3);
          v17 = *v16;
          swift_retain(*v16);
          ((void (*)(uint64_t **, _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = type metadata accessor for CardCellConfiguration(0);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100016818(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  void (*v20[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000073C4(&qword_100033B30, &qword_100033B28, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_1000064D4(&qword_100033B28);
          v15 = sub_100016A8C(v20, i, a3);
          v17 = *v16;
          ((void (*)(void (**)(id *), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_100007E6C(0, &qword_100033138, CAFTrip_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_100016A34(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_100016B0C(v6, a2, a3);
  return sub_100016A88;
}

void (*sub_100016A8C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100016B80(v6, a2, a3);
  return sub_100016A88;
}

void sub_100016AE0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_100016B0C(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)sub_100016B78;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016B78(_QWORD *a1)
{
  return swift_release(*a1);
}

void (*sub_100016B80(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_100016BEC;
  }
  __break(1u);
  return result;
}

void sub_100016BEC(id *a1)
{

}

_BYTE *sub_100016BF4@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100016C08(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  BOOL v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_1000064D4(&qword_100033B00);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      v24 = v1;
      if (!v2)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  v24 = v1;
  if (!v2)
  {
LABEL_4:
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      return (uint64_t)v4;
    goto LABEL_15;
  }
LABEL_11:
  if (v1 < 0)
    v7 = v1;
  else
    v7 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v7);
  result = swift_bridgeObjectRelease(v1);
  if (!v5)
    return (uint64_t)v4;
LABEL_15:
  v8 = 0;
  v9 = (char *)(v4 + 7);
  v23 = v5;
  while ((v24 & 0xC000000000000001) != 0)
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v24);
    v10 = __OFADD__(v8++, 1);
    if (v10)
      goto LABEL_32;
LABEL_24:
    v25 = result;
    v27 = result;
    v11 = v4[5];
    v12 = type metadata accessor for AnyCancellable(0);
    v13 = sub_100006FC8(&qword_100033B08, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v12, v13);
    v14 = -1 << *((_BYTE *)v4 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
    v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      v19 = ~v14;
      v20 = sub_100006FC8(&qword_100033B10, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
      do
      {
        v26 = *(_QWORD *)(v4[6] + 8 * v15);
        result = dispatch thunk of static Equatable.== infix(_:_:)(&v26, &v27, v12, v20);
        if ((result & 1) != 0)
        {
          result = swift_release(v25);
          v5 = v23;
          goto LABEL_17;
        }
        v15 = (v15 + 1) & v19;
        v16 = v15 >> 6;
        v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
        v18 = 1 << v15;
      }
      while ((v17 & (1 << v15)) != 0);
      v5 = v23;
    }
    *(_QWORD *)&v9[8 * v16] = v18 | v17;
    *(_QWORD *)(v4[6] + 8 * v15) = v25;
    v21 = v4[2];
    v10 = __OFADD__(v21, 1);
    v22 = v21 + 1;
    if (v10)
      goto LABEL_33;
    v4[2] = v22;
LABEL_17:
    if (v8 == v5)
      return (uint64_t)v4;
  }
  if (v8 >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_34;
  result = swift_retain(*(_QWORD *)(v24 + 32 + 8 * v8));
  v10 = __OFADD__(v8++, 1);
  if (!v10)
    goto LABEL_24;
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_100016EAC(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  Swift::String v44;
  Swift::String v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  Swift::String v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSString v58;
  id v59;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String v62;
  Swift::String_optional v63;
  Swift::String v64;
  Swift::String v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t KeyPath;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
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
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void (*v197)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  char *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  unint64_t v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  id v242;
  char *v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  char *v254;
  uint64_t v255;
  char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  char *v260;
  uint64_t v261;
  uint64_t v262;
  char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  char *v268;
  uint64_t v269;
  uint64_t v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  char *v274;
  uint64_t v275;
  uint64_t v276;
  char *v277;
  uint64_t v278;
  uint64_t v279;
  char *v280;
  uint64_t v281;
  uint64_t v282;
  char *v283;
  uint64_t v284;
  uint64_t v285;
  char *v286;
  uint64_t v287;
  uint64_t v288;
  char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  char *v294;
  char *v295;
  id v296;
  char *v297;
  char *v298;
  char *v299;
  uint64_t v300;
  char *v301;
  __int128 v302;
  uint64_t v303;
  unint64_t v304;
  Swift::String v305;

  v3 = v2;
  v6 = sub_1000064D4(&qword_100033B38);
  v287 = *(_QWORD *)(v6 - 8);
  v288 = v6;
  __chkstk_darwin(v6);
  v286 = (char *)&v242 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000064D4(&qword_100033B40);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v242 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v279 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0);
  v278 = *(_QWORD *)(v279 - 8);
  __chkstk_darwin(v279);
  v277 = (char *)&v242 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v276 = sub_1000064D4(&qword_100033B48);
  v275 = *(_QWORD *)(v276 - 8);
  __chkstk_darwin(v276);
  v274 = (char *)&v242 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v282 = sub_1000064D4(&qword_100033B50);
  v281 = *(_QWORD *)(v282 - 8);
  __chkstk_darwin(v282);
  v280 = (char *)&v242 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v269 = sub_1000064D4(&qword_100033B58);
  v266 = *(_QWORD *)(v269 - 8);
  __chkstk_darwin(v269);
  v268 = (char *)&v242 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v272 = sub_1000064D4(&qword_100033B60);
  v16 = __chkstk_darwin(v272);
  v271 = (char *)&v242 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v299 = (char *)&v242 - v18;
  v19 = sub_1000064D4(&qword_100033B68);
  v264 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v263 = (char *)&v242 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v270 = sub_1000064D4(&qword_100033B70);
  __chkstk_darwin(v270);
  v298 = (char *)&v242 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1000064D4(&qword_100033B78);
  v261 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v260 = (char *)&v242 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v267 = sub_1000064D4(&qword_100033B80);
  __chkstk_darwin(v267);
  v297 = (char *)&v242 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v285 = sub_1000064D4(&qword_100033B88);
  v284 = *(_QWORD *)(v285 - 8);
  __chkstk_darwin(v285);
  v283 = (char *)&v242 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v251 = sub_1000064D4(&qword_100033B90);
  v250 = *(_QWORD *)(v251 - 8);
  __chkstk_darwin(v251);
  v249 = (char *)&v242 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v257 = sub_1000064D4(&qword_100033B98);
  __chkstk_darwin(v257);
  v256 = (char *)&v242 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v248 = sub_1000064D4(&qword_100033BA0);
  v247 = *(_QWORD *)(v248 - 8);
  __chkstk_darwin(v248);
  v246 = (char *)&v242 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v255 = sub_1000064D4(&qword_100033BA8);
  __chkstk_darwin(v255);
  v254 = (char *)&v242 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v292 = sub_1000064D4(&qword_100033BB0);
  v244 = *(_QWORD *)(v292 - 8);
  __chkstk_darwin(v292);
  v243 = (char *)&v242 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v253 = sub_1000064D4(&qword_100033BB8);
  __chkstk_darwin(v253);
  v295 = (char *)&v242 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v302 = sub_1000064D4(&qword_100033BC0);
  v293 = *(_QWORD *)(v302 - 8);
  __chkstk_darwin(v302);
  v33 = (char *)&v242 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v252 = sub_1000064D4(&qword_100033BC8);
  __chkstk_darwin(v252);
  v294 = (char *)&v242 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v300 = sub_1000064D4(&qword_100033BD0);
  v273 = *(_QWORD *)(v300 - 8);
  __chkstk_darwin(v300);
  v301 = (char *)&v242 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v3;
  swift_retain(v3);
  v290 = v9;
  v291 = v8;
  v289 = v11;
  v265 = v19;
  v262 = v22;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v37 = (void *)sub_100016C08((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v37 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_cancellables) = v37;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_trip) = a1;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC4Trip8TripCard_odometer) = a2;
  v38 = a1;
  v39 = a2;
  swift_release(v3);
  sub_100014B9C(0, 1);
  v303 = 0;
  v304 = 0xE000000000000000;
  swift_retain(v3);
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease(v304);
  v303 = 0xD000000000000017;
  v304 = 0x8000000100024020;
  v40 = objc_msgSend(v38, "description");
  v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  v43 = v42;

  v44._countAndFlagsBits = v41;
  v44._object = v43;
  String.append(_:)(v44);
  swift_bridgeObjectRelease(v43);
  v45._countAndFlagsBits = 0x6574656D6F646F20;
  v45._object = (void *)0xEA00000000003D72;
  String.append(_:)(v45);
  v296 = v39;
  v46 = objc_msgSend(v39, "description");
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v49 = v48;

  v50._countAndFlagsBits = v47;
  v50._object = v49;
  String.append(_:)(v50);
  v51 = swift_bridgeObjectRelease(v49);
  v52 = v303;
  v53 = v304;
  v54 = static os_log_type_t.debug.getter(v51);
  sub_1000191DC(v54, v52, v53, 0xD000000000000014, 0x8000000100024040, 77);
  swift_bridgeObjectRelease(v53);
  v55 = swift_retain(v36);
  dispatch thunk of CAFTripObservable.userVisibleLabel.getter(v55);
  if (v56)
  {
    v57 = v56;
    v58 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v57);
    v59 = sub_100018A34(v58);

    countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  }
  else
  {
    v59 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v305._object = (void *)0xE000000000000000;
    v62._countAndFlagsBits = 0x4241545F50495254;
    v62._object = (void *)0xE800000000000000;
    v63.value._countAndFlagsBits = 1885958740;
    v63.value._object = (void *)0xE400000000000000;
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    v305._countAndFlagsBits = 0;
    v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v62, v63, (NSBundle)v59, v64, v305);
    object = v65._object;
    countAndFlagsBits = v65._countAndFlagsBits;
  }
  v66 = countAndFlagsBits;
  v67 = (unint64_t)object;

  KeyPath = swift_getKeyPath(&unk_100022C58);
  v69 = swift_getKeyPath(&unk_100022C80);
  v303 = v66;
  v304 = v67;
  v258 = v36;
  v70 = static Published.subscript.setter(&v303, v36, KeyPath, v69);
  v303 = dispatch thunk of CAFTripObservable.$userVisibleLabel.getter(v70);
  swift_retain(v36);
  v71 = sub_1000064D4(&qword_100033BD8);
  v72 = sub_1000073C4(&qword_100033BE0, &qword_100033BD8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v73 = Publisher<>.sink(receiveValue:)(sub_100018988, v36, v71, v72);
  swift_release(v36);
  swift_release(v303);
  v74 = v36 + OBJC_IVAR____TtC4Trip8TripCard_cancellables;
  v259 = v36 + OBJC_IVAR____TtC4Trip8TripCard_cancellables;
  swift_beginAccess(v36 + OBJC_IVAR____TtC4Trip8TripCard_cancellables, &v303, 33, 0);
  AnyCancellable.store(in:)(v74);
  swift_endAccess(&v303);
  v75 = swift_release(v73);
  v76 = dispatch thunk of CAFTripObservable.$averageSpeed.getter(v75);
  v303 = v76;
  v77 = sub_1000064D4(&qword_100033BE8);
  v78 = sub_1000064D4(&qword_100033BF0);
  v79 = sub_1000073C4(&qword_100033BF8, &qword_100033BE8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.map<A>(_:)(sub_1000146B0, 0, v77, v78, v79);
  v80 = sub_1000073C4(&qword_100033C00, &qword_100033BC0, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v81 = v302;
  v82 = Publisher.eraseToAnyPublisher()(v302, v80);
  (*(void (**)(char *, uint64_t))(v293 + 8))(v33, v81);
  swift_release(v76);
  v303 = v82;
  v83 = sub_1000064D4(&qword_100033C08);
  v84 = *(_QWORD *)(v78 - 8);
  v85 = *(_QWORD *)(v84 + 72);
  v86 = *(unsigned __int8 *)(v84 + 80);
  v87 = (v86 + 32) & ~v86;
  v88 = swift_allocObject(v83, v87 + v85, v86 | 7);
  v302 = xmmword_100022CF0;
  *(_OWORD *)(v88 + 16) = xmmword_100022CF0;
  v89 = sub_1000064D4(&qword_1000330E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88 + v87, 1, 1, v89);
  v90 = sub_1000064D4(&qword_100033C10);
  v91 = sub_1000073C4(&qword_100033C18, &qword_100033C10, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.prepend(_:)(v88, v90, v91);
  swift_release(v82);
  v92 = swift_bridgeObjectRelease(v88);
  v93 = dispatch thunk of CAFTripObservable.$distance.getter(v92);
  v303 = v93;
  v94 = sub_1000064D4(&qword_100033C20);
  v245 = v94;
  v95 = sub_1000064D4(&qword_100033C28);
  v293 = sub_1000073C4(&qword_100033C30, &qword_100033C20, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v96 = v243;
  Publisher.map<A>(_:)(sub_1000146A4, 0, v94, v95, v293);
  v97 = sub_1000073C4(&qword_100033C38, &qword_100033BB0, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v98 = v292;
  v99 = Publisher.eraseToAnyPublisher()(v292, v97);
  (*(void (**)(char *, uint64_t))(v244 + 8))(v96, v98);
  swift_release(v93);
  v303 = v99;
  v100 = sub_1000064D4(&qword_100033C40);
  v101 = *(_QWORD *)(v95 - 8);
  v102 = *(_QWORD *)(v101 + 72);
  v103 = *(unsigned __int8 *)(v101 + 80);
  v104 = (v103 + 32) & ~v103;
  v105 = swift_allocObject(v100, v104 + v102, v103 | 7);
  *(_OWORD *)(v105 + 16) = v302;
  v292 = sub_1000064D4(&qword_100033108);
  v244 = *(_QWORD *)(v292 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v244 + 56))(v105 + v104, 1, 1, v292);
  v106 = sub_1000064D4(&qword_100033C48);
  v107 = sub_1000073C4(&qword_100033C50, &qword_100033C48, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.prepend(_:)(v105, v106, v107);
  swift_release(v99);
  v108 = swift_bridgeObjectRelease(v105);
  v109 = dispatch thunk of CAFTripObservable.$duration.getter(v108);
  v303 = v109;
  v110 = sub_1000064D4(&qword_100033C58);
  v111 = sub_1000064D4(&qword_100033C60);
  v112 = sub_1000073C4(&qword_100033C68, &qword_100033C58, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v113 = v246;
  Publisher.map<A>(_:)(sub_100014698, 0, v110, v111, v112);
  v114 = sub_1000073C4(&qword_100033C70, &qword_100033BA0, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v115 = v248;
  v116 = Publisher.eraseToAnyPublisher()(v248, v114);
  (*(void (**)(char *, uint64_t))(v247 + 8))(v113, v115);
  swift_release(v109);
  v303 = v116;
  v117 = sub_1000064D4(&qword_100033C78);
  v118 = *(_QWORD *)(v111 - 8);
  v119 = *(_QWORD *)(v118 + 72);
  v120 = *(unsigned __int8 *)(v118 + 80);
  v121 = (v120 + 32) & ~v120;
  v122 = swift_allocObject(v117, v121 + v119, v120 | 7);
  *(_OWORD *)(v122 + 16) = v302;
  v123 = sub_1000064D4(&qword_1000330F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v123 - 8) + 56))(v122 + v121, 1, 1, v123);
  v124 = sub_1000064D4(&qword_100033C80);
  v125 = sub_1000073C4(&qword_100033C88, &qword_100033C80, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v126 = v254;
  Publisher.prepend(_:)(v122, v124, v125);
  swift_release(v116);
  v127 = swift_bridgeObjectRelease(v122);
  v128 = dispatch thunk of CAFTripObservable.$energy.getter(v127);
  v303 = v128;
  v129 = sub_1000064D4(&qword_100033C90);
  v130 = sub_1000064D4(&qword_100033C98);
  v131 = sub_1000073C4(&qword_100033CA0, &qword_100033C90, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v132 = v249;
  Publisher.map<A>(_:)(sub_10001468C, 0, v129, v130, v131);
  v133 = sub_1000073C4(&qword_100033CA8, &qword_100033B90, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v134 = v251;
  v135 = Publisher.eraseToAnyPublisher()(v251, v133);
  (*(void (**)(char *, uint64_t))(v250 + 8))(v132, v134);
  swift_release(v128);
  v303 = v135;
  v136 = sub_1000064D4(&qword_100033CB0);
  v137 = *(_QWORD *)(v130 - 8);
  v138 = *(_QWORD *)(v137 + 72);
  v139 = *(unsigned __int8 *)(v137 + 80);
  v140 = (v139 + 32) & ~v139;
  v141 = swift_allocObject(v136, v140 + v138, v139 | 7);
  *(_OWORD *)(v141 + 16) = v302;
  v142 = sub_1000064D4(&qword_1000330D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v142 - 8) + 56))(v141 + v140, 1, 1, v142);
  v143 = sub_1000064D4(&qword_100033CB8);
  v144 = sub_1000073C4(&qword_100033CC0, &qword_100033CB8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v145 = v256;
  Publisher.prepend(_:)(v141, v143, v144);
  swift_release(v135);
  swift_bridgeObjectRelease(v141);
  v146 = sub_1000073C4(&qword_100033CC8, &qword_100033BC8, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v147 = sub_1000073C4(&qword_100033CD0, &qword_100033BB8, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v148 = sub_1000073C4(&qword_100033CD8, &qword_100033BA8, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v149 = sub_1000073C4(&qword_100033CE0, &qword_100033B98, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v150 = Publishers.CombineLatest4.init(_:_:_:_:)(v294, v295, v126, v145, v252, v253, v255, v257, v146, v147, v148, v149);
  v242 = v38;
  v151 = dispatch thunk of CAFTripObservable.$energyEfficiency.getter(v150);
  v303 = v151;
  v152 = sub_1000064D4(&qword_100033CE8);
  v153 = sub_1000064D4(&qword_100033CF0);
  v154 = sub_1000073C4(&qword_100033CF8, &qword_100033CE8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v155 = v260;
  Publisher.map<A>(_:)(sub_100014634, 0, v152, v153, v154);
  v156 = sub_1000073C4(&qword_100033D00, &qword_100033B78, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v157 = v262;
  v158 = Publisher.eraseToAnyPublisher()(v262, v156);
  (*(void (**)(char *, uint64_t))(v261 + 8))(v155, v157);
  swift_release(v151);
  v303 = v158;
  v159 = sub_1000064D4(&qword_100033D08);
  v160 = *(_QWORD *)(v153 - 8);
  v161 = *(_QWORD *)(v160 + 72);
  v162 = *(unsigned __int8 *)(v160 + 80);
  v163 = (v162 + 32) & ~v162;
  v164 = swift_allocObject(v159, v163 + v161, v162 | 7);
  *(_OWORD *)(v164 + 16) = v302;
  v165 = sub_1000064D4(&qword_1000330C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v165 - 8) + 56))(v164 + v163, 1, 1, v165);
  v166 = sub_1000064D4(&qword_100033D10);
  v167 = sub_1000073C4(&qword_100033D18, &qword_100033D10, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.prepend(_:)(v164, v166, v167);
  swift_release(v158);
  v168 = swift_bridgeObjectRelease(v164);
  v169 = dispatch thunk of CAFTripObservable.$fuelEfficiency.getter(v168);
  v303 = v169;
  v170 = sub_1000064D4(&qword_100033D20);
  v171 = sub_1000064D4(&qword_100033D28);
  v172 = sub_1000073C4(&qword_100033D30, &qword_100033D20, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v173 = v263;
  Publisher.map<A>(_:)(sub_100014628, 0, v170, v171, v172);
  v174 = sub_1000073C4(&qword_100033D38, &qword_100033B68, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v175 = v265;
  v176 = Publisher.eraseToAnyPublisher()(v265, v174);
  (*(void (**)(char *, uint64_t))(v264 + 8))(v173, v175);
  swift_release(v169);
  v303 = v176;
  v177 = sub_1000064D4(&qword_100033D40);
  v178 = *(_QWORD *)(v171 - 8);
  v179 = *(_QWORD *)(v178 + 72);
  v180 = *(unsigned __int8 *)(v178 + 80);
  v181 = (v180 + 32) & ~v180;
  v182 = swift_allocObject(v177, v181 + v179, v180 | 7);
  *(_OWORD *)(v182 + 16) = v302;
  v183 = sub_1000064D4(&qword_1000330C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v183 - 8) + 56))(v182 + v181, 1, 1, v183);
  v184 = sub_1000064D4(&qword_100033D48);
  v185 = sub_1000073C4(&qword_100033D50, &qword_100033D48, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.prepend(_:)(v182, v184, v185);
  swift_release(v176);
  v186 = swift_bridgeObjectRelease(v182);
  v187 = dispatch thunk of CAFOdometerObservable.$distanceMiles.getter(v186);
  v303 = v187;
  v188 = sub_1000064D4(&qword_100033D58);
  v295 = (char *)v188;
  v294 = (char *)sub_1000073C4(&qword_100033D60, &qword_100033D58, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v189 = v268;
  Publisher.map<A>(_:)(sub_1000145C4, 0, v188, v292, v294);
  v190 = sub_1000073C4(&qword_100033D68, &qword_100033B58, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v191 = v269;
  v192 = Publisher.eraseToAnyPublisher()(v269, v190);
  v266 = *(_QWORD *)(v266 + 8);
  ((void (*)(char *, uint64_t))v266)(v189, v191);
  swift_release(v187);
  v303 = v192;
  v265 = sub_1000064D4(&qword_100033D70);
  v193 = *(unsigned __int8 *)(v244 + 80);
  v194 = (v193 + 32) & ~v193;
  v264 = v194 + *(_QWORD *)(v244 + 72);
  v263 = (char *)(v193 | 7);
  v195 = swift_allocObject(v265, v264, v193 | 7);
  *(_OWORD *)(v195 + 16) = v302;
  v196 = sub_1000064D4(&qword_100033098);
  v197 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v196 - 8) + 56);
  v197(v195 + v194, 1, 1, v196);
  v198 = v245;
  Publisher.prepend(_:)(v195, v245, v293);
  swift_release(v192);
  v199 = swift_bridgeObjectRelease(v195);
  v200 = dispatch thunk of CAFOdometerObservable.$distanceKM.getter(v199);
  v303 = v200;
  Publisher.map<A>(_:)(sub_1000145C4, 0, v295, v292, v294);
  v201 = Publisher.eraseToAnyPublisher()(v191, v190);
  ((void (*)(char *, uint64_t))v266)(v189, v191);
  swift_release(v200);
  v303 = v201;
  v202 = swift_allocObject(v265, v264, v263);
  *(_OWORD *)(v202 + 16) = v302;
  v197(v202 + v194, 1, 1, v196);
  v203 = v271;
  Publisher.prepend(_:)(v202, v198, v293);
  swift_release(v201);
  swift_bridgeObjectRelease(v202);
  v204 = sub_1000073C4(&qword_100033D78, &qword_100033B80, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v205 = sub_1000073C4(&qword_100033D80, &qword_100033B70, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v206 = sub_1000073C4(&qword_100033D88, &qword_100033B60, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v207 = v283;
  Publishers.CombineLatest4.init(_:_:_:_:)(v297, v298, v299, v203, v267, v270, v272, v272, v204, v205, v206, v206);
  v208 = sub_1000073C4(&qword_100033D90, &qword_100033BD0, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>);
  v209 = sub_1000073C4(&qword_100033D98, &qword_100033B88, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>);
  v210 = v274;
  v211 = v285;
  Publisher.combineLatest<A>(_:)(v207, v300, v285, v208, v209);
  v212 = v277;
  static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)(50);
  v213 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v303 = (uint64_t)v213;
  v214 = sub_100007E6C(0, &qword_100033DA0, NSRunLoop_ptr);
  v215 = sub_1000073C4(&qword_100033DA8, &qword_100033B48, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest<A, B>);
  v216 = sub_100018990();
  v217 = v280;
  v218 = v276;
  Publisher.throttle<A>(for:scheduler:latest:)(v212, &v303, 1, v276, v214, v215, v216);

  (*(void (**)(char *, uint64_t))(v278 + 8))(v212, v279);
  (*(void (**)(char *, uint64_t))(v275 + 8))(v210, v218);
  v219 = swift_allocObject(&unk_10002D660, 24, 7);
  v220 = v258;
  swift_weakInit(v219 + 16, v258);
  v221 = sub_1000073C4(&qword_100033DB8, &qword_100033B50, (uint64_t)&protocol conformance descriptor for Publishers.Throttle<A, B>);
  v222 = v282;
  v223 = Publisher<>.sink(receiveValue:)(sub_100018A0C, v219, v282, v221);
  swift_release(v219);
  (*(void (**)(char *, uint64_t))(v281 + 8))(v217, v222);
  v224 = v259;
  swift_beginAccess(v259, &v303, 33, 0);
  AnyCancellable.store(in:)(v224);
  swift_endAccess(&v303);
  v225 = swift_release(v223);
  v226 = dispatch thunk of CAFTripObservable.$showOdometer.getter(v225);
  v303 = v226;
  v227 = sub_1000064D4(&qword_100033DC0);
  v228 = sub_1000064D4(&qword_100033DC8);
  v229 = sub_1000073C4(&qword_100033DD0, &qword_100033DC0, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v230 = v286;
  Publisher.map<A>(_:)(sub_100016BF4, 0, v227, v228, v229);
  v231 = sub_1000073C4(&qword_100033DD8, &qword_100033B38, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v232 = v288;
  v233 = Publisher.eraseToAnyPublisher()(v288, v231);
  (*(void (**)(char *, uint64_t))(v287 + 8))(v230, v232);
  swift_release(v226);
  v303 = v233;
  v234 = sub_1000064D4(&qword_100033DE0);
  v235 = sub_1000073C4(&qword_100033DE8, &qword_100033DE0, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v236 = v289;
  Publisher.prepend(_:)(&off_10002CEB0, v234, v235);
  swift_release(v233);
  v237 = swift_allocObject(&unk_10002D660, 24, 7);
  swift_weakInit(v237 + 16, v220);
  v238 = sub_1000073C4(&qword_100033DF0, &qword_100033B40, (uint64_t)&protocol conformance descriptor for Publishers.Concatenate<A, B>);
  v239 = v291;
  v240 = Publisher<>.sink(receiveValue:)(sub_100018A2C, v237, v291, v238);
  swift_release(v237);
  (*(void (**)(char *, uint64_t))(v290 + 8))(v236, v239);
  swift_beginAccess(v224, &v303, 33, 0);
  AnyCancellable.store(in:)(v224);
  swift_endAccess(&v303);
  swift_release(v240);
  sub_100015148();
  swift_release(v220);
  (*(void (**)(char *, uint64_t))(v284 + 8))(v207, v211);
  (*(void (**)(char *, uint64_t))(v273 + 8))(v301, v300);
  return v220;
}

uint64_t *sub_100018988(uint64_t *a1)
{
  uint64_t v1;

  return sub_100014FD0(a1, v1);
}

unint64_t sub_100018990()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033DB0;
  if (!qword_100033DB0)
  {
    v1 = sub_100007E6C(255, &qword_100033DA0, NSRunLoop_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_100033DB0);
  }
  return result;
}

uint64_t sub_1000189E8()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018A0C(uint64_t a1)
{
  uint64_t v1;

  return sub_100015948(a1, v1, (void (*)(void))sub_100015148);
}

uint64_t sub_100018A2C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000150F4(a1, v1);
}

id sub_100018A34(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = CAFFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v1, &stru_10002DE10, CFSTR("Localizable")));

  return v4;
}

uint64_t sub_100018A94(uint64_t a1)
{
  uint64_t v1;

  return sub_100015948(a1, v1, (void (*)(void))sub_1000159A0);
}

uint64_t sub_100018AC8()
{
  uint64_t result;

  sub_1000193CC();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000015, 0x8000000100024260, 1885958740, 0xE400000000000000);
  qword_1000356F0 = result;
  return result;
}

void sub_100018B1C()
{
  qword_1000356F8 = 0x63746177706F7473;
  unk_100035700 = 0xE900000000000068;
}

void sub_100018B44()
{
  strcpy((char *)&qword_100035708, "fuelpump.fill");
  unk_100035716 = -4864;
}

void sub_100018B74()
{
  qword_100035718 = 0x6E616C2E64616F72;
  unk_100035720 = 0xEA00000000007365;
}

uint64_t sub_100018B9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100018C6C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000D6D8((uint64_t)v12, *a3);
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
      sub_10000D6D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000D714(v12);
  return v7;
}

uint64_t sub_100018C6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100018E24(a5, a6);
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

uint64_t sub_100018E24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100018EB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100019090(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100019090(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100018EB8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10001902C(v4, 0);
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

_QWORD *sub_10001902C(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000064D4(&qword_100033E18);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100019090(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000064D4(&qword_100033E18);
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
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000191DC(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  NSObject *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_1000329B0 != -1)
    swift_once(&qword_1000329B0, sub_100018AC8);
  v12 = qword_1000356F0;
  result = os_log_type_enabled((os_log_t)qword_1000356F0, a1);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a5, 2);
    swift_bridgeObjectRetain_n(a3, 2);
    v14 = swift_slowAlloc(32, -1);
    v15 = swift_slowAlloc(64, -1);
    v17 = v15;
    *(_DWORD *)v14 = 136315650;
    swift_bridgeObjectRetain(a5);
    v16 = sub_100018B9C(a4, a5, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(a5, 3);
    *(_WORD *)(v14 + 12) = 2048;
    v16 = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 14, v14 + 22);
    *(_WORD *)(v14 + 22) = 2080;
    swift_bridgeObjectRetain(a3);
    v16 = sub_100018B9C(a2, a3, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 24, v14 + 32);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, a1, "%s: %ld  %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    return swift_slowDealloc(v14, -1, -1);
  }
  return result;
}

unint64_t sub_1000193CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033E20;
  if (!qword_100033E20)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100033E20);
  }
  return result;
}

uint64_t destroy for TripView(uint64_t a1)
{
  sub_10000DA4C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  swift_release(*(_QWORD *)(a1 + 72));
  return swift_release(*(_QWORD *)(a1 + 88));
}

uint64_t initializeWithCopy for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  v12 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v12;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v13 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v13;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  swift_retain(v12);
  swift_retain(v13);
  return a1;
}

uint64_t assignWithCopy for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  sub_10000DA4C(v12, v13, v14, v15, v16, v17, v18, v19);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v20 = *(_QWORD *)(a2 + 72);
  v21 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v20;
  swift_retain(v20);
  swift_release(v21);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v22 = *(_QWORD *)(a1 + 88);
  v23 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v23;
  swift_retain(v23);
  swift_release(v22);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

__n128 initializeWithTake for TripView(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for TripView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  sub_10000DA4C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = *(_QWORD *)(a2 + 72);
  v16 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v15;
  swift_release(v16);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release(v17);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for TripView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 97))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TripView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 97) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TripView()
{
  return &type metadata for TripView;
}

uint64_t sub_100019760(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000262B4, 1);
}

_QWORD *sub_100019770()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;

  v13 = *(_OWORD *)(v0 + 64);
  KeyPath = swift_getKeyPath(&unk_100022D90);
  v2 = swift_getKeyPath(&unk_100022DB8);
  v3 = swift_retain(*((_QWORD *)&v13 + 1));
  static Published.subscript.getter(&v12, v3, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  result = (_QWORD *)sub_100013874((uint64_t)&v13);
  v5 = (uint64_t)v12;
  v12 = _swiftEmptyArrayStorage;
  if (!((unint64_t)v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease(v5);
    return _swiftEmptyArrayStorage;
  }
  if (v5 < 0)
    v11 = v5;
  else
    v11 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v6 = _CocoaArrayWrapper.endIndex.getter(v11);
  result = (_QWORD *)swift_bridgeObjectRelease(v5);
  if (!v6)
    goto LABEL_17;
LABEL_3:
  if (v6 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v5);
      }
      else
      {
        v10 = *(_QWORD *)(v5 + 8 * i + 32);
        swift_retain(v10);
      }
      if ((*(_BYTE *)(v10 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) & 1) != 0)
      {
        swift_release(v10);
      }
      else
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v8 = v12[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
        v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v10);
        specialized ContiguousArray._endMutation()(v9);
      }
    }
    swift_bridgeObjectRelease(v5);
    return v12;
  }
  return result;
}

uint64_t sub_100019914()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;

  v14 = *(_OWORD *)(v0 + 64);
  KeyPath = swift_getKeyPath(&unk_100022D90);
  v2 = swift_getKeyPath(&unk_100022DB8);
  v3 = swift_retain(*((_QWORD *)&v14 + 1));
  static Published.subscript.getter(&v13, v3, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  sub_100013874((uint64_t)&v14);
  v4 = v13;
  if (v13 >> 62)
    goto LABEL_19;
  v5 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v13);
  if (!v5)
  {
LABEL_16:
    swift_bridgeObjectRelease_n(v4, 2);
    return 0;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v4);
  }
  else
  {
    v6 = *(_QWORD *)(v4 + 32);
    swift_retain(v6);
  }
  if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) & 1) == 0)
  {
    swift_release(v6);
    if (v5 == 1)
      goto LABEL_16;
    v7 = 5;
    while (1)
    {
      v8 = v7 - 4;
      if ((v4 & 0xC000000000000001) != 0)
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v4);
        v9 = __OFADD__(v8, 1);
        v10 = v7 - 3;
        if (v9)
          goto LABEL_18;
      }
      else
      {
        v6 = *(_QWORD *)(v4 + 8 * v7);
        swift_retain(v6);
        v9 = __OFADD__(v8, 1);
        v10 = v7 - 3;
        if (v9)
        {
LABEL_18:
          __break(1u);
LABEL_19:
          if (v4 < 0)
            v12 = v4;
          else
            v12 = v4 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v4);
          v5 = _CocoaArrayWrapper.endIndex.getter(v12);
          if (!v5)
            goto LABEL_16;
          goto LABEL_3;
        }
      }
      if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC4Trip21CardCellConfiguration_dataType) & 1) != 0)
        break;
      swift_release(v6);
      ++v7;
      if (v10 == v5)
        goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease_n(v4, 2);
  return v6;
}

uint64_t sub_100019AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v6 = sub_1000064D4(&qword_100033E28);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v7);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v10 = sub_1000064D4(&qword_100033E30);
  sub_100019BAC(a2, a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  sub_1000142AC((uint64_t)v9, a3, &qword_100033E28);
  v11 = (_QWORD *)(a3 + *(int *)(sub_1000064D4(&qword_100033E38) + 36));
  *v11 = 0x7765695670697254;
  v11[1] = 0xE800000000000000;
  return sub_10000D68C((uint64_t)v9, &qword_100033E28);
}

uint64_t sub_100019BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t KeyPath;
  uint64_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
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
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
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
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char **v95;
  char v96;
  unint64_t v97;
  __n128 v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char **v116;
  unint64_t v117;
  __n128 v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _OWORD v144[12];
  _OWORD v145[2];
  _OWORD v146[14];
  _QWORD v147[2];
  _BYTE v148[225];
  _BYTE v149[248];
  _BYTE v150[273];
  _QWORD v151[2];
  char v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[280];
  _QWORD v168[38];
  _DWORD v169[2];
  _DWORD v170[2];
  _DWORD v171[2];
  unsigned __int8 v172;
  _DWORD v173[2];
  _DWORD v174[2];
  unsigned __int8 v175;
  char v176;
  __int128 v177;
  _OWORD v178[2];
  _OWORD v179[2];
  _BYTE v180[200];

  v132 = a2;
  v142 = a3;
  v135 = sub_1000064D4(&qword_100033E40);
  v4 = *(_QWORD *)(v135 - 8);
  __chkstk_darwin(v135);
  v6 = (char *)&v132 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = sub_1000064D4(&qword_100033E48);
  __chkstk_darwin(v133);
  v134 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_1000064D4(&qword_100033E50);
  __chkstk_darwin(v140);
  v136 = (char *)&v132 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = sub_1000064D4(&qword_100033E58);
  __chkstk_darwin(v137);
  v139 = (uint64_t)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_1000064D4(&qword_100033E60);
  __chkstk_darwin(v138);
  v11 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000064D4(&qword_100033E68);
  v13 = __chkstk_darwin(v12);
  v141 = (uint64_t)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v143 = (uint64_t)&v132 - v15;
  v16 = *(_OWORD *)(a1 + 16);
  v178[0] = *(_OWORD *)a1;
  v178[1] = v16;
  v179[0] = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)v179 + 9) = *(_OWORD *)(a1 + 41);
  sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v168);
  sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v17 = LOBYTE(v168[0]);
  v18 = v168[1];
  v19 = v168[2];
  v20 = v168[4];
  v21 = v168[5];
  swift_release(v168[6]);
  swift_release(v21);
  swift_release(v20);
  swift_release(v19);
  v22 = swift_release(v18);
  if (v17 && *(_BYTE *)(*(_QWORD *)(a1 + 72) + OBJC_IVAR____TtC4Trip9CardModel_showsTitle) == 1)
  {
    v23 = static VerticalAlignment.center.getter(v22);
    sub_10001AD08((_OWORD *)a1, (uint64_t)v150);
    *(_OWORD *)&v167[119] = *(_OWORD *)&v150[112];
    *(_OWORD *)&v167[103] = *(_OWORD *)&v150[96];
    *(_OWORD *)&v167[55] = *(_OWORD *)&v150[48];
    *(_OWORD *)&v167[39] = *(_OWORD *)&v150[32];
    *(_OWORD *)&v167[135] = *(_OWORD *)&v150[128];
    *(_OWORD *)&v167[144] = *(_OWORD *)&v150[137];
    *(_OWORD *)&v167[71] = *(_OWORD *)&v150[64];
    *(_OWORD *)&v167[87] = *(_OWORD *)&v150[80];
    *(_OWORD *)&v167[7] = *(_OWORD *)v150;
    *(_OWORD *)&v167[23] = *(_OWORD *)&v150[16];
    *(_OWORD *)((char *)&v168[14] + 1) = *(_OWORD *)&v167[96];
    *(_OWORD *)((char *)&v168[16] + 1) = *(_OWORD *)&v167[112];
    *(_OWORD *)((char *)&v168[18] + 1) = *(_OWORD *)&v167[128];
    *(_OWORD *)((char *)&v168[20] + 1) = *(_OWORD *)&v150[137];
    *(_OWORD *)((char *)&v168[6] + 1) = *(_OWORD *)&v167[32];
    *(_OWORD *)((char *)&v168[8] + 1) = *(_OWORD *)&v167[48];
    *(_OWORD *)((char *)&v168[10] + 1) = *(_OWORD *)&v167[64];
    *(_OWORD *)((char *)&v168[12] + 1) = *(_OWORD *)&v167[80];
    *(_OWORD *)((char *)&v168[2] + 1) = *(_OWORD *)v167;
    v149[0] = 1;
    v168[0] = v23;
    v168[1] = 0;
    LOBYTE(v168[2]) = 1;
    *(_OWORD *)((char *)&v168[4] + 1) = *(_OWORD *)&v167[16];
    nullsub_1(v168);
  }
  else
  {
    sub_10001C7D4((uint64_t)v168);
  }
  sub_100013F2C((uint64_t)v168, (uint64_t)v180, &qword_100033E70);
  sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v168);
  sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v24 = LOBYTE(v168[0]);
  v25 = v168[1];
  v26 = v168[2];
  v27 = v168[4];
  v28 = v168[5];
  swift_release(v168[6]);
  swift_release(v28);
  swift_release(v27);
  swift_release(v26);
  v29 = swift_release(v25);
  if (v24 != 2)
  {
    v177 = *(_OWORD *)(a1 + 64);
    v49 = *((_QWORD *)&v177 + 1);
    if (*(_BYTE *)(*((_QWORD *)&v177 + 1) + OBJC_IVAR____TtC4Trip9CardModel_cardLayoutType) == 1)
    {
      v50 = (uint64_t)sub_100019770();
      v51 = v50;
      if ((unint64_t)v50 >> 62)
      {
        if (v50 >= 0)
          v50 &= 0xFFFFFFFFFFFFFF8uLL;
        v52 = _CocoaArrayWrapper.endIndex.getter(v50);
      }
      else
      {
        v52 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v29 = swift_bridgeObjectRelease(v51);
      if (v52 == 1)
      {
        KeyPath = swift_getKeyPath(&unk_100022D90);
        v54 = swift_getKeyPath(&unk_100022DB8);
        v55 = swift_retain(v49);
        static Published.subscript.getter(v168, v55, KeyPath, v54);
        swift_release(KeyPath);
        swift_release(v54);
        result = sub_100013874((uint64_t)&v177);
        v57 = v168[0];
        if (v168[0] >> 62)
        {
          if (v168[0] < 0)
            v67 = v168[0];
          else
            v67 = v168[0] & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v168[0]);
          v68 = _CocoaArrayWrapper.endIndex.getter(v67);
          result = swift_bridgeObjectRelease(v57);
          if (v68)
            goto LABEL_13;
        }
        else if (*(_QWORD *)((v168[0] & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_13:
          if ((v57 & 0xC000000000000001) != 0)
          {
            v58 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v57);
          }
          else
          {
            if (!*(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            v58 = *(_QWORD *)(v57 + 32);
            swift_retain(v58);
          }
          v59 = swift_bridgeObjectRelease(v57);
          v60 = static VerticalAlignment.center.getter(v59);
          v61 = static HorizontalAlignment.center.getter(v60);
          sub_10001B5F4(v58, a1, (uint64_t)v144);
          LOBYTE(v170[0]) = 1;
          *(_OWORD *)((char *)&v146[10] + 7) = v144[10];
          *(_OWORD *)((char *)&v146[11] + 7) = v144[11];
          *(_OWORD *)((char *)&v146[12] + 7) = v145[0];
          v146[13] = *(_OWORD *)((char *)v145 + 9);
          *(_OWORD *)((char *)&v146[6] + 7) = v144[6];
          *(_OWORD *)((char *)&v146[7] + 7) = v144[7];
          *(_OWORD *)((char *)&v146[8] + 7) = v144[8];
          *(_OWORD *)((char *)&v146[9] + 7) = v144[9];
          *(_OWORD *)((char *)&v146[2] + 7) = v144[2];
          *(_OWORD *)((char *)&v146[3] + 7) = v144[3];
          *(_OWORD *)((char *)&v146[4] + 7) = v144[4];
          *(_OWORD *)((char *)&v146[5] + 7) = v144[5];
          *(_OWORD *)((char *)v146 + 7) = v144[0];
          *(_OWORD *)((char *)&v146[1] + 7) = v144[1];
          v147[0] = v61;
          v147[1] = 0;
          v148[0] = 1;
          *(_OWORD *)&v148[161] = v146[10];
          *(_OWORD *)&v148[177] = v146[11];
          *(_OWORD *)&v148[193] = v146[12];
          *(_OWORD *)&v148[209] = *(_OWORD *)((char *)v145 + 9);
          *(_OWORD *)&v148[97] = v146[6];
          *(_OWORD *)&v148[113] = v146[7];
          *(_OWORD *)&v148[129] = v146[8];
          *(_OWORD *)&v148[145] = v146[9];
          *(_OWORD *)&v148[33] = v146[2];
          *(_OWORD *)&v148[49] = v146[3];
          *(_OWORD *)&v148[65] = v146[4];
          *(_OWORD *)&v148[81] = v146[5];
          *(_OWORD *)&v148[1] = v146[0];
          *(_OWORD *)&v148[17] = v146[1];
          *(_OWORD *)&v149[199] = *(_OWORD *)&v148[176];
          *(_OWORD *)&v149[215] = *(_OWORD *)&v148[192];
          *(_OWORD *)&v149[231] = *(_OWORD *)&v148[208];
          *(_OWORD *)&v149[135] = *(_OWORD *)&v148[112];
          *(_OWORD *)&v149[151] = *(_OWORD *)&v148[128];
          *(_OWORD *)&v149[167] = *(_OWORD *)&v148[144];
          *(_OWORD *)&v149[183] = *(_OWORD *)&v148[160];
          *(_OWORD *)&v149[71] = *(_OWORD *)&v148[48];
          *(_OWORD *)&v149[87] = *(_OWORD *)&v148[64];
          *(_OWORD *)&v149[103] = *(_OWORD *)&v148[80];
          *(_OWORD *)&v149[119] = *(_OWORD *)&v148[96];
          *(_OWORD *)&v149[7] = (unint64_t)v61;
          *(_OWORD *)&v149[23] = *(_OWORD *)v148;
          *(_OWORD *)&v149[39] = *(_OWORD *)&v148[16];
          *(_OWORD *)&v149[55] = *(_OWORD *)&v148[32];
          *(_OWORD *)&v150[201] = *(_OWORD *)&v149[192];
          *(_OWORD *)&v150[217] = *(_OWORD *)&v149[208];
          *(_OWORD *)&v150[233] = *(_OWORD *)&v149[224];
          *(_OWORD *)&v150[137] = *(_OWORD *)&v149[128];
          *(_OWORD *)&v150[153] = *(_OWORD *)&v149[144];
          *(_OWORD *)&v150[169] = *(_OWORD *)&v149[160];
          *(_OWORD *)&v150[185] = *(_OWORD *)&v149[176];
          *(_OWORD *)&v150[73] = *(_OWORD *)&v149[64];
          *(_OWORD *)&v150[89] = *(_OWORD *)&v149[80];
          *(_OWORD *)&v150[105] = *(_OWORD *)&v149[96];
          *(_OWORD *)&v150[121] = *(_OWORD *)&v149[112];
          *(_OWORD *)&v150[9] = *(_OWORD *)v149;
          *(_OWORD *)&v150[25] = *(_OWORD *)&v149[16];
          *(_OWORD *)&v150[41] = *(_OWORD *)&v149[32];
          *(_OWORD *)&v150[57] = *(_OWORD *)&v149[48];
          v163 = v146[10];
          v164 = v146[11];
          v165 = v146[12];
          v166 = *(_OWORD *)((char *)v145 + 9);
          v159 = v146[6];
          v160 = v146[7];
          v161 = v146[8];
          v162 = v146[9];
          v155 = v146[2];
          v156 = v146[3];
          v157 = v146[4];
          v158 = v146[5];
          v153 = v146[0];
          LOBYTE(v173[0]) = 1;
          v149[247] = BYTE8(v145[1]);
          LOBYTE(v171[0]) = 1;
          *(_QWORD *)v150 = 0;
          v150[8] = 1;
          *(_QWORD *)&v150[249] = *(_QWORD *)&v149[240];
          *(_QWORD *)&v150[264] = 0;
          v150[272] = 1;
          v151[0] = v61;
          v151[1] = 0;
          v152 = 1;
          v154 = v146[1];
          sub_10001CAA0((uint64_t)v147);
          sub_10001CAE4((uint64_t)v151);
          LOBYTE(v174[0]) = 1;
          memcpy(&v167[7], v150, 0x111uLL);
          v168[0] = v60;
          v168[1] = 0;
          LOBYTE(v168[2]) = 1;
          memcpy((char *)&v168[2] + 1, v167, 0x118uLL);
          v62 = v134;
          memcpy(v134, v168, 0x129uLL);
          swift_storeEnumTagMultiPayload(v62, v133, 0);
          sub_10001CB28((uint64_t)v150);
          sub_10001CB6C((uint64_t)v168);
          v63 = sub_1000064D4(&qword_100033E88);
          v64 = sub_1000073C4(&qword_100033E90, &qword_100033E88, (uint64_t)&protocol conformance descriptor for HStack<A>);
          v65 = sub_1000073C4(&qword_100033E98, &qword_100033E40, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
          v66 = (uint64_t)v136;
          _ConditionalContent<>.init(storage:)(v62, v63, v135, v64, v65);
          swift_release(v58);
          sub_10001CAE4((uint64_t)v147);
          sub_10001CAE4((uint64_t)v147);
          goto LABEL_26;
        }
        v29 = swift_bridgeObjectRelease(v57);
      }
    }
    v69 = __chkstk_darwin(v29);
    v70 = static Axis.Set.vertical.getter(v69);
    v71 = sub_1000064D4(&qword_100033E78);
    v72 = sub_1000073C4(&qword_100033E80, &qword_100033E78, (uint64_t)&protocol conformance descriptor for VStack<A>);
    ScrollView.init(_:showsIndicators:content:)(v70, 1, sub_10001C7F8, &v132 - 4, v71, v72);
    v74 = v134;
    v73 = v135;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v134, v6, v135);
    swift_storeEnumTagMultiPayload(v74, v133, 1);
    v75 = sub_1000064D4(&qword_100033E88);
    v76 = sub_1000073C4(&qword_100033E90, &qword_100033E88, (uint64_t)&protocol conformance descriptor for HStack<A>);
    v77 = sub_1000073C4(&qword_100033E98, &qword_100033E40, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
    v66 = (uint64_t)v136;
    _ConditionalContent<>.init(storage:)(v74, v75, v73, v76, v77);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v73);
LABEL_26:
    v44 = &qword_100033E50;
    v78 = v139;
    sub_1000142AC(v66, v139, &qword_100033E50);
    swift_storeEnumTagMultiPayload(v78, v137, 1);
    v79 = sub_1000073C4(&qword_100033EA0, &qword_100033E60, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v80 = sub_10001C800();
    _ConditionalContent<>.init(storage:)(v78, v138, v140, v79, v80);
    v48 = v66;
    goto LABEL_27;
  }
  *(_QWORD *)v11 = static HorizontalAlignment.leading.getter(v29);
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 0;
  sub_1000064D4(&qword_100033EC8);
  v144[0] = *(_OWORD *)(a1 + 64);
  v30 = *((_QWORD *)&v144[0] + 1);
  v31 = swift_getKeyPath(&unk_100022D90);
  v32 = swift_getKeyPath(&unk_100022DB8);
  v33 = swift_retain(v30);
  static Published.subscript.getter(v168, v33, v31, v32);
  swift_release(v31);
  swift_release(v32);
  sub_100013874((uint64_t)v144);
  v34 = swift_allocObject(&unk_10002D7D8, 113, 7);
  v35 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v34 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v34 + 96) = v35;
  *(_BYTE *)(v34 + 112) = *(_BYTE *)(a1 + 96);
  v36 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v34 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v34 + 32) = v36;
  v37 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v34 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v34 + 64) = v37;
  sub_10001C77C(a1);
  v38 = sub_1000064D4((uint64_t *)&unk_100033640);
  v39 = type metadata accessor for UUID(0);
  v40 = sub_1000064D4(&qword_100033ED0);
  v41 = sub_1000073C4(&qword_100033ED8, (uint64_t *)&unk_100033640, (uint64_t)&protocol conformance descriptor for [A]);
  v42 = sub_10001CC1C(&qword_100033EE0, &qword_100033ED0, (void (*)(void))sub_10001CC00);
  v43 = sub_10001CCCC(&qword_100033F00, (uint64_t)&unk_100022BD4);
  ForEach<>.init(_:content:)(v168, sub_10001CBF8, v34, v38, v39, v40, v41, v42, v43);
  v44 = &qword_100033E60;
  v45 = v139;
  sub_1000142AC((uint64_t)v11, v139, &qword_100033E60);
  swift_storeEnumTagMultiPayload(v45, v137, 0);
  v46 = sub_1000073C4(&qword_100033EA0, &qword_100033E60, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v47 = sub_10001C800();
  _ConditionalContent<>.init(storage:)(v45, v138, v140, v46, v47);
  v48 = (uint64_t)v11;
LABEL_27:
  sub_10000D68C(v48, v44);
  v81 = sub_100019914();
  if (v81)
  {
    v82 = v81;
    v83 = swift_getKeyPath(&unk_100022D68);
    v84 = type metadata accessor for CardCellConfiguration(0);
    v85 = sub_10001CCCC(&qword_100033EC0, (uint64_t)&unk_100022B9C);
    v86 = swift_retain(v82);
    v87 = ObservedObject.init(wrappedValue:)(v86, v84, v85);
    v137 = v88;
    v138 = v87;
    LODWORD(v85) = static Edge.Set.leading.getter();
    sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)v168);
    sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v89 = v168[1];
    v90 = v168[2];
    v91 = v168[4];
    v92 = v168[5];
    v93 = v168[6];
    v140 = v83;
    LODWORD(v139) = v85;
    if (LOBYTE(v168[0]))
    {
      if (LOBYTE(v168[0]) == 1)
      {
        v94 = type metadata accessor for ClusterMetrics();
        v95 = (char **)&off_10002D948;
        *(_QWORD *)&v150[32] = &off_10002D948;
        *(_QWORD *)&v150[24] = v94;
        *(_QWORD *)v150 = v92;
      }
      else
      {
        v94 = type metadata accessor for WidgetMetrics();
        v95 = &off_10002D8B8;
        *(_QWORD *)&v150[32] = &off_10002D8B8;
        *(_QWORD *)&v150[24] = v94;
        *(_QWORD *)v150 = v93;
        v93 = v92;
      }
      v92 = v91;
    }
    else
    {
      v94 = type metadata accessor for ConsoleMetrics();
      v95 = (char **)&off_10002D9D8;
      *(_QWORD *)&v150[32] = &off_10002D9D8;
      *(_QWORD *)&v150[24] = v94;
      *(_QWORD *)v150 = v91;
    }
    swift_release(v93);
    swift_release(v92);
    swift_release(v90);
    swift_release(v89);
    v96 = *(_BYTE *)(a1 + 96);
    sub_100013D4C(v150, v94);
    ((void (__cdecl *)())v95[4])();
    v98.n128_u64[0] = v97;
    v100 = EdgeInsets.init(_all:)(v99, v98);
    v102 = v101;
    v104 = v103;
    v106 = v105;
    v175 = 0;
    v172 = 0;
    v107 = sub_10000D714(v150);
    LODWORD(v134) = v175;
    v171[0] = v146[0];
    *(_DWORD *)((char *)v171 + 3) = *(_DWORD *)((char *)v146 + 3);
    v170[0] = v174[0];
    *(_DWORD *)((char *)v170 + 3) = *(_DWORD *)((char *)v174 + 3);
    v169[0] = v173[0];
    *(_DWORD *)((char *)v169 + 3) = *(_DWORD *)((char *)v173 + 3);
    v108 = v172;
    v109 = static Edge.Set.trailing.getter(v107);
    sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)v168);
    sub_100013D10((uint64_t)v178, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v110 = v168[1];
    v111 = v168[2];
    v112 = v168[4];
    v113 = v168[5];
    v114 = v168[6];
    LODWORD(v136) = v108;
    LODWORD(v135) = v109;
    if (LOBYTE(v168[0]))
    {
      if (LOBYTE(v168[0]) == 1)
      {
        v115 = type metadata accessor for ClusterMetrics();
        v116 = (char **)&off_10002D948;
        *(_QWORD *)&v149[32] = &off_10002D948;
        *(_QWORD *)&v149[24] = v115;
        *(_QWORD *)v149 = v113;
      }
      else
      {
        v115 = type metadata accessor for WidgetMetrics();
        v116 = &off_10002D8B8;
        *(_QWORD *)&v149[32] = &off_10002D8B8;
        *(_QWORD *)&v149[24] = v115;
        *(_QWORD *)v149 = v114;
        v114 = v113;
      }
      v113 = v112;
    }
    else
    {
      v115 = type metadata accessor for ConsoleMetrics();
      v116 = (char **)&off_10002D9D8;
      *(_QWORD *)&v149[32] = &off_10002D9D8;
      *(_QWORD *)&v149[24] = v115;
      *(_QWORD *)v149 = v112;
    }
    swift_release(v114);
    swift_release(v113);
    swift_release(v111);
    swift_release(v110);
    sub_100013D4C(v149, v115);
    ((void (__cdecl *)())v116[4])();
    v118.n128_u64[0] = v117;
    v120 = EdgeInsets.init(_all:)(v119, v118);
    v122 = v121;
    v124 = v123;
    v126 = v125;
    swift_release(v82);
    v176 = 0;
    sub_10000D714(v149);
    *(_DWORD *)&v167[137] = v151[0];
    *(_DWORD *)&v167[140] = *(_DWORD *)((char *)v151 + 3);
    *(_DWORD *)&v167[145] = v147[0];
    *(_DWORD *)&v167[148] = *(_DWORD *)((char *)v147 + 3);
    *(_QWORD *)v167 = v140;
    memset(&v167[8], 0, 48);
    v167[56] = (_BYTE)v134;
    *(_DWORD *)&v167[57] = v171[0];
    *(_DWORD *)&v167[60] = *(_DWORD *)((char *)v171 + 3);
    *(_QWORD *)&v167[64] = v138;
    *(_QWORD *)&v167[72] = v137;
    v167[80] = v96;
    *(_DWORD *)&v167[84] = *(_DWORD *)((char *)v170 + 3);
    *(_DWORD *)&v167[81] = v170[0];
    *(_QWORD *)&v167[88] = 0x3FF8000000000000;
    v167[96] = v139;
    *(_DWORD *)&v167[100] = *(_DWORD *)((char *)v169 + 3);
    *(_DWORD *)&v167[97] = v169[0];
    *(double *)&v167[104] = v100;
    *(_QWORD *)&v167[112] = v102;
    *(_QWORD *)&v167[120] = v104;
    *(_QWORD *)&v167[128] = v106;
    v167[136] = (_BYTE)v136;
    v167[144] = v135;
    *(double *)&v167[152] = v120;
    *(_QWORD *)&v167[160] = v122;
    *(_QWORD *)&v167[168] = v124;
    *(_QWORD *)&v167[176] = v126;
    v167[184] = v176;
    nullsub_1(v167);
  }
  else
  {
    sub_10001C89C(v167);
  }
  sub_100013F2C((uint64_t)v167, (uint64_t)v168, &qword_100033EB0);
  sub_100013F2C((uint64_t)v180, (uint64_t)v146, &qword_100033E70);
  v127 = v143;
  v128 = v141;
  sub_1000142AC(v143, v141, &qword_100033E68);
  sub_100013F2C((uint64_t)v168, (uint64_t)v149, &qword_100033EB0);
  sub_100013F2C((uint64_t)v146, (uint64_t)v147, &qword_100033E70);
  v129 = v142;
  sub_100013F2C((uint64_t)v147, v142, &qword_100033E70);
  v130 = sub_1000064D4(&qword_100033EB8);
  sub_1000142AC(v128, v129 + *(int *)(v130 + 48), &qword_100033E68);
  v131 = v129 + *(int *)(v130 + 64);
  sub_100013F2C((uint64_t)v149, (uint64_t)v150, &qword_100033EB0);
  sub_100013F2C((uint64_t)v150, v131, &qword_100033EB0);
  sub_10001C9E4((uint64_t)v147, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001C8C0);
  sub_10001C938((uint64_t)v150, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001C900);
  sub_10000D68C(v127, &qword_100033E68);
  sub_100013F2C((uint64_t)v149, (uint64_t)v167, &qword_100033EB0);
  sub_10001C938((uint64_t)v167, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001C9AC);
  sub_10000D68C(v128, &qword_100033E68);
  sub_100013F2C((uint64_t)v146, (uint64_t)v151, &qword_100033E70);
  return sub_10001C9E4((uint64_t)v151, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001CA50);
}

uint64_t sub_10001AD08@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char **v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char **v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD *v46;
  __n128 v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  _OWORD *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[25];
  char v73;
  _BYTE v74[128];
  char v75;
  _QWORD v76[2];
  char v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  _OWORD v97[2];
  _OWORD v98[2];
  __int128 v99;

  v99 = a1[4];
  KeyPath = swift_getKeyPath(&unk_100022DD8);
  v5 = swift_getKeyPath(&unk_100022E00);
  v6 = swift_retain(*((_QWORD *)&v99 + 1));
  static Published.subscript.getter(v74, v6, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  sub_100013874((uint64_t)&v99);
  v7 = sub_1000140D4();
  v8 = Text.init<A>(_:)(v74, &type metadata for String, v7);
  v10 = v9;
  v63 = v11;
  v59 = v12;
  v13 = a1[1];
  v97[0] = *a1;
  v97[1] = v13;
  v98[0] = a1[2];
  v65 = a1;
  *(_OWORD *)((char *)v98 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v74);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v14 = *(_QWORD *)&v74[8];
  v15 = *(_QWORD *)&v74[16];
  v16 = *(_QWORD *)&v74[32];
  v17 = *(_QWORD *)&v74[40];
  v18 = *(_QWORD *)&v74[48];
  if (v74[0])
  {
    if (v74[0] == 1)
    {
      v19 = type metadata accessor for ClusterMetrics();
      v20 = (char **)&off_10002D948;
      *(_QWORD *)&v74[24] = v19;
      *(_QWORD *)&v74[32] = &off_10002D948;
      *(_QWORD *)v74 = v17;
    }
    else
    {
      v19 = type metadata accessor for WidgetMetrics();
      v20 = &off_10002D8B8;
      *(_QWORD *)&v74[24] = v19;
      *(_QWORD *)&v74[32] = &off_10002D8B8;
      *(_QWORD *)v74 = v18;
      v18 = v17;
    }
    v17 = v16;
  }
  else
  {
    v19 = type metadata accessor for ConsoleMetrics();
    v20 = (char **)&off_10002D9D8;
    *(_QWORD *)&v74[24] = v19;
    *(_QWORD *)&v74[32] = &off_10002D9D8;
    *(_QWORD *)v74 = v16;
  }
  swift_release(v18);
  swift_release(v17);
  swift_release(v15);
  swift_release(v14);
  sub_100013D4C(v74, v19);
  v21 = ((uint64_t (__cdecl *)())v20[9])();
  v22 = v63 & 1;
  v23 = Text.font(_:)(v21, v8, v10, v63 & 1, v59);
  v62 = v24;
  v64 = v23;
  v60 = v25;
  v61 = v26;
  sub_100013F1C(v8, v10, v22);
  swift_release(v21);
  swift_bridgeObjectRelease(v59);
  sub_10000D714(v74);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v74);
  sub_100013D10((uint64_t)v97, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v27 = *(_QWORD *)&v74[8];
  v28 = *(_QWORD *)&v74[16];
  v29 = *(_QWORD *)&v74[32];
  v30 = *(_QWORD *)&v74[40];
  v31 = *(_QWORD *)&v74[48];
  if (v74[0])
  {
    if (v74[0] == 1)
    {
      v32 = type metadata accessor for ClusterMetrics();
      v33 = (char **)&off_10002D948;
      *(_QWORD *)&v74[24] = v32;
      *(_QWORD *)&v74[32] = &off_10002D948;
      *(_QWORD *)v74 = v30;
    }
    else
    {
      v32 = type metadata accessor for WidgetMetrics();
      v33 = &off_10002D8B8;
      *(_QWORD *)&v74[24] = v32;
      *(_QWORD *)&v74[32] = &off_10002D8B8;
      *(_QWORD *)v74 = v31;
      v31 = v30;
    }
    v30 = v29;
  }
  else
  {
    v32 = type metadata accessor for ConsoleMetrics();
    v33 = (char **)&off_10002D9D8;
    *(_QWORD *)&v74[24] = v32;
    *(_QWORD *)&v74[32] = &off_10002D9D8;
    *(_QWORD *)v74 = v29;
  }
  swift_release(v31);
  swift_release(v30);
  swift_release(v28);
  swift_release(v27);
  sub_100013D4C(v74, v32);
  v34 = ((double (__cdecl *)())v33[1])();
  v35 = static Alignment.bottom.getter();
  _FrameLayout.init(width:height:alignment:)(&v91, 0, 1, *(_QWORD *)&v34, 0, v35, v36);
  v37 = v91;
  v38 = v92;
  v39 = v93;
  v40 = v94;
  v42 = v95;
  v41 = v96;
  v43 = sub_10000D714(v74);
  v44 = static Edge.Set.bottom.getter(v43);
  *(_OWORD *)v74 = v65[5];
  v45 = sub_1000064D4(&qword_100032C18);
  v46 = State.wrappedValue.getter(v76, v45);
  v47.n128_u64[0] = 24.0;
  if (LOBYTE(v76[0]))
    v47.n128_f64[0] = 0.0;
  v48 = EdgeInsets.init(_all:)(v46, v47);
  *(_QWORD *)&v66 = v64;
  *((_QWORD *)&v66 + 1) = v62;
  LOBYTE(v67) = v60 & 1;
  *((_QWORD *)&v67 + 1) = v61;
  *(_QWORD *)&v68 = v37;
  BYTE8(v68) = v38 & 1;
  *(_QWORD *)&v69 = v39;
  BYTE8(v69) = v40 & 1;
  *(_QWORD *)&v70 = v42;
  *((_QWORD *)&v70 + 1) = v41;
  LOBYTE(v71) = v44;
  *((double *)&v71 + 1) = v48;
  *(_QWORD *)v72 = v49;
  *(_QWORD *)&v72[8] = v50;
  *(_QWORD *)&v72[16] = v51;
  v72[24] = 0;
  v75 = 1;
  *(_OWORD *)&v74[55] = v69;
  *(_OWORD *)&v74[39] = v68;
  *(_OWORD *)&v74[23] = v67;
  *(_OWORD *)&v74[7] = v66;
  *(_OWORD *)&v74[112] = *(_OWORD *)&v72[9];
  *(_OWORD *)&v74[103] = *(_OWORD *)v72;
  *(_OWORD *)&v74[87] = v71;
  *(_OWORD *)&v74[71] = v70;
  v73 = 1;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v52 = *(_OWORD *)v74;
  v53 = *(_OWORD *)&v74[16];
  v54 = *(_OWORD *)&v74[32];
  *(_OWORD *)(a2 + 57) = *(_OWORD *)&v74[48];
  *(_OWORD *)(a2 + 41) = v54;
  *(_OWORD *)(a2 + 25) = v53;
  *(_OWORD *)(a2 + 9) = v52;
  v55 = *(_OWORD *)&v74[64];
  v56 = *(_OWORD *)&v74[80];
  v57 = *(_OWORD *)&v74[96];
  *(_OWORD *)(a2 + 121) = *(_OWORD *)&v74[112];
  *(_OWORD *)(a2 + 105) = v57;
  *(_OWORD *)(a2 + 89) = v56;
  *(_OWORD *)(a2 + 73) = v55;
  *(_QWORD *)(a2 + 144) = 0;
  *(_BYTE *)(a2 + 152) = 1;
  v76[0] = v64;
  v76[1] = v62;
  v77 = v60 & 1;
  v78 = v61;
  v79 = v37;
  v80 = v38 & 1;
  v81 = v39;
  v82 = v40 & 1;
  v83 = v42;
  v84 = v41;
  v85 = v44;
  v86 = v48;
  v87 = v49;
  v88 = v50;
  v89 = v51;
  v90 = 0;
  sub_10001CD14((uint64_t)&v66);
  return sub_10001CD50((uint64_t)v76);
}

double sub_10001B1EC@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  char **v15;
  char **v16;
  uint64_t v17;
  char **v18;
  unint64_t v19;
  __n128 v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char **v33;
  char **v34;
  char **v35;
  uint64_t v36;
  char **v37;
  unint64_t v38;
  __n128 v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  double result;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t KeyPath;
  _BYTE v57[7];
  _BYTE v58[7];
  _BYTE v59[7];
  _QWORD v60[3];
  uint64_t v61;
  char **v62;
  char **v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char **v67;
  char **v68;
  char **v69;
  char v70;
  _BYTE v71[7];
  _BYTE v72[7];
  _BYTE v73[7];
  char v74;
  char v75;
  _BYTE v76[7];
  _BYTE v77[7];
  _OWORD v78[2];
  _OWORD v79[3];

  v5 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022D68);
  v6 = type metadata accessor for CardCellConfiguration(0);
  v7 = sub_10001CCCC(&qword_100033EC0, (uint64_t)&unk_100022B9C);
  v8 = swift_retain(v5);
  v9 = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  v54 = v10;
  v55 = v9;
  v53 = static Edge.Set.leading.getter();
  v11 = *(_OWORD *)(a2 + 16);
  v78[0] = *(_OWORD *)a2;
  v78[1] = v11;
  v79[0] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)((char *)v79 + 9) = *(_OWORD *)(a2 + 41);
  sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v63);
  sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v12 = v64;
  v13 = v65;
  v14 = v67;
  v15 = v68;
  v16 = v69;
  if ((_BYTE)v63)
  {
    if (v63 == 1)
    {
      v17 = type metadata accessor for ClusterMetrics();
      v18 = (char **)&off_10002D948;
      v61 = v17;
      v62 = (char **)&off_10002D948;
      v60[0] = v15;
    }
    else
    {
      v17 = type metadata accessor for WidgetMetrics();
      v18 = &off_10002D8B8;
      v61 = v17;
      v62 = &off_10002D8B8;
      v60[0] = v16;
      v16 = v15;
    }
    v15 = v14;
  }
  else
  {
    v17 = type metadata accessor for ConsoleMetrics();
    v18 = (char **)&off_10002D9D8;
    v61 = v17;
    v62 = (char **)&off_10002D9D8;
    v60[0] = v14;
  }
  swift_release(v16);
  swift_release(v15);
  swift_release(v13);
  swift_release(v12);
  v52 = *(_BYTE *)(a2 + 96);
  sub_100013D4C(v60, v17);
  ((void (__cdecl *)())v18[4])();
  v20.n128_u64[0] = v19;
  v22 = EdgeInsets.init(_all:)(v21, v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v74 = 0;
  v70 = 0;
  v29 = sub_10000D714(v60);
  *(_DWORD *)v59 = *(_DWORD *)v73;
  *(_DWORD *)&v59[3] = *(_DWORD *)&v73[3];
  *(_DWORD *)v58 = *(_DWORD *)v72;
  *(_DWORD *)&v58[3] = *(_DWORD *)&v72[3];
  *(_DWORD *)v57 = *(_DWORD *)v71;
  *(_DWORD *)&v57[3] = *(_DWORD *)&v71[3];
  v50 = v70;
  v51 = v74;
  v30 = static Edge.Set.trailing.getter(v29);
  sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v63);
  sub_100013D10((uint64_t)v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v31 = v64;
  v32 = v65;
  v34 = v67;
  v33 = v68;
  v35 = v69;
  if ((_BYTE)v63)
  {
    if (v63 == 1)
    {
      v36 = type metadata accessor for ClusterMetrics();
      v37 = (char **)&off_10002D948;
      v66 = v36;
      v67 = (char **)&off_10002D948;
      v63 = v33;
    }
    else
    {
      v36 = type metadata accessor for WidgetMetrics();
      v37 = &off_10002D8B8;
      v66 = v36;
      v67 = &off_10002D8B8;
      v63 = v35;
      v35 = v33;
    }
    v33 = v34;
  }
  else
  {
    v36 = type metadata accessor for ConsoleMetrics();
    v37 = (char **)&off_10002D9D8;
    v66 = v36;
    v67 = (char **)&off_10002D9D8;
    v63 = v34;
  }
  swift_release(v35);
  swift_release(v33);
  swift_release(v32);
  swift_release(v31);
  sub_100013D4C(&v63, v36);
  ((void (__cdecl *)())v37[4])();
  v39.n128_u64[0] = v38;
  v41 = EdgeInsets.init(_all:)(v40, v39);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  *(_DWORD *)(a3 + 57) = *(_DWORD *)v59;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a3 + 81) = *(_DWORD *)v58;
  *(_DWORD *)(a3 + 84) = *(_DWORD *)&v58[3];
  *(_DWORD *)(a3 + 97) = *(_DWORD *)v57;
  *(_DWORD *)(a3 + 100) = *(_DWORD *)&v57[3];
  v75 = 0;
  sub_10000D714(&v63);
  *(_DWORD *)(a3 + 137) = *(_DWORD *)v77;
  *(_DWORD *)(a3 + 140) = *(_DWORD *)&v77[3];
  *(_DWORD *)(a3 + 145) = *(_DWORD *)v76;
  *(_DWORD *)(a3 + 148) = *(_DWORD *)&v76[3];
  v48 = v75;
  *(_QWORD *)a3 = KeyPath;
  result = 0.0;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_BYTE *)(a3 + 56) = v51;
  *(_QWORD *)(a3 + 64) = v55;
  *(_QWORD *)(a3 + 72) = v54;
  *(_BYTE *)(a3 + 80) = v52;
  *(_QWORD *)(a3 + 88) = 0x3FF8000000000000;
  *(_BYTE *)(a3 + 96) = v53;
  *(double *)(a3 + 104) = v22;
  *(_QWORD *)(a3 + 112) = v24;
  *(_QWORD *)(a3 + 120) = v26;
  *(_QWORD *)(a3 + 128) = v28;
  *(_BYTE *)(a3 + 136) = v50;
  *(_BYTE *)(a3 + 144) = v30;
  *(double *)(a3 + 152) = v41;
  *(_QWORD *)(a3 + 160) = v43;
  *(_QWORD *)(a3 + 168) = v45;
  *(_QWORD *)(a3 + 176) = v47;
  *(_BYTE *)(a3 + 184) = v48;
  return result;
}

uint64_t sub_10001B5F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char **v18;
  unint64_t v19;
  __n128 v20;
  uint64_t v21;
  double v22;
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
  uint64_t v35;
  char **v36;
  unint64_t v37;
  __n128 v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  int v48;
  int v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t KeyPath;
  _BYTE v67[64];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[25];
  char v75;
  _BYTE v76[7];
  _BYTE v77[192];
  char v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  _BYTE v84[7];
  uint64_t v85;
  uint64_t v86;
  char v87;
  _BYTE v88[7];
  uint64_t v89;
  char v90;
  _BYTE v91[7];
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  _BYTE v97[7];
  char v98;
  _BYTE v99[7];
  double v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  _QWORD v105[3];
  uint64_t v106;
  char **v107;
  _DWORD v108[2];
  _DWORD v109[2];
  _DWORD v110[2];
  _QWORD v111[3];
  uint64_t v112;
  char **v113;
  char v114;
  _BYTE v115[7];
  _BYTE v116[7];
  _BYTE v117[7];
  char v118;
  char v119;
  _BYTE v120[7];
  _BYTE v121[7];
  _OWORD v122[2];
  _OWORD v123[3];

  KeyPath = swift_getKeyPath(&unk_100022D68);
  v6 = type metadata accessor for CardCellConfiguration(0);
  v7 = sub_10001CCCC(&qword_100033EC0, (uint64_t)&unk_100022B9C);
  v8 = swift_retain(a1);
  v9 = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  v64 = v10;
  v65 = v9;
  v63 = static Edge.Set.leading.getter();
  v11 = *(_OWORD *)(a2 + 16);
  v122[0] = *(_OWORD *)a2;
  v122[1] = v11;
  v123[0] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)((char *)v123 + 9) = *(_OWORD *)(a2 + 41);
  sub_100013D10((uint64_t)v122, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v77);
  sub_100013D10((uint64_t)v122, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v12 = *(_QWORD *)&v77[8];
  v13 = *(_QWORD *)&v77[16];
  v14 = *(_QWORD *)&v77[32];
  v15 = *(_QWORD *)&v77[40];
  v16 = *(_QWORD *)&v77[48];
  if (v77[0])
  {
    if (v77[0] == 1)
    {
      v17 = type metadata accessor for ClusterMetrics();
      v18 = (char **)&off_10002D948;
      v113 = (char **)&off_10002D948;
      v112 = v17;
      v111[0] = v15;
    }
    else
    {
      v17 = type metadata accessor for WidgetMetrics();
      v18 = &off_10002D8B8;
      v113 = &off_10002D8B8;
      v112 = v17;
      v111[0] = v16;
      v16 = v15;
    }
    v15 = v14;
  }
  else
  {
    v17 = type metadata accessor for ConsoleMetrics();
    v18 = (char **)&off_10002D9D8;
    v113 = (char **)&off_10002D9D8;
    v112 = v17;
    v111[0] = v14;
  }
  swift_release(v16);
  swift_release(v15);
  swift_release(v13);
  swift_release(v12);
  v62 = *(_BYTE *)(a2 + 96);
  sub_100013D4C(v111, v17);
  ((void (__cdecl *)())v18[4])();
  v20.n128_u64[0] = v19;
  v22 = EdgeInsets.init(_all:)(v21, v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v118 = 0;
  v114 = 0;
  v29 = sub_10000D714(v111);
  v110[0] = *(_DWORD *)v117;
  *(_DWORD *)((char *)v110 + 3) = *(_DWORD *)&v117[3];
  v109[0] = *(_DWORD *)v116;
  *(_DWORD *)((char *)v109 + 3) = *(_DWORD *)&v116[3];
  v108[0] = *(_DWORD *)v115;
  *(_DWORD *)((char *)v108 + 3) = *(_DWORD *)&v115[3];
  v60 = v114;
  v61 = v118;
  v59 = static Edge.Set.trailing.getter(v29);
  sub_100013D10((uint64_t)v122, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v77);
  sub_100013D10((uint64_t)v122, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v30 = *(_QWORD *)&v77[8];
  v31 = *(_QWORD *)&v77[16];
  v33 = *(_QWORD *)&v77[32];
  v32 = *(_QWORD *)&v77[40];
  v34 = *(_QWORD *)&v77[48];
  if (v77[0])
  {
    if (v77[0] == 1)
    {
      v35 = type metadata accessor for ClusterMetrics();
      v36 = (char **)&off_10002D948;
      v107 = (char **)&off_10002D948;
      v106 = v35;
      v105[0] = v32;
    }
    else
    {
      v35 = type metadata accessor for WidgetMetrics();
      v36 = &off_10002D8B8;
      v107 = &off_10002D8B8;
      v106 = v35;
      v105[0] = v34;
      v34 = v32;
    }
    v32 = v33;
  }
  else
  {
    v35 = type metadata accessor for ConsoleMetrics();
    v36 = (char **)&off_10002D9D8;
    v107 = (char **)&off_10002D9D8;
    v106 = v35;
    v105[0] = v33;
  }
  swift_release(v34);
  swift_release(v32);
  swift_release(v31);
  swift_release(v30);
  sub_100013D4C(v105, v35);
  ((void (__cdecl *)())v36[4])();
  v38.n128_u64[0] = v37;
  v40 = EdgeInsets.init(_all:)(v39, v38);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v119 = 0;
  sub_10000D714(v105);
  *(_DWORD *)v97 = *(_DWORD *)v121;
  *(_DWORD *)&v97[3] = *(_DWORD *)&v121[3];
  *(_DWORD *)v99 = *(_DWORD *)v120;
  *(_DWORD *)&v99[3] = *(_DWORD *)&v120[3];
  v47 = v119;
  *(_QWORD *)v67 = KeyPath;
  memset(&v67[8], 0, 48);
  v67[56] = v61;
  v48 = v110[0];
  *(_DWORD *)&v67[57] = v110[0];
  *(_DWORD *)&v67[60] = *(_DWORD *)((char *)v110 + 3);
  *(_QWORD *)&v68 = v65;
  *((_QWORD *)&v68 + 1) = v64;
  LOBYTE(v69) = v62;
  DWORD1(v69) = *(_DWORD *)((char *)v109 + 3);
  v49 = v109[0];
  *(_DWORD *)((char *)&v69 + 1) = v109[0];
  DWORD1(v70) = *(_DWORD *)((char *)v108 + 3);
  v50 = v108[0];
  *(_DWORD *)((char *)&v70 + 1) = v108[0];
  *(_DWORD *)((char *)&v72 + 9) = *(_DWORD *)v121;
  HIDWORD(v72) = *(_DWORD *)&v121[3];
  *(_DWORD *)((char *)&v73 + 1) = *(_DWORD *)v120;
  *((_QWORD *)&v69 + 1) = 0x3FF8000000000000;
  LOBYTE(v70) = v63;
  *((double *)&v70 + 1) = v22;
  *(_QWORD *)&v71 = v24;
  *((_QWORD *)&v71 + 1) = v26;
  *(_QWORD *)&v72 = v28;
  BYTE8(v72) = v60;
  LOBYTE(v73) = v59;
  DWORD1(v73) = *(_DWORD *)&v120[3];
  *((double *)&v73 + 1) = v40;
  *(_QWORD *)v74 = v42;
  *(_QWORD *)&v74[8] = v44;
  *(_QWORD *)&v74[16] = v46;
  v74[24] = v119;
  *(_DWORD *)(a3 + 201) = *(_DWORD *)v76;
  v78 = 1;
  *(_OWORD *)&v77[55] = *(_OWORD *)&v67[48];
  *(_OWORD *)&v77[39] = *(_OWORD *)&v67[32];
  *(_OWORD *)&v77[23] = *(_OWORD *)&v67[16];
  *(_OWORD *)&v77[7] = *(_OWORD *)v67;
  v51 = *(_OWORD *)&v74[9];
  *(_DWORD *)(a3 + 204) = *(_DWORD *)&v76[3];
  *(_BYTE *)(a3 + 8) = 1;
  *(_OWORD *)&v77[119] = v71;
  *(_OWORD *)&v77[103] = v70;
  *(_OWORD *)&v77[87] = v69;
  *(_OWORD *)&v77[71] = v68;
  *(_OWORD *)&v77[176] = v51;
  *(_OWORD *)&v77[167] = *(_OWORD *)v74;
  *(_OWORD *)&v77[151] = v73;
  *(_OWORD *)&v77[135] = v72;
  v75 = 1;
  *(_QWORD *)a3 = 0;
  v52 = *(_OWORD *)&v77[144];
  *(_OWORD *)(a3 + 137) = *(_OWORD *)&v77[128];
  *(_OWORD *)(a3 + 153) = v52;
  v53 = *(_OWORD *)&v77[176];
  *(_OWORD *)(a3 + 169) = *(_OWORD *)&v77[160];
  *(_OWORD *)(a3 + 185) = v53;
  v54 = *(_OWORD *)&v77[80];
  *(_OWORD *)(a3 + 73) = *(_OWORD *)&v77[64];
  *(_OWORD *)(a3 + 89) = v54;
  v55 = *(_OWORD *)&v77[112];
  *(_OWORD *)(a3 + 105) = *(_OWORD *)&v77[96];
  *(_OWORD *)(a3 + 121) = v55;
  v56 = *(_OWORD *)&v77[16];
  *(_OWORD *)(a3 + 9) = *(_OWORD *)v77;
  *(_OWORD *)(a3 + 25) = v56;
  v57 = *(_OWORD *)&v77[48];
  *(_OWORD *)(a3 + 41) = *(_OWORD *)&v77[32];
  *(_OWORD *)(a3 + 57) = v57;
  *(_QWORD *)(a3 + 208) = 0;
  *(_BYTE *)(a3 + 216) = 1;
  v79 = KeyPath;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = v61;
  *(_DWORD *)v84 = v48;
  *(_DWORD *)&v84[3] = *(_DWORD *)((char *)v110 + 3);
  v85 = v65;
  v86 = v64;
  v87 = v62;
  *(_DWORD *)v88 = v49;
  *(_DWORD *)&v88[3] = *(_DWORD *)((char *)v109 + 3);
  v89 = 0x3FF8000000000000;
  v90 = v63;
  *(_DWORD *)&v91[3] = *(_DWORD *)((char *)v108 + 3);
  *(_DWORD *)v91 = v50;
  v92 = v22;
  v93 = v24;
  v94 = v26;
  v95 = v28;
  v96 = v60;
  v98 = v59;
  v100 = v40;
  v101 = v42;
  v102 = v44;
  v103 = v46;
  v104 = v47;
  sub_10001CD8C((uint64_t)v67);
  return sub_10001CDD0((uint64_t)&v79);
}

uint64_t sub_10001BBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD *v24;

  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v6);
  *(_QWORD *)a3 = static HorizontalAlignment.leading.getter(v9);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  sub_1000064D4(&qword_100033F08);
  v24 = sub_100019770();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v6);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v10 + 113) & ~v10;
  v12 = swift_allocObject(&unk_10002D800, v11 + v8, v10 | 7);
  v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v12 + 96) = v13;
  *(_BYTE *)(v12 + 112) = *(_BYTE *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v12 + 32) = v14;
  v15 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v12 + 64) = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_10001C77C(a1);
  v16 = sub_1000064D4((uint64_t *)&unk_100033640);
  v17 = type metadata accessor for UUID(0);
  v18 = sub_1000064D4(&qword_100033F10);
  v19 = sub_1000073C4(&qword_100033ED8, (uint64_t *)&unk_100033640, (uint64_t)&protocol conformance descriptor for [A]);
  v20 = sub_10001CEF8();
  v21 = sub_10001CCCC(&qword_100033F00, (uint64_t)&unk_100022BD4);
  return ForEach<>.init(_:content:)(&v24, sub_10001CEA8, v12, v16, v17, v18, v19, v20, v21);
}

uint64_t sub_10001BD58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char **v18;
  char **v19;
  char **v20;
  uint64_t v21;
  char **v22;
  unint64_t v23;
  __n128 v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char **v36;
  char **v37;
  char **v38;
  uint64_t v39;
  char **v40;
  unint64_t v41;
  __n128 v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t KeyPath;
  uint64_t v85;
  _DWORD v86[2];
  _DWORD v87[2];
  _DWORD v88[2];
  _DWORD v89[2];
  _DWORD v90[2];
  _BYTE v91[7];
  _DWORD v92[2];
  _DWORD v93[2];
  _DWORD v94[2];
  _QWORD v95[3];
  uint64_t v96;
  char **v97;
  char **v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char **v102;
  char **v103;
  char **v104;
  unsigned __int8 v105;
  _BYTE v106[7];
  _BYTE v107[7];
  _BYTE v108[7];
  unsigned __int8 v109;
  char v110;
  _BYTE v111[7];
  _BYTE v112[7];
  _OWORD v113[2];
  _OWORD v114[3];

  v77 = a3;
  v7 = type metadata accessor for GeometryProxy(0);
  v82 = *(_QWORD *)(v7 - 8);
  v83 = v7;
  __chkstk_darwin(v7);
  v76 = v8;
  v81 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  KeyPath = swift_getKeyPath(&unk_100022D68);
  v10 = type metadata accessor for CardCellConfiguration(0);
  v11 = sub_10001CCCC(&qword_100033EC0, (uint64_t)&unk_100022B9C);
  v12 = swift_retain(v9);
  v85 = v9;
  v13 = ObservedObject.init(wrappedValue:)(v12, v10, v11);
  v79 = v14;
  v80 = v13;
  v78 = static Edge.Set.leading.getter();
  v15 = *(_OWORD *)(a2 + 16);
  v113[0] = *(_OWORD *)a2;
  v113[1] = v15;
  v114[0] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)((char *)v114 + 9) = *(_OWORD *)(a2 + 41);
  sub_100013D10((uint64_t)v113, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v98);
  sub_100013D10((uint64_t)v113, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v16 = v99;
  v17 = v100;
  v18 = v102;
  v19 = v103;
  v20 = v104;
  if ((_BYTE)v98)
  {
    if (v98 == 1)
    {
      v21 = type metadata accessor for ClusterMetrics();
      v22 = (char **)&off_10002D948;
      v96 = v21;
      v97 = (char **)&off_10002D948;
      v95[0] = v19;
    }
    else
    {
      v21 = type metadata accessor for WidgetMetrics();
      v22 = &off_10002D8B8;
      v96 = v21;
      v97 = &off_10002D8B8;
      v95[0] = v20;
      v20 = v19;
    }
    v19 = v18;
  }
  else
  {
    v21 = type metadata accessor for ConsoleMetrics();
    v22 = (char **)&off_10002D9D8;
    v96 = v21;
    v97 = (char **)&off_10002D9D8;
    v95[0] = v18;
  }
  swift_release(v20);
  swift_release(v19);
  swift_release(v17);
  swift_release(v16);
  v75 = *(unsigned __int8 *)(a2 + 96);
  sub_100013D4C(v95, v21);
  ((void (__cdecl *)())v22[4])();
  v24.n128_u64[0] = v23;
  v26 = EdgeInsets.init(_all:)(v25, v24);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v109 = 0;
  v105 = 0;
  v33 = sub_10000D714(v95);
  v94[0] = *(_DWORD *)v108;
  *(_DWORD *)((char *)v94 + 3) = *(_DWORD *)&v108[3];
  v93[0] = *(_DWORD *)v107;
  *(_DWORD *)((char *)v93 + 3) = *(_DWORD *)&v107[3];
  v92[0] = *(_DWORD *)v106;
  *(_DWORD *)((char *)v92 + 3) = *(_DWORD *)&v106[3];
  v73 = v105;
  v74 = v109;
  v72 = static Edge.Set.trailing.getter(v33);
  sub_100013D10((uint64_t)v113, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v98);
  sub_100013D10((uint64_t)v113, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v34 = v99;
  v35 = v100;
  v36 = v102;
  v37 = v103;
  v38 = v104;
  if ((_BYTE)v98)
  {
    if (v98 == 1)
    {
      v39 = type metadata accessor for ClusterMetrics();
      v40 = (char **)&off_10002D948;
      v101 = v39;
      v102 = (char **)&off_10002D948;
      v98 = v37;
    }
    else
    {
      v39 = type metadata accessor for WidgetMetrics();
      v40 = &off_10002D8B8;
      v101 = v39;
      v102 = &off_10002D8B8;
      v98 = v38;
      v38 = v37;
    }
    v37 = v36;
  }
  else
  {
    v39 = type metadata accessor for ConsoleMetrics();
    v40 = (char **)&off_10002D9D8;
    v101 = v39;
    v102 = (char **)&off_10002D9D8;
    v98 = v36;
  }
  swift_release(v38);
  swift_release(v37);
  swift_release(v35);
  swift_release(v34);
  sub_100013D4C(&v98, v39);
  ((void (__cdecl *)())v40[4])();
  v42.n128_u64[0] = v41;
  v44 = EdgeInsets.init(_all:)(v43, v42);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v90[0] = v94[0];
  *(_DWORD *)((char *)v90 + 3) = *(_DWORD *)((char *)v94 + 3);
  v89[0] = v93[0];
  *(_DWORD *)((char *)v89 + 3) = *(_DWORD *)((char *)v93 + 3);
  v88[0] = v92[0];
  *(_DWORD *)((char *)v88 + 3) = *(_DWORD *)((char *)v92 + 3);
  v110 = 0;
  v51 = sub_10000D714(&v98);
  v87[0] = *(_DWORD *)v112;
  *(_DWORD *)((char *)v87 + 3) = *(_DWORD *)&v112[3];
  v86[0] = *(_DWORD *)v111;
  *(_DWORD *)((char *)v86 + 3) = *(_DWORD *)&v111[3];
  v52 = v110;
  v53 = static Alignment.center.getter(v51);
  v70 = v54;
  v71 = v53;
  v56 = v81;
  v55 = v82;
  v57 = v83;
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v77, v83);
  v58 = *(unsigned __int8 *)(v55 + 80);
  v59 = (v58 + 128) & ~v58;
  v60 = swift_allocObject(&unk_10002D828, v59 + v76, v58 | 7);
  v61 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v60 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v60 + 96) = v61;
  *(_BYTE *)(v60 + 112) = *(_BYTE *)(a2 + 96);
  v62 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v60 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v60 + 32) = v62;
  v63 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v60 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v60 + 64) = v63;
  v64 = v85;
  *(_QWORD *)(v60 + 120) = v85;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v60 + v59, v56, v57);
  *(_DWORD *)(a4 + 57) = v90[0];
  *(_DWORD *)(a4 + 60) = *(_DWORD *)((char *)v90 + 3);
  *(_DWORD *)(a4 + 81) = v89[0];
  *(_DWORD *)(a4 + 84) = *(_DWORD *)((char *)v89 + 3);
  *(_DWORD *)(a4 + 97) = v88[0];
  *(_DWORD *)(a4 + 100) = *(_DWORD *)((char *)v88 + 3);
  *(_DWORD *)(a4 + 140) = *(_DWORD *)((char *)v87 + 3);
  *(_DWORD *)(a4 + 137) = v87[0];
  v65 = v86[0];
  *(_DWORD *)(a4 + 148) = *(_DWORD *)((char *)v86 + 3);
  *(_DWORD *)(a4 + 145) = v65;
  *(_QWORD *)a4 = KeyPath;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 24) = 0u;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_BYTE *)(a4 + 56) = v74;
  v66 = v79;
  *(_QWORD *)(a4 + 64) = v80;
  *(_QWORD *)(a4 + 72) = v66;
  *(_BYTE *)(a4 + 80) = v75;
  *(_QWORD *)(a4 + 88) = 0x3FF8000000000000;
  *(_BYTE *)(a4 + 96) = v78;
  *(double *)(a4 + 104) = v26;
  *(_QWORD *)(a4 + 112) = v28;
  *(_QWORD *)(a4 + 120) = v30;
  *(_QWORD *)(a4 + 128) = v32;
  *(_BYTE *)(a4 + 136) = v73;
  *(_BYTE *)(a4 + 144) = v72;
  *(double *)(a4 + 152) = v44;
  *(_QWORD *)(a4 + 160) = v46;
  *(_QWORD *)(a4 + 168) = v48;
  *(_QWORD *)(a4 + 176) = v50;
  *(_BYTE *)(a4 + 184) = v52;
  *(_DWORD *)(a4 + 188) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a4 + 185) = *(_DWORD *)v91;
  *(_QWORD *)(a4 + 192) = sub_10001D030;
  *(_QWORD *)(a4 + 200) = v60;
  v67 = v70;
  *(_QWORD *)(a4 + 208) = v71;
  *(_QWORD *)(a4 + 216) = v67;
  swift_retain(v64);
  return sub_10001C77C(a2);
}

uint64_t sub_10001C2CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;

  v30 = a3;
  v9 = type metadata accessor for GeometryProxy(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v29 - v15;
  v29 = static Color.clear.getter(v14);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17(v16, a1, v9);
  v17(v13, a4, v9);
  v18 = *(unsigned __int8 *)(v10 + 80);
  v19 = (v18 + 128) & ~v18;
  v20 = (v11 + v18 + v19) & ~v18;
  v21 = swift_allocObject(&unk_10002D850, v20 + v11, v18 | 7);
  v22 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v21 + 96) = v22;
  *(_BYTE *)(v21 + 112) = *(_BYTE *)(a2 + 96);
  v23 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v21 + 32) = v23;
  v24 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v21 + 64) = v24;
  v25 = v30;
  *(_QWORD *)(v21 + 120) = v30;
  v26 = v21 + v19;
  v27 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v27(v26, v16, v9);
  v27(v21 + v20, v13, v9);
  *a5 = v29;
  a5[1] = (uint64_t)sub_10001D140;
  a5[3] = 0;
  a5[4] = 0;
  a5[2] = v21;
  sub_10001C77C(a2);
  return swift_retain(v25);
}

uint64_t sub_10001C444(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MaxY;
  double v24;
  BOOL v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  char v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[2];
  _OWORD v43[3];
  CGRect v44;

  v34[1] = a4;
  v35 = a2;
  v5 = type metadata accessor for NamedCoordinateSpace(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[1];
  v42[0] = *a1;
  v42[1] = v9;
  v43[0] = a1[2];
  *(_OWORD *)((char *)v43 + 9) = *(_OWORD *)((char *)a1 + 41);
  sub_100013D10((uint64_t)v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)&v37);
  sub_100013D10((uint64_t)v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v10 = v37;
  v11 = *((_QWORD *)&v37 + 1);
  v12 = v38;
  v13 = v39;
  v14 = v40;
  swift_release(v41);
  swift_release(v14);
  swift_release(v13);
  swift_release(v12);
  result = swift_release(v11);
  if (v10)
  {
    *(_QWORD *)&v37 = 0x7765695670697254;
    *((_QWORD *)&v37 + 1) = 0xE800000000000000;
    static CoordinateSpaceProtocol<>.named<A>(_:)(&v37, &type metadata for String, &protocol witness table for String);
    v16 = GeometryProxy.frame<A>(in:)(v8, v5, &protocol witness table for NamedCoordinateSpace);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v44.origin.x = v16;
    v44.origin.y = v18;
    v44.size.width = v20;
    v44.size.height = v22;
    MaxY = CGRectGetMaxY(v44);
    GeometryProxy.size.getter();
    v25 = v24 < MaxY;
    KeyPath = swift_getKeyPath(&unk_100022E20);
    v27 = swift_getKeyPath(&unk_100022E48);
    LOBYTE(v37) = v25;
    v28 = v35;
    swift_retain(v35);
    static Published.subscript.setter(&v37, v28, KeyPath, v27);
    v29 = a1 + 5;
    v37 = a1[5];
    v30 = sub_1000064D4(&qword_100032C18);
    State.wrappedValue.getter(&v36, v30);
    if ((v36 & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      v32 = swift_getKeyPath(&unk_100022E20);
      v33 = swift_getKeyPath(&unk_100022E48);
      static Published.subscript.getter(&v37, v28, v32, v33);
      swift_release(v32);
      swift_release(v33);
      v31 = v37;
    }
    v37 = *v29;
    v36 = v31;
    return State.wrappedValue.setter(&v36, v30);
  }
  return result;
}

uint64_t sub_10001C6E4@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[6];
  char v12;

  v3 = *(_OWORD *)(v1 + 80);
  v11[4] = *(_OWORD *)(v1 + 64);
  v11[5] = v3;
  v12 = *(_BYTE *)(v1 + 96);
  v4 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v4;
  v5 = *(_OWORD *)(v1 + 48);
  v11[2] = *(_OWORD *)(v1 + 32);
  v11[3] = v5;
  v6 = swift_allocObject(&unk_10002D7B0, 113, 7);
  v7 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v6 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v6 + 96) = v7;
  *(_BYTE *)(v6 + 112) = *(_BYTE *)(v1 + 96);
  v8 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v6 + 32) = v8;
  v9 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v6 + 64) = v9;
  *a1 = sub_10001C774;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v6;
  return sub_10001C77C((uint64_t)v11);
}

uint64_t sub_10001C774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100019AC0(a1, v2 + 16, a2);
}

uint64_t sub_10001C77C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 88);
  sub_10000D9BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  swift_retain(v3);
  swift_retain(v2);
  return a1;
}

double sub_10001C7D4(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 176) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_10001C7F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10001BBA4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_10001C800()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033EA8;
  if (!qword_100033EA8)
  {
    v1 = sub_100007234(&qword_100033E50);
    sub_1000073C4(&qword_100033E90, &qword_100033E88, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_1000073C4(&qword_100033E98, &qword_100033E40, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033EA8);
  }
  return result;
}

double sub_10001C89C(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 169) = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_10001C8C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t result;

  if (a9)
  {
    sub_100013E3C(a6, a7, a8 & 1);
    return swift_bridgeObjectRetain(a9);
  }
  return result;
}

uint64_t sub_10001C900(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    sub_10000D9BC(result, a2, a3, a4, a5, a6, a7, a8 & 1);
    return swift_retain(a10);
  }
  return result;
}

uint64_t sub_10001C938(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 184);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_10001C9AC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    sub_10000DA4C(result, a2, a3, a4, a5, a6, a7, a8 & 1);
    return swift_release(a10);
  }
  return result;
}

uint64_t sub_10001C9E4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 176);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    v4);
  return a1;
}

uint64_t sub_10001CA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t result;

  if (a9)
  {
    sub_100013F1C(a6, a7, a8 & 1);
    return swift_bridgeObjectRelease(a9);
  }
  return result;
}

uint64_t sub_10001CAA0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 112);
  sub_10000D9BC(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
  swift_retain(v2);
  return a1;
}

uint64_t sub_10001CAE4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 112);
  sub_10000DA4C(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
  swift_release(v2);
  return a1;
}

uint64_t sub_10001CB28(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 128);
  sub_10000D9BC(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_BYTE *)(a1 + 112));
  swift_retain(v2);
  return a1;
}

uint64_t sub_10001CB6C(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 152);
  sub_10000D9BC(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_BYTE *)(a1 + 136));
  swift_retain(v2);
  return a1;
}

uint64_t sub_10001CBB4()
{
  uint64_t v0;

  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  return swift_deallocObject(v0, 113, 7);
}

double sub_10001CBF8@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_10001B1EC(a1, v2 + 16, a2);
}

uint64_t sub_10001CC00()
{
  return sub_10001CC1C(&qword_100033EE8, &qword_100033EF0, (void (*)(void))sub_10001CC88);
}

uint64_t sub_10001CC1C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007234(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001CC88()
{
  unint64_t result;

  result = qword_100033EF8;
  if (!qword_100033EF8)
  {
    result = swift_getWitnessTable("Ŭ", &type metadata for TripMeasurementView);
    atomic_store(result, (unint64_t *)&qword_100033EF8);
  }
  return result;
}

uint64_t sub_10001CCCC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CardCellConfiguration(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001CD14(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100013E3C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  return a1;
}

uint64_t sub_10001CD50(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100013F1C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_10001CD8C(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  sub_10000D9BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  swift_retain(v2);
  return a1;
}

uint64_t sub_10001CDD0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  sub_10000DA4C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  swift_release(v2);
  return a1;
}

uint64_t sub_10001CE14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 113) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001CEA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GeometryProxy(0) - 8) + 80);
  return sub_10001BD58(a1, v2 + 16, v2 + ((v5 + 113) & ~v5), a2);
}

unint64_t sub_10001CEF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100033F18;
  if (!qword_100033F18)
  {
    v1 = sub_100007234(&qword_100033F10);
    sub_10001CC1C(&qword_100033EE0, &qword_100033ED0, (void (*)(void))sub_10001CC00);
    sub_1000073C4(&qword_100032C68, &qword_100032C70, (uint64_t)&protocol conformance descriptor for _BackgroundModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100033F18);
  }
  return result;
}

uint64_t sub_10001CF94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 128) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  swift_release(*(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001D030@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GeometryProxy(0) - 8) + 80);
  return sub_10001C2CC(a1, v2 + 16, *(_QWORD *)(v2 + 120), v2 + ((v5 + 128) & ~v5), a2);
}

uint64_t sub_10001D084()
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
  void (*v9)(uint64_t, uint64_t);

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 128) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = (v5 + v3 + v4) & ~v3;
  v8 = v7 + v5;
  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  swift_release(*(_QWORD *)(v0 + 120));
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v0 + v4, v1);
  v9(v0 + v7, v1);
  return swift_deallocObject(v0, v8, v6);
}

uint64_t sub_10001D140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for GeometryProxy(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  return sub_10001C444((_OWORD *)(v0 + 16), *(_QWORD *)(v0 + 120), v0 + ((v2 + 128) & ~v2), v0 + ((*(_QWORD *)(v1 + 64) + v2 + ((v2 + 128) & ~v2)) & ~v2));
}

uint64_t sub_10001D190()
{
  return sub_1000073C4(&qword_100033F20, &qword_100033F28, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t type metadata accessor for ConsoleMetrics()
{
  return objc_opt_self(_TtC4Trip14ConsoleMetrics);
}

uint64_t sub_10001D1DC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  *(_OWORD *)(v0 + 16) = xmmword_100022E70;
  *(_OWORD *)(v0 + 32) = xmmword_100022E80;
  *(_OWORD *)(v0 + 48) = xmmword_100022E90;
  *(_OWORD *)(v0 + 64) = xmmword_100022EA0;
  *(_QWORD *)(v0 + 80) = static Color.primary.getter();
  *(_QWORD *)(v0 + 88) = 0x4038000000000000;
  v1 = (void *)objc_opt_self(UIFont);
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v3 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v4 = objc_msgSend(v3, "scaledFontForFont:", v2);

  *(_QWORD *)(v0 + 96) = Font.init(_:)(v4);
  v5 = objc_msgSend(v1, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v6 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v7 = objc_msgSend(v6, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 104) = Font.init(_:)(v7);
  v8 = objc_msgSend(v1, "systemFontOfSize:weight:", 20.0, UIFontWeightMedium);
  v9 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v10 = objc_msgSend(v9, "scaledFontForFont:", v8);

  *(_QWORD *)(v0 + 112) = Font.init(_:)(v10);
  *(_QWORD *)(v0 + 120) = static Color.primary.getter();
  v11 = objc_msgSend(v1, "systemFontOfSize:weight:", 14.0, UIFontWeightRegular);
  v12 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCaption1);
  v13 = objc_msgSend(v12, "scaledFontForFont:", v11);

  *(_QWORD *)(v0 + 128) = Font.init(_:)(v13);
  v14 = objc_msgSend((id)objc_opt_self(UIColor), "systemGrayColor");
  *(_QWORD *)(v0 + 136) = Color.init(uiColor:)(v14);
  *(_QWORD *)(v0 + 144) = 0x4000000000000000;
  return v0;
}

double sub_10001D468()
{
  return 50.0;
}

double sub_10001D474()
{
  return 44.0;
}

double sub_10001D480()
{
  return 56.0;
}

double sub_10001D48C()
{
  return 24.0;
}

double sub_10001D494()
{
  return 2.0;
}

uint64_t sub_10001D49C(uint64_t a1, uint64_t a2)
{
  return sub_10001DB40(50.0, a1, a2, (double *)&UIFontWeightBold);
}

uint64_t sub_10001D4B0(uint64_t a1, uint64_t a2)
{
  return sub_10001DB40(34.0, a1, a2, (double *)&UIFontWeightSemibold);
}

uint64_t type metadata accessor for ClusterMetrics()
{
  return objc_opt_self(_TtC4Trip14ClusterMetrics);
}

uint64_t sub_10001D4E4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  *(_OWORD *)(v0 + 16) = xmmword_100022EB0;
  *(_OWORD *)(v0 + 32) = xmmword_100022EC0;
  *(_OWORD *)(v0 + 48) = xmmword_100022E90;
  *(_OWORD *)(v0 + 64) = xmmword_100022ED0;
  *(_QWORD *)(v0 + 80) = static Color.primary.getter();
  *(_QWORD *)(v0 + 88) = 0x4044000000000000;
  v1 = (void *)objc_opt_self(UIFont);
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:", 74.0, UIFontWeightBold);
  v3 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v4 = objc_msgSend(v3, "scaledFontForFont:", v2);

  *(_QWORD *)(v0 + 96) = Font.init(_:)(v4);
  v5 = objc_msgSend(v1, "systemFontOfSize:weight:", 32.0, UIFontWeightBold);
  v6 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v7 = objc_msgSend(v6, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 104) = Font.init(_:)(v7);
  v8 = objc_msgSend(v1, "systemFontOfSize:weight:", 32.0, UIFontWeightBold);
  v9 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v10 = objc_msgSend(v9, "scaledFontForFont:", v8);

  *(_QWORD *)(v0 + 112) = Font.init(_:)(v10);
  *(_QWORD *)(v0 + 120) = static Color.primary.getter();
  v11 = objc_msgSend(v1, "systemFontOfSize:weight:", 32.0, UIFontWeightRegular);
  v12 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCaption1);
  v13 = objc_msgSend(v12, "scaledFontForFont:", v11);

  *(_QWORD *)(v0 + 128) = Font.init(_:)(v13);
  v14 = objc_msgSend((id)objc_opt_self(UIColor), "systemGrayColor");
  *(_QWORD *)(v0 + 136) = Color.init(uiColor:)(v14);
  *(_QWORD *)(v0 + 144) = 0x4010000000000000;
  return v0;
}

double sub_10001D778()
{
  return 65.0;
}

double sub_10001D788()
{
  return 88.0;
}

double sub_10001D794()
{
  return 95.0;
}

double sub_10001D7A4()
{
  return 84.0;
}

double sub_10001D7B0()
{
  return 40.0;
}

double sub_10001D7BC()
{
  return 4.0;
}

_QWORD *sub_10001D7C4()
{
  _QWORD *v0;

  swift_release(v0[10]);
  swift_release(v0[12]);
  swift_release(v0[13]);
  swift_release(v0[14]);
  swift_release(v0[15]);
  swift_release(v0[16]);
  swift_release(v0[17]);
  return v0;
}

uint64_t sub_10001D810()
{
  uint64_t v0;

  sub_10001D7C4();
  return swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for WidgetMetrics()
{
  return objc_opt_self(_TtC4Trip13WidgetMetrics);
}

uint64_t sub_10001D850()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  *(_OWORD *)(v0 + 16) = xmmword_100022EE0;
  *(_OWORD *)(v0 + 32) = xmmword_100022E80;
  *(_OWORD *)(v0 + 48) = xmmword_100022EF0;
  *(_OWORD *)(v0 + 64) = xmmword_100022EE0;
  *(_QWORD *)(v0 + 80) = static Color.primary.getter();
  *(_QWORD *)(v0 + 88) = 0x4038000000000000;
  v1 = (void *)objc_opt_self(UIFont);
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v3 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v4 = objc_msgSend(v3, "scaledFontForFont:", v2);

  *(_QWORD *)(v0 + 96) = Font.init(_:)(v4);
  v5 = objc_msgSend(v1, "systemFontOfSize:weight:", 16.0, UIFontWeightSemibold);
  v6 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle1);
  v7 = objc_msgSend(v6, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 104) = Font.init(_:)(v7);
  v8 = objc_msgSend(v1, "systemFontOfSize:weight:", 16.0, UIFontWeightSemibold);
  v9 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v10 = objc_msgSend(v9, "scaledFontForFont:", v8);

  *(_QWORD *)(v0 + 112) = Font.init(_:)(v10);
  *(_QWORD *)(v0 + 120) = static Color.primary.getter();
  v11 = objc_msgSend(v1, "systemFontOfSize:weight:", 16.0, UIFontWeightSemibold);
  v12 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCaption1);
  v13 = objc_msgSend(v12, "scaledFontForFont:", v11);

  *(_QWORD *)(v0 + 128) = Font.init(_:)(v13);
  v14 = objc_msgSend((id)objc_opt_self(UIColor), "systemGrayColor");
  *(_QWORD *)(v0 + 136) = Color.init(uiColor:)(v14);
  *(_QWORD *)(v0 + 144) = 0x4010000000000000;
  return v0;
}

double sub_10001DAE0()
{
  return 20.0;
}

double sub_10001DAE8()
{
  uint64_t v0;

  return *(double *)(*(_QWORD *)v0 + 40);
}

uint64_t sub_10001DAF8()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 80));
}

uint64_t sub_10001DB04()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 104));
}

uint64_t sub_10001DB10()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 112));
}

uint64_t sub_10001DB1C()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 120));
}

uint64_t sub_10001DB28()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 128));
}

uint64_t sub_10001DB34()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 136));
}

uint64_t sub_10001DB40(double a1, uint64_t a2, uint64_t a3, double *a4)
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", a1, *a4);
  v5 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v6 = objc_msgSend(v5, "scaledFontForFont:", v4);

  return Font.init(_:)(v6);
}

uint64_t sub_10001DC10()
{
  if (qword_1000329D0 != -1)
    swift_once(&qword_1000329D0, sub_10001FB74);
  return swift_retain(qword_100035728);
}

uint64_t sub_10001DC50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t KeyPath;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
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
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  __int128 v81;
  uint64_t v82;
  _BYTE v83[24];
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[2];
  _OWORD v89[2];
  _OWORD v90[2];

  v2 = v1;
  v79 = sub_1000064D4(&qword_100034248);
  __chkstk_darwin(v79);
  v5 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000064D4(&qword_100034250);
  v74 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v73 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000064D4(&qword_100034258);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v80 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90[0] = *(_OWORD *)(v1 + 64);
  v11 = (void *)*((_QWORD *)&v90[0] + 1);
  KeyPath = swift_getKeyPath(&unk_100023138);
  v13 = swift_getKeyPath(&unk_100023160);
  v14 = v11;
  static Published.subscript.getter(v88, v14, KeyPath, v13);
  swift_release(KeyPath);
  swift_release(v13);
  sub_10001F370((uint64_t)v90);
  v15 = *(_QWORD *)&v88[0];
  if (*(_QWORD *)&v88[0] >> 62)
  {
    if (*(uint64_t *)&v88[0] < 0)
      v72 = *(_QWORD *)&v88[0];
    else
      v72 = *(_QWORD *)&v88[0] & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)&v88[0]);
    v16 = _CocoaArrayWrapper.endIndex.getter(v72);
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v16 = *(_QWORD *)((*(_QWORD *)&v88[0] & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v15);
  if (!v16)
  {
    v60 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v60, 1, v8);
  }
  v75 = v6;
  v76 = v9;
  v77 = v8;
  v78 = a1;
  v17 = *(_OWORD *)(v2 + 16);
  v88[0] = *(_OWORD *)v2;
  v88[1] = v17;
  v89[0] = *(_OWORD *)(v2 + 32);
  *(_OWORD *)((char *)v89 + 9) = *(_OWORD *)(v2 + 41);
  sub_100013D10((uint64_t)v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v83);
  sub_100013D10((uint64_t)v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v18 = v83[0];
  v19 = *(_QWORD *)&v83[8];
  v20 = *(_QWORD *)&v83[16];
  v21 = v85;
  v22 = v86;
  swift_release(v87);
  swift_release(v22);
  swift_release(v21);
  swift_release(v20);
  swift_release(v19);
  v23 = *(_QWORD *)(v2 + 80);
  v24 = *(_QWORD *)(v2 + 88);
  v25 = *(unsigned __int8 *)(v2 + 96);
  v26 = type metadata accessor for TripEnvironment(0);
  v27 = sub_100006FC8(&qword_100034260, type metadata accessor for TripEnvironment, (uint64_t)&unk_1000232E0);
  if (!v18)
  {
    v61 = StateObject.projectedValue.getter(v23, v24, v25, v26, v27);
    v62 = swift_getKeyPath(&unk_100023180);
    ObservedObject.Wrapper.subscript.getter(v83, v62, v61, v27);
    swift_release(v62);
    v63 = swift_release(v61);
    v81 = *(_OWORD *)v83;
    v82 = *(_QWORD *)&v83[16];
    __chkstk_darwin(v63);
    *(&v73 - 2) = (char *)v2;
    v64 = sub_1000064D4(&qword_100034288);
    v65 = sub_10001F9A0(&qword_100034290, &qword_100034288, (void (*)(void))sub_10001F608, (uint64_t)&protocol conformance descriptor for <> ForEach<A, B, C>);
    v66 = v73;
    TabView.init(selection:content:)(&v81, sub_10001F600, &v73 - 4, &type metadata for Int, v64, &protocol witness table for Int, v65);
    v67 = v74;
    v68 = v75;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v5, v66, v75);
    swift_storeEnumTagMultiPayload(v5, v79, 0);
    v69 = sub_1000073C4(&qword_100034278, &qword_100034250, (uint64_t)&protocol conformance descriptor for TabView<A, B>);
    v70 = sub_10001F5BC();
    v59 = v80;
    _ConditionalContent<>.init(storage:)(v5, v68, &type metadata for TripView, v69, v70);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v68);
LABEL_15:
    v71 = (uint64_t)v59;
    a1 = v78;
    sub_100013F2C(v71, v78, &qword_100034258);
    v60 = 0;
    v8 = v77;
    v9 = v76;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v60, 1, v8);
  }
  v28 = v14;
  v29 = StateObject.wrappedValue.getter(v23, v24, v25, v26, v27);
  v30 = swift_getKeyPath(&unk_100023180);
  v31 = swift_getKeyPath(&unk_1000231A8);
  static Published.subscript.getter(v83, v29, v30, v31);
  swift_release(v29);
  swift_release(v30);
  swift_release(v31);
  v32 = *(_QWORD *)v83;
  v33 = swift_getKeyPath(&unk_100023138);
  v34 = swift_getKeyPath(&unk_100023160);
  static Published.subscript.getter(v83, v28, v33, v34);
  swift_release(v33);
  swift_release(v34);
  result = sub_10001F370((uint64_t)v90);
  v36 = *(_QWORD *)v83;
  if ((*(_QWORD *)v83 & 0xC000000000000001) != 0)
  {
    v37 = specialized _ArrayBuffer._getElementSlowPath(_:)(v32, *(_QWORD *)v83);
    goto LABEL_9;
  }
  if ((v32 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v32 < *(_QWORD *)((*(_QWORD *)v83 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v37 = *(_QWORD *)(*(_QWORD *)v83 + 8 * v32 + 32);
    swift_retain(v37);
LABEL_9:
    swift_bridgeObjectRelease(v36);
    v38 = swift_getKeyPath(&unk_100023138);
    v39 = swift_getKeyPath(&unk_100023160);
    static Published.subscript.getter(v83, v28, v38, v39);
    swift_release(v38);
    swift_release(v39);
    sub_10001F370((uint64_t)v90);
    v40 = *(_QWORD *)v83;
    sub_10001EC94(v37, *(uint64_t *)v83);
    swift_bridgeObjectRelease(v40);
    sub_100013D10((uint64_t)v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    sub_10001F398((uint64_t)v83);
    sub_100013D10((uint64_t)v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    v42 = *(_QWORD *)&v83[16];
    v43 = v85;
    v44 = v86;
    v45 = v87;
    *(_OWORD *)v83 = *(_OWORD *)&v83[8];
    v41 = *(_QWORD *)v83;
    v83[16] = v84;
    v46 = sub_1000064D4(&qword_100034268);
    Binding.wrappedValue.getter(&v81, v46);
    swift_release(v45);
    swift_release(v44);
    swift_release(v43);
    swift_release(v42);
    swift_release(v41);
    if ((_BYTE)v81)
      v47 = 0;
    else
      v47 = 2;
    v48 = swift_getKeyPath(&unk_1000231C8);
    v49 = type metadata accessor for CardModel(0);
    v50 = sub_100006FC8(&qword_100034270, type metadata accessor for CardModel, (uint64_t)&unk_100022B64);
    v51 = swift_retain(v37);
    v52 = ObservedObject.init(wrappedValue:)(v51, v49, v50);
    v54 = v53;
    LOBYTE(v81) = 0;
    State.init(wrappedValue:)(v83, &v81, &type metadata for Bool);
    v55 = v83[0];
    v56 = *(_QWORD *)&v83[8];
    *(_QWORD *)v5 = v48;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    v5[56] = 0;
    *((_QWORD *)v5 + 8) = v52;
    *((_QWORD *)v5 + 9) = v54;
    v5[80] = v55;
    *((_QWORD *)v5 + 11) = v56;
    v5[96] = v47;
    swift_storeEnumTagMultiPayload(v5, v79, 1);
    sub_10000D9BC(v48, 0, 0, 0, 0, 0, 0, 0);
    v57 = sub_1000073C4(&qword_100034278, &qword_100034250, (uint64_t)&protocol conformance descriptor for TabView<A, B>);
    v58 = sub_10001F5BC();
    swift_retain(v54);
    swift_retain(v56);
    v59 = v80;
    _ConditionalContent<>.init(storage:)(v5, v75, &type metadata for TripView, v57, v58);
    swift_release(v37);
    sub_10000DA4C(v48, 0, 0, 0, 0, 0, 0, 0);
    swift_release(v56);
    swift_release(v54);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001E438(uint64_t a1)
{
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;

  v16 = *(_OWORD *)(a1 + 64);
  KeyPath = swift_getKeyPath(&unk_100023138);
  v3 = swift_getKeyPath(&unk_100023160);
  static Published.subscript.getter(&v15, *((id *)&v16 + 1), KeyPath, v3);
  swift_release(KeyPath);
  swift_release(v3);
  sub_10001F370((uint64_t)&v16);
  v4 = swift_allocObject(&unk_10002DB00, 113, 7);
  v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 96) = v5;
  *(_BYTE *)(v4 + 112) = *(_BYTE *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v6;
  v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v4 + 64) = v7;
  sub_10001F870(a1);
  v8 = sub_1000064D4(&qword_100033090);
  v9 = type metadata accessor for UUID(0);
  v10 = sub_1000064D4(&qword_1000342A0);
  v11 = sub_1000073C4(&qword_100034310, &qword_100033090, (uint64_t)&protocol conformance descriptor for [A]);
  v12 = sub_10001F608();
  v13 = sub_100006FC8(&qword_100034318, type metadata accessor for CardModel, (uint64_t)&unk_100022B2C);
  return ForEach<>.init(_:content:)(&v15, sub_10001F868, v4, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_10001E5B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t OpaqueTypeConformance2;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[24];
  __int128 v73;
  __int128 v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char v80;
  char v81;
  _OWORD v82[2];
  _BYTE v83[25];
  __int128 v84;

  v71 = a3;
  v70 = sub_1000064D4(&qword_1000342C0);
  __chkstk_darwin(v70);
  v67 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_1000064D4(&qword_1000342C8);
  v63 = *(_QWORD *)(v62 - 8);
  __chkstk_darwin(v62);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_1000064D4(&qword_100034320);
  v64 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v61 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1000064D4(&qword_1000342B0);
  __chkstk_darwin(v65);
  v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1000064D4(&qword_1000342A0);
  __chkstk_darwin(v68);
  v69 = (uint64_t)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v84 = *(_OWORD *)(a2 + 64);
  v13 = *((_QWORD *)&v84 + 1);
  v60 = (id)*((_QWORD *)&v84 + 1);
  KeyPath = swift_getKeyPath(&unk_100023138);
  v15 = swift_getKeyPath(&unk_100023160);
  swift_retain(v12);
  sub_10001F8D8((uint64_t)&v84);
  static Published.subscript.getter(v72, v13, KeyPath, v15);
  swift_release(KeyPath);
  swift_release(v15);
  sub_10001F370((uint64_t)&v84);
  v16 = *(_QWORD *)v72;
  sub_10001EC94(v12, *(uint64_t *)v72);
  swift_bridgeObjectRelease(v16);
  v17 = *(_OWORD *)(a2 + 16);
  v82[0] = *(_OWORD *)a2;
  v82[1] = v17;
  *(_OWORD *)v83 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v83[9] = *(_OWORD *)(a2 + 41);
  sub_100013D10((uint64_t)v82, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  sub_10001F398((uint64_t)v72);
  sub_100013D10((uint64_t)v82, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
  v19 = *((_QWORD *)&v73 + 1);
  v20 = v74;
  *(_OWORD *)v72 = *(_OWORD *)&v72[8];
  v18 = *(_OWORD *)v72;
  v72[16] = v73;
  v21 = sub_1000064D4(&qword_100034268);
  Binding.wrappedValue.getter(&v81, v21);
  swift_release(*((_QWORD *)&v20 + 1));
  swift_release(v20);
  swift_release(v19);
  swift_release(*((_QWORD *)&v18 + 1));
  swift_release(v18);
  if (v81)
    v22 = 0;
  else
    v22 = 2;
  v23 = swift_getKeyPath(&unk_1000231C8);
  v24 = type metadata accessor for CardModel(0);
  v25 = sub_100006FC8(&qword_100034270, type metadata accessor for CardModel, (uint64_t)&unk_100022B64);
  v26 = ObservedObject.init(wrappedValue:)(v12, v24, v25);
  v28 = v27;
  v81 = 0;
  State.init(wrappedValue:)(v72, &v81, &type metadata for Bool);
  v29 = v72[0];
  v30 = *(_QWORD *)&v72[8];
  *(_QWORD *)v72 = v23;
  *(_OWORD *)&v72[8] = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0;
  v76 = v26;
  v77 = v28;
  v78 = v29;
  v79 = v30;
  v80 = v22;
  v31 = sub_1000064D4(&qword_1000342D0);
  v32 = sub_10001F5BC();
  v33 = sub_1000073C4(&qword_1000342D8, &qword_1000342D0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  View.tabItem<A>(_:)(sub_10001F900, v12, &type metadata for TripView, v31, v32, v33);
  v34 = v77;
  v35 = v79;
  sub_10000DA4C(*(uint64_t *)v72, *(uint64_t *)&v72[8], *(uint64_t *)&v72[16], v73, *((uint64_t *)&v73 + 1), v74, *((uint64_t *)&v74 + 1), v75);
  swift_release(v34);
  swift_release(v35);
  v36 = swift_allocObject(&unk_10002DB28, 128, 7);
  v37 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v36 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v36 + 96) = v37;
  *(_BYTE *)(v36 + 112) = *(_BYTE *)(a2 + 96);
  v38 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v36 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v36 + 32) = v38;
  v39 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v36 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v36 + 64) = v39;
  *(_QWORD *)(v36 + 120) = v12;
  swift_retain(v12);
  sub_10001F870(a2);
  *(_QWORD *)v72 = &type metadata for TripView;
  *(_QWORD *)&v72[8] = v31;
  *(_QWORD *)&v72[16] = v32;
  *(_QWORD *)&v73 = v33;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v72, &opaque type descriptor for <<opaque return type of View.tabItem<A>(_:)>>, 1);
  v41 = v61;
  v42 = v62;
  View.onTapGesture(count:perform:)(1, sub_10001F958, v36, v62, OpaqueTypeConformance2);
  swift_release(v36);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v7, v42);
  v43 = swift_getKeyPath(&unk_100023138);
  v44 = swift_getKeyPath(&unk_100023160);
  static Published.subscript.getter(v72, v60, v43, v44);
  swift_release(v43);
  swift_release(v44);
  sub_10001F370((uint64_t)&v84);
  v45 = *(_QWORD *)v72;
  v46 = sub_10001EC94(v12, *(uint64_t *)v72);
  LOBYTE(v44) = v47;
  swift_bridgeObjectRelease(v45);
  if ((v44 & 1) != 0)
    v46 = 0;
  v48 = v64;
  v49 = (uint64_t)v67;
  v50 = v66;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v67, v41, v66);
  v51 = v49 + *(int *)(v70 + 36);
  *(_QWORD *)v51 = v46;
  *(_BYTE *)(v51 + 8) = 0;
  sub_1000142AC(v49, (uint64_t)v10, &qword_1000342C0);
  v52 = &v10[*(int *)(v65 + 36)];
  *(_QWORD *)v52 = v46;
  *((_WORD *)v52 + 4) = 0;
  sub_10000D68C(v49, &qword_1000342C0);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v41, v50);
  if (qword_1000329D8 != -1)
    swift_once(&qword_1000329D8, sub_100020268);
  v53 = qword_100035730;
  v54 = swift_retain(qword_100035730);
  v55 = static Edge.Set.all.getter(v54);
  v56 = v69;
  sub_1000142AC((uint64_t)v10, v69, &qword_1000342B0);
  v57 = v56 + *(int *)(v68 + 36);
  *(_QWORD *)v57 = v53;
  *(_BYTE *)(v57 + 8) = v55;
  sub_10000D68C((uint64_t)v10, &qword_1000342B0);
  return sub_100013F2C(v56, v71, &qword_1000342A0);
}

uint64_t sub_10001EC94(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = result;
  if ((unint64_t)a2 >> 62)
    goto LABEL_21;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
    }
    else
    {
      if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      v5 = *(_QWORD *)(a2 + 32);
      swift_retain(v5);
    }
    v3 += OBJC_IVAR____TtC4Trip9CardModel_id;
    v6 = static UUID.== infix(_:_:)(v5 + OBJC_IVAR____TtC4Trip9CardModel_id, v3);
    swift_release(v5);
    if ((v6 & 1) != 0)
      return 0;
    for (i = 0; ; ++i)
    {
      v7 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if (v7 == v4)
        return 0;
      if ((a2 & 0xC000000000000001) != 0)
      {
        v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(i + 1, a2);
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0)
          goto LABEL_19;
        if (v7 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_20;
        v9 = *(_QWORD *)(a2 + 32 + 8 * v7);
        swift_retain(v9);
      }
      v10 = static UUID.== infix(_:_:)(v9 + OBJC_IVAR____TtC4Trip9CardModel_id, v3);
      swift_release(v9);
      if ((v10 & 1) != 0)
        return v7;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    if (a2 < 0)
      v11 = a2;
    else
      v11 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v4 = _CocoaArrayWrapper.endIndex.getter(v11);
    result = swift_bridgeObjectRelease(a2);
  }
  return 0;
}

uint64_t sub_10001EE38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v16;

  v4 = Image.init(systemName:)(0x6C6C69662E726163, 0xE800000000000000);
  KeyPath = swift_getKeyPath(&unk_1000231F0);
  v6 = swift_getKeyPath(&unk_100023218);
  static Published.subscript.getter(&v16, a1, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  v7 = sub_1000140D4();
  v8 = Text.init<A>(_:)(&v16, &type metadata for String, v7);
  v10 = v9;
  v12 = v11;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v8;
  v14 = v13 & 1;
  *(_QWORD *)(a2 + 16) = v9;
  *(_BYTE *)(a2 + 24) = v13 & 1;
  *(_QWORD *)(a2 + 32) = v11;
  swift_retain(v4);
  sub_100013E3C(v8, v10, v14);
  swift_bridgeObjectRetain(v12);
  sub_100013F1C(v8, v10, v14);
  swift_release(v4);
  return swift_bridgeObjectRelease(v12);
}

uint64_t sub_10001EF50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;

  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(unsigned __int8 *)(a1 + 96);
  v7 = type metadata accessor for TripEnvironment(0);
  v8 = sub_100006FC8(&qword_100034260, type metadata accessor for TripEnvironment, (uint64_t)&unk_1000232E0);
  v9 = StateObject.wrappedValue.getter(v4, v5, v6, v7, v8);
  v20 = *(_OWORD *)(a1 + 64);
  KeyPath = swift_getKeyPath(&unk_100023138);
  v11 = swift_getKeyPath(&unk_100023160);
  static Published.subscript.getter(&v19, *((id *)&v20 + 1), KeyPath, v11);
  swift_release(KeyPath);
  swift_release(v11);
  sub_10001F370((uint64_t)&v20);
  v12 = v19;
  v13 = sub_10001EC94(a2, v19);
  LOBYTE(v11) = v14;
  swift_bridgeObjectRelease(v12);
  if ((v11 & 1) != 0)
    v15 = 0;
  else
    v15 = v13;
  v16 = swift_getKeyPath(&unk_100023180);
  v17 = swift_getKeyPath(&unk_1000231A8);
  v19 = v15;
  return static Published.subscript.setter(&v19, v9, v16, v17);
}

uint64_t sub_10001F088@<X0>(uint64_t a1@<X8>)
{
  return sub_10001DC50(a1);
}

uint64_t destroy for TripsTabView(uint64_t a1)
{
  sub_10000DA4C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));

  return sub_100006BE0(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

uint64_t initializeWithCopy for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v2 = a2;
  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  v12 = *(void **)(v2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 72) = v12;
  v13 = *(_QWORD *)(v2 + 80);
  v14 = *(_QWORD *)(v2 + 88);
  LOBYTE(v2) = *(_BYTE *)(v2 + 96);
  v15 = v12;
  sub_100006BA8(v13, v14);
  *(_QWORD *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v14;
  *(_BYTE *)(a1 + 96) = v2;
  return a1;
}

uint64_t assignWithCopy for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = a2;
  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a2 + 56);
  sub_10000D9BC(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  sub_10000DA4C(v12, v13, v14, v15, v16, v17, v18, v19);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(v2 + 64);
  v20 = *(void **)(v2 + 72);
  v21 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v20;
  v22 = v20;

  v23 = *(_QWORD *)(v2 + 80);
  v24 = *(_QWORD *)(v2 + 88);
  LOBYTE(v2) = *(_BYTE *)(v2 + 96);
  sub_100006BA8(v23, v24);
  v25 = *(_QWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = v23;
  *(_QWORD *)(a1 + 88) = v24;
  *(_BYTE *)(a1 + 96) = v2;
  sub_100006BE0(v25, v26);
  return a1;
}

uint64_t assignWithTake for TripsTabView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 56);
  v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  sub_10000DA4C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = *(_QWORD *)(a2 + 72);
  v16 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v15;

  v17 = *(_BYTE *)(a2 + 96);
  v18 = *(_QWORD *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 96) = v17;
  sub_100006BE0(v18, v19);
  return a1;
}

ValueMetadata *type metadata accessor for TripsTabView()
{
  return &type metadata for TripsTabView;
}

uint64_t sub_10001F358(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002644C, 1);
}

uint64_t sub_10001F370(uint64_t a1)
{

  return a1;
}

uint64_t sub_10001F398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = type metadata accessor for EnvironmentValues(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)v1;
  if (*(_BYTE *)(v1 + 56) == 1)
  {
    v8 = *(_QWORD *)(v1 + 48);
    v9 = *(_BYTE *)(v1 + 24);
    v11 = *(_QWORD *)(v1 + 8);
    v10 = *(_QWORD *)(v1 + 16);
    *(_BYTE *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v11;
    *(_QWORD *)(a1 + 16) = v10;
    *(_BYTE *)(a1 + 24) = v9 & 1;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
    *(_QWORD *)(a1 + 48) = v8;
    return sub_100013D10(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
  }
  else
  {
    v13 = sub_100013D10(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000D9BC);
    v14 = static os_log_type_t.fault.getter(v13);
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v22 = v7;
      v19 = v18;
      v24 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = v17 + 4;
      v23 = sub_100018B9C(0xD000000000000013, 0x8000000100024440, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v21, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      v20 = v19;
      v7 = v22;
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v6, v7);
    sub_100013D10(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000DA4C);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

unint64_t sub_10001F5BC()
{
  unint64_t result;

  result = qword_100034280;
  if (!qword_100034280)
  {
    result = swift_getWitnessTable(&unk_100022D18, &type metadata for TripView);
    atomic_store(result, (unint64_t *)&qword_100034280);
  }
  return result;
}

uint64_t sub_10001F600()
{
  uint64_t v0;

  return sub_10001E438(*(_QWORD *)(v0 + 16));
}

unint64_t sub_10001F608()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034298;
  if (!qword_100034298)
  {
    v1 = sub_100007234(&qword_1000342A0);
    sub_10001F68C();
    sub_1000073C4(&qword_100034300, &qword_100034308, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034298);
  }
  return result;
}

unint64_t sub_10001F68C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000342A8;
  if (!qword_1000342A8)
  {
    v1 = sub_100007234(&qword_1000342B0);
    sub_10001F710();
    sub_1000073C4(&qword_1000342F0, &qword_1000342F8, (uint64_t)&protocol conformance descriptor for _TraitWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000342A8);
  }
  return result;
}

unint64_t sub_10001F710()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  ValueMetadata *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  result = qword_1000342B8;
  if (!qword_1000342B8)
  {
    v1 = sub_100007234(&qword_1000342C0);
    v2 = sub_100007234(&qword_1000342C8);
    v4 = &type metadata for TripView;
    v5 = sub_100007234(&qword_1000342D0);
    v6 = sub_10001F5BC();
    v7 = sub_1000073C4(&qword_1000342D8, &qword_1000342D0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.tabItem<A>(_:)>>, 1);
    v4 = (ValueMetadata *)v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>, 1);
    sub_1000073C4(&qword_1000342E0, &qword_1000342E8, (uint64_t)&protocol conformance descriptor for _TraitWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000342B8);
  }
  return result;
}

uint64_t sub_10001F820()
{
  uint64_t v0;

  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));

  sub_100006BE0(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  return swift_deallocObject(v0, 113, 7);
}

uint64_t sub_10001F868@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_10001E5B8(a1, v2 + 16, a2);
}

uint64_t sub_10001F870(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 72);
  v2 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  sub_10000D9BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  v5 = v3;
  sub_100006BA8(v2, v4);
  return a1;
}

uint64_t sub_10001F8D8(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_10001F900@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10001EE38(v1, a1);
}

uint64_t sub_10001F908()
{
  uint64_t v0;

  sub_10000DA4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));

  sub_100006BE0(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  swift_release(*(_QWORD *)(v0 + 120));
  return swift_deallocObject(v0, 128, 7);
}

uint64_t sub_10001F958()
{
  uint64_t v0;

  return sub_10001EF50(v0 + 16, *(_QWORD *)(v0 + 120));
}

uint64_t sub_10001F96C()
{
  return sub_10001F9A0(&qword_100034328, &qword_100034330, (void (*)(void))sub_10001FA04, (uint64_t)&protocol conformance descriptor for <A> A?);
}

uint64_t sub_10001F9A0(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_100007234(a2);
    a3();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001FA04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034338;
  if (!qword_100034338)
  {
    v1 = sub_100007234(&qword_100034258);
    sub_1000073C4(&qword_100034278, &qword_100034250, (uint64_t)&protocol conformance descriptor for TabView<A, B>);
    sub_10001F5BC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100034338);
  }
  return result;
}

uint64_t sub_10001FA88@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100023318);
  v5 = swift_getKeyPath(&unk_100023340);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10001FB04(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100023318);
  v5 = swift_getKeyPath(&unk_100023340);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10001FB74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v0 = type metadata accessor for TripEnvironment(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v3 = 0;
  result = Published.init(initialValue:)(&v3, &type metadata for Int);
  qword_100035728 = v1;
  return result;
}

uint64_t sub_10001FBD4()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100023318);
  v2 = swift_getKeyPath(&unk_100023340);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_10001FC44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Trip15TripEnvironment__selectedTripIndex;
  v2 = sub_1000064D4(&qword_100034438);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10001FC98()
{
  return type metadata accessor for TripEnvironment(0);
}

uint64_t type metadata accessor for TripEnvironment(uint64_t a1)
{
  uint64_t result;

  result = qword_100034370;
  if (!qword_100034370)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TripEnvironment);
  return result;
}

void sub_10001FCDC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_10001FD48();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
  }
}

void sub_10001FD48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100034380)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Int);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100034380);
  }
}

uint64_t getEnumTagSinglePayload for TripPresentationMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TripPresentationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001FE78 + 4 * byte_100023245[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001FEAC + 4 * byte_100023240[v4]))();
}

uint64_t sub_10001FEAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001FEB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001FEBCLL);
  return result;
}

uint64_t sub_10001FEC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001FED0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001FED4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001FEDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TripPresentationMode()
{
  return &type metadata for TripPresentationMode;
}

unint64_t sub_10001FEFC()
{
  unint64_t result;

  result = qword_100034430;
  if (!qword_100034430)
  {
    result = swift_getWitnessTable(&unk_1000232B8, &type metadata for TripPresentationMode);
    atomic_store(result, (unint64_t *)&qword_100034430);
  }
  return result;
}

uint64_t sub_10001FF40@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for TripEnvironment(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t destroy for LayoutConfiguration(_QWORD *a1)
{
  swift_release(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[4]);
  swift_release(a1[5]);
  return swift_release(a1[6]);
}

uint64_t initializeWithCopy for LayoutConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t assignWithCopy for LayoutConfiguration(uint64_t a1, uint64_t a2)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  swift_retain(v5);
  swift_release(v4);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  swift_retain(v6);
  swift_release(v7);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_retain(v10);
  swift_release(v11);
  v12 = *(_QWORD *)(a2 + 48);
  v13 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v12;
  swift_retain(v12);
  swift_release(v13);
  return a1;
}

__n128 initializeWithTake for LayoutConfiguration(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for LayoutConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_release(*(_QWORD *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_release(*(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LayoutConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfiguration()
{
  return &type metadata for LayoutConfiguration;
}

uint64_t *NSNotificationName.ClusterEvent.unsafeMutableAddressor()
{
  if (qword_1000329E8 != -1)
    swift_once(&qword_1000329E8, sub_100020480);
  return &static NSNotificationName.ClusterEvent;
}

uint64_t sub_100020268()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemGroupedBackgroundColor");
  result = Color.init(_:)(v0);
  qword_100035730 = result;
  return result;
}

uint64_t sub_1000202A4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  _QWORD v10[2];
  char v11;

  v9 = 0;
  static Binding.constant(_:)(v10, &v9, &type metadata for Bool);
  v0 = v10[0];
  v1 = v10[1];
  v2 = v11;
  v3 = type metadata accessor for ConsoleMetrics();
  swift_allocObject(v3, 152, 7);
  v4 = sub_10001D1DC();
  v5 = type metadata accessor for ClusterMetrics();
  swift_allocObject(v5, 152, 7);
  v6 = sub_10001D4E4();
  v7 = type metadata accessor for WidgetMetrics();
  swift_allocObject(v7, 152, 7);
  result = sub_10001D850();
  byte_100034440 = 1;
  qword_100034448 = v0;
  unk_100034450 = v1;
  byte_100034458 = v2;
  qword_100034460 = v4;
  unk_100034468 = v6;
  qword_100034470 = result;
  return result;
}

uint64_t sub_100020370@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_1000329E0 != -1)
    swift_once(&qword_1000329E0, sub_1000202A4);
  v2 = qword_100034448;
  v3 = unk_100034450;
  v4 = byte_100034458;
  v5 = qword_100034460;
  v6 = unk_100034468;
  v7 = qword_100034470;
  *(_BYTE *)a1 = byte_100034440;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v5);
  swift_retain(v6);
  return swift_retain(v7);
}

__n128 sub_100020418@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned __int8 v5;
  unint64_t v6;
  __n128 result;
  _QWORD v8[3];
  unsigned __int8 v9;
  __n128 v10;
  unint64_t v11;

  v2 = sub_100007188();
  EnvironmentValues.subscript.getter(v8, &type metadata for LayoutConfigurationKey, &type metadata for LayoutConfigurationKey, v2);
  v3 = v8[1];
  v4 = v8[2];
  v5 = v9;
  v6 = v11;
  result = v10;
  a1->n128_u8[0] = v8[0];
  a1->n128_u64[1] = v3;
  a1[1].n128_u64[0] = v4;
  a1[1].n128_u8[8] = v5;
  a1[2] = result;
  a1[3].n128_u64[0] = v6;
  return result;
}

NSString sub_100020480()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  static NSNotificationName.ClusterEvent = (uint64_t)result;
  return result;
}

id static NSNotificationName.ClusterEvent.getter()
{
  if (qword_1000329E8 != -1)
    swift_once(&qword_1000329E8, sub_100020480);
  return (id)static NSNotificationName.ClusterEvent;
}

uint64_t storeEnumTagSinglePayload for ClusterEventType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100020544 + 4 * byte_100023385[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100020578 + 4 * asc_100023380[v4]))();
}

uint64_t sub_100020578(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100020580(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100020588);
  return result;
}

uint64_t sub_100020594(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002059CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000205A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000205A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClusterEventType()
{
  return &type metadata for ClusterEventType;
}

unint64_t sub_1000205C8()
{
  unint64_t result;

  result = qword_100034478;
  if (!qword_100034478)
  {
    result = swift_getWitnessTable(&unk_1000233E4, &type metadata for ClusterEventType);
    atomic_store(result, (unint64_t *)&qword_100034478);
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutConfigurationKey()
{
  return &type metadata for LayoutConfigurationKey;
}

uint64_t sub_10002061C()
{
  uint64_t result;

  sub_100021308();
  result = NSString.init(stringLiteral:)("selectHandler", 13, 2);
  qword_100035740 = result;
  return result;
}

void sub_1000206DC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = (void *)v4;
    v12 = a1;
    v6 = objc_msgSend(v5, "_FBSScene");
    v7 = objc_msgSend(v6, "settings");

    v8 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    v9 = swift_dynamicCastObjCClass(v7, v8);

    if (v9)
    {
      v10 = *(void **)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = 0;

      if (qword_1000329F0 != -1)
        swift_once(&qword_1000329F0, sub_10002061C);
      objc_msgSend(v5, "_unregisterSceneActionsHandlerArray:", qword_100035740);
    }
    else
    {
      v11 = *(void **)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = 0;

    }
    if (qword_1000329F0 != -1)
      swift_once(&qword_1000329F0, sub_10002061C);
    objc_msgSend(v12, "_unregisterSceneActionsHandlerArray:", qword_100035740);

  }
}

id sub_1000208F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TripSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TripSceneDelegate()
{
  return objc_opt_self(_TtC4Trip17TripSceneDelegate);
}

unint64_t sub_100020980(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000064D4(&qword_100034580);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100021284(v7, (uint64_t)v16);
    result = sub_100020AB4((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10000D6C8(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
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

unint64_t sub_100020AB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100020AE4(a1, v4);
}

unint64_t sub_100020AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1000212CC(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000D658((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_100020BA8(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  os_log_type_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSArray v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  Class isa;

  v3 = v2;
  v6 = objc_msgSend(a2, "role");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v8 = v7;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  CAFSignpostEmit_Scene(v9);

  v10 = objc_opt_self(UIWindowScene);
  v11 = swift_dynamicCastObjCClass(a1, v10);
  if (!v11)
    goto LABEL_8;
  v12 = (void *)v11;
  v13 = a1;
  v14 = objc_msgSend(a2, "role");
  v15 = _UIWindowSceneSessionRoleCarPlay;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  if (v16 == v19 && v18 == v20)
  {

    swift_bridgeObjectRelease_n(v18, 2);
  }
  else
  {
    v22 = v20;
    v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v19, v20, 0);

    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v22);
    if ((v23 & 1) == 0)
    {

LABEL_8:
      v24 = static os_log_type_t.info.getter(v11);
      sub_1000191DC(v24, 0xD000000000000024, 0x80000001000245C0, 0xD00000000000001FLL, 0x80000001000245F0, 23);
      return;
    }
  }
  v25 = objc_msgSend(v12, "_FBSScene");
  v26 = objc_msgSend(v25, "settings");

  v27 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v28 = swift_dynamicCastObjCClass(v26, v27);

  objc_allocWithZone((Class)type metadata accessor for TripWindowManager());
  v40 = v13;
  if (v28)
  {
    v29 = sub_100007404(v12, 1);
    v30 = *(void **)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = v29;

    v31 = sub_1000064D4(&qword_100032A98);
    v32 = swift_allocObject(v31, 40, 7);
    *(_OWORD *)(v32 + 16) = xmmword_1000225E0;
    v33 = objc_msgSend(objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler), "initWithDelegate:", v3);
    *(_QWORD *)(v32 + 32) = v33;
    specialized Array._endMutation()(v33);
    v34 = v32;
    sub_1000064D4((uint64_t *)&unk_1000345A0);
    v35.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v34);
    if (qword_1000329F0 != -1)
      swift_once(&qword_1000329F0, sub_10002061C);
    objc_msgSend(v12, "_registerSceneActionsHandlerArray:forKey:", v35.super.isa, qword_100035740);
  }
  else
  {
    v36 = sub_100007404(v12, 0);
    v35.super.isa = *(Class *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = v36;
  }

  v37 = sub_1000064D4(&qword_100032A98);
  v38 = swift_allocObject(v37, 40, 7);
  *(_OWORD *)(v38 + 16) = xmmword_1000225E0;
  v39 = objc_msgSend(objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler), "initWithDelegate:", v3);
  *(_QWORD *)(v38 + 32) = v39;
  specialized Array._endMutation()(v39);
  sub_1000064D4((uint64_t *)&unk_1000345A0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  if (qword_1000329F0 != -1)
    swift_once(&qword_1000329F0, sub_10002061C);
  objc_msgSend(v40, "_registerSceneActionsHandlerArray:forKey:", isa, qword_100035740);

}

void sub_100020F8C(uint64_t a1)
{
  os_log_type_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  os_log_type_t v6;
  uint64_t v7;
  unint64_t v8;
  Class isa;
  os_log_type_t v10;
  uint64_t v11;
  _WORD v12[8];
  _BYTE v13[104];

  if (a1 == 2)
  {
    v6 = static os_log_type_t.info.getter(2);
    sub_1000191DC(v6, 0xD00000000000001ELL, 0x8000000100024570, 0xD00000000000001ALL, 0x8000000100024550, 61);
    v2 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1000329E8 != -1)
      swift_once(&qword_1000329E8, sub_100020480);
    v3 = static NSNotificationName.ClusterEvent;
    v7 = sub_1000064D4(&qword_100034578);
    inited = swift_initStackObject(v7, v13);
    *(_OWORD *)(inited + 16) = xmmword_100022CF0;
    strcpy((char *)v12, "ClusterEvent");
    HIBYTE(v12[6]) = 0;
    v12[7] = -5120;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v12, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 96) = &type metadata for ClusterEventType;
    *(_BYTE *)(inited + 72) = 1;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    v1 = static os_log_type_t.info.getter(1);
    sub_1000191DC(v1, 0xD000000000000020, 0x8000000100024590, 0xD00000000000001ALL, 0x8000000100024550, 57);
    v2 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1000329E8 != -1)
      swift_once(&qword_1000329E8, sub_100020480);
    v3 = static NSNotificationName.ClusterEvent;
    v4 = sub_1000064D4(&qword_100034578);
    inited = swift_initStackObject(v4, &v11);
    *(_OWORD *)(inited + 16) = xmmword_100022CF0;
    strcpy((char *)v12, "ClusterEvent");
    HIBYTE(v12[6]) = 0;
    v12[7] = -5120;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v12, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 96) = &type metadata for ClusterEventType;
    *(_BYTE *)(inited + 72) = 0;
LABEL_9:
    v8 = sub_100020980(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, isa);

    return;
  }
  v10 = static os_log_type_t.info.getter(a1);
  sub_1000191DC(v10, 0xD000000000000021, 0x8000000100024520, 0xD00000000000001ALL, 0x8000000100024550, 65);
}

uint64_t sub_100021284(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000064D4(&qword_100034588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000212CC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

unint64_t sub_100021308()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034590;
  if (!qword_100034590)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100034590);
  }
  return result;
}

uint64_t sub_100021344()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC4TripP33_867F2E7B2EB1F9A0778A2D2F2B452C7219ResourceBundleClass);
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}
