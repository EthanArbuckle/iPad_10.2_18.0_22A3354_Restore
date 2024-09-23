@implementation BlastDoorAnimatedImageMetadata

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

- (NSArray)durations
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B990();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (CGSize)pixelSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&self->animatedImageMetadata[OBJC_IVAR___BlastDoorAnimatedImageMetadata_animatedImageMetadata];
  v3 = *(double *)&self->animatedImageMetadata[OBJC_IVAR___BlastDoorAnimatedImageMetadata_animatedImageMetadata + 8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)utTypeString
{
  return (NSString *)sub_1AD4C2C3C();
}

- (BlastDoorAnimatedImageMetadata)init
{
  BlastDoorAnimatedImageMetadata *result;

  result = (BlastDoorAnimatedImageMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
