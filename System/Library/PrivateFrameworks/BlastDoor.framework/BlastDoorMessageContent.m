@implementation BlastDoorMessageContent

- (NSString)description
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD00C45C(v2);
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessageContent_messageContent);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessageContent_messageContent);
}

- (NSAttributedString)content
{
  id v2;

  if (*(_QWORD *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24])
    v2 = sub_1AD5AB450();
  else
    v2 = 0;
  return (NSAttributedString *)v2;
}

- (BlastDoorMessageContent)init
{
  BlastDoorMessageContent *result;

  result = (BlastDoorMessageContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD0096E4(v2);
}

@end
