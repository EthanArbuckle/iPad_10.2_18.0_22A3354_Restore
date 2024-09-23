@implementation CKActionMenuGestureRecognizerButton

+ (id)actionMenuGestureRecognizerButtonWithButton:(id)a3
{
  id v3;
  CKActionMenuGestureRecognizerButton *v4;
  void *v5;
  CKActionMenuGestureRecognizerButton *v6;

  v3 = a3;
  v4 = [CKActionMenuGestureRecognizerButton alloc];
  +[CKActionMenuGestureRecognizer actionMenuGestureRecognizer](CKActionMenuGestureRecognizer, "actionMenuGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKActionMenuGestureRecognizerButton initWithGestureRecognizer:button:](v4, "initWithGestureRecognizer:button:", v5, v3);

  return v6;
}

- (CKActionMenuGestureRecognizerButton)initWithGestureRecognizer:(id)a3 button:(id)a4
{
  id v6;
  id v7;
  CKActionMenuGestureRecognizerButton *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKActionMenuGestureRecognizerButton;
  v8 = -[CKActionMenuGestureRecognizerButton init](&v10, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "addTarget:action:", v8, sel_gestureRecognized_);
    -[CKActionMenuGestureRecognizerButton setGestureRecognizer:](v8, "setGestureRecognizer:", v6);
    objc_msgSend(v7, "addGestureRecognizer:", v6);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, sel_touchDownButton_, 1);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, sel_touchUpInsideButton_, 64);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, sel_touchUpOutsideButton_, 128);
    -[CKActionMenuGestureRecognizerButton setButton:](v8, "setButton:", v7);
  }

  return v8;
}

- (void)touchDownButton:(id)a3
{
  id v4;

  -[CKActionMenuGestureRecognizerButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionMenuGestureRecognizerButtonDidTouchDownButton:", self);

}

- (void)touchUpInsideButton:(id)a3
{
  id v4;

  -[CKActionMenuGestureRecognizerButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "actionMenuGestureRecognizerButtonShouldShowHint:", self))
    objc_msgSend(v4, "actionMenuGestureRecognizerButtonShowHint:", self);
  else
    objc_msgSend(v4, "actionMenuGestureRecognizerButtonDidTouchUpInsideButton:", self);

}

- (void)touchUpOutsideButton:(id)a3
{
  id v4;

  -[CKActionMenuGestureRecognizerButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "actionMenuGestureRecognizerButtonShouldShowHint:", self))
    objc_msgSend(v4, "actionMenuGestureRecognizerButtonShowHint:", self);

}

- (void)gestureRecognized:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CKActionMenuGestureRecognizerButton *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  -[CKActionMenuGestureRecognizerButton delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "actionMenuGestureRecognizerButtonIsShowingHint:", self))
  {
    objc_msgSend(v12, "setEnabled:", 0);
    objc_msgSend(v12, "setEnabled:", 1);
  }
  else if (objc_msgSend(v4, "actionMenuGestureRecognizerButtonShouldRecognizeGesture:", self))
  {
    v5 = objc_msgSend(v12, "state");
    if (v5 != 5)
    {
      if (v5 == 3)
      {
        -[CKActionMenuGestureRecognizerButton gestureDidBeginDate](self, "gestureDidBeginDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6
          && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "timeIntervalSinceDate:", v6),
              v11 = v10,
              v9,
              v11 > 0.25)
          || !objc_msgSend(v4, "actionMenuGestureRecognizerButtonShouldShowHint:", self))
        {
          objc_msgSend(v4, "actionMenuGestureRecognizerButtonGestureDidEnd:", self);
        }
        else
        {
          objc_msgSend(v4, "actionMenuGestureRecognizerButtonShowHint:", self);
        }
        v7 = self;
        v8 = 0;
      }
      else
      {
        if (v5 != 1)
          goto LABEL_18;
        objc_msgSend(v4, "actionMenuGestureRecognizerButtonGestureDidBegin:", self);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = self;
        v8 = v6;
      }
      -[CKActionMenuGestureRecognizerButton setGestureDidBeginDate:](v7, "setGestureDidBeginDate:", v8);

      goto LABEL_18;
    }
    if (objc_msgSend(v4, "actionMenuGestureRecognizerButtonShouldShowHint:", self))
      objc_msgSend(v4, "actionMenuGestureRecognizerButtonShowHint:", self);
    -[CKActionMenuGestureRecognizerButton setGestureDidBeginDate:](self, "setGestureDidBeginDate:", 0);
  }
LABEL_18:

}

- (CKActionMenuGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (CKActionMenuGestureRecognizerButtonDelegate)delegate
{
  return (CKActionMenuGestureRecognizerButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)gestureDidBeginDate
{
  return self->_gestureDidBeginDate;
}

- (void)setGestureDidBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_gestureDidBeginDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureDidBeginDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
