void sub_10000370C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a1;
    v7 = objc_msgSend(v5, "_FBSScene");
    v9 = objc_msgSend(v7, "settings");

    v8 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    if (swift_dynamicCastObjCClass(v9, v8))
    {

      v9 = *(id *)(v1 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager) = 0;
    }

  }
}

id sub_100003888()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ClosuresSceneDelegate()
{
  return objc_opt_self(_TtC8Closures21ClosuresSceneDelegate);
}

uint64_t sub_1000038E8(uint64_t a1, uint64_t a2)
{
  return sub_1000039B0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000038F4(uint64_t a1)
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

Swift::Int sub_100003934(uint64_t a1)
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

uint64_t sub_1000039A4(uint64_t a1, uint64_t a2)
{
  return sub_1000039B0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000039B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_1000039EC(uint64_t a1, id *a2)
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

uint64_t sub_100003A60(uint64_t a1, id *a2)
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

uint64_t sub_100003ADC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

BOOL sub_100003B1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unsigned __int8 *sub_100003B30@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100003B40(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_100003B4C(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100003BD4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100003C18@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003C40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000041A4((unint64_t *)&qword_10001D598, (uint64_t)&unk_1000148B4);
  v3 = sub_1000041A4(&qword_10001D5A0, (uint64_t)&unk_100014808);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void sub_100003CAC(void *a1, id a2)
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
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  objc_class *v37;
  id v38;
  id v39;
  char *v40;
  id v41;
  uint64_t v42;
  id v43;
  char *v44;
  void *v45;
  objc_class *v46;
  char *v47;
  char *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  objc_super v53;
  objc_super v54;

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
      v24 = 0xD000000000000024;
      v25 = 0x8000000100012CD0;
      sub_10000ABE4(0xD000000000000024, 0x8000000100012CD0);
      v26 = 21;
LABEL_17:
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v24, v25, "Closures/ClosuresSceneDelegate.swift", 36, 2, v26, 0);
      goto LABEL_18;
    }
  }
  v27 = objc_msgSend(v12, "_FBSScene");
  v28 = objc_msgSend(v27, "settings");

  v29 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v30 = swift_dynamicCastObjCClass(v28, v29);

  if (v30)
  {
    v31 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v32 = objc_msgSend(v31, "delegate");

    if (v32)
    {
      v33 = type metadata accessor for ClosuresAppDelegate();
      if (swift_dynamicCastClass(v32, v33))
      {
        v34 = v13;
        v35 = sub_100004384();
        v36 = sub_1000043F4();
        v37 = (objc_class *)type metadata accessor for ClosuresWindowManager();
        v38 = objc_allocWithZone(v37);
        v39 = objc_allocWithZone((Class)UIWindow);
        v40 = (char *)v38;
        v41 = objc_msgSend(v39, "initWithWindowScene:", v12);
        v42 = OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window;
        *(_QWORD *)&v40[OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window] = v41;
        objc_msgSend(v41, "setAutoresizesSubviews:", 1);
        objc_msgSend(*(id *)&v40[v42], "setAutoresizingMask:", 18);
        objc_msgSend(*(id *)&v40[v42], "makeKeyAndVisible");
        v43 = *(id *)&v40[v42];
        objc_msgSend(v43, "setHidden:", 0);

        v54.receiver = v40;
        v54.super_class = v37;
        v44 = (char *)objc_msgSendSuper2(&v54, "init");
        v45 = *(void **)&v44[OBJC_IVAR____TtC8Closures21ClosuresWindowManager_window];
        v46 = (objc_class *)type metadata accessor for ClosuresViewController();
        v47 = (char *)objc_allocWithZone(v46);
        *(_QWORD *)&v47[OBJC_IVAR____TtC8Closures22ClosuresViewController_carManager] = v35;
        *(_QWORD *)&v47[OBJC_IVAR____TtC8Closures22ClosuresViewController_assetManager] = v36;
        v53.receiver = v47;
        v53.super_class = v46;
        v48 = v44;
        v49 = v45;
        v50 = v35;
        swift_retain(v36);
        v51 = objc_msgSendSuper2(&v53, "initWithNibName:bundle:", 0, 0);
        objc_msgSend(v49, "setRootViewController:", v51);

        swift_release(v36);
        v52 = *(void **)(v3 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager);
        *(_QWORD *)(v3 + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager) = v48;

        swift_unknownObjectRelease(v32);
        return;
      }
      swift_unknownObjectRelease(v32);
    }
    v24 = 0xD000000000000026;
    v25 = 0x8000000100012D60;
    sub_10000ABE4(0xD000000000000026, 0x8000000100012D60);
    v26 = 32;
    goto LABEL_17;
  }
  sub_10000ABE4(0xD000000000000021, 0x8000000100012D30);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000021, 0x8000000100012D30, "Closures/ClosuresSceneDelegate.swift", 36, 2, 27, 0);
LABEL_18:
  __break(1u);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100004338(a1, &qword_10001D578, (uint64_t)&unk_100018D88);
}

uint64_t sub_10000415C()
{
  return sub_1000041A4(&qword_10001D580, (uint64_t)&unk_1000147CC);
}

uint64_t sub_100004180()
{
  return sub_1000041A4(&qword_10001D588, (uint64_t)&unk_1000147A0);
}

uint64_t sub_1000041A4(unint64_t *a1, uint64_t a2)
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

uint64_t sub_1000041E4()
{
  return sub_1000041A4(&qword_10001D590, (uint64_t)&unk_10001483C);
}

void type metadata accessor for CAFSeatBeltIndicator(uint64_t a1)
{
  sub_100004338(a1, &qword_10001D5A8, (uint64_t)&unk_100018DB0);
}

uint64_t initializeBufferWithCopyOfBuffer for SeatBeltsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 initializeWithTake for ClosuresWidgetView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000425C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000427C(uint64_t result, int a2, int a3)
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
  sub_100004338(a1, &qword_10001D5B0, (uint64_t)&unk_100018E28);
}

__n128 sub_1000042BC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000042C8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000042E8(uint64_t result, int a2, int a3)
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
  sub_100004338(a1, &qword_10001D5B8, (uint64_t)&unk_100018EA8);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100004338(a1, (unint64_t *)&unk_10001D5C0, (uint64_t)&unk_100018F28);
}

void sub_100004338(uint64_t a1, unint64_t *a2, uint64_t a3)
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

id sub_100004384()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager);
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

uint64_t sub_1000043F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager);
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

id sub_100004548()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresAppDelegate();
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

  v3 = type metadata accessor for ClosuresAppDelegate();
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

uint64_t type metadata accessor for ClosuresAppDelegate()
{
  return objc_opt_self(_TtC8Closures19ClosuresAppDelegate);
}

unint64_t sub_100004658()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D598;
  if (!qword_10001D598)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_1000148B4, v1);
    atomic_store(result, (unint64_t *)&qword_10001D598);
  }
  return result;
}

void sub_1000046F8()
{
  char *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  Class isa;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  objc_super v65;

  v1 = v0;
  v65.receiver = v0;
  v65.super_class = (Class)type metadata accessor for ClosuresViewController();
  objc_msgSendSuper2(&v65, "viewDidLoad");
  v2 = sub_100004E64(0, &qword_10001D760, CAFCarManager_ptr);
  v3 = sub_100004D8C();
  v4 = CAFObserved<>.observable.getter(v2, v3);
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Closures22ClosuresViewController_assetManager];
  v6 = type metadata accessor for CAFCarManagerObservable(0);
  v7 = sub_100004DE4(&qword_10001D770, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCarManagerObservable, (uint64_t)&protocol conformance descriptor for CAFCarManagerObservable);
  swift_retain(v5);
  v8 = ObservedObject.init(wrappedValue:)(v4, v6, v7);
  v10 = v9;
  v11 = type metadata accessor for CAUAssetLibraryManager(0);
  v12 = sub_100004DE4(&qword_10001D778, (uint64_t (*)(uint64_t))&type metadata accessor for CAUAssetLibraryManager, (uint64_t)&protocol conformance descriptor for CAUAssetLibraryManager);
  v61 = v8;
  v62 = v10;
  v63 = ObservedObject.init(wrappedValue:)(v5, v11, v12);
  v64 = v13;
  v14 = objc_allocWithZone((Class)sub_100004E24(&qword_10001D780));
  v15 = (void *)UIHostingController.init(rootView:)(&v61);
  v16 = objc_msgSend(v15, "view", v61, v62, v63, v64);
  if (!v16)
  {
    __break(1u);
    goto LABEL_15;
  }
  v17 = v16;
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = objc_msgSend(v15, "view");
  if (!v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v19 = v18;
  v20 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v19, "setBackgroundColor:", v20);

  v21 = objc_msgSend(v1, "view");
  if (!v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22 = v21;
  v23 = objc_msgSend(v15, "view");
  if (!v23)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v24 = v23;
  objc_msgSend(v22, "addSubview:", v23);

  v25 = sub_100004E24(&qword_10001D788);
  v26 = swift_allocObject(v25, 64, 7);
  *(_OWORD *)(v26 + 16) = xmmword_1000149B0;
  v27 = objc_msgSend(v15, "view");
  if (!v27)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v28 = v27;
  v29 = objc_msgSend(v27, "topAnchor");

  v30 = objc_msgSend(v1, "view");
  if (!v30)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, "topAnchor");

  v33 = objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  *(_QWORD *)(v26 + 32) = v33;
  v34 = objc_msgSend(v15, "view");
  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v35 = v34;
  v36 = objc_msgSend(v34, "bottomAnchor");

  v37 = objc_msgSend(v1, "view");
  if (!v37)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "safeAreaLayoutGuide");

  v40 = objc_msgSend(v39, "bottomAnchor");
  v41 = objc_msgSend(v36, "constraintEqualToAnchor:", v40);

  *(_QWORD *)(v26 + 40) = v41;
  v42 = objc_msgSend(v15, "view");
  if (!v42)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, "leadingAnchor");

  v45 = objc_msgSend(v1, "view");
  if (!v45)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v46 = v45;
  v47 = objc_msgSend(v45, "safeAreaLayoutGuide");

  v48 = objc_msgSend(v47, "leadingAnchor");
  v49 = objc_msgSend(v44, "constraintEqualToAnchor:", v48);

  *(_QWORD *)(v26 + 48) = v49;
  v50 = objc_msgSend(v15, "view");
  if (!v50)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v51 = v50;
  v52 = objc_msgSend(v50, "trailingAnchor");

  v53 = objc_msgSend(v1, "view");
  if (v53)
  {
    v54 = v53;
    v55 = (void *)objc_opt_self(NSLayoutConstraint);
    v56 = objc_msgSend(v54, "safeAreaLayoutGuide");

    v57 = objc_msgSend(v56, "trailingAnchor");
    v58 = objc_msgSend(v52, "constraintEqualToAnchor:", v57);

    *(_QWORD *)(v26 + 56) = v58;
    v61 = v26;
    specialized Array._endMutation()();
    v59 = v61;
    sub_100004E64(0, &qword_10001D790, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v59);
    objc_msgSend(v55, "activateConstraints:", isa);

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_100004D04()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ClosuresViewController()
{
  return objc_opt_self(_TtC8Closures22ClosuresViewController);
}

unint64_t sub_100004D8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D768;
  if (!qword_10001D768)
  {
    v1 = sub_100004E64(255, &qword_10001D760, CAFCarManager_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for CAFCarManager, v1);
    atomic_store(result, (unint64_t *)&qword_10001D768);
  }
  return result;
}

uint64_t sub_100004DE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100004E24(uint64_t *a1)
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

uint64_t sub_100004E64(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

id sub_100004EC8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClosuresWindowManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ClosuresWindowManager()
{
  return objc_opt_self(_TtC8Closures21ClosuresWindowManager);
}

uint64_t sub_100004F28()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SeatBeltViewUpdater()
{
  return objc_opt_self(_TtC8ClosuresP33_752CA711C494D19B3DC5A25B5CE9239E19SeatBeltViewUpdater);
}

void *sub_100004F58()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100004F64@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for SeatBeltViewUpdater();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100004FA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;

  v38 = a2;
  v44 = sub_100004E24(&qword_10001D908);
  v37 = *(_QWORD *)(v44 - 8);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v36 - v6;
  __chkstk_darwin(v5);
  v41 = (char *)&v36 - v8;
  v9 = *(_QWORD *)(a1 + 64);
  v39 = a1 + 64;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v40 = (unint64_t)(v10 + 63) >> 6;
  v43 = a1;
  result = swift_bridgeObjectRetain(a1);
  v14 = 0;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  v45 = v14;
  for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v19 << 6))
  {
    v21 = v43;
    v22 = *(_QWORD *)(v43 + 48);
    v23 = type metadata accessor for CAUVehicleLayoutKey(0);
    v24 = *(_QWORD *)(v23 - 8);
    v25 = v22 + *(_QWORD *)(v24 + 72) * i;
    v26 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
    v27 = (uint64_t)v41;
    v26(v41, v25, v23);
    v28 = *(void **)(*(_QWORD *)(v21 + 56) + 8 * i);
    v29 = v44;
    *(_QWORD *)(v27 + *(int *)(v44 + 48)) = v28;
    sub_100009F9C(v27, (uint64_t)v7, &qword_10001D908);
    v30 = *(int *)(v29 + 48);
    v31 = v42;
    v26(v42, (uint64_t)v7, v23);
    v32 = *(void **)&v7[v30];
    *(_QWORD *)&v31[v30] = v32;
    v33 = v28;
    v34 = v32;
    LODWORD(v32) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v31, v23);
    if ((_DWORD)v32)
    {
      swift_release(v43);
      v35 = v38;
      sub_100009F9C((uint64_t)v7, v38, &qword_10001D908);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v35, 0, 1, v44);
    }
    result = sub_100009FE0((uint64_t)v7, &qword_10001D908);
    v14 = v45;
    if (v12)
      goto LABEL_4;
LABEL_5:
    v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v17 >= v40)
      goto LABEL_25;
    v18 = *(_QWORD *)(v39 + 8 * v17);
    v19 = v14 + 1;
    if (!v18)
    {
      v19 = v14 + 2;
      if (v14 + 2 >= v40)
        goto LABEL_25;
      v18 = *(_QWORD *)(v39 + 8 * v19);
      if (!v18)
      {
        v19 = v14 + 3;
        if (v14 + 3 >= v40)
          goto LABEL_25;
        v18 = *(_QWORD *)(v39 + 8 * v19);
        if (!v18)
        {
          v19 = v14 + 4;
          if (v14 + 4 >= v40)
            goto LABEL_25;
          v18 = *(_QWORD *)(v39 + 8 * v19);
          if (!v18)
            break;
        }
      }
    }
LABEL_20:
    v12 = (v18 - 1) & v18;
    v45 = v19;
  }
  v20 = v14 + 5;
  if (v14 + 5 >= v40)
  {
LABEL_25:
    swift_release(v43);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(v38, 1, 1, v44);
  }
  v18 = *(_QWORD *)(v39 + 8 * v20);
  if (v18)
  {
    v19 = v14 + 5;
    goto LABEL_20;
  }
  while (1)
  {
    v19 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v19 >= v40)
      goto LABEL_25;
    v18 = *(_QWORD *)(v39 + 8 * v19);
    ++v20;
    if (v18)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000052CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;

  v14 = 0;
  v15 = 0xE000000000000000;
  _StringGuts.grow(_:)(16);
  v5 = type metadata accessor for CAUVehicleLayoutKey(0);
  _print_unlocked<A, B>(_:_:)(a2, &v14, v5, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v6._countAndFlagsBits = 0x74616369646E6920;
  v6._object = (void *)0xEC000000203A726FLL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = CAFSeatBeltIndicator.description.getter(objc_msgSend(a3, "seatBeltIndicator"));
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9 = v15;
  sub_10000AE04(v14, v15, 0xD000000000000024, 0x8000000100012FF0, 65);
  swift_bridgeObjectRelease(v9);
  v10 = type metadata accessor for SeatBeltViewUpdater();
  v11 = sub_100004DE4(&qword_10001D888, (uint64_t (*)(uint64_t))type metadata accessor for SeatBeltViewUpdater, (uint64_t)"5G");
  v12 = ObservableObject<>.objectWillChange.getter(v10, v11);
  ObservableObjectPublisher.send()();
  return swift_release(v12);
}

