id sub_100001AE8()
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
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC24ProximityReaderUIService11AppDelegate);
}

id sub_100001CDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewController()
{
  return objc_opt_self(_TtC24ProximityReaderUIService14ViewController);
}

id sub_100001E48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC24ProximityReaderUIService13SceneDelegate);
}

void sub_100001EA8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_allocWithZone((Class)UIWindow);
    v7 = a1;
    v8 = objc_msgSend(v6, "initWithWindowScene:", v5);
    v9 = type metadata accessor for ViewController();
    v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v9)), "init");
    objc_msgSend(v8, "setRootViewController:", v10);
    objc_msgSend(v8, "makeKeyAndVisible");
    v11 = *(id *)(v1 + OBJC_IVAR____TtC24ProximityReaderUIService13SceneDelegate_window);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC24ProximityReaderUIService13SceneDelegate_window) = v8;

  }
}
