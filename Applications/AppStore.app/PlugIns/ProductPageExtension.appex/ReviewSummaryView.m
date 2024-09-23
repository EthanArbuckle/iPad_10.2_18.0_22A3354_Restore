@implementation ReviewSummaryView

- (_TtC20ProductPageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension17ReviewSummaryView *)sub_100353644(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100354A14();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension17ReviewSummaryView *v2;

  v2 = self;
  sub_100353E54();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bodyLabel[OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitle]);
  swift_release();
  sub_1003543E4((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleArtworkAlignment);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_previewContainer));
}

@end
