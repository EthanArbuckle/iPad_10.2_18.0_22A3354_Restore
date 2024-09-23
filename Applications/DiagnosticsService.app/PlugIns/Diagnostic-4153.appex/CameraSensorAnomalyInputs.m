@implementation CameraSensorAnomalyInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Front"), CFSTR("Rear"), CFSTR("RearTelephoto"), CFSTR("RearSuperWide"), CFSTR("RearSynced"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("identifier"), v5, &v8));

  -[CameraSensorAnomalyInputs setIdentifier:](self, "setIdentifier:", v6);
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v13;
  char v14;

  v14 = 0;
  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("drawColor"), 7, &v14));
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", v5, &v13));
  -[CameraSensorAnomalyInputs setDrawColor:](self, "setDrawColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyInputs drawColor](self, "drawColor"));
  if (!v7)
    v14 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("minimumSquareLength"), &off_100010C08, &off_100010C18, &v14));
  objc_msgSend(v8, "doubleValue");
  *(float *)&v9 = v9;
  -[CameraSensorAnomalyInputs setMinimumSquareLength:](self, "setMinimumSquareLength:", v9);

  -[CameraSensorAnomalyInputs setEnableMaxBrightness:](self, "setEnableMaxBrightness:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("enableMaxBrightness"), &v14));
  -[CameraSensorAnomalyInputs setFlashModeOn:](self, "setFlashModeOn:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("flashModeOn"), &v14));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("viewfinderInstruction"), 1000, &v14));
  -[CameraSensorAnomalyInputs setViewfinderInstruction:](self, "setViewfinderInstruction:", v10);

  v11 = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("disableAmbientLightAdaptation"), 0, &v14);
  -[CameraSensorAnomalyInputs setDisableAmbientLightAdaptation:](self, "setDisableAmbientLightAdaptation:", v11);
  return v14 == 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
  objc_storeStrong((id *)&self->_drawColor, a3);
}

- (float)minimumSquareLength
{
  return self->_minimumSquareLength;
}

- (void)setMinimumSquareLength:(float)a3
{
  self->_minimumSquareLength = a3;
}

- (BOOL)enableMaxBrightness
{
  return self->_enableMaxBrightness;
}

- (void)setEnableMaxBrightness:(BOOL)a3
{
  self->_enableMaxBrightness = a3;
}

- (BOOL)flashModeOn
{
  return self->_flashModeOn;
}

- (void)setFlashModeOn:(BOOL)a3
{
  self->_flashModeOn = a3;
}

- (NSString)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);
  objc_storeStrong((id *)&self->_drawColor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
