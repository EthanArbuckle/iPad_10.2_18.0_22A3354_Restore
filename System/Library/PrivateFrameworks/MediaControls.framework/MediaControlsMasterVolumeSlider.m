@implementation MediaControlsMasterVolumeSlider

- (MediaControlsMasterVolumeSlider)initWithFrame:(CGRect)a3
{
  MediaControlsMasterVolumeSlider *v3;
  MediaControlsMasterVolumeSlider *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIView *growingThumbView;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  UILongPressGestureRecognizer *longPressRecognizer;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MediaControlsMasterVolumeSlider;
  v3 = -[MPVolumeSlider initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MediaControlsMasterVolumeSlider setSyncState:](v3, "setSyncState:", 0);
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MPVolumeSlider thumbView](v4, "thumbView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v7 = objc_msgSend(v5, "initWithFrame:");
    growingThumbView = v4->_growingThumbView;
    v4->_growingThumbView = (UIView *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_growingThumbView, "setBackgroundColor:", v9);

    -[UIView setAlpha:](v4->_growingThumbView, "setAlpha:", 1.0);
    -[UIView setUserInteractionEnabled:](v4->_growingThumbView, "setUserInteractionEnabled:", 0);
    -[UIView layer](v4->_growingThumbView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 5.0);

    -[UIView layer](v4->_growingThumbView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1045220557;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    -[MediaControlsMasterVolumeSlider addSubview:](v4, "addSubview:", v4->_growingThumbView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel_handleLongPress_);
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = (UILongPressGestureRecognizer *)v13;

    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v4->_longPressRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setDelegate:](v4->_longPressRecognizer, "setDelegate:", v4);
    -[UILongPressGestureRecognizer setAllowableMovement:](v4->_longPressRecognizer, "setAllowableMovement:", 30.0);
    -[MediaControlsMasterVolumeSlider addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_longPressRecognizer);
  }
  return v4;
}

- (id)createThumbView
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsMasterVolumeSlider;
  v3 = -[MediaControlsVolumeSlider createThumbView](&v6, sel_createThumbView);
  -[MPVolumeSlider thumbView](self, "thumbView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsMasterVolumeSlider;
  -[MediaControlsMasterVolumeSlider traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[MediaControlsMasterVolumeSlider traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer setEnabled:](self->_longPressRecognizer, "setEnabled:", objc_msgSend(v4, "forceTouchCapability") == 1);

}

- (void)setSyncState:(int64_t)a3
{
  int v5;
  int64_t v6;
  MediaControlsMasterVolumeSlider *v7;
  uint64_t v8;
  id v9;

  if (self->_syncState != a3 && self->_syncingEnabled)
  {
    -[MediaControlsMasterVolumeSlider delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v9, "slider:syncStateWillChangeFromState:toState:", self, self->_syncState, a3);
    else
      v5 = 1;
    self->_syncState = a3;
    v6 = -[MediaControlsMasterVolumeSlider syncState](self, "syncState");
    if (v6 == 4)
    {
      v7 = self;
      v8 = 0;
    }
    else
    {
      if (v6 != 1)
      {
LABEL_14:

        return;
      }
      if (!v5)
      {
        -[UINotificationFeedbackGenerator notificationOccurred:](self->_negativeFeedbackGenerator, "notificationOccurred:", 2);
        -[UINotificationFeedbackGenerator prepare](self->_negativeFeedbackGenerator, "prepare");
        -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 3);
        -[MediaControlsMasterVolumeSlider shrinkThumbAfterDelay:](self, "shrinkThumbAfterDelay:", 0.15);
        goto LABEL_14;
      }
      -[UIImpactFeedbackGenerator impactOccurred](self->_positiveFeedbackGenerator, "impactOccurred");
      -[UIImpactFeedbackGenerator prepare](self->_positiveFeedbackGenerator, "prepare");
      v7 = self;
      v8 = 2;
    }
    -[MediaControlsMasterVolumeSlider setSyncState:](v7, "setSyncState:", v8);
    goto LABEL_14;
  }
}

