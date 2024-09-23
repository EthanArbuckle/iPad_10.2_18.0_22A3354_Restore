@implementation ArticleThumbnailView

- (_TtC8NewsFeed20ArticleThumbnailView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20ArticleThumbnailView *)ArticleThumbnailView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed20ArticleThumbnailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8NewsFeed20ArticleThumbnailViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[ArticleThumbnailView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed20ArticleThumbnailView_staticContentView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed20ArticleThumbnailView_dynamicContentView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (void)didMoveToSuperview
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[ArticleThumbnailView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  if ((objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed20ArticleThumbnailView_dynamicContentView], sel_isHidden, v3.receiver, v3.super_class) & 1) == 0)sub_1BB6BBC20();

}

- (void)removeFromSuperview
{
  _TtC8NewsFeed20ArticleThumbnailView *v2;

  v2 = self;
  ArticleThumbnailView.removeFromSuperview()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20ArticleThumbnailView_staticContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20ArticleThumbnailView_dynamicContentView));

  swift_bridgeObjectRelease();
}

@end
