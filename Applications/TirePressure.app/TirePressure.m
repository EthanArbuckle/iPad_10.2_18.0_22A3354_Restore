void sub_1000034CC()
{
  char *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
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
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  Class isa;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  objc_super v74;

  v1 = v0;
  v74.receiver = v0;
  v74.super_class = (Class)type metadata accessor for TirePressureViewController();
  objc_msgSendSuper2(&v74, "viewDidLoad");
  v2 = *(void **)&v0[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_scenePresentationTypeObserver];
  v3 = sub_100003FCC(0, &qword_1000199A0, CAFCarManager_ptr);
  v4 = sub_100003EF4();
  v5 = v2;
  v6 = CAFObserved<>.observable.getter(v3, v4);
  v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_assetManager];
  v8 = type metadata accessor for ScenePresentationTypeObserver(0);
  v9 = sub_100003F4C(&qword_1000199B0, type metadata accessor for ScenePresentationTypeObserver, (uint64_t)&unk_10000F8EC);
  swift_retain(v7);
  v10 = ObservedObject.init(wrappedValue:)(v5, v8, v9);
  v12 = v11;
  v13 = type metadata accessor for CAFCarManagerObservable(0);
  v14 = sub_100003F4C(&qword_1000199B8, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCarManagerObservable, (uint64_t)&protocol conformance descriptor for CAFCarManagerObservable);
  v15 = ObservedObject.init(wrappedValue:)(v6, v13, v14);
  v17 = v16;
  v18 = type metadata accessor for CAUAssetLibraryManager(0);
  v19 = sub_100003F4C(&qword_1000199C0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUAssetLibraryManager, (uint64_t)&protocol conformance descriptor for CAUAssetLibraryManager);
  v68 = v10;
  v69 = v12;
  v70 = v15;
  v71 = v17;
  v72 = ObservedObject.init(wrappedValue:)(v7, v18, v19);
  v73 = v20;
  v21 = objc_allocWithZone((Class)sub_100003F8C(&qword_1000199C8));
  v22 = (void *)UIHostingController.init(rootView:)(&v68);
  v23 = objc_msgSend(v22, "view", v68, v69, v70, v71, v72, v73);
  if (!v23)
  {
    __break(1u);
    goto LABEL_15;
  }
  v24 = v23;
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = objc_msgSend(v22, "view");
  if (!v25)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v26 = v25;
  v27 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v26, "setBackgroundColor:", v27);

  v28 = objc_msgSend(v1, "view");
  if (!v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v29 = v28;
  v30 = objc_msgSend(v22, "view");
  if (!v30)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v31 = v30;
  objc_msgSend(v29, "addSubview:", v30);

  v32 = sub_100003F8C(&qword_1000199D0);
  v33 = swift_allocObject(v32, 64, 7);
  *(_OWORD *)(v33 + 16) = xmmword_10000F1A0;
  v34 = objc_msgSend(v22, "view");
  if (!v34)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v35 = v34;
  v36 = objc_msgSend(v34, "topAnchor");

  v37 = objc_msgSend(v1, "view");
  if (!v37)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "topAnchor");

  v40 = objc_msgSend(v36, "constraintEqualToAnchor:", v39);
  *(_QWORD *)(v33 + 32) = v40;
  v41 = objc_msgSend(v22, "view");
  if (!v41)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v42 = v41;
  v43 = objc_msgSend(v41, "bottomAnchor");

  v44 = objc_msgSend(v1, "view");
  if (!v44)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v45 = v44;
  v46 = objc_msgSend(v44, "safeAreaLayoutGuide");

  v47 = objc_msgSend(v46, "bottomAnchor");
  v48 = objc_msgSend(v43, "constraintEqualToAnchor:", v47);

  *(_QWORD *)(v33 + 40) = v48;
  v49 = objc_msgSend(v22, "view");
  if (!v49)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v50 = v49;
  v51 = objc_msgSend(v49, "leadingAnchor");

  v52 = objc_msgSend(v1, "view");
  if (!v52)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v53 = v52;
  v54 = objc_msgSend(v52, "safeAreaLayoutGuide");

  v55 = objc_msgSend(v54, "leadingAnchor");
  v56 = objc_msgSend(v51, "constraintEqualToAnchor:", v55);

  *(_QWORD *)(v33 + 48) = v56;
  v57 = objc_msgSend(v22, "view");
  if (!v57)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v58 = v57;
  v59 = objc_msgSend(v57, "trailingAnchor");

  v60 = objc_msgSend(v1, "view");
  if (v60)
  {
    v61 = v60;
    v62 = (void *)objc_opt_self(NSLayoutConstraint);
    v63 = objc_msgSend(v61, "safeAreaLayoutGuide");

    v64 = objc_msgSend(v63, "trailingAnchor");
    v65 = objc_msgSend(v59, "constraintEqualToAnchor:", v64);

    *(_QWORD *)(v33 + 56) = v65;
    v68 = v33;
    specialized Array._endMutation()();
    v66 = v68;
    sub_100003FCC(0, &qword_1000199D8, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v66);
    objc_msgSend(v62, "activateConstraints:", isa);

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_100003B34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TirePressureViewController()
{
  return objc_opt_self(_TtC12TirePressure26TirePressureViewController);
}

void type metadata accessor for CRSUIHostedAltScreenPresentationType(uint64_t a1)
{
  sub_100004280(a1, &qword_100019938, (uint64_t)&unk_100014CC0);
}

BOOL sub_100003BE0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003BF4(uint64_t a1, uint64_t a2)
{
  return sub_100003CBC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003C00(uint64_t a1)
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

Swift::Int sub_100003C40(uint64_t a1)
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

uint64_t sub_100003CB0(uint64_t a1, uint64_t a2)
{
  return sub_100003CBC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003CBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100003CF8(uint64_t a1, id *a2)
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

uint64_t sub_100003D6C(uint64_t a1, id *a2)
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

uint64_t sub_100003DE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

_QWORD *sub_100003E28@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100003E38(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100003E44@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003E6C(_QWORD *a1, uint64_t *a2)
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

unint64_t sub_100003EF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000199A8;
  if (!qword_1000199A8)
  {
    v1 = sub_100003FCC(255, &qword_1000199A0, CAFCarManager_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for CAFCarManager, v1);
    atomic_store(result, (unint64_t *)&qword_1000199A8);
  }
  return result;
}

uint64_t sub_100003F4C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100003F8C(uint64_t *a1)
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

uint64_t sub_100003FCC(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100004280(a1, &qword_1000199E0, (uint64_t)&unk_100014CE0);
}

uint64_t sub_100004018@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_10000405C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100003F4C((unint64_t *)&qword_100019A00, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10000F3C4);
  v3 = sub_100003F4C(&qword_100019A08, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10000F318);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000040E0()
{
  return sub_100003F4C(&qword_1000199E8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10000F2DC);
}

uint64_t sub_10000410C()
{
  return sub_100003F4C(&qword_1000199F0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10000F2B0);
}

uint64_t sub_100004138()
{
  return sub_100003F4C(&qword_1000199F8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10000F34C);
}

uint64_t initializeBufferWithCopyOfBuffer for TirePressureWidgetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100004198(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000041A4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000041C4(uint64_t result, int a2, int a3)
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
  sub_100004280(a1, &qword_100019A10, (uint64_t)&unk_100014D60);
}

__n128 sub_100004204(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004210(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004230(uint64_t result, int a2, int a3)
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
  sub_100004280(a1, &qword_100019A18, (uint64_t)&unk_100014DE0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100004280(a1, (unint64_t *)&unk_100019A20, (uint64_t)&unk_100014E60);
}

void sub_100004280(uint64_t a1, unint64_t *a2, uint64_t a3)
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

id sub_1000042FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureWindowManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TirePressureWindowManager()
{
  return objc_opt_self(_TtC12TirePressure25TirePressureWindowManager);
}

uint64_t sub_10000435C()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = objc_msgSend(v0, "bundleIdentifier");

  if (v1)
  {
    v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v4 = v3;

  }
  else
  {
    v2 = 0;
    v4 = 0xE000000000000000;
  }
  sub_100004C48();
  result = OS_os_log.init(subsystem:category:)(v2, v4, 0x7365725065726954, 0xEC00000065727573);
  qword_10001AD10 = result;
  return result;
}

uint64_t sub_100004420(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000044F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100004C08((uint64_t)v12, *a3);
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
      sub_100004C08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100004BE8(v12);
  return v7;
}

uint64_t sub_1000044F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000046A8(a5, a6);
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

uint64_t sub_1000046A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000473C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100004914(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100004914(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000473C(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000048B0(v4, 0);
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

_QWORD *sub_1000048B0(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003F8C(&qword_100019B80);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100004914(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003F8C(&qword_100019B80);
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

uint64_t sub_100004A60(uint64_t a1, unint64_t a2)
{
  return sub_100004A78(a1, a2, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_100004A6C(uint64_t a1, unint64_t a2)
{
  return sub_100004A78(a1, a2, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_100004A78(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  os_log_type_t v5;
  NSObject *v6;
  uint64_t result;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3();
  if (qword_1000198B0 != -1)
    swift_once(&qword_1000198B0, sub_10000435C);
  v6 = qword_10001AD10;
  result = os_log_type_enabled((os_log_t)qword_10001AD10, v5);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a2, 2);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v11 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    v10 = sub_100004420(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    return swift_slowDealloc(v8, -1, -1);
  }
  return result;
}

uint64_t sub_100004BE8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100004C08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100004C48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019B88;
  if (!qword_100019B88)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019B88);
  }
  return result;
}

uint64_t sub_100004C84(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  os_log_type_t v10;
  NSObject *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v10 = static os_log_type_t.debug.getter();
  if (qword_1000198B0 != -1)
    swift_once(&qword_1000198B0, sub_10000435C);
  v11 = qword_10001AD10;
  result = os_log_type_enabled((os_log_t)qword_10001AD10, v10);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a4, 2);
    swift_bridgeObjectRetain_n(a2, 2);
    v13 = swift_slowAlloc(32, -1);
    v14 = swift_slowAlloc(64, -1);
    v16 = v14;
    *(_DWORD *)v13 = 136315650;
    swift_bridgeObjectRetain(a4);
    v15 = sub_100004420(a3, a4, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease_n(a4, 3);
    *(_WORD *)(v13 + 12) = 2048;
    v15 = a5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 14, v13 + 22);
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain(a2);
    v15 = sub_100004420(a1, a2, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 24, v13 + 32);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v11, v10, "%s:%ld  %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    return swift_slowDealloc(v13, -1, -1);
  }
  return result;
}

uint64_t sub_100004E78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t (**v27)(void **);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t *);
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[4];
  uint64_t v46;
  char v47;
  __int128 v48;
  char v49;
  char v50;

  v42 = a1;
  v2 = sub_100003F8C(&qword_100019C60);
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  __chkstk_darwin();
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100003F8C(&qword_100019C68);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100003F8C(&qword_100019C70);
  v9 = __chkstk_darwin();
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = static Alignment.center.getter(v9);
  v39 = v12;
  sub_100005170(v1, (uint64_t)v45);
  v38 = v45[0];
  v37 = v45[1];
  v36 = v45[2];
  v35 = v45[3];
  v13 = v46;
  v14 = v47;
  v15 = sub_100005544();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = static Edge.Set.all.getter();
  v50 = v14;
  v49 = 0;
  v45[0] = *(_OWORD *)(v1 + 16);
  v23 = *((id *)&v45[0] + 1);
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  sub_100009B60((uint64_t)v45);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v11[*(int *)(v8 + 52)], v7, v4);
  v24 = v39;
  *(_QWORD *)v11 = v40;
  *((_QWORD *)v11 + 1) = v24;
  v25 = v37;
  *((_OWORD *)v11 + 1) = v38;
  *((_OWORD *)v11 + 2) = v25;
  v26 = v35;
  *((_OWORD *)v11 + 3) = v36;
  *((_OWORD *)v11 + 4) = v26;
  *((_QWORD *)v11 + 10) = v13;
  v11[88] = v50;
  v11[96] = v22;
  *((double *)v11 + 13) = v15;
  *((_QWORD *)v11 + 14) = v17;
  *((_QWORD *)v11 + 15) = v19;
  *((_QWORD *)v11 + 16) = v21;
  v11[136] = v49;
  v27 = (uint64_t (**)(void **))&v11[*(int *)(v8 + 56)];
  *v27 = sub_1000058C0;
  v27[1] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v48 = *(_OWORD *)(v1 + 32);
  swift_retain(*((_QWORD *)&v48 + 1));
  v28 = v41;
  dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
  sub_100009B88((uint64_t)&v48);
  v29 = v42;
  sub_10000C654((uint64_t)v11, v42, &qword_100019C70);
  v30 = sub_100003F8C(&qword_100019C78);
  v32 = v43;
  v31 = v44;
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 16))(v29 + *(int *)(v30 + 52), v28, v44);
  v33 = (uint64_t (**)(uint64_t *))(v29 + *(int *)(v30 + 56));
  *v33 = sub_100005968;
  v33[1] = 0;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
  return sub_10000C698((uint64_t)v11, &qword_100019C70);
}

double sub_100005170@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double result;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  char v38;
  uint64_t (*v39)();
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  _OWORD v45[4];
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;

  v49 = *(_OWORD *)(a1 + 16);
  v4 = *((id *)&v49 + 1);
  v5 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();
  sub_100009B60((uint64_t)&v49);
  if (v5)
  {
    v6 = sub_100003FCC(0, &qword_100019CF0, CAFCar_ptr);
    v7 = sub_100009DF0(&qword_100019CF8, &qword_100019CF0, CAFCar_ptr, (uint64_t)&protocol conformance descriptor for CAFCar);
    v8 = CAFObserved<>.observable.getter(v6, v7);
    v48 = *(_OWORD *)(a1 + 32);
    swift_retain(*((_QWORD *)&v48 + 1));
    v9 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
    sub_100009B88((uint64_t)&v48);
    v10 = type metadata accessor for CAFCarObservable(0);
    v11 = sub_100003F4C(&qword_100019D00, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCarObservable, (uint64_t)&protocol conformance descriptor for CAFCarObservable);
    v12 = ObservedObject.init(wrappedValue:)(v8, v10, v11);
    v14 = v13;
    v15 = (void *)CAFCar.dimesionObservable.getter();
    v16 = type metadata accessor for CAFDimensionObservable(0);
    v17 = sub_100003F4C(&qword_100019D08, (uint64_t (*)(uint64_t))&type metadata accessor for CAFDimensionObservable, (uint64_t)&protocol conformance descriptor for CAFDimensionObservable);
    v18 = static ObservableObject.environmentStore.getter(v16, v17);
    v39 = (uint64_t (*)())v12;
    *(_QWORD *)&v40 = v14;
    *((_QWORD *)&v40 + 1) = v9;
    *(_QWORD *)&v41 = v18;
    *((_QWORD *)&v41 + 1) = v15;
    *(_QWORD *)&v42 = sub_10000550C;
    v43 = 0uLL;
    *((_QWORD *)&v42 + 1) = 0;
    v44 = 0;
    v19 = v9;
    swift_retain(v18);
    v20 = v15;
    v21 = v14;
    sub_100009E30((uint64_t)sub_10000550C, 0);
    sub_100009E30(0, 0);
    v22 = v21;
    v23 = v19;
    swift_retain(v18);
    v24 = v20;
    sub_100009E30((uint64_t)sub_10000550C, 0);
    sub_100009E30(0, 0);
    v25 = sub_100003F8C(&qword_100019CA0);
    v26 = sub_100003F8C(&qword_100019CA8);
    v27 = sub_100009D40(&qword_100019CB0, &qword_100019CA0, (void (*)(void))sub_100009C78);
    v28 = sub_100009D40(&qword_100019CE0, &qword_100019CA8, (void (*)(void))sub_100009DAC);
    _ConditionalContent<>.init(storage:)(v45, &v39, v25, v26, v27, v28);

    swift_release(v18);
    sub_100009E40((uint64_t)sub_10000550C, 0);
    sub_100009E40(0, 0);

    swift_release(v18);
    sub_100009E40((uint64_t)sub_10000550C, 0);
    sub_100009E40(0, 0);
  }
  else
  {
    v39 = sub_100005528;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 1;
    v29 = sub_100003F8C(&qword_100019CA0);
    v30 = sub_100003F8C(&qword_100019CA8);
    v31 = sub_100009D40(&qword_100019CB0, &qword_100019CA0, (void (*)(void))sub_100009C78);
    v32 = sub_100009D40(&qword_100019CE0, &qword_100019CA8, (void (*)(void))sub_100009DAC);
    _ConditionalContent<>.init(storage:)(v45, &v39, v29, v30, v31, v32);
  }
  result = *(double *)v45;
  v34 = v45[1];
  v35 = v45[2];
  v36 = v45[3];
  v37 = v46;
  v38 = v47;
  *(_OWORD *)a2 = v45[0];
  *(_OWORD *)(a2 + 16) = v34;
  *(_OWORD *)(a2 + 32) = v35;
  *(_OWORD *)(a2 + 48) = v36;
  *(_QWORD *)(a2 + 64) = v37;
  *(_BYTE *)(a2 + 72) = v38;
  return result;
}

uint64_t sub_10000550C()
{
  return sub_100004A6C(0xD000000000000019, 0x800000010000FEF0);
}

uint64_t sub_100005528()
{
  return sub_100004A6C(0xD000000000000018, 0x800000010000FF10);
}

double sub_100005544()
{
  __int128 *v0;
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
  void *v11;
  uint64_t KeyPath;
  uint64_t v13;
  double v14;
  void *v15;
  unint64_t v16;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  float v23;
  uint64_t (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  v35 = type metadata accessor for CAUWidgetContentMargins(0);
  v33 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin();
  v34 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for CAUResource(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100003F8C(&qword_100019C88);
  __chkstk_darwin();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin();
  v32 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = *v0;
  v11 = (void *)*((_QWORD *)&v38 + 1);
  KeyPath = swift_getKeyPath(&unk_10000F548);
  v13 = swift_getKeyPath(&unk_10000F570);
  static Published.subscript.getter(&v37, v11, KeyPath, v13);
  swift_release(KeyPath);
  swift_release(v13);
  sub_100009B60((uint64_t)&v38);
  v14 = 0.0;
  if ((_QWORD)v37 != 3)
  {
    v37 = v0[2];
    swift_retain(*((_QWORD *)&v37 + 1));
    v15 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
    sub_100009B88((uint64_t)&v37);
    if (v15)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for CAUResource.vehicleLayout(_:), v2);
      v16 = sub_100009BB8();
      dispatch thunk of CAUAssetLibrary.asset<A>(for:)(v5, v6, v16);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

      v18 = v36;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v36) != 1)
      {
        v19 = v32;
        v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v32, v8, v18);
        v21 = v34;
        v22 = CAUVehicleLayout.widgetContentMargins.getter(v20);
        v23 = CAUWidgetContentMargins.top.getter(v22);
        v24 = *(uint64_t (**)(char *, uint64_t))(v33 + 8);
        v25 = v35;
        v26 = v24(v21, v35);
        v14 = v23;
        v27 = CAUVehicleLayout.widgetContentMargins.getter(v26);
        CAUWidgetContentMargins.leading.getter(v27);
        v28 = v24(v21, v25);
        v29 = CAUVehicleLayout.widgetContentMargins.getter(v28);
        CAUWidgetContentMargins.bottom.getter(v29);
        v30 = v24(v21, v25);
        v31 = CAUVehicleLayout.widgetContentMargins.getter(v30);
        CAUWidgetContentMargins.trailing.getter(v31);
        v24(v21, v25);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v18);
        return v14;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v8, 1, 1, v36);
    }
    sub_10000C698((uint64_t)v8, &qword_100019C88);
  }
  return v14;
}

