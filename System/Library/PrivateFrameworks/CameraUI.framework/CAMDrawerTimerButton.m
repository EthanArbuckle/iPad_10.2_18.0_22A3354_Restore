@implementation CAMDrawerTimerButton

- (int64_t)controlType
{
  return 3;
}

- (void)setTimerDuration:(int64_t)a3
{
  if (self->_timerDuration != a3)
  {
    self->_timerDuration = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
    -[CAMControlDrawerMenuButton updateLabelsIfNeeded](self, "updateLabelsIfNeeded");
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  LOBYTE(self) = v5 == -[CAMDrawerTimerButton timerDuration](self, "timerDuration");

  return (char)self;
}

- (id)loadMenuItems
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
  CAMControlDrawerMenuItem *v14;
  CAMControlDrawerMenuItem *v15;
  CAMControlDrawerMenuItem *v16;
  CAMControlDrawerMenuItem *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  CAMTimerDurationFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("TIMER_OFF_TEXT"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("TIMER_TIMER_OFF_TEXT"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("TIMER_DURATION_TEXT"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), 0, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), 0, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:]([CAMControlDrawerMenuItem alloc], "initWithTitle:selectedTitle:value:", v23, v22, &unk_1EA3B0EE0);
  v15 = -[CAMControlDrawerMenuItem initWithTitle:value:]([CAMControlDrawerMenuItem alloc], "initWithTitle:value:", v21, &unk_1EA3B0EC8);
  v16 = -[CAMControlDrawerMenuItem initWithTitle:value:]([CAMControlDrawerMenuItem alloc], "initWithTitle:value:", v20, &unk_1EA3B0EB0);
  v17 = -[CAMControlDrawerMenuItem initWithTitle:value:]([CAMControlDrawerMenuItem alloc], "initWithTitle:value:", v13, &unk_1EA3B0EF8);
  v24[0] = v14;
  v24[1] = v15;
  v24[2] = v16;
  v24[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerTimerButton timerDuration](self, "timerDuration");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (v7 != v5)
  {
    -[CAMDrawerTimerButton setTimerDuration:](self, "setTimerDuration:", v7);
    -[CAMDrawerTimerButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)imageNameForCurrentState
{
  -[CAMDrawerTimerButton timerDuration](self, "timerDuration");
  return CFSTR("timer");
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)(-[CAMDrawerTimerButton timerDuration](self, "timerDuration") - 1) < 3;
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

@end
