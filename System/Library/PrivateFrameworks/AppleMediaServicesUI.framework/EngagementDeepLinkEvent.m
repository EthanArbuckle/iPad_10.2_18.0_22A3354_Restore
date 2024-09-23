@implementation EngagementDeepLinkEvent

- (NSDictionary)engagementData
{
  void *v2;

  if (EngagementDeepLinkEvent.engagementData.getter())
  {
    v2 = (void *)sub_211246300();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (_TtC20AppleMediaServicesUI23EngagementDeepLinkEvent)init
{
  EngagementDeepLinkEvent.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
