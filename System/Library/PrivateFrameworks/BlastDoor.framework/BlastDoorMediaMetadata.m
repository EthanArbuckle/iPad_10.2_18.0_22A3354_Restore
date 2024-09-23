@implementation BlastDoorMediaMetadata

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata);
}

- (BlastDoorMediaMetadata_LargeImageContextualInfo)largeImageContextualInfo
{
  char *v2;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  __int128 v8;
  objc_super v9;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if ((self->mediaMetadata[OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata + 16] & 1) != 0)
    return (BlastDoorMediaMetadata_LargeImageContextualInfo *)0;
  v4 = *((_QWORD *)v2 + 2);
  v8 = *(_OWORD *)v2;
  v5 = (objc_class *)type metadata accessor for _ObjCMediaMetadata_LargeImageContextualInfoWrapper();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo];
  *(_OWORD *)v7 = v8;
  *((_QWORD *)v7 + 2) = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return (BlastDoorMediaMetadata_LargeImageContextualInfo *)-[BlastDoorMediaMetadata init](&v9, sel_init);
}

- (NSDate)imageDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2E2D98);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v7 = type metadata accessor for MediaMetadata();
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, (uint64_t *)&unk_1ED2E2D98);
  v8 = sub_1AD63B03C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1AD63B018();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (BOOL)has_timezoneOffset
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 24) + 8] & 1) == 0;
}

- (int64_t)timezoneOffset
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 24)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_subsecTimeOriginal
{
  return sub_1AD4B57E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (double)subsecTimeOriginal
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 28)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_rawOrientation
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 32) + 8] & 1) == 0;
}

- (int64_t)rawOrientation
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 32)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_rawPixelWidth
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 36) + 8] & 1) == 0;
}

- (unint64_t)rawPixelWidth
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 36)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_rawPixelHeight
{
  return sub_1AD4B5B28((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (unint64_t)rawPixelHeight
{
  return sub_1AD4B5BC8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (NSString)lensModel
{
  return (NSString *)sub_1AD4CC1C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (NSString)lensMake
{
  return (NSString *)sub_1AD4C612C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (NSString)profileName
{
  return (NSString *)sub_1AD4C6200((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (BOOL)has_processingFlags
{
  return sub_1AD4CC4E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (unint64_t)processingFlags
{
  return sub_1AD4CC584((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (BOOL)has_isCustomRendered
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 60)] != 2;
}

- (BOOL)isCustomRendered
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 60)] & 1;
}

- (BOOL)has_apertureValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 64) + 8] & 1) == 0;
}

- (double)apertureValue
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 64)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_exposureBiasValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 68) + 8] & 1) == 0;
}

- (int64_t)exposureBiasValue
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 68)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_flash
{
  return sub_1AD4C6518((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (int64_t)flash
{
  return sub_1AD4C65B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (BOOL)has_focalLength
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 76) + 8] & 1) == 0;
}

- (double)focalLength
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 76)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_focalLenIn35mmFilm
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 80) + 8] & 1) == 0;
}

- (double)focalLenIn35mmFilm
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 80)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_isoRatingValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 84) + 8] & 1) == 0;
}

- (int64_t)isoRatingValue
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 84)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_meteringMode
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 88) + 8] & 1) == 0;
}

- (int64_t)meteringMode
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 88)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_shutterSpeed
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 92) + 8] & 1) == 0;
}

- (double)shutterSpeed
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 92)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)model
{
  return (NSString *)sub_1AD4CD168((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (NSString)make
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 100) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_whiteBalance
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 104) + 8] & 1) == 0;
}

- (int64_t)whiteBalance
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 104)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_lightSource
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 108) + 8] & 1) == 0;
}

- (int64_t)lightSource
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 108)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_ciffWhiteBalanceIndex
{
  return sub_1AD4CD394((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (int64_t)ciffWhiteBalanceIndex
{
  return sub_1AD4CD434((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

- (BOOL)has_videoDynamicRange
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 116) + 8] & 1) == 0;
}

- (int64_t)videoDynamicRange
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 116)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_hdrGain
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 120) + 8] & 1) == 0;
}

- (double)hdrGain
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 120)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_hasHDRGainMap
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 124)] != 2;
}

- (BOOL)hasHDRGainMap
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 124)] & 1;
}

- (BOOL)has_videoContainsCinematicData
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 128)] != 2;
}

- (BOOL)videoContainsCinematicData
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 128)] & 1;
}

- (NSString)videoComplementMediaGroupId
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 132) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_gifDelayTime
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 136) + 8] & 1) == 0;
}

- (double)gifDelayTime
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 136)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_variationIdentifier
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 140) + 8] & 1) == 0;
}

- (unint64_t)variationIdentifier
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 140)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_videoComplementDurationValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 144) + 8] & 1) == 0;
}

- (double)videoComplementDurationValue
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 144)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_videoComplementDurationTimescale
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 148) + 8] & 1) == 0;
}

- (double)videoComplementDurationTimescale
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 148)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_videoComplementImageDisplayValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 152) + 8] & 1) == 0;
}

- (double)videoComplementImageDisplayValue
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 152)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_videoComplementImageDisplayTimescale
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 156) + 8] & 1) == 0;
}

- (double)videoComplementImageDisplayTimescale
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 156)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_avDuration
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 160) + 8] & 1) == 0;
}

- (double)avDuration
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 160)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_avFPS
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 164) + 8] & 1) == 0;
}

- (double)avFPS
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 164)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)codecFourCharCode
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 168) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)captureMode
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 172) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)isVideoMontage
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 176) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isProRes
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 180)] != 2;
}

- (BOOL)isProRes
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 180)] & 1;
}

