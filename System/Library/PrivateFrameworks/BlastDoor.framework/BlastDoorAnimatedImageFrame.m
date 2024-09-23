@implementation BlastDoorAnimatedImageFrame

- (NSString)description
{
  void *v2;
  _BYTE v4[472];

  sub_1AD3DD6F0((uint64_t)self + OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame, (uint64_t)v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  BlastDoorAnimatedImageFrame *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4A6CDC();

  return (BlastDoorImage *)v3;
}

- (BOOL)has_frameDuration
{
  return (self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 440] & 1) == 0;
}

- (double)frameDuration
{
  double result;

  result = *(double *)&self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 432];
  if (self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 440])
    return 0.0;
  return result;
}

- (NSString)stickerEffect
{
  NSString *result;

  __asm { BR              X10 }
  return result;
}

- (unint64_t)stickerEffectType
{
  return self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 441];
}

- (NSString)utTypeString
{
  void *v2;

  if (*(_QWORD *)&self->animatedImageFrame[OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame + 456])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BlastDoorAnimatedImageFrame)init
{
  BlastDoorAnimatedImageFrame *result;

  result = (BlastDoorAnimatedImageFrame *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD3DD724((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAnimatedImageFrame_animatedImageFrame));
}

@end
