@implementation CAMAnimationDelegate

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)animationDidStart:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CAMAnimationDelegate start](self, "start", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMAnimationDelegate start](self, "start");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)start
{
  return self->_start;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _BOOL8);

  v4 = a4;
  -[CAMAnimationDelegate completion](self, "completion", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAMAnimationDelegate completion](self, "completion");
    v7 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

  }
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_start, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)setStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
