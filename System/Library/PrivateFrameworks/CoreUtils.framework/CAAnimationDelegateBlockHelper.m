@implementation CAAnimationDelegateBlockHelper

- (void)dealloc
{
  id animationDidStartBlock;
  id animationDidStopBlock;
  objc_super v5;

  animationDidStartBlock = self->_animationDidStartBlock;
  self->_animationDidStartBlock = 0;

  animationDidStopBlock = self->_animationDidStopBlock;
  self->_animationDidStopBlock = 0;

  v5.receiver = self;
  v5.super_class = (Class)CAAnimationDelegateBlockHelper;
  -[CAAnimationDelegateBlockHelper dealloc](&v5, sel_dealloc);
}

- (void)animationDidStart:(id)a3
{
  void (**animationDidStartBlock)(void);

  animationDidStartBlock = (void (**)(void))self->_animationDidStartBlock;
  if (animationDidStartBlock)
    animationDidStartBlock[2]();
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**animationDidStopBlock)(id, BOOL);

  animationDidStopBlock = (void (**)(id, BOOL))self->_animationDidStopBlock;
  if (animationDidStopBlock)
    animationDidStopBlock[2](animationDidStopBlock, a4);
}

- (id)animationDidStartBlock
{
  return self->_animationDidStartBlock;
}

- (void)setAnimationDidStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)animationDidStopBlock
{
  return self->_animationDidStopBlock;
}

- (void)setAnimationDidStopBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidStopBlock, 0);
  objc_storeStrong(&self->_animationDidStartBlock, 0);
}

@end
