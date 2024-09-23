@implementation HUQuickControlWheelPickerViewProfile

- (HUQuickControlWheelPickerViewProfile)init
{
  HUQuickControlWheelPickerViewProfile *v2;
  HUQuickControlWheelPickerViewProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlWheelPickerViewProfile;
  v2 = -[HUQuickControlWheelPickerViewProfile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUQuickControlWheelPickerViewProfile setStyle:](v2, "setStyle:", 0);
    -[HUQuickControlWheelPickerViewProfile setShowOffState:](v3, "setShowOffState:", 0);
  }
  return v3;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  if (a3 == 1)
  {
    -[HUQuickControlWheelPickerViewProfile _setMultiStateStyleProperties](self, "_setMultiStateStyleProperties");
  }
  else if (!a3)
  {
    -[HUQuickControlWheelPickerViewProfile _setDefaultStyleProperties](self, "_setDefaultStyleProperties");
  }
}

- (void)_setDefaultStyleProperties
{
  void *v3;

  -[HUQuickControlWheelPickerViewProfile setBorderWidth:](self, "setBorderWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerViewProfile setBorderColor:](self, "setBorderColor:", v3);

  -[HUQuickControlWheelPickerViewProfile setCornerRadius:](self, "setCornerRadius:", 20.0);
  -[HUQuickControlWheelPickerViewProfile setSizeToFitTextWidth:](self, "setSizeToFitTextWidth:", 1);
  -[HUQuickControlWheelPickerViewProfile setUppercaseRowTitles:](self, "setUppercaseRowTitles:", 0);
  -[HUQuickControlWheelPickerViewProfile borderWidth](self, "borderWidth");
  -[HUQuickControlWheelPickerViewProfile setSelectedRowBorderWidth:](self, "setSelectedRowBorderWidth:");
  -[HUQuickControlWheelPickerViewProfile setSelectedRowCornerRadius:](self, "setSelectedRowCornerRadius:", 8.0);
}

- (void)_setMultiStateStyleProperties
{
  -[HUQuickControlWheelPickerViewProfile _setDefaultStyleProperties](self, "_setDefaultStyleProperties");
  -[HUQuickControlWheelPickerViewProfile setBorderWidth:](self, "setBorderWidth:", 0.0);
  -[HUQuickControlWheelPickerViewProfile setUppercaseRowTitles:](self, "setUppercaseRowTitles:", 1);
  -[HUQuickControlWheelPickerViewProfile setSelectedRowCornerRadius:](self, "setSelectedRowCornerRadius:", 16.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlWheelPickerViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HUQuickControlWheelPickerViewProfile borderWidth](self, "borderWidth");
  objc_msgSend(v4, "setBorderWidth:");
  -[HUQuickControlWheelPickerViewProfile borderColor](self, "borderColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v5);

  -[HUQuickControlWheelPickerViewProfile cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  objc_msgSend(v4, "setSizeToFitTextWidth:", -[HUQuickControlWheelPickerViewProfile sizeToFitTextWidth](self, "sizeToFitTextWidth"));
  objc_msgSend(v4, "setUppercaseRowTitles:", -[HUQuickControlWheelPickerViewProfile uppercaseRowTitles](self, "uppercaseRowTitles"));
  -[HUQuickControlWheelPickerViewProfile selectedRowBorderWidth](self, "selectedRowBorderWidth");
  objc_msgSend(v4, "setSelectedRowBorderWidth:");
  -[HUQuickControlWheelPickerViewProfile selectedRowCornerRadius](self, "selectedRowCornerRadius");
  objc_msgSend(v4, "setSelectedRowCornerRadius:");
  objc_msgSend(v4, "setShowOffState:", -[HUQuickControlWheelPickerViewProfile showOffState](self, "showOffState"));
  objc_msgSend(v4, "setStyle:", -[HUQuickControlWheelPickerViewProfile style](self, "style"));
  return v4;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)sizeToFitTextWidth
{
  return self->_sizeToFitTextWidth;
}

- (void)setSizeToFitTextWidth:(BOOL)a3
{
  self->_sizeToFitTextWidth = a3;
}

- (BOOL)uppercaseRowTitles
{
  return self->_uppercaseRowTitles;
}

- (void)setUppercaseRowTitles:(BOOL)a3
{
  self->_uppercaseRowTitles = a3;
}

- (double)selectedRowBorderWidth
{
  return self->_selectedRowBorderWidth;
}

- (void)setSelectedRowBorderWidth:(double)a3
{
  self->_selectedRowBorderWidth = a3;
}

- (double)selectedRowCornerRadius
{
  return self->_selectedRowCornerRadius;
}

- (void)setSelectedRowCornerRadius:(double)a3
{
  self->_selectedRowCornerRadius = a3;
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