uint64_t sub_1000058C0(void **a1)
{
  void *v1;
  Swift::String v2;
  id v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v1 = *a1;
  v10 = 0;
  v11 = 0xE000000000000000;
  _StringGuts.grow(_:)(51);
  v2._object = (void *)0x800000010000FEB0;
  v2._countAndFlagsBits = 0xD000000000000031;
  String.append(_:)(v2);
  v9 = v1;
  v3 = v1;
  v4 = sub_100003F8C(&qword_100019C80);
  v5._countAndFlagsBits = String.init<A>(describing:)(&v9, v4);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7 = v11;
  sub_100004A6C(v10, v11);
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100005968(uint64_t *a1)
{
  return sub_1000062A8(a1, 28, 0xD000000000000010, 0x800000010000FE90);
}

uint64_t sub_100005990@<X0>(uint64_t a1@<X8>)
{
  return sub_100004E78(a1);
}

uint64_t sub_1000059C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)();
  uint64_t (**v21)();
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (**v27)(uint64_t *);
  uint64_t v29;
  uint64_t v30;

  v30 = sub_100003F8C(&qword_100019D18);
  v8 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100003F8C(&qword_100019D20);
  __chkstk_darwin(v11);
  v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_100003F8C(&qword_100019D28);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v13 = static Alignment.center.getter(v15);
  v13[1] = v18;
  v19 = sub_100003F8C(&qword_100019D30);
  sub_100005BE4(a2, a3, (_QWORD *)((char *)v13 + *(int *)(v19 + 44)));
  v20 = (uint64_t (*)())swift_allocObject(&unk_100015088, 40, 7);
  *((_QWORD *)v20 + 2) = a1;
  *((_QWORD *)v20 + 3) = a2;
  *((_QWORD *)v20 + 4) = a3;
  sub_10000C654((uint64_t)v13, (uint64_t)v17, &qword_100019D20);
  v21 = (uint64_t (**)())&v17[*(int *)(v14 + 36)];
  *v21 = sub_10000A084;
  v21[1] = v20;
  v21[2] = 0;
  v21[3] = 0;
  v22 = a3;
  v23 = a2;
  sub_10000C698((uint64_t)v13, &qword_100019D20);
  v24 = v23;
  dispatch thunk of CAFCarObservable.$tire.getter();

  sub_10000C654((uint64_t)v17, a4, &qword_100019D28);
  v25 = sub_100003F8C(&qword_100019D38);
  v26 = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a4 + *(int *)(v25 + 52), v10, v30);
  v27 = (uint64_t (**)(uint64_t *))(a4 + *(int *)(v25 + 56));
  *v27 = sub_100006288;
  v27[1] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
  return sub_10000C698((uint64_t)v17, &qword_100019D28);
}

uint64_t sub_100005BE4@<X0>(void *a1@<X1>, void *a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t (**v7)();
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  void (*v23)(char *, _QWORD, uint64_t);
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (**v47)();
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD v62[3];

  v59 = sub_100003F8C(&qword_100019D40);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (uint64_t (**)())((char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v53 = type metadata accessor for CarView(0);
  ((void (*)(void))__chkstk_darwin)();
  v55 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_100003F8C(&qword_100019D48);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v54 = (uint64_t)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v56 = (uint64_t)&v53 - v11;
  v12 = type metadata accessor for CAUResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v53 - v17;
  v19 = sub_100003F8C(&qword_100019C88);
  __chkstk_darwin(v19);
  v21 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1;
  v58 = (id)CAFCarObservable.observed.getter();

  if (a2)
  {
    v57 = a3;
    v23 = *(void (**)(char *, _QWORD, uint64_t))(v13 + 104);
    v23(v18, enum case for CAUResource.vehicleLayout(_:), v12);
    v24 = sub_100009BB8();
    dispatch thunk of CAUAssetLibrary.asset<A>(for:)(v18, v19, v24);
    v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v18, v12);
    v29 = (uint64_t)v21;
    v23(v16, enum case for CAUResource.topDownExterior(_:), v12);
    v30 = a2;
    v35 = (void *)CAUAssetLibrary.asset(for:)(v16);
    v28(v16, v12);
    v36 = v53;
    v37 = v55;
    sub_10000C654((uint64_t)v21, (uint64_t)&v55[*(int *)(v53 + 28)], &qword_100019C88);
    v38 = (char *)v37 + *(int *)(v36 + 32);
    v61 = 0;
    v39 = v58;
    v40 = v35;
    v58 = v40;
    State.init(wrappedValue:)(v62, &v61, &type metadata for Bool);
    v41 = v62[1];
    *v38 = v62[0];
    *((_QWORD *)v38 + 1) = v41;
    *v37 = v39;
    v42 = type metadata accessor for CarPressureResetMonitor();
    v43 = swift_allocObject(v42, 24, 7);
    v44 = v39;
    sub_10000636C(v44);
    v37[1] = v43;
    v37[2] = v40;
    v45 = v54;
    sub_10000AC78((uint64_t)v37, v54, type metadata accessor for CarView);
    v46 = v60;
    v47 = (uint64_t (**)())(v45 + *(int *)(v60 + 36));
    *v47 = sub_1000060E0;
    v47[1] = 0;
    v47[2] = 0;
    v47[3] = 0;
    sub_10000ACBC((uint64_t)v37, type metadata accessor for CarView);
    v48 = v56;
    sub_10000C610(v45, v56, &qword_100019D48);
    sub_10000C654(v48, (uint64_t)v7, &qword_100019D48);
    swift_storeEnumTagMultiPayload(v7, v59, 0);
    v49 = sub_100003F8C(&qword_100019CA8);
    v50 = sub_10000A0A4();
    v51 = sub_100009D40(&qword_100019CE0, &qword_100019CA8, (void (*)(void))sub_100009DAC);
    _ConditionalContent<>.init(storage:)(v57, v7, v46, v49, v50, v51);

    sub_10000C698(v48, &qword_100019D48);
  }
  else
  {
    v25 = type metadata accessor for CAUVehicleLayout(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v21, 1, 1, v25);
    v26 = v59;
    v27 = v60;
    v29 = (uint64_t)v21;
    v31 = v58;
    *v7 = sub_1000060FC;
    v7[1] = 0;
    v7[2] = 0;
    v7[3] = 0;
    swift_storeEnumTagMultiPayload(v7, v26, 1);
    v32 = sub_100003F8C(&qword_100019CA8);
    v33 = sub_10000A0A4();
    v34 = sub_100009D40(&qword_100019CE0, &qword_100019CA8, (void (*)(void))sub_100009DAC);
    _ConditionalContent<>.init(storage:)(a3, v7, v27, v32, v33, v34);

  }
  return sub_10000C698(v29, &qword_100019C88);
}

uint64_t sub_1000060E0()
{
  return sub_100004A6C(0xD000000000000029, 0x800000010000FF70);
}

uint64_t sub_1000060FC()
{
  return sub_100004A6C(0xD000000000000035, 0x800000010000FFC0);
}

uint64_t sub_100006118(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Swift::String v14;

  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease(0xE000000000000000);
  v5 = a2;
  v6 = (void *)dispatch thunk of CAFCarObservable.tire.getter();

  if (v6)
    v7 = 0;
  else
    v7 = 544501614;
  if (v6)
    v8 = 0xE000000000000000;
  else
    v8 = 0xE400000000000000;
  v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease(v8);
  v10._countAndFlagsBits = 0x6C62616C69617661;
  v10._object = (void *)0xEA00000000002E65;
  String.append(_:)(v10);
  sub_100004A6C(0xD000000000000012, 0x800000010000FF30);
  swift_bridgeObjectRelease(0x800000010000FF30);
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease(0xE000000000000000);
  if (a3)
    v11 = 0;
  else
    v11 = 544501614;
  if (a3)
    v12 = 0xE000000000000000;
  else
    v12 = 0xE400000000000000;
  v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease(v12);
  v14._countAndFlagsBits = 0x6C62616C69617661;
  v14._object = (void *)0xEA00000000002E65;
  String.append(_:)(v14);
  sub_100004A6C(0xD000000000000010, 0x800000010000FF50);
  return swift_bridgeObjectRelease(0x800000010000FF50);
}

uint64_t sub_100006288(uint64_t *a1)
{
  return sub_1000062A8(a1, 30, 0xD000000000000012, 0x800000010000FF30);
}

uint64_t sub_1000062A8(uint64_t *a1, Swift::Int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  unint64_t v12;

  v6 = *a1;
  _StringGuts.grow(_:)(a2);
  swift_bridgeObjectRelease(0xE000000000000000);
  v12 = a4;
  if (v6)
    v7 = 0;
  else
    v7 = 544501614;
  if (v6)
    v8 = 0xE000000000000000;
  else
    v8 = 0xE400000000000000;
  v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease(v8);
  v10._countAndFlagsBits = 0x6C62616C69617661;
  v10._object = (void *)0xEA00000000002E65;
  String.append(_:)(v10);
  sub_100004A6C(a3, v12);
  return swift_bridgeObjectRelease(v12);
}

uint64_t sub_100006360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000059C8(*(_QWORD *)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), a1);
}

