@implementation JFXEffectAnimationDelegate

- (void)animateWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[JFXEffectAnimationDelegate setAnimationDidBegin:](self, "setAnimationDidBegin:", 1);
  -[JFXEffectAnimationDelegate setCompletion:](self, "setCompletion:", v4);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a4;
  -[JFXEffectAnimationDelegate setAnimationDidEnd:](self, "setAnimationDidEnd:", 1);
  -[JFXEffectAnimationDelegate completion](self, "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JFXEffectAnimationDelegate completion](self, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

  }
  -[JFXEffectAnimationDelegate setCompletion:](self, "setCompletion:", 0);
}

- (BOOL)animationDidBegin
{
  return self->_animationDidBegin;
}

- (void)setAnimationDidBegin:(BOOL)a3
{
  self->_animationDidBegin = a3;
}

- (BOOL)animationDidEnd
{
  return self->_animationDidEnd;
}

- (void)setAnimationDidEnd:(BOOL)a3
{
  self->_animationDidEnd = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
