@implementation BundleChildView

- (_TtC20ProductPageExtension15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension15BundleChildView *)sub_10005515C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension15BundleChildView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100055808();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension15BundleChildView *v3;

  v3 = self;
  sub_100055460((uint64_t)v3, v2);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension15BundleChildView *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  v5 = sub_1000559D0((uint64_t)v3, v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15BundleChildView_icon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15BundleChildView_titleLabel));
}

@end
