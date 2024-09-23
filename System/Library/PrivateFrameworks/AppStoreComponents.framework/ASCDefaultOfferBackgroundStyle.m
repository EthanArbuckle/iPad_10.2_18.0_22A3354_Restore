@implementation ASCDefaultOfferBackgroundStyle

- (ASCDefaultOfferBackgroundStyle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCDefaultOfferBackgroundStyle;
  return (ASCDefaultOfferBackgroundStyle *)-[ASCOfferBackgroundStyle _init](&v3, sel__init);
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4
{
  return floor((a3.height - a4) * 0.5);
}

@end
