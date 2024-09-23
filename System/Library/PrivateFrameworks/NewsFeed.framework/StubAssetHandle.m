@implementation StubAssetHandle

- (FCAssetDataProvider)dataProvider
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8NewsFeed15StubAssetHandle_identifier);
  v2 = *(uint64_t *)((char *)&self->super._dataProvider + OBJC_IVAR____TtC8NewsFeed15StubAssetHandle_identifier);
  type metadata accessor for StubAssetHandle.StubAssetDataProvider();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BB8A40F0;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  *(_BYTE *)(v4 + 48) = 1;
  swift_bridgeObjectRetain();
  return (FCAssetDataProvider *)(id)v4;
}

- (NSString)uniqueKey
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC8NewsFeed15StubAssetHandle)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  _TtC8NewsFeed15StubAssetHandle *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_1BB86C8E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed15StubAssetHandle_identifier);
  v9 = self;
  sub_1BB86C8D4();
  v10 = sub_1BB86C8C8();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *v8 = v10;
  v8[1] = v12;

  v14.receiver = v9;
  v14.super_class = ObjectType;
  return -[StubAssetHandle init](&v14, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
