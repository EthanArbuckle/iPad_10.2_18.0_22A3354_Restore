@implementation BlastDoorLinkIsRichLinkAttribute

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLinkIsRichLinkAttribute_linkIsRichLinkAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isRichLink
{
  return self->linkIsRichLinkAttribute[OBJC_IVAR___BlastDoorLinkIsRichLinkAttribute_linkIsRichLinkAttribute + 8];
}

- (BlastDoorLinkIsRichLinkAttribute)init
{
  BlastDoorLinkIsRichLinkAttribute *result;

  result = (BlastDoorLinkIsRichLinkAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
