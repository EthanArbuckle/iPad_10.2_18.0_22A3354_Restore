@implementation SUUIPhysicalCirclesAnimationRequest

- (void)finishAnimation
{
  void (**completionBlock)(id, SEL);
  id v4;

  completionBlock = (void (**)(id, SEL))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, a2);
    v4 = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (void)_setCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  if (self->_completionBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    completionBlock = self->_completionBlock;
    self->_completionBlock = v4;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAnimationType:", self->_animationType);
  objc_msgSend(v4, "_setCompletionBlock:", self->_completionBlock);
  return v4;
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
