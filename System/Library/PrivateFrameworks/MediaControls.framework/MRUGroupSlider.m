@implementation MRUGroupSlider

- (MRUGroupSlider)initWithFrame:(CGRect)a3
{
  MRUGroupSlider *v3;
  void *v4;
  MRULongPressGestureRecognizer *v5;
  uint64_t v6;
  MRULongPressGestureRecognizer *longPressGestureRecognizer;
  MRULongPressGestureRecognizer *v8;
  MRULongPressGestureRecognizer *longPressFeedbackGestureRecognizer;
  uint64_t v10;
  UIImpactFeedbackGenerator *feedbackGenerator;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRUGroupSlider;
  v3 = -[MRUGroupSlider initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __32__MRUGroupSlider_initWithFrame___block_invoke;
    v16 = &unk_1E5818B88;
    objc_copyWeak(&v17, &location);
    v4 = _Block_copy(&v13);
    v5 = [MRULongPressGestureRecognizer alloc];
    v6 = -[MRULongPressGestureRecognizer initWithTarget:action:](v5, "initWithTarget:action:", v3, sel_sliderLongPress_, v13, v14, v15, v16);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (MRULongPressGestureRecognizer *)v6;

    -[MRULongPressGestureRecognizer setMinimumPressDuration:](v3->_longPressGestureRecognizer, "setMinimumPressDuration:", 1.5);
    -[MRULongPressGestureRecognizer setDelegate:](v3->_longPressGestureRecognizer, "setDelegate:", v3);
    -[MRULongPressGestureRecognizer addCancellationHandler:](v3->_longPressGestureRecognizer, "addCancellationHandler:", v4);
    -[MRUGroupSlider addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressGestureRecognizer);
    v8 = -[MRULongPressGestureRecognizer initWithTarget:action:]([MRULongPressGestureRecognizer alloc], "initWithTarget:action:", v3, sel_sliderLongPressFeedback_);
    longPressFeedbackGestureRecognizer = v3->_longPressFeedbackGestureRecognizer;
    v3->_longPressFeedbackGestureRecognizer = v8;

    -[MRULongPressGestureRecognizer setMinimumPressDuration:](v3->_longPressFeedbackGestureRecognizer, "setMinimumPressDuration:", 0.75);
    -[MRULongPressGestureRecognizer setDelegate:](v3->_longPressFeedbackGestureRecognizer, "setDelegate:", v3);
    -[MRULongPressGestureRecognizer setCancelsTouchesInView:](v3->_longPressFeedbackGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[MRULongPressGestureRecognizer addCancellationHandler:](v3->_longPressFeedbackGestureRecognizer, "addCancellationHandler:", v4);
    -[MRUGroupSlider addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressFeedbackGestureRecognizer);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UIImpactFeedbackGenerator *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__MRUGroupSlider_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleLongPressCancelled");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  MRULongPressGestureRecognizer *v4;
  id WeakRetained;
  char v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = (MRULongPressGestureRecognizer *)a3;
  if (-[MRUGroupSlider isTracking](self, "isTracking"))
  {
    self->_longPressEnabled = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_longPressEnabled = objc_msgSend(v7, "sliderShouldAllowLongPress:", self);

    }
    v8 = self->_longPressEnabled
      && (self->_longPressGestureRecognizer == v4 || self->_longPressFeedbackGestureRecognizer == v4);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRUGroupSlider;
    v8 = -[MRUGroupSlider gestureRecognizerShouldBegin:](&v10, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[MRUGroupSlider isEnabled](self, "isEnabled"))
    -[UIImpactFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
  v10.receiver = self;
  v10.super_class = (Class)MRUGroupSlider;
  v8 = -[MRUGroupSlider beginTrackingWithTouch:withEvent:](&v10, sel_beginTrackingWithTouch_withEvent_, v6, v7);

  return v8;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUGroupSlider;
  -[MRUGroupSlider endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  if (self->_longPressFeedbackEnabled)
    -[MRUGroupSlider handleLongPressCancelled](self, "handleLongPressCancelled");
}

- (void)sliderLongPress:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  if (self->_longPressEnabled)
  {
    v9 = v4;
    v5 = objc_msgSend(v4, "state") == 1;
    v4 = v9;
    if (v5)
    {
      -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
      self->_longPressFeedbackEnabled = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      v4 = v9;
      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "sliderLongPressActionDidFinish:", self);

        v4 = v9;
      }
    }
  }

}

- (void)sliderLongPressFeedback:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  if (self->_longPressEnabled)
  {
    v9 = v4;
    v5 = objc_msgSend(v4, "state") == 1;
    v4 = v9;
    if (v5)
    {
      self->_longPressFeedbackEnabled = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      v4 = v9;
      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "sliderLongPressActionDidBegin:", self);

        v4 = v9;
      }
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleLongPressCancelled
{
  MRUGroupSliderDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  self->_longPressFeedbackEnabled = 0;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "sliderLongPressActionDidCancel:", self);

  }
}

- (MRUGroupSliderDelegate)delegate
{
  return (MRUGroupSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRULongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (MRULongPressGestureRecognizer)longPressFeedbackGestureRecognizer
{
  return self->_longPressFeedbackGestureRecognizer;
}

- (void)setLongPressFeedbackGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressFeedbackGestureRecognizer, a3);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)longPressFeedbackEnabled
{
  return self->_longPressFeedbackEnabled;
}

- (void)setLongPressFeedbackEnabled:(BOOL)a3
{
  self->_longPressFeedbackEnabled = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_longPressFeedbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
