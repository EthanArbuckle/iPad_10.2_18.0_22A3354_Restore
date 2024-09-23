@implementation VideoCardView

- (_TtC8AppStore13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore13VideoCardView *)sub_1001C51C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore13VideoCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C6974();
}

- (void)layoutSubviews
{
  _TtC8AppStore13VideoCardView *v2;

  v2 = self;
  sub_1001C5974();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore13VideoCardView_overlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore13VideoCardView_videoView);

  sub_10008FBB0((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore13VideoCardView_metrics));
}

@end
