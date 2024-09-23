@implementation BlastDoorScheduledMessageUpdate

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledMessageUpdate, &OBJC_IVAR___BlastDoorScheduledMessageUpdate_scheduledMessageUpdate);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorScheduledMessageUpdate *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4C7C8C();

  return (BlastDoorMetadata *)v3;
}

- (int64_t)scheduleState
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorScheduledMessageUpdate_scheduledMessageUpdate;
  return qword_1AD68D9E0[v2[*(int *)(type metadata accessor for ScheduledMessageUpdate() + 20)]];
}

- (BlastDoorScheduledMessageUpdate)init
{
  BlastDoorScheduledMessageUpdate *result;

  result = (BlastDoorScheduledMessageUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorScheduledMessageUpdate_scheduledMessageUpdate, (uint64_t (*)(_QWORD))type metadata accessor for ScheduledMessageUpdate);
}

@end
