@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18DKPairingUIService11AppDelegate *v11;
  id v12;
  id v13;
  NSString v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_allocWithZone((Class)UISceneConfiguration);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithName:sessionRole:", v14, v12);

  return v15;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
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
  char *v17;
  id v18;
  _TtC18DKPairingUIService11AppDelegate *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v29;
  id v30;

  v8 = sub_100003808(&qword_10001A150);
  __chkstk_darwin(v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v29 - v16;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0));
  v30 = a3;
  v19 = self;
  v20 = objc_msgSend(v18, "init");
  v21 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v10, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  type metadata accessor for MainActor(0);
  v22 = v20;
  v23 = static MainActor.shared.getter();
  v24 = *(unsigned __int8 *)(v12 + 80);
  v25 = (v24 + 40) & ~v24;
  v26 = (char *)swift_allocObject(&unk_100014D80, v25 + v13, v24 | 7);
  *((_QWORD *)v26 + 2) = v23;
  *((_QWORD *)v26 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v26 + 4) = v22;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v26[v25], v15, v11);
  v27 = sub_10000D53C((uint64_t)v10, (uint64_t)&unk_10001A4F8, (uint64_t)v26);

  swift_release(v27);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return 1;
}

- (_TtC18DKPairingUIService11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
