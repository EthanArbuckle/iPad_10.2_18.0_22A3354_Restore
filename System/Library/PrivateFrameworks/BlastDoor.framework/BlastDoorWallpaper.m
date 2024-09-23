@implementation BlastDoorWallpaper

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for Wallpaper, &OBJC_IVAR___BlastDoorWallpaper_wallpaper);
}

- (NSData)posterArchive
{
  BlastDoorWallpaper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4BC76C();

  return (NSData *)v3;
}

- (NSString)highResFileName
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *result;
  uint64_t v12;

  v3 = type metadata accessor for Wallpaper(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper, (uint64_t)v5, v6);
  v7 = &v5[*(int *)(v3 + 20)];
  v8 = *((_QWORD *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v9 = *((_QWORD *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, type metadata accessor for Wallpaper);
    if (v8)
    {
      v10 = (void *)sub_1AD63B744();
      sub_1AD003F24(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BlastDoorWallpaper_WallpaperImage)highResImage
{
  BlastDoorWallpaper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BCACC();

  return (BlastDoorWallpaper_WallpaperImage *)v3;
}

- (NSString)lowResFileName
{
  return (NSString *)sub_1AD4BCC2C((uint64_t)self, (uint64_t)a2, type metadata accessor for Wallpaper, &OBJC_IVAR___BlastDoorWallpaper_wallpaper);
}

- (BlastDoorWallpaper_WallpaperImage)lowResImage
{
  BlastDoorWallpaper *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BCE80();

  return (BlastDoorWallpaper_WallpaperImage *)v3;
}

- (int64_t)version
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper;
  return *(_QWORD *)&v2[*(int *)(type metadata accessor for Wallpaper(0) + 36)];
}

- (BlastDoorWallpaper_WallpaperMetadata)metadata
{
  char *v2;
  uint64_t v3;
  int v4;
  BlastDoorWallpaper *v5;
  objc_class *v6;
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;
  _BYTE v18[160];
  _BYTE v19[160];
  _OWORD v20[8];
  _OWORD v21[2];

  v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper;
  v3 = type metadata accessor for Wallpaper(0);
  sub_1AD00FF28((uint64_t)&v2[*(int *)(v3 + 40)], (uint64_t)v19, &qword_1EECD3A28);
  sub_1AD00FF28((uint64_t)v19, (uint64_t)v20, &qword_1EECD3A28);
  v4 = sub_1AD4D9D78((uint64_t)v20);
  v5 = 0;
  if (v4 != 1)
  {
    v6 = (objc_class *)type metadata accessor for _ObjCWallpaper_WallpaperMetadataWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata];
    v9 = v20[1];
    *(_OWORD *)v8 = v20[0];
    *((_OWORD *)v8 + 1) = v9;
    v10 = v20[5];
    v12 = v20[2];
    v11 = v20[3];
    *((_OWORD *)v8 + 4) = v20[4];
    *((_OWORD *)v8 + 5) = v10;
    *((_OWORD *)v8 + 2) = v12;
    *((_OWORD *)v8 + 3) = v11;
    v14 = v20[7];
    v13 = v21[0];
    v15 = v20[6];
    *(_OWORD *)(v8 + 137) = *(_OWORD *)((char *)v21 + 9);
    *((_OWORD *)v8 + 7) = v14;
    *((_OWORD *)v8 + 8) = v13;
    *((_OWORD *)v8 + 6) = v15;
    sub_1AD00FF28((uint64_t)v19, (uint64_t)v18, &qword_1EECD3A28);
    sub_1AD292B64((uint64_t)v18);
    v17.receiver = v7;
    v17.super_class = v6;
    v5 = -[BlastDoorWallpaper init](&v17, sel_init);
  }
  return (BlastDoorWallpaper_WallpaperMetadata *)v5;
}

- (BlastDoorWallpaper)init
{
  BlastDoorWallpaper *result;

  result = (BlastDoorWallpaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper, type metadata accessor for Wallpaper);
}

@end
