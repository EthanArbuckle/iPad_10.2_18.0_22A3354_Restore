@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5Media11AppDelegate *v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100073778();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = qword_1000A0890;
  v11 = a3;
  v12 = self;
  if (v10 != -1)
    swift_once(&qword_1000A0890, sub_100007508);
  sub_100007BA4(0, 0);
  if (qword_1000A0918 != -1)
    swift_once(&qword_1000A0918, sub_1000715D0);
  objc_msgSend((id)qword_1000A6338, "registerObserver:", v12);

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC5Media11AppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000731BC(a4);

}

- (_TtC5Media11AppDelegate)init
{
  return (_TtC5Media11AppDelegate *)sub_100072ACC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____TtC5Media11AppDelegate__carWindow;
  v4 = sub_1000061A8(&qword_1000A0F80);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC5Media11AppDelegate__clusterWindow, v4);
  v5((char *)self + OBJC_IVAR____TtC5Media11AppDelegate__passengerWindow, v4);
  v6 = (char *)self + OBJC_IVAR____TtC5Media11AppDelegate__isClusterMapsAndMedia;
  v7 = sub_1000061A8((uint64_t *)&unk_1000A1600);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  _TtC5Media11AppDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000735A4(v6);

}

@end
