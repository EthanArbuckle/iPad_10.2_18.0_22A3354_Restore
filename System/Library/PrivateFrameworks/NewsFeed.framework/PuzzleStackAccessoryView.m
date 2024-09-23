@implementation PuzzleStackAccessoryView

- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8NewsFeed24PuzzleStackAccessoryView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed24PuzzleStackAccessoryView_identifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8NewsFeed24PuzzleStackAccessoryView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed24PuzzleStackAccessoryView *v2;

  v2 = self;
  PuzzleStackAccessoryView.layoutSubviews()();

}

- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed24PuzzleStackAccessoryView *result;

  result = (_TtC8NewsFeed24PuzzleStackAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24PuzzleStackAccessoryView_containerView));
  swift_bridgeObjectRelease();
}

@end
