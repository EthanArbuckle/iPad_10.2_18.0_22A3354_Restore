@implementation CCUIMutableLayoutOptions

- (void)setItemEdgeSize:(double)a3
{
  self->super._itemEdgeSize = a3;
}

- (void)setItemSpacing:(double)a3
{
  self->super._itemSpacing = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CCUILayoutOptions _initWithLayoutOptions:]([CCUILayoutOptions alloc], "_initWithLayoutOptions:", self);
}

@end
