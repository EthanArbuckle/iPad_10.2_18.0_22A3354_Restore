@implementation CAMTimerStatusIndicator

- (void)setTimerDuration:(int64_t)a3
{
  if (self->_timerDuration != a3)
  {
    self->_timerDuration = a3;
    if (a3)
      -[CAMControlStatusIndicator setNeedsUpdateValueText](self, "setNeedsUpdateValueText");
  }
}

- (BOOL)canShowValue
{
  return 1;
}

- (id)valueText
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[CAMTimerStatusIndicator timerDuration](self, "timerDuration") - 1;
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_1DB9A78B8[v2];
  objc_msgSend((id)objc_opt_class(), "integerFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CAMLocalizedFrameworkString(CFSTR("TIMER_DURATION_TEXT"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageNameForCurrentState
{
  return CFSTR("timer");
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

@end
