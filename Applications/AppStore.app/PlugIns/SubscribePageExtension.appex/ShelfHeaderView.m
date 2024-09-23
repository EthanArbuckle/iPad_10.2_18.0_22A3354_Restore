@implementation ShelfHeaderView

- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15ShelfHeaderView *)sub_100065104(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10006AE18();
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension15ShelfHeaderView *v2;

  v2 = self;
  sub_100066464();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC22SubscribePageExtension15ShelfHeaderView *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1000667C8((uint64_t)v8);
  v10 = -[ShelfHeaderView traitCollection](v9, "traitCollection");
  v11 = ShelfHeaderLayout.measure(toFit:with:)(v10, width, height);
  v13 = v12;

  sub_10002F0D4((uint64_t)v8, type metadata accessor for ShelfHeaderLayout);
  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC22SubscribePageExtension15ShelfHeaderView *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v7 = self;
  -[ShelfHeaderView layoutSubviews](&v12, "layoutSubviews");
  v8 = *(Class *)((char *)&v7->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_containerView);
  -[ShelfHeaderView bounds](v7, "bounds");
  objc_msgSend(v8, "setFrame:");
  sub_1000667C8((uint64_t)v6);
  -[ShelfHeaderView bounds](v7, "bounds");
  v10 = v9;
  v11 = -[ShelfHeaderView traitCollection](v7, "traitCollection");
  ShelfHeaderLayout.place(at:with:)(v11, v10);

  sub_10002F0D4((uint64_t)v6, type metadata accessor for ShelfHeaderLayout);
}

- (void)updateConfiguration
{
  _TtC22SubscribePageExtension15ShelfHeaderView *v2;

  v2 = self;
  sub_100065CA8();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100069824);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100069AF8);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100069E24);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_10006A078);
}

- (void).cxx_destruct
{
  sub_10002F0D4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_metrics, type metadata accessor for ShelfHeaderLayout.Metrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowArtwork));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowArtworkType, &qword_1007F6318);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleArtwork));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleArtworkType, &qword_1007F6318);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_accessoryButton));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleAction]);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_accessoryAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_accessoryAction]);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_subtitleLabel));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_configuration, &qword_1007FAFE0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_currentTouch));
}

@end
