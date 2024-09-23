@implementation BlastDoorColor

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)red
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorColor_color);
}

- (double)green
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color];
}

- (double)blue
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color + 8];
}

- (double)alpha
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color + 16];
}

- (BlastDoorColor)init
{
  BlastDoorColor *result;

  result = (BlastDoorColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
