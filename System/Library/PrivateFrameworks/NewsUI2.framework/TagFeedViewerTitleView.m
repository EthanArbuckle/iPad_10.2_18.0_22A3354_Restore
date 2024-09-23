@implementation TagFeedViewerTitleView

- (_TtC7NewsUI222TagFeedViewerTitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC7NewsUI222TagFeedViewerTitleView *v11;
  _TtC7NewsUI222TagFeedViewerTitleView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView;
  v10 = objc_allocWithZone(MEMORY[0x1E0D62950]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[TagFeedViewerTitleView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[TagFeedViewerTitleView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView));
  return v12;
}

- (_TtC7NewsUI222TagFeedViewerTitleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI222TagFeedViewerTitleView *result;

  v5 = OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView;
  v6 = objc_allocWithZone(MEMORY[0x1E0D62950]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI222TagFeedViewerTitleView *)sub_1D6E28010();
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
  -[TagFeedViewerTitleView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void).cxx_destruct
{

}

@end
