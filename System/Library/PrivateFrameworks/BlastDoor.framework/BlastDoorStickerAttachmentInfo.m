@implementation BlastDoorStickerAttachmentInfo

- (NSString)description
{
  char *v2;
  void *v3;
  _BYTE v5[273];
  _QWORD __dst[35];

  v2 = (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo;
  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo, 0x111uLL);
  memcpy(v5, v2, sizeof(v5));
  sub_1AD282B4C(__dst);
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)stickerIdentifier
{
  return (NSString *)sub_1AD4C3120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerPackIdentifier
{
  return (NSString *)sub_1AD4C1828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerHash
{
  return (NSString *)sub_1AD4A9E68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
}

- (NSString)stickerExternalURI
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 112];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 104];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (NSString)balloonBundleID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 144];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 136];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (BOOL)has_positionIntent
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 160] & 1) == 0;
}

- (unint64_t)positionIntent
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 160])
    return 0;
  else
    return *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 152];
}

- (BOOL)has_associatedPositionIntent
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 176] & 1) == 0;
}

- (unint64_t)associatedPositionIntent
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 176])
    return 0;
  else
    return *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 168];
}

- (BOOL)has_parentPreviewWidth
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 192] & 1) == 0;
}

- (double)parentPreviewWidth
{
  double result;

  result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 184];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 192])
    return 0.0;
  return result;
}

- (BOOL)has_stickerOffset
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 216] & 1) == 0;
}

- (CGPoint)stickerOffset
{
  double *v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = (double *)((char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo);
  v3 = 0.0;
  v4 = 0.0;
  if ((self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 216] & 1) == 0)
  {
    v4 = v2[26];
    v3 = v2[27];
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (BOOL)has_stickerScale
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 232] & 1) == 0;
}

- (double)stickerScale
{
  double result;

  result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 224];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 232])
    return 0.0;
  return result;
}

- (BOOL)has_stickerRotation
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 248] & 1) == 0;
}

- (double)stickerRotation
{
  double result;

  result = *(double *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 240];
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 248])
    return 0.0;
  return result;
}

- (BOOL)isReaction
{
  return self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 249];
}

- (BOOL)has_stickerPositionVersion
{
  return (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 264] & 1) == 0;
}

- (unint64_t)stickerPositionVersion
{
  if (self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo + 264])
    return 0;
  else
    return *(_QWORD *)&self->stickerAttachmentInfo[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo
                                                 + 256];
}

- (BlastDoorStickerAttachmentInfo)init
{
  BlastDoorStickerAttachmentInfo *result;

  result = (BlastDoorStickerAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD __dst[35];

  memcpy(__dst, (char *)self + OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo, 0x111uLL);
  sub_1AD2829C8(__dst);
}

@end
