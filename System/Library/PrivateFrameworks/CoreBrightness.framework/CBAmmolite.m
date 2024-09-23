@implementation CBAmmolite

- (CBAmmolite)initWithParams:(id)a3
{
  CBAmmolitePolicy *v4;
  CBAmmolite *v7;

  v4 = objc_alloc_init(CBAmmolitePolicy);
  v7 = -[CBChromaticCorrection initWithBacklightParams:andPolicy:](self, "initWithBacklightParams:andPolicy:", a3, v4);

  return v7;
}

@end
