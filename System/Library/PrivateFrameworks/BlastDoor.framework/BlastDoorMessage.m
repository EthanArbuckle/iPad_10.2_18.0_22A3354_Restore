@implementation BlastDoorMessage

- (NSString)description
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)&self->message[OBJC_IVAR___BlastDoorMessage_message + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD0E2EC4(v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSAttributedString)content
{
  BlastDoorMessage *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4C9AC4();

  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4C9B64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSArray)attributionInfo
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C9CD4, (void (*)(void))type metadata accessor for _ObjCAttributionInfoWrapper);
}

- (BlastDoorMessage)init
{
  BlastDoorMessage *result;

  result = (BlastDoorMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->message[OBJC_IVAR___BlastDoorMessage_message + 40];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD0096D4(v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
