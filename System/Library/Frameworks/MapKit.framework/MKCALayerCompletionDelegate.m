@implementation MKCALayerCompletionDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

+ (id)delegateWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCompletion:", v3);

  return v4;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**completion)(id, BOOL, id);

  completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a4, a3);
    completion = (void (**)(id, BOOL, id))self->_completion;
  }
  self->_completion = 0;

}

- (id)completion
{
  return self->_completion;
}

@end