- (void)handleLongPress:(id)a3
{
  _QWORD v4[5];

  if (-[UILongPressGestureRecognizer state](self->_longPressRecognizer, "state", a3) == 1)
  {
    -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 1);
    -[MediaControlsMasterVolumeSlider setNeedsLayout](self, "setNeedsLayout");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__MediaControlsMasterVolumeSlider_handleLongPress___block_invoke;
    v4[3] = &unk_1E5818C88;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 1, v4, 0, 0.5, 0.0, 0.7, 0.0);
  }
}

uint64_t __51__MediaControlsMasterVolumeSlider_handleLongPress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)shrinkThumbAfterDelay:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[9];

  -[MPVolumeSlider thumbView](self, "thumbView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2370]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 28.0, 0.0, 0.0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  objc_msgSend(v14, "setSpringCubicTimingParameters:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2368]), "initWithDuration:timingParameters:", v14, 1.0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__MediaControlsMasterVolumeSlider_shrinkThumbAfterDelay___block_invoke;
  v17[3] = &unk_1E581A070;
  v17[4] = self;
  v17[5] = v7;
  v17[6] = v9;
  v17[7] = v11;
  v17[8] = v13;
  objc_msgSend(v16, "addAnimations:", v17);
  objc_msgSend(v16, "startAnimationAfterDelay:", a3);
  self->_forcePercent = 0.0;
  -[MediaControlsMasterVolumeSlider setNeedsLayout](self, "setNeedsLayout");

}

void __57__MediaControlsMasterVolumeSlider_shrinkThumbAfterDelay___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id v4;

  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "frame");
  v3 = v2 * 0.5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  UIImpactFeedbackGenerator *v10;
  UIImpactFeedbackGenerator *positiveFeedbackGenerator;
  UINotificationFeedbackGenerator *v12;
  UINotificationFeedbackGenerator *negativeFeedbackGenerator;
  double v14;
  BOOL v15;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  -[MediaControlsMasterVolumeSlider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "shouldEnableSyncingForSlider:", self);
    self->_syncingEnabled = v9;
    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (self->_syncingEnabled)
  {
LABEL_5:
    -[UIImpactFeedbackGenerator prepare](self->_positiveFeedbackGenerator, "prepare");
    -[UINotificationFeedbackGenerator prepare](self->_negativeFeedbackGenerator, "prepare");
    v10 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 2);
    positiveFeedbackGenerator = self->_positiveFeedbackGenerator;
    self->_positiveFeedbackGenerator = v10;

    v12 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3A58]);
    negativeFeedbackGenerator = self->_negativeFeedbackGenerator;
    self->_negativeFeedbackGenerator = v12;

  }
LABEL_6:
  objc_msgSend(v7, "locationInView:", 0);
  *(float *)&v14 = v14;
  self->_initialX = *(float *)&v14;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsMasterVolumeSlider;
  v15 = -[MPVolumeSlider beginTrackingWithTouch:withEvent:](&v17, sel_beginTrackingWithTouch_withEvent_, v7, v6);

  return v15;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double forcePercent;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  objc_super v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  if (!self->_syncingEnabled || self->_syncState == 3)
    goto LABEL_14;
  -[MediaControlsMasterVolumeSlider setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(v6, "locationInView:", 0);
  *(float *)&v8 = v8;
  if (vabds_f32(*(float *)&v8, self->_initialX) <= 15.0)
  {
    -[MediaControlsMasterVolumeSlider traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "forceTouchCapability");

    if (v10 == 2)
    {
      objc_msgSend(v6, "force");
      v12 = v11;
      objc_msgSend(v6, "maximumPossibleForce");
      self->_forcePercent = v12 / v13;
      -[MediaControlsMasterVolumeSlider setNeedsLayout](self, "setNeedsLayout");
      forcePercent = self->_forcePercent;
      if (forcePercent >= 0.949999881 && self->_syncState != 2)
      {
        v15 = 1;
        -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 1);
        goto LABEL_10;
      }
      if (forcePercent >= 0.179999881)
      {
        v15 = self->_syncState == 2;
        goto LABEL_10;
      }
    }
  }
  else
  {
    -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 3);
    -[MediaControlsMasterVolumeSlider shrinkThumbAfterDelay:](self, "shrinkThumbAfterDelay:", 0.0);
  }
  v15 = 1;
