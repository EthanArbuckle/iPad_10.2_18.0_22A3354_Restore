@implementation PKPencilInteraction

+ (PKPencilInteraction)fallbackPencilInteraction
{
  PKPencilInteraction *v0;
  objc_super v2;

  objc_opt_self();
  v0 = [PKPencilInteraction alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)PKPencilInteraction;
    v0 = (PKPencilInteraction *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_dispatchBehavior = 1;
      v0->_wantsDoubleTap = 1;
    }
  }
  return v0;
}

+ (PKPencilInteraction)observerPencilInteraction
{
  PKPencilInteraction *v0;
  objc_super v2;

  objc_opt_self();
  v0 = [PKPencilInteraction alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)PKPencilInteraction;
    v0 = (PKPencilInteraction *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_dispatchBehavior = 2;
      v0->_wantsDoubleTap = 1;
    }
  }
  return v0;
}

- (unint64_t)_dispatchBehavior
{
  return self->_dispatchBehavior;
}

- (BOOL)_shouldReceiveGestureType:(unint64_t)a3
{
  return a3 || self->_wantsDoubleTap;
}

@end
