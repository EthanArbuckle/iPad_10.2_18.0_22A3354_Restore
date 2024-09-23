@implementation InternalPlayerController

- (NSDictionary)stateDictionary
{
  void *v2;

  swift_retain();
  sub_210C66910();
  swift_release();
  v2 = (void *)sub_210E92B00();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)resetWithReason:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_210C3B9C0();
  swift_release();

}

@end