uint64_t sub_100005408@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  char *v12;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v33)(char *, _QWORD, uint64_t);
  _QWORD *v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  _OWORD *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  _QWORD v97[3];

  v94 = a1;
  v2 = sub_100004E24(&qword_10001D8F0);
  __chkstk_darwin(v2);
  v89 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for CAUVehicleLayoutKey(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v91 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v76 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v76 - v11;
  v13 = sub_100004E24(&qword_10001D8F8);
  v93 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v88 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v87 = (char *)&v76 - v17;
  v18 = __chkstk_darwin(v16);
  v86 = (char *)&v76 - v19;
  v20 = __chkstk_darwin(v18);
  v96 = (char *)&v76 - v21;
  v22 = __chkstk_darwin(v20);
  v95 = (char *)&v76 - v23;
  __chkstk_darwin(v22);
  v92 = (char *)&v76 - v24;
  v25 = sub_100004E24(&qword_10001D900);
  __chkstk_darwin(v25);
  v27 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(_QWORD *)(v1 + 56);
  v29 = swift_bridgeObjectRetain(v28);
  sub_100004FA0(v29, (uint64_t)v27);
  swift_bridgeObjectRelease(v28);
  v30 = sub_100004E24(&qword_10001D908);
  LODWORD(v28) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v27, 1, v30);
  sub_100009FE0((uint64_t)v27, &qword_10001D900);
  if ((_DWORD)v28 == 1)
  {
    v31 = sub_100004E24(&qword_10001D910);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v94, 1, 1, v31);
  }
  else
  {
    v81 = v12;
    v82 = v5;
    v33 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
    v33(v12, enum case for CAUVehicleLayoutKey.seat_front_left(_:), v4);
    v80 = v10;
    v33(v10, enum case for CAUVehicleLayoutKey.seat_front_middle(_:), v4);
    v34 = v91;
    v33(v91, enum case for CAUVehicleLayoutKey.seat_front_right(_:), v4);
    v97[0] = sub_100005BD8((uint64_t)v12, v10, v34);
    v35 = (_OWORD *)swift_allocObject(&unk_1000190C8, 128, 7);
    v36 = *(_OWORD *)(v1 + 80);
    v35[5] = *(_OWORD *)(v1 + 64);
    v35[6] = v36;
    v35[7] = *(_OWORD *)(v1 + 96);
    v37 = *(_OWORD *)(v1 + 16);
    v35[1] = *(_OWORD *)v1;
    v35[2] = v37;
    v38 = *(_OWORD *)(v1 + 48);
    v35[3] = *(_OWORD *)(v1 + 32);
    v35[4] = v38;
    sub_100009634((_QWORD *)v1);
    v90 = sub_100004E24(&qword_10001D918);
    v39 = type metadata accessor for UUID(0);
    v40 = sub_100004E24(&qword_10001D920);
    v79 = v40;
    v41 = sub_10000A478(&qword_10001D928, &qword_10001D918, (uint64_t)&protocol conformance descriptor for [A]);
    v85 = v41;
    v42 = sub_100009A58(&qword_10001D930, &qword_10001D920, (void (*)(void))sub_100009688);
    v84 = v42;
    v83 = sub_100004DE4(&qword_10001D9A0, type metadata accessor for SeatBeltsView.CombinedFrames, (uint64_t)&unk_100014B30);
    v43 = v95;
    v78 = v39;
    ForEach<>.init(_:content:)(v97, sub_10000962C, v35, v90, v39, v40, v41, v42, v83);
    v44 = *(void (**)(char *, uint64_t))(v82 + 8);
    v45 = v91;
    v44(v91, v4);
    v46 = v80;
    v44(v80, v4);
    v47 = (uint64_t)v81;
    v44(v81, v4);
    v82 = *(_QWORD *)(v93 + 32);
    v77 = v13;
    ((void (*)(char *, char *, uint64_t))v82)(v92, v43, v13);
    v48 = v47;
    v33((char *)v47, enum case for CAUVehicleLayoutKey.seat_2ndRow_left(_:), v4);
    v33(v46, enum case for CAUVehicleLayoutKey.seat_2ndRow_middle(_:), v4);
    v49 = v45;
    v33(v45, enum case for CAUVehicleLayoutKey.seat_2ndRow_right(_:), v4);
    v50 = v48;
    v97[0] = sub_100005BD8(v48, v46, v49);
    v51 = (_OWORD *)swift_allocObject(&unk_1000190F0, 128, 7);
    v52 = *(_OWORD *)(v1 + 80);
    v51[5] = *(_OWORD *)(v1 + 64);
    v51[6] = v52;
    v51[7] = *(_OWORD *)(v1 + 96);
    v53 = *(_OWORD *)(v1 + 16);
    v51[1] = *(_OWORD *)v1;
    v51[2] = v53;
    v54 = *(_OWORD *)(v1 + 48);
    v51[3] = *(_OWORD *)(v1 + 32);
    v51[4] = v54;
    sub_100009634((_QWORD *)v1);
    v55 = v96;
    v56 = v39;
    v57 = v79;
    ForEach<>.init(_:content:)(v97, sub_10000A4E4, v51, v90, v56, v79, v85, v84, v83);
    v44(v49, v4);
    v44(v46, v4);
    v44((char *)v50, v4);
    v58 = v55;
    v59 = v77;
    ((void (*)(char *, char *, uint64_t))v82)(v95, v58, v77);
    v33((char *)v50, enum case for CAUVehicleLayoutKey.seat_3rdRow_left(_:), v4);
    v33(v46, enum case for CAUVehicleLayoutKey.seat_3rdRow_middle(_:), v4);
    v33(v49, enum case for CAUVehicleLayoutKey.seat_3rdRow_right(_:), v4);
    v97[0] = sub_100005BD8(v50, v46, v49);
    v60 = (_OWORD *)swift_allocObject(&unk_100019118, 128, 7);
    v61 = *(_OWORD *)(v1 + 80);
    v60[5] = *(_OWORD *)(v1 + 64);
    v60[6] = v61;
    v60[7] = *(_OWORD *)(v1 + 96);
    v62 = *(_OWORD *)(v1 + 16);
    v60[1] = *(_OWORD *)v1;
    v60[2] = v62;
    v63 = *(_OWORD *)(v1 + 48);
    v60[3] = *(_OWORD *)(v1 + 32);
    v60[4] = v63;
    sub_100009634((_QWORD *)v1);
    v64 = v86;
    ForEach<>.init(_:content:)(v97, sub_10000A4E4, v60, v90, v78, v57, v85, v84, v83);
    v44(v49, v4);
    v44(v46, v4);
    v44((char *)v50, v4);
    v65 = v96;
    ((void (*)(char *, char *, uint64_t))v82)(v96, v64, v59);
    v67 = v92;
    v66 = v93;
    v68 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
    v68(v64, v92, v59);
    v69 = v87;
    v70 = v95;
    v68(v87, v95, v59);
    v71 = v88;
    v68(v88, v65, v59);
    v72 = (uint64_t)v89;
    v68(v89, v64, v59);
    v73 = sub_100004E24(&qword_10001D9A8);
    v68((char *)(v72 + *(int *)(v73 + 48)), v69, v59);
    v68((char *)(v72 + *(int *)(v73 + 64)), v71, v59);
    v74 = *(void (**)(char *, uint64_t))(v66 + 8);
    v74(v96, v59);
    v74(v70, v59);
    v74(v67, v59);
    v74(v71, v59);
    v74(v69, v59);
    v74(v64, v59);
    v75 = sub_100004E24(&qword_10001D910);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 56))(v72, 0, 1, v75);
    return sub_100009F9C(v72, v94, &qword_10001D8F0);
  }
}

void *sub_100005BD8(uint64_t a1, char *a2, _QWORD *a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  __int128 *v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  id v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  __int128 *v27;
  __int128 v28;
  unint64_t v29;
  char v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  __int128 *v36;
  __int128 v37;
  unint64_t v38;
  char v39;
  id v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unsigned __int8 *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  int64_t v55;
  _QWORD *v56;
  _OWORD *v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  unint64_t v79;
  __int128 v80;
  __int128 v81;
  char v82[8];
  __int128 v83;
  __int128 v84;
  char v85[8];
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  _QWORD *v89;
  CGRect v90;

  v5 = v4;
  v75 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  v74 = *(_QWORD *)(v75 - 8);
  __chkstk_darwin(v75);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)*((_QWORD *)v4 + 8);
  v12 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!v11[2])
  {
    a3 = &_swiftEmptyArrayStorage;
    goto LABEL_31;
  }
  v4 = (unsigned __int8 *)*((_QWORD *)v4 + 8);
  v13 = sub_10000F764(a1);
  if ((v14 & 1) == 0)
    goto LABEL_9;
  v4 = (unsigned __int8 *)*((_QWORD *)v5 + 7);
  if (!*((_QWORD *)v4 + 2))
    goto LABEL_9;
  v15 = (__int128 *)(v11[7] + 32 * v13);
  v16 = *v15;
  v80 = v15[1];
  v81 = v16;
  v17 = sub_10000F764(a1);
  if ((v18 & 1) == 0
    || (v19 = *(id *)(*((_QWORD *)v4 + 7) + 8 * v17),
        LOBYTE(v4) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter(),
        v3 = v4,
        v19,
        !(_BYTE)v4))
  {
LABEL_9:
    v22 = (uint64_t)&_swiftEmptyArrayStorage;
    if (v11[2])
      goto LABEL_10;
    goto LABEL_29;
  }
  v20 = sub_1000070E8(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  v3 = *((_QWORD *)v20 + 2);
  v21 = *((_QWORD *)v20 + 3);
  v22 = (uint64_t)v20;
  v23 = v3 + 1;
  if (v3 >= v21 >> 1)
    goto LABEL_71;
  while (1)
  {
    *(_QWORD *)(v22 + 16) = v23;
    v24 = v22 + 40 * v3;
    *(_BYTE *)(v24 + 32) = (_BYTE)v4;
    *(_OWORD *)(v24 + 40) = v81;
    *(_OWORD *)(v24 + 56) = v80;
    if (!v11[2])
    {
LABEL_29:
      a3 = (_QWORD *)v22;
      goto LABEL_31;
    }
LABEL_10:
    LOBYTE(v4) = (_BYTE)v11;
    v25 = sub_10000F764((uint64_t)a2);
    if ((v26 & 1) != 0)
    {
      v4 = (unsigned __int8 *)*((_QWORD *)v5 + 7);
      if (*((_QWORD *)v4 + 2))
      {
        v27 = (__int128 *)(v11[7] + 32 * v25);
        v28 = *v27;
        v80 = v27[1];
        v81 = v28;
        v29 = sub_10000F764((uint64_t)a2);
        if ((v30 & 1) != 0)
        {
          v31 = *(id *)(*((_QWORD *)v4 + 7) + 8 * v29);
          LOBYTE(v4) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();
          v3 = v4;

          if ((_BYTE)v4)
          {
            if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
              v22 = (uint64_t)sub_1000070E8(0, *(_QWORD *)(v22 + 16) + 1, 1, (char *)v22);
            v3 = *(_QWORD *)(v22 + 16);
            v32 = *(_QWORD *)(v22 + 24);
            if (v3 >= v32 >> 1)
              v22 = (uint64_t)sub_1000070E8((char *)(v32 > 1), v3 + 1, 1, (char *)v22);
            *(_QWORD *)(v22 + 16) = v3 + 1;
            v33 = v22 + 40 * v3;
            *(_BYTE *)(v33 + 32) = (_BYTE)v4;
            *(_OWORD *)(v33 + 40) = v81;
            *(_OWORD *)(v33 + 56) = v80;
          }
        }
      }
    }
    if (!v11[2])
      goto LABEL_29;
    LOBYTE(v4) = (_BYTE)v11;
    v34 = sub_10000F764((uint64_t)a3);
    if ((v35 & 1) == 0)
      goto LABEL_29;
    v4 = (unsigned __int8 *)*((_QWORD *)v5 + 7);
    if (!*((_QWORD *)v4 + 2))
      goto LABEL_29;
    v36 = (__int128 *)(v11[7] + 32 * v34);
    v37 = *v36;
    v80 = v36[1];
    v81 = v37;
    v38 = sub_10000F764((uint64_t)a3);
    if ((v39 & 1) == 0)
      goto LABEL_29;
    v40 = *(id *)(*((_QWORD *)v4 + 7) + 8 * v38);
    LOBYTE(v4) = dispatch thunk of CAFSeatBeltObservable.seatBeltIndicator.getter();
    v3 = v4;

    if (!(_BYTE)v4)
      goto LABEL_29;
    if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
      v22 = (uint64_t)sub_1000070E8(0, *(_QWORD *)(v22 + 16) + 1, 1, (char *)v22);
    v3 = *(_QWORD *)(v22 + 16);
    v41 = *(_QWORD *)(v22 + 24);
    v42 = (char *)v22;
    if (v3 >= v41 >> 1)
      v42 = sub_1000070E8((char *)(v41 > 1), v3 + 1, 1, (char *)v22);
    *((_QWORD *)v42 + 2) = v3 + 1;
    a3 = v42;
    v43 = &v42[40 * v3];
    v43[32] = (char)v4;
    *(_OWORD *)(v43 + 40) = v81;
    *(_OWORD *)(v43 + 56) = v80;
LABEL_31:
    *(_QWORD *)&v80 = a3[2];
    if (!(_QWORD)v80)
      break;
    v23 = 0;
    v78 = a3 + 4;
    v22 = 40;
    v5 = (unsigned __int8 *)&qword_10001DA40;
    a2 = (char *)v12;
    v76 = v12;
    v11 = &qword_10001DA48;
    v73 = v10;
    v77 = a3;
    while (1)
    {
      v21 = a3[2];
      if (!*((_QWORD *)a2 + 2))
      {
        if (v23 >= v21)
          goto LABEL_69;
        v45 = (unsigned __int8 *)&v78[5 * v23];
        v3 = *v45;
        v46 = *((_QWORD *)v45 + 1);
        v81 = *((_OWORD *)v45 + 1);
        v47 = *((_QWORD *)v45 + 4);
        if ((swift_isUniquelyReferenced_nonNull_native(a2) & 1) == 0)
          a2 = sub_1000070E8(0, 1, 1, a2);
        v12 = *((_QWORD *)a2 + 2);
        v48 = *((_QWORD *)a2 + 3);
        v4 = (unsigned __int8 *)(v12 + 1);
        if (v12 >= v48 >> 1)
          a2 = sub_1000070E8((char *)(v48 > 1), v12 + 1, 1, a2);
        *((_QWORD *)a2 + 2) = v4;
        v49 = &a2[40 * v12];
        v49[32] = v3;
        *((_QWORD *)v49 + 5) = v46;
        *((_OWORD *)v49 + 3) = v81;
        *((_QWORD *)v49 + 8) = v47;
        v21 = a3[2];
      }
      if (v23 >= v21)
        break;
      v12 = v23 + 1;
      v90 = CGRectOffset(*(CGRect *)&v78[5 * v23 + 1], 1.0, 0.0);
      v79 = v23 + 1;
      if (v23 + 1 >= (unint64_t)v80)
        goto LABEL_52;
      v21 = v77[2];
      if (v12 >= v21)
        goto LABEL_68;
      v3 = (unint64_t)&v78[5 * v12];
      v4 = (unsigned __int8 *)(v3 + 8);
      a3 = (_QWORD *)(v3 + 32);
      if (CGRectIntersectsRect(v90, *(CGRect *)(v3 + 8)))
      {
        v21 = v77[2];
        if (v12 >= v21)
          goto LABEL_70;
        v3 = *(unsigned __int8 *)v3;
        v50 = *(_QWORD *)v4;
        v81 = *(_OWORD *)(v4 + 8);
        v51 = *a3;
        if ((swift_isUniquelyReferenced_nonNull_native(a2) & 1) == 0)
          a2 = sub_1000070E8(0, *((_QWORD *)a2 + 2) + 1, 1, a2);
        v53 = *((_QWORD *)a2 + 2);
        v52 = *((_QWORD *)a2 + 3);
        v4 = (unsigned __int8 *)(v53 + 1);
        if (v53 >= v52 >> 1)
          a2 = sub_1000070E8((char *)(v52 > 1), v53 + 1, 1, a2);
        *((_QWORD *)a2 + 2) = v4;
        v54 = &a2[40 * v53];
        v54[32] = v3;
        *((_QWORD *)v54 + 5) = v50;
        *((_OWORD *)v54 + 3) = v81;
        *((_QWORD *)v54 + 8) = v51;
        a3 = v77;
      }
      else
      {
LABEL_52:
        v55 = *((_QWORD *)a2 + 2);
        if (v55)
        {
          v89 = &_swiftEmptyArrayStorage;
          sub_100008208(0, v55, 0);
          v56 = v89;
          v57 = a2 + 56;
          do
          {
            v58 = *(v57 - 1);
            v59 = *v57;
            v82[0] = *((_BYTE *)v57 - 24);
            v83 = v58;
            v84 = v59;
            v60 = sub_100004E24(&qword_10001DA40);
            v61 = sub_100004E24(&qword_10001DA48);
            swift_dynamicCast(v85, v82, v60, v61, 7);
            v62 = v85[0];
            v63 = v86;
            v81 = v87;
            v64 = v88;
            if ((swift_isUniquelyReferenced_nonNull_native(v56) & 1) == 0)
            {
              sub_100008208(0, v56[2] + 1, 1);
              v56 = v89;
            }
            v66 = v56[2];
            v65 = v56[3];
            if (v66 >= v65 >> 1)
            {
              sub_100008208(v65 > 1, v66 + 1, 1);
              v56 = v89;
            }
            v56[2] = v66 + 1;
            v67 = (char *)&v56[5 * v66];
            v67[32] = v62;
            *((_QWORD *)v67 + 5) = v63;
            *((_OWORD *)v67 + 3) = v81;
            *((_QWORD *)v67 + 8) = v64;
            v57 = (_OWORD *)((char *)v57 + 40);
            --v55;
          }
          while (v55);
          v68 = swift_bridgeObjectRelease(a2);
          v10 = v73;
          a2 = (char *)&_swiftEmptyArrayStorage;
        }
        else
        {
          v68 = swift_bridgeObjectRelease(a2);
          a2 = (char *)&_swiftEmptyArrayStorage;
          v56 = &_swiftEmptyArrayStorage;
        }
        UUID.init()(v68);
        *(_QWORD *)&v10[*(int *)(v75 + 20)] = v56;
        v12 = v76;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v76);
        a3 = v77;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v12 = sub_100006EE0(0, *(_QWORD *)(v12 + 16) + 1, 1, v12);
        v3 = *(_QWORD *)(v12 + 16);
        v70 = *(_QWORD *)(v12 + 24);
        v4 = (unsigned __int8 *)(v3 + 1);
        if (v3 >= v70 >> 1)
          v12 = sub_100006EE0(v70 > 1, v3 + 1, 1, v12);
        *(_QWORD *)(v12 + 16) = v4;
        v44 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
        v76 = v12;
        sub_1000099A8((uint64_t)v10, v12 + v44 + *(_QWORD *)(v74 + 72) * v3);
      }
      v23 = v79;
      if (v79 == (_QWORD)v80)
      {
        swift_bridgeObjectRelease(a3);
        swift_bridgeObjectRelease(a2);
        return (void *)v76;
      }
    }
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    v22 = (uint64_t)sub_1000070E8((char *)(v21 > 1), v23, 1, (char *)v22);
  }
  swift_bridgeObjectRelease(a3);
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100006388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  _OWORD *v7;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  _OWORD *v58;
  __int128 v59;
  id v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v71;
  double *v72;
  uint64_t result;
  uint64_t v74;
  char *v75;
  _OWORD *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  _OWORD v85[3];

  v80 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v80);
  v7 = (_OWORD *)((char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  v78 = *(char **)(v8 - 8);
  v9 = *((_QWORD *)v78 + 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004E24(&qword_10001D970);
  __chkstk_darwin(v11);
  v84 = (uint64_t *)((char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v79 = sub_100004E24(&qword_10001D960);
  __chkstk_darwin(v79);
  v83 = (uint64_t)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100004E24(&qword_10001D950);
  __chkstk_darwin(v81);
  v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100004E24(&qword_10001D940);
  __chkstk_darwin(v16);
  v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a1 + *(int *)(v8 + 20));
  if (*(_QWORD *)(v19 + 16) && (v20 = *(double *)(v19 + 40), sub_100006CF0(), *(_QWORD *)(v19 + 16)))
  {
    v22 = v21;
    v82 = v16;
    v23 = *(double *)(a2 + 72);
    v24 = *(double *)(a2 + 80);
    v25 = *(double *)(v19 + 48);
    sub_100006CF0();
    v27 = v26;
    v28 = static Alignment.center.getter();
    v29 = v84;
    *v84 = v28;
    v29[1] = v30;
    v31 = (char *)v29 + *(int *)(sub_100004E24(&qword_10001D9B0) + 44);
    v32 = sub_100006954();
    v77 = v32[2];
    if (NSNotFound.getter())
    {
      sub_100009C78(a1, (uint64_t)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SeatBeltsView.CombinedFrames);
      v33 = v78[80];
      v75 = v31;
      v34 = v18;
      v35 = a3;
      v36 = (v33 + 16) & ~v33;
      v76 = v7;
      v37 = (v9 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
      v78 = v15;
      v38 = (v37 + 119) & 0xFFFFFFFFFFFFFFF8;
      v39 = swift_allocObject(&unk_100019140, v38 + 8, v33 | 7);
      v40 = v39 + v36;
      a3 = v35;
      v18 = v34;
      sub_1000099A8((uint64_t)v10, v40);
      v41 = (_OWORD *)(v39 + v37);
      v7 = v76;
      v42 = *(_OWORD *)(a2 + 80);
      v41[4] = *(_OWORD *)(a2 + 64);
      v41[5] = v42;
      v41[6] = *(_OWORD *)(a2 + 96);
      v43 = *(_OWORD *)(a2 + 16);
      *v41 = *(_OWORD *)a2;
      v41[1] = v43;
      v44 = *(_OWORD *)(a2 + 48);
      v41[2] = *(_OWORD *)(a2 + 32);
      v41[3] = v44;
      *(_QWORD *)(v39 + v38) = v32;
      sub_100009634((_QWORD *)a2);
      v45 = sub_100004E24(&qword_10001D9B8);
      v46 = sub_100009A58(&qword_10001D9C0, &qword_10001D9B8, (void (*)(void))sub_100009AC4);
      v47 = v75;
      v48 = v45;
      v15 = v78;
      ForEach<>.init(_:content:)(0, v77, sub_1000099EC, v39, v48, v46);
      v49 = sub_100004E24(&qword_10001DA28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v47, 0, 1, v49);
    }
    else
    {
      swift_bridgeObjectRelease(v32);
      v50 = sub_100004E24(&qword_10001DA28);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v31, 1, 1, v50);
    }
    sub_100006CF0();
    v52 = v51;
    v53 = *(_QWORD *)(a2 + 48);
    v54 = static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)(v85, v52, 0, v53, 0, v54, v55);
    v57 = v83;
    v56 = v84;
    sub_100009CF8((uint64_t)v84, v83, &qword_10001D970);
    v58 = (_OWORD *)(v57 + *(int *)(v79 + 36));
    v59 = v85[1];
    *v58 = v85[0];
    v58[1] = v59;
    v58[2] = v85[2];
    sub_100009FE0((uint64_t)v56, &qword_10001D970);
    v60 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray6Color");
    v61 = Color.init(uiColor:)(v60);
    LOBYTE(v52) = static Edge.Set.all.getter();
    sub_100009CF8(v57, (uint64_t)v15, &qword_10001D960);
    v62 = &v15[*(int *)(v81 + 36)];
    *(_QWORD *)v62 = v61;
    v62[8] = v52;
    sub_100009FE0(v57, &qword_10001D960);
    v63 = (char *)v7 + *(int *)(v80 + 20);
    v64 = enum case for RoundedCornerStyle.continuous(_:);
    v65 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104))(v63, v64, v65);
    __asm { FMOV            V0.2D, #10.0 }
    *v7 = _Q0;
    v71 = (uint64_t)&v18[*(int *)(v82 + 36)];
    sub_100009C78((uint64_t)v7, v71, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v71 + *(int *)(sub_100004E24(&qword_10001D990) + 36)) = 256;
    sub_100009CF8((uint64_t)v15, (uint64_t)v18, &qword_10001D950);
    sub_100009CBC((uint64_t)v7);
    sub_100009FE0((uint64_t)v15, &qword_10001D950);
    sub_100009CF8((uint64_t)v18, a3, &qword_10001D940);
    v72 = (double *)(a3 + *(int *)(sub_100004E24(&qword_10001D920) + 36));
    *v72 = v20 + v22 * 0.5 + v23;
    v72[1] = v24 + v25 + v27 * 0.5;
    return sub_100009FE0((uint64_t)v18, &qword_10001D940);
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ELL, 0x8000000100013040, "Closures/SeatBeltsView.swift", 28, 2, 143, 0);
    __break(1u);
  }
  return result;
}

