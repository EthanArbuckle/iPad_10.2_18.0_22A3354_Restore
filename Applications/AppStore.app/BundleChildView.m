@implementation BundleChildView

- (_TtC8AppStore15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15BundleChildView *)sub_100613DC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15BundleChildView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10061446C();
}

- (void)layoutSubviews
{
  _TtC8AppStore15BundleChildView *v2;

  v2 = self;
  sub_1006140C4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8AppStore15BundleChildView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_100614634();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{

}

@end
