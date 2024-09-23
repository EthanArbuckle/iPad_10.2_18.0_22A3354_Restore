@implementation ServiceManager

- (_TtC7Sidecar14ServiceManager)init
{
  return (_TtC7Sidecar14ServiceManager *)sub_100006E6C();
}

- (void)dealloc
{
  _TtC7Sidecar14ServiceManager *v2;

  v2 = self;
  sub_10000721C();
}

- (void).cxx_destruct
{

  sub_100012798(OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController);
  sub_100012790(OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100012798(OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  sub_100012798(OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController);
  sub_100012790(OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices);
  sub_100012790(OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs);
  sub_10000FE84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig), *(_QWORD *)&self->window[OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig], *(_QWORD *)&self->navigationController[OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig]);
}

- (void)_screenDidConnectWithNote:(id)a3
{
  sub_10000D974(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10000D424);
}

- (void)_screenDidDisconnectWithNote:(id)a3
{
  sub_10000D974(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10000D6FC);
}

- (void)_handleHomeButtonPressedWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC7Sidecar14ServiceManager *v10;
  uint64_t v11;

  v5 = sub_1000054F4((uint64_t *)&unk_100022D18);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Notification(0);
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for Notification(0);
    v9 = 1;
  }
  sub_10000FF08((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_10000D9F4();

  sub_100012018((uint64_t)v7, (uint64_t *)&unk_100022D18);
}

- (void)_handleVolumeDownButtonPressedWithNote:(id)a3
{
  sub_10000DFB0(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)_handleVolumeUpButtonPressedWithNote:(id)a3
{
  sub_10000DFB0(self, (uint64_t)a2, (uint64_t)a3);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC7Sidecar14ServiceManager *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  sub_10000E6C4((uint64_t)v13, a4);
  v15 = v14;

  return v15;
}

@end