uint64_t sub_10000636C(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;

  *(_QWORD *)(v1 + 16) = a1;
  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = a1;
  v5 = objc_msgSend(v3, "defaultCenter");
  if (qword_1000198E8 != -1)
    swift_once(&qword_1000198E8, sub_10000C990);
  v6 = qword_10001AD58;
  v7 = objc_msgSend((id)objc_opt_self(NSOperationQueue), "mainQueue");
  v8 = swift_allocObject(&unk_1000150B0, 24, 7);
  swift_weakInit(v8 + 16, v1);
  v12[4] = sub_10000A14C;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100006650;
  v12[3] = &unk_1000150C8;
  v9 = _Block_copy(v12);
  swift_release(v13);
  v10 = objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, v9);

  _Block_release(v9);
  swift_unknownObjectRelease(v10);

  return v1;
}

uint64_t sub_1000064E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
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
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    v5 = Notification.userInfo.getter();
    if (v5)
    {
      v6 = v5;
      strcpy((char *)&v9, "ClusterEvent");
      BYTE13(v9) = 0;
      HIWORD(v9) = -5120;
      AnyHashable.init<A>(_:)(v11, &v9, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v6 + 16) && (v7 = sub_10000D800((uint64_t)v11), (v8 & 1) != 0))
      {
        sub_100004C08(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v9);
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
      }
      swift_bridgeObjectRelease(v6);
      sub_10000A154((uint64_t)v11);
      if (*((_QWORD *)&v10 + 1))
      {
        sub_10000A188(&v9, v12);
        sub_100004C08((uint64_t)v12, (uint64_t)v11);
        if ((swift_dynamicCast(&v9, v11, (char *)&type metadata for Any + 8, &type metadata for ClusterEventType, 6) & 1) != 0
          && v9 == 1)
        {
          sub_1000067D0();
        }
        swift_release(v4);
        return sub_100004BE8(v12);
      }
      else
      {
        swift_release(v4);
        return sub_10000C698((uint64_t)&v9, &qword_100019D60);
      }
    }
    else
    {
      return swift_release(v4);
    }
  }
  return result;
}

uint64_t sub_100006650(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000066F4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_1000198E8 != -1)
    swift_once(&qword_1000198E8, sub_10000C990);
  static String._unconditionallyBridgeFromObjectiveC(_:)(qword_10001AD58);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "removeObserver:", v4);

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for CarPressureResetMonitor()
{
  return objc_opt_self(_TtC12TirePressure23CarPressureResetMonitor);
}

void sub_1000067D0()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[6];

  v1 = objc_msgSend(*(id *)(v0 + 16), "tire");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "tirePressureMonitoringSystem");

    if (v3)
    {
      if (objc_msgSend(v3, "hasReset"))
      {
        sub_100004A6C(0xD000000000000016, 0x800000010000FDF0);
        v5[4] = sub_100006900;
        v5[5] = 0;
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 1107296256;
        v5[2] = sub_1000069EC;
        v5[3] = &unk_100014F28;
        v4 = _Block_copy(v5);
        objc_msgSend(v3, "resetWithCompletion:", v4);
        _Block_release(v4);

        return;
      }

    }
  }
  sub_100004A60(0xD000000000000027, 0x800000010000FDC0);
}

uint64_t sub_100006900(uint64_t a1)
{
  Swift::String v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a1)
    return sub_100004A6C(0xD000000000000020, 0x800000010000FE30);
  v7 = 0;
  v8 = 0xE000000000000000;
  swift_errorRetain();
  _StringGuts.grow(_:)(44);
  v2._countAndFlagsBits = 0xD00000000000002ALL;
  v2._object = (void *)0x800000010000FE60;
  String.append(_:)(v2);
  v6 = a1;
  v3 = sub_100003F8C(&qword_100019C58);
  _print_unlocked<A, B>(_:_:)(&v6, &v7, v3, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v4 = v8;
  sub_100004A60(v7, v8);
  swift_bridgeObjectRelease(v4);
  return swift_errorRelease(a1);
}

void sub_1000069EC(uint64_t a1, void *a2)
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

uint64_t sub_100006A40@<X0>(id *a1@<X1>, _QWORD *a2@<X8>)
{
  double v4;
  double v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;

  v4 = GeometryProxy.size.getter();
  v6 = sub_100006AD0(v4, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  *a2 = static Alignment.center.getter(v6);
  a2[1] = v15;
  v16 = sub_100003F8C(&qword_100019E68);
  return sub_100006C04(a1, (uint64_t)a2 + *(int *)(v16 + 44), v8, v10, v12, v14);
}

id sub_100006AD0(double a1, double a2)
{
  void *v2;
  id result;
  double v4;
  double v5;

  if (a1 != 0.0 && a2 != 0.0)
  {
    result = objc_msgSend(v2, "size");
    if (v4 != 0.0)
    {
      result = objc_msgSend(v2, "size");
      if (v5 != 0.0)
      {
        objc_msgSend(v2, "size");
        objc_msgSend(v2, "size");
        objc_msgSend(v2, "size");
        objc_msgSend(v2, "size");
        return objc_msgSend(v2, "size");
      }
    }
  }
  return result;
}

uint64_t sub_100006C04@<X0>(id *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  CGFloat Width;
  CGFloat Height;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (**v73)();
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  double *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned __int8 v107;
  uint64_t v108;
  unsigned __int8 v109;
  uint64_t v110;
  uint64_t v111;
  CGRect v112;
  CGRect v113;

  v91 = type metadata accessor for RedactedTiresView(0);
  __chkstk_darwin(v91);
  v89 = (double *)((char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v104 = sub_100003F8C(&qword_100019E70);
  v13 = __chkstk_darwin(v104);
  v92 = (uint64_t)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v93 = (uint64_t)&v83 - v15;
  v100 = sub_100003F8C(&qword_100019E78);
  __chkstk_darwin(v100);
  v102 = (uint64_t)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for CarView(0);
  v84 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v85 = v17;
  v86 = (uint64_t)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100003F8C(&qword_100019E80);
  v88 = *(_QWORD *)(v101 - 8);
  __chkstk_darwin(v101);
  v87 = (char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100003F8C(&qword_100019E88);
  v20 = __chkstk_darwin(v19);
  v99 = (uint64_t)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v103 = (uint64_t *)((char *)&v83 - v22);
  v23 = type metadata accessor for Image.Interpolation(0);
  v24 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v26 = (char *)&v83 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for Image.ResizingMode(0);
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v30 = (char *)&v83 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = Image.init(uiImage:)(a1[2]);
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v30, enum case for Image.ResizingMode.stretch(_:), v27);
  v32 = Image.resizable(capInsets:resizingMode:)(v30, v31, 0.0, 0.0, 0.0, 0.0);
  swift_release(v31);
  v33 = *(void (**)(char *, uint64_t))(v28 + 8);
  v34 = (uint64_t)a1;
  v33(v30, v27);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v26, enum case for Image.Interpolation.high(_:), v23);
  v35 = Image.interpolation(_:)(v26, v32);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  v112.origin.x = a3;
  v112.origin.y = a4;
  v112.size.width = a5;
  v112.size.height = a6;
  Width = CGRectGetWidth(v112);
  v113.origin.x = a3;
  v113.origin.y = a4;
  v113.size.width = a5;
  v113.size.height = a6;
  Height = CGRectGetHeight(v113);
  v39 = static Alignment.center.getter(v38);
  _FrameLayout.init(width:height:alignment:)(&v106, *(_QWORD *)&Width, 0, *(_QWORD *)&Height, 0, v39, v40);
  v41 = v106;
  v98 = v107;
  v97 = v108;
  v96 = v109;
  v95 = v110;
  v94 = v111;
  v42 = objc_msgSend(*a1, "tire");
  if (!v42)
    goto LABEL_7;
  v43 = v42;
  v83 = v35;
  v44 = objc_msgSend(v42, "tirePressures");
  v45 = sub_100003FCC(0, &qword_100019EC8, CAFTirePressure_ptr);
  v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v44, v45);

  if ((unint64_t)v46 >> 62)
  {
    if (v46 < 0)
      v82 = v46;
    else
      v82 = v46 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v46);
    v47 = _CocoaArrayWrapper.endIndex.getter(v82);
    swift_bridgeObjectRelease(v46);
  }
  else
  {
    v47 = *(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v46);
  if (!v47)
  {

    v35 = v83;
LABEL_7:
    v69 = (uint64_t)a1 + *(int *)(v90 + 28);
    v70 = v89;
    sub_10000C654(v69, (uint64_t)v89 + *(int *)(v91 + 20), &qword_100019C88);
    *v70 = a3;
    v70[1] = a4;
    v70[2] = a5;
    v70[3] = a6;
    v71 = v92;
    sub_10000AC78((uint64_t)v70, v92, type metadata accessor for RedactedTiresView);
    v72 = v104;
    v73 = (uint64_t (**)())(v71 + *(int *)(v104 + 36));
    *v73 = sub_100007A5C;
    v73[1] = 0;
    v73[2] = 0;
    v73[3] = 0;
    sub_10000ACBC((uint64_t)v70, type metadata accessor for RedactedTiresView);
    v74 = v93;
    sub_10000C610(v71, v93, &qword_100019E70);
    v75 = v102;
    sub_10000C654(v74, v102, &qword_100019E70);
    swift_storeEnumTagMultiPayload(v75, v100, 1);
    v76 = sub_10000C708(&qword_100019E90, &qword_100019E80, (void (*)(void))sub_10000ACF8, (uint64_t)&protocol conformance descriptor for <> ForEach<A, B, C>);
    v77 = sub_10000ADC4();
    v68 = v103;
    _ConditionalContent<>.init(storage:)(v103, v75, v101, v72, v76, v77);
    sub_10000C698(v74, &qword_100019E70);
    goto LABEL_8;
  }
  v48 = objc_msgSend(v43, "tirePressures");
  v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v48, v45);

  v105 = v49;
  v50 = v86;
  sub_10000AC78(v34, v86, type metadata accessor for CarView);
  v51 = *(unsigned __int8 *)(v84 + 80);
  v52 = (v51 + 48) & ~v51;
  v53 = (double *)swift_allocObject(&unk_100015128, v52 + v85, v51 | 7);
  v53[2] = a3;
  v53[3] = a4;
  v53[4] = a5;
  v53[5] = a6;
  sub_10000ABD4(v50, (uint64_t)v53 + v52);
  v54 = sub_100003F8C(&qword_100019ED0);
  v55 = type metadata accessor for UUID(0);
  v56 = sub_100003F8C(&qword_100019EA0);
  v57 = sub_10000C860(&qword_100019ED8, &qword_100019ED0, (uint64_t)&protocol conformance descriptor for [A]);
  v58 = v41;
  v59 = sub_10000ACF8();
  v60 = sub_100009DF0(&qword_100019EE0, &qword_100019EC8, CAFTirePressure_ptr, (uint64_t)&protocol conformance descriptor for CAFService);
  v61 = v87;
  v62 = v59;
  v41 = v58;
  ForEach<>.init(_:content:)(&v105, sub_10000AF20, v53, v54, v55, v56, v57, v62, v60);
  v63 = v88;
  v65 = v101;
  v64 = v102;
  (*(void (**)(uint64_t, char *, uint64_t))(v88 + 16))(v102, v61, v101);
  swift_storeEnumTagMultiPayload(v64, v100, 0);
  v66 = sub_10000C708(&qword_100019E90, &qword_100019E80, (void (*)(void))sub_10000ACF8, (uint64_t)&protocol conformance descriptor for <> ForEach<A, B, C>);
  v67 = sub_10000ADC4();
  v68 = v103;
  _ConditionalContent<>.init(storage:)(v103, v64, v65, v104, v66, v67);

  (*(void (**)(char *, uint64_t))(v63 + 8))(v61, v65);
  v35 = v83;
LABEL_8:
  v78 = v99;
  sub_10000C654((uint64_t)v68, v99, &qword_100019E88);
  *(_QWORD *)a2 = v35;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v41;
  *(_BYTE *)(a2 + 32) = v98;
  *(_QWORD *)(a2 + 40) = v97;
  *(_BYTE *)(a2 + 48) = v96;
  v79 = v94;
  *(_QWORD *)(a2 + 56) = v95;
  *(_QWORD *)(a2 + 64) = v79;
  v80 = sub_100003F8C(&qword_100019EC0);
  sub_10000C654(v78, a2 + *(int *)(v80 + 48), &qword_100019E88);
  swift_retain(v35);
  sub_10000C698((uint64_t)v68, &qword_100019E88);
  sub_10000C698(v78, &qword_100019E88);
  return swift_release(v35);
}

