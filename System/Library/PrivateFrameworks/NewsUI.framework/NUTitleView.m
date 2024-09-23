@implementation NUTitleView

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NUTitleView)initWithStyler:(id)a3
{
  id v5;
  CGPoint *v6;
  NUTitleView *v7;
  NUTitleView *v8;
  NUAnimationQueue *v9;
  NUAnimationQueue *animationQueue;
  NUSlideViewAnimator *v11;
  uint64_t v12;
  NUSlideViewAnimator *slideAnimator;
  void *v14;
  NUFadeViewAnimator *v15;
  NUFadeViewAnimator *fadeAnimator;
  CGSize v17;
  NUCrossFadeTitleView *v18;
  NUCrossFadeTitleView *titleView;
  NUCrossFadeTitleView *v20;
  NUCrossFadeTitleView *incomingTitleView;
  void *v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NUTitleView;
  v6 = (CGPoint *)MEMORY[0x24BDBF090];
  v7 = -[NUTitleView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_styler, a3);
    v9 = objc_alloc_init(NUAnimationQueue);
    animationQueue = v8->_animationQueue;
    v8->_animationQueue = v9;

    v11 = [NUSlideViewAnimator alloc];
    -[NUTitleView bounds](v8, "bounds");
    v12 = -[NUSlideViewAnimator initWithBounds:](v11, "initWithBounds:");
    slideAnimator = v8->_slideAnimator;
    v8->_slideAnimator = (NUSlideViewAnimator *)v12;

    NUTranslationAnimationTimingFunction();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUSlideViewAnimator setMediaTimingFunction:](v8->_slideAnimator, "setMediaTimingFunction:", v14);

    v15 = objc_alloc_init(NUFadeViewAnimator);
    fadeAnimator = v8->_fadeAnimator;
    v8->_fadeAnimator = v15;

    v17 = (CGSize)v6[1];
    v8->_lastLayoutBounds.origin = *v6;
    v8->_lastLayoutBounds.size = v17;
    v18 = -[NUCrossFadeTitleView initWithStyler:]([NUCrossFadeTitleView alloc], "initWithStyler:", v5);
    titleView = v8->_titleView;
    v8->_titleView = v18;

    -[NUCrossFadeTitleView setAutoresizingMask:](v8->_titleView, "setAutoresizingMask:", 2);
    -[NUCrossFadeTitleView setClipsToBounds:](v8->_titleView, "setClipsToBounds:", 1);
    -[NUTitleView addSubview:](v8, "addSubview:", v8->_titleView);
    v20 = -[NUCrossFadeTitleView initWithStyler:]([NUCrossFadeTitleView alloc], "initWithStyler:", v5);
    incomingTitleView = v8->_incomingTitleView;
    v8->_incomingTitleView = v20;

    -[NUCrossFadeTitleView setAutoresizingMask:](v8->_incomingTitleView, "setAutoresizingMask:", 2);
    -[NUCrossFadeTitleView setClipsToBounds:](v8->_incomingTitleView, "setClipsToBounds:", 1);
    -[NUTitleView insertSubview:belowSubview:](v8, "insertSubview:belowSubview:", v8->_incomingTitleView, v8->_titleView);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v8, sel_titleViewHandleTapGesture);
    -[NUTitleView addGestureRecognizer:](v8, "addGestureRecognizer:", v22);
    -[UIView nu_supportViewDebugging](v8, "nu_supportViewDebugging");

  }
  return v8;
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  _QWORD v35[6];
  id v36;
  _QWORD v37[6];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42[2];

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = dispatch_semaphore_create(0);
    objc_msgSend(v6, "setLingerSemaphore:", v7);

    v8 = *(_QWORD *)(a1 + 48);
    switch(v8)
    {
      case 0:
      case 3:
        v9 = v8 == 0;
        objc_msgSend(v6, "titleView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_4;
        v39[3] = &unk_24D5A1BB8;
        v12 = v42;
        objc_copyWeak(v42, (id *)(a1 + 40));
        v40 = *(id *)(a1 + 32);
        v41 = v3;
        objc_msgSend(v10, "updateTitleViewWithUpdate:animated:completion:", v11, v9, v39);
        v13 = &v40;
        v14 = &v41;
        goto LABEL_7;
      case 1:
        objc_msgSend(v6, "incomingTitleView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateTitleViewWithUpdate:animated:completion:", *(_QWORD *)(a1 + 32), 0, 0);

        objc_msgSend(v6, "createMaskingLayerForTranslation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMask:", v16);

        objc_msgSend(v6, "incomingTitleView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAlpha:", 1.0);

        objc_msgSend(v6, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "mask");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        objc_msgSend(v6, "slideAnimator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setBounds:", v22, v24, v26, v28);

        objc_msgSend(v6, "slideAnimator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "titleView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "incomingTitleView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_8;
        v35[3] = &unk_24D5A1BB8;
        v32 = v35;
        v12 = &v36;
        objc_copyWeak(&v36, (id *)(a1 + 40));
        v35[4] = *(id *)(a1 + 32);
        v35[5] = v3;
        objc_msgSend(v10, "translateFromView:toView:direction:completion:", v30, v31, 0, v35);
        goto LABEL_6;
      case 2:
        objc_msgSend(v6, "incomingTitleView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "updateTitleViewWithUpdate:animated:completion:", *(_QWORD *)(a1 + 32), 0, 0);

        objc_msgSend(v6, "incomingTitleView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAlpha:", 0.0);

        objc_msgSend(v6, "fadeAnimator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "titleView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "incomingTitleView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_6;
        v37[3] = &unk_24D5A1BB8;
        v32 = v37;
        v12 = &v38;
        objc_copyWeak(&v38, (id *)(a1 + 40));
        v37[4] = *(id *)(a1 + 32);
        v37[5] = v3;
        objc_msgSend(v10, "fadeFromView:toView:completion:", v30, v31, v37);
LABEL_6:
        v13 = (id *)(v32 + 4);
        v14 = (id *)(v32 + 5);

LABEL_7:
        objc_destroyWeak(v12);
        break;
      default:
        break;
    }

  }
}

- (void)setLingerSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_lingerSemaphore, a3);
}

- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20[2];
  id location;

  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled"))
      v7 = a4;
    else
      v7 = 3;
    if (objc_msgSend(v6, "shouldCancelPendingUpdates"))
    {
      -[NUTitleView animationQueue](self, "animationQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

      -[NUTitleView lingerSemaphore](self, "lingerSemaphore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NUTitleView lingerSemaphore](self, "lingerSemaphore");
        v10 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v10);

        -[NUTitleView setLingerSemaphore:](self, "setLingerSemaphore:", 0);
      }
    }
    objc_initWeak(&location, self);
    -[NUTitleView animationQueue](self, "animationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_2;
    v18 = &unk_24D5A2B08;
    objc_copyWeak(v20, &location);
    v20[1] = (id)v7;
    v12 = v6;
    v19 = v12;
    objc_msgSend(v11, "addAnimation:", &v15);

    objc_msgSend(v12, "accessibilityTitle", v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUTitleView setAccessibilityLabel:](self, "setAccessibilityLabel:", v13);

    -[NUTitleView accessibilityLabel](self, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUTitleView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", v14 != 0);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

- (void)setStyler:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_styler, a3);
  v5 = a3;
  -[NUTitleView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyler:", v5);

  -[NUTitleView incomingTitleView](self, "incomingTitleView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyler:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)NUTitleView;
  -[NUTitleView layoutSubviews](&v30, sel_layoutSubviews);
  -[NUTitleView slideAnimator](self, "slideAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAnimating") & 1) != 0)
    goto LABEL_5;
  -[NUTitleView lastLayoutBounds](self, "lastLayoutBounds");
  v5 = v4;
  v7 = v6;
  -[NUTitleView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;

  if (v5 != v9 || v7 != v11)
  {
    -[NUTitleView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[NUTitleView titleView](self, "titleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    -[NUTitleView bounds](self, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[NUTitleView incomingTitleView](self, "incomingTitleView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    -[NUTitleView titleView](self, "titleView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "relayoutWithAnimation:", 0);
LABEL_5:

  }
  -[NUTitleView bounds](self, "bounds");
  -[NUTitleView setLastLayoutBounds:](self, "setLastLayoutBounds:");
}

- (NUCrossFadeTitleView)titleView
{
  return self->_titleView;
}

- (NUCrossFadeTitleView)incomingTitleView
{
  return self->_incomingTitleView;
}

- (NUSlideViewAnimator)slideAnimator
{
  return self->_slideAnimator;
}

- (void)setLastLayoutBounds:(CGRect)a3
{
  self->_lastLayoutBounds = a3;
}

- (CGRect)lastLayoutBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastLayoutBounds.origin.x;
  y = self->_lastLayoutBounds.origin.y;
  width = self->_lastLayoutBounds.size.width;
  height = self->_lastLayoutBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "finishDisplayingTitleViewUpdate:finished:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)finishDisplayingTitleViewUpdate:(id)a3 finished:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  double v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  void (**v15)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _UIAccessibilityFocusedElements();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", self) & 1) != 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "shouldSpeakAccessibilityTitleWhenDisplayed");

  if (v9)
  {
    objc_msgSend(v6, "accessibilityTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      UIAccessibilitySpeakOrQueueIfNeeded();
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v6, "lingerTimeInterval");
  if (v10 == 0.0
    || (-[NUTitleView lingerSemaphore](self, "lingerSemaphore"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v7[2](v7);
  }
  else
  {
    dispatch_get_global_queue(-32768, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke;
    block[3] = &unk_24D5A1A28;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v12, block);

  }
}

- (NUAnimationQueue)animationQueue
{
  return self->_animationQueue;
}

- (NUTitleView)initWithFrame:(CGRect)a3
{
  return -[NUTitleView initWithStyler:](self, "initWithStyler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUTitleView)initWithCoder:(id)a3
{
  return -[NUTitleView initWithStyler:](self, "initWithStyler:", 0);
}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = WeakRetained;
    objc_msgSend(v3, "titleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendSubviewToBack:", v4);
    objc_msgSend(v3, "incomingTitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:", v5);

    objc_msgSend(v3, "setIncomingTitleView:", v4);
    objc_msgSend(v3, "incomingTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", 0);

    objc_msgSend(v3, "finishDisplayingTitleViewUpdate:finished:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v8;
  }

}

void __46__NUTitleView_applyTitleViewUpdate_animation___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = WeakRetained;
    objc_msgSend(v3, "titleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendSubviewToBack:", v4);
    objc_msgSend(v3, "incomingTitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:", v5);

    objc_msgSend(v3, "setIncomingTitleView:", v4);
    objc_msgSend(v3, "incomingTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", 0);

    objc_msgSend(v3, "finishDisplayingTitleViewUpdate:finished:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v8;
  }

}

- (void)relayoutWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUTitleView titleView](self, "titleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayoutWithAnimation:", v3);

}

- (void)titleViewHandleTapGesture
{
  void *v3;
  char v4;
  id v5;

  -[NUTitleView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NUTitleView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleViewDidTapOnTitleView:", self);

  }
}

void __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke(id *a1)
{
  NSObject *v2;
  double v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a1[4], "lingerSemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "lingerTimeInterval");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  dispatch_semaphore_wait(v2, v4);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke_2;
  block[3] = &unk_24D5A2108;
  v6 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__NUTitleView_finishDisplayingTitleViewUpdate_finished___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createMaskingLayerForTranslation
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTitleView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NUTitleView incomingTitleView](self, "incomingTitleView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visibleFrame");
  v27.origin.x = v14;
  v27.origin.y = v15;
  v27.size.width = v16;
  v27.size.height = v17;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v26 = CGRectUnion(v25, v27);
  objc_msgSend(v3, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

  -[NUTitleView center](self, "center");
  objc_msgSend(v3, "setPosition:");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[0] = objc_msgSend(v18, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[1] = objc_msgSend(v19, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[2] = objc_msgSend(v20, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[3] = objc_msgSend(v21, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v22);

  objc_msgSend(v3, "setLocations:", &unk_24D5BAA10);
  return v3;
}

- (NUTitleViewStyler)styler
{
  return self->_styler;
}

- (NUTitleViewDelegate)delegate
{
  return (NUTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void)setIncomingTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_incomingTitleView, a3);
}

- (NUFadeViewAnimator)fadeAnimator
{
  return self->_fadeAnimator;
}

- (OS_dispatch_semaphore)lingerSemaphore
{
  return self->_lingerSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lingerSemaphore, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
  objc_storeStrong((id *)&self->_fadeAnimator, 0);
  objc_storeStrong((id *)&self->_slideAnimator, 0);
  objc_storeStrong((id *)&self->_incomingTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styler, 0);
}

@end
