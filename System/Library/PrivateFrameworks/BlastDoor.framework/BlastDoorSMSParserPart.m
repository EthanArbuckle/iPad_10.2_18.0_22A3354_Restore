@implementation BlastDoorSMSParserPart

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)textParts
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C5114, (void (*)(void))type metadata accessor for _ObjCSMSParserTextPartWrapper);
}

- (NSArray)attachmentParts
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C52A4, (void (*)(void))type metadata accessor for _ObjCSMSParserAttachmentPartWrapper);
}

- (BlastDoorSMSParserPart)init
{
  BlastDoorSMSParserPart *result;

  result = (BlastDoorSMSParserPart *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
