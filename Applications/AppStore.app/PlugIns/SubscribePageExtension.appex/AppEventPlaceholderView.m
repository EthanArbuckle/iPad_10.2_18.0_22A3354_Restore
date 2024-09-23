@implementation AppEventPlaceholderView

- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23AppEventPlaceholderView *)sub_1000D07A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D0CDC();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension23AppEventPlaceholderView *v2;

  v2 = self;
  sub_1000D0A28();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23AppEventPlaceholderView_formattedDatePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23AppEventPlaceholderView_appEventPlaceholder));
}

@end
