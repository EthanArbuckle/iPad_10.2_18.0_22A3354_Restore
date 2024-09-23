@implementation BlastDoorMediaMetadata_LargeImageContextualInfo

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)pixelWidth
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo);
}

- (int64_t)pixelHeight
{
  return *(_QWORD *)&self->mediaMetadata_LargeImageContextualInfo[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo];
}

- (int64_t)bufferByteSize
{
  return *(_QWORD *)&self->mediaMetadata_LargeImageContextualInfo[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo
                                                                + 8];
}

- (BlastDoorMediaMetadata_LargeImageContextualInfo)init
{
  BlastDoorMediaMetadata_LargeImageContextualInfo *result;

  result = (BlastDoorMediaMetadata_LargeImageContextualInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
