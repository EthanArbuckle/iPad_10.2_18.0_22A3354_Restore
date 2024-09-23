@implementation ShelfHeaderView

- (_TtC8AppStore15ShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15ShelfHeaderView *)sub_10056E064(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15ShelfHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100571B34();
}

- (void)prepareForReuse
{
  _TtC8AppStore15ShelfHeaderView *v2;

  v2 = self;
  sub_10056F3C4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8AppStore15ShelfHeaderView *v9;
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
  sub_10056F728((uint64_t)v8);
  v10 = -[ShelfHeaderView traitCollection](v9, "traitCollection");
  v11 = ShelfHeaderLayout.measure(toFit:with:)(v10, width, height);
  v13 = v12;

  sub_10005C8DC((uint64_t)v8, type metadata accessor for ShelfHeaderLayout);
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
  _TtC8AppStore15ShelfHeaderView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18.receiver = self;
  v18.super_class = ObjectType;
  v7 = self;
  -[ShelfHeaderView layoutSubviews](&v18, "layoutSubviews");
  v8 = *(Class *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_containerView);
  -[ShelfHeaderView bounds](v7, "bounds");
  objc_msgSend(v8, "setFrame:");
  sub_10056F728((uint64_t)v6);
  -[ShelfHeaderView bounds](v7, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[ShelfHeaderView traitCollection](v7, "traitCollection");
  ShelfHeaderLayout.place(at:with:)(v17, v10, v12, v14, v16);

  sub_10005C8DC((uint64_t)v6, type metadata accessor for ShelfHeaderLayout);
}

- (void)updateConfiguration
{
  _TtC8AppStore15ShelfHeaderView *v2;

  v2 = self;
  sub_10056EC08();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100570274);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100570548);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1005707DC);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100570A30);
}

- (void).cxx_destruct
{
  sub_10005C8DC((uint64_t)self + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_metrics, type metadata accessor for ShelfHeaderLayout.Metrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_eyebrowButton));
  swift_release();
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_eyebrowArtworkType, &qword_10083C440);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_eyebrowArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_titleButton));
  swift_release();
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_titleArtworkType, &qword_10083C440);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_accessoryButton));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_titleAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC8AppStore15ShelfHeaderView_titleAction]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_accessoryAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC8AppStore15ShelfHeaderView_accessoryAction]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_eyebrowAction), *(_QWORD *)&self->containerView[OBJC_IVAR____TtC8AppStore15ShelfHeaderView_eyebrowAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_subtitleLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_configuration, &qword_10083F2A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfHeaderView_currentTouch));
}

@end
