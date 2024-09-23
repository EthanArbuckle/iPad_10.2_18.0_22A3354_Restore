@implementation HealthBalanceOnboardingAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_23DC2A220();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  HealthBalanceOnboardingAnalyticsEvent.makeUnrestrictedEventPayload(with:)(v4);
  swift_release();

  v5 = (void *)sub_23DC2A16C();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_23DBF97DC(v4);
  swift_release();

  v5 = (void *)sub_23DC2A16C();
  swift_bridgeObjectRelease();
  return v5;
}

@end
