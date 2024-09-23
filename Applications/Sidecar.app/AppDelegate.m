@implementation AppDelegate

- (_TtC7Sidecar11AppDelegate)init
{
  return (_TtC7Sidecar11AppDelegate *)sub_100003700();
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7Sidecar11AppDelegate *v11;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    sub_100005774(&qword_100022838, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001693C);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  sub_100003944();

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7Sidecar11AppDelegate *v11;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    sub_100005774(&qword_100022838, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001693C);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  sub_100003A20((uint64_t)v11, (uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  _TtC7Sidecar11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100003ED4();

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC7Sidecar11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100003F74();

}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC7Sidecar11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10000400C();

}

- (void)sidecarServicePresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7Sidecar11AppDelegate *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_10001C9D0, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_10000414C(v7, v9, (uint64_t)sub_1000055E0, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)sidecarServicePresenterServiceExtensionReady:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7Sidecar11AppDelegate *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000048F0((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)sidecarServicePresenterTerminate
{
  _TtC7Sidecar11AppDelegate *v2;

  v2 = self;
  sub_100004B94();

}

@end
