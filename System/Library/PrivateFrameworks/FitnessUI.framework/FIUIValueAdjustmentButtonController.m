@implementation FIUIValueAdjustmentButtonController

- (void)setIncrementButton:(id)a3 decrementButton:(id)a4
{
  UIButton **p_incrementButton;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  p_incrementButton = &self->_incrementButton;
  v7 = a4;
  objc_storeWeak((id *)p_incrementButton, a3);
  objc_storeWeak((id *)&self->_decrementButton, v7);

  WeakRetained = objc_loadWeakRetained((id *)p_incrementButton);
  objc_msgSend(WeakRetained, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchDown_, 1);

  v9 = objc_loadWeakRetained((id *)&self->_decrementButton);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchDown_, 1);

  v10 = objc_loadWeakRetained((id *)p_incrementButton);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchUpInside_, 64);

  v11 = objc_loadWeakRetained((id *)&self->_decrementButton);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchUpInside_, 64);

  v12 = objc_loadWeakRetained((id *)p_incrementButton);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchCancel_, 448);

  v13 = objc_loadWeakRetained((id *)&self->_decrementButton);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__plusMinusButtonTouchCancel_, 448);

}

- (void)_plusMinusButtonTouchDown:(id)a3
{
  NSTimer *plusMinusActionTimer;
  NSTimer *v5;
  NSTimer *v6;
  NSTimer *v7;
  id v8;

  v8 = a3;
  -[FIUIValueAdjustmentButtonController _updateButton:forPressedState:](self, "_updateButton:forPressedState:");
  plusMinusActionTimer = self->_plusMinusActionTimer;
  if (plusMinusActionTimer)
  {
    -[NSTimer invalidate](plusMinusActionTimer, "invalidate");
    v5 = self->_plusMinusActionTimer;
    self->_plusMinusActionTimer = 0;

  }
  self->_plusMinusActionRepeatCount = 0;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__plusMinusActionTimerDidFire_, v8, 1, 0.25);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_plusMinusActionTimer;
  self->_plusMinusActionTimer = v6;

}

- (void)_plusMinusButtonTouchUpInside:(id)a3
{
  id v4;

  if (!self->_plusMinusActionRepeatCount)
  {
    v4 = a3;
    -[FIUIValueAdjustmentButtonController _performPlusMinusActionWithButton:](self, "_performPlusMinusActionWithButton:", v4);
    -[FIUIValueAdjustmentButtonController _updateButton:forPressedState:](self, "_updateButton:forPressedState:", v4, 0);

  }
}

- (void)_plusMinusButtonTouchCancel:(id)a3
{
  NSTimer *plusMinusActionTimer;

  -[FIUIValueAdjustmentButtonController _updateButton:forPressedState:](self, "_updateButton:forPressedState:", a3, 0);
  -[NSTimer invalidate](self->_plusMinusActionTimer, "invalidate");
  plusMinusActionTimer = self->_plusMinusActionTimer;
  self->_plusMinusActionTimer = 0;

}

- (void)_plusMinusActionTimerDidFire:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIValueAdjustmentButtonController _performPlusMinusActionWithButton:](self, "_performPlusMinusActionWithButton:", v4);

}

- (void)_performPlusMinusActionWithButton:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  -[FIUIValueAdjustmentButtonController lapLengthIndexTranslator](self, "lapLengthIndexTranslator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FIUIValueAdjustmentButtonController _performPlusMinusActionWithIndexTranslationForButton:](self, "_performPlusMinusActionWithIndexTranslationForButton:", v14);
    goto LABEL_12;
  }
  -[FIUIValueAdjustmentButtonController value](self, "value");
  v6 = v5;
  -[FIUIValueAdjustmentButtonController valueStepIncremement](self, "valueStepIncremement");
  v8 = v7;
  v9 = round(v6 / v7 * 1000.0) / 1000.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_decrementButton);

  if (WeakRetained == v14)
  {
    v11 = floor(v9);
    v12 = v9 - v11;
    if (v9 - v11 >= 2.22044605e-16)
      goto LABEL_9;
    v13 = -1.0;
  }
  else
  {
    v11 = ceil(v9);
    v12 = v11 - v9;
    if (v11 - v9 >= 2.22044605e-16)
      goto LABEL_9;
    v13 = 1.0;
  }
  v11 = v9 + v13;
LABEL_9:
  -[FIUIValueAdjustmentButtonController setValue:](self, "setValue:", v8 * v11, v12);
  self->_didUserUpdatevalue = 1;
  if (objc_msgSend(v14, "isEnabled"))
    -[FIUIValueAdjustmentButtonController _incrementRepeatCount](self, "_incrementRepeatCount");
  else
    -[FIUIValueAdjustmentButtonController _plusMinusButtonTouchCancel:](self, "_plusMinusButtonTouchCancel:", v14);
LABEL_12:

}

