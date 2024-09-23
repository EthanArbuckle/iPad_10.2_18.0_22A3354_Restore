@implementation IMWallpaperMetadataColor_Impl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  IMWallpaperMetadataColor_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_19E36831C(v4);

}

- (IMWallpaperMetadataColor_Impl)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (IMWallpaperMetadataColor_Impl *)WallpaperMetadataColor.init(red:green:blue:alpha:)(a3, a4, a5, a6);
}

- (IMWallpaperMetadataColor_Impl)initWithCoder:(id)a3
{
  id v3;
  IMWallpaperMetadataColor_Impl *v4;

  v3 = a3;
  v4 = (IMWallpaperMetadataColor_Impl *)sub_19E368DA8();

  return v4;
}

- (IMWallpaperMetadataColor_Impl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMWallpaperMetadataColor_Impl *)WallpaperMetadataColor.init(dictionaryRepresentation:)(v3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19E368B30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_19E368A4C);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_19E35EE4C(self, (uint64_t)a2, (void (*)(void))sub_19E368BBC);
}

- (IMWallpaperMetadataColor_Impl)init
{
  IMWallpaperMetadataColor_Impl *result;

  result = (IMWallpaperMetadataColor_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
