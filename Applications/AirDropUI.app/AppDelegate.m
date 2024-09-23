@implementation AppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4;
  _TtC9AirDropUI11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000A5394(v4);

}

- (void)willEnterForeground
{
  _TtC9AirDropUI11AppDelegate *v2;
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  v2 = self;
  v3 = (_QWORD *)NameDropIdentity.shared.unsafeMutableAddressor();
  v4 = *v3;
  v5 = *(void (**)(uint64_t))(*(_QWORD *)*v3 + 128);
  v6 = swift_retain(*v3);
  v5(v6);

  swift_release(v4);
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  _TtC9AirDropUI33AirDropTransferSessionsController *v9;
  id v10;
  _TtC9AirDropUI11AppDelegate *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = sub_1000A5808();
  v8 = sub_1000A5844();
  v9 = (_TtC9AirDropUI33AirDropTransferSessionsController *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1000A588C((uint64_t)v9);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
}

- (_TtC9AirDropUI11AppDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC9AirDropUI11AppDelegate *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC9AirDropUI11AppDelegate_sessionsController;
  v3 = qword_10013ABF0;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_10013ABF0, sub_100028C8C);
  v5 = (void *)qword_100147DA0;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_100147DA0;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v8, "init");
}

- (void).cxx_destruct
{

}

@end
