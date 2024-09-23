@implementation ARUICountdownAnimator

- (ARUICountdownAnimator)initWithTimeline:(id)a3
{
  id v5;
  ARUICountdownAnimator *v6;
  ARUICountdownAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUICountdownAnimator;
  v6 = -[ARUICountdownAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeline, a3);
    *(_WORD *)&v7->_animating = 0;
  }

  return v7;
}

- (void)prepareToAnimate
{
  id WeakRetained;
  id v4;

  -[ARUICountdownTimeline prepareToAnimate](self->_timeline, "prepareToAnimate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
  objc_msgSend(v4, "applyToCountdownView:completion:", WeakRetained, 0);

}

- (void)beginAnimations
{
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_animating)
  {
    -[ARUICountdownAnimator _delegate_willBeginAnimating](self, "_delegate_willBeginAnimating");
    *(_WORD *)&self->_animating = 1;
    objc_initWeak(&location, self);
    -[ARUICountdownTimeline prepareToAnimate](self->_timeline, "prepareToAnimate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_currentAnimation, v3);

    -[ARUICountdownTimeline prepareToAnimate](self->_timeline, "prepareToAnimate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__ARUICountdownAnimator_beginAnimations__block_invoke;
    v6[3] = &unk_24CEC60E0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "applyToCountdownView:completion:", WeakRetained, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __40__ARUICountdownAnimator_beginAnimations__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyAnimationAtIndex:", 0);

}

- (BOOL)canceled
{
  return self->_canceled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)_applyAnimationAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  dispatch_time_t v12;
  id *p_to;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  id v17[2];
  _QWORD block[4];
  id v19;
  id v20;
  id v21[2];
  id to;
  id from;
  id location;

  if (!-[ARUICountdownAnimator canceled](self, "canceled") && -[ARUICountdownAnimator isAnimating](self, "isAnimating"))
  {
    -[ARUICountdownTimeline animations](self->_timeline, "animations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 <= a3)
    {
      *(_WORD *)&self->_animating = 0;
      -[ARUICountdownAnimator _delegate_didFinishAnimating](self, "_delegate_didFinishAnimating");
    }
    else
    {
      -[ARUICountdownTimeline animations](self->_timeline, "animations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeWeak((id *)&self->_currentAnimation, v8);
      objc_msgSend(v8, "delay");
      v10 = v9;
      -[ARUICountdownAnimator _delegate_willBeginAnimation:afterDelay:](self, "_delegate_willBeginAnimation:afterDelay:", v8);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v8);
      v11 = v10;
      if (ARUIFloatGreater(v11, 0.0))
      {
        objc_copyWeak(&to, (id *)&self->_countdownView);
        v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke;
        block[3] = &unk_24CEC6150;
        objc_copyWeak(&v19, &location);
        objc_copyWeak(&v20, &from);
        objc_copyWeak(v21, &to);
        v21[1] = (id)a3;
        dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
        objc_destroyWeak(v21);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&v19);
        p_to = &to;
      }
      else
      {
        objc_msgSend(v8, "duration");
        -[ARUICountdownAnimator _delegate_performingAnimation:withDuration:](self, "_delegate_performingAnimation:withDuration:", v8);
        WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_3;
        v15[3] = &unk_24CEC6128;
        objc_copyWeak(&v16, &location);
        objc_copyWeak(v17, &from);
        v17[1] = (id)a3;
        objc_msgSend(v8, "applyToCountdownView:completion:", WeakRetained, v15);

        objc_destroyWeak(v17);
        p_to = &v16;
      }
      objc_destroyWeak(p_to);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }
}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8[2];

  v2 = a1 + 4;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  if ((objc_msgSend(WeakRetained, "canceled") & 1) == 0 && objc_msgSend(WeakRetained, "isAnimating"))
  {
    v4 = objc_loadWeakRetained(a1 + 5);
    v5 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v4, "duration");
    objc_msgSend(WeakRetained, "_delegate_performingAnimation:withDuration:", v4);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_2;
    v6[3] = &unk_24CEC6128;
    objc_copyWeak(&v7, v2);
    objc_copyWeak(v8, a1 + 5);
    v8[1] = a1[7];
    objc_msgSend(v4, "applyToCountdownView:completion:", v5, v6);
    objc_destroyWeak(v8);
    objc_destroyWeak(&v7);

  }
}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  objc_msgSend(WeakRetained, "_applyAnimationAtIndex:", *(_QWORD *)(a1 + 48) + 1);

}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  objc_msgSend(WeakRetained, "_applyAnimationAtIndex:", *(_QWORD *)(a1 + 48) + 1);

}

