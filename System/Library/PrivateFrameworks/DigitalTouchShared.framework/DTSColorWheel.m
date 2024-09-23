@implementation DTSColorWheel

- (void)beganTouches:(id)a3
{
  id v4;

  objc_msgSend(a3, "anyObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", self);
  -[DTSColorWheel updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:");

}

- (void)finishedTouches
{
  id v2;

  -[DTSColorWheel pickerCircle](self, "pickerCircle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  RoundViewOriginToViewScale(v2);

}

- (void)createDoneButtonWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("COLOR_PICKER_DONE_TEXT"), &stru_24F6E7BA8, CFSTR("DigitalTouchShared-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitle:forState:", v5, 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleColor:forState:", v6, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_doneButtonTapped_, 64);
  -[DTSColorWheel addSubview:](self, "addSubview:", v7);
  -[DTSColorWheel setDoneButton:](self, "setDoneButton:", v7);

}

- (void)updatePickerPositionForPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
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
  long double v20;
  long double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  -[DTSColorWheel bounds](self, "bounds");
  v6 = v24.origin.x;
  v7 = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v10 = CGRectGetWidth(v24) * 0.5;
  v25.origin.x = v6;
  v25.origin.y = v7;
  v25.size.width = width;
  v25.size.height = height;
  v11 = CGRectGetHeight(v25) * 0.5;
  v12 = x - v10;
  v13 = y - v11;
  v14 = hypot(v12, v13);
  if (v14 != 0.0)
  {
    v15 = v14;
    -[DTSColorWheel colorWheelRadius](self, "colorWheelRadius");
    v17 = v16;
    -[DTSColorWheel gradientWidth](self, "gradientWidth");
    v19 = (v17 + v18 * -0.5) / v15;
    v20 = v12 * v19;
    v21 = v13 * v19;
    -[DTSColorWheel pickerCircle](self, "pickerCircle");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[DTSColorWheel setPickerRotation:](self, "setPickerRotation:", (double)atan2(v21, v20));
    -[DTSColorWheel pickerViewHighlightedColor](self, "pickerViewHighlightedColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);

    objc_msgSend(v23, "setCenter:", (double)(v10 + v20), (double)(v11 + v21));
  }
}

- (id)pickerViewHighlightedColor
{
  return 0;
}

- (DTSColorWheelDelegate)delegate
{
  return (DTSColorWheelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)colorWheelRadius
{
  return self->_colorWheelRadius;
}

- (void)setColorWheelRadius:(double)a3
{
  self->_colorWheelRadius = a3;
}

- (double)gradientWidth
{
  return self->_gradientWidth;
}

- (void)setGradientWidth:(double)a3
{
  self->_gradientWidth = a3;
}

- (double)pickerDiameter
{
  return self->_pickerDiameter;
}

- (void)setPickerDiameter:(double)a3
{
  self->_pickerDiameter = a3;
}

- (double)hueRotation
{
  return self->_hueRotation;
}

- (void)setHueRotation:(double)a3
{
  self->_hueRotation = a3;
}

- (double)pickerRotation
{
  return self->_pickerRotation;
}

- (void)setPickerRotation:(double)a3
{
  self->_pickerRotation = a3;
}

- (UIView)pickerCircle
{
  return self->_pickerCircle;
}

- (void)setPickerCircle:(id)a3
{
  objc_storeStrong((id *)&self->_pickerCircle, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_pickerCircle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