uint64_t sub_100007458@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)();
  id v31;
  uint64_t v33;
  uint64_t v34;

  v33 = a2;
  v34 = a3;
  v12 = type metadata accessor for CarView(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  __chkstk_darwin(v12);
  v15 = sub_100003F8C(&qword_100019C88);
  __chkstk_darwin(v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for TireView(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a1;
  v22 = sub_100003FCC(0, &qword_100019EC8, CAFTirePressure_ptr);
  v23 = sub_100009DF0(&qword_100019EE8, &qword_100019EC8, CAFTirePressure_ptr, (uint64_t)&protocol conformance descriptor for CAFTirePressure);
  v24 = (void *)CAFObserved<>.observable.getter(v22, v23);
  v25 = v33;
  sub_10000C654(v33 + *(int *)(v12 + 28), (uint64_t)v17, &qword_100019C88);
  sub_10000768C(v24, (uint64_t)v17, (uint64_t)v20, a4, a5, a6, a7);
  sub_10000AC78(v25, (uint64_t)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CarView);
  v26 = *(unsigned __int8 *)(v13 + 80);
  v27 = (v26 + 24) & ~v26;
  v28 = swift_allocObject(&unk_100015150, v27 + v14, v26 | 7);
  *(_QWORD *)(v28 + 16) = v21;
  sub_10000ABD4((uint64_t)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
  v29 = v34;
  sub_10000AC78((uint64_t)v20, v34, type metadata accessor for TireView);
  v30 = (void (**)())(v29 + *(int *)(sub_100003F8C(&qword_100019EA0) + 36));
  *v30 = sub_10000B054;
  v30[1] = (void (*)())v28;
  v30[2] = 0;
  v30[3] = 0;
  v31 = v21;
  return sub_10000ACBC((uint64_t)v20, type metadata accessor for TireView);
}

uint64_t sub_10000768C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  Swift::String v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  Swift::String v29;

  v14 = type metadata accessor for CAFDimensionObservable(0);
  v15 = sub_100003F4C(&qword_100019D08, (uint64_t (*)(uint64_t))&type metadata accessor for CAFDimensionObservable, (uint64_t)&protocol conformance descriptor for CAFDimensionObservable);
  *(_QWORD *)(a3 + 16) = EnvironmentObject.init()(v14, v15);
  *(_QWORD *)(a3 + 24) = v16;
  v17 = type metadata accessor for CAFTirePressureObservable(0);
  v18 = sub_100003F4C(&qword_100019EF8, (uint64_t (*)(uint64_t))&type metadata accessor for CAFTirePressureObservable, (uint64_t)&protocol conformance descriptor for CAFTirePressureObservable);
  v19 = a1;
  *(_QWORD *)a3 = ObservedObject.init(wrappedValue:)(v19, v17, v18);
  *(_QWORD *)(a3 + 8) = v20;
  *(double *)(a3 + 32) = a4;
  *(double *)(a3 + 40) = a5;
  *(double *)(a3 + 48) = a6;
  *(double *)(a3 + 56) = a7;
  v21 = type metadata accessor for TireView(0);
  sub_10000C654(a2, a3 + *(int *)(v21 + 28), &qword_100019C88);
  v22 = 0xE000000000000000;
  _StringGuts.grow(_:)(52);
  v23._object = (void *)0x8000000100010050;
  v23._countAndFlagsBits = 0xD000000000000028;
  String.append(_:)(v23);
  v24 = type metadata accessor for CAUVehicleLayout(0);
  v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(a2, 1, v24);
  v26 = v25 == 1;
  if (v25 == 1)
    v27 = 544501614;
  else
    v27 = 0;
  if (v26)
    v22 = 0xE400000000000000;
  v28 = v22;
  String.append(_:)(*(Swift::String *)&v27);
  swift_bridgeObjectRelease(v22);
  v29._countAndFlagsBits = 0x6C62616C69617661;
  v29._object = (void *)0xEA00000000002E65;
  String.append(_:)(v29);
  sub_100004A6C(0, 0xE000000000000000);
  swift_bridgeObjectRelease(0xE000000000000000);

  return sub_10000C698(a2, &qword_100019C88);
}

void sub_10000785C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  Swift::String v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v0 = type metadata accessor for CAUVehicleLayoutKey(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  v4._object = (void *)0x8000000100010030;
  v4._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v4);
  v5 = sub_100003FCC(0, &qword_100019EC8, CAFTirePressure_ptr);
  CAFPositionedRequired.layoutKey.getter(v5);
  _print_unlocked<A, B>(_:_:)(v3, &v7, v0, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6 = v8;
  sub_100004C84(v7, v8, 2036625250, 0xE400000000000000, 171);
  swift_bridgeObjectRelease(v6);
  sub_100007984();
}

void sub_100007984()
{
  id *v0;
  id *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v1 = v0;
  type metadata accessor for CarView(0);
  v2 = sub_100003F8C(&qword_100019EF0);
  State.wrappedValue.getter(&v6);
  if ((v6 & 1) == 0)
  {
    v3 = *v0;
    v4 = objc_msgSend(*v1, "tire");
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v4, "receivedAllValues"))
      {
        CAFSignpostEmit_Finalized(v3);
        LOBYTE(v6) = 1;
        State.wrappedValue.setter(&v6, v2);
      }

    }
  }
}

uint64_t sub_100007A5C()
{
  return sub_100004A6C(0xD000000000000030, 0x8000000100010080);
}

uint64_t sub_100007A78@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  __chkstk_darwin(a1);
  sub_10000AC78(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CarView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_100015100, v7 + v5, v6 | 7);
  result = sub_10000ABD4((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_10000AC18;
  a2[1] = v8;
  return result;
}

uint64_t sub_100007B24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  unsigned int v10;
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
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[7];
  char v41;
  _BYTE v42[7];
  char v43;
  _BYTE v44[7];
  char v45;
  _BYTE v46[7];
  char v47;
  __int128 v48;
  char v49;
  _BYTE v50[7];
  uint64_t v51;
  uint64_t v52;
  char v53;
  _BYTE v54[7];
  uint64_t v55;
  uint64_t v56;
  char v57;
  _BYTE v58[7];
  __int128 v59;
  uint64_t v60;
  char v61;
  _BYTE v62[7];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  char v67;
  __int128 v68;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v2 = v1;
  v4 = type metadata accessor for CAUVehicleLayoutKey(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(id *)(v1 + 8);
  v9 = (void *)CAFTirePressureObservable.observed.getter();

  v10 = objc_msgSend(v9, "receivedAllValues");
  if (v10)
  {
    v38 = static HorizontalAlignment.center.getter();
    v11 = sub_100007DE8();
    v13 = v12;
    v36 = v5;
    v15 = v14;
    v39 = a1;
    v17 = v16;
    v18 = sub_1000081C0();
    v35 = v4;
    v20 = v19;
    v37 = static HorizontalAlignment.center.getter();
    sub_1000083D0(v11, v13, v18, v15, v17, v20, (uint64_t)v66);
    swift_release(v20);
    swift_bridgeObjectRelease(v17);
    swift_release(v18);
    swift_bridgeObjectRelease(v13);
    v21 = v66[1];
    LOBYTE(v20) = v67;
    v33 = v68;
    v31 = v66[0];
    v32 = v69;
    LOBYTE(v13) = v70;
    v34 = v71;
    v22 = v8;
    v23 = (void *)CAFTirePressureObservable.observed.getter();

    v24 = sub_100003FCC(0, &qword_100019EC8, CAFTirePressure_ptr);
    CAFPositionedRequired.layoutKey.getter(v24);

    a1 = v39;
    v25 = type metadata accessor for TireView(0);
    sub_10000BE50((uint64_t)v7, v2 + *(int *)(v25 + 28));
    v27 = v26;
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v35);
    v47 = 1;
    v45 = 1;
    v43 = v20;
    v41 = v13;
    v48 = (unint64_t)v38;
    v49 = 1;
    *(_DWORD *)v50 = *(_DWORD *)v46;
    *(_DWORD *)&v50[3] = *(_DWORD *)&v46[3];
    v51 = v37;
    v52 = 0;
    v53 = 1;
    *(_DWORD *)v54 = *(_DWORD *)v44;
    *(_DWORD *)&v54[3] = *(_DWORD *)&v44[3];
    v55 = v31;
    v56 = v21;
    v57 = v20;
    *(_DWORD *)v58 = *(_DWORD *)v42;
    *(_DWORD *)&v58[3] = *(_DWORD *)&v42[3];
    v59 = v33;
    v60 = v32;
    v61 = v13;
    *(_DWORD *)v62 = *(_DWORD *)v40;
    *(_DWORD *)&v62[3] = *(_DWORD *)&v40[3];
    v63 = v34;
    v64 = v27;
    v65 = v29;
    nullsub_1(&v48);
  }
  else
  {
    sub_10000BE38(&v48);
  }
  sub_10000C610((uint64_t)&v48, (uint64_t)v66, &qword_10001A038);
  return sub_10000C610((uint64_t)v66, a1, &qword_10001A038);
}

uint64_t sub_100007DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  unsigned __int8 v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t result;
  id v22;
  void *v23;
  id v24;
  void (*v25)(char *, uint64_t);
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = v0;
  v2 = sub_100003F8C(&qword_10001A058);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v38 - v7;
  v9 = *(id *)(v0 + 8);
  v10 = (void *)CAFTirePressureObservable.observed.getter();

  v11 = objc_msgSend(v10, "receivedAllValues");
  if (!v11
    || ((v12 = v9,
         v13 = dispatch thunk of CAFTirePressureObservable.sensorState.getter(),
         v12,
         v13 - 2 >= 3)
      ? (v14 = v13 == 0)
      : (v14 = 1),
        v14))
  {
LABEL_7:
    if (qword_1000198C0 != -1)
      swift_once(&qword_1000198C0, sub_1000086D0);
    v15 = qword_10001AD30;
    v16 = *(void **)(v1 + 16);
    if (v16)
    {
      v17 = qword_10001AD28;
      swift_bridgeObjectRetain(qword_10001AD30);
      v18 = v16;
      v19 = (void *)dispatch thunk of CAFDimensionObservable.tirePressureUnit.getter();

      v20 = objc_msgSend(v19, "symbol");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v20);

      return v17;
    }
    v32 = *(_QWORD *)(v1 + 24);
    v33 = type metadata accessor for CAFDimensionObservable(0);
    v34 = sub_100003F4C(&qword_100019D08, (uint64_t (*)(uint64_t))&type metadata accessor for CAFDimensionObservable, (uint64_t)&protocol conformance descriptor for CAFDimensionObservable);
    swift_bridgeObjectRetain(v15);
    EnvironmentObject.error()(0, v32, v33, v34);
    __break(1u);
    goto LABEL_18;
  }
  if (v13 != 1)
  {
LABEL_18:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x80000001000100F0, "TirePressure/TirePressureView.swift", 35, 2, 253, 0);
    __break(1u);
    goto LABEL_19;
  }
  v22 = v12;
  dispatch thunk of CAFTirePressureObservable.pressure.getter();

  v23 = *(void **)(v1 + 16);
  if (v23)
  {
    v24 = v23;
    Measurement<>.toTirePressureUnit(using:)();

    v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v6, v2);
    v26 = objc_msgSend(objc_allocWithZone((Class)NSNumberFormatter), "init");
    objc_msgSend(v26, "setRoundingMode:", 6);
    v27 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", Measurement.value.getter(v2));
    v28 = objc_msgSend(v26, "stringFromNumber:", v27);

    if (v28)
    {
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);

      v29 = v24;
      v30 = (void *)dispatch thunk of CAFDimensionObservable.tirePressureUnit.getter();

      v31 = objc_msgSend(v30, "symbol");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v31);

      v25(v8, v2);
      return v17;
    }

    v25(v8, v2);
    goto LABEL_7;
  }
LABEL_19:
  v35 = *(_QWORD *)(v1 + 24);
  v36 = type metadata accessor for CAFDimensionObservable(0);
  v37 = sub_100003F4C(&qword_100019D08, (uint64_t (*)(uint64_t))&type metadata accessor for CAFDimensionObservable, (uint64_t)&protocol conformance descriptor for CAFDimensionObservable);
  result = EnvironmentObject.error()(0, v35, v36, v37);
  __break(1u);
  return result;
}

