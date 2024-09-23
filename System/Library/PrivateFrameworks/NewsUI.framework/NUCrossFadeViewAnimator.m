@implementation NUCrossFadeViewAnimator

- (NUCrossFadeViewAnimator)init
{
  NUCrossFadeViewAnimator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUCrossFadeViewAnimator;
  result = -[NUCrossFadeViewAnimator init](&v3, sel_init);
  if (result)
    result->_duration = 0.15;
  return result;
}

- (void)resetView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

}

- (void)crossFadeFromView:(id)a3 toView:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    if (v13 && v13 != v10)
      -[NUCrossFadeViewAnimator animateView:toEmptyStateWithCompletion:](self, "animateView:toEmptyStateWithCompletion:");
    -[NUCrossFadeViewAnimator animateView:toValue:completion:](self, "animateView:toValue:completion:", v10, v11, v12);
  }
  else
  {
    -[NUCrossFadeViewAnimator animateView:toEmptyStateWithCompletion:](self, "animateView:toEmptyStateWithCompletion:", v10, v12);
  }

}

- (void)animateView:(id)a3 toValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[NUTransition animation](NUTransition, "animation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setType:", *MEMORY[0x24BDE5E00]);
  -[NUCrossFadeViewAnimator duration](self, "duration");
  objc_msgSend(v11, "setDuration:");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__NUCrossFadeViewAnimator_animateView_toValue_completion___block_invoke;
  v15[3] = &unk_24D5A2A98;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "setCompletion:", v15);
  objc_msgSend(v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllAnimations");

  objc_msgSend(v10, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v11, CFSTR("crossfade"));

  objc_msgSend(v10, "nu_crossFadeViewSetValue:", v9);
}

uint64_t __58__NUCrossFadeViewAnimator_animateView_toValue_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateView:(id)a3 toEmptyStateWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[NUBasicAnimation animationWithKeyPath:](NUBasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", &unk_24D5BA970);
  objc_msgSend(v8, "setToValue:", &unk_24D5BA980);
  -[NUCrossFadeViewAnimator duration](self, "duration");
  objc_msgSend(v8, "setDuration:");
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __66__NUCrossFadeViewAnimator_animateView_toEmptyStateWithCompletion___block_invoke;
  v15 = &unk_24D5A2AC0;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "setCompletion:", &v12);
  objc_msgSend(v10, "layer", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v8, CFSTR("opacity"));

}

uint64_t __66__NUCrossFadeViewAnimator_animateView_toEmptyStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nu_crossFadeViewClearVisibleState");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
