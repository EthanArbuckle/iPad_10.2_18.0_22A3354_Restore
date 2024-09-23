@implementation NUCGAffineTransform

- (NUCGAffineTransform)initWithCGAffineTransform:(CGAffineTransform *)a3
{
  NUCGAffineTransform *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUCGAffineTransform;
  result = -[NUCGAffineTransform init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->a;
    v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&result->_value.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&result->_value.c = v6;
    *(_OWORD *)&result->_value.a = v5;
  }
  return result;
}

- (CGAffineTransform)value
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_value, 48, 1, 0);
  return result;
}

@end
