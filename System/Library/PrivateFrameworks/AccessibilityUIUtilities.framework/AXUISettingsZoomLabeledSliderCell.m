@implementation AXUISettingsZoomLabeledSliderCell

- (AXUISettingsZoomLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXUISettingsZoomLabeledSliderCell *v5;
  AXUISettingsZoomLabeledSliderCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXUISettingsZoomLabeledSliderCell;
  v5 = -[AXUISettingsLabeledSliderCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[AXUISettingsZoomLabeledSliderCell initialValue](v5, "initialValue");
    -[AXUISettingsZoomLabeledSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];

  AXFormatMagnificationFactor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsLabeledSliderCell setLabelText:](self, "setLabelText:", v5);

  -[AXUISettingsLabeledSliderCell slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AXUISettingsLabeledSliderCell slider](self, "slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__AXUISettingsZoomLabeledSliderCell__updateRightLabelWithValue___block_invoke;
    v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
    *(double *)&v9[4] = a3;
    objc_msgSend(v8, "_setAccessibilityValueBlock:", v9);

  }
}

uint64_t __64__AXUISettingsZoomLabeledSliderCell__updateRightLabelWithValue___block_invoke()
{
  return AXFormatMagnificationFactor();
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(CFSTR("MAX_PREFERRED_ZOOM_LEVEL_TITLE_FOOTER"));
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4;
  float v5;
  double v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(v4, "value");
  v6 = round(v5 * 4.0) * 0.25;
  *(float *)&v6 = v6;
  objc_msgSend(v4, "setValue:animated:", 0, v6);
  objc_msgSend(v4, "value");
  v8 = v7;

  -[AXUISettingsZoomLabeledSliderCell _updateRightLabelWithValue:](self, "_updateRightLabelWithValue:", v8);
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  float v3;
  double v4;
  id v5;

  objc_msgSend(a3, "value");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomPreferredMaximumZoomScale:", v4);

}

- (double)maximumValue
{
  return *MEMORY[0x1E0CF38B8];
}

- (double)minimumValue
{
  return *MEMORY[0x1E0CF38C0];
}

- (double)initialValue
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomPreferredMaximumZoomScale");
  v4 = v3;

  return v4;
}

@end
