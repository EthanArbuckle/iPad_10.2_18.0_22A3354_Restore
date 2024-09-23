@implementation CAMDeviceTooHotInstructionLabel

- (CAMDeviceTooHotInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMDeviceTooHotInstructionLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMDeviceTooHotInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("DEVICE_TOO_HOT_%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CAMLocalizedFrameworkString(v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInstructionLabel setText:](v3, "setText:", v8);

  }
  return v3;
}

@end
