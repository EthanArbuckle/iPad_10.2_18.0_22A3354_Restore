@implementation BlastDoorWallpaper_WallpaperImage

- (NSString)description
{
  return (NSString *)sub_1AD4D28A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorWallpaper_WallpaperImage_wallpaper_WallpaperImage, (void (*)(uint64_t, _BYTE *))sub_1AD4D9D1C);
}

- (BlastDoorImage)image
{
  BlastDoorWallpaper_WallpaperImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D1258();

  return (BlastDoorImage *)v3;
}

- (BlastDoorWallpaper_WallpaperImage)init
{
  BlastDoorWallpaper_WallpaperImage *result;

  result = (BlastDoorWallpaper_WallpaperImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD406748((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___BlastDoorWallpaper_WallpaperImage_wallpaper_WallpaperImage));
}

@end
