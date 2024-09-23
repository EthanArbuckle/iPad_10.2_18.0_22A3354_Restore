@implementation HUCCCompactModulePropertyAnimator

- (void)startAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCCCompactModulePropertyAnimator;
  -[UIViewPropertyAnimator startAnimation](&v4, sel_startAnimation);
  -[HUCCCompactModulePropertyAnimator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyAnimatorDidStartAnimating:", self);

}

- (HUCCCompactModulePropertyAnimatorDelegate)delegate
{
  return (HUCCCompactModulePropertyAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
