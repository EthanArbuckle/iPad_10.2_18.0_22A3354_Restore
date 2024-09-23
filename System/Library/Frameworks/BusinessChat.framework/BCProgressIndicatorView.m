@implementation BCProgressIndicatorView

- (BCProgressIndicatorView)init
{
  BCProgressIndicatorView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCProgressIndicatorView;
  v2 = -[BCProgressIndicatorView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ProgressBarColor"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCProgressIndicatorView setProgressTintColor:](v2, "setProgressTintColor:", v4);

  }
  return v2;
}

- (uint64_t)hide
{
  _QWORD v1[5];
  _QWORD v2[5];

  if (result)
  {
    v1[4] = result;
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __31__BCProgressIndicatorView_hide__block_invoke;
    v2[3] = &unk_24E064CC8;
    v2[4] = result;
    v1[0] = MEMORY[0x24BDAC760];
    v1[1] = 3221225472;
    v1[2] = __31__BCProgressIndicatorView_hide__block_invoke_2;
    v1[3] = &unk_24E065020;
    return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v2, v1, 0.25);
  }
  return result;
}

uint64_t __31__BCProgressIndicatorView_hide__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __31__BCProgressIndicatorView_hide__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", a2);
  if (v2)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)show
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "setHidden:", 0);
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __31__BCProgressIndicatorView_show__block_invoke;
    v2[3] = &unk_24E064CC8;
    v2[4] = v1;
    return (void *)objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v2, &__block_literal_global_1, 0.25);
  }
  return result;
}

uint64_t __31__BCProgressIndicatorView_show__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __31__BCProgressIndicatorView_show__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
