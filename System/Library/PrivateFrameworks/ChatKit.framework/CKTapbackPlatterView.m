@implementation CKTapbackPlatterView

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_backgroundView), sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  CKTapbackPlatterView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_backgroundView);
  v6 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setBackgroundColor_, v6);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_mediumTail), sel_setBackgroundColor_, v6);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_smallTail), sel_setBackgroundColor_, v6);

}

- (CKTapbackPlatterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6CB054();
}

- (CKTapbackPlatterView)initWithFrame:(CGRect)a3
{
  return (CKTapbackPlatterView *)TapbackPlatterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  CKTapbackPlatterView *v2;

  v2 = self;
  sub_18E6C9B28();

}

- (CGRect)tapbackContentContainerRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CKTapbackPlatterView bounds](self, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPlatterView_gradientReferenceView);
}

@end
