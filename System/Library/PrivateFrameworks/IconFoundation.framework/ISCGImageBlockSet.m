@implementation ISCGImageBlockSet

- (ISCGImageBlockSet)initWithBlockSet:(CGImageBlockSet *)a3
{
  ISCGImageBlockSet *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISCGImageBlockSet;
  v3 = -[ISCGImageBlockSet init](&v5, sel_init);
  if (v3)
    v3->_blockSet = (CGImageBlockSet *)CGImageBlockSetRetain();
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_blockSet)
    CGImageBlockSetRelease();
  v3.receiver = self;
  v3.super_class = (Class)ISCGImageBlockSet;
  -[ISCGImageBlockSet dealloc](&v3, sel_dealloc);
}

- (CGImageBlockSet)blockSet
{
  return self->_blockSet;
}

- (void)setBlockSet:(CGImageBlockSet *)a3
{
  self->_blockSet = a3;
}

@end
