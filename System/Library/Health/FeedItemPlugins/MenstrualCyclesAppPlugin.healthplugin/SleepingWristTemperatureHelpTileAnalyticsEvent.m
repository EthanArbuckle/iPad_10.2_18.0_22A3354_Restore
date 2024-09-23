@implementation SleepingWristTemperatureHelpTileAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_231CA1BD8();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_2319580A0();
  swift_release();

  v5 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_2319579E8(v4);
  swift_release();

  v5 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v5;
}

@end
