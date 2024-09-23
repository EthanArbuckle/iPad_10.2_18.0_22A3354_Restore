@implementation TagFeedViewerPuzzleFullArchiveTitleView

- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView *)sub_1D681CA1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D681CDB0();
}

- (void)layoutSubviews
{
  _TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView *v2;

  v2 = self;
  sub_1D681CBF8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239TagFeedViewerPuzzleFullArchiveTitleView_subtitleLabel));
}

@end
