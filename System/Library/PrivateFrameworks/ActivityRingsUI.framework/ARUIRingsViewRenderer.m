@implementation ARUIRingsViewRenderer

- (ARUIRingsViewRenderer)initWithMaximumRingCount:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsViewRenderer;
  return -[ARUIRenderer init](&v4, sel_init, a3);
}

+ (id)rendererForRingGroupController:(id)a3
{
  return objc_alloc_init(ARUIRingsViewRenderer);
}

+ (id)rendererForRingGroupControllers:(id)a3
{
  return objc_alloc_init(ARUIRingsViewRenderer);
}

- (ARUIRingsViewRenderer)initWithMaximumRingCount:(unint64_t)a3 commandQueue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARUIRingsViewRenderer;
  return -[ARUIRenderer initWithCommandQueue:](&v5, sel_initWithCommandQueue_, a4);
}

- (unint64_t)maximumRingCount
{
  return self->_maximumRingCount;
}

@end