- (void)cancelAnimations
{
  ARUICountdownAnimation **p_currentAnimation;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_animating)
  {
    p_currentAnimation = &self->_currentAnimation;
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentAnimation);
    v5 = objc_msgSend(WeakRetained, "cancelable");

    if (v5)
    {
      self->_canceled = 1;
      objc_initWeak(&location, self);
      -[ARUICountdownTimeline prepareToCancel](self->_timeline, "prepareToCancel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_currentAnimation, v6);

      -[ARUICountdownTimeline prepareToCancel](self->_timeline, "prepareToCancel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)&self->_countdownView);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __41__ARUICountdownAnimator_cancelAnimations__block_invoke;
      v9[3] = &unk_24CEC60E0;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "applyToCountdownView:completion:", v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __41__ARUICountdownAnimator_cancelAnimations__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyCancelAnimationAtIndex:", 0);

}

- (void)_applyCancelAnimationAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id from;
  id location;

  -[ARUICountdownTimeline cancelAnimations](self->_timeline, "cancelAnimations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    *(_WORD *)&self->_animating = 0;
    -[ARUICountdownAnimator _delegate_didFinishAnimating](self, "_delegate_didFinishAnimating");
  }
  else
  {
    -[ARUICountdownTimeline cancelAnimations](self->_timeline, "cancelAnimations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)&self->_currentAnimation, v8);
    -[ARUICountdownAnimator _delegate_willBeginAnimation:afterDelay:](self, "_delegate_willBeginAnimation:afterDelay:", v8, 0.0);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    objc_msgSend(v8, "duration");
    -[ARUICountdownAnimator _delegate_performingAnimation:withDuration:](self, "_delegate_performingAnimation:withDuration:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__ARUICountdownAnimator__applyCancelAnimationAtIndex___block_invoke;
    v10[3] = &unk_24CEC6128;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(v12, &from);
    v12[1] = (id)a3;
    objc_msgSend(v8, "applyToCountdownView:completion:", WeakRetained, v10);

    objc_destroyWeak(v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __54__ARUICountdownAnimator__applyCancelAnimationAtIndex___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  objc_msgSend(WeakRetained, "_applyCancelAnimationAtIndex:", *(_QWORD *)(a1 + 48) + 1);

}

- (void)_delegate_willBeginAnimating
{
  id WeakRetained;

  if (self->_delegateFlags.willBeginAnimating)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "countdownAnimatorWillBeginAnimating:", self);

  }
}

- (void)_delegate_willBeginAnimation:(id)a3 afterDelay:(double)a4
{
  ARUICountdownAnimatorDelegate **p_delegate;
  id v7;
  id WeakRetained;

  if (self->_delegateFlags.willBeginAnimation)
  {
    p_delegate = &self->_delegate;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "countdownAnimator:willBeginAnimation:afterDelay:", self, v7, a4);

  }
}

- (void)_delegate_performingAnimation:(id)a3 withDuration:(double)a4
{
  ARUICountdownAnimatorDelegate **p_delegate;
  id v7;
  id WeakRetained;

  if (self->_delegateFlags.performingAnimation)
  {
    p_delegate = &self->_delegate;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "countdownAnimator:performingAnimation:withDuration:", self, v7, a4);

  }
}

- (void)_delegate_completedAnimation:(id)a3
{
  ARUICountdownAnimatorDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (self->_delegateFlags.completedAnimation)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "countdownAnimator:completedAnimation:", self, v5);

  }
}

- (void)_delegate_didFinishAnimating
{
  id WeakRetained;

  if (self->_delegateFlags.didFinishAnimating)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "countdownAnimatorDidFinishAnimating:", self);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    self->_delegateFlags.willBeginAnimating = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.willBeginAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.performingAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.completedAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.didFinishAnimating = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (ARUICountdownTimeline)timeline
{
  return self->_timeline;
}

- (void)setTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_timeline, a3);
}

- (ARUICountdownView)countdownView
{
  return (ARUICountdownView *)objc_loadWeakRetained((id *)&self->_countdownView);
}

- (void)setCountdownView:(id)a3
{
  objc_storeWeak((id *)&self->_countdownView, a3);
}

- (ARUICountdownAnimatorDelegate)delegate
{
  return (ARUICountdownAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_countdownView);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_destroyWeak((id *)&self->_currentAnimation);
}

@end
