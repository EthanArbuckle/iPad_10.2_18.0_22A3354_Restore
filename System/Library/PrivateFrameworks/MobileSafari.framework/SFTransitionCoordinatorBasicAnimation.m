@implementation SFTransitionCoordinatorBasicAnimation

- (_QWORD)initWithAnimations:(void *)a1
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)SFTransitionCoordinatorBasicAnimation;
  v2 = a2;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = _Block_copy(v2);

  v5 = (void *)v3[1];
  v3[1] = v4;

  return v3;
}

- (void)invokeInContext:(id)a3
{
  (*((void (**)(void))self->_animations + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animations, 0);
}

@end
