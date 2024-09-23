@implementation IMWallpaperMetadata_Impl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fontName
{
  return (NSString *)sub_19E325D9C();
}

- (double)fontSize
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontSize);
}

- (double)fontWeight
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontWeight);
}

- (IMWallpaperMetadataColor_Impl)fontColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontColor);
  swift_beginAccess();
  return (IMWallpaperMetadataColor_Impl *)*v2;
}

- (void)setFontColor:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_fontColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isVertical
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_isVertical);
}

- (NSString)type
{
  return (NSString *)sub_19E325D9C();
}

- (IMWallpaperMetadataColor_Impl)backgroundColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_backgroundColor);
  swift_beginAccess();
  return (IMWallpaperMetadataColor_Impl *)*v2;
}

- (void)setBackgroundColor:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___IMWallpaperMetadata_Impl_backgroundColor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  IMWallpaperMetadata_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_19E3666AC(v4);

}

- (IMWallpaperMetadata_Impl)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v13 = sub_19E36F888();
  v15 = v14;
  sub_19E24B854(0, (unint64_t *)&qword_1ECFC6A00);
  v16 = sub_19E36F828();
  v17 = sub_19E36F888();
  v19 = v18;
  if (a9)
    v20 = sub_19E36F828();
  else
    v20 = 0;
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(fontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:)(v13, v15, v16, a7, v17, v19, v20, a4, a5);
}

- (IMWallpaperMetadata_Impl)initWithCoder:(id)a3
{
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(coder:)(a3);
}

- (IMWallpaperMetadata_Impl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMWallpaperMetadata_Impl *)WallpaperMetadata.init(dictionaryRepresentation:)(v3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19E368B30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_19E367B08);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_19E35EE4C(self, (uint64_t)a2, (void (*)(void))sub_19E367D68);
}

- (IMWallpaperMetadata_Impl)init
{
  IMWallpaperMetadata_Impl *result;

  result = (IMWallpaperMetadata_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
