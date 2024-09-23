@implementation SeymourAwardPlugin

- (NSString)pluginIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_232DBD140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC19SeymourAwardsPlugin18SeymourAwardPlugin)init
{
  uint64_t *v3;
  _TtC19SeymourAwardsPlugin18SeymourAwardPlugin *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19SeymourAwardsPlugin18SeymourAwardPlugin_pluginIdentifier);
  sub_232DBD0E0();
  v4 = self;
  *v3 = sub_232DBD0D4();
  v3[1] = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourAwardPlugin();
  return -[SeymourAwardPlugin init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)templateAssetSource
{
  return sub_232DBB550(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SeymourTemplateAssetSource);
}

- (id)progressProvider
{
  return sub_232DBB550(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for AwardProgressProvider);
}

@end