void *sub_100006954()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SeatBeltsView.CombinedFrames(0) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain(v1);
    sub_100008224(0, v2, 0);
    v3 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
    v4 = 32;
    do
    {
      v5 = *(_BYTE *)(v1 + v4);
      v6 = *((_QWORD *)&_swiftEmptyArrayStorage + 3);
      if (v3 >= v6 >> 1)
        sub_100008224(v6 > 1, v3 + 1, 1);
      *((_QWORD *)&_swiftEmptyArrayStorage + 2) = v3 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage + v3 + 32) = v5;
      v4 += 40;
      ++v3;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(v1);
  }
  return &_swiftEmptyArrayStorage;
}

void sub_100006A3C(unint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  double v17;
  double Width;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  CGRect v59;

  v11 = sub_100004E24(&qword_10001DA30);
  __chkstk_darwin(v11);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(a2 + *(int *)(v14 + 20));
  if (*(_QWORD *)(v15 + 16) <= a1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = 0xD000000000000016;
  v16 = (double *)(v15 + 40 * a1);
  v17 = v16[5];
  v59.origin.y = v16[6];
  v59.size.width = v16[7];
  v59.size.height = v16[8];
  v59.origin.x = v17;
  Width = CGRectGetWidth(v59);
  if (!*(_QWORD *)(v15 + 16))
  {
LABEL_12:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v5 + 8, 0x8000000100013040, "Closures/SeatBeltsView.swift", 28, 2, 143, 0);
    __break(1u);
    return;
  }
  v19 = Width;
  v20 = *(double *)(v15 + 40);
  v21 = a3[6];
  v22 = Image.init(systemName:)(0xD000000000000016, 0x8000000100013060);
  v23 = a3[1];
  v24 = *a3;
  v25 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v13, 1, 1, v25);
  v5 = static Font.system(size:weight:design:)(*(_QWORD *)&v24, 0, v13, v23);
  sub_100009FE0((uint64_t)v13, &qword_10001DA30);
  KeyPath = swift_getKeyPath(&unk_100014AC0);
  v27 = *((_QWORD *)a3 + 2);
  v28 = *((_QWORD *)a3 + 3);
  v29 = static Alignment.center.getter();
  v31 = _FrameLayout.init(width:height:alignment:)(&v53, v27, 0, v28, 0, v29, v30);
  if (*(_QWORD *)(a4 + 16) <= a1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v49 = KeyPath;
  v50 = v5;
  v32 = v22;
  v33 = v53;
  v34 = v54;
  v35 = v55;
  v36 = v56;
  v37 = v58;
  v48 = v57;
  if (*(_BYTE *)(a4 + a1 + 32) == 2)
    v38 = static Color.red.getter(v31);
  else
    v38 = static Color.green.getter(v31);
  v39 = v38;
  v40 = v17 + v19 * 0.5 - v20;
  v41 = swift_getKeyPath(&unk_100014AF0);
  v42 = *((_QWORD *)a3 + 4);
  v43 = *((_QWORD *)a3 + 5);
  v44 = static UnitPoint.center.getter();
  v52 = v34;
  v51 = v36;
  v45 = v49;
  *(_QWORD *)a5 = v32;
  *(_QWORD *)(a5 + 8) = v45;
  *(_QWORD *)(a5 + 16) = v50;
  *(_QWORD *)(a5 + 24) = v33;
  *(_BYTE *)(a5 + 32) = v34;
  *(_QWORD *)(a5 + 40) = v35;
  *(_BYTE *)(a5 + 48) = v36;
  *(_QWORD *)(a5 + 56) = v48;
  *(_QWORD *)(a5 + 64) = v37;
  *(_QWORD *)(a5 + 72) = v41;
  *(_QWORD *)(a5 + 80) = v39;
  *(_QWORD *)(a5 + 88) = v42;
  *(_QWORD *)(a5 + 96) = v43;
  *(double *)(a5 + 104) = v44;
  *(_QWORD *)(a5 + 112) = v46;
  *(double *)(a5 + 120) = v40;
  *(double *)(a5 + 128) = v21 * 0.5;
}

void sub_100006CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CGFloat *v4;
  double Height;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v10;
  CGRect v11;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SeatBeltsView.CombinedFrames(0) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    CGRectGetWidth(*(CGRect *)(v1 + 40 * v2));
    v3 = *(_QWORD *)(v1 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain(v1);
      v4 = (CGFloat *)(v1 + 64);
      Height = 0.0;
      do
      {
        v6 = *(v4 - 3);
        v7 = *(v4 - 2);
        v8 = *(v4 - 1);
        v9 = *v4;
        v10.origin.x = v6;
        v10.origin.y = v7;
        v10.size.width = v8;
        v10.size.height = *v4;
        if (Height < CGRectGetHeight(v10))
        {
          v11.origin.x = v6;
          v11.origin.y = v7;
          v11.size.width = v8;
          v11.size.height = v9;
          Height = CGRectGetHeight(v11);
        }
        v4 += 5;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease(v1);
    }
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000054, 0x80000001000130E0, "Closures/SeatBeltsView.swift", 28, 2, 133, 0);
    __break(1u);
  }
}

uint64_t sub_100006E40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100006E80()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006E98@<X0>(uint64_t a1@<X8>)
{
  return sub_100005408(a1);
}

