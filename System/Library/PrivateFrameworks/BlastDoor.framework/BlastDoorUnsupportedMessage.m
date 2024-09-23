@implementation BlastDoorUnsupportedMessage

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4CD8FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorUnsupportedMessage_unsupportedMessage);
}

- (BlastDoorUnsupportedMessage)init
{
  BlastDoorUnsupportedMessage *result;

  result = (BlastDoorUnsupportedMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