uint64_t sub_1000081C0()
{
  uint64_t v0;
  id v1;
  void *v2;
  unsigned int v3;
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  id v10;
  unsigned __int8 v11;

  v1 = *(id *)(v0 + 8);
  v2 = (void *)CAFTirePressureObservable.observed.getter();

  v3 = objc_msgSend(v2, "receivedAllValues");
  if (!v3
    || ((v4 = v1,
         v5 = dispatch thunk of CAFTirePressureObservable.sensorState.getter(),
         v4,
         v5 - 2 >= 3)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        v6))
  {
    if (qword_1000198C8 != -1)
      swift_once(&qword_1000198C8, sub_1000086E8);
    v7 = qword_10001AD38;
    v8 = qword_1000198D0;
    swift_retain(qword_10001AD38);
    if (v8 != -1)
      swift_once(&qword_1000198D0, sub_100008724);
    swift_retain(qword_10001AD40);
    return v7;
  }
  if (v5 == 1)
  {
    v10 = v4;
    v11 = dispatch thunk of CAFTirePressureObservable.pressureState.getter();

    if (v11 <= 5u)
    {
      if (((1 << v11) & 5) != 0)
      {
        v7 = static Color.primary.getter();
        static Color.secondary.getter();
      }
      else if (((1 << v11) & 0xA) != 0)
      {
        v7 = static Color.orange.getter();
        static Color.orange.getter();
      }
      else
      {
        v7 = static Color.red.getter();
        static Color.red.getter();
      }
      return v7;
    }
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001CLL, 0x8000000100010110, "TirePressure/TirePressureView.swift", 35, 2, 280, 0);
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x80000001000100F0, "TirePressure/TirePressureView.swift", 35, 2, 253, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000083D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
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
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v66;
  uint64_t v67;

  v66 = a1;
  v67 = a2;
  v8 = sub_10000C5AC();
  swift_bridgeObjectRetain(a2);
  v9 = Text.init<A>(_:)(&v66, &type metadata for String, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (qword_1000198E0 != -1)
    swift_once(&qword_1000198E0, sub_10000C8C4);
  v16 = qword_10001AD50;
  v17 = swift_retain(qword_10001AD50);
  v18 = v13 & 1;
  v19 = Text.font(_:)(v17, v9, v11, v18, v15);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  swift_release(v16);
  v26 = v23 & 1;
  sub_10000C5F0(v9, v11, v18);
  swift_bridgeObjectRelease(v15);
  v27 = Text.foregroundColor(_:)(a3, v19, v21, v26, v25);
  v60 = v28;
  v61 = v27;
  v30 = v29;
  v63 = v31;
  sub_10000C5F0(v19, v21, v26);
  swift_bridgeObjectRelease(v25);
  v66 = a4;
  v67 = a5;
  swift_bridgeObjectRetain(a5);
  v32 = Text.init<A>(_:)(&v66, &type metadata for String, v8);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  if (qword_1000198D8 != -1)
    swift_once(&qword_1000198D8, sub_10000C8B0);
  v39 = v36 & 1;
  v40 = v30 & 1;
  v41 = qword_10001AD48;
  v42 = swift_retain(qword_10001AD48);
  v43 = Text.font(_:)(v42, v32, v34, v39, v38);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  swift_release(v41);
  v50 = v47 & 1;
  sub_10000C5F0(v32, v34, v39);
  swift_bridgeObjectRelease(v38);
  v51 = Text.foregroundColor(_:)(a6, v43, v45, v50, v49);
  v53 = v52;
  v55 = v54;
  LOBYTE(v41) = v56 & 1;
  sub_10000C5F0(v43, v45, v50);
  swift_bridgeObjectRelease(v49);
  LOBYTE(v66) = v40;
  *(_QWORD *)a7 = v61;
  *(_QWORD *)(a7 + 8) = v60;
  *(_BYTE *)(a7 + 16) = v40;
  *(_QWORD *)(a7 + 24) = v63;
  *(_QWORD *)(a7 + 32) = v51;
  *(_QWORD *)(a7 + 40) = v53;
  *(_BYTE *)(a7 + 48) = v41;
  *(_QWORD *)(a7 + 56) = v55;
  sub_10000C600(v61, v60, v40);
  swift_bridgeObjectRetain(v63);
  sub_10000C600(v51, v53, v41);
  swift_bridgeObjectRetain(v55);
  sub_10000C5F0(v51, v53, v41);
  swift_bridgeObjectRelease(v55);
  sub_10000C5F0(v61, v60, v66);
  return swift_bridgeObjectRelease(v63);
}

uint64_t sub_100008698()
{
  return static View._viewListCount(inputs:)();
}

void sub_1000086B4()
{
  qword_10001AD18 = 0x2020202020;
  unk_10001AD20 = 0xE500000000000000;
}

void sub_1000086D0()
{
  qword_10001AD28 = 11565;
  qword_10001AD30 = 0xE200000000000000;
}

uint64_t sub_1000086E8()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(UIColor), "quaternaryLabelColor");
  result = Color.init(_:)(v0);
  qword_10001AD38 = result;
  return result;
}

uint64_t sub_100008724()
{
  uint64_t result;

  result = static Color.secondary.getter();
  qword_10001AD40 = result;
  return result;
}

uint64_t sub_100008740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
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
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[3];
  _OWORD v46[6];

  v44 = a1;
  v41 = sub_100003F8C(&qword_100019D80);
  v40 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v39 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100003F8C(&qword_100019D88);
  __chkstk_darwin(v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Image.Interpolation(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Image.ResizingMode(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_100003F8C(&qword_100019D90);
  __chkstk_darwin(v37);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100003F8C(&qword_100019D98);
  v42 = *(_QWORD *)(v15 - 8);
  v43 = v15;
  __chkstk_darwin(v15);
  v38 = (uint64_t)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v17);

  if (!v18)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v44, 1, 1, v43);
  v36 = v18;
  v19 = Image.init(uiImage:)(v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v9);
  v20 = Image.resizable(capInsets:resizingMode:)(v12, v19, 0.0, 0.0, 0.0, 0.0);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for Image.Interpolation.high(_:), v5);
  v21 = Image.interpolation(_:)(v8, v20);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v46[0] = xmmword_10000F460;
  v46[1] = xmmword_10000F470;
  v46[2] = xmmword_10000F480;
  v46[3] = xmmword_10000F490;
  v46[4] = xmmword_10000F4A0;
  v22 = v39;
  View._colorMatrix(_:)(v46, &type metadata for _BackdropEffectPlaceholder, &protocol witness table for _BackdropEffectPlaceholder);
  v23 = v40;
  v24 = v41;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v4, v22, v41);
  v25 = &v4[*(int *)(sub_100003F8C(&qword_100019DA0) + 36)];
  *(_QWORD *)v25 = 0x403E000000000000;
  v25[8] = 0;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
  sub_10000C654((uint64_t)v4, (uint64_t)&v14[*(int *)(v37 + 36)], &qword_100019D88);
  *(_QWORD *)v14 = v21;
  *((_QWORD *)v14 + 1) = 0;
  *((_WORD *)v14 + 8) = 1;
  v26 = sub_10000C698((uint64_t)v4, &qword_100019D88);
  v27 = static Alignment.center.getter(v26);
  _FrameLayout.init(width:height:alignment:)(v45, 0x7FF0000000000000, 0, 0x7FF0000000000000, 0, v27, v28);
  v29 = v38;
  sub_10000C654((uint64_t)v14, v38, &qword_100019D90);

  v30 = v43;
  v31 = (_OWORD *)(v29 + *(int *)(v43 + 36));
  v32 = v45[1];
  *v31 = v45[0];
  v31[1] = v32;
  v31[2] = v45[2];
  sub_10000C698((uint64_t)v14, &qword_100019D90);
  v33 = v44;
  sub_10000C610(v29, v44, &qword_100019D98);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56))(v33, 0, 1, v30);
}

__n128 sub_100008BC4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
    v33 = static os_log_type_t.fault.getter();
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
  sub_10000C654(v16, a9, &qword_100019D68);
  v35 = a9 + *(int *)(sub_100003F8C(&qword_100019D78) + 36);
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

uint64_t sub_100008D80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = sub_100003F8C(&qword_100019D68);
  v3 = __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v5 = static Alignment.center.getter(v3);
  v5[1] = v6;
  v7 = sub_100003F8C(&qword_100019D70);
  v8 = sub_100008740((uint64_t)v5 + *(int *)(v7 + 44));
  v9 = static Alignment.center.getter(v8);
  sub_100008BC4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v9, v10);
  return sub_10000C698((uint64_t)v5, &qword_100019D68);
}

uint64_t sub_100008E64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, _QWORD, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int *v70;
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
  void (*v83)(char *, _QWORD, uint64_t);
  char *v84;
  uint64_t v85;

  v81 = a2;
  v3 = type metadata accessor for CAUVehicleLayoutKey(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100003F8C(&qword_10001A068);
  __chkstk_darwin(v7);
  v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100003F8C(&qword_10001A070);
  v82 = v10;
  v11 = __chkstk_darwin(v10);
  v80 = (uint64_t)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v79 = (uint64_t)&v72 - v14;
  v15 = __chkstk_darwin(v13);
  v78 = (uint64_t)&v72 - v16;
  v17 = __chkstk_darwin(v15);
  v77 = (uint64_t)&v72 - v18;
  v19 = __chkstk_darwin(v17);
  v76 = (uint64_t)&v72 - v20;
  v21 = __chkstk_darwin(v19);
  v85 = (uint64_t)&v72 - v22;
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v72 - v24;
  v26 = __chkstk_darwin(v23);
  v28 = (char *)&v72 - v27;
  v75 = (uint64_t)&v72 - v27;
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v26);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v74 = sub_100003F8C(&qword_10001A078);
  sub_100009440((uint64_t *)&v9[*(int *)(v74 + 44)]);
  v83 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v83(v6, enum case for CAUVehicleLayoutKey.tire_front_left(_:), v3);
  v73 = a1 + *(int *)(type metadata accessor for RedactedTiresView(0) + 20);
  sub_10000BE50((uint64_t)v6, v73);
  v30 = v29;
  v32 = v31;
  v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v6, v3);
  sub_10000C654((uint64_t)v9, (uint64_t)v25, &qword_10001A068);
  v34 = &v25[*(int *)(v10 + 36)];
  v84 = v25;
  *(_QWORD *)v34 = v30;
  *((_QWORD *)v34 + 1) = v32;
  sub_10000C698((uint64_t)v9, &qword_10001A068);
  v35 = sub_10000C610((uint64_t)v25, (uint64_t)v28, &qword_10001A070);
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v35);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v36 = v74;
  sub_100009440((uint64_t *)&v9[*(int *)(v74 + 44)]);
  v72 = v3;
  v37 = v83;
  v83(v6, enum case for CAUVehicleLayoutKey.tire_front_right(_:), v3);
  v38 = v73;
  sub_10000BE50((uint64_t)v6, v73);
  v40 = v39;
  v42 = v41;
  v43 = v3;
  v44 = v33;
  v33(v6, v43);
  v45 = v85;
  sub_10000C654((uint64_t)v9, v85, &qword_10001A068);
  v46 = v82;
  v47 = (_QWORD *)(v45 + *(int *)(v82 + 36));
  *v47 = v40;
  v47[1] = v42;
  sub_10000C698((uint64_t)v9, &qword_10001A068);
  v48 = sub_10000C610(v45, (uint64_t)v84, &qword_10001A070);
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v48);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  sub_100009440((uint64_t *)&v9[*(int *)(v36 + 44)]);
  v49 = v72;
  v37(v6, enum case for CAUVehicleLayoutKey.tire_rear_left(_:), v72);
  sub_10000BE50((uint64_t)v6, v38);
  v51 = v50;
  v53 = v52;
  v44(v6, v49);
  v54 = v76;
  sub_10000C654((uint64_t)v9, v76, &qword_10001A068);
  v55 = (_QWORD *)(v54 + *(int *)(v46 + 36));
  *v55 = v51;
  v55[1] = v53;
  sub_10000C698((uint64_t)v9, &qword_10001A068);
  v56 = v85;
  v57 = sub_10000C610(v54, v85, &qword_10001A070);
  *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v57);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  sub_100009440((uint64_t *)&v9[*(int *)(v36 + 44)]);
  v83(v6, enum case for CAUVehicleLayoutKey.tire_rear_right(_:), v49);
  sub_10000BE50((uint64_t)v6, v38);
  v59 = v58;
  v61 = v60;
  v44(v6, v49);
  v62 = v77;
  sub_10000C654((uint64_t)v9, v77, &qword_10001A068);
  v63 = (_QWORD *)(v62 + *(int *)(v82 + 36));
  *v63 = v59;
  v63[1] = v61;
  sub_10000C698((uint64_t)v9, &qword_10001A068);
  sub_10000C610(v62, v54, &qword_10001A070);
  v64 = v75;
  sub_10000C654(v75, v62, &qword_10001A070);
  v65 = (uint64_t)v84;
  v66 = v78;
  sub_10000C654((uint64_t)v84, v78, &qword_10001A070);
  v67 = v79;
  sub_10000C654(v56, v79, &qword_10001A070);
  v68 = v80;
  sub_10000C654(v54, v80, &qword_10001A070);
  v69 = v81;
  sub_10000C654(v62, v81, &qword_10001A070);
  v70 = (int *)sub_100003F8C(&qword_10001A080);
  sub_10000C654(v66, v69 + v70[12], &qword_10001A070);
  sub_10000C654(v67, v69 + v70[16], &qword_10001A070);
  sub_10000C654(v68, v69 + v70[20], &qword_10001A070);
  sub_10000C698(v54, &qword_10001A070);
  sub_10000C698(v85, &qword_10001A070);
  sub_10000C698(v65, &qword_10001A070);
  sub_10000C698(v64, &qword_10001A070);
  sub_10000C698(v68, &qword_10001A070);
  sub_10000C698(v67, &qword_10001A070);
  sub_10000C698(v66, &qword_10001A070);
  return sub_10000C698(v62, &qword_10001A070);
}

