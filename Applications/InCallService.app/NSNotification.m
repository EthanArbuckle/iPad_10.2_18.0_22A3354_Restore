@implementation NSNotification

+ (id)PHAlertInvoked
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static NSNotification.PHAlertInvoked.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

@end
