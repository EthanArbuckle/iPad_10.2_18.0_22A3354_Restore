@implementation HKInteractiveChartInteractionAnalyticsEvent

- (id)initFor:(id)a3 timeScopeSelected:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = sub_1D7B0B8E0(v5, a4);

  return v6;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDisplayType:(id)a3
{
  id v3;
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v4;

  v3 = a3;
  v4 = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)sub_1D7B0BA9C(v3);

  return v4;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)initWithShowMoreDataForDataType:(id)a3
{
  id v3;
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v4;

  v3 = a3;
  v4 = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)sub_1D7B0BB90(v3);

  return v4;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_1D7B4A38C();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;

  sub_1D7AE00F0(MEMORY[0x1E0DEE9D8]);
  v4 = (void *)sub_1D7B4A230();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  sub_1D7B0BD9C();

  v7 = (void *)sub_1D7B4A230();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent)init
{
  _TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *result;

  result = (_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
