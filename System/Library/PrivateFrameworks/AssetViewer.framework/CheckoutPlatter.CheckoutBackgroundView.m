@implementation CheckoutPlatter.CheckoutBackgroundView

- (void)layoutSubviews
{
  _TtCC11AssetViewer15CheckoutPlatterP33_F468E41BE5B62EA82788C6057D60C24D22CheckoutBackgroundView *v2;

  v2 = self;
  sub_1D94BE150();

}

- (_TtCC11AssetViewer15CheckoutPlatterP33_F468E41BE5B62EA82788C6057D60C24D22CheckoutBackgroundView)initWithFrame:(CGRect)a3 backgroundStyle:(int64_t)a4 controlStyle:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CheckoutPlatter.CheckoutBackgroundView();
  return -[ASVBlurredBackgroundView initWithFrame:backgroundStyle:controlStyle:](&v12, sel_initWithFrame_backgroundStyle_controlStyle_, a4, a5, x, y, width, height);
}

@end
