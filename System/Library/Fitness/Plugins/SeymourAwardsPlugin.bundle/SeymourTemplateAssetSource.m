@implementation SeymourTemplateAssetSource

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_232DBD140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource)init
{
  uint64_t *v3;
  _TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_identifier);
  sub_232DBD0E0();
  v4 = self;
  *v3 = sub_232DBD0D4();
  v3[1] = v5;
  sub_232DBD074();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourTemplateAssetSource();
  return -[SeymourTemplateAssetSource init](&v7, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_assetsRootBundlePath;
  v4 = sub_232DBD098();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  return sub_232DBCF44(self, (uint64_t)a2, a3, (void (*)(id))sub_232DBC124);
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  return sub_232DBCF44(self, (uint64_t)a2, a3, (void (*)(id))sub_232DBC734);
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  return sub_232DBCF44(self, (uint64_t)a2, a3, (void (*)(id))sub_232DBCACC);
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

@end
