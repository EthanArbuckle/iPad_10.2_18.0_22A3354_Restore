@implementation FormatProgressPieView

- (_TtC8NewsFeed21FormatProgressPieView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21FormatProgressPieView *)sub_1BA67AE9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21FormatProgressPieView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB68F764();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[FormatProgressPieView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  v5 = objc_msgSend(v4, sel_CGColor);

  objc_msgSend(v3, sel_setBackgroundColor_, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_layerDelegate));
}

@end
