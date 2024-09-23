@implementation ICSAmbientActivityController

- (ICSAmbientActivityController)initWithCallCenter:(id)a3 notificationCenter:(id)a4 sceneManager:(id)a5
{
  return (ICSAmbientActivityController *)sub_1001635E0(a3, a4, a5);
}

- (void)requestActivityForCall:(id)a3
{
  ICSAmbientActivityController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100163878(v5);

}

- (ICSAmbientActivityController)init
{
  sub_100164458();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSAmbientActivityController_currentActivity));
}

- (void)handleCallStatusChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  ICSAmbientActivityController *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100164814((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

@end
