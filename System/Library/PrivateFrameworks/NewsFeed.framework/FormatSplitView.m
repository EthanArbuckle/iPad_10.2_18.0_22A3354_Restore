@implementation FormatSplitView

- (_TtC8NewsFeed15FormatSplitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed15FormatSplitView *)FormatSplitView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed15FormatSplitView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  _TtC8NewsFeed15FormatSplitView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed15FormatSplitView_splitView;
  v6 = objc_allocWithZone((Class)sub_1BB871788());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = (char *)self + OBJC_IVAR____TtC8NewsFeed15FormatSplitView_model;
  v9 = sub_1BB86FA24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC8NewsFeed15FormatSplitView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[FormatSplitView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed15FormatSplitView_splitView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void).cxx_destruct
{

  sub_1BB1D9AD4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed15FormatSplitView_model);
}

@end
