@implementation HUCCSmartGridPropertyAnimator

- (void)startAnimation
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCCSmartGridPropertyAnimator;
  -[UIViewPropertyAnimator startAnimation](&v7, sel_startAnimation);
  objc_msgSend_delegate(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyAnimatorDidStartAnimating_(v5, v6, (uint64_t)self);

}

- (HUCCSmartGridPropertyAnimatorDelegate)delegate
{
  return (HUCCSmartGridPropertyAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
