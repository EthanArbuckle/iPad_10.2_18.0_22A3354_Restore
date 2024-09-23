@implementation MedicationRoomInteractionEvent

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
  return sub_1BCB2D700((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1BCB2C9F4);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_1BCB2D700((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1BCB2CF20);
}

@end
