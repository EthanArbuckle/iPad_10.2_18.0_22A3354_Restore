@implementation AVMobileContentTabTransitionContext

- (void)setDirection:(unint64_t)a3
{
  if (self->_direction != a3)
    self->_direction = a3;
}

- (void)setAnimationCoordinator:(id)a3
{
  AVPlayerViewControllerAnimationCoordinator *v5;
  AVPlayerViewControllerAnimationCoordinator **p_animationCoordinator;
  AVPlayerViewControllerAnimationCoordinator *animationCoordinator;
  AVPlayerViewControllerAnimationCoordinator *v8;

  v5 = (AVPlayerViewControllerAnimationCoordinator *)a3;
  animationCoordinator = self->_animationCoordinator;
  p_animationCoordinator = &self->_animationCoordinator;
  if (animationCoordinator != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_animationCoordinator, a3);
    v5 = v8;
  }

}

- (unint64_t)direction
{
  return self->_direction;
}

- (AVPlayerViewControllerAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCoordinator, 0);
}

@end
