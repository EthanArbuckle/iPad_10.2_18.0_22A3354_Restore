id sub_100004BFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSMainViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CSMainViewController()
{
  return objc_opt_self(_TtC14CompanionSetup20CSMainViewController);
}

void type metadata accessor for LaunchOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000D158)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100008288);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000D158);
  }
}

uint64_t sub_100004CA0(uint64_t a1, uint64_t a2)
{
  return sub_100004D68(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004CAC(uint64_t a1)
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

Swift::Int sub_100004CEC(uint64_t a1)
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

uint64_t sub_100004D5C(uint64_t a1, uint64_t a2)
{
  return sub_100004D68(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004D68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100004DA4(uint64_t a1, id *a2)
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

uint64_t sub_100004E18(uint64_t a1, id *a2)
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

uint64_t sub_100004E94@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004ED4(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100004F5C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004FA0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004FC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000050A0((unint64_t *)&qword_10000D178, (uint64_t)&unk_100007044);
  v3 = sub_1000050A0((unint64_t *)&unk_10000D180, (uint64_t)&unk_100006F98);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005034()
{
  return sub_1000050A0(&qword_10000D160, (uint64_t)&unk_100006F5C);
}

uint64_t sub_100005058()
{
  return sub_1000050A0(&qword_10000D168, (uint64_t)&unk_100006F30);
}

uint64_t sub_10000507C()
{
  return sub_1000050A0(&qword_10000D170, (uint64_t)&unk_100006FCC);
}

uint64_t sub_1000050A0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_100005348()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *ObjCClassFromMetadata;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = type metadata accessor for MainActor(0);
  static MainActor.shared.getter();
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("", 0, 1, 0, v4, v6);
  v7 = type metadata accessor for AppDelegate();
  v8 = static CommandLine.unsafeArgv.getter();
  v9 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v10 = static CommandLine.argc.getter(v9);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v7);
  v12 = NSStringFromClass(ObjCClassFromMetadata);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  LODWORD(v12) = UIApplicationMain(_:_:_:_:)(v10, v8, 0, 0, v13, v15);
  swift_bridgeObjectRelease(v15);
  exit((int)v12);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC14CompanionSetup11AppDelegate);
}

id sub_100005478(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSString v9;
  id v10;

  v2 = type metadata accessor for MainActor(0);
  v3 = static MainActor.shared.getter();
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/AppDelegate.swift", 32, 1, 19, v4, v6);
  v7 = objc_msgSend(a1, "role");
  v8 = objc_allocWithZone((Class)UISceneConfiguration);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v8, "initWithName:sessionRole:", v9, v7);
  swift_release(v3);

  return v10;
}

unint64_t sub_100005570()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000D178;
  if (!qword_10000D178)
  {
    type metadata accessor for LaunchOptionsKey();
    result = swift_getWitnessTable(&unk_100007044, v1);
    atomic_store(result, (unint64_t *)&qword_10000D178);
  }
  return result;
}

id sub_100005910()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC14CompanionSetup13SceneDelegate);
}

void sub_100005970(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v2 = v1;
  v4 = type metadata accessor for MainActor(0);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 14, v6, v8);
  v9 = objc_opt_self(UIWindowScene);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10)
  {
    v11 = v10;
    v12 = objc_allocWithZone((Class)type metadata accessor for CSMainViewController());
    v13 = a1;
    v14 = objc_msgSend(v12, "initWithNibName:bundle:", 0, 0);
    v15 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v11);
    objc_msgSend(v15, "setRootViewController:", v14);
    v21 = v15;
    v16 = static MainActor.shared.getter();
    v17 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
    v19 = v18;
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor("CompanionSetup/SceneDelegate.swift", 34, 1, 12, v17, v19);
    v20 = *(void **)(v2 + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC14CompanionSetup13SceneDelegate_window) = v15;
    swift_release(v16);

    objc_msgSend(v21, "makeKeyAndVisible");
    swift_release(v5);

  }
  else
  {
    swift_release(v5);
  }
}

uint64_t sub_100005B44()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC14CompanionSetupP33_BC9CA869A7F59B9AFA951697B45836D319ResourceBundleClass);
}
