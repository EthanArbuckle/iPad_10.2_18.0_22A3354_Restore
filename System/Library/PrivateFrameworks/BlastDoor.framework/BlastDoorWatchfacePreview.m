@implementation BlastDoorWatchfacePreview

- (NSString)description
{
  return (NSString *)sub_1AD4D28A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorWatchfacePreview_watchfacePreview, (void (*)(uint64_t, _BYTE *))sub_1AD424AD0);
}

- (BlastDoorImage)image
{
  BlastDoorWatchfacePreview *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4CE420();

  return (BlastDoorImage *)v3;
}

- (BlastDoorWatchfacePreview)init
{
  BlastDoorWatchfacePreview *result;

  result = (BlastDoorWatchfacePreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD424AA4((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorWatchfacePreview_watchfacePreview));
}

@end