uint64_t sub_100006EE0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100004E24(&qword_10001DA58);
  v11 = *(_QWORD *)(type metadata accessor for SeatBeltsView.CombinedFrames(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100009E84(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

char *sub_1000070E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100004E24(&qword_10001DA50);
      v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[40 * v8 + 32])
          memmove(v13, a4 + 32, 40 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_100009D98(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007208(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for CAUVehicleLayoutKey(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_10000F764(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = *(_QWORD *)(v21 + 8 * v14);
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100007D8C();
    goto LABEL_7;
  }
  sub_100007504(v17, a3 & 1);
  v23 = sub_10000F764(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_100007C40(v14, (uint64_t)v11, a1, v20);
  return 0;
}

uint64_t sub_100007364@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  _QWORD *v7;
  _QWORD **v8;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  unsigned __int8 v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t result;
  unsigned __int8 v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  char v31;
  uint64_t v32;
  uint64_t v33;

  v8 = (_QWORD **)v7;
  v33 = type metadata accessor for CAUVehicleLayoutKey(0);
  v16 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (_QWORD *)*v7;
  v21 = sub_10000F764(a1);
  v22 = v19[2];
  v23 = v20 ^ 1;
  result = v22 + ((v20 ^ 1) & 1);
  if (__OFADD__(v22, (v20 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    v25 = v20;
    v26 = v19[3];
    if (v26 >= result && (a2 & 1) != 0)
    {
LABEL_7:
      v27 = *v8;
      if ((v25 & 1) != 0)
      {
LABEL_8:
        v28 = v27[7] + 32 * v21;
        v29 = *(_OWORD *)v28;
        v30 = *(_OWORD *)(v28 + 16);
        *(double *)v28 = a4;
        *(double *)(v28 + 8) = a5;
        *(double *)(v28 + 16) = a6;
        *(double *)(v28 + 24) = a7;
LABEL_12:
        *(_OWORD *)a3 = v29;
        *(_OWORD *)(a3 + 16) = v30;
        *(_BYTE *)(a3 + 32) = v23 & 1;
        return result;
      }
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v33);
      result = sub_100007CD8(v21, (uint64_t)v18, v27, a4, a5, a6, a7);
      v29 = 0uLL;
      v30 = 0uLL;
      goto LABEL_12;
    }
    if (v26 >= result && (a2 & 1) == 0)
    {
      result = (uint64_t)sub_100007FB4();
      goto LABEL_7;
    }
    sub_100007898(result, a2 & 1);
    result = sub_10000F764(a1);
    if ((v25 & 1) == (v31 & 1))
    {
      v21 = result;
      v27 = *v8;
      if ((v25 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v33);
  __break(1u);
  return result;
}

uint64_t sub_100007504(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t i;
  int v45;

  v3 = v2;
  v6 = type metadata accessor for CAUVehicleLayoutKey(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100004E24(&qword_10001D8D8);
  v45 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_43;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v43 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v41 = v2;
  v42 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain(v10);
  v19 = 0;
  for (i = v10; ; v10 = i)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v42)
      break;
    v24 = v43;
    v25 = v43[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v42)
        goto LABEL_36;
      v25 = v43[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_36:
          swift_release(v10);
          v3 = v41;
          if ((v45 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v19 >= v42)
              goto LABEL_36;
            v25 = v43[v19];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v19 = v26;
      }
    }
LABEL_23:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v7 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v45 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v28, v6);
      v29 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v22);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28, v6);
      v29 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v22);
    }
    v30 = *(_QWORD *)(v12 + 40);
    v31 = sub_100004DE4(&qword_10001D8E0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v30, v6, v31);
    v32 = -1 << *(_BYTE *)(v12 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v17 + 8 * v34);
      }
      while (v38 == -1);
      v20 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v6);
    *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v20) = v29;
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release(v10);
  v3 = v41;
  v24 = v43;
  if ((v45 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v10 + 32);
  if (v39 >= 64)
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v39;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_43:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

uint64_t sub_100007898(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t *v47;
  int64_t v48;
  _QWORD *v49;
  uint64_t v50;

  v5 = type metadata accessor for CAUVehicleLayoutKey(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = v2;
  v9 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100004E24(&qword_10001D8E8);
  v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = swift_release(v9);
    v43 = v47;
LABEL_44:
    *v43 = v11;
    return result;
  }
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v49 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v48 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain(v9);
  v18 = 0;
  v46 = a2;
  v19 = 16;
  if ((a2 & 1) != 0)
    v19 = 32;
  v50 = v19;
  while (1)
  {
    if (v15)
    {
      v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v23 = v22 | (v18 << 6);
      goto LABEL_26;
    }
    v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v24 >= v48)
    {
      swift_release(v9);
      v43 = v47;
      v25 = v49;
      if ((v46 & 1) != 0)
      {
LABEL_39:
        v44 = 1 << *(_BYTE *)(v9 + 32);
        if (v44 >= 64)
          bzero(v25, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v25 = -1 << v44;
        *(_QWORD *)(v9 + 16) = 0;
      }
LABEL_43:
      result = swift_release(v9);
      goto LABEL_44;
    }
    v25 = v49;
    v26 = v49[v24];
    ++v18;
    if (!v26)
    {
      v18 = v24 + 1;
      if (v24 + 1 >= v48)
        goto LABEL_36;
      v26 = v49[v18];
      if (!v26)
        break;
    }
LABEL_25:
    v15 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v18 << 6);
LABEL_26:
    v28 = *(_QWORD *)(v6 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + v50))(v8, *(_QWORD *)(v9 + 48) + v28 * v23, v5);
    v29 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 32 * v23);
    v31 = v29[2];
    v30 = v29[3];
    v33 = *v29;
    v32 = v29[1];
    v34 = *(_QWORD *)(v11 + 40);
    v35 = sub_100004DE4(&qword_10001D8E0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v34, v5, v35);
    v36 = -1 << *(_BYTE *)(v11 + 32);
    v37 = result & ~v36;
    v38 = v37 >> 6;
    if (((-1 << v37) & ~*(_QWORD *)(v16 + 8 * (v37 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v37) & ~*(_QWORD *)(v16 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v39 = 0;
      v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v41 = v38 == v40;
        if (v38 == v40)
          v38 = 0;
        v39 |= v41;
        v42 = *(_QWORD *)(v16 + 8 * v38);
      }
      while (v42 == -1);
      v20 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v28 * v20, v8, v5);
    v21 = (_QWORD *)(*(_QWORD *)(v11 + 56) + 32 * v20);
    *v21 = v33;
    v21[1] = v32;
    v21[2] = v31;
    v21[3] = v30;
    ++*(_QWORD *)(v11 + 16);
  }
  v27 = v24 + 2;
  if (v27 >= v48)
  {
LABEL_36:
    swift_release(v9);
    v43 = v47;
    if ((v46 & 1) != 0)
      goto LABEL_39;
    goto LABEL_43;
  }
  v26 = v49[v27];
  if (v26)
  {
    v18 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v18 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v18 >= v48)
      goto LABEL_36;
    v26 = v49[v18];
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_100007C40(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for CAUVehicleLayoutKey(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_100007CD8(unint64_t a1, uint64_t a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  double *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  a3[(a1 >> 6) + 8] |= 1 << a1;
  v14 = a3[6];
  v15 = type metadata accessor for CAUVehicleLayoutKey(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * a1, a2, v15);
  v17 = (double *)(a3[7] + 32 * a1);
  *v17 = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  v18 = a3[2];
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    a3[2] = v20;
  return result;
}

id sub_100007D8C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = type metadata accessor for CAUVehicleLayoutKey(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E24(&qword_10001D8D8);
  v24 = v0;
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release(v5);
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100007FB4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(unint64_t, char *, uint64_t);
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __int128 v32;

  v1 = v0;
  v2 = type metadata accessor for CAUVehicleLayoutKey(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E24(&qword_10001D8E8);
  v6 = *v0;
  v7 = static _DictionaryStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_28:
    *v1 = v8;
    return result;
  }
  v30 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v31 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
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
    v27 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v27 >= v16)
      goto LABEL_26;
    v28 = *(_QWORD *)(v31 + 8 * v27);
    ++v12;
    if (!v28)
    {
      v12 = v27 + 1;
      if (v27 + 1 >= v16)
        goto LABEL_26;
      v28 = *(_QWORD *)(v31 + 8 * v12);
      if (!v28)
        break;
    }
LABEL_25:
    v15 = (v28 - 1) & v28;
    v18 = __clz(__rbit64(v28)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 32 * v18;
    v21 = *(_QWORD *)(v6 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 24);
    v24 = *(_QWORD *)(v8 + 48) + v19;
    v25 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
    v32 = *(_OWORD *)(v21 + 8);
    result = (void *)v25(v24, v5, v2);
    v26 = *(_QWORD *)(v8 + 56) + v20;
    *(_QWORD *)v26 = v22;
    *(_OWORD *)(v26 + 8) = v32;
    *(_QWORD *)(v26 + 24) = v23;
  }
  v29 = v27 + 2;
  if (v29 >= v16)
  {
LABEL_26:
    result = (void *)swift_release(v6);
    v1 = v30;
    goto LABEL_28;
  }
  v28 = *(_QWORD *)(v31 + 8 * v29);
  if (v28)
  {
    v12 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v28 = *(_QWORD *)(v31 + 8 * v12);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100008208(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100008240(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100008224(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1000083B4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100008240(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004E24(&qword_10001DA60);
    v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[40 * v8])
      memmove(v13, v14, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[40 * v8] || v13 >= &v14[40 * v8])
  {
    memcpy(v13, v14, 40 * v8);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000083B4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004E24(&qword_10001DA38);
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
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100008500(uint64_t result)
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
      sub_100004E24(&qword_10001D8C0);
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
    v13 = sub_100004DE4(&qword_10001D8C8, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v12, v13);
    v14 = -1 << *((_BYTE *)v4 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
    v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      v19 = ~v14;
      v20 = sub_100004DE4(&qword_10001D8D0, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
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

uint64_t sub_100008794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  double Width;
  double v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  Swift::String v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  Swift::String v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  char v80;
  void *v81;
  uint64_t v82;
  CGFloat Height;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  double *v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  unint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  unint64_t v123;
  void *v124;
  char v125[16];
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v117 = a2;
  v98 = a3;
  v10 = sub_100004E24(&qword_10001D868);
  __chkstk_darwin(v10);
  v110 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = sub_100004E24(&qword_10001D870);
  v108 = *(_QWORD *)(v109 - 8);
  __chkstk_darwin(v109);
  v107 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100004E24(&qword_10001D878);
  __chkstk_darwin(v13);
  v15 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v118 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for CAUVehicleLayoutKey(0);
  v119 = *(_QWORD *)(v19 - 8);
  v20 = *(_QWORD *)(v119 + 64);
  v21 = __chkstk_darwin(v19);
  v106 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v21);
  v120 = (uint64_t)&v95 - v23;
  v24 = static Font.Weight.medium.getter(v22);
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v25 = (void *)sub_100008500((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v25 = &_swiftEmptySetSingleton;
  }
  v124 = v25;
  v95 = type metadata accessor for SeatBeltViewUpdater();
  result = swift_allocObject(v95, 16, 7);
  v111 = result;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v94 = a1;
    else
      v94 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v27 = _CocoaArrayWrapper.endIndex.getter(v94);
    result = swift_bridgeObjectRelease(a1);
  }
  else
  {
    v27 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v97 = a5;
  v96 = a4;
  if (!v27)
  {
    swift_bridgeObjectRelease(a1);
    v84 = &_swiftEmptyDictionarySingleton;
    Width = 1.79769313e308;
    v85 = &_swiftEmptyDictionarySingleton;
    v30 = 1.79769313e308;
LABEL_25:
    v86 = sub_100004DE4(&qword_10001D888, (uint64_t (*)(uint64_t))type metadata accessor for SeatBeltViewUpdater, (uint64_t)"5G");
    v87 = ObservedObject.init(wrappedValue:)(v111, v95, v86);
    v89 = v88;
    v90 = type metadata accessor for CAUVehicleLayout(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 8))(v117, v90);
    v91 = v124;
    v92 = v98;
    *v98 = v24;
    *(_OWORD *)(v92 + 1) = xmmword_100014A00;
    v92[3] = 60.0;
    v92[4] = Width / 48.0;
    v92[5] = v30 / 60.0;
    v92[6] = v30;
    *((_QWORD *)v92 + 7) = v85;
    *((_QWORD *)v92 + 8) = v84;
    v93 = v97;
    v92[9] = v96;
    v92[10] = v93;
    *((_QWORD *)v92 + 11) = v91;
    *((_QWORD *)v92 + 12) = v87;
    *((_QWORD *)v92 + 13) = v89;
    return result;
  }
  if (v27 >= 1)
  {
    v28 = 0;
    v114 = a1 & 0xC000000000000001;
    v100 = v20 + 7;
    Width = 1.79769313e308;
    v99 = (void *)0x8000000100012FD0;
    v116 = &_swiftEmptyDictionarySingleton;
    v115 = &_swiftEmptyDictionarySingleton;
    v30 = 1.79769313e308;
    v31 = v120;
    v113 = v27;
    v105 = a1;
    v104 = v15;
    v103 = v16;
    v102 = v17;
    v101 = v19;
    do
    {
      if (v114)
        v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, a1);
      else
        v38 = *(id *)(a1 + 8 * v28 + 32);
      v39 = v38;
      v40 = sub_100004E64(0, &qword_10001D880, CAFSeatBelt_ptr);
      v41 = v31;
      v42 = CAFPositionedRequired.layoutKey.getter();
      v43 = CAUVehicleLayout.infos.getter(v42);
      if (*(_QWORD *)(v43 + 16) && (v44 = sub_10000F764(v41), (v45 & 1) != 0))
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v15, *(_QWORD *)(v43 + 56) + *(_QWORD *)(v17 + 72) * v44, v16);
        v46 = 0;
      }
      else
      {
        v46 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, v46, 1, v16);
      swift_bridgeObjectRelease(v43);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
      {
        sub_100009FE0((uint64_t)v15, &qword_10001D878);
        v122 = 0;
        v123 = 0xE000000000000000;
        _StringGuts.grow(_:)(36);
        v32._countAndFlagsBits = 0x746C654274616553;
        v32._object = (void *)0xEE00203A79656B20;
        String.append(_:)(v32);
        v33 = v120;
        _print_unlocked<A, B>(_:_:)(v120, &v122, v19, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v34._countAndFlagsBits = 0xD000000000000014;
        v34._object = v99;
        String.append(_:)(v34);
        v35 = v123;
        sub_10000AC88(v122, v123);

        v36 = v35;
        v31 = v33;
        swift_bridgeObjectRelease(v36);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v118, v15, v16);
        v122 = 0;
        v123 = 0xE000000000000000;
        _StringGuts.grow(_:)(16);
        v47._countAndFlagsBits = 0x746C654274616553;
        v47._object = (void *)0xEE00203A79656B20;
        String.append(_:)(v47);
        _print_unlocked<A, B>(_:_:)(v120, &v122, v19, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v48 = v123;
        sub_10000AC88(v122, v123);
        swift_bridgeObjectRelease(v48);
        v49 = sub_1000091C8(&qword_10001D890, &qword_10001D880, CAFSeatBelt_ptr, (uint64_t)&protocol conformance descriptor for CAFSeatBelt);
        v112 = (id)CAFObserved<>.observable.getter(v40, v49);
        v122 = dispatch thunk of CAFSeatBeltObservable.$seatBeltIndicator.getter();
        v121 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
        v50 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
        v51 = (uint64_t)v110;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v110, 1, 1, v50);
        v52 = sub_100004E24(&qword_10001D898);
        v53 = sub_100004E64(0, &qword_10001D8A0, NSRunLoop_ptr);
        v54 = sub_10000A478(&qword_10001D8A8, &qword_10001D898, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
        v55 = sub_1000091C8(&qword_10001D8B0, &qword_10001D8A0, NSRunLoop_ptr, (uint64_t)&protocol conformance descriptor for NSRunLoop);
        v56 = v107;
        Publisher.receive<A>(on:options:)(&v121, v51, v52, v53, v54, v55);
        sub_100009FE0(v51, &qword_10001D868);

        swift_release(v122);
        v57 = v119;
        v58 = v106;
        (*(void (**)(char *, uint64_t, uint64_t))(v119 + 16))(v106, v120, v19);
        v59 = *(unsigned __int8 *)(v57 + 80);
        v60 = (v59 + 16) & ~v59;
        v61 = (v100 + v60) & 0xFFFFFFFFFFFFFFF8;
        v62 = (v61 + 15) & 0xFFFFFFFFFFFFFFF8;
        v63 = swift_allocObject(&unk_100019000, v62 + 8, v59 | 7);
        (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v63 + v60, v58, v19);
        *(_QWORD *)(v63 + v61) = v39;
        v64 = v111;
        *(_QWORD *)(v63 + v62) = v111;
        v65 = sub_10000A478(&qword_10001D8B8, &qword_10001D870, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
        v66 = v39;
        swift_retain(v64);
        v67 = v109;
        v68 = Publisher<>.sink(receiveValue:)(sub_1000092D8, v63, v109, v65);
        swift_release(v63);
        (*(void (**)(char *, uint64_t))(v108 + 8))(v56, v67);
        AnyCancellable.store(in:)(&v124);
        v69 = swift_release(v68);
        v70 = (double)(int)CAUVehicleLayoutInfo.x.getter(v69) * a6;
        v71 = (double)(int)CAUVehicleLayoutInfo.y.getter() * a6;
        v72 = (double)(int)CAUVehicleLayoutInfo.width.getter() * a6;
        v73 = (double)(int)CAUVehicleLayoutInfo.height.getter() * a6;
        v74 = (uint64_t)v116;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v116);
        v122 = v74;
        v76 = v120;
        sub_100007364(v120, isUniquelyReferenced_nonNull_native, (uint64_t)v125, v70, v71, v72, v73);
        v77 = v122;
        swift_bridgeObjectRelease(0x8000000000000000);
        v78 = v112;
        v79 = (uint64_t)v115;
        v80 = swift_isUniquelyReferenced_nonNull_native(v115);
        v122 = v79;
        v81 = (void *)sub_100007208((uint64_t)v78, v76, v80);
        v82 = v122;
        swift_bridgeObjectRelease(0x8000000000000000);

        v126.origin.x = v70;
        v126.origin.y = v71;
        v126.size.width = v72;
        v126.size.height = v73;
        if (CGRectGetWidth(v126) < Width)
        {
          v127.origin.x = v70;
          v127.origin.y = v71;
          v127.size.width = v72;
          v127.size.height = v73;
          Width = CGRectGetWidth(v127);
        }
        v115 = (void *)v82;
        v116 = (void *)v77;
        v128.origin.x = v70;
        v128.origin.y = v71;
        v128.size.width = v72;
        v128.size.height = v73;
        Height = CGRectGetHeight(v128);
        a1 = v105;
        if (Height < v30)
        {
          v129.origin.x = v70;
          v129.origin.y = v71;
          v129.size.width = v72;
          v129.size.height = v73;
          v30 = CGRectGetHeight(v129);
        }

        v17 = v102;
        v16 = v103;
        (*(void (**)(char *, uint64_t))(v102 + 8))(v118, v103);
        v15 = v104;
        v19 = v101;
        v31 = v120;
      }
      v37 = v113;
      ++v28;
      (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v31, v19);
    }
    while (v37 != v28);
    swift_bridgeObjectRelease(a1);
    v84 = v116;
    v85 = v115;
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000091C8(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100004E64(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009208(uint64_t *a1)
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

uint64_t sub_10000924C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for CAUVehicleLayoutKey(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release(*(_QWORD *)(v0 + v7));
  return swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_1000092D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for CAUVehicleLayoutKey(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1000052CC(a1, v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t destroy for SeatBeltsView(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[8]);
  swift_bridgeObjectRelease(a1[11]);
  return swift_release(a1[13]);
}

uint64_t initializeWithCopy for SeatBeltsView(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 88);
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v6;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v8;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  swift_retain(v8);
  return a1;
}

_QWORD *assignWithCopy for SeatBeltsView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  v4 = a2[7];
  v5 = a1[7];
  a1[7] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[8];
  v7 = a1[8];
  a1[8] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[9] = a2[9];
  a1[10] = a2[10];
  v8 = a2[11];
  v9 = a1[11];
  a1[11] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[12] = a2[12];
  v10 = a2[13];
  v11 = a1[13];
  a1[13] = v10;
  swift_retain(v10);
  swift_release(v11);
  return a1;
}

__n128 initializeWithTake for SeatBeltsView(uint64_t a1, __int128 *a2)
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
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for SeatBeltsView(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v6 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 104);
  v8 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SeatBeltsView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SeatBeltsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SeatBeltsView()
{
  return &type metadata for SeatBeltsView;
}

uint64_t sub_100009618(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100015188, 1);
}

uint64_t sub_10000962C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100006388(a1, v2 + 16, a2);
}

_QWORD *sub_100009634(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[8];
  v3 = a1[11];
  v4 = a1[13];
  swift_bridgeObjectRetain(a1[7]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

unint64_t sub_100009688()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D938;
  if (!qword_10001D938)
  {
    v1 = sub_100009208(&qword_10001D940);
    sub_10000970C();
    sub_10000A478(&qword_10001D988, &qword_10001D990, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D938);
  }
  return result;
}

unint64_t sub_10000970C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D948;
  if (!qword_10001D948)
  {
    v1 = sub_100009208(&qword_10001D950);
    sub_100009790();
    sub_10000A478(&qword_10001D978, &qword_10001D980, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D948);
  }
  return result;
}

unint64_t sub_100009790()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D958;
  if (!qword_10001D958)
  {
    v1 = sub_100009208(&qword_10001D960);
    sub_10000A478(&qword_10001D968, &qword_10001D970, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D958);
  }
  return result;
}

unint64_t sub_100009814()
{
  unint64_t result;

  result = qword_10001D998;
  if (!qword_10001D998)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _PositionLayout, &type metadata for _PositionLayout);
    atomic_store(result, (unint64_t *)&qword_10001D998);
  }
  return result;
}

uint64_t type metadata accessor for SeatBeltsView.CombinedFrames(uint64_t a1)
{
  uint64_t result;

  result = qword_10001DAC0;
  if (!qword_10001DAC0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SeatBeltsView.CombinedFrames);
  return result;
}

uint64_t sub_10000989C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[9]);
  swift_bridgeObjectRelease(v0[10]);
  swift_bridgeObjectRelease(v0[13]);
  swift_release(v0[15]);
  return swift_deallocObject(v0, 128, 7);
}

uint64_t sub_1000098D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 119) & 0xFFFFFFFFFFFFFFF8;
  v8 = v0 + v4;
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease(*(_QWORD *)(v8 + *(int *)(v1 + 20)));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 64));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 88));
  swift_release(*(_QWORD *)(v0 + v6 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7));
  return swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_1000099A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SeatBeltsView.CombinedFrames(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1000099EC(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(type metadata accessor for SeatBeltsView.CombinedFrames(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100006A3C(a1, v2 + v6, (double *)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 119) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_100009A58(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009208(a2);
    a3();
    sub_100009814();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009AC4()
{
  return sub_100009AE8(&qword_10001D9C8, &qword_10001D9D0, (void (*)(void))sub_100009B50);
}

uint64_t sub_100009AE8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009208(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009B50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D9D8;
  if (!qword_10001D9D8)
  {
    v1 = sub_100009208(&qword_10001D9E0);
    sub_100009AE8(&qword_10001D9E8, &qword_10001D9F0, (void (*)(void))sub_100009BF4);
    sub_10000A478(&qword_10001DA18, &qword_10001DA20, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D9D8);
  }
  return result;
}

unint64_t sub_100009BF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D9F8;
  if (!qword_10001D9F8)
  {
    v1 = sub_100009208(&qword_10001DA00);
    sub_10000A478(&qword_10001DA08, &qword_10001DA10, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D9F8);
  }
  return result;
}

uint64_t sub_100009C78(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009CBC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009CF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004E24(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009D44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009D6C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

char *sub_100009D98(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = (char *)(a4 + 40 * a1 + 32);
  v6 = 40 * v4;
  v7 = &__dst[v6];
  if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
  {
    memcpy(__dst, v5, v6);
    return v7;
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100009E84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for SeatBeltsView.CombinedFrames(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100009F9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004E24(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009FE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004E24(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10000A01C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v10);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = v9;
    swift_bridgeObjectRetain(v9);
  }
  return a1;
}

uint64_t sub_10000A0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20)));
}

uint64_t sub_10000A0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t sub_10000A14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_QWORD *)(a2 + v7);
  v9 = *(_QWORD *)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t sub_10000A1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000A214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_QWORD *)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t sub_10000A278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A284);
}

uint64_t sub_10000A284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000A300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A30C);
}

uint64_t sub_10000A30C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_10000A384(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_10000A3FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DAF8;
  if (!qword_10001DAF8)
  {
    v1 = sub_100009208(&qword_10001D8F0);
    sub_10000A478(&qword_10001DB00, &qword_10001D910, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001DAF8);
  }
  return result;
}