uint64_t sub_100009440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  _BYTE *v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  void (*v61)(_BYTE *, _BYTE *, uint64_t);
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(_BYTE *, uint64_t);
  _BYTE v68[4];
  int v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;

  v78 = a1;
  v1 = type metadata accessor for RedactionReasons(0);
  v73 = *(_QWORD *)(v1 - 8);
  v74 = v1;
  __chkstk_darwin(v1);
  v72 = &v68[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v79 = sub_100003F8C(&qword_10001A088);
  v76 = *(_QWORD *)(v79 - 8);
  v3 = __chkstk_darwin(v79);
  v77 = &v68[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  v75 = &v68[-v5];
  if (qword_1000198C0 != -1)
    swift_once(&qword_1000198C0, sub_1000086D0);
  v6 = qword_10001AD30;
  v80 = qword_10001AD28;
  v81 = qword_10001AD30;
  v7 = sub_10000C5AC();
  swift_bridgeObjectRetain(v6);
  v8 = Text.init<A>(_:)(&v80, &type metadata for String, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (qword_1000198E0 != -1)
    swift_once(&qword_1000198E0, sub_10000C8C4);
  v15 = qword_10001AD50;
  v16 = swift_retain(qword_10001AD50);
  v17 = v12 & 1;
  v18 = Text.font(_:)(v16, v8, v10, v12 & 1, v14);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  swift_release(v15);
  sub_10000C5F0(v8, v10, v17);
  swift_bridgeObjectRelease(v14);
  if (qword_1000198C8 != -1)
    swift_once(&qword_1000198C8, sub_1000086E8);
  v70 = Text.foregroundColor(_:)(qword_10001AD38, v18, v20, v22 & 1, v24);
  v71 = v25;
  v27 = v26;
  v69 = v28;
  sub_10000C5F0(v18, v20, v22 & 1);
  swift_bridgeObjectRelease(v24);
  if (qword_1000198B8 != -1)
    swift_once(&qword_1000198B8, sub_1000086B4);
  v80 = qword_10001AD18;
  v81 = unk_10001AD20;
  swift_bridgeObjectRetain(unk_10001AD20);
  v29 = Text.init<A>(_:)(&v80, &type metadata for String, v7);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  if (qword_1000198D8 != -1)
    swift_once(&qword_1000198D8, sub_10000C8B0);
  v36 = qword_10001AD48;
  v37 = swift_retain(qword_10001AD48);
  v38 = v33 & 1;
  v39 = Text.font(_:)(v37, v29, v31, v33 & 1, v35);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  swift_release(v36);
  sub_10000C5F0(v29, v31, v38);
  swift_bridgeObjectRelease(v35);
  if (qword_1000198D0 != -1)
    swift_once(&qword_1000198D0, sub_100008724);
  v46 = v43 & 1;
  v47 = v69 & 1;
  v48 = Text.foregroundColor(_:)(qword_10001AD40, v39, v41, v43 & 1, v45);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  sub_10000C5F0(v39, v41, v46);
  v55 = swift_bridgeObjectRelease(v45);
  v80 = v48;
  v81 = v50;
  v82 = v52 & 1;
  v83 = v54;
  v56 = v72;
  static RedactionReasons.placeholder.getter(v55);
  v57 = v77;
  View.redacted(reason:)(v56, &type metadata for Text, &protocol witness table for Text);
  (*(void (**)(_BYTE *, uint64_t))(v73 + 8))(v56, v74);
  sub_10000C5F0(v80, v81, v82);
  swift_bridgeObjectRelease(v83);
  v59 = v75;
  v58 = v76;
  v60 = v79;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v76 + 32))(v75, v57, v79);
  v61 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v58 + 16);
  v61(v57, v59, v60);
  v62 = v78;
  v64 = v70;
  v63 = v71;
  *v78 = v70;
  v62[1] = v27;
  *((_BYTE *)v62 + 16) = v47;
  v62[3] = v63;
  v65 = sub_100003F8C(&qword_10001A090);
  v61((_BYTE *)v62 + *(int *)(v65 + 48), v57, v60);
  sub_10000C600(v64, v27, v47);
  v66 = *(void (**)(_BYTE *, uint64_t))(v58 + 8);
  swift_bridgeObjectRetain(v63);
  v66(v59, v60);
  v66(v57, v60);
  sub_10000C5F0(v64, v27, v47);
  return swift_bridgeObjectRelease(v63);
}

uint64_t sub_1000098E8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *a2 = static Alignment.center.getter(a1);
  a2[1] = v4;
  v5 = sub_100003F8C(&qword_10001A060);
  return sub_100008E64(v2, (uint64_t)a2 + *(int *)(v5 + 44));
}

uint64_t sub_100009928(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009938(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t destroy for TirePressureWidgetView(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 40));
}

_QWORD *initializeWithCopy for TirePressureWidgetView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = v3;
  v7 = v4;
  swift_retain(v5);
  return a1;
}

_QWORD *assignWithCopy for TirePressureWidgetView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  v7 = (void *)a2[3];
  v8 = (void *)a1[3];
  a1[3] = v7;
  v9 = v7;

  a1[4] = a2[4];
  v10 = a2[5];
  v11 = a1[5];
  a1[5] = v10;
  swift_retain(v10);
  swift_release(v11);
  return a1;
}

__n128 initializeWithTake for TirePressureWidgetView(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for TirePressureWidgetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  v6 = a2[3];
  v7 = (void *)a1[3];
  a1[2] = a2[2];
  a1[3] = v6;

  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_release(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TirePressureWidgetView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TirePressureWidgetView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TirePressureWidgetView()
{
  return &type metadata for TirePressureWidgetView;
}

uint64_t sub_100009B50(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000118B0, 1);
}

uint64_t sub_100009B60(uint64_t a1)
{

  return a1;
}

uint64_t sub_100009B88(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_100009BB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019C90;
  if (!qword_100019C90)
  {
    v1 = sub_100009C34(&qword_100019C88);
    sub_100003F4C(&qword_100019C98, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t)&protocol conformance descriptor for CAUVehicleLayout);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100019C90);
  }
  return result;
}

uint64_t sub_100009C34(uint64_t *a1)
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

unint64_t sub_100009C78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019CB8;
  if (!qword_100019CB8)
  {
    v1 = sub_100009C34(&qword_100019CC0);
    sub_100009CFC();
    sub_10000C860(&qword_100019CD0, &qword_100019CD8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100019CB8);
  }
  return result;
}

unint64_t sub_100009CFC()
{
  unint64_t result;

  result = qword_100019CC8;
  if (!qword_100019CC8)
  {
    result = swift_getWitnessTable(&unk_10000F604, &type metadata for CarObservingView);
    atomic_store(result, (unint64_t *)&qword_100019CC8);
  }
  return result;
}

uint64_t sub_100009D40(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009C34(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009DAC()
{
  unint64_t result;

  result = qword_100019CE8;
  if (!qword_100019CE8)
  {
    result = swift_getWitnessTable(&unk_10000F5B4, &type metadata for RedactedCarView);
    atomic_store(result, (unint64_t *)&qword_100019CE8);
  }
  return result;
}

uint64_t sub_100009DF0(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100003FCC(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009E30(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100009E40(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

ValueMetadata *type metadata accessor for RedactedCarView()
{
  return &type metadata for RedactedCarView;
}

_QWORD *initializeBufferWithCopyOfBuffer for CarObservingView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for CarObservingView(uint64_t a1)
{

}

_QWORD *assignWithCopy for CarObservingView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  v7 = (void *)a1[2];
  v8 = (void *)a2[2];
  a1[2] = v8;
  v9 = v8;

  return a1;
}

__n128 initializeWithTake for CarObservingView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CarObservingView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;

  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for CarObservingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarObservingView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarObservingView()
{
  return &type metadata for CarObservingView;
}

uint64_t sub_10000A00C()
{
  return sub_10000C860(&qword_100019D10, &qword_100019C78, (uint64_t)&protocol conformance descriptor for SubscriptionView<A, B>);
}

uint64_t sub_10000A038(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011928, 1);
}

uint64_t sub_10000A048(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100011900, 1);
}

uint64_t sub_10000A058()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A084()
{
  uint64_t v0;

  return sub_100006118(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t type metadata accessor for CarView(uint64_t a1)
{
  return sub_10000AD90(a1, (uint64_t *)&unk_100019E00, (uint64_t)&nominal type descriptor for CarView);
}

unint64_t sub_10000A0A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019D50;
  if (!qword_100019D50)
  {
    v1 = sub_100009C34(&qword_100019D48);
    sub_100003F4C(&qword_100019D58, type metadata accessor for CarView, (uint64_t)&unk_10000F678);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100019D50);
  }
  return result;
}

uint64_t sub_10000A128()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A14C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000064E8(a1, v1);
}

uint64_t sub_10000A154(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

_OWORD *sub_10000A188(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

char *sub_10000A198(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *__dst;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    v7 = a1;
    v8 = a2[1];
    v9 = a2[2];
    *((_QWORD *)a1 + 1) = v8;
    *((_QWORD *)a1 + 2) = v9;
    v10 = *(int *)(a3 + 28);
    __dst = &a1[v10];
    v11 = (char *)a2 + v10;
    v12 = type metadata accessor for CAUVehicleLayout(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    v15 = v4;
    swift_retain(v8);
    v16 = v9;
    if (v14(v11, 1, v12))
    {
      v17 = sub_100003F8C(&qword_100019C88);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v18 = *(int *)(a3 + 32);
    v19 = &v7[v18];
    v20 = (uint64_t)a2 + v18;
    *v19 = *(_BYTE *)v20;
    v4 = *(char **)(v20 + 8);
    *((_QWORD *)v19 + 1) = v4;
  }
  swift_retain(v4);
  return v7;
}

uint64_t sub_10000A2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for CAUVehicleLayout(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 32) + 8));
}

_QWORD *sub_10000A36C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v7 = *(void **)(a2 + 16);
  a1[2] = v7;
  v8 = *(int *)(a3 + 28);
  v9 = (char *)a1 + v8;
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for CAUVehicleLayout(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v6;
  swift_retain(v5);
  v15 = v7;
  if (v13(v10, 1, v11))
  {
    v16 = sub_100003F8C(&qword_100019C88);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v17 = *(int *)(a3 + 32);
  v18 = (char *)a1 + v17;
  v19 = (char *)(a2 + v17);
  *v18 = *v19;
  v20 = *((_QWORD *)v19 + 1);
  *((_QWORD *)v18 + 1) = v20;
  swift_retain(v20);
  return a1;
}

uint64_t sub_10000A484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  swift_retain(v9);
  swift_release(v10);
  v11 = *(void **)(a2 + 16);
  v12 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v13 = v11;

  v14 = *(int *)(a3 + 28);
  v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  v17 = type metadata accessor for CAUVehicleLayout(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v22 = sub_100003F8C(&qword_100019C88);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
LABEL_7:
  v23 = *(int *)(a3 + 32);
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  v26 = *(_QWORD *)(v24 + 8);
  v27 = *(_QWORD *)(v25 + 8);
  *(_QWORD *)(v24 + 8) = v27;
  swift_retain(v27);
  swift_release(v26);
  return a1;
}

uint64_t sub_10000A600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for CAUVehicleLayout(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100003F8C(&qword_100019C88);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_10000A6E0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_release(v7);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v9 = *(int *)(a3 + 28);
  v10 = (void *)(a1 + v9);
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for CAUVehicleLayout(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = sub_100003F8C(&qword_100019C88);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = *(int *)(a3 + 32);
  v19 = a1 + v18;
  v20 = (char *)a2 + v18;
  *(_BYTE *)v19 = *v20;
  v21 = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
  swift_release(v21);
  return a1;
}

uint64_t sub_10000A844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A850);
}

uint64_t sub_10000A850(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100003F8C(&qword_100019C88);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t sub_10000A8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A8DC);
}

char *sub_10000A8DC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100003F8C(&qword_100019C88);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

void sub_10000A954(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_10000A9E4(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_10000F660;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
  }
}

void sub_10000A9E4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100019E10)
  {
    v2 = type metadata accessor for CAUVehicleLayout(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100019E10);
  }
}

uint64_t sub_10000AA38()
{
  return sub_10000C860(&qword_100019E50, &qword_100019D38, (uint64_t)&protocol conformance descriptor for SubscriptionView<A, B>);
}

unint64_t sub_10000AA68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E58;
  if (!qword_100019E58)
  {
    v1 = sub_100009C34(&qword_100019D78);
    sub_10000C860(&qword_100019E60, &qword_100019D68, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100019E58);
  }
  return result;
}

uint64_t sub_10000AAEC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000119A0, 1);
}

uint64_t sub_10000AAFC()
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

  v1 = type metadata accessor for CarView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = v0 + v4 + *(int *)(v1 + 28);
  v7 = type metadata accessor for CAUVehicleLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_release(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 32) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000ABD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AC18@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarView(0) - 8) + 80);
  return sub_100006A40((id *)(v1 + ((v3 + 16) & ~v3)), a1);
}

uint64_t type metadata accessor for RedactedTiresView(uint64_t a1)
{
  return sub_10000AD90(a1, qword_100019F58, (uint64_t)&nominal type descriptor for RedactedTiresView);
}