LABEL_10:
  -[MediaControlsMasterVolumeSlider delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v16, "slider:shouldCancelSnapWithTouch:", self, v6))
  {
    -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 3);
    -[MediaControlsMasterVolumeSlider shrinkThumbAfterDelay:](self, "shrinkThumbAfterDelay:", 0.0);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__MediaControlsMasterVolumeSlider_continueTrackingWithTouch_withEvent___block_invoke;
  v20[3] = &unk_1E5818C88;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 5, v20, 0, 0.05, 0.0);

  if (!v15)
  {
    v17 = 1;
    goto LABEL_15;
  }
LABEL_14:
  v19.receiver = self;
  v19.super_class = (Class)MediaControlsMasterVolumeSlider;
  v17 = -[MPVolumeSlider continueTrackingWithTouch:withEvent:](&v19, sel_continueTrackingWithTouch_withEvent_, v6, v7);
LABEL_15:

  return v17;
}

uint64_t __71__MediaControlsMasterVolumeSlider_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  UIImpactFeedbackGenerator *positiveFeedbackGenerator;
  UINotificationFeedbackGenerator *negativeFeedbackGenerator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsMasterVolumeSlider;
  -[MPVolumeSlider endTrackingWithTouch:withEvent:](&v7, sel_endTrackingWithTouch_withEvent_, a3, a4);
  if (self->_syncingEnabled)
  {
    -[MediaControlsMasterVolumeSlider shrinkThumbAfterDelay:](self, "shrinkThumbAfterDelay:", 0.0);
    -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 4);
    positiveFeedbackGenerator = self->_positiveFeedbackGenerator;
    self->_positiveFeedbackGenerator = 0;

    negativeFeedbackGenerator = self->_negativeFeedbackGenerator;
    self->_negativeFeedbackGenerator = 0;

  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsMasterVolumeSlider;
  -[MPVolumeSlider cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[MediaControlsMasterVolumeSlider setSyncState:](self, "setSyncState:", 3);
  -[MediaControlsMasterVolumeSlider shrinkThumbAfterDelay:](self, "shrinkThumbAfterDelay:", 0.0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MediaControlsMasterVolumeSlider;
  -[MediaControlsMasterVolumeSlider layoutSubviews](&v10, sel_layoutSubviews);
  -[MediaControlsMasterVolumeSlider bringSubviewToFront:](self, "bringSubviewToFront:", self->_growingThumbView);
  -[MPVolumeSlider thumbView](self, "thumbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[MPVolumeSlider volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVolumeControlAvailable");
  v6 = 0.0;
  if (v5)
    v6 = 1.0;
  -[UIView setAlpha:](self->_growingThumbView, "setAlpha:", v6);

  objc_msgSend(v3, "frame");
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_growingThumbView, "setFrame:");
  -[UIView frame](self->_growingThumbView, "frame");
  v8 = v7 * 0.5;
  -[UIView layer](self->_growingThumbView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  BOOL v5;
  objc_super v7;
  objc_super v8;

  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4
    || (v8.receiver = self,
        v8.super_class = (Class)MediaControlsMasterVolumeSlider,
        !-[MediaControlsMasterVolumeSlider respondsToSelector:](&v8, sel_respondsToSelector_, sel_gestureRecognizerShouldBegin_)))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MediaControlsMasterVolumeSlider;
    v5 = -[MediaControlsVolumeSlider gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (BOOL)isSyncingEnabled
{
  return self->_syncingEnabled;
}

- (void)setSyncingEnabled:(BOOL)a3
{
  self->_syncingEnabled = a3;
}

- (MediaControlsMasterVolumeSliderDelegate)delegate
{
  return (MediaControlsMasterVolumeSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)syncState
{
  return self->_syncState;
}

- (UIImpactFeedbackGenerator)positiveFeedbackGenerator
{
  return self->_positiveFeedbackGenerator;
}

- (void)setPositiveFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_positiveFeedbackGenerator, a3);
}

- (UINotificationFeedbackGenerator)negativeFeedbackGenerator
{
  return self->_negativeFeedbackGenerator;
}

- (void)setNegativeFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_negativeFeedbackGenerator, a3);
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_growingThumbView, 0);
}

@end