uint64_t sub_10000A478(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009208(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A4B8()
{
  return sub_100004DE4(&qword_10001DB08, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
}

uint64_t sub_10000A4E8()
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
  sub_10000AC4C();
  result = OS_os_log.init(subsystem:category:)(v2, v4, 0x73657275736F6C43, 0xE800000000000000);
  qword_10001E790 = result;
  return result;
}

uint64_t sub_10000A5A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000A674(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000AC10((uint64_t)v12, *a3);
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
      sub_10000AC10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000ABF0(v12);
  return v7;
}

uint64_t sub_10000A674(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000A82C(a5, a6);
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

uint64_t sub_10000A82C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000A8C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000AA98(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000AA98(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000A8C0(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000AA34(v4, 0);
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

_QWORD *sub_10000AA34(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004E24(&qword_10001DB10);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000AA98(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004E24(&qword_10001DB10);
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

uint64_t sub_10000ABE4(uint64_t a1, unint64_t a2)
{
  return sub_10000AC94(a1, a2, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_10000ABF0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000AC10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000AC4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DB18;
  if (!qword_10001DB18)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001DB18);
  }
  return result;
}

uint64_t sub_10000AC88(uint64_t a1, unint64_t a2)
{
  return sub_10000AC94(a1, a2, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_10000AC94(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  os_log_type_t v5;
  NSObject *v6;
  uint64_t result;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3();
  if (qword_10001D4E0 != -1)
    swift_once(&qword_10001D4E0, sub_10000A4E8);
  v6 = qword_10001E790;
  result = os_log_type_enabled((os_log_t)qword_10001E790, v5);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a2, 2);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v11 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    v10 = sub_10000A5A4(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    return swift_slowDealloc(v8, -1, -1);
  }
  return result;
}

uint64_t sub_10000AE04(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  os_log_type_t v10;
  NSObject *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v10 = static os_log_type_t.debug.getter();
  if (qword_10001D4E0 != -1)
    swift_once(&qword_10001D4E0, sub_10000A4E8);
  v11 = qword_10001E790;
  result = os_log_type_enabled((os_log_t)qword_10001E790, v10);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a4, 2);
    swift_bridgeObjectRetain_n(a2, 2);
    v13 = swift_slowAlloc(32, -1);
    v14 = swift_slowAlloc(64, -1);
    v16 = v14;
    *(_DWORD *)v13 = 136315650;
    swift_bridgeObjectRetain(a4);
    v15 = sub_10000A5A4(a3, a4, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease_n(a4, 3);
    *(_WORD *)(v13 + 12) = 2048;
    v15 = a5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 14, v13 + 22);
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain(a2);
    v15 = sub_10000A5A4(a1, a2, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 24, v13 + 32);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v11, v10, "%s:%ld  %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    return swift_slowDealloc(v13, -1, -1);
  }
  return result;
}

uint64_t destroy for ClosuresWidgetView(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for ClosuresWidgetView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = v3;
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for ClosuresWidgetView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  v7 = a2[3];
  v8 = a1[3];
  a1[3] = v7;
  swift_retain(v7);
  swift_release(v8);
  return a1;
}

_QWORD *assignWithTake for ClosuresWidgetView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_release(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClosuresWidgetView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ClosuresWidgetView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ClosuresWidgetView()
{
  return &type metadata for ClosuresWidgetView;
}

uint64_t sub_10000B1A0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100015204, 1);
}

uint64_t sub_10000B1B0@<X0>(void *a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
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
  char v18;
  id v19;
  __int128 v20;
  uint64_t (**v21)(id *);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t (**v30)(uint64_t *);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[3];
  uint64_t v41;
  char v42;

  v37 = a3;
  v5 = sub_100004E24(&qword_10001DB20);
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  __chkstk_darwin(v5);
  v36 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004E24(&qword_10001DB28);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004E24(&qword_10001DB30);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = static Alignment.center.getter(v12);
  v16 = v15;
  sub_10000B410(a1, a2, (uint64_t)v40);
  v33 = v40[1];
  v34 = v40[0];
  v32 = v40[2];
  v17 = v41;
  v18 = v42;
  v19 = a1;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v14[*(int *)(v11 + 52)], v10, v7);
  *(_QWORD *)v14 = v35;
  *((_QWORD *)v14 + 1) = v16;
  v20 = v33;
  *((_OWORD *)v14 + 1) = v34;
  *((_OWORD *)v14 + 2) = v20;
  *((_OWORD *)v14 + 3) = v32;
  *((_QWORD *)v14 + 8) = v17;
  v14[72] = v18;
  v21 = (uint64_t (**)(id *))&v14[*(int *)(v11 + 56)];
  *v21 = sub_10000B6D4;
  v21[1] = 0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v22 = swift_retain(a2);
  v23 = v36;
  dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter(v22);
  swift_release(a2);
  v24 = v37;
  sub_100009CF8((uint64_t)v14, v37, &qword_10001DB30);
  v25 = sub_100004E24(&qword_10001DB38);
  v26 = v38;
  v27 = v23;
  v28 = v23;
  v29 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v24 + *(int *)(v25 + 52), v27, v39);
  v30 = (uint64_t (**)(uint64_t *))(v24 + *(int *)(v25 + 56));
  *v30 = sub_10000B7CC;
  v30[1] = 0;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v29);
  return sub_100009FE0((uint64_t)v14, &qword_10001DB30);
}

double sub_10000B410@<D0>(void *a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double result;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  uint64_t (*v34)();
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  _OWORD v39[3];
  uint64_t v40;
  char v41;

  v5 = a1;
  v6 = (void *)dispatch thunk of CAFCarManagerObservable.currentCar.getter();

  if (v6)
  {
    v7 = sub_100004E64(0, &qword_10001DB70, CAFCar_ptr);
    v8 = sub_1000091C8(&qword_10001DB78, &qword_10001DB70, CAFCar_ptr, (uint64_t)&protocol conformance descriptor for CAFCar);
    v9 = CAFObserved<>.observable.getter(v7, v8);
    v10 = swift_retain(a2);
    v11 = (void *)dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter(v10);
    swift_release(a2);
    v12 = type metadata accessor for CAFCarObservable(0);
    v13 = sub_100004DE4(&qword_10001DB80, (uint64_t (*)(uint64_t))&type metadata accessor for CAFCarObservable, (uint64_t)&protocol conformance descriptor for CAFCarObservable);
    v14 = ObservedObject.init(wrappedValue:)(v9, v12, v13);
    v16 = v15;
    v34 = (uint64_t (*)())v14;
    *(_QWORD *)&v35 = v15;
    *((_QWORD *)&v35 + 1) = v11;
    *(_QWORD *)&v36 = sub_10000B69C;
    v37 = 0uLL;
    *((_QWORD *)&v36 + 1) = 0;
    v38 = 0;
    v17 = v11;
    v18 = v16;
    v19 = v17;
    v20 = v18;
    v21 = sub_100004E24(&qword_10001DB40);
    v22 = sub_100004E24(&qword_10001DB48);
    v23 = sub_10000FA20(&qword_10001DB50, &qword_10001DB40, (void (*)(void))sub_10000F9DC);
    v24 = sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
    _ConditionalContent<>.init(storage:)(v39, &v34, v21, v22, v23, v24);

  }
  else
  {
    v34 = sub_10000B6B8;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 1;
    v25 = sub_100004E24(&qword_10001DB40);
    v26 = sub_100004E24(&qword_10001DB48);
    v27 = sub_10000FA20(&qword_10001DB50, &qword_10001DB40, (void (*)(void))sub_10000F9DC);
    v28 = sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
    _ConditionalContent<>.init(storage:)(v39, &v34, v25, v26, v27, v28);
  }
  result = *(double *)v39;
  v30 = v39[1];
  v31 = v39[2];
  v32 = v40;
  v33 = v41;
  *(_OWORD *)a3 = v39[0];
  *(_OWORD *)(a3 + 16) = v30;
  *(_OWORD *)(a3 + 32) = v31;
  *(_QWORD *)(a3 + 48) = v32;
  *(_BYTE *)(a3 + 56) = v33;
  return result;
}

uint64_t sub_10000B69C()
{
  return sub_10000AC88(0xD00000000000001BLL, 0x8000000100013430);
}

uint64_t sub_10000B6B8()
{
  return sub_10000AC88(0xD00000000000001ALL, 0x8000000100013450);
}

uint64_t sub_10000B6D4(id *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;

  if (!*a1)
    return sub_10000AC88(0xD00000000000001CLL, 0x80000001000133E0);
  v1 = *a1;
  _StringGuts.grow(_:)(47);
  swift_bridgeObjectRelease(0xE000000000000000);
  v2 = objc_msgSend(v1, "description");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v5);
  sub_10000AC88(0xD00000000000002DLL, 0x8000000100013400);

  return swift_bridgeObjectRelease(0x8000000100013400);
}

uint64_t sub_10000B7CC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  Swift::String v5;

  v1 = *a1;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease(0xE000000000000000);
  if (v1)
    v2 = 0;
  else
    v2 = 544501614;
  if (v1)
    v3 = 0xE000000000000000;
  else
    v3 = 0xE400000000000000;
  v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease(v3);
  v5._countAndFlagsBits = 0x6C62616C69617661;
  v5._object = (void *)0xEA00000000002E65;
  String.append(_:)(v5);
  sub_10000AC88(0xD000000000000010, 0x80000001000133C0);
  return swift_bridgeObjectRelease(0x80000001000133C0);
}

uint64_t sub_10000B88C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000B1B0(*(void **)(v1 + 8), *(_QWORD *)(v1 + 24), a1);
}

_QWORD *sub_10000B898@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (**v8)();
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t (**v25)();
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t (*v30)();
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;

  v36 = a1;
  v37 = a4;
  v6 = sub_100004E24(&qword_10001DB90);
  __chkstk_darwin(v6);
  v8 = (uint64_t (**)())((char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for CarView(0);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_100004E24(&qword_10001DB98);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v36 - v16;
  v18 = a2;
  v19 = (void *)CAFCarObservable.observed.getter();

  v20 = objc_msgSend(v19, "isConfigured");
  if (v20 && a3)
  {
    v21 = v18;
    v22 = a3;
    v23 = (void *)CAFCarObservable.observed.getter();

    v24 = v22;
    sub_10000BB74(v23, v24, v11);
    sub_10000FDA8((uint64_t)v11, (uint64_t)v15);
    v25 = (uint64_t (**)())&v15[*(int *)(v12 + 36)];
    *v25 = sub_10000BF34;
    v25[1] = 0;
    v25[2] = 0;
    v25[3] = 0;
    sub_10000FDEC((uint64_t)v11);
    sub_100009F9C((uint64_t)v15, (uint64_t)v17, &qword_10001DB98);
    sub_100009CF8((uint64_t)v17, (uint64_t)v8, &qword_10001DB98);
    swift_storeEnumTagMultiPayload(v8, v6, 0);
    v26 = sub_100004E24(&qword_10001DB48);
    v27 = sub_10000FD24();
    v28 = sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
    _ConditionalContent<>.init(storage:)(v37, v8, v12, v26, v27, v28);

    return (_QWORD *)sub_100009FE0((uint64_t)v17, &qword_10001DB98);
  }
  else
  {
    v30 = (uint64_t (*)())swift_allocObject(&unk_100019310, 40, 7);
    *((_QWORD *)v30 + 2) = v36;
    *((_QWORD *)v30 + 3) = v18;
    *((_QWORD *)v30 + 4) = a3;
    *v8 = sub_10000FD18;
    v8[1] = v30;
    v8[2] = 0;
    v8[3] = 0;
    swift_storeEnumTagMultiPayload(v8, v6, 1);
    v31 = a3;
    v32 = v18;
    v33 = sub_100004E24(&qword_10001DB48);
    v34 = sub_10000FD24();
    v35 = sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
    return _ConditionalContent<>.init(storage:)(v37, v8, v12, v33, v34, v35);
  }
}

void sub_10000BB74(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t);
  id v22;
  void *v23;
  void (*v24)(char *, uint64_t);
  void *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[2];

  v37 = sub_100004E24(&qword_10001DBB0);
  v6 = __chkstk_darwin(v37);
  v39 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v38 = (char *)&v32 - v8;
  v9 = type metadata accessor for CAUResource(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v35 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v32 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v32 - v16;
  v18 = type metadata accessor for CarView(0);
  v19 = (char *)a3 + *(int *)(v18 + 36);
  v40 = 0;
  State.init(wrappedValue:)(v41, &v40, &type metadata for Bool);
  v20 = v41[1];
  *v19 = v41[0];
  *((_QWORD *)v19 + 1) = v20;
  v36 = v18;
  *(_QWORD *)((char *)a3 + *(int *)(v18 + 32)) = a1;
  a3[2] = a2;
  v21 = *(void (**)(char *, _QWORD, uint64_t))(v10 + 104);
  v21(v17, enum case for CAUResource.topDownExteriorClosuresOverlay(_:), v9);
  v33 = a1;
  v22 = a2;
  v23 = (void *)CAUAssetLibrary.asset(for:)(v17);
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v17, v9);
  *a3 = v23;
  v21(v15, enum case for CAUResource.topDownInterior(_:), v9);
  v34 = v23;
  v25 = (void *)CAUAssetLibrary.asset(for:)(v15);
  v26 = v35;
  v24(v15, v9);
  a3[1] = v25;
  v21(v26, enum case for CAUResource.vehicleLayout(_:), v9);
  v27 = sub_10000FE28();
  v35 = v25;
  v28 = (uint64_t)v38;
  dispatch thunk of CAUAssetLibrary.asset<A>(for:)(v26, v37, v27);
  v24(v26, v9);
  v29 = (uint64_t)a3 + *(int *)(v36 + 28);
  sub_100009F9C(v28, v29, &qword_10001DBB0);

  if (!v23)
    sub_10000ABE4(0xD000000000000028, 0x8000000100013510);

  if (!v25)
    sub_10000ABE4(0xD000000000000028, 0x80000001000134E0);
  v30 = v39;
  sub_100009CF8(v29, v39, &qword_10001DBB0);
  v31 = type metadata accessor for CAUVehicleLayout(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v30, 1, v31) == 1)
  {
    sub_100009FE0(v30, &qword_10001DBB0);
    sub_10000ABE4(0xD00000000000003ELL, 0x80000001000134A0);

  }
  else
  {

    sub_100009FE0(v30, &qword_10001DBB0);
  }
}

uint64_t sub_10000BF34()
{
  return sub_10000AC88(0xD00000000000002BLL, 0x8000000100013470);
}

uint64_t sub_10000BF50(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Swift::String v15;

  sub_10000AC88(0xD000000000000028, 0x8000000100013540);
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease(0xE000000000000000);
  v5 = a2;
  v6 = (void *)CAFCarObservable.observed.getter();

  v7 = objc_msgSend(v6, "isConfigured");
  if (v7)
    v8 = 544501614;
  else
    v8 = 0;
  if (v7)
    v9 = 0xE400000000000000;
  else
    v9 = 0xE000000000000000;
  v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 0x72756769666E6F63;
  v11._object = (void *)0xEB000000002E6465;
  String.append(_:)(v11);
  sub_10000AC88(0x20736920726143, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease(0xE000000000000000);
  if (a3)
    v12 = 0;
  else
    v12 = 544501614;
  if (a3)
    v13 = 0xE000000000000000;
  else
    v13 = 0xE400000000000000;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease(v13);
  v15._countAndFlagsBits = 0x6C62616C69617661;
  v15._object = (void *)0xEA00000000002E65;
  String.append(_:)(v15);
  sub_10000AC88(0xD000000000000010, 0x8000000100013570);
  return swift_bridgeObjectRelease(0x8000000100013570);
}

_QWORD *sub_10000C0F0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_10000B898(*(_QWORD *)v1, *(void **)(v1 + 8), *(void **)(v1 + 16), a1);
}

double sub_10000C0FC@<D0>(uint64_t a1@<X8>)
{
  void **v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double result;
  __int128 v19;
  __int128 v20;
  char v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  char v27;
  _OWORD v28[3];
  char v29;

  v3 = type metadata accessor for CarView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = *v1;
  if (*v1)
  {
    sub_10000FDA8((uint64_t)v1, (uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    v7 = *(unsigned __int8 *)(v4 + 80);
    v8 = (v7 + 24) & ~v7;
    v9 = v7 | 7;
    v10 = swift_allocObject(&unk_100019338, v8 + v5, v7 | 7);
    *(_QWORD *)(v10 + 16) = v6;
    sub_100010A14((uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v8);
    sub_10000FDA8((uint64_t)v1, (uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    v11 = (v7 + 16) & ~v7;
    v12 = swift_allocObject(&unk_100019360, v11 + v5, v9);
    sub_100010A14((uint64_t)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
    v23 = sub_100010A58;
    *(_QWORD *)&v24 = v10;
    *((_QWORD *)&v24 + 1) = sub_100010B8C;
    v25 = (unint64_t)v12;
    v26 = 0;
    v27 = 0;
    v13 = v6;
  }
  else
  {
    v23 = sub_10000D930;
    v24 = 0u;
    v25 = 0u;
    v26 = 0;
    v27 = 1;
  }
  v14 = sub_100004E24(&qword_10001DCD0);
  v15 = sub_100004E24(&qword_10001DB48);
  v16 = sub_1000108A4();
  v17 = sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
  _ConditionalContent<>.init(storage:)(v28, &v23, v14, v15, v16, v17);
  result = *(double *)v28;
  v19 = v28[1];
  v20 = v28[2];
  v21 = v29;
  *(_OWORD *)a1 = v28[0];
  *(_OWORD *)(a1 + 16) = v19;
  *(_OWORD *)(a1 + 32) = v20;
  *(_BYTE *)(a1 + 48) = v21;
  return result;
}

_QWORD *sub_10000C2BC@<X0>(void *a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  v6 = GeometryProxy.size.getter();
  v8 = sub_10000C358((double *)v17, v6, v7);
  v13 = v17[1];
  v14 = v17[0];
  v9 = v18;
  *a3 = static Alignment.center.getter(v8);
  a3[1] = v10;
  v11 = (uint64_t)a3 + *(int *)(sub_100004E24(&qword_10001DCF8) + 44);
  v15[0] = v14;
  v15[1] = v13;
  v16 = v9;
  return sub_10000C4A0(a1, a2, (double *)v15, v11);
}

id sub_10000C358@<X0>(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  void *v3;
  double v5;
  id result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = 0.0;
  if (a2 == 0.0
    || a3 == 0.0
    || (result = objc_msgSend(v3, "size"), v9 == 0.0)
    || (result = objc_msgSend(v3, "size"), v10 == 0.0))
  {
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
  }
  else
  {
    v15 = a2 / a3;
    objc_msgSend(v3, "size");
    v17 = v16;
    objc_msgSend(v3, "size");
    v19 = v17 / v18;
    objc_msgSend(v3, "size");
    if (v19 >= a2 / a3)
      v14 = a2 / v20;
    else
      v14 = a3 / v21;
    objc_msgSend(v3, "size");
    v12 = v14 * v22;
    result = objc_msgSend(v3, "size");
    v13 = v14 * v23;
    if (v19 >= v15)
    {
      if (v15 < v19)
        v5 = a3 * 0.5 - v13 * 0.5;
      v11 = 0.0;
    }
    else
    {
      v11 = a2 * 0.5 - v12 * 0.5;
    }
  }
  *a1 = v11;
  a1[1] = v5;
  a1[2] = v12;
  a1[3] = v13;
  a1[4] = v14;
  return result;
}

_QWORD *sub_10000C4A0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, double *a3@<X2>, uint64_t a4@<X8>)
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(_QWORD);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double *v55;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  double v71;
  double v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(_QWORD, _QWORD, _QWORD);
  uint64_t v89;
  double *v90;
  uint64_t v91;
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
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void (*v118)(char *, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(char *, _QWORD, uint64_t);
  uint64_t v129;
  _OWORD v130[8];
  uint64_t v131;
  _OWORD v132[8];
  uint64_t v133;
  double v134[14];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;

  v127 = a2;
  v119 = a4;
  v5 = *a3;
  v6 = a3[1];
  v7 = *((_QWORD *)a3 + 2);
  v8 = *((_QWORD *)a3 + 3);
  v9 = a3[4];
  v10 = sub_100004E24(&qword_10001DBB0);
  __chkstk_darwin(v10);
  v122 = (uint64_t)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CAUVehicleLayout(0);
  v124 = *(_QWORD *)(v12 - 8);
  v125 = v12;
  v13 = __chkstk_darwin(v12);
  *(_QWORD *)&v115 = (char *)&v110 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v112 = (uint64_t)&v110 - v15;
  v126 = type metadata accessor for CarView(0);
  v117 = *(double *)(v126 - 8);
  __chkstk_darwin(v126);
  v120 = v16;
  v121 = (uint64_t)&v110 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100004E24(&qword_10001DD00);
  v18 = __chkstk_darwin(v17);
  v123 = (uint64_t)&v110 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v129 = (uint64_t)&v110 - v20;
  v21 = type metadata accessor for Image.Interpolation(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v110 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for Image.ResizingMode(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v110 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = Image.init(uiImage:)(a1);
  v30 = *(void (**)(_QWORD))(v26 + 104);
  LODWORD(v118) = enum case for Image.ResizingMode.stretch(_:);
  v128 = (void (*)(char *, _QWORD, uint64_t))v30;
  v30(v28);
  v31 = Image.resizable(capInsets:resizingMode:)(v28, v29, 0.0, 0.0, 0.0, 0.0);
  swift_release(v29);
  v116 = *(double *)(v26 + 8);
  (*(void (**)(char *, uint64_t))&v116)(v28, v25);
  v32 = enum case for Image.Interpolation.high(_:);
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 104);
  v33(v24, enum case for Image.Interpolation.high(_:), v21);
  v34 = Image.interpolation(_:)(v24, v31);
  swift_release(v31);
  v35 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
  v36 = v35(v24, v21);
  v37 = static Alignment.center.getter(v36);
  sub_10000CE30(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v135, 0.0, 1, INFINITY, 0, v37, v38, v34, 0, 1);
  swift_release(v34);
  v39 = *(void **)(v127 + 8);
  if (v39)
  {
    v40 = v39;
    v41 = Image.init(uiImage:)(v40);
    v128(v28, v118, v25);
    v42 = Image.resizable(capInsets:resizingMode:)(v28, v41, 0.0, 0.0, 0.0, 0.0);
    v118 = (void (*)(char *, uint64_t))v35;
    v43 = v42;
    swift_release(v41);
    (*(void (**)(char *, uint64_t))&v116)(v28, v25);
    v33(v24, v32, v21);
    v128 = (void (*)(char *, _QWORD, uint64_t))Image.interpolation(_:)(v24, v43);
    swift_release(v43);

    v118(v24, v21);
    LODWORD(v118) = 1;
  }
  else
  {
    v128 = 0;
    LODWORD(v118) = 0;
  }
  v44 = v127;
  v45 = *(int *)(v126 + 32);
  v46 = objc_msgSend(*(id *)(v127 + v45), "closure");
  if (v46)
  {
    v47 = v46;
    v48 = objc_msgSend(v46, "closureStates");
    v49 = sub_100004E64(0, &qword_10001DD18, CAFClosureState_ptr);
    v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v48, v49);

    *(_QWORD *)&v132[0] = v50;
    v51 = v44;
    v52 = v121;
    sub_10000FDA8(v51, v121);
    v53 = *(unsigned __int8 *)(*(_QWORD *)&v117 + 80);
    v54 = (v53 + 56) & ~v53;
    v55 = (double *)swift_allocObject(&unk_100019388, v54 + v120, v53 | 7);
    v55[2] = v5;
    v55[3] = v6;
    *((_QWORD *)v55 + 4) = v7;
    *((_QWORD *)v55 + 5) = v8;
    v55[6] = v9;
    sub_100010A14(v52, (uint64_t)v55 + v54);
    v56 = sub_100004E24(&qword_10001DD20);
    v57 = type metadata accessor for UUID(0);
    v58 = type metadata accessor for DoorView(0);
    v59 = sub_10000A478(&qword_10001DD28, &qword_10001DD20, (uint64_t)&protocol conformance descriptor for [A]);
    v60 = sub_100004DE4(&qword_10001DD30, type metadata accessor for DoorView, (uint64_t)&unk_100014E00);
    v61 = sub_1000091C8(&qword_10001DD38, &qword_10001DD18, CAFClosureState_ptr, (uint64_t)&protocol conformance descriptor for CAFService);
    v62 = v129;
    v63 = v60;
    v44 = v127;
    ForEach<>.init(_:content:)(v132, sub_100010D8C, v55, v56, v57, v58, v59, v63, v61);

    v64 = sub_100004E24(&qword_10001DD08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v62, 0, 1, v64);
  }
  else
  {
    sub_10000AC88(0xD00000000000001DLL, 0x80000001000135C0);
    v65 = sub_100004E24(&qword_10001DD08);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v129, 1, 1, v65);
  }
  v66 = v124;
  v67 = v125;
  v68 = v122;
  v69 = objc_msgSend(*(id *)(v44 + v45), "seat");
  if (v69)
  {
    v70 = v69;
    sub_100009CF8(v44 + *(int *)(v126 + 28), v68, &qword_10001DBB0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v68, 1, v67) != 1)
    {
      v73 = v112;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 32))(v112, v68, v67);
      v74 = objc_msgSend(v70, "seatBelts");
      v75 = sub_100004E64(0, &qword_10001D880, CAFSeatBelt_ptr);
      v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v75);

      v77 = *(_QWORD *)&v115;
      (*(void (**)(double, uint64_t, uint64_t))(v66 + 16))(COERCE_DOUBLE(*(_QWORD *)&v115), v73, v67);
      sub_100008794(v76, v77, v134, v5, v6, v9);
      v71 = v134[2];
      v121 = *(_QWORD *)&v134[1];
      v122 = *(_QWORD *)&v134[0];
      v120 = *(_QWORD *)&v134[3];
      v72 = v134[7];
      v126 = *(_QWORD *)&v134[8];
      v127 = *(_QWORD *)&v134[6];
      v124 = *(_QWORD *)&v134[4];
      v125 = *(_QWORD *)&v134[9];
      v116 = v134[10];
      v117 = v134[5];
      v114 = v134[12];
      v115 = v134[11];
      v113 = v134[13];

      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v73, v67);
      goto LABEL_13;
    }

    sub_100009FE0(v68, &qword_10001DBB0);
  }
  else
  {
    sub_10000AC88(0xD00000000000001ALL, 0x80000001000135E0);
  }
  v121 = 0;
  v122 = 0;
  v71 = 0.0;
  v120 = 0;
  v124 = 0;
  v125 = 0;
  v116 = 0.0;
  v117 = 0.0;
  v126 = 0;
  v127 = 0;
  v72 = 0.0;
  v114 = 0.0;
  v115 = 0.0;
  v113 = 0.0;
