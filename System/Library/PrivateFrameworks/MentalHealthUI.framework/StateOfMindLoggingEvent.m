@implementation StateOfMindLoggingEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)(id)sub_2418A9DB0();
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2417F5D94((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_2417F4F90);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2417F5D94((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_2417F5988);
}

@end
