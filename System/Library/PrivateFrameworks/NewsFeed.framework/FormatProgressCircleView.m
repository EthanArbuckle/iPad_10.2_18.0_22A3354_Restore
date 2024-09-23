@implementation FormatProgressCircleView

- (_TtC8NewsFeed24FormatProgressCircleView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed24FormatProgressCircleView *)sub_1BB124420(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed24FormatProgressCircleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB124A20();
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
  -[FormatProgressCircleView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  v5 = objc_msgSend(v4, sel_CGColor);

  objc_msgSend(v3, sel_setBackgroundColor_, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_progressLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_layerDelegate));
}

@end
