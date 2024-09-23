@implementation BlastDoorOrderPreview_OrderImage

- (NSString)description
{
  void *v2;
  uint64_t v4;

  sub_1AD2F7328((uint64_t)self + OBJC_IVAR___BlastDoorOrderPreview_OrderImage_orderPreview_OrderImage, (uint64_t)&v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  BlastDoorOrderPreview_OrderImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D2144();

  return (BlastDoorImage *)v3;
}

- (unsigned)type
{
  return self->orderPreview_OrderImage[OBJC_IVAR___BlastDoorOrderPreview_OrderImage_orderPreview_OrderImage + 432];
}

- (BlastDoorOrderPreview_OrderImage)init
{
  BlastDoorOrderPreview_OrderImage *result;

  result = (BlastDoorOrderPreview_OrderImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD2F735C((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorOrderPreview_OrderImage_orderPreview_OrderImage));
}

@end
