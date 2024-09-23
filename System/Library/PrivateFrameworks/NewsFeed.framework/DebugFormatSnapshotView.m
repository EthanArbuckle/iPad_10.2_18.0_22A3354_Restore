@implementation DebugFormatSnapshotView

- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _TtC8NewsFeed23DebugFormatSnapshotView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_isSelected) = 0;
  v5 = OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_onTap;
  sub_1BA4D787C(0, (unint64_t *)&qword_1ED3B0A50, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_children) = (Class)MEMORY[0x1E0DEE9D8];

  result = (_TtC8NewsFeed23DebugFormatSnapshotView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed23DebugFormatSnapshotView *result;

  result = (_TtC8NewsFeed23DebugFormatSnapshotView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
