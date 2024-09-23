@implementation BlastDoorFileTransferAttribute_ImageInfo

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR___BlastDoorFileTransferAttribute_ImageInfo_fileTransferAttribute_ImageInfo);
  v3 = *(double *)&self->fileTransferAttribute_ImageInfo[OBJC_IVAR___BlastDoorFileTransferAttribute_ImageInfo_fileTransferAttribute_ImageInfo];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BlastDoorFileTransferAttribute_ImageInfo)init
{
  BlastDoorFileTransferAttribute_ImageInfo *result;

  result = (BlastDoorFileTransferAttribute_ImageInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
