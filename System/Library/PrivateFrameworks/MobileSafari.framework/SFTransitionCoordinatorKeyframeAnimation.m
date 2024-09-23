@implementation SFTransitionCoordinatorKeyframeAnimation

- (double)initWithStartTime:(double)a3 duration:(double)a4 animations:
{
  id v6;
  double *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (!a1)
    return 0;
  v11.receiver = a1;
  v11.super_class = (Class)SFTransitionCoordinatorKeyframeAnimation;
  v6 = a2;
  v7 = (double *)objc_msgSendSuper2(&v11, sel_init);
  v8 = _Block_copy(v6);

  v9 = (void *)*((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v8;

  v7[2] = a4;
  v7[3] = a3;
  return v7;
}

- (void)invokeInContext:(id)a3
{
  id v4;
  void *v5;
  double startTime;
  double duration;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if ((objc_msgSend(v4, "usesKeyframeAnimations") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    duration = self->_duration;
    startTime = self->_startTime;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__SFTransitionCoordinatorKeyframeAnimation_invokeInContext___block_invoke;
    v8[3] = &unk_1E21E2258;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, startTime, duration);

  }
  else
  {
    (*((void (**)(void))self->_animations + 2))();
  }

}

uint64_t __60__SFTransitionCoordinatorKeyframeAnimation_invokeInContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animations, 0);
}

@end
