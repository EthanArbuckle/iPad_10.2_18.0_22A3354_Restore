@implementation CKBalloonSwipeController

- (id)initForCell:(id)a3 swipeCompletionHandler:(id)a4 swipeChangedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKBalloonSwipeController *v11;
  CKBalloonSwipeController *v12;
  void *v13;
  id onSwipeCompletion;
  void *v15;
  id onSwipeChanged;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKBalloonSwipeController;
  v11 = -[CKBalloonSwipeController init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cell, v8);
    v13 = _Block_copy(v9);
    onSwipeCompletion = v12->_onSwipeCompletion;
    v12->_onSwipeCompletion = v13;

    v15 = _Block_copy(v10);
    onSwipeChanged = v12->_onSwipeChanged;
    v12->_onSwipeChanged = v15;

    v12->_needsReplyIndicatorRepositioning = 1;
  }

  return v12;
}

- (CKSwipeActionIndicator)replyIndicator
{
  void *v3;
  CKSwipeActionIndicator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKSwipeActionIndicator *replyIndicator;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double MidY;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGRect v24;
  CGRect v25;

  if (!self->_replyIndicator)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrowshape.turn.up.backward.fill"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CKSwipeActionIndicator initWithImage:]([CKSwipeActionIndicator alloc], "initWithImage:", v3);
    -[CKSwipeActionIndicator setAlpha:](v4, "setAlpha:", 0.0);
    -[CKBalloonSwipeController cell](self, "cell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    -[CKBalloonSwipeController cell](self, "cell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendSubviewToBack:", v4);

    replyIndicator = self->_replyIndicator;
    self->_replyIndicator = v4;

  }
  if (self->_needsReplyIndicatorRepositioning)
  {
    -[CKBalloonSwipeController balloonView](self, "balloonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    -[CKBalloonSwipeController setInitialBalloonX:](self, "setInitialBalloonX:", CGRectGetMinX(v24));

    -[CKBalloonSwipeController initialIndicatorX](self, "initialIndicatorX");
    v12 = v11;
    -[CKBalloonSwipeController balloonView](self, "balloonView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    MidY = CGRectGetMidY(v25);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endingReplyIndicatorSize");
    v17 = MidY + v16 * -0.5;

    -[CKSwipeActionIndicator setTransformForScale:horizontalTranslation:](self->_replyIndicator, "setTransformForScale:horizontalTranslation:", 1.0, 0.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endingReplyIndicatorSize");
    v20 = v19;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endingReplyIndicatorSize");
    -[CKSwipeActionIndicator setFrame:](self->_replyIndicator, "setFrame:", v12, v17, v20, v22);

    self->_needsReplyIndicatorRepositioning = 0;
  }
  return self->_replyIndicator;
}

- (double)initialIndicatorX
{
  void *v3;
  int v4;
  double result;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[CKBalloonSwipeController cell](self, "cell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  if (v4)
  {
    -[CKBalloonSwipeController initialBalloonX](self, "initialBalloonX");
  }
  else
  {
    -[CKBalloonSwipeController cell](self, "cell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedItemOffset");
    v8 = v7;

    -[CKBalloonSwipeController initialBalloonX](self, "initialBalloonX");
    v10 = v9;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "balloonMaskTailWidth");
    v13 = v10 + v12 - v8;

    return v13;
  }
  return result;
}

- (void)swipeToReplyGestureHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  -[CKBalloonSwipeController cell](self, "cell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v4, "state");
    if ((unint64_t)(v6 - 3) < 3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKBalloonSwipeController detected end swipe.", v11, 2u);
        }

      }
      -[CKBalloonSwipeController cell](self, "cell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonSwipeController _gestureFinished:forCell:](self, "_gestureFinished:forCell:", v4, v8);
      goto LABEL_20;
    }
    if (v6 == 2)
    {
      -[CKBalloonSwipeController cell](self, "cell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonSwipeController _gestureChanged:forCell:](self, "_gestureChanged:forCell:", v4, v8);
LABEL_20:

      goto LABEL_21;
    }
    if (v6 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKBalloonSwipeController detected begin swipe.", v12, 2u);
        }

      }
      -[CKBalloonSwipeController cell](self, "cell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonSwipeController _gestureBegan:forCell:](self, "_gestureBegan:forCell:", v4, v8);
      goto LABEL_20;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKBalloonSwipeController's cell was deallocated. Gesture is now a no-op.", buf, 2u);
    }

  }
LABEL_21:

}

