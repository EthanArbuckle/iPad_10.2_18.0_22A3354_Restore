@implementation AXSettingsTickedSliderCell

- (AXSettingsTickedSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXSettingsTickedSliderCell *v5;
  AXSettingsTickedSliderCell *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AXSettingsTickedSliderCell;
  v5 = -[AXUISettingsLabeledSliderCell initWithStyle:reuseIdentifier:specifier:](&v16, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[AXSettingsTickedSliderCell initialValue](v5, "initialValue");
    -[AXSettingsTickedSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[AXSettingsTickedSliderCell _defaultSliderValue](v6, "_defaultSliderValue");
    objc_msgSend(v7, "numberWithDouble:", v8 / 100.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell slider](v6, "slider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTicks:", v10);

    v12 = objc_alloc(MEMORY[0x1E0CF3978]);
    v13 = (void *)objc_msgSend(v12, "initWithTargetSerialQueue:", MEMORY[0x1E0C80D38]);
    -[AXSettingsTickedSliderCell setValueTimer:](v6, "setValueTimer:", v13);

    -[AXSettingsTickedSliderCell valueTimer](v6, "valueTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);

  }
  return v6;
}

- (double)_defaultSliderValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;

  -[AXSettingsTickedSliderCell controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInWatchSettings");

  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsTickedSliderCell btAddress](self, "btAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = objc_msgSend(v5, "nps_defaultToneVolumeForDeviceAddress:", v6);
  else
    v7 = objc_msgSend(v5, "defaultToneVolumeForDeviceAddress:", v6);
  v8 = v7;

  return (double)v8;
}

- (double)_determineDisplayValue:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double result;

  v5 = (a3 + -15.0) / 85.0;
  -[AXSettingsTickedSliderCell controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedMaxValue");
  v8 = (v5 * (v7 + -15.0) + 15.0) / 100.0;

  -[AXSettingsTickedSliderCell _defaultSliderValue](self, "_defaultSliderValue");
  v10 = vabdd_f64(a3, v9) < 0.001;
  result = 1.0;
  if (!v10)
    return v8;
  return result;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];

  -[AXSettingsTickedSliderCell _determineDisplayValue:](self, "_determineDisplayValue:", a3);
  v5 = v4;
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsLabeledSliderCell setLabelText:](self, "setLabelText:", v6);

  -[AXUISettingsLabeledSliderCell slider](self, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AXUISettingsLabeledSliderCell slider](self, "slider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AXSettingsTickedSliderCell__updateRightLabelWithValue___block_invoke;
    v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v10[4] = v5;
    objc_msgSend(v9, "_setAccessibilityValueBlock:", v10);

  }
}

uint64_t __57__AXSettingsTickedSliderCell__updateRightLabelWithValue___block_invoke()
{
  return AXFormatFloatWithPercentage();
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSettingsTickedSliderCell controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "value");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToneVolume:specifier:", v7, 0);

  AXLogAirPodSettings();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "value");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1BD892000, v8, OS_LOG_TYPE_INFO, "Finish dragging: %@", (uint8_t *)&v12, 0xCu);

  }
  -[AXSettingsTickedSliderCell valueTimer](self, "valueTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

}

- (void)layoutSubviews
{
  void *v3;
  float v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSettingsTickedSliderCell;
  -[PSTableCell layoutSubviews](&v5, sel_layoutSubviews);
  -[AXUISettingsLabeledSliderCell slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  -[AXSettingsTickedSliderCell _updateRightLabelWithValue:](self, "_updateRightLabelWithValue:", v4);

}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogAirPodSettings();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "value");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1BD892000, v5, OS_LOG_TYPE_INFO, "Dragging airpod slider: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "value");
  objc_msgSend(v4, "setValue:animated:", 0);
  objc_msgSend(v4, "value");
  -[AXSettingsTickedSliderCell _updateRightLabelWithValue:](self, "_updateRightLabelWithValue:", v8);
  -[AXSettingsTickedSliderCell controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "value");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyHapticIfNecessary:", v11);

  -[AXSettingsTickedSliderCell valueTimer](self, "valueTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__AXSettingsTickedSliderCell_handleSliderBeingDragged___block_invoke;
  v14[3] = &unk_1E76AB410;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "afterDelay:processBlock:", v14, 0.25);

}

void __55__AXSettingsTickedSliderCell_handleSliderBeingDragged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "value");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToneVolume:specifier:", v4, 0);

  AXLogAirPodSettings();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "value");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1BD892000, v5, OS_LOG_TYPE_DEFAULT, "Set controller value: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (NSString)btAddress
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("BTAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)accessibilityLabel
{
  return (id)AXAirPodsLocalizedStringForKey();
}

- (double)maximumValue
{
  return 100.0;
}

- (double)minimumValue
{
  return 15.0;
}

- (double)initialValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[AXSettingsTickedSliderCell controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInWatchSettings");

  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsTickedSliderCell btAddress](self, "btAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "nps_toneVolumeForDeviceAddress:", v6);
    v8 = v7;
  }
  else
  {
    v8 = (double)objc_msgSend(v5, "toneVolumeForDeviceAddress:", v6);
  }

  return v8;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (id)maximumTextSizeString
{
  -[AXSettingsTickedSliderCell _determineDisplayValue:](self, "_determineDisplayValue:", 100.0);
  return (id)AXFormatFloatWithPercentage();
}

- (double)rightViewPadding
{
  return 5.0;
}

- (AccessibilityAirPodSettingsController)controller
{
  return (AccessibilityAirPodSettingsController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AXDispatchTimer)valueTimer
{
  return self->_valueTimer;
}

- (void)setValueTimer:(id)a3
{
  objc_storeStrong((id *)&self->_valueTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTimer, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
