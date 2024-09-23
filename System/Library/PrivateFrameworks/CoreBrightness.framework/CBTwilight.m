@implementation CBTwilight

- (CBTwilight)initWithParams:(id)a3
{
  CBTwilightPolicy *v4;
  CBTwilight *v7;

  v4 = objc_alloc_init(CBTwilightPolicy);
  v7 = -[CBChromaticCorrection initWithBacklightParams:andPolicy:](self, "initWithBacklightParams:andPolicy:", a3, v4);

  return v7;
}

@end
