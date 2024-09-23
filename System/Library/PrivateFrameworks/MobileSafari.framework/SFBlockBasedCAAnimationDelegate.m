@implementation SFBlockBasedCAAnimationDelegate

+ (id)animationDelegateWithDidStopBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAnimationDidStopBlock:", v4);

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void (**animationDidStopBlock)(id, id, _BOOL8);
  id v8;

  v4 = a4;
  v6 = a3;
  animationDidStopBlock = (void (**)(id, id, _BOOL8))self->_animationDidStopBlock;
  v8 = v6;
  if (animationDidStopBlock)
  {
    animationDidStopBlock[2](animationDidStopBlock, v6, v4);
    v6 = v8;
  }
  objc_msgSend(v6, "setValue:forKey:", 0, CFSTR("blockBasedAnimationDelegate"));

}

- (void)associateLifetimeWithAnimation:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", self, CFSTR("blockBasedAnimationDelegate"));
}

- (id)animationDidStopBlock
{
  return self->_animationDidStopBlock;
}

- (void)setAnimationDidStopBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidStopBlock, 0);
}

@end
