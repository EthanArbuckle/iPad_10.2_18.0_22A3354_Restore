@implementation CSTimerView

- (CSTimerView)init
{
  CSTimerView *v2;
  CSTimerView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSTimerView;
  v2 = -[SBFLockScreenDateSubtitleView init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSTimerView _timerFont](v2, "_timerFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSTimerView setFont:](v3, "setFont:", v4);

    -[SBFLockScreenDateSubtitleView legibilitySettings](v3, "legibilitySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateSubtitleView font](v3, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CSTimerView _newTimerDialForSettings:withFont:](v3, "_newTimerDialForSettings:withFont:", v5, v6);
    -[SBFLockScreenDateSubtitleView setAccessoryView:](v3, "setAccessoryView:", v7);

    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addKeyObserver:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSTimerView;
  -[SBFLockScreenDateSubtitleView dealloc](&v4, sel_dealloc);
}

- (id)accessoryView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSTimerView;
  -[SBFLockScreenDateSubtitleView accessoryView](&v8, sel_accessoryView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSTimerView;
  v4 = a3;
  -[SBFLockScreenDateSubtitleView setFont:](&v6, sel_setFont_, v4);
  -[CSTimerView accessoryView](self, "accessoryView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "sizeToFit");
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSTimerView;
  v4 = a3;
  -[SBFLockScreenDateSubtitleView setLegibilitySettings:](&v7, sel_setLegibilitySettings_, v4);
  -[CSTimerView _updateLegibilityStrength](self, "_updateLegibilityStrength", v7.receiver, v7.super_class);
  -[SBFLockScreenDateSubtitleView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSTimerView _newTimerDialForSettings:withFont:](self, "_newTimerDialForSettings:withFont:", v4, v5);

  -[SBFLockScreenDateSubtitleView setAccessoryView:](self, "setAccessoryView:", v6);
}

- (double)interItemSpacing
{
  return 0.0;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)timerText
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[NSDate timeIntervalSinceNow](self->_endDate, "timeIntervalSinceNow");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatAbbreviatedTimerDuration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v6 = CFSTR("\u200F%@%@");
  else
    v6 = CFSTR("%@%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, CFSTR(" "), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)updateTimerLabel
{
  id v3;

  -[CSTimerView timerText](self, "timerText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateSubtitleView setString:](self, "setString:", v3);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DA9E38];
  v6 = a3;
  objc_msgSend(v5, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[CSTimerView _updateLegibilityStrength](self, "_updateLegibilityStrength");
}

- (void)_updateLegibilityStrength
{
  void *v3;
  uint64_t v4;
  id v5;

  -[SBFLockScreenDateSubtitleView legibilitySettings](self, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerTextStrengthForStyle:", v4);
  -[SBFLockScreenDateSubtitleView setStrength:](self, "setStrength:");

}

- (id)_newTimerDialForSettings:(id)a3 withFont:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0DAC238];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithSymbolFont:", v6);

  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timerDialStrengthForStyle:", objc_msgSend(v7, "style"));
  objc_msgSend(v8, "setStrength:");

  objc_msgSend(v8, "setLegibilitySettings:", v7);
  objc_msgSend(v8, "sizeToFit");
  return v8;
}

- (id)_timerFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA5E8];
  -[SBFLockScreenDateSubtitleView font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v2, "monospacedDigitSystemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