LABEL_13:
  v78 = v123;
  sub_100009CF8(v129, v123, &qword_10001DD00);
  v79 = v140;
  v130[6] = v141;
  v130[7] = v142;
  v80 = v136;
  v130[2] = v137;
  v81 = v137;
  v130[3] = v138;
  v82 = v138;
  v130[4] = v139;
  v83 = v139;
  v130[5] = v140;
  v130[0] = v135;
  v84 = v135;
  v130[1] = v136;
  v85 = v142;
  v86 = v119;
  *(_OWORD *)(v119 + 96) = v141;
  *(_OWORD *)(v86 + 112) = v85;
  *(_OWORD *)(v86 + 32) = v81;
  *(_OWORD *)(v86 + 48) = v82;
  *(_OWORD *)(v86 + 64) = v83;
  *(_OWORD *)(v86 + 80) = v79;
  v87 = v143;
  v131 = v143;
  *(_OWORD *)v86 = v84;
  *(_OWORD *)(v86 + 16) = v80;
  v88 = (void (*)(_QWORD, _QWORD, _QWORD))v128;
  *(_QWORD *)(v86 + 128) = v87;
  *(_QWORD *)(v86 + 136) = v88;
  *(_QWORD *)(v86 + 144) = 0;
  *(_WORD *)(v86 + 152) = (_WORD)v118;
  v89 = sub_100004E24(&qword_10001DD10);
  sub_100009CF8(v78, v86 + *(int *)(v89 + 64), &qword_10001DD00);
  v90 = (double *)(v86 + *(int *)(v89 + 80));
  v91 = v121;
  *(_QWORD *)v90 = v122;
  *((_QWORD *)v90 + 1) = v91;
  v111 = *(_QWORD *)&v71;
  v112 = *(_QWORD *)&v72;
  v92 = v120;
  v90[2] = v71;
  *((_QWORD *)v90 + 3) = v92;
  v93 = v124;
  v94 = v125;
  v95 = *(_QWORD *)&v116;
  v96 = *(_QWORD *)&v117;
  *((_QWORD *)v90 + 4) = v124;
  *((_QWORD *)v90 + 5) = v96;
  v97 = v126;
  *((_QWORD *)v90 + 6) = v127;
  v90[7] = v72;
  *((_QWORD *)v90 + 8) = v97;
  *((_QWORD *)v90 + 9) = v94;
  v126 = v97;
  v99 = *(_QWORD *)&v114;
  v98 = *(_QWORD *)&v115;
  *((_QWORD *)v90 + 10) = v95;
  *((_QWORD *)v90 + 11) = v98;
  v100 = *(_QWORD *)&v113;
  *((_QWORD *)v90 + 12) = v99;
  *((_QWORD *)v90 + 13) = v100;
  sub_100010BB8(v130);
  swift_retain(v128);
  v108 = v97;
  v109 = v94;
  v102 = v121;
  v101 = v122;
  v103 = *(_QWORD *)&v71;
  v104 = v120;
  v105 = v93;
  v106 = v112;
  sub_100010BE0(v122, v121, v103, v120, v105, v96, v127, v112, v108, v109, v95, v98, v99, v100);
  sub_100009FE0(v129, &qword_10001DD00);
  sub_100010C30(v101, v102, v111, v104, v124, v96, v127, v106, v126, v125, v95, v98, v99, v100);
  sub_100009FE0(v123, &qword_10001DD00);
  swift_release(v128);
  v132[6] = v141;
  v132[7] = v142;
  v133 = v143;
  v132[2] = v137;
  v132[3] = v138;
  v132[4] = v139;
  v132[5] = v140;
  v132[0] = v135;
  v132[1] = v136;
  return sub_100010C80(v132);
}

uint64_t sub_10000CE30@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int16 a18)
{
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _OWORD v49[7];

  v19 = a18;
  v20 = a16;
  v22 = a14;
  v21 = a15;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((a4 & 1) != 0)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v47 = a5;
    v48 = a7;
    v45 = a1;
    v46 = a3;
    v44 = v25;
    v37 = static os_log_type_t.fault.getter();
    v38 = (void *)static Log.runtimeIssuesLog.getter();
    v39 = v37;
    v20 = a16;
    os_log(_:dso:log:_:_:)(v39, &_mh_execute_header, v38, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v22 = a14;
    v21 = a15;
    v25 = v44;
    v24 = a10;
    v23 = a12;
    a1 = v45;
    a3 = v46;
    a5 = v47;
    a7 = v48;
    v19 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v49, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  v40 = v49[2];
  *(_OWORD *)(a9 + 72) = v49[3];
  v41 = v49[5];
  *(_OWORD *)(a9 + 88) = v49[4];
  *(_OWORD *)(a9 + 104) = v41;
  *(_OWORD *)(a9 + 120) = v49[6];
  v42 = v49[1];
  *(_OWORD *)(a9 + 24) = v49[0];
  *(_OWORD *)(a9 + 40) = v42;
  *(_QWORD *)a9 = v20;
  *(_QWORD *)(a9 + 8) = a17;
  *(_BYTE *)(a9 + 16) = v19 & 1;
  *(_BYTE *)(a9 + 17) = HIBYTE(v19) & 1;
  *(_OWORD *)(a9 + 56) = v40;
  return swift_retain(v20);
}

__n128 sub_10000D004@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
  sub_100009CF8(v16, a9, &qword_10001DBC8);
  v35 = a9 + *(int *)(sub_100004E24(&qword_10001DBD8) + 36);
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

uint64_t sub_10000D1C0@<X0>(id *a1@<X0>, double *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_10000D23C(*a1, *(id *)(a3 + 16), a4, *a2, a2[1], a2[2], a2[3], a2[4]);
}

uint64_t sub_10000D23C@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>, double a8@<D4>)
{
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
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  int *v40;
  char *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  void *v85;
  _QWORD *v86;
  void (*v87)(char *, uint64_t, uint64_t);
  void *v88;
  uint64_t v89;

  v88 = a2;
  v15 = type metadata accessor for CAUVehicleLayoutKey(0);
  v76 = *(_QWORD *)(v15 - 8);
  v77 = v15;
  __chkstk_darwin(v15);
  v80 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for CAUVehicleLayout(0);
  v78 = *(_QWORD *)(v17 - 8);
  v79 = v17;
  __chkstk_darwin(v17);
  v75 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100004E24(&qword_10001D878);
  __chkstk_darwin(v19);
  v81 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_100004E24(&qword_10001DBB0);
  __chkstk_darwin(v83);
  v84 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for CAUResource(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = __chkstk_darwin(v22);
  v82 = (char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v24);
  v28 = (char *)&v74 - v27;
  __chkstk_darwin(v26);
  v30 = (char *)&v74 - v29;
  *a3 = swift_getKeyPath(&unk_100014D90);
  v31 = sub_100004E24(&qword_10001DD40);
  v86 = a3;
  swift_storeEnumTagMultiPayload(a3, v31, 0);
  v32 = sub_100004E24(&qword_10001DD48);
  v33 = &v30[*(int *)(v32 + 48)];
  v89 = sub_100004E64(0, &qword_10001DD18, CAFClosureState_ptr);
  v85 = a1;
  ((void (*)(void))CAFPositionedRequired.layoutKey.getter)();
  v34 = enum case for CAUAsset.ClosureMask.State.open(_:);
  v35 = type metadata accessor for CAUAsset.ClosureMask.State(0);
  v36 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104);
  v36(v33, v34, v35);
  v37 = enum case for CAUResource.closureMask(_:);
  v87 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 104);
  v87(v30, enum case for CAUResource.closureMask(_:), v22);
  v38 = CAUAssetLibrary.asset(for:)(v30);
  v39 = *(void (**)(char *, uint64_t))(v23 + 8);
  v39(v30, v22);
  v40 = (int *)type metadata accessor for DoorView(0);
  *(_QWORD *)((char *)v86 + v40[6]) = v38;
  v41 = &v28[*(int *)(v32 + 48)];
  CAFPositionedRequired.layoutKey.getter(v89);
  v36(v41, enum case for CAUAsset.ClosureMask.State.closed(_:), v35);
  v87(v28, v37, v22);
  v42 = v88;
  v43 = CAUAssetLibrary.asset(for:)(v28);
  v45 = v85;
  v44 = v86;
  v39(v28, v22);
  *(_QWORD *)((char *)v44 + v40[7]) = v43;
  v46 = (double *)((char *)v44 + v40[8]);
  *v46 = a4;
  v46[1] = a5;
  v46[2] = a6;
  v46[3] = a7;
  v46[4] = a8;
  v47 = sub_1000091C8(&qword_10001DD50, &qword_10001DD18, CAFClosureState_ptr, (uint64_t)&protocol conformance descriptor for CAFClosureState);
  v48 = CAFObserved<>.observable.getter(v89, v47);
  v49 = (_QWORD *)((char *)v44 + v40[5]);
  v50 = type metadata accessor for CAFClosureStateObservable(0);
  v51 = sub_100004DE4(&qword_10001DD58, (uint64_t (*)(uint64_t))&type metadata accessor for CAFClosureStateObservable, (uint64_t)&protocol conformance descriptor for CAFClosureStateObservable);
  *v49 = ObservedObject.init(wrappedValue:)(v48, v50, v51);
  v49[1] = v52;
  v53 = v82;
  v87(v82, enum case for CAUResource.vehicleLayout(_:), v22);
  v54 = sub_10000FE28();
  v55 = (uint64_t)v84;
  dispatch thunk of CAUAssetLibrary.asset<A>(for:)(v53, v83, v54);
  v39(v53, v22);
  v56 = v79;
  v57 = (uint64_t)v80;
  v58 = v78;
  v59 = (uint64_t)v44 + v40[9];
  sub_100009F9C(v55, v59, &qword_10001DBB0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v59, 1, v56))
  {

    v60 = type metadata accessor for CAUVehicleLayoutInfo(0);
    v61 = (uint64_t)v81;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v81, 1, 1, v60);
  }
  else
  {
    v62 = v75;
    v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 16))(v75, v59, v56);
    v64 = CAUVehicleLayout.infos.getter(v63);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v62, v56);
    CAFPositionedRequired.layoutKey.getter(v89);
    if (*(_QWORD *)(v64 + 16) && (v65 = sub_10000F764(v57), (v66 & 1) != 0))
    {
      v67 = v65;
      v68 = *(_QWORD *)(v64 + 56);
      v69 = type metadata accessor for CAUVehicleLayoutInfo(0);
      v70 = *(_QWORD *)(v69 - 8);
      v71 = v68 + *(_QWORD *)(v70 + 72) * v67;
      v61 = (uint64_t)v81;
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v81, v71, v69);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v70 + 56))(v61, 0, 1, v69);
    }
    else
    {
      v72 = type metadata accessor for CAUVehicleLayoutInfo(0);
      v61 = (uint64_t)v81;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v81, 1, 1, v72);
    }

    swift_bridgeObjectRelease(v64);
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v57, v77);
  }
  return sub_100009F9C(v61, (uint64_t)v44 + v40[10], &qword_10001D878);
}

void sub_10000D850(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = type metadata accessor for CarView(0);
  v3 = sub_100004E24(&qword_10001DCF0);
  State.wrappedValue.getter(&v7);
  if ((v7 & 1) == 0)
  {
    v4 = *(void **)(a1 + *(int *)(v2 + 32));
    v5 = objc_msgSend(v4, "closure");
    if (v5)
    {
      v6 = v5;
      if ((objc_msgSend(v5, "receivedAllValues") & 1) != 0)
      {
        CAFSignpostEmit_Finalized(v4);
        LOBYTE(v7) = 1;
        State.wrappedValue.setter(&v7, v3);
      }

    }
  }
}

uint64_t sub_10000D930()
{
  return sub_10000AC88(0xD00000000000001FLL, 0x8000000100013600);
}

