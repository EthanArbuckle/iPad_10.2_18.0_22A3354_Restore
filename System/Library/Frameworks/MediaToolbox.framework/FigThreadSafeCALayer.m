@implementation FigThreadSafeCALayer

- (FigThreadSafeCALayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigThreadSafeCALayer;
  return -[FigBaseCALayer initWithDeferredTransaction:](&v4, sel_initWithDeferredTransaction_, a3);
}

- (FigThreadSafeCALayer)initWithoutDeferredTransaction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigThreadSafeCALayer;
  return -[FigBaseCALayer init](&v3, sel_init);
}

@end
