@implementation ARUICountdownDefaultTimeline

- (ARUICountdownDefaultTimeline)init
{
  ARUICountdownDefaultTimeline *v2;
  void *v3;
  void *v4;
  ARUICountdownFadeIn *v5;
  ARUICountdownWindUp *v6;
  ARUICountdownCountdown *v7;
  ARUICountdownCountdown *v8;
  ARUICountdownCountdown *v9;
  ARUICountdownFadeOut *v10;
  void *v11;
  ARUICountdownCancel *v12;
  ARUICountdownPreCancel *v14;
  ARUICountdownPreAnimation *v15;
  objc_super v16;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)ARUICountdownDefaultTimeline;
  v2 = -[ARUICountdownDefaultTimeline init](&v16, sel_init);
  if (v2)
  {
    v15 = objc_alloc_init(ARUICountdownPreAnimation);
    -[ARUICountdownTimeline setPrepareToAnimate:](v2, "setPrepareToAnimate:", v15);
    v14 = objc_alloc_init(ARUICountdownPreCancel);
    -[ARUICountdownTimeline setPrepareToCancel:](v2, "setPrepareToCancel:", v14);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(ARUICountdownFadeIn);
    v6 = objc_alloc_init(ARUICountdownWindUp);
    v7 = -[ARUICountdownCountdown initWithPercent:andStep:cancelable:]([ARUICountdownCountdown alloc], "initWithPercent:andStep:cancelable:", 3, 1, 0.66);
    v8 = -[ARUICountdownCountdown initWithPercent:andStep:cancelable:]([ARUICountdownCountdown alloc], "initWithPercent:andStep:cancelable:", 2, 1, 0.33);
    v9 = -[ARUICountdownCountdown initWithPercent:andStep:cancelable:]([ARUICountdownCountdown alloc], "initWithPercent:andStep:cancelable:", 1, 0, 0.0);
    v10 = objc_alloc_init(ARUICountdownFadeOut);
    v17[0] = v5;
    v17[1] = v6;
    v17[2] = v7;
    v17[3] = v8;
    v17[4] = v9;
    v17[5] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v11);

    v12 = objc_alloc_init(ARUICountdownCancel);
    objc_msgSend(v4, "addObject:", v12);
    -[ARUICountdownTimeline setAnimations:](v2, "setAnimations:", v3);
    -[ARUICountdownTimeline setCancelAnimations:](v2, "setCancelAnimations:", v4);

  }
  return v2;
}

+ (id)preAnimationIdentifier
{
  return +[ARUICountdownPreAnimation identifier](ARUICountdownPreAnimation, "identifier");
}

+ (id)fadeInIdentifier
{
  return +[ARUICountdownFadeIn identifier](ARUICountdownFadeIn, "identifier");
}

+ (id)windUpIdentifier
{
  return +[ARUICountdownWindUp identifier](ARUICountdownWindUp, "identifier");
}

+ (id)countdownIdentifier
{
  return +[ARUICountdownCountdown identifier](ARUICountdownCountdown, "identifier");
}

+ (id)fadeOutIdentifier
{
  return +[ARUICountdownFadeOut identifier](ARUICountdownFadeOut, "identifier");
}

+ (id)disappearIdentifier
{
  return +[ARUICountdownDisappear identifier](ARUICountdownDisappear, "identifier");
}

+ (id)cancelIdentifier
{
  return +[ARUICountdownCancel identifier](ARUICountdownCancel, "identifier");
}

@end
