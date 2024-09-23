@implementation BlastDoorEncodedAttachments

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)contents
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4B1F30, (void (*)(void))type metadata accessor for _ObjCEncodedAttachments_ContentWrapper);
}

- (BlastDoorEncodedAttachments)init
{
  BlastDoorEncodedAttachments *result;

  result = (BlastDoorEncodedAttachments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
