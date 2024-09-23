@implementation BlastDoorBasicMessage

- (NSString)description
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)&self->basicMessage[OBJC_IVAR___BlastDoorBasicMessage_basicMessage + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AD0E2EC4(v2);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (NSAttributedString)content
{
  BlastDoorBasicMessage *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4AD080();

  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4C9B64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (BlastDoorBasicMessage)init
{
  BlastDoorBasicMessage *result;

  result = (BlastDoorBasicMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->basicMessage[OBJC_IVAR___BlastDoorBasicMessage_basicMessage + 40];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD0096D4(v2);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
