@implementation CSDashBoardScrollModifierSettings

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;

  -[CSDashBoardScrollModifierSettings setStrategy:](self, "setStrategy:", 4);
  -[CSDashBoardScrollModifierSettings setMaxScrollDistance:](self, "setMaxScrollDistance:", 320.0);
  -[CSDashBoardScrollModifierSettings setCancelScrollingIfTooMuchDrag:](self, "setCancelScrollingIfTooMuchDrag:", 1);
  -[CSDashBoardScrollModifierSettings setAccumulatedDragThresholdPercentage:](self, "setAccumulatedDragThresholdPercentage:", 15.5555556);
  -[CSDashBoardScrollModifierSettings setMaxDragFromVerticalPerFrame:](self, "setMaxDragFromVerticalPerFrame:", 8.0);
  -[CSDashBoardScrollModifierSettings setPowerOfVerticalDirectionSine2:](self, "setPowerOfVerticalDirectionSine2:", 1.5);
  -[CSDashBoardScrollModifierSettings setInertialMultiplierSigmoidBase:](self, "setInertialMultiplierSigmoidBase:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 48.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v5 = 12.0;
  -[CSDashBoardScrollModifierSettings setInertialMultiplierSigmoidRange:](self, "setInertialMultiplierSigmoidRange:", v5);
  -[CSDashBoardScrollModifierSettings setInertialMultiplierSigmoidPivot:](self, "setInertialMultiplierSigmoidPivot:", 75.0);
  -[CSDashBoardScrollModifierSettings setInertialMultiplierSigmoidAlpha:](self, "setInertialMultiplierSigmoidAlpha:", -0.04);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = 45.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = 36.0;
  -[CSDashBoardScrollModifierSettings setMinPercentageSigmoidBase:](self, "setMinPercentageSigmoidBase:", v8);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = 14.0;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v11 = 8.0;
  -[CSDashBoardScrollModifierSettings setMinPercentageSigmoidRange:](self, "setMinPercentageSigmoidRange:", v11);
  -[CSDashBoardScrollModifierSettings setMinPercentageSigmoidPivot:](self, "setMinPercentageSigmoidPivot:", 75.0);
  -[CSDashBoardScrollModifierSettings setMinPercentageSigmoidAlpha:](self, "setMinPercentageSigmoidAlpha:", 0.04);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[4];
  void *v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Strategy"), CFSTR("strategy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E8E8A048, &unk_1E8E8A030);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueValidator:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Scroll Distance"), CFSTR("maxScrollDistance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 1000.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Cancel Scrolling If Too Much Drag"), CFSTR("cancelScrollingIfTooMuchDrag"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Accumulated Drag Threshold Percentage"), CFSTR("accumulatedDragThresholdPercentage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 100.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max Drag From Veritical"), CFSTR("maxDragFromVerticalPerFrame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Power of Vertical Direction Squared"), CFSTR("powerOfVerticalDirectionSine2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inertial Multiplier Sigmoid Base"), CFSTR("inertialMultiplierSigmoidBase"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 100.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inertial Multiplier Sigmoid Range"), CFSTR("inertialMultiplierSigmoidRange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 100.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inertial Multiplier Sigmoid Pivot"), CFSTR("inertialMultiplierSigmoidPivot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 0.0, 320.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Inertial Multiplier Sigmoid Alpha"), CFSTR("inertialMultiplierSigmoidAlpha"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", -0.1, 0.1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Percentage Sigmoid Base"), CFSTR("minPercentageSigmoidBase"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 100.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Percentage Sigmoid Range"), CFSTR("minPercentageSigmoidRange"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", 0.0, 100.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Percentage Sigmoid Pivot"), CFSTR("minPercentageSigmoidPivot"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 320.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min Percentage Sigmoid Alpha"), CFSTR("minPercentageSigmoidAlpha"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", -0.1, 0.1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v54[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v53 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v52[0] = v48;
  v52[1] = v47;
  v52[2] = v46;
  v52[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v51[0] = v45;
  v51[1] = v44;
  v51[2] = v38;
  v51[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v50[0] = v34;
  v50[1] = v40;
  v50[2] = v39;
  v50[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83078];
  v49[0] = v35;
  v49[1] = v33;
  v49[2] = v22;
  v49[3] = v25;
  v49[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "moduleWithTitle:contents:", CFSTR("DashBoard Scroll Modifier Settings"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (int64_t)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(int64_t)a3
{
  self->_strategy = a3;
}

- (double)maxScrollDistance
{
  return self->_maxScrollDistance;
}

- (void)setMaxScrollDistance:(double)a3
{
  self->_maxScrollDistance = a3;
}

- (BOOL)cancelScrollingIfTooMuchDrag
{
  return self->_cancelScrollingIfTooMuchDrag;
}

- (void)setCancelScrollingIfTooMuchDrag:(BOOL)a3
{
  self->_cancelScrollingIfTooMuchDrag = a3;
}

- (double)accumulatedDragThresholdPercentage
{
  return self->_accumulatedDragThresholdPercentage;
}

- (void)setAccumulatedDragThresholdPercentage:(double)a3
{
  self->_accumulatedDragThresholdPercentage = a3;
}

- (double)maxDragFromVerticalPerFrame
{
  return self->_maxDragFromVerticalPerFrame;
}

- (void)setMaxDragFromVerticalPerFrame:(double)a3
{
  self->_maxDragFromVerticalPerFrame = a3;
}

- (double)powerOfVerticalDirectionSine2
{
  return self->_powerOfVerticalDirectionSine2;
}

- (void)setPowerOfVerticalDirectionSine2:(double)a3
{
  self->_powerOfVerticalDirectionSine2 = a3;
}

- (double)inertialMultiplierSigmoidBase
{
  return self->_inertialMultiplierSigmoidBase;
}

- (void)setInertialMultiplierSigmoidBase:(double)a3
{
  self->_inertialMultiplierSigmoidBase = a3;
}

- (double)inertialMultiplierSigmoidRange
{
  return self->_inertialMultiplierSigmoidRange;
}

- (void)setInertialMultiplierSigmoidRange:(double)a3
{
  self->_inertialMultiplierSigmoidRange = a3;
}

- (double)inertialMultiplierSigmoidPivot
{
  return self->_inertialMultiplierSigmoidPivot;
}

- (void)setInertialMultiplierSigmoidPivot:(double)a3
{
  self->_inertialMultiplierSigmoidPivot = a3;
}

- (double)inertialMultiplierSigmoidAlpha
{
  return self->_inertialMultiplierSigmoidAlpha;
}

- (void)setInertialMultiplierSigmoidAlpha:(double)a3
{
  self->_inertialMultiplierSigmoidAlpha = a3;
}

- (double)minPercentageSigmoidBase
{
  return self->_minPercentageSigmoidBase;
}

- (void)setMinPercentageSigmoidBase:(double)a3
{
  self->_minPercentageSigmoidBase = a3;
}

- (double)minPercentageSigmoidRange
{
  return self->_minPercentageSigmoidRange;
}

- (void)setMinPercentageSigmoidRange:(double)a3
{
  self->_minPercentageSigmoidRange = a3;
}

- (double)minPercentageSigmoidPivot
{
  return self->_minPercentageSigmoidPivot;
}

- (void)setMinPercentageSigmoidPivot:(double)a3
{
  self->_minPercentageSigmoidPivot = a3;
}

- (double)minPercentageSigmoidAlpha
{
  return self->_minPercentageSigmoidAlpha;
}

- (void)setMinPercentageSigmoidAlpha:(double)a3
{
  self->_minPercentageSigmoidAlpha = a3;
}

@end
