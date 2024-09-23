@implementation BlastDoorPreviewImage

- (NSString)description
{
  void *v2;
  _BYTE v4[504];

  sub_1AD4D9F0C((uint64_t)self + OBJC_IVAR___BlastDoorPreviewImage_previewImage, (uint64_t)v4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorImage)image
{
  BlastDoorPreviewImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4C01A0();

  return (BlastDoorImage *)v3;
}

- (int64_t)frameCount
{
  return *(_QWORD *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 432];
}

- (BOOL)has_frameDuration
{
  return (self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 448] & 1) == 0;
}

- (double)frameDuration
{
  double result;

  result = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 440];
  if (self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 448])
    return 0.0;
  return result;
}

- (BOOL)isScreenshot
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 449];
}

- (NSString)stickerEffect
{
  NSString *result;

  __asm { BR              X10 }
  return result;
}

- (unint64_t)stickerEffectType
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 450];
}

- (NSString)utTypeString
{
  void *v2;

  if (*(_QWORD *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 464])
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

- (BOOL)isMonoskiAsset
{
  return self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 472];
}

- (CGSize)alignmentInset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 480];
  v3 = *(double *)&self->previewImage[OBJC_IVAR___BlastDoorPreviewImage_previewImage + 488];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BlastDoorPreviewImage)init
{
  BlastDoorPreviewImage *result;

  result = (BlastDoorPreviewImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4D9F48((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorPreviewImage_previewImage));
}

@end
