@implementation MentalHealthAssessmentsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_2418A9DB0();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;

  sub_241875268(MEMORY[0x24BEE4AF8]);
  v4 = (void *)sub_2418A9D14();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_241863B5C(v4);
  swift_release();

  v5 = (void *)sub_2418A9D14();
  swift_bridgeObjectRelease();
  return v5;
}

@end
