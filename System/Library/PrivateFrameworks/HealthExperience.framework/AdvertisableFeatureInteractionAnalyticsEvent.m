@implementation AdvertisableFeatureInteractionAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_1BC933E88();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_1BC8B78D8(v4);
  swift_release();

  v5 = (void *)sub_1BC933DC8();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_1BC8BA060(v4);
  swift_release();

  v5 = (void *)sub_1BC933DC8();
  swift_bridgeObjectRelease();
  return v5;
}

@end
