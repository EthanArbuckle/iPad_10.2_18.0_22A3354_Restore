@implementation VideoCardView

- (_TtC20ProductPageExtension13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension13VideoCardView *)sub_1000A64F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension13VideoCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A7F4C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension13VideoCardView *v2;

  v2 = self;
  sub_1000A6E20();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_overlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_lockupView));
  sub_1000A8060((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_metrics));
}

@end
