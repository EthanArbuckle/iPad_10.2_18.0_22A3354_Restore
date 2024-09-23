@implementation BlastDoorNotifyRecipientCommand

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for NotifyRecipientCommand, &OBJC_IVAR___BlastDoorNotifyRecipientCommand_notifyRecipientCommand);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorNotifyRecipientCommand *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BE468();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorNotifyRecipientCommand)init
{
  BlastDoorNotifyRecipientCommand *result;

  result = (BlastDoorNotifyRecipientCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorNotifyRecipientCommand_notifyRecipientCommand, (uint64_t (*)(_QWORD))type metadata accessor for NotifyRecipientCommand);
}

@end
