@implementation DashboardClientProxy

- (void).cxx_destruct
{
  sub_23C951B58((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  sub_23C951B58((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  sub_23C951B58((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate);
}

- (void)didDismissDashboard
{
  self;
  DashboardClientProxy.didDismissDashboard()();
}

- (void)updateAccessPointFrameCoordinates:(id)a3
{
  id v4;

  v4 = a3;
  self;
  DashboardClientProxy.updateAccessPointFrameCoordinates(_:)((NSValue)v4);
}

- (void)isPresentingDashboardFromAccessPoint:(id)a3
{
  id v4;

  v4 = a3;
  self;
  DashboardClientProxy.isPresentingDashboardFromAccessPoint(_:)((NSValue)v4);
}

- (void)finishAndPlay:(id)a3
{
  sub_23C957414(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))DashboardClientProxy.finishAndPlay(_:));
}

- (void)finishWith:(id)a3
{
  sub_23C957414(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))DashboardClientProxy.finish(with:));
}

- (void)quitTurnBasedMatch:(id)a3
{
  sub_23C957414(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))DashboardClientProxy.quitTurnBasedMatch(_:));
}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC24GameCenterOverlayService20DashboardClientProxy *v10;
  Swift::String v11;

  v6 = sub_23C95A5C4();
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  DashboardClientProxy.setGameMode(bundleIdentifier:enabled:)(v11, (NSValue)v9);
}

@end