_QWORD *sub_10000D950@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  id v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  char v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;

  v46 = a1;
  v45 = sub_100004E24(&qword_10001DE38);
  __chkstk_darwin(v45);
  v3 = (uint64_t *)((char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_100004E24(&qword_10001DE40);
  __chkstk_darwin(v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Image.Interpolation(0);
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  __chkstk_darwin(v7);
  v42 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for Image.ResizingMode(0);
  v9 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DoorView(0);
  v13 = v1;
  v14 = *(id *)(v1 + *(int *)(v12 + 20) + 8);
  v15 = (void *)CAFClosureStateObservable.observed.getter();

  v16 = objc_msgSend(v15, "latchStateInvalid");
  if ((v16 & 1) != 0)
  {
    *v3 = static Alignment.center.getter(v17);
    v3[1] = v18;
    v19 = sub_100004E24(&qword_10001DE70);
    sub_10000DCDC(v13, (uint64_t)v3 + *(int *)(v19 + 44));
    sub_100009CF8((uint64_t)v3, (uint64_t)v6, &qword_10001DE38);
    swift_storeEnumTagMultiPayload(v6, v4, 1);
    v20 = sub_100004E24(&qword_10001DE48);
    v21 = sub_100011F10();
    v22 = sub_10000A478(&qword_10001DE68, &qword_10001DE38, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    _ConditionalContent<>.init(storage:)(v46, v6, v20, v45, v21, v22);
    return (_QWORD *)sub_100009FE0((uint64_t)v3, &qword_10001DE38);
  }
  else
  {
    v24 = v45;
    v25 = v46;
    v26 = v14;
    v27 = dispatch thunk of CAFClosureStateObservable.latchState.getter();

    v28 = 28;
    if ((v27 & 1) != 0)
      v28 = 24;
    v29 = *(void **)(v13 + *(int *)(v12 + v28));
    if (v29)
    {
      v30 = v29;
      v31 = Image.init(uiImage:)(v30);
      v32 = v41;
      (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for Image.ResizingMode.stretch(_:), v41);
      v33 = Image.resizable(capInsets:resizingMode:)(v11, v31, 0.0, 0.0, 0.0, 0.0);
      swift_release(v31);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v32);
      v35 = v42;
      v34 = v43;
      v36 = v44;
      (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v42, enum case for Image.Interpolation.high(_:), v44);
      v37 = Image.interpolation(_:)(v35, v33);
      swift_release(v33);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
      LOWORD(v29) = 1;
    }
    else
    {
      v37 = 0;
    }
    *(_QWORD *)v6 = v37;
    *((_QWORD *)v6 + 1) = 0;
    *((_WORD *)v6 + 8) = (_WORD)v29;
    swift_storeEnumTagMultiPayload(v6, v4, 0);
    v38 = sub_100004E24(&qword_10001DE48);
    v39 = sub_100011F10();
    v40 = sub_10000A478(&qword_10001DE68, &qword_10001DE38, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    return _ConditionalContent<>.init(storage:)(v25, v6, v38, v24, v39, v40);
  }
}

uint64_t sub_10000DCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
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
  char *KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  char *v44;
  char v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v98 = sub_100004E24(&qword_10001DE78);
  __chkstk_darwin(v98);
  v5 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Image.Scale(0);
  v101 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v100 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004E24(&qword_10001DA30);
  __chkstk_darwin(v8);
  v95 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004E24(&qword_10001DE80);
  __chkstk_darwin(v10);
  v94 = (char *)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = sub_100004E24(&qword_10001DE88);
  __chkstk_darwin(v96);
  v99 = (uint64_t *)((char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_100004E24(&qword_10001DE90);
  v107 = *(_QWORD *)(v13 - 8);
  v108 = v13;
  __chkstk_darwin(v13);
  v97 = (uint64_t)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = type metadata accessor for ColorScheme(0);
  v93 = *(_QWORD *)(v106 - 8);
  v15 = __chkstk_darwin(v106);
  v105 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v104 = (uint64_t)&v89 - v17;
  v18 = sub_100004E24(&qword_10001DE98);
  v19 = __chkstk_darwin(v18);
  v110 = (uint64_t)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v111 = (uint64_t)&v89 - v21;
  v22 = type metadata accessor for Image.Interpolation(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  KeyPath = (char *)&v89 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for Image.ResizingMode(0);
  v27 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin(v26);
  v29 = (char *)&v89 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *(void **)(a1 + *(int *)(type metadata accessor for DoorView(0) + 28));
  v109 = a2;
  v102 = v6;
  v103 = (uint64_t *)v5;
  if (v30)
  {
    v31 = v30;
    v32 = Image.init(uiImage:)(v31);
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v29, enum case for Image.ResizingMode.stretch(_:), v26);
    v33 = Image.resizable(capInsets:resizingMode:)(v29, v32, 0.0, 0.0, 0.0, 0.0);
    swift_release(v32);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(KeyPath, enum case for Image.Interpolation.high(_:), v22);
    v34 = Image.interpolation(_:)(KeyPath, v33);
    swift_release(v33);

    (*(void (**)(char *, uint64_t))(v23 + 8))(KeyPath, v22);
    LODWORD(KeyPath) = 1;
  }
  else
  {
    v34 = 0;
    LODWORD(KeyPath) = 0;
  }
  v35 = v111;
  v36 = sub_10000E488();
  if ((v38 & 1) != 0)
  {
    v49 = 1;
    v50 = v108;
    v51 = v109;
    v52 = v107;
  }
  else
  {
    v90 = v37;
    v91 = v36;
    v92 = (int)KeyPath;
    v39 = v104;
    sub_10000F524(v104);
    v40 = enum case for ColorScheme.dark(_:);
    v41 = v93;
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v93 + 104);
    v44 = v105;
    v43 = v106;
    v42(v105, enum case for ColorScheme.dark(_:), v106);
    v45 = static ColorScheme.== infix(_:_:)(v39, v44);
    v46 = *(void (**)(char *, uint64_t))(v41 + 8);
    v46(v44, v43);
    v47 = ((uint64_t (*)(uint64_t, uint64_t))v46)(v39, v43);
    if ((v45 & 1) != 0)
      v48 = static Color.black.getter(v47);
    else
      v48 = static Color.white.getter(v47);
    v53 = v48;
    v54 = static Color.blue.getter();
    v55 = v104;
    sub_10000F524(v104);
    v56 = v105;
    v57 = v40;
    v58 = v106;
    v42(v105, v57, v106);
    v59 = static ColorScheme.== infix(_:_:)(v55, v56);
    v46(v56, v58);
    v60 = ((uint64_t (*)(uint64_t, uint64_t))v46)(v55, v58);
    if ((v59 & 1) != 0)
      v61 = static Color.white.getter(v60);
    else
      v61 = static Color.black.getter(v60);
    v62 = v61;
    v63 = Image.init(systemName:)(0xD000000000000018, 0x8000000100013620);
    v105 = (char *)v34;
    v64 = v63;
    v65 = (uint64_t)v94;
    static SymbolRenderingMode.palette.getter();
    v66 = type metadata accessor for SymbolRenderingMode(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v65, 0, 1, v66);
    v106 = Image.symbolRenderingMode(_:)(v65, v64);
    swift_release(v64);
    sub_100009FE0(v65, &qword_10001DE80);
    swift_retain(v53);
    swift_retain(v54);
    v67 = swift_retain(v62);
    v68 = static Font.Weight.medium.getter(v67);
    v69 = type metadata accessor for Font.Design(0);
    v70 = (uint64_t)v95;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v95, 1, 1, v69);
    v71 = static Font.system(size:weight:design:)(*(_QWORD *)&v68, 0, v70, 36.0);
    sub_100009FE0(v70, &qword_10001DA30);
    KeyPath = (char *)swift_getKeyPath(&unk_100014E50);
    v73 = v100;
    v72 = v101;
    v74 = v102;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v100, enum case for Image.Scale.large(_:), v102);
    v75 = swift_getKeyPath(&unk_100014E80);
    v76 = v103;
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))((char *)v103 + *(int *)(v98 + 28), v73, v74);
    *v76 = v75;
    v77 = v53;
    v78 = v99;
    sub_100009CF8((uint64_t)v76, (uint64_t)v99 + *(int *)(v96 + 36), &qword_10001DE78);
    v79 = v106;
    *v78 = v106;
    v78[1] = v77;
    v78[2] = v54;
    v78[3] = v62;
    v78[4] = (uint64_t)KeyPath;
    v78[5] = v71;
    swift_retain(v79);
    swift_retain(KeyPath);
    swift_retain(v71);
    sub_100009FE0((uint64_t)v76, &qword_10001DE78);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v74);
    v80 = v71;
    v34 = (uint64_t)v105;
    swift_release(v80);
    swift_release(KeyPath);
    swift_release(v62);
    swift_release(v54);
    v81 = v77;
    v51 = v109;
    swift_release(v81);
    swift_release(v106);
    v82 = v97;
    sub_100009CF8((uint64_t)v78, v97, &qword_10001DE88);
    v50 = v108;
    v83 = (uint64_t *)(v82 + *(int *)(v108 + 36));
    v84 = v90;
    *v83 = v91;
    v83[1] = v84;
    sub_100009FE0((uint64_t)v78, &qword_10001DE88);
    v85 = v82;
    v35 = v111;
    sub_100009F9C(v85, v111, &qword_10001DE90);
    v49 = 0;
    v52 = v107;
    LOWORD(KeyPath) = v92;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v35, v49, 1, v50);
  v86 = v110;
  sub_100009CF8(v35, v110, &qword_10001DE98);
  *(_QWORD *)v51 = v34;
  *(_QWORD *)(v51 + 8) = 0;
  *(_WORD *)(v51 + 16) = (_WORD)KeyPath;
  v87 = sub_100004E24(&qword_10001DEA0);
  sub_100009CF8(v86, v51 + *(int *)(v87 + 48), &qword_10001DE98);
  swift_retain(v34);
  sub_100009FE0(v35, &qword_10001DE98);
  sub_100009FE0(v86, &qword_10001DE98);
  return swift_release(v34);
}

uint64_t sub_10000E488()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unsigned int (**v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  char *v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t (*v55)(char *, char *, uint64_t);
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, _QWORD, uint64_t);
  char v61;
  void (*v62)(char *, uint64_t);
  char v63;
  char v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  BOOL v67;
  double v68;
  double v69;
  char v70;
  char v71;
  char *v72;
  uint64_t v73;
  int v74;
  double v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char v80;
  char v81;
  char *v82;
  double v83;
  uint64_t result;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  id v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  char *v98;
  void (**v99)(char *, uint64_t);
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char v103;

  v1 = v0;
  v2 = type metadata accessor for CAUVehicleLayoutKey.Side(0);
  v93 = *(_QWORD *)(v2 - 8);
  v3 = __chkstk_darwin(v2);
  v94 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v98 = (char *)&v85 - v5;
  v102 = type metadata accessor for CAUVehicleLayoutKey(0);
  v97 = *(_QWORD **)(v102 - 8);
  v6 = __chkstk_darwin(v102);
  v89 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v92 = (char *)&v85 - v9;
  v10 = __chkstk_darwin(v8);
  v100 = (char *)&v85 - v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v85 - v12;
  v14 = sub_100004E24(&qword_10001D878);
  __chkstk_darwin(v14);
  v16 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100004E24(&qword_10001DEA8);
  __chkstk_darwin(v17);
  v99 = (void (**)(char *, uint64_t))((char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = type metadata accessor for CAUBaselineAnchor(0);
  v95 = *(_QWORD *)(v19 - 8);
  v96 = v19;
  __chkstk_darwin(v19);
  v90 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100004E24(&qword_10001DBB0);
  __chkstk_darwin(v21);
  v23 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for CAUVehicleLayout(0);
  v25 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v24 - 8);
  __chkstk_darwin(v24);
  v27 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = (int *)type metadata accessor for DoorView(0);
  v29 = v28[9];
  v101 = v1;
  sub_100009CF8(v1 + v29, (uint64_t)v23, &qword_10001DBB0);
  if (v25[6](v23, 1, v24) == 1)
  {
    sub_100009FE0((uint64_t)v23, &qword_10001DBB0);
    return 0;
  }
  v31 = v25[4];
  v87 = v24;
  v31(v27, (uint64_t)v23, v24);
  v32 = *(id *)(v101 + v28[5] + 8);
  v33 = (void *)CAFClosureStateObservable.observed.getter();

  v35 = CAUVehicleLayout.infos.getter(v34);
  v85 = sub_100004E64(0, &qword_10001DD18, CAFClosureState_ptr);
  v91 = v33;
  CAFPositionedRequired.layoutKey.getter(v85);
  v36 = *(_QWORD *)(v35 + 16);
  v88 = v2;
  v86 = v27;
  if (v36 && (v37 = sub_10000F764((uint64_t)v13), (v38 & 1) != 0))
  {
    v39 = v37;
    v40 = *(_QWORD *)(v35 + 56);
    v41 = type metadata accessor for CAUVehicleLayoutInfo(0);
    v42 = *(_QWORD *)(v41 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v16, v40 + *(_QWORD *)(v42 + 72) * v39, v41);
    v43 = v100;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v16, 0, 1, v41);
    v44 = v97;
  }
  else
  {
    v41 = type metadata accessor for CAUVehicleLayoutInfo(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v16, 1, 1, v41);
    v44 = v97;
    v43 = v100;
  }
  v45 = v91;
  swift_bridgeObjectRelease(v35);
  v97 = (_QWORD *)v44[1];
  ((void (*)(char *, uint64_t))v97)(v13, v102);
  type metadata accessor for CAUVehicleLayoutInfo(0);
  v46 = *(_QWORD *)(v41 - 8);
  v47 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48))(v16, 1, v41);
  v48 = (uint64_t)v99;
  if (v47 == 1)
  {
    sub_100009FE0((uint64_t)v16, &qword_10001D878);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v95 + 56))(v48, 1, 1, v96);
    v49 = v88;
    v50 = v98;
  }
  else
  {
    CAUVehicleLayoutInfo.baselineAnchor.getter();
    v48 = (uint64_t)v99;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v41);
    v51 = v95;
    v52 = v96;
    v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v48, 1, v96);
    v49 = v88;
    v50 = v98;
    if (v53 != 1)
    {
      v72 = v90;
      v73 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 32))(v90, v48, v52);
      v74 = CAUBaselineAnchor.x.getter(v73);
      v75 = *(double *)(v101 + v28[8] + 32) * (double)v74 + *(double *)(v101 + v28[8]);
      CAUBaselineAnchor.y.getter();

      (*(void (**)(char *, uint64_t))(v51 + 8))(v72, v52);
      ((void (*)(char *, uint64_t))v25[1])(v86, v87);
      return *(_QWORD *)&v75;
    }
  }
  sub_100009FE0(v48, &qword_10001DEA8);
  v103 = 1;
  CAFPositionedRequired.layoutKey.getter(v85);
  v54 = ((uint64_t (*)(char *, uint64_t))v44[11])(v43, v102);
  if (v54 == enum case for CAUVehicleLayoutKey.frunk(_:)
    || v54 == enum case for CAUVehicleLayoutKey.hood(_:)
    || v54 == enum case for CAUVehicleLayoutKey.trunk(_:))
  {
    v30 = sub_10000EE28();
    v71 = v70;

    ((void (*)(char *, uint64_t))v25[1])(v86, v87);
    v103 = v71 & 1;
    return v30;
  }
  v55 = (uint64_t (*)(char *, char *, uint64_t))v44[2];
  v56 = v92;
  v57 = v55(v92, v43, v102);
  CAUVehicleLayoutKey.side.getter(v57);
  v59 = v93;
  v58 = v94;
  v60 = *(void (**)(char *, _QWORD, uint64_t))(v93 + 104);
  v60(v94, enum case for CAUVehicleLayoutKey.Side.left(_:), v49);
  v61 = static CAUVehicleLayoutKey.Side.== infix(_:_:)(v50, v58);
  v62 = *(void (**)(char *, uint64_t))(v59 + 8);
  v62(v58, v49);
  v62(v50, v49);
  if ((v61 & 1) != 0)
  {
    v30 = sub_10000EC9C();
    v64 = v63;

    v65 = v102;
    v66 = (void (*)(char *, uint64_t))v97;
    ((void (*)(char *, uint64_t))v97)(v56, v102);
    ((void (*)(char *, uint64_t))v25[1])(v86, v87);
    v67 = (v64 & 1) == 0;
    v103 = v64 & 1;
    v68 = *(double *)&v30;
    v69 = -36.0;
LABEL_19:
    v83 = v68 + v69;
    if (v67)
      v30 = *(_QWORD *)&v83;
    v66(v100, v65);
    return v30;
  }
  v99 = (void (**)(char *, uint64_t))v25;
  v76 = v102;
  v66 = (void (*)(char *, uint64_t))v97;
  ((void (*)(char *, uint64_t))v97)(v56, v102);
  v77 = v89;
  v78 = v55(v89, v100, v76);
  v79 = v77;
  CAUVehicleLayoutKey.side.getter(v78);
  v60(v58, enum case for CAUVehicleLayoutKey.Side.right(_:), v49);
  LOBYTE(v77) = static CAUVehicleLayoutKey.Side.== infix(_:_:)(v50, v58);
  v62(v58, v49);
  v62(v50, v49);
  if ((v77 & 1) != 0)
  {
    v30 = sub_10000EC9C();
    v81 = v80;

    v82 = v79;
    v65 = v102;
    v66(v82, v102);
    v99[1](v86, v87);
    v67 = (v81 & 1) == 0;
    v103 = v81 & 1;
    v68 = *(double *)&v30;
    v69 = 36.0;
    goto LABEL_19;
  }
  v66(v79, v102);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000029, 0x8000000100013670, "Closures/ClosuresWidgetView.swift", 33, 2, 248, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  double v14;
  uint64_t v15;

  v1 = v0;
  v2 = sub_100004E24(&qword_10001D878);
  __chkstk_darwin(v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DoorView(0);
  sub_100009CF8(v1 + *(int *)(v9 + 40), (uint64_t)v4, &qword_10001D878);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100009FE0((uint64_t)v4, &qword_10001D878);
    *(double *)&result = 0.0;
  }
  else
  {
    v11 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    CAUVehicleLayoutInfo.y.getter(v11);
    v12 = CAUVehicleLayoutInfo.height.getter();
    v13 = (double *)(v1 + *(int *)(v9 + 32));
    v14 = (double)(int)CAUVehicleLayoutInfo.x.getter(v12);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(double *)&result = v13[4] * v14 + *v13;
  }
  return result;
}

uint64_t sub_10000EE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;

  v1 = v0;
  v2 = sub_100004E24(&qword_10001D878);
  __chkstk_darwin(v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DoorView(0);
  sub_100009CF8(v1 + *(int *)(v9 + 40), (uint64_t)v4, &qword_10001D878);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100009FE0((uint64_t)v4, &qword_10001D878);
    return 0;
  }
  else
  {
    v11 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v12 = (double)(int)CAUVehicleLayoutInfo.x.getter(v11);
    v13 = CAUVehicleLayoutInfo.width.getter();
    v14 = *(double *)(v1 + *(int *)(v9 + 32))
        + *(double *)(v1 + *(int *)(v9 + 32) + 32) * ((double)(int)v13 * 0.5 + v12);
    CAUVehicleLayoutInfo.y.getter(v13);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return *(_QWORD *)&v14;
  }
}

uint64_t sub_10000EFBC@<X0>(uint64_t a1@<X8>)
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
  v41 = sub_100004E24(&qword_10001DBE0);
  v40 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v39 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100004E24(&qword_10001DBE8);
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
  v37 = sub_100004E24(&qword_10001DBF0);
  __chkstk_darwin(v37);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100004E24(&qword_10001DBF8);
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
  v46[0] = xmmword_100014B80;
  v46[1] = xmmword_100014B90;
  v46[2] = xmmword_100014BA0;
  v46[3] = xmmword_100014BB0;
  v46[4] = xmmword_100014BC0;
  v22 = v39;
  View._colorMatrix(_:)(v46, &type metadata for _BackdropEffectPlaceholder, &protocol witness table for _BackdropEffectPlaceholder);
  v23 = v40;
  v24 = v41;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v4, v22, v41);
  v25 = &v4[*(int *)(sub_100004E24(&qword_10001DC00) + 36)];
  *(_QWORD *)v25 = 0x403E000000000000;
  v25[8] = 0;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
  sub_100009CF8((uint64_t)v4, (uint64_t)&v14[*(int *)(v37 + 36)], &qword_10001DBE8);
  *(_QWORD *)v14 = v21;
  *((_QWORD *)v14 + 1) = 0;
  *((_WORD *)v14 + 8) = 1;
  v26 = sub_100009FE0((uint64_t)v4, &qword_10001DBE8);
  v27 = static Alignment.center.getter(v26);
  _FrameLayout.init(width:height:alignment:)(v45, 0x7FF0000000000000, 0, 0x7FF0000000000000, 0, v27, v28);
  v29 = v38;
  sub_100009CF8((uint64_t)v14, v38, &qword_10001DBF0);

  v30 = v43;
  v31 = (_OWORD *)(v29 + *(int *)(v43 + 36));
  v32 = v45[1];
  *v31 = v45[0];
  v31[1] = v32;
  v31[2] = v45[2];
  sub_100009FE0((uint64_t)v14, &qword_10001DBF0);
  v33 = v44;
  sub_100009F9C(v29, v44, &qword_10001DBF8);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56))(v33, 0, 1, v30);
}

