@implementation IMDWatchSatelliteSyncController

- (void)satelliteStateDidChange:(BOOL)a3
{
  objc_msgSend((id)objc_opt_self(), sel_synchronizeSatelliteStatus_, a3);
}

- (_TtC12IMDaemonCore31IMDWatchSatelliteSyncController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IMDWatchSatelliteSyncController();
  return -[IMDWatchSatelliteSyncController init](&v3, sel_init);
}

@end
