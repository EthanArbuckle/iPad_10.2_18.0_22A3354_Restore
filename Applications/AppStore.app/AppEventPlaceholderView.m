@implementation AppEventPlaceholderView

- (_TtC8AppStore23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23AppEventPlaceholderView *)sub_10029E48C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10029E9C0();
}

- (void)layoutSubviews
{
  _TtC8AppStore23AppEventPlaceholderView *v2;

  v2 = self;
  sub_10029E70C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23AppEventPlaceholderView_formattedDatePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23AppEventPlaceholderView_appEventPlaceholder));
}

@end
