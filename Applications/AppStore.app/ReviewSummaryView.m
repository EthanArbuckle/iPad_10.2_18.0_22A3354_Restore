@implementation ReviewSummaryView

- (_TtC8AppStore17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17ReviewSummaryView *)sub_100589FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10058B318();
}

- (void)layoutSubviews
{
  _TtC8AppStore17ReviewSummaryView *v2;

  v2 = self;
  sub_10058A7E4();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->bodyLabel[OBJC_IVAR____TtC8AppStore17ReviewSummaryView_subtitle]);
  swift_release();
  sub_1005314B8((uint64_t)self + OBJC_IVAR____TtC8AppStore17ReviewSummaryView_subtitleArtworkAlignment);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ReviewSummaryView_previewContainer));
}

@end
