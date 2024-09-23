@implementation TabOverviewItemView

- (_TtC12MobileSafari19TabOverviewItemView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari19TabOverviewItemView *)sub_18BA686D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari19TabOverviewItemView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari19TabOverviewItemView *)sub_18BA6898C(a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char *v8;
  unsigned __int8 v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TabOverviewItemView();
  v7 = a4;
  v8 = (char *)v12.receiver;
  if (-[TabOverviewItemView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    v9 = 1;
  }
  else
  {
    v10 = *(void **)&v8[OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_thumbnailView];
    objc_msgSend(v8, sel_convertPoint_toCoordinateSpace_, v10, x, y, v12.receiver, v12.super_class);
    v9 = objc_msgSend(v10, sel_pointInside_withEvent_, v7);
  }

  return v9;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TabOverviewItemView();
  v2 = (char *)v4.receiver;
  -[TabOverviewItemView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_closingBackgroundView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  sub_18BA695FC();
  sub_18BA6983C();
  sub_18BA69984();

}

- (void)tintColorDidChange
{
  void *v2;
  _TtC12MobileSafari19TabOverviewItemView *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_tintedSelectionBorderView);
  v3 = self;
  v4 = -[TabOverviewItemView tintColor](v3, sel_tintColor);
  objc_msgSend(v2, sel_setBorderColor_, v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_closingBackgroundView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_uuidForAnnotation, &qword_1EDFEA120);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_tintedSelectionBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19TabOverviewItemView_titleView));
}

@end
