@implementation DelayedSpinner

+ (void)_setShowStatusBarSpinnerTimer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)showStatusBarSpinnerTimer != v4)
  {
    v5 = v4;
    objc_msgSend((id)showStatusBarSpinnerTimer, "invalidate");
    objc_storeStrong((id *)&showStatusBarSpinnerTimer, a3);
    v4 = v5;
  }

}

+ (void)_showStatusBarSpinner:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(a1, "_setShowStatusBarSpinnerTimer:", 0);
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "setStatusBarShowsProgress:", v5);
}

+ (void)_setShowStatusBarSpinner:(BOOL)a3 withDelay:(double)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__showStatusBarSpinner_, v8, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setShowStatusBarSpinnerTimer:", v7);

}

+ (void)showWithDelay
{
  objc_msgSend(a1, "_setShowStatusBarSpinner:withDelay:", 1, 0.1);
}

+ (void)hide
{
  objc_msgSend(a1, "_setShowStatusBarSpinner:withDelay:", 0, 0.0);
}

@end