- (void)_performPlusMinusActionWithIndexTranslationForButton:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[FIUIValueAdjustmentButtonController value](self, "value");
  v5 = v4;
  -[FIUIValueAdjustmentButtonController lapLengthIndexTranslator](self, "lapLengthIndexTranslator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForValue:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_decrementButton);
  if (WeakRetained == v11)
    v9 = v7 - 1;
  else
    v9 = v7 + 1;
  -[FIUIValueAdjustmentButtonController lapLengthIndexTranslator](self, "lapLengthIndexTranslator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForIndex:", v9);
  -[FIUIValueAdjustmentButtonController setValue:](self, "setValue:");

  self->_didUserUpdatevalue = 1;
  if (objc_msgSend(v11, "isEnabled"))
    -[FIUIValueAdjustmentButtonController _incrementRepeatCount](self, "_incrementRepeatCount");
  else
    -[FIUIValueAdjustmentButtonController _plusMinusButtonTouchCancel:](self, "_plusMinusButtonTouchCancel:", v11);

}

- (void)_incrementRepeatCount
{
  int64_t plusMinusActionRepeatCount;
  NSTimer *plusMinusActionTimer;
  double v4;
  id v5;

  plusMinusActionTimer = self->_plusMinusActionTimer;
  plusMinusActionRepeatCount = self->_plusMinusActionRepeatCount;
  v4 = dbl_21310DBA0[plusMinusActionRepeatCount > 18];
  self->_plusMinusActionRepeatCount = plusMinusActionRepeatCount + 1;
  if (plusMinusActionRepeatCount <= 3)
    v4 = 0.25;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSTimer setFireDate:](plusMinusActionTimer, "setFireDate:", v5);

}

- (void)setValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[FIUIValueAdjustmentButtonController minValue](self, "minValue");
  if (v5 > a3)
  {
    -[FIUIValueAdjustmentButtonController minValue](self, "minValue");
    a3 = v6;
  }
  -[FIUIValueAdjustmentButtonController maxValue](self, "maxValue");
  if (a3 > v7)
  {
    -[FIUIValueAdjustmentButtonController maxValue](self, "maxValue");
    a3 = v8;
  }
  -[FIUIValueAdjustmentButtonController minumumStepValueIncrement](self, "minumumStepValueIncrement");
  if (v9 > 0.0)
    a3 = v9 * round(a3 / v9);
  self->_value = a3;
  -[FIUIValueAdjustmentButtonController _notifyValueChanged](self, "_notifyValueChanged");
  -[FIUIValueAdjustmentButtonController _updatePlusMinusButtonStates](self, "_updatePlusMinusButtonStates");
}

- (void)_notifyValueChanged
{
  void *v3;
  void (**v4)(void);

  -[FIUIValueAdjustmentButtonController valueUpdateHandler](self, "valueUpdateHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FIUIValueAdjustmentButtonController valueUpdateHandler](self, "valueUpdateHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_updatePlusMinusButtonStates
{
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  id v12;

  -[FIUIValueAdjustmentButtonController value](self, "value");
  v4 = v3;
  -[FIUIValueAdjustmentButtonController minValue](self, "minValue");
  v6 = v4 - v5 > 2.22044605e-16;
  -[FIUIValueAdjustmentButtonController decrementButton](self, "decrementButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

  -[FIUIValueAdjustmentButtonController valueStepIncremement](self, "valueStepIncremement");
  v9 = v4 + v8;
  -[FIUIValueAdjustmentButtonController maxValue](self, "maxValue");
  v11 = v9 <= v10;
  -[FIUIValueAdjustmentButtonController incrementButton](self, "incrementButton");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v11);

}

- (void)_updateButton:(id)a3 forPressedState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v4 = a4;
  v8 = a3;
  self->_didUserUpdatevalue = 1;
  -[FIUIValueAdjustmentButtonController buttonStateUpdateHandler](self, "buttonStateUpdateHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FIUIValueAdjustmentButtonController buttonStateUpdateHandler](self, "buttonStateUpdateHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8))v7)[2](v7, v8, v4);

  }
}

- (double)value
{
  return self->_value;
}

- (double)valueStepIncremement
{
  return self->_valueStepIncremement;
}

- (void)setValueStepIncremement:(double)a3
{
  self->_valueStepIncremement = a3;
}

- (double)minumumStepValueIncrement
{
  return self->_minumumStepValueIncrement;
}

- (void)setMinumumStepValueIncrement:(double)a3
{
  self->_minumumStepValueIncrement = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (id)valueUpdateHandler
{
  return self->_valueUpdateHandler;
}

- (void)setValueUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (FIUIWorkoutLapLengthIndexTranslator)lapLengthIndexTranslator
{
  return self->_lapLengthIndexTranslator;
}

- (void)setLapLengthIndexTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_lapLengthIndexTranslator, a3);
}

- (id)buttonStateUpdateHandler
{
  return self->_buttonStateUpdateHandler;
}

- (void)setButtonStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)didUserUpdatevalue
{
  return self->_didUserUpdatevalue;
}

- (void)setDidUserUpdatevalue:(BOOL)a3
{
  self->_didUserUpdatevalue = a3;
}

- (UIButton)incrementButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_incrementButton);
}

- (UIButton)decrementButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_decrementButton);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_decrementButton);
  objc_destroyWeak((id *)&self->_incrementButton);
  objc_storeStrong(&self->_buttonStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_lapLengthIndexTranslator, 0);
  objc_storeStrong(&self->_valueUpdateHandler, 0);
  objc_storeStrong((id *)&self->_plusMinusActionTimer, 0);
}

@end
