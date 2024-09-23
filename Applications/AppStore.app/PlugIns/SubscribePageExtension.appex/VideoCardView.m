@implementation VideoCardView

- (_TtC22SubscribePageExtension13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension13VideoCardView *)sub_1004FC018(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension13VideoCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004FD81C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension13VideoCardView *v2;

  v2 = self;
  sub_1004FC7C4();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_overlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_lockupView));
  sub_100092DBC((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_metrics));
}

@end
