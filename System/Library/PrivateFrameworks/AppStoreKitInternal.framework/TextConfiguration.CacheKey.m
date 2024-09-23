@implementation TextConfiguration.CacheKey

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey_fontSource;
  v4 = sub_1D8928240();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey_contentSizeCategory));
}

- (int64_t)hash
{
  _TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D83996C0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *v4;
  _TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D892B954();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D83BA0F8((uint64_t)v8);

  sub_1D83371E4((uint64_t)v8, &qword_1EDA45C20);
  return v6 & 1;
}

- (_TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey)init
{
  _TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *result;

  result = (_TtCV19AppStoreKitInternal17TextConfigurationP33_8FB457C7443A98ADD3A79F4EF69424918CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
