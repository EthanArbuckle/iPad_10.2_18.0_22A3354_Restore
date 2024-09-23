@implementation MAGAngelAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC14MagnifierAngel19MAGAngelAppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100005CB0(&qword_10003C010, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002AAFC);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10001B5F8();
  swift_bridgeObjectRelease(v4);

  return v12 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14MagnifierAngel19MAGAngelAppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10001BB34(v9);

  return v12;
}

- (void)checkForDeactivationReasonWithNotification:(id)a3
{
  _TtC14MagnifierAngel19MAGAngelAppDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  if ((static MAGAXUtilities.isVoiceOverRunning.getter(v4) & 1) == 0)
    sub_1000169F8();

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6;
  _TtC14MagnifierAngel19MAGAngelAppDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_10001BDDC(a4, "Viewfinder session did start: %@", (uint64_t)&unk_100035D78, (uint64_t)&unk_10003CB38);

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6;
  _TtC14MagnifierAngel19MAGAngelAppDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_10001BDDC(a4, "Viewfinder session did end: %@", (uint64_t)&unk_100035D50, (uint64_t)&unk_10003CB20);

}

- (_TtC14MagnifierAngel19MAGAngelAppDelegate)init
{
  return (_TtC14MagnifierAngel19MAGAngelAppDelegate *)sub_10001AE08((uint64_t)self, (uint64_t)a2);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arEventHandler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_ouEventHandler));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager));

  v3 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime;
  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastPixelBufferCheckTime, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder));
  v5((char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->arService[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierSceneUIShowActivity]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->arService[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierAngelBundleID]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask));
}

- (uint64_t)applicationWillTerminate:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Log.angel.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_100025D00(0xD00000000000001CLL, 0x8000000100031170, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

@end
