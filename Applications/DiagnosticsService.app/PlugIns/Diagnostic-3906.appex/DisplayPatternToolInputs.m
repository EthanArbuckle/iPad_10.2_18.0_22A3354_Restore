@implementation DisplayPatternToolInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  objc_super v13;
  char v14;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DisplayPatternToolInputs;
  v14 = !-[DisplayViewInputs validateAndInitializeParameters:](&v13, "validateAndInitializeParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("drawColor"), 7, &v14));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v5, &v12));
  v7 = v12;
  -[DisplayPatternToolInputs setDrawColor:](self, "setDrawColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPatternToolInputs drawColor](self, "drawColor"));
  if (!v8)
    v14 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("minimumSquareLength"), &off_10000C798, &off_10000C7A8, &v14));
  objc_msgSend(v9, "doubleValue");
  -[DisplayPatternToolInputs setMinimumSquareLength:](self, "setMinimumSquareLength:");

  -[DisplayPatternToolInputs setRandomizeImageOrder:](self, "setRandomizeImageOrder:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("randomizeImageOrder"), &v14));
  -[DisplayPatternToolInputs setBrightnessAdjustable:](self, "setBrightnessAdjustable:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("brightnessAdjustable"), 0, &v14));
  -[DisplayPatternToolInputs setResetBrightnessOnChange:](self, "setResetBrightnessOnChange:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("resetBrightnessOnChange"), 0, &v14));
  -[DisplayPatternToolInputs setDisableAmbientLightAdaptation:](self, "setDisableAmbientLightAdaptation:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("disableAmbientLightAdaptation"), 0, &v14));
  v10 = v14 == 0;

  return v10;
}

- (double)minimumSquareLength
{
  return self->_minimumSquareLength;
}

- (void)setMinimumSquareLength:(double)a3
{
  self->_minimumSquareLength = a3;
}

- (BOOL)randomizeImageOrder
{
  return self->_randomizeImageOrder;
}

- (void)setRandomizeImageOrder:(BOOL)a3
{
  self->_randomizeImageOrder = a3;
}

- (BOOL)brightnessAdjustable
{
  return self->_brightnessAdjustable;
}

- (void)setBrightnessAdjustable:(BOOL)a3
{
  self->_brightnessAdjustable = a3;
}

- (BOOL)resetBrightnessOnChange
{
  return self->_resetBrightnessOnChange;
}

- (void)setResetBrightnessOnChange:(BOOL)a3
{
  self->_resetBrightnessOnChange = a3;
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
  objc_storeStrong((id *)&self->_drawColor, a3);
}

- (BOOL)disableAmbientLightAdaptation
{
  return self->_disableAmbientLightAdaptation;
}

- (void)setDisableAmbientLightAdaptation:(BOOL)a3
{
  self->_disableAmbientLightAdaptation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawColor, 0);
}

@end
