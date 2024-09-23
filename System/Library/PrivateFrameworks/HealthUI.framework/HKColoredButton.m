@implementation HKColoredButton

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKColoredButton;
  -[HKColoredButton setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    -[HKColoredButton titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.25);

    -[HKColoredButton backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKColoredButton setBackgroundColor:](self, "setBackgroundColor:", v7);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __34__HKColoredButton_setHighlighted___block_invoke;
    v8[3] = &unk_1E9C3F0D0;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.15);
  }
}

void __34__HKColoredButton_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v3);

}

@end