- (void)_gestureBegan:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23[2];
  id location;

  v6 = a3;
  v7 = a4;
  -[CKBalloonSwipeController setIsGestureCommittedToAction:](self, "setIsGestureCommittedToAction:", 0);
  -[CKBalloonSwipeController replyIndicator](self, "replyIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  -[CKBalloonSwipeController replyIndicator](self, "replyIndicator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "initialReplyIndicatorScale");
  v12 = v11;
  -[CKBalloonSwipeController replyIndicator](self, "replyIndicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentHorizontalTranslation");
  objc_msgSend(v9, "setTransformForScale:horizontalTranslation:", v12, v14);

  -[CKBalloonSwipeController _resetPropertyAnimatorsIfNeeded](self, "_resetPropertyAnimatorsIfNeeded");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "balloonResetAnimationDuration");
  v17 = v16;

  -[CKBalloonSwipeController initialBalloonX](self, "initialBalloonX");
  v19 = v18;
  location = 0;
  objc_initWeak(&location, self);
  v20 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__CKBalloonSwipeController__gestureBegan_forCell___block_invoke;
  v22[3] = &unk_1E2750A18;
  objc_copyWeak(v23, &location);
  v23[1] = v19;
  v21 = (void *)objc_msgSend(v20, "initWithDuration:curve:animations:", 2, v22, v17);
  -[CKBalloonSwipeController setBalloonResetAnimator:](self, "setBalloonResetAnimator:", v21);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

void __50__CKBalloonSwipeController__gestureBegan_forCell___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "replyIndicator");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(double *)(a1 + 40);
  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "balloonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v12, v7, v9, v11);

  objc_msgSend(v19, "setAlpha:", 0.0);
  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "setOffsetDelta:", 0.0);

  v16 = objc_loadWeakRetained(v2);
  objc_msgSend(v16, "_swipeValueChanged:", 0.0);

  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "balloonView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

}

- (void)_gestureChanged:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "velocityInView:", v8);
  v10 = v9;

  objc_msgSend(v6, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "translationInView:", v11);
  v13 = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "swipeToReplyShowIndicatorThreshold");
  v16 = v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "swipeToReplyConfirmThreshold");
  v19 = v18;

  if (v13 >= v19)
    v13 = v19 * (log10(v13 / v19) * 0.7 + 1.0);
  v20 = 0.0;
  if (v13 < 0.0)
    v13 = 0.0;
  -[CKBalloonSwipeController setOffsetDelta:](self, "setOffsetDelta:", v13);
  -[CKBalloonSwipeController _swipeValueChanged:](self, "_swipeValueChanged:", v13);
  if (!-[CKBalloonSwipeController isGestureCommittedToAction](self, "isGestureCommittedToAction"))
  {
    v21 = fmax(v13 - v16, 0.0) / (v19 - v16);
    v22 = fmin(fmax(v21, 0.0), 1.0);
    -[CKBalloonSwipeController cell](self, "cell");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "orientation");

    if (v24 == 2)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "replyToSelfButtonOffset");
      v20 = 0.0 - v26;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "initialReplyIndicatorScale");
    v29 = v28;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finalReplyIndicatorScale");
    v32 = v29 + (v31 - v29) * v22;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "initialReplyIndicatorBlurRadius");
    v35 = v34 + (0.0 - v34) * v22;

    -[CKSwipeActionIndicator setTransformForScale:horizontalTranslation:](self->_replyIndicator, "setTransformForScale:horizontalTranslation:", v32, v20 * v22 + 0.0);
    -[CKSwipeActionIndicator setBlurRadius:](self->_replyIndicator, "setBlurRadius:", v35);
    -[CKBalloonSwipeController replyIndicator](self, "replyIndicator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v21 == 0.0)
      v38 = 0.0;
    else
      v38 = v22;
    objc_msgSend(v36, "setAlpha:", v38);

  }
  if (v13 <= v19
    || v10 <= 0.0
    || -[CKBalloonSwipeController isGestureCommittedToAction](self, "isGestureCommittedToAction"))
  {
    if (-[CKBalloonSwipeController isGestureCommittedToAction](self, "isGestureCommittedToAction")
      && v13 < v19
      && v10 < 0.0)
    {
      -[CKBalloonSwipeController _playHaptic](self, "_playHaptic");
      -[CKBalloonSwipeController setIsGestureCommittedToAction:](self, "setIsGestureCommittedToAction:", 0);
    }
  }
  else
  {
    -[CKBalloonSwipeController setIsGestureCommittedToAction:](self, "setIsGestureCommittedToAction:", 1);
    -[CKBalloonSwipeController _doPulseAnimationWithHaptic:](self, "_doPulseAnimationWithHaptic:", 1);
  }
}

