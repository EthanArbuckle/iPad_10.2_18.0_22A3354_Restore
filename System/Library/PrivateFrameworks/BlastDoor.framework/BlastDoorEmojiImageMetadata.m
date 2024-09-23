@implementation BlastDoorEmojiImageMetadata

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

- (int64_t)imageStrikeCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)contentIdentifier
{
  return (NSString *)sub_1AD4D3488((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)shortDescription
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (BlastDoorEmojiImageMetadata)init
{
  BlastDoorEmojiImageMetadata *result;

  result = (BlastDoorEmojiImageMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