- (BOOL)has_videoDurationValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 184) + 8] & 1) == 0;
}

- (double)videoDurationValue
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 184)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_videoDurationTimescale
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 188) + 8] & 1) == 0;
}

- (double)videoDurationTimescale
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 188)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)originatingAssetIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 192) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_longitude
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 196) + 8] & 1) == 0;
}

- (double)longitude
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 196)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_latitude
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 200) + 8] & 1) == 0;
}

- (double)latitude
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 200)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_altitude
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 204) + 8] & 1) == 0;
}

- (double)altitude
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 204)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_gpsSpeed
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 208) + 8] & 1) == 0;
}

- (double)gpsSpeed
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 208)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)gpsSpeedRef
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 212) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSDate)gpsTimestamp
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2E2D98);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v7 = type metadata accessor for MediaMetadata();
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 216)], (uint64_t)v5, (uint64_t *)&unk_1ED2E2D98);
  v8 = sub_1AD63B03C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1AD63B018();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (BOOL)has_gpsHPositioningError
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 220) + 8] & 1) == 0;
}

- (double)gpsHPositioningError
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 220)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_imageDirection
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 224) + 8] & 1) == 0;
}

- (double)imageDirection
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 224)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)imageDirectionRef
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 228) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)uniformTypeIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 232) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_fileSize
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 236) + 8] & 1) == 0;
}

- (unint64_t)fileSize
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 236)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (NSString)originalFileName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 240) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isPhotoBooth
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 244)] != 2;
}

- (BOOL)isPhotoBooth
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 244)] & 1;
}

- (NSUUID)burstUuid
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2E7140);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v7 = type metadata accessor for MediaMetadata();
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 248)], (uint64_t)v5, &qword_1ED2E7140);
  v8 = sub_1AD63B084();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1AD63B060();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSUUID *)v10;
}

- (NSString)userComment
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 252) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isFrontFacingCamera
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 256)] != 2;
}

- (BOOL)isFrontFacingCamera
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 256)] & 1;
}

- (NSString)spatialOverCaptureIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 260) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_semanticStyleSceneBias
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 264) + 8] & 1) == 0;
}

- (double)semanticStyleSceneBias
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 264)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_semanticStyleWarmthBias
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 268) + 8] & 1) == 0;
}

- (double)semanticStyleWarmthBias
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 268)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_semanticStyleRenderingVersion
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 272) + 8] & 1) == 0;
}

- (int64_t)semanticStyleRenderingVersion
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 272)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_semanticStylePreset
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 276) + 8] & 1) == 0;
}

- (int64_t)semanticStylePreset
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 276)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_hasSmartStyle
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 280)] != 2;
}

- (BOOL)hasSmartStyle
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 280)] & 1;
}

- (BOOL)has_smartStyleToneBias
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 284) + 8] & 1) == 0;
}

- (double)smartStyleToneBias
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 284)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_smartStyleColorBias
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 288) + 8] & 1) == 0;
}

- (double)smartStyleColorBias
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 288)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_smartStyleIntensity
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 292) + 8] & 1) == 0;
}

- (double)smartStyleIntensity
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 292)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_smartStyleCast
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 296) + 8] & 1) == 0;
}

- (double)smartStyleCast
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 296)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_smartStyleRenderingVersion
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 300) + 8] & 1) == 0;
}

- (int64_t)smartStyleRenderingVersion
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 300)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)has_smartStyleIsReversible
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 304)] != 2;
}

- (BOOL)smartStyleIsReversible
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 304)] & 1;
}

- (BOOL)has_smartStyleVideoCastValue
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 308) + 8] & 1) == 0;
}

- (double)smartStyleVideoCastValue
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 308)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_isHDR
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 312)] != 2;
}

- (BOOL)isHDR
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 312)] & 1;
}

- (BOOL)has_hasISOGainMap
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 316)] != 2;
}

- (BOOL)hasISOGainMap
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 316)] & 1;
}

- (BOOL)has_isAnimatedImage
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 320)] != 2;
}

- (BOOL)isAnimatedImage
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 320)] & 1;
}

- (BOOL)has_stillImageCaptureFlags
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 324) + 8] & 1) == 0;
}

- (unint64_t)stillImageCaptureFlags
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 324)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (int64_t)cameraUsedForCapture
{
  return sub_1AD4B9BC4();
}

- (BOOL)has_exifFlashFired
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 332)] != 2;
}

- (BOOL)exifFlashFired
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 332)] & 1;
}

- (BOOL)has_exifAuxFlashCompensation
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 336) + 8] & 1) == 0;
}

- (double)exifAuxFlashCompensation
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 336)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (BOOL)has_captureModeTimelapse
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 340)] != 2;
}

- (BOOL)captureModeTimelapse
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 340)] & 1;
}

- (BOOL)has_hasSpatialAudio
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 344)] != 2;
}

- (BOOL)hasSpatialAudio
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 344)] & 1;
}

- (BOOL)has_isAlchemist
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 348)] != 2;
}

- (BOOL)isAlchemist
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 348)] & 1;
}

- (BOOL)has_isThreeImageStereoHEIC
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 352)] != 2;
}

- (BOOL)isThreeImageStereoHEIC
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 352)] & 1;
}

- (BOOL)has_generativeAIImageType
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 356) + 8] & 1) == 0;
}

- (double)generativeAIImageType
{
  char *v2;
  char *v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 356)];
  result = *(double *)v3;
  if (v3[8])
    return 0.0;
  return result;
}

- (NSString)IPTCCredit
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 360) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BlastDoorMediaMetadata)init
{
  BlastDoorMediaMetadata *result;

  result = (BlastDoorMediaMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
}

@end
