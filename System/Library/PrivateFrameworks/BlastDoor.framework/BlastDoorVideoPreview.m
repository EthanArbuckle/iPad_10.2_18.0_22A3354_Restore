@implementation BlastDoorVideoPreview

- (NSString)description
{
  void *v2;
  uint64_t v4;

  sub_1AD147A60((uint64_t)self + OBJC_IVAR___BlastDoorVideoPreview_videoPreview, (uint64_t)&v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  BlastDoorVideoPreview *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4CDCF4();

  return (BlastDoorImage *)v3;
}

- (BOOL)isAutoloop
{
  return self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 432];
}

- (int64_t)frame
{
  return *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 440];
}

- (double)timestamp
{
  return *(double *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 448];
}

- (int64_t)trackCount
{
  return *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 456];
}

- (BlastDoorVideoPreview_VideoFormat)videoFormat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 464];
  v2 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 472];
  v5 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 480];
  v4 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 488];
  v6 = (objc_class *)type metadata accessor for _ObjCVideoPreview_VideoFormatWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorVideoPreview_VideoFormat_videoPreview_VideoFormat];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v5;
  *((_QWORD *)v8 + 3) = v4;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorVideoPreview_VideoFormat *)-[BlastDoorVideoPreview init](&v10, sel_init);
}

- (BlastDoorVideoPreview_AudioFormat)audioFormat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 496];
  v2 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 504];
  v4 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 512];
  v5 = *(_QWORD *)&self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 520];
  v6 = (objc_class *)type metadata accessor for _ObjCVideoPreview_AudioFormatWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorVideoPreview_AudioFormat_videoPreview_AudioFormat];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v4;
  *((_QWORD *)v8 + 3) = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorVideoPreview_AudioFormat *)-[BlastDoorVideoPreview init](&v10, sel_init);
}

- (BOOL)videoIsMonoskiAsset
{
  return self->videoPreview[OBJC_IVAR___BlastDoorVideoPreview_videoPreview + 528];
}

- (BlastDoorVideoPreview)init
{
  BlastDoorVideoPreview *result;

  result = (BlastDoorVideoPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD147A94((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorVideoPreview_videoPreview));
}

@end
