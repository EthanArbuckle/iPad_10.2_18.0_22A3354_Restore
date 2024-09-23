@implementation MedicationListOnboardingEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_1BCB6410C();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;

  sub_1BCB2C478(MEMORY[0x1E0DEE9D8]);
  v4 = (void *)sub_1BCB640AC();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_1BCB39048(v4);
  swift_release();

  v5 = (void *)sub_1BCB640AC();
  swift_bridgeObjectRelease();
  return v5;
}

@end
