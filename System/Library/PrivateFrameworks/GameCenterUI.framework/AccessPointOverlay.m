@implementation AccessPointOverlay

- (void)updateAccessPointFrameCoordinates:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_retain();
  sub_1AB58E5FC(x, y, width, height);
  swift_release();
}

- (void)isPresentingDashboardFromAccessPoint:(BOOL)a3
{
  swift_retain();
  sub_1AB58E6CC(a3);
  swift_release();
}

- (void)setGameModeWithBundleIdentifier:(id)a3 enabled:(BOOL)a4
{
  sub_1AB7DAF90();
  swift_retain();
  sub_1AB58E758();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
