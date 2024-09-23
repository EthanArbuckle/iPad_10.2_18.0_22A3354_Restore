@implementation ProductTitleView.IconTitleView

- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView *)sub_1004D81E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004D8CB8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1004D6D00();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView *v2;

  v2 = self;
  sub_1004D8538();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_appTitleView));
  sub_100010F2C((uint64_t)self+ OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_iconAspectRatio, (uint64_t *)&unk_100811F20);
}

@end