uint64_t sub_10000F440@<X0>(uint64_t a1@<X8>)
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

  v2 = sub_100004E24(&qword_10001DBC8);
  v3 = __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v5 = static Alignment.center.getter(v3);
  v5[1] = v6;
  v7 = sub_100004E24(&qword_10001DBD0);
  v8 = sub_10000EFBC((uint64_t)v5 + *(int *)(v7 + 44));
  v9 = static Alignment.center.getter(v8);
  sub_10000D004(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v9, v10);
  return sub_100009FE0((uint64_t)v5, &qword_10001DBC8);
}

uint64_t sub_10000F524@<X0>(uint64_t a1@<X8>)
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
  __chkstk_darwin(v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004E24(&qword_10001DD40);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100009CF8(v2, (uint64_t)v10, &qword_10001DD40);
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
      v21 = sub_10000A5A4(0x686353726F6C6F43, 0xEB00000000656D65, &v22);
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

unint64_t sub_10000F764(uint64_t a1)
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
  v6 = sub_100004DE4(&qword_10001D8E0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000F7D0(a1, v7);
}

unint64_t sub_10000F7D0(uint64_t a1, uint64_t a2)
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
      v14 = sub_100004DE4(&qword_10001DD60, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutKey, (uint64_t)&protocol conformance descriptor for CAUVehicleLayoutKey);
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

uint64_t sub_10000F910@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F938(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000F960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_10000F9DC()
{
  unint64_t result;

  result = qword_10001DB58;
  if (!qword_10001DB58)
  {
    result = swift_getWitnessTable(&unk_100014CB4, &type metadata for CarObservingView);
    atomic_store(result, (unint64_t *)&qword_10001DB58);
  }
  return result;
}

uint64_t sub_10000FA20(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009208(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000FA8C()
{
  unint64_t result;

  result = qword_10001DB68;
  if (!qword_10001DB68)
  {
    result = swift_getWitnessTable("=G", &type metadata for RedactedCarView);
    atomic_store(result, (unint64_t *)&qword_10001DB68);
  }
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

uint64_t sub_10000FC8C()
{
  return sub_10000A478(&qword_10001DB88, &qword_10001DB38, (uint64_t)&protocol conformance descriptor for SubscriptionView<A, B>);
}

uint64_t sub_10000FCB8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001527C, 1);
}

uint64_t sub_10000FCC8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100015254, 1);
}

uint64_t type metadata accessor for CarView(uint64_t a1)
{
  return sub_100010E0C(a1, (uint64_t *)&unk_10001DC60, (uint64_t)&nominal type descriptor for CarView);
}

uint64_t sub_10000FCEC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000FD18()
{
  uint64_t v0;

  return sub_10000BF50(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_10000FD24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DBA0;
  if (!qword_10001DBA0)
  {
    v1 = sub_100009208(&qword_10001DB98);
    sub_100004DE4(&qword_10001DBA8, type metadata accessor for CarView, (uint64_t)&unk_100014D40);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DBA0);
  }
  return result;
}

uint64_t sub_10000FDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FDEC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000FE28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DBB8;
  if (!qword_10001DBB8)
  {
    v1 = sub_100009208(&qword_10001DBB0);
    sub_100004DE4(&qword_10001DBC0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t)&protocol conformance descriptor for CAUVehicleLayout);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001DBB8);
  }
  return result;
}

char *sub_10000FEA4(char *a1, char **a2, int *a3)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  id v24;
  char *__dst;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
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
    v10 = a3[7];
    __dst = &a1[v10];
    v11 = (char *)a2 + v10;
    v12 = type metadata accessor for CAUVehicleLayout(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    v15 = v4;
    v16 = v8;
    v17 = v9;
    if (v14(v11, 1, v12))
    {
      v18 = sub_100004E24(&qword_10001DBB0);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v19 = a3[8];
    v20 = a3[9];
    v21 = *(char **)((char *)a2 + v19);
    *(_QWORD *)&v7[v19] = v21;
    v22 = &v7[v20];
    v23 = (uint64_t)a2 + v20;
    *v22 = *(_BYTE *)v23;
    v4 = *(char **)(v23 + 8);
    *((_QWORD *)v22 + 1) = v4;
    v24 = v21;
  }
  swift_retain(v4);
  return v7;
}

uint64_t sub_10000FFEC(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (char *)a1 + a2[7];
  v5 = type metadata accessor for CAUVehicleLayout(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);

  return swift_release(*(id *)((char *)a1 + a2[9] + 8));
}

_QWORD *sub_10001008C(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  id v24;
  char *__dst;

  v6 = *(void **)a2;
  v7 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = *(void **)(a2 + 16);
  a1[2] = v8;
  v9 = a3[7];
  __dst = (char *)a1 + v9;
  v10 = (const void *)(a2 + v9);
  v11 = type metadata accessor for CAUVehicleLayout(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v6;
  v15 = v7;
  v16 = v8;
  if (v13(v10, 1, v11))
  {
    v17 = sub_100004E24(&qword_10001DBB0);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v18 = a3[8];
  v19 = a3[9];
  v20 = *(void **)(a2 + v18);
  *(_QWORD *)((char *)a1 + v18) = v20;
  v21 = (char *)a1 + v19;
  v22 = (char *)(a2 + v19);
  *v21 = *v22;
  v23 = *((_QWORD *)v22 + 1);
  *((_QWORD *)v21 + 1) = v23;
  v24 = v20;
  swift_retain(v23);
  return a1;
}

uint64_t sub_1000101B4(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  v9 = *(void **)(a1 + 8);
  v10 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v10;
  v11 = v10;

  v12 = *(void **)(a2 + 16);
  v13 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  v14 = v12;

  v15 = a3[7];
  v16 = (void *)(a1 + v15);
  v17 = (void *)(a2 + v15);
  v18 = type metadata accessor for CAUVehicleLayout(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v16, v17, v18);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = sub_100004E24(&qword_10001DBB0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
LABEL_7:
  v24 = a3[8];
  v25 = *(void **)(a2 + v24);
  v26 = *(void **)(a1 + v24);
  *(_QWORD *)(a1 + v24) = v25;
  v27 = v25;

  v28 = a3[9];
  v29 = a1 + v28;
  v30 = a2 + v28;
  *(_BYTE *)v29 = *(_BYTE *)v30;
  v31 = *(_QWORD *)(v29 + 8);
  v32 = *(_QWORD *)(v30 + 8);
  *(_QWORD *)(v29 + 8) = v32;
  swift_retain(v32);
  swift_release(v31);
  return a1;
}

uint64_t sub_100010344(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for CAUVehicleLayout(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100004E24(&qword_10001DBB0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t sub_10001042C(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v9 = a3[7];
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
    v17 = sub_100004E24(&qword_10001DBB0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = a3[8];
  v19 = *(void **)(a1 + v18);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)((char *)a2 + v18);

  v20 = a3[9];
  v21 = a1 + v20;
  v22 = (char *)a2 + v20;
  *(_BYTE *)v21 = *v22;
  v23 = *(_QWORD *)(v21 + 8);
  *(_QWORD *)(v21 + 8) = *((_QWORD *)v22 + 1);
  swift_release(v23);
  return a1;
}

uint64_t sub_1000105A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000105B0);
}

uint64_t sub_1000105B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100004E24(&qword_10001DBB0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_100010630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001063C);
}

uint64_t sub_10001063C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_100004E24(&qword_10001DBB0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_1000106B4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "\b";
  v4[1] = "\b";
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_100011E7C(319, (unint64_t *)&unk_10001DC70, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_100014D28;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
  }
}

uint64_t sub_10001075C()
{
  return sub_100010788(&qword_10001DCB0, &qword_10001DCB8, (void (*)(void))sub_10000FD24);
}

uint64_t sub_100010788(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009208(a2);
    a3();
    sub_10000FA20(&qword_10001DB60, &qword_10001DB48, (void (*)(void))sub_10000FA8C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100010810()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DCC0;
  if (!qword_10001DCC0)
  {
    v1 = sub_100009208(&qword_10001DBD8);
    sub_10000A478(&qword_10001DCC8, &qword_10001DBC8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DCC0);
  }
  return result;
}

uint64_t sub_100010894(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000152CC, 1);
}

unint64_t sub_1000108A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DCD8;
  if (!qword_10001DCD8)
  {
    v1 = sub_100009208(&qword_10001DCD0);
    sub_10000A478(&qword_10001DCE0, &qword_10001DCE8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DCD8);
  }
  return result;
}

uint64_t sub_100010928()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)type metadata accessor for CarView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  v6 = v0 + v4;
  v7 = v0 + v4 + v1[7];
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);

  swift_release(*(_QWORD *)(v6 + v1[9] + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100010A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100010A58@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarView(0) - 8) + 80);
  return sub_10000C2BC(*(void **)(v1 + 16), v1 + ((v3 + 24) & ~v3), a1);
}

uint64_t sub_100010AA8()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)type metadata accessor for CarView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v0 + v4;

  v7 = v0 + v4 + v1[7];
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);

  swift_release(*(_QWORD *)(v6 + v1[9] + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_100010B8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarView(0) - 8) + 80);
  sub_10000D850(v0 + ((v1 + 16) & ~v1));
}

_QWORD *sub_100010BB8(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_100010BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRetain(a8);
    swift_bridgeObjectRetain(a9);
    swift_bridgeObjectRetain(a12);
    return swift_retain(a14);
  }
  return result;
}

uint64_t sub_100010C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a9);
    swift_bridgeObjectRelease(a12);
    return swift_release(a14);
  }
  return result;
}

_QWORD *sub_100010C80(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t sub_100010CA8()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)type metadata accessor for CarView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v0 + v4;

  v7 = v0 + v4 + v1[7];
  v8 = type metadata accessor for CAUVehicleLayout(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);

  swift_release(*(_QWORD *)(v6 + v1[9] + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100010D8C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarView(0) - 8) + 80);
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(_OWORD *)(v2 + 32);
  v9[0] = *(_OWORD *)(v2 + 16);
  v9[1] = v7;
  v10 = v6;
  return sub_10000D1C0(a1, (double *)v9, v2 + ((v5 + 56) & ~v5), a2);
}

uint64_t type metadata accessor for DoorView(uint64_t a1)
{
  return sub_100010E0C(a1, (uint64_t *)&unk_10001DDC8, (uint64_t)&nominal type descriptor for DoorView);
}

uint64_t sub_100010E0C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100010E40()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100010E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000F960(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t *sub_100010E84(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *__dst;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004E24(&qword_10001DD40);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = (void *)v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = (uint64_t)v19;
    v20 = a3[7];
    v21 = a3[8];
    v22 = *(void **)((char *)a2 + v20);
    *(uint64_t *)((char *)a1 + v20) = (uint64_t)v22;
    v23 = (char *)a1 + v21;
    v24 = (char *)a2 + v21;
    v25 = *((_OWORD *)v24 + 1);
    *(_OWORD *)v23 = *(_OWORD *)v24;
    *((_OWORD *)v23 + 1) = v25;
    *((_QWORD *)v23 + 4) = *((_QWORD *)v24 + 4);
    v26 = a3[9];
    __dst = (char *)a1 + v26;
    v27 = (char *)a2 + v26;
    v28 = type metadata accessor for CAUVehicleLayout(0);
    v29 = *(_QWORD *)(v28 - 8);
    v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    v31 = v18;
    v32 = v19;
    v33 = v22;
    if (v30(v27, 1, v28))
    {
      v34 = sub_100004E24(&qword_10001DBB0);
      memcpy(__dst, v27, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(__dst, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(__dst, 0, 1, v28);
    }
    v35 = a3[10];
    v36 = (char *)a1 + v35;
    v37 = (char *)a2 + v35;
    v38 = type metadata accessor for CAUVehicleLayoutInfo(0);
    v39 = *(_QWORD *)(v38 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
    {
      v40 = sub_100004E24(&qword_10001D878);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
    }
  }
  return a1;
}

uint64_t sub_1000110CC(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v4 = sub_100004E24(&qword_10001DD40);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

  v6 = (char *)a1 + a2[9];
  v7 = type metadata accessor for CAUVehicleLayout(0);
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  v9 = (char *)a1 + a2[10];
  v10 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  return result;
}

uint64_t *sub_1000111FC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *__dst;

  v6 = sub_100004E24(&qword_10001DD40);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = (uint64_t *)((char *)a1 + v12);
  v15 = (uint64_t *)((char *)a2 + v12);
  v16 = (void *)v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = *(void **)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v17;
  v18 = a3[7];
  v19 = a3[8];
  v20 = *(void **)((char *)a2 + v18);
  *(uint64_t *)((char *)a1 + v18) = (uint64_t)v20;
  v21 = (char *)a1 + v19;
  v22 = (char *)a2 + v19;
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  v24 = a3[9];
  __dst = (char *)a1 + v24;
  v25 = (char *)a2 + v24;
  v26 = type metadata accessor for CAUVehicleLayout(0);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v16;
  v30 = v17;
  v31 = v20;
  if (v28(v25, 1, v26))
  {
    v32 = sub_100004E24(&qword_10001DBB0);
    memcpy(__dst, v25, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(__dst, v25, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(__dst, 0, 1, v26);
  }
  v33 = a3[10];
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  v36 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v37 = *(_QWORD *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    v38 = sub_100004E24(&qword_10001D878);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  return a1;
}

uint64_t *sub_100011418(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(char *, uint64_t, uint64_t);
  int v44;
  int v45;
  uint64_t v46;

  if (a1 != a2)
  {
    sub_100009FE0((uint64_t)a1, &qword_10001DD40);
    v6 = sub_100004E24(&qword_10001DD40);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  *v13 = *v14;
  v15 = (void *)v14[1];
  v16 = (void *)v13[1];
  v13[1] = v15;
  v17 = v15;

  v18 = a3[6];
  v19 = *(void **)((char *)a1 + v18);
  v20 = *(void **)((char *)a2 + v18);
  *(uint64_t *)((char *)a1 + v18) = (uint64_t)v20;
  v21 = v20;

  v22 = a3[7];
  v23 = *(void **)((char *)a1 + v22);
  v24 = *(void **)((char *)a2 + v22);
  *(uint64_t *)((char *)a1 + v22) = (uint64_t)v24;
  v25 = v24;

  v26 = a3[8];
  v27 = (uint64_t *)((char *)a1 + v26);
  v28 = (uint64_t *)((char *)a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  v27[2] = v28[2];
  v27[3] = v28[3];
  v27[4] = v28[4];
  v29 = a3[9];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = type metadata accessor for CAUVehicleLayout(0);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v36)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
LABEL_11:
    v37 = sub_100004E24(&qword_10001DBB0);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
LABEL_12:
  v38 = a3[10];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  v41 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v42 = *(_QWORD *)(v41 - 8);
  v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  v44 = v43(v39, 1, v41);
  v45 = v43(v40, 1, v41);
  if (!v44)
  {
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 24))(v39, v40, v41);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
    goto LABEL_17;
  }
  if (v45)
  {
LABEL_17:
    v46 = sub_100004E24(&qword_10001D878);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v40, v41);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
  return a1;
}

char *sub_100011704(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_100004E24(&qword_10001DD40);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
  v13 = a3[9];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for CAUVehicleLayout(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = sub_100004E24(&qword_10001DBB0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v19 = a3[10];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = sub_100004E24(&qword_10001D878);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *sub_1000118F0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;

  if (a1 != a2)
  {
    sub_100009FE0((uint64_t)a1, &qword_10001DD40);
    v6 = sub_100004E24(&qword_10001DD40);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  v13 = (void *)*((_QWORD *)v9 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;

  v14 = a3[6];
  v15 = *(void **)&a1[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];

  v16 = a3[7];
  v17 = *(void **)&a1[v16];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];

  v18 = a3[8];
  v19 = a3[9];
  v20 = &a1[v18];
  v21 = &a2[v18];
  v22 = *((_OWORD *)v21 + 1);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *((_OWORD *)v20 + 1) = v22;
  *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
  v23 = &a1[v19];
  v24 = &a2[v19];
  v25 = type metadata accessor for CAUVehicleLayout(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
LABEL_10:
    v30 = sub_100004E24(&qword_10001DBB0);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_11:
  v31 = a3[10];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = type metadata accessor for CAUVehicleLayoutInfo(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v32, v33, v34);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_16;
  }
  if (v38)
  {
LABEL_16:
    v39 = sub_100004E24(&qword_10001D878);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

uint64_t sub_100011BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011BB4);
}

uint64_t sub_100011BB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_100004E24(&qword_10001DD68);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v13 = sub_100004E24(&qword_10001DBB0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[9];
    }
    else
    {
      v8 = sub_100004E24(&qword_10001D878);
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[10];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[5] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_100011C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011C9C);
}

uint64_t sub_100011C9C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_100004E24(&qword_10001DD68);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[5] + 8) = (a2 - 1);
      return result;
    }
    v13 = sub_100004E24(&qword_10001DBB0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[9];
    }
    else
    {
      v10 = sub_100004E24(&qword_10001D878);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[10];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_100011D74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[7];

  sub_100011E7C(319, &qword_10001DDD8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    v8[1] = &unk_100014DD0;
    v8[2] = "\b";
    v8[3] = "\b";
    v8[4] = &unk_100014DE8;
    sub_100011E7C(319, (unint64_t *)&unk_10001DC70, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayout, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v8[5] = *(_QWORD *)(v4 - 8) + 64;
      sub_100011E7C(319, (unint64_t *)&unk_10001DDE0, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleLayoutInfo, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v7 <= 0x3F)
      {
        v8[6] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 7, v8, a1 + 16);
      }
    }
  }
}

void sub_100011E7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_100011ED4()
{
  return sub_100010788(&qword_10001DE28, &qword_10001DE30, (void (*)(void))sub_1000108A4);
}

uint64_t sub_100011F00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000152F4, 1);
}

unint64_t sub_100011F10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DE50;
  if (!qword_10001DE50)
  {
    v1 = sub_100009208(&qword_10001DE48);
    sub_100011F74();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001DE50);
  }
  return result;
}

unint64_t sub_100011F74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DE58;
  if (!qword_10001DE58)
  {
    v1 = sub_100009208(&qword_10001DE60);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DE58);
  }
  return result;
}

uint64_t sub_100011FD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100012000(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100012028()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100012048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000F960(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

unint64_t sub_100012070()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DEB0;
  if (!qword_10001DEB0)
  {
    v1 = sub_100009208(&qword_10001DEB8);
    sub_100011F10();
    sub_10000A478(&qword_10001DE68, &qword_10001DE38, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001DEB0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC8ClosuresP33_F6763F3765C4EE81890AA73FA33246C219ResourceBundleClass);
}
