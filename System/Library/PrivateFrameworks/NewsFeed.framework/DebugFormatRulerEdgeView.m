@implementation DebugFormatRulerEdgeView

- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC8NewsFeed24DebugFormatRulerEdgeView *)sub_1BAB6EA9C();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed24DebugFormatRulerEdgeView *v2;

  v2 = self;
  sub_1BAB6D68C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v9.receiver;
  -[DebugFormatRulerEdgeView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_markerLayer];
  v7 = objc_msgSend((id)objc_opt_self(), sel_labelColor, v9.receiver, v9.super_class);
  v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void)didUpdatePan:(id)a3
{
  id v4;
  _TtC8NewsFeed24DebugFormatRulerEdgeView *v5;

  v4 = a3;
  v5 = self;
  sub_1BAB6E42C(v4);

}

- (_TtC8NewsFeed24DebugFormatRulerEdgeView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed24DebugFormatRulerEdgeView *result;

  result = (_TtC8NewsFeed24DebugFormatRulerEdgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_markerLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_selectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_metricSelectionView));
}

@end
