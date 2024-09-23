@implementation IconTextListView

- (_TtC15HealthRecordsUI16IconTextListView)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI16IconTextListView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16IconTextListView_items) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = a3;

  result = (_TtC15HealthRecordsUI16IconTextListView *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC15HealthRecordsUI16IconTextListView *v2;

  v2 = self;
  sub_1BC59288C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC15HealthRecordsUI16IconTextListView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1BC592E3C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI16IconTextListView *v6;

  v5 = a3;
  v6 = self;
  sub_1BC592F30(a3);

}

- (_TtC15HealthRecordsUI16IconTextListView)initWithFrame:(CGRect)a3
{
  _TtC15HealthRecordsUI16IconTextListView *result;

  result = (_TtC15HealthRecordsUI16IconTextListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16IconTextListView_textStyle));
  swift_bridgeObjectRelease();

}

@end
