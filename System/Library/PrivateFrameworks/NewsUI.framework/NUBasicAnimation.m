@implementation NUBasicAnimation

+ (id)animationWithKeyPath:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___NUBasicAnimation;
  objc_msgSendSuper2(&v5, sel_animationWithKeyPath_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v3);
  return v3;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _BOOL8);

  v4 = a4;
  -[NUBasicAnimation completion](self, "completion", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUBasicAnimation completion](self, "completion");
    v7 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
