@implementation DebugFormatSelectionView

- (_TtC8NewsFeed24DebugFormatSelectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB78EF14();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed24DebugFormatSelectionView *v2;

  v2 = self;
  sub_1BB78E898();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8NewsFeed24DebugFormatSelectionView *v6;

  v5 = a3;
  v6 = self;
  sub_1BB78EB84((uint64_t)a3);

}

- (_TtC8NewsFeed24DebugFormatSelectionView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed24DebugFormatSelectionView *result;

  result = (_TtC8NewsFeed24DebugFormatSelectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_topLeftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_topRightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_bottomLeftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_bottomRightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_borderView));
}

@end
