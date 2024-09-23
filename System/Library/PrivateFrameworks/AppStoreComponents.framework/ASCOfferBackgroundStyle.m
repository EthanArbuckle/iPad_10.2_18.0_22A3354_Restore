@implementation ASCOfferBackgroundStyle

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCOfferBackgroundStyle;
  return -[ASCOfferBackgroundStyle init](&v3, sel_init);
}

- (ASCOfferBackgroundStyle)init
{
  -[ASCOfferBackgroundStyle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4
{
  -[ASCOfferBackgroundStyle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.width, a3.height, a4);
  return 0.0;
}

+ (id)defaultStyle
{
  return objc_alloc_init(ASCDefaultOfferBackgroundStyle);
}

+ (id)fixedCornerRadiusStyle:(double)a3
{
  return -[ASCFixedCornerRadiusOfferBackgroundStyle initWithCornerRadius:]([ASCFixedCornerRadiusOfferBackgroundStyle alloc], "initWithCornerRadius:", a3);
}

@end
