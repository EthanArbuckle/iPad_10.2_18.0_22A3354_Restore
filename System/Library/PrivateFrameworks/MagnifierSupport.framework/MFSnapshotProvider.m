@implementation MFSnapshotProvider

- (id)item
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_22758C858();
  v8 = MEMORY[0x24BDAC7A8](v3, v4, v5, v6, v7);
  (*(void (**)(char *, char *, uint64_t, __n128))(v10 + 16))((char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_url, v3, v8);
  return (id)sub_22758EE98();
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  _TtC16MagnifierSupport18MFSnapshotProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_227537D94();

  return v6;
}

- (_TtC16MagnifierSupport18MFSnapshotProvider)initWithPlaceholderItem:(id)a3
{
  _TtC16MagnifierSupport18MFSnapshotProvider *result;

  swift_unknownObjectRetain();
  sub_22758EAB4();
  swift_unknownObjectRelease();
  result = (_TtC16MagnifierSupport18MFSnapshotProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_url;
  v4 = sub_22758C858();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MFSnapshotProvider_image));
}

@end
