@implementation BlastDoorPreviewAudio

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorPreviewAudio_previewAudio);
}

- (NSArray)powerLevels
{
  return (NSArray *)sub_1AD4BFE78();
}

- (BlastDoorPreviewAudio)init
{
  BlastDoorPreviewAudio *result;

  result = (BlastDoorPreviewAudio *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
