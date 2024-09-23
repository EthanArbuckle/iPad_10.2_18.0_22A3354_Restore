@implementation PuzzleHintAccessoryView

- (void)layoutSubviews
{
  _TtC8NewsFeed23PuzzleHintAccessoryView *v2;

  v2 = self;
  PuzzleHintAccessoryView.layoutSubviews()();

}

- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB731880();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8NewsFeed23PuzzleHintAccessoryView *v6;
  _TtC8NewsFeed23PuzzleHintAccessoryView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PuzzleHintAccessoryView.traitCollectionDidChange(_:)(v8);

}

- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed23PuzzleHintAccessoryView *result;

  result = (_TtC8NewsFeed23PuzzleHintAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_sceneProvider);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_rightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_hintButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_keyboardButton));
}

@end
