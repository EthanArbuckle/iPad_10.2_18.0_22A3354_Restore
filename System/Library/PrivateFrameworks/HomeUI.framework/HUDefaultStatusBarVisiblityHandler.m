@implementation HUDefaultStatusBarVisiblityHandler

- (BOOL)isStatusBarHidden
{
  void *v2;
  char v3;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setStatusBarHidden:(BOOL)a3 withAnimationSettings:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v9)
  {
    -[HUDefaultStatusBarVisiblityHandler _statusBarAnimationParametersForAnimationSettings:](self, "_statusBarAnimationParametersForAnimationSettings:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:animationParameters:", v4, v8);

  }
  else
  {
    objc_msgSend(v6, "setHidden:", v4);
  }

}

- (id)_statusBarAnimationParametersForAnimationSettings:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CEA9F8];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithDefaultParameters");
    objc_msgSend(v4, "duration");
    objc_msgSend(v5, "setDuration:");
    objc_msgSend(v5, "setAnimationFactory:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
