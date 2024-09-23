@implementation UserEventsMonitor

- (void)resetWithReason:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_210C9F2B0(v3);
  swift_release();

}

- (NSDictionary)stateDictionary
{
  void *v2;

  swift_retain();
  sub_210C9EEBC();
  swift_release();
  v2 = (void *)sub_210E92B00();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

@end
