@implementation HealthBalanceDailyAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_23DCE1D0C();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_23DC851CC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_23DC829D4);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_23DC851CC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_23DC84CBC);
}

@end
