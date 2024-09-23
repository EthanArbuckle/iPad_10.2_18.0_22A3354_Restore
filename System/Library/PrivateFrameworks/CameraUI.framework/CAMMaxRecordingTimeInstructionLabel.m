@implementation CAMMaxRecordingTimeInstructionLabel

- (CAMMaxRecordingTimeInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMMaxRecordingTimeInstructionLabel *v3;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *dateComponentsFormatter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMMaxRecordingTimeInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    dateComponentsFormatter = v3->__dateComponentsFormatter;
    v3->__dateComponentsFormatter = v4;

    -[NSDateComponentsFormatter setAllowedUnits:](v3->__dateComponentsFormatter, "setAllowedUnits:", 64);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v3->__dateComponentsFormatter, "setZeroFormattingBehavior:", 14);
    -[NSDateComponentsFormatter setUnitsStyle:](v3->__dateComponentsFormatter, "setUnitsStyle:", 2);
    -[CAMMaxRecordingTimeInstructionLabel _updateText](v3, "_updateText");
  }
  return v3;
}

- (void)setRemainingTimeInSeconds:(double)a3
{
  id v4;

  if (self->_remainingTimeInSeconds != a3)
  {
    self->_remainingTimeInSeconds = a3;
    -[CAMMaxRecordingTimeInstructionLabel _updateText](self, "_updateText");
    -[CAMInstructionLabel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (void)_updateText
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMMaxRecordingTimeInstructionLabel remainingTimeInSeconds](self, "remainingTimeInSeconds");
  v4 = (double)(60 * ((int)v3 / 60));
  -[CAMMaxRecordingTimeInstructionLabel _dateComponentsFormatter](self, "_dateComponentsFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromTimeInterval:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CAMLocalizedFrameworkString(CFSTR("MAX_RECORDING_TIME"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if ((v10 & 1) == 0)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Updating max recording time: %{public}@", buf, 0xCu);
    }

  }
  -[CAMInstructionLabel setText:](self, "setText:", v8);

}

- (UIEdgeInsets)_textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = CAMPixelWidthForView(self);
  v3 = v2 * 2.0 + 2.0;
  v4 = 5.0;
  v5 = 5.0;
  v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (double)remainingTimeInSeconds
{
  return self->_remainingTimeInSeconds;
}

- (NSDateComponentsFormatter)_dateComponentsFormatter
{
  return self->__dateComponentsFormatter;
}

- (void)set_dateComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->__dateComponentsFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dateComponentsFormatter, 0);
}

@end
