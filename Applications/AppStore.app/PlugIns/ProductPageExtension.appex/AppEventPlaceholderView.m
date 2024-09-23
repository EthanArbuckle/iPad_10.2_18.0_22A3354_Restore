@implementation AppEventPlaceholderView

- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23AppEventPlaceholderView *)sub_1004B4AEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23AppEventPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004B5020();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension23AppEventPlaceholderView *v2;

  v2 = self;
  sub_1004B4D6C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23AppEventPlaceholderView_formattedDatePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23AppEventPlaceholderView_appEventPlaceholder));
}

@end
