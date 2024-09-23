@implementation _NSOrderedSetDiff

- (_NSOrderedSetDiff)initWithObject:(id)a3
{
  _NSOrderedSetDiff *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSOrderedSetDiff;
  v4 = -[_NSOrderedSetDiff init](&v6, sel_init);
  if (v4)
    v4->_diffObject = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSOrderedSetDiff;
  -[_NSOrderedSetDiff dealloc](&v3, sel_dealloc);
}

- (void)applyToSet:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
