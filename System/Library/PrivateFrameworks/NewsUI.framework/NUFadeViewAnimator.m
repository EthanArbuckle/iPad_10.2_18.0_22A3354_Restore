@implementation NUFadeViewAnimator

- (NUFadeViewAnimator)init
{
  NUFadeViewAnimator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUFadeViewAnimator;
  result = -[NUFadeViewAnimator init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_fadeOutDuration = vdupq_n_s64(0x3FC70A3D70A3D70AuLL);
    result->_fadeInDelay = 0.15;
  }
  return result;
}

- (void)fadeFromView:(id)a3 toView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v11 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v12 = (void *)MEMORY[0x24BDF6F90];
    -[NUFadeViewAnimator fadeOutDuration](self, "fadeOutDuration");
    v14 = v13;
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke;
    v26[3] = &unk_24D5A1D88;
    v27 = v8;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0, v26, &__block_literal_global_10, v14, 0.0);
    -[NUFadeViewAnimator fadeInDelay](self, "fadeInDelay");
    v16 = v15;

  }
  else
  {
    v16 = 0.0;
  }
  v17 = (void *)MEMORY[0x24BDF6F90];
  -[NUFadeViewAnimator fadeInDuration](self, "fadeInDuration");
  v19 = v18;
  v23 = v10;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_3;
  v24[3] = &unk_24D5A1D88;
  v25 = v9;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_4;
  v22[3] = &unk_24D5A2A98;
  v20 = v10;
  v21 = v9;
  objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 0, v24, v22, v19, v16);

}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeInDelay
{
  return self->_fadeInDelay;
}

- (void)setFadeInDelay:(double)a3
{
  self->_fadeInDelay = a3;
}

@end