- (void)_gestureFinished:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  UIViewPropertyAnimator *balloonResetAnimator;
  uint8_t v20[8];
  _QWORD v21[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocityInView:", v8);
  v10 = v9;
  v12 = v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replyIndicatorResetAnimationDuration");
  v15 = v14;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__CKBalloonSwipeController__gestureFinished_forCell___block_invoke;
  v21[3] = &unk_1E274A208;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v21, 0, v15, 0.0);
  LODWORD(v13) = -[CKBalloonSwipeController isGestureCommittedToAction](self, "isGestureCommittedToAction");
  v16 = IMOSLoggingEnabled();
  if ((_DWORD)v13)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKBalloonSwipeController detected full swipe on release and will show reply overlay.", v20, 2u);
      }

    }
    -[CKBalloonSwipeController _beginReplyWithSwipeVelocity:](self, "_beginReplyWithSwipeVelocity:", v10, v12);
  }
  else if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "CKBalloonSwipeController did not detect full swipe on release. No further action taken.", v20, 2u);
    }

  }
  balloonResetAnimator = self->_balloonResetAnimator;
  if (balloonResetAnimator)
    -[UIViewPropertyAnimator startAnimation](balloonResetAnimator, "startAnimation");
  -[CKBalloonSwipeController setIsGestureCommittedToAction:](self, "setIsGestureCommittedToAction:", 0);

}

void __53__CKBalloonSwipeController__gestureFinished_forCell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialReplyIndicatorScale");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentHorizontalTranslation");
  objc_msgSend(v2, "setTransformForScale:horizontalTranslation:", v5, v7);

  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

}

- (void)_doPulseAnimationWithHaptic:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CEABB0];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replyIndicatorPulseAnimationDuration");
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke;
  v13[3] = &unk_1E274A208;
  v13[4] = self;
  objc_msgSend(v5, "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v13, 0);

  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replyIndicatorPulseAnimationDuration");
    v10 = v9 * 0.25;

    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_4;
    v12[3] = &unk_1E274A208;
    v12[4] = self;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
  }
}

uint64_t __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.25);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_3;
  v4[3] = &unk_1E274A208;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.25, 0.75);
}

void __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxPulseReplyIndicatorScale");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentHorizontalTranslation");
  objc_msgSend(v7, "setTransformForScale:horizontalTranslation:", v4, v6);

}

void __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalReplyIndicatorScale");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "replyIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentHorizontalTranslation");
  objc_msgSend(v7, "setTransformForScale:horizontalTranslation:", v4, v6);

}

uint64_t __56__CKBalloonSwipeController__doPulseAnimationWithHaptic___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playHaptic");
}

