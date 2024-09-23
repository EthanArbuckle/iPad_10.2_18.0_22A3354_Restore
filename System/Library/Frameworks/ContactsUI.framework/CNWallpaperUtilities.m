@implementation CNWallpaperUtilities

+ (BOOL)supportsWatchImageDataRepairFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = sub_18AF4FC5C();
  v5 = _s10ContactsUI20CNWallpaperUtilitiesC28supportsWatchImageDataRepair3forSbSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC10ContactsUI20CNWallpaperUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNWallpaperUtilities();
  return -[CNWallpaperUtilities init](&v3, sel_init);
}

+ (uint64_t)monogramPosterOffset
{
  return MEMORY[0x1E0D50368]();
}

@end
