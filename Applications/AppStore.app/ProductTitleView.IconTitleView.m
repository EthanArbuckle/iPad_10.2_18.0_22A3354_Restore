@implementation ProductTitleView.IconTitleView

- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView *)sub_100250BB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100251688();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_10024F6D0();
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
  _TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView *v2;

  v2 = self;
  sub_100250F08();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_appTitleView));
  sub_1000057AC((uint64_t)self+ OBJC_IVAR____TtCC8AppStore16ProductTitleViewP33_601B9F87A521249726497EC9B648F39D13IconTitleView_iconAspectRatio, (uint64_t *)&unk_10082E1A0);
}

@end