- (void)prepareForReuse
{
  -[CKBalloonSwipeController setIsGestureCommittedToAction:](self, "setIsGestureCommittedToAction:", 0);
  -[CKBalloonSwipeController _resetPropertyAnimatorsIfNeeded](self, "_resetPropertyAnimatorsIfNeeded");
  -[CKSwipeActionIndicator setTransformForScale:horizontalTranslation:](self->_replyIndicator, "setTransformForScale:horizontalTranslation:", 1.0, 0.0);
  -[CKBalloonSwipeController setNeedsReplyIndicatorRepositioning:](self, "setNeedsReplyIndicatorRepositioning:", 1);
}

- (void)_resetPropertyAnimatorsIfNeeded
{
  UIViewPropertyAnimator *balloonResetAnimator;
  UIViewPropertyAnimator *v4;

  balloonResetAnimator = self->_balloonResetAnimator;
  if (balloonResetAnimator)
  {
    -[UIViewPropertyAnimator stopAnimation:](balloonResetAnimator, "stopAnimation:", 1);
    v4 = self->_balloonResetAnimator;
    self->_balloonResetAnimator = 0;

  }
}

- (void)_beginReplyWithSwipeVelocity:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(double, double, double);

  y = a3.y;
  x = a3.x;
  -[CKBalloonSwipeController onSwipeCompletion](self, "onSwipeCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKBalloonSwipeController onSwipeCompletion](self, "onSwipeCompletion");
    v15 = (void (**)(double, double, double))objc_claimAutoreleasedReturnValue();
    v15[2](self->_offsetDelta, x, y);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKBalloonSwipeController _beginReplyWithSwipeVelocity:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_swipeValueChanged:(double)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(double);

  -[CKBalloonSwipeController onSwipeChanged](self, "onSwipeChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKBalloonSwipeController onSwipeChanged](self, "onSwipeChanged");
    v14 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v14[2](a3);

  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKBalloonSwipeController _swipeValueChanged:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)_playHaptic
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 3);
  objc_msgSend(v2, "impactOccurred");

}

- (double)offsetDelta
{
  return self->_offsetDelta;
}

- (void)setOffsetDelta:(double)a3
{
  self->_offsetDelta = a3;
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (CKTranscriptBalloonCell)cell
{
  return (CKTranscriptBalloonCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (UIViewPropertyAnimator)balloonResetAnimator
{
  return self->_balloonResetAnimator;
}

- (void)setBalloonResetAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_balloonResetAnimator, a3);
}

- (void)setReplyIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_replyIndicator, a3);
}

- (double)initialBalloonX
{
  return self->_initialBalloonX;
}

- (void)setInitialBalloonX:(double)a3
{
  self->_initialBalloonX = a3;
}

- (BOOL)isGestureCommittedToAction
{
  return self->_isGestureCommittedToAction;
}

- (void)setIsGestureCommittedToAction:(BOOL)a3
{
  self->_isGestureCommittedToAction = a3;
}

- (BOOL)needsReplyIndicatorRepositioning
{
  return self->_needsReplyIndicatorRepositioning;
}

- (void)setNeedsReplyIndicatorRepositioning:(BOOL)a3
{
  self->_needsReplyIndicatorRepositioning = a3;
}

- (id)onSwipeCompletion
{
  return self->_onSwipeCompletion;
}

- (void)setOnSwipeCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)onSwipeChanged
{
  return self->_onSwipeChanged;
}

- (void)setOnSwipeChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onSwipeChanged, 0);
  objc_storeStrong(&self->_onSwipeCompletion, 0);
  objc_storeStrong((id *)&self->_replyIndicator, 0);
  objc_storeStrong((id *)&self->_balloonResetAnimator, 0);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_balloonView, 0);
}

- (void)_beginReplyWithSwipeVelocity:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "CKBalloonSwipeController's onSwipeCompletion was not set.", a5, a6, a7, a8, 0);
}

- (void)_swipeValueChanged:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "CKBalloonSwipeController's onSwipeChanged was not set.", a5, a6, a7, a8, 0);
}

@end
