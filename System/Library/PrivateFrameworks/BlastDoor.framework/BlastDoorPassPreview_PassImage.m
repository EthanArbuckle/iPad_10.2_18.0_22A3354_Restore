@implementation BlastDoorPassPreview_PassImage

- (NSString)description
{
  return (NSString *)sub_1AD4D28A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorPassPreview_PassImage_passPreview_PassImage, (void (*)(uint64_t, _BYTE *))sub_1AD417824);
}

- (BlastDoorImage)image
{
  BlastDoorPassPreview_PassImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D2934();

  return (BlastDoorImage *)v3;
}

- (BlastDoorPassPreview_PassImage)init
{
  BlastDoorPassPreview_PassImage *result;

  result = (BlastDoorPassPreview_PassImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4177F8((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorPassPreview_PassImage_passPreview_PassImage));
}

@end
