@implementation MKVariableDelayTapRecognizer

- (void)setTapDelayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->tapDelayDelegate, a3);
}

- (MKVariableDelayTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  MKVariableDelayTapRecognizer *v4;
  MKVariableDelayTapRecognizer *v5;
  MKVariableDelayTapRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKVariableDelayTapRecognizer;
  v4 = -[MKVariableDelayTapRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->originalMaximumIntervalBetweenSuccessiveTaps = -1.0;
    v6 = v4;
  }

  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  double v10;
  void *v11;
  double originalMaximumIntervalBetweenSuccessiveTaps;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!-[MKVariableDelayTapRecognizer state](self, "state"))
  {
    -[MKVariableDelayTapRecognizer tapDelayDelegate](self, "tapDelayDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      if (self->originalMaximumIntervalBetweenSuccessiveTaps <= 0.0)
      {
        -[MKVariableDelayTapRecognizer maximumIntervalBetweenSuccessiveTaps](self, "maximumIntervalBetweenSuccessiveTaps");
        self->originalMaximumIntervalBetweenSuccessiveTaps = v10;
      }
      -[MKVariableDelayTapRecognizer tapDelayDelegate](self, "tapDelayDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      originalMaximumIntervalBetweenSuccessiveTaps = self->originalMaximumIntervalBetweenSuccessiveTaps;
      objc_msgSend(v6, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "variableDelayTapRecognizer:shouldWaitForNextTapForDuration:afterTouch:", self, v13, originalMaximumIntervalBetweenSuccessiveTaps);
      -[MKVariableDelayTapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self, "setMaximumIntervalBetweenSuccessiveTaps:");

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MKVariableDelayTapRecognizer;
  -[MKVariableDelayTapRecognizer touchesEnded:withEvent:](&v14, sel_touchesEnded_withEvent_, v6, v7);

}

- (void)reset
{
  objc_super v3;

  if (self->originalMaximumIntervalBetweenSuccessiveTaps > 0.0)
  {
    -[MKVariableDelayTapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self, "setMaximumIntervalBetweenSuccessiveTaps:");
    self->originalMaximumIntervalBetweenSuccessiveTaps = -1.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MKVariableDelayTapRecognizer;
  -[MKVariableDelayTapRecognizer reset](&v3, sel_reset);
}

- (MKVariableDelayTapRecognizerDelegate)tapDelayDelegate
{
  return (MKVariableDelayTapRecognizerDelegate *)objc_loadWeakRetained((id *)&self->tapDelayDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->tapDelayDelegate);
}

@end
