@implementation __FKOrderMessagesPreviewMetadataText

- (NSString)text
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGColor)overrideColor
{
  return (CGColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR_____FKOrderMessagesPreviewMetadataText_overrideColor));
}

- (__FKOrderMessagesPreviewMetadataText)init
{
  __FKOrderMessagesPreviewMetadataText *result;

  result = (__FKOrderMessagesPreviewMetadataText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
