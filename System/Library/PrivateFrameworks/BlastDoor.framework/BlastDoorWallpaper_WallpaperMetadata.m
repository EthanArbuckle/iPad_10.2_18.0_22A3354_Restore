@implementation BlastDoorWallpaper_WallpaperMetadata

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  _OWORD v8[8];
  _OWORD v9[2];

  v2 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 104];
  v8[6] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 88];
  v8[7] = v2;
  v9[0] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 120];
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                                            + 129];
  v3 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 40];
  v8[2] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 24];
  v8[3] = v3;
  v4 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  v8[4] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 56];
  v8[5] = v4;
  v5 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata);
  v8[1] = v5;
  sub_1AD292B64((uint64_t)v8);
  sub_1AD63B798();
  v6 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)fontName
{
  return (NSString *)sub_1AD4D24E8();
}

- (double)fontSize
{
  double result;

  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 32] & 1) == 0)
    return *(double *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                       + 24];
  sub_1AD63BE28();
  __break(1u);
  return result;
}

- (double)fontWeight
{
  double result;

  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 64] & 1) == 0)
    return *(double *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                       + 56];
  sub_1AD63BE28();
  __break(1u);
  return result;
}

- (BlastDoorColor)fontColor
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  char *v6;
  __int128 v8;
  objc_super v9;

  v8 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  v2 = *(_QWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 88];
  v3 = *(_QWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 96];
  v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v8;
  *((_QWORD *)v6 + 2) = v2;
  *((_QWORD *)v6 + 3) = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  return (BlastDoorColor *)-[BlastDoorWallpaper_WallpaperMetadata init](&v9, sel_init);
}

- (BOOL)isVertical
{
  return self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                         + 104];
}

- (int64_t)type
{
  return sub_1AD4D1900();
}

- (BlastDoorColor)backgroundColor
{
  char *v2;
  BlastDoorWallpaper_WallpaperMetadata *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v10;
  objc_super v11;

  v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata;
  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 144] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = *((_QWORD *)v2 + 17);
    v4 = *((_QWORD *)v2 + 18);
    v10 = *(_OWORD *)(v2 + 120);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((_QWORD *)v8 + 2) = v5;
    *((_QWORD *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    v3 = -[BlastDoorWallpaper_WallpaperMetadata init](&v11, sel_init);
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorWallpaper_WallpaperMetadata)init
{
  BlastDoorWallpaper_WallpaperMetadata *result;

  result = (BlastDoorWallpaper_WallpaperMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];
  _OWORD v7[2];

  v2 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 104];
  v6[6] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 88];
  v6[7] = v2;
  v7[0] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 120];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                                            + 129];
  v3 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 40];
  v6[2] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 24];
  v6[3] = v3;
  v4 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  v6[4] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 56];
  v6[5] = v4;
  v5 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata);
  v6[1] = v5;
  sub_1AD292A74((uint64_t)v6);
}

@end
