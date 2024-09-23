@implementation HearingSessionSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10HearingApp27HearingSessionSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100006C84(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  sub_100006370(self, (uint64_t)a2, a3, "SessionSceneDelegate: sceneDidDisconnect");
}

- (void)sceneDidBecomeActive:(id)a3
{
  sub_100006370(self, (uint64_t)a2, a3, "SessionSceneDelegate: sceneDidBecomeActive");
}

- (void)sceneWillResignActive:(id)a3
{
  sub_100006370(self, (uint64_t)a2, a3, "SessionSceneDelegate: sceneWillResignActive");
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_100006370(self, (uint64_t)a2, a3, "SessionSceneDelegate: sceneWillEnterForeground");
}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_100006370(self, (uint64_t)a2, a3, "SessionSceneDelegate: sceneDidEnterBackground");
}

- (_TtC10HearingApp27HearingSessionSceneDelegate)init
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _TtC10HearingApp27HearingSessionSceneDelegate *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider;
  v4 = type metadata accessor for LiveListenSystemApertureViewController();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v5, "init");
  Logger.init(subsystem:category:)(0xD000000000000011, 0x800000010000AED0, 0xD000000000000015, 0x800000010000AEF0);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for HearingSessionSceneDelegate(0);
  return -[HearingSessionSceneDelegate init](&v8, "init");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider));
  v3 = (char *)self + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