uint64_t sub_10000AC78(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000ACBC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000ACF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019E98;
  if (!qword_100019E98)
  {
    v1 = sub_100009C34(&qword_100019EA0);
    sub_100003F4C(&qword_100019EA8, type metadata accessor for TireView, (uint64_t)&unk_10000F778);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100019E98);
  }
  return result;
}

uint64_t type metadata accessor for TireView(uint64_t a1)
{
  return sub_10000AD90(a1, qword_100019FE8, (uint64_t)&nominal type descriptor for TireView);
}

uint64_t sub_10000AD90(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

unint64_t sub_10000ADC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019EB0;
  if (!qword_100019EB0)
  {
    v1 = sub_100009C34(&qword_100019E70);
    sub_100003F4C(&qword_100019EB8, type metadata accessor for RedactedTiresView, (uint64_t)&unk_10000F728);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100019EB0);
  }
  return result;
}

uint64_t sub_10000AE48()
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

  v1 = type metadata accessor for CarView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = v0 + v4 + *(int *)(v1 + 28);
  v7 = type metadata accessor for CAUVehicleLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_release(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 32) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000AF20@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  double *v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarView(0) - 8) + 80);
  return sub_100007458(a1, (uint64_t)v2 + ((v5 + 48) & ~v5), a2, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_10000AF74()
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

  v1 = type metadata accessor for CarView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  swift_release(*(_QWORD *)(v0 + v4 + 8));
  v6 = v0 + v4 + *(int *)(v1 + 28);
  v7 = type metadata accessor for CAUVehicleLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_release(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 32) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_10000B054()
{
  type metadata accessor for CarView(0);
  sub_10000785C();
}

_QWORD *sub_10000B084(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v12);
  }
  else
  {
    v5 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for CAUVehicleLayout(0);
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      v11 = sub_100003F8C(&qword_100019C88);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_10000B16C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = type metadata accessor for CAUVehicleLayout(0);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

_OWORD *sub_10000B1D8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = sub_100003F8C(&qword_100019C88);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *sub_10000B294(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for CAUVehicleLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = sub_100003F8C(&qword_100019C88);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_OWORD *sub_10000B3B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = sub_100003F8C(&qword_100019C88);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_OWORD *sub_10000B470(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  int v11;
  int v12;
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v11 = v10(v6, 1, v8);
  v12 = v10(v7, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(v6, v7, v8);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v13 = sub_100003F8C(&qword_100019C88);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  return a1;
}

uint64_t sub_10000B578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B584);
}

uint64_t sub_10000B584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_100003F8C(&qword_100019C88);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_10000B5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B5D4);
}

uint64_t sub_10000B5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_100003F8C(&qword_100019C88);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

void sub_10000B61C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = " ";
  sub_10000A9E4(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

_QWORD *sub_10000B690(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v18 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v18);
  }
  else
  {
    v5 = (void *)a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v7 = (void *)a2[2];
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v6;
    v8 = *((_OWORD *)a2 + 3);
    v9 = *(int *)(a3 + 28);
    v10 = (void *)(a1 + v9);
    v11 = (char *)a2 + v9;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v8;
    v12 = type metadata accessor for CAUVehicleLayout(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    v15 = v5;
    v16 = v7;
    if (v14(v11, 1, v12))
    {
      v17 = sub_100003F8C(&qword_100019C88);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t sub_10000B798(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for CAUVehicleLayout(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_10000B81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  id v14;
  id v15;
  uint64_t v16;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  v7 = *(_OWORD *)(a2 + 48);
  v8 = *(int *)(a3 + 28);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v11 = type metadata accessor for CAUVehicleLayout(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v4;
  v15 = v6;
  if (v13(v10, 1, v11))
  {
    v16 = sub_100003F8C(&qword_100019C88);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

_QWORD *sub_10000B8F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = (void *)a2[1];
  v7 = (void *)a1[1];
  a1[1] = v6;
  v8 = v6;

  v9 = (void *)a1[2];
  v10 = (void *)a2[2];
  a1[2] = v10;
  v11 = v10;

  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for CAUVehicleLayout(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = sub_100003F8C(&qword_100019C88);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_10000BA58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for CAUVehicleLayout(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100003F8C(&qword_100019C88);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_10000BB1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;

  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for CAUVehicleLayout(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = sub_100003F8C(&qword_100019C88);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_10000BC54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BC60);
}

uint64_t sub_10000BC60(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100003F8C(&qword_100019C88);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_10000BCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BCEC);
}

uint64_t sub_10000BCEC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100003F8C(&qword_100019C88);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_10000BD64(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_10000F710;
  v4[1] = &unk_10000F660;
  v4[2] = " ";
  sub_10000A9E4(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

uint64_t sub_10000BDEC()
{
  return sub_10000C860(&qword_10001A028, &qword_10001A030, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10000BE18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000119F0, 1);
}

uint64_t sub_10000BE28(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000119C8, 1);
}

double sub_10000BE38(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_10000BE50(uint64_t a1, uint64_t a2)
{
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
  char *v12;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;

  v93 = (char *)a2;
  v94 = a1;
  v2 = type metadata accessor for CAUVehicleLayoutKey.End(0);
  v90 = *(_QWORD *)(v2 - 8);
  v91 = v2;
  v3 = __chkstk_darwin(v2);
  v89 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v80 - v5;
  v7 = type metadata accessor for CAUVehicleLayoutKey.Side(0);
  v92 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v80 - v11;
  v13 = sub_100003F8C(&qword_10001A040);
  __chkstk_darwin(v13);
  v83 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for CAUBaselineAnchor(0);
  v84 = *(_QWORD *)(v15 - 8);
  v85 = v15;
  __chkstk_darwin(v15);
  v82 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100003F8C(&qword_10001A048);
  __chkstk_darwin(v17);
  v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v20 = *(_QWORD *)(v87 - 8);
  v21 = __chkstk_darwin(v87);
  v86 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v88 = (char *)&v80 - v23;
  v24 = sub_100003F8C(&qword_100019C88);
  __chkstk_darwin(v24);
  v26 = (char *)&v80 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for CAUVehicleLayout(0);
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v30 = (char *)&v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v31;
  sub_10000C654((uint64_t)v93, (uint64_t)v26, &qword_100019C88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v32) == 1)
  {
    v33 = sub_10000C698((uint64_t)v26, &qword_100019C88);
LABEL_11:
    CAUVehicleLayoutKey.side.getter(v33);
    v42 = v92;
    (*(void (**)(char *, _QWORD, uint64_t))(v92 + 104))(v10, enum case for CAUVehicleLayoutKey.Side.left(_:), v7);
    static CAUVehicleLayoutKey.Side.== infix(_:_:)(v12, v10);
    v43 = *(void (**)(char *, uint64_t))(v42 + 8);
    v43(v10, v7);
    v44 = ((uint64_t (*)(char *, uint64_t))v43)(v12, v7);
    CAUVehicleLayoutKey.end.getter(v44);
    v46 = v89;
    v45 = v90;
    v47 = v91;
    (*(void (**)(char *, _QWORD, uint64_t))(v90 + 104))(v89, enum case for CAUVehicleLayoutKey.End.front(_:), v91);
    static CAUVehicleLayoutKey.End.== infix(_:_:)(v6, v46);
    v48 = *(void (**)(char *, uint64_t))(v45 + 8);
    v48(v46, v47);
    return ((uint64_t (*)(char *, uint64_t))v48)(v6, v47);
  }
  v80 = v28;
  v34 = *(uint64_t (**)(char *, char *, uint64_t))(v28 + 32);
  v81 = v32;
  v35 = v34(v30, v26, v32);
  v93 = v30;
  v36 = CAUVehicleLayout.infos.getter(v35);
  if (*(_QWORD *)(v36 + 16))
  {
    v37 = sub_10000D830(v94);
    v38 = v87;
    if ((v39 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v19, *(_QWORD *)(v36 + 56) + *(_QWORD *)(v20 + 72) * v37, v87);
      v40 = 0;
    }
    else
    {
      v40 = 1;
    }
    v41 = v88;
  }
  else
  {
    v40 = 1;
    v38 = v87;
    v41 = v88;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v19, v40, 1, v38);
  swift_bridgeObjectRelease(v36);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1, v38) == 1)
  {
    (*(void (**)(char *, uint64_t))(v80 + 8))(v93, v81);
    v33 = sub_10000C698((uint64_t)v19, &qword_10001A048);
    goto LABEL_11;
  }
  v50 = (*(uint64_t (**)(char *, char *, uint64_t))(v20 + 32))(v41, v19, v38);
  v51 = (uint64_t)v83;
  CAUVehicleLayoutInfo.baselineAnchor.getter(v50);
  v52 = v84;
  v53 = v85;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v51, 1, v85) != 1)
  {
    v64 = v82;
    v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 32))(v82, v51, v53);
    CAUBaselineAnchor.x.getter(v65);
    v66 = v86;
    v61 = (uint64_t)v93;
    v67 = ((uint64_t (*)(void))CAUVehicleLayout.topDownExteriorImage.getter)();
    CAUVehicleLayoutInfo.width.getter(v67);
    v63 = *(uint64_t (**)(char *, uint64_t))(v20 + 8);
    v68 = v63(v66, v38);
    CAUBaselineAnchor.y.getter(v68);
    v69 = ((uint64_t (*)(void))CAUVehicleLayout.topDownExteriorImage.getter)();
    CAUVehicleLayoutInfo.height.getter(v69);
    v63(v66, v38);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v64, v53);
    v70 = v80;
LABEL_19:
    v63(v41, v38);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 8))(v61, v81);
  }
  v54 = sub_10000C698(v51, &qword_10001A040);
  CAUVehicleLayoutKey.side.getter(v54);
  v55 = v92;
  (*(void (**)(char *, _QWORD, uint64_t))(v92 + 104))(v10, enum case for CAUVehicleLayoutKey.Side.left(_:), v7);
  v56 = static CAUVehicleLayoutKey.Side.== infix(_:_:)(v12, v10);
  v57 = *(void (**)(char *, uint64_t))(v55 + 8);
  v57(v10, v7);
  v58 = ((uint64_t (*)(char *, uint64_t))v57)(v12, v7);
  if ((v56 & 1) != 0)
  {
    v59 = CAUVehicleLayoutInfo.x.getter(v58);
    v60 = v86;
    v61 = (uint64_t)v93;
    v62 = CAUVehicleLayout.topDownExteriorImage.getter(v59);
    CAUVehicleLayoutInfo.width.getter(v62);
    v63 = *(uint64_t (**)(char *, uint64_t))(v20 + 8);
LABEL_18:
    v70 = v80;
    v76 = v63(v60, v38);
    v77 = CAUVehicleLayoutInfo.y.getter(v76);
    v78 = CAUVehicleLayoutInfo.height.getter(v77);
    v79 = CAUVehicleLayout.topDownExteriorImage.getter(v78);
    CAUVehicleLayoutInfo.height.getter(v79);
    v63(v60, v38);
    goto LABEL_19;
  }
  v60 = v86;
  v61 = (uint64_t)v93;
  v71 = CAUVehicleLayout.topDownExteriorImage.getter(v58);
  CAUVehicleLayoutInfo.width.getter(v71);
  v63 = *(uint64_t (**)(char *, uint64_t))(v20 + 8);
  v72 = v63(v60, v38);
  v73 = CAUVehicleLayoutInfo.x.getter(v72);
  v74 = v73;
  result = CAUVehicleLayoutInfo.width.getter(v73);
  if (!__OFADD__(v74, (_DWORD)result))
  {
    v75 = CAUVehicleLayout.topDownExteriorImage.getter(result);
    CAUVehicleLayoutInfo.width.getter(v75);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000C5AC()
{
  unint64_t result;

  result = qword_10001A050;
  if (!qword_10001A050)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A050);
  }
  return result;
}

