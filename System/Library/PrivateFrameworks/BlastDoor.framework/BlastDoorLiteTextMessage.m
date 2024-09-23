@implementation BlastDoorLiteTextMessage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTextMessage, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage);
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage);
}

- (int64_t)effect
{
  unint64_t v2;
  int64_t result;
  char v4;

  if (self->liteTextMessage[OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage + 8] == 14)
    v2 = 0;
  else
    v2 = self->liteTextMessage[OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage + 8];
  result = sub_1AD4D9B68(v2);
  if ((v4 & 1) != 0)
    __break(1u);
  return result;
}

- (NSUUID)threadOriginatorUUID
{
  return (NSUUID *)sub_1AD4CBBD8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage, type metadata accessor for LiteTextMessage);
}

- (BlastDoorLiteTapback)tapback
{
  BlastDoorLiteTextMessage *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4B49F8();

  return (BlastDoorLiteTapback *)v3;
}

- (BlastDoorLiteTextMessage)init
{
  BlastDoorLiteTextMessage *result;

  result = (BlastDoorLiteTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage, type metadata accessor for LiteTextMessage);
}

@end
