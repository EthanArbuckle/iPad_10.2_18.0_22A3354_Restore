@implementation ReviewSummaryView

- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension17ReviewSummaryView *)sub_10024CDF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10024E38C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension17ReviewSummaryView *v2;

  v2 = self;
  sub_10024D600();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bodyLabel[OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitle]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitleArtwork));
  sub_10024DD5C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_subtitleArtworkAlignment);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17ReviewSummaryView_previewContainer));
}

@end