uint64_t sub_10000C5F0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000C600(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000C610(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003F8C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C654(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003F8C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C698(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003F8C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C6D4()
{
  return sub_10000C708(&qword_10001A098, &qword_10001A038, (void (*)(void))sub_10000C76C, (uint64_t)&protocol conformance descriptor for <A> A?);
}

uint64_t sub_10000C708(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_100009C34(a2);
    a3();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000C76C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A0A0;
  if (!qword_10001A0A0)
  {
    v1 = sub_100009C34(&qword_10001A0A8);
    sub_10000C860(&qword_10001A0B0, &qword_10001A0B8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_10000C7F0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A0A0);
  }
  return result;
}

unint64_t sub_10000C7F0()
{
  unint64_t result;

  result = qword_10001A0C0;
  if (!qword_10001A0C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _PositionLayout, &type metadata for _PositionLayout);
    atomic_store(result, (unint64_t *)&qword_10001A0C0);
  }
  return result;
}

uint64_t sub_10000C834()
{
  return sub_10000C860(&qword_10001A0C8, &qword_10001A0D0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t sub_10000C860(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009C34(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C8B0(uint64_t a1)
{
  return sub_10000C8D8(a1, (double (*)(uint64_t))&static Font.Weight.regular.getter, &qword_10001AD48);
}

uint64_t sub_10000C8C4(uint64_t a1)
{
  return sub_10000C8D8(a1, (double (*)(uint64_t))&static Font.Weight.bold.getter, &qword_10001AD50);
}

uint64_t sub_10000C8D8(uint64_t a1, double (*a2)(uint64_t), uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v5 = sub_100003F8C((uint64_t *)&unk_10001A0E0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2(v6);
  v10 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  v11 = static Font.system(size:weight:design:)(*(_QWORD *)&v9, 0, v8, 36.0);
  result = sub_10000CC50((uint64_t)v8);
  *a3 = v11;
  return result;
}

NSString sub_10000C990()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_10001AD58 = (uint64_t)result;
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ClusterEventType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
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
    return ((uint64_t (*)(void))((char *)&loc_10000CAB0 + 4 * byte_10000F7D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000CAE4 + 4 * byte_10000F7D0[v4]))();
}

uint64_t sub_10000CAE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CAEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000CAF4);
  return result;
}

uint64_t sub_10000CB00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000CB08);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000CB0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CB14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CB20(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000CB28(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ClusterEventType()
{
  return &type metadata for ClusterEventType;
}

unint64_t sub_10000CB48()
{
  unint64_t result;

  result = qword_10001A0D8;
  if (!qword_10001A0D8)
  {
    result = swift_getWitnessTable(&unk_10000F834, &type metadata for ClusterEventType);
    atomic_store(result, (unint64_t *)&qword_10001A0D8);
  }
  return result;
}

BOOL sub_10000CB8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000CBA4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000CBE8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000CC10(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000CC50(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003F8C((uint64_t *)&unk_10001A0E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10000CC90()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___carManager);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)CAFCarManager), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_10000CD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12TirePressure23TirePressureAppDelegate____lazy_storage___assetManager);
  }
  else
  {
    v4 = v0;
    v5 = type metadata accessor for CAUAssetLibraryManager();
    swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
    v3 = CAUAssetLibraryManager.init()();
    v6 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v6);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

id sub_10000CE54()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TirePressureAppDelegate();
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

  v3 = type metadata accessor for TirePressureAppDelegate();
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

uint64_t type metadata accessor for TirePressureAppDelegate()
{
  return objc_opt_self(_TtC12TirePressure23TirePressureAppDelegate);
}

unint64_t sub_10000CF64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019A00;
  if (!qword_100019A00)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_10000F3C4, v1);
    atomic_store(result, (unint64_t *)&qword_100019A00);
  }
  return result;
}

uint64_t sub_10000CFAC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10000F928);
  v2 = swift_getKeyPath(&unk_10000F950);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

id sub_10000D158()
{
  return sub_10000D578(0, (uint64_t (*)(void))type metadata accessor for ScenePresentationTypeObserver);
}

uint64_t sub_10000D1A8()
{
  return type metadata accessor for ScenePresentationTypeObserver(0);
}

uint64_t type metadata accessor for ScenePresentationTypeObserver(uint64_t a1)
{
  uint64_t result;

  result = qword_10001A220;
  if (!qword_10001A220)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ScenePresentationTypeObserver);
  return result;
}

void sub_10000D1EC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_10000D258(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
  }
}

void sub_10000D258(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10001A230)
  {
    type metadata accessor for CRSUIHostedAltScreenPresentationType(255);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10001A230);
  }
}

uint64_t sub_10000D2AC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ScenePresentationTypeObserver(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000D2E8()
{
  uint64_t result;

  sub_10000E500();
  result = NSString.init(stringLiteral:)("selectHandler", 13, 2);
  qword_10001AD60 = result;
  return result;
}

void sub_10000D3A8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = (void *)v4;
    v11 = a1;
    v6 = objc_msgSend(v5, "_FBSScene");
    v7 = objc_msgSend(v6, "settings");

    v8 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    if (swift_dynamicCastObjCClass(v7, v8))
    {

      v9 = *(void **)(v1 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = 0;

      if (qword_1000198F0 != -1)
        swift_once(&qword_1000198F0, sub_10000D2E8);
      objc_msgSend(v5, "_unregisterSceneActionsHandlerArray:", qword_10001AD60);
      v10 = v11;
    }
    else
    {

      v10 = v7;
    }

  }
}

id sub_10000D56C(uint64_t a1)
{
  return sub_10000D578(a1, type metadata accessor for TirePressureSceneDelegate);
}

id sub_10000D578(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for TirePressureSceneDelegate()
{
  return objc_opt_self(_TtC12TirePressure25TirePressureSceneDelegate);
}

unint64_t sub_10000D5D8(uint64_t a1)
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
  sub_100003F8C(&qword_10001A330);
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
    sub_10000E47C(v7, (uint64_t)v16);
    result = sub_10000D800((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10000A188(&v18, (_OWORD *)(v4[7] + 32 * result));
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

void *sub_10000D70C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000D718@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10000F928);
  v5 = swift_getKeyPath(&unk_10000F950);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000D794(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_10000F928);
  v5 = swift_getKeyPath(&unk_10000F950);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

unint64_t sub_10000D800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000D894(a1, v4);
}

unint64_t sub_10000D830(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for CAUVehicleLayoutKey(0);
  v6 = sub_10000E544(&qword_10001A360, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000D958(a1, v7);
}

unint64_t sub_10000D894(uint64_t a1, uint64_t a2)
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
      sub_10000E4C4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000A154((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10000D958(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for CAUVehicleLayoutKey(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      v14 = sub_10000E544(&qword_10001A368, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void sub_10000DA90(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v11 = objc_msgSend(a1, "settings");
  v2 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v3 = swift_dynamicCastObjCClass(v11, v2);
  if (v3)
  {
    v4 = (void *)v3;
    KeyPath = swift_getKeyPath(&unk_10000F928);
    v6 = swift_getKeyPath(&unk_10000F950);
    static Published.subscript.getter(&v12, v1, KeyPath, v6);
    swift_release(KeyPath);
    swift_release(v6);
    v7 = v12;
    if (v7 != objc_msgSend(v4, "hostedAltScreenPresentationType"))
    {
      v8 = objc_msgSend(v4, "hostedAltScreenPresentationType");
      v9 = swift_getKeyPath(&unk_10000F928);
      v10 = swift_getKeyPath(&unk_10000F950);
      v12 = v8;
      static Published.subscript.setter(&v12, v1, v9, v10);
    }

  }
  else
  {

  }
}

void sub_10000DBBC(void *a1, id a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t KeyPath;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  objc_class *v44;
  id v45;
  id v46;
  char *v47;
  id v48;
  uint64_t v49;
  id v50;
  char *v51;
  void *v52;
  objc_class *v53;
  char *v54;
  id v55;
  char *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSArray v64;
  void *v65;
  uint64_t v66;
  objc_super v67;
  objc_super v68;
  uint64_t v69;

  v5 = objc_msgSend(a2, "role");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  CAFSignpostEmit_Scene(v8);

  v9 = objc_opt_self(UIWindowScene);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  v12 = a1;
  v13 = objc_msgSend(a2, "role");
  v14 = _UIWindowSceneSessionRoleCarPlay;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  if (v15 == v18 && v17 == v19)
  {

    swift_bridgeObjectRelease_n(v17, 2);
  }
  else
  {
    v21 = v19;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0);

    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) == 0)
    {

LABEL_8:
      v23 = 0xD000000000000024;
      v24 = 0x8000000100010300;
      sub_100004A6C(0xD000000000000024, 0x8000000100010300);
      v25 = 35;
LABEL_19:
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v23, v24, "TirePressure/TirePressureSceneDelegate.swift", 44, 2, v25, 0);
      goto LABEL_20;
    }
  }
  v26 = objc_msgSend(v11, "_FBSScene");
  v27 = objc_msgSend(v26, "settings");

  v28 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v29 = swift_dynamicCastObjCClass(v27, v28);
  if (!v29)
  {

    sub_100004A60(0xD000000000000021, 0x8000000100010360);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000021, 0x8000000100010360, "TirePressure/TirePressureSceneDelegate.swift", 44, 2, 40, 0);
LABEL_20:
    __break(1u);
    return;
  }
  v30 = (void *)v29;
  v31 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v32 = objc_msgSend(v31, "delegate");

  if (!v32)
  {
LABEL_18:
    v23 = 0xD000000000000026;
    v24 = 0x8000000100010390;
    sub_100004A60(0xD000000000000026, 0x8000000100010390);
    v25 = 45;
    goto LABEL_19;
  }
  v65 = v27;
  v66 = v2;
  v33 = type metadata accessor for TirePressureAppDelegate();
  if (!swift_dynamicCastClass(v32, v33))
  {
    swift_unknownObjectRelease(v32);
    goto LABEL_18;
  }
  v34 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ScenePresentationTypeObserver(0)), "init");
  v35 = objc_msgSend(v11, "_FBSScene");
  objc_msgSend(v35, "addObserver:", v34);

  v36 = objc_msgSend(v30, "hostedAltScreenPresentationType");
  KeyPath = swift_getKeyPath(&unk_10000F928);
  v38 = swift_getKeyPath(&unk_10000F950);
  v69 = (uint64_t)v36;
  v39 = v34;
  static Published.subscript.setter(&v69, v39, KeyPath, v38);
  v40 = v12;
  v41 = v39;
  v42 = sub_10000CC90();
  v43 = sub_10000CD00();
  v44 = (objc_class *)type metadata accessor for TirePressureWindowManager();
  v45 = objc_allocWithZone(v44);
  v46 = objc_allocWithZone((Class)UIWindow);
  v47 = (char *)v45;
  v48 = objc_msgSend(v46, "initWithWindowScene:", v11);
  v49 = OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window;
  *(_QWORD *)&v47[OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window] = v48;
  objc_msgSend(v48, "setAutoresizesSubviews:", 1);
  objc_msgSend(*(id *)&v47[v49], "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)&v47[v49], "makeKeyAndVisible");
  v50 = *(id *)&v47[v49];
  objc_msgSend(v50, "setHidden:", 0);

  v68.receiver = v47;
  v68.super_class = v44;
  v51 = (char *)objc_msgSendSuper2(&v68, "init");
  v52 = *(void **)&v51[OBJC_IVAR____TtC12TirePressure25TirePressureWindowManager_window];
  v53 = (objc_class *)type metadata accessor for TirePressureViewController();
  v54 = (char *)objc_allocWithZone(v53);
  *(_QWORD *)&v54[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_carManager] = v42;
  *(_QWORD *)&v54[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_assetManager] = v43;
  *(_QWORD *)&v54[OBJC_IVAR____TtC12TirePressure26TirePressureViewController_scenePresentationTypeObserver] = v41;
  v67.receiver = v54;
  v67.super_class = v53;
  v55 = v41;
  v56 = v51;
  v57 = v52;
  v58 = v42;
  swift_retain(v43);
  v59 = objc_msgSendSuper2(&v67, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v57, "setRootViewController:", v59);

  swift_release(v43);
  v60 = *(void **)(v66 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager);
  *(_QWORD *)(v66 + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = v56;

  v61 = sub_100003F8C(&qword_1000199D0);
  v62 = swift_allocObject(v61, 40, 7);
  *(_OWORD *)(v62 + 16) = xmmword_10000F880;
  *(_QWORD *)(v62 + 32) = objc_msgSend(objc_allocWithZone((Class)CRSUIClusterPressBSActionsHandler), "initWithDelegate:", v66);
  v69 = v62;
  specialized Array._endMutation()();
  v63 = v69;
  sub_100003F8C(&qword_10001A350);
  v64.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v63);
  if (qword_1000198F0 != -1)
    swift_once(&qword_1000198F0, sub_10000D2E8);
  objc_msgSend(v11, "_registerSceneActionsHandlerArray:forKey:", v64.super.isa, qword_10001AD60);

  swift_unknownObjectRelease(v32);
}

void sub_10000E1E8(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  Class isa;
  uint64_t v8;
  _WORD v9[8];
  _BYTE v10[104];

  if (a1 == 2)
  {
    sub_100004A6C(0xD00000000000001CLL, 0x80000001000102B0);
    v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1000198E8 != -1)
      swift_once(&qword_1000198E8, sub_10000C990);
    v2 = qword_10001AD58;
    v5 = sub_100003F8C(&qword_10001A328);
    inited = swift_initStackObject(v5, v10);
    *(_OWORD *)(inited + 16) = xmmword_10000F890;
    strcpy((char *)v9, "ClusterEvent");
    HIBYTE(v9[6]) = 0;
    v9[7] = -5120;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v9, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 96) = &type metadata for ClusterEventType;
    *(_BYTE *)(inited + 72) = 1;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    sub_100004A6C(0xD00000000000001ELL, 0x80000001000102D0);
    v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1000198E8 != -1)
      swift_once(&qword_1000198E8, sub_10000C990);
    v2 = qword_10001AD58;
    v3 = sub_100003F8C(&qword_10001A328);
    inited = swift_initStackObject(v3, &v8);
    *(_OWORD *)(inited + 16) = xmmword_10000F890;
    strcpy((char *)v9, "ClusterEvent");
    HIBYTE(v9[6]) = 0;
    v9[7] = -5120;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v9, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 96) = &type metadata for ClusterEventType;
    *(_BYTE *)(inited + 72) = 0;
LABEL_9:
    v6 = sub_10000D5D8(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    objc_msgSend(v1, "postNotificationName:object:userInfo:", v2, 0, isa);

    return;
  }
  sub_100004A6C(0xD00000000000001FLL, 0x8000000100010290);
}

uint64_t sub_10000E47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003F8C(&qword_10001A338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E4C4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

unint64_t sub_10000E500()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A340;
  if (!qword_10001A340)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A340);
  }
  return result;
}

uint64_t sub_10000E544(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CAUVehicleLayoutKey(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000E584()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC12TirePressureP33_0E5F07074F150FEC7DAA891976F7351619ResourceBundleClass);
}
