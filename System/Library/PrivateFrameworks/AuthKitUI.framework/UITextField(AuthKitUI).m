@implementation UITextField(AuthKitUI)

- (id)ak_addForgotButtonWithTarget:()AuthKitUI action:
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CEA3A0];
  v7 = a3;
  objc_msgSend(v6, "ak_passwordRecoveryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", v7, a4, 64);

  objc_msgSend(a1, "setRightView:", v8);
  objc_msgSend(a1, "setRightViewMode:", 3);
  return v8;
}

- (id)ak_addActivityIndicator
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v2, "startAnimating");
  objc_msgSend(a1, "setRightView:", v2);
  objc_msgSend(a1, "setRightViewMode:", 3);
  return v2;
}

- (void)ak_clearActivityIndicatorIfExist
{
  id v2;
  void *v3;
  id v4;

  objc_opt_class();
  objc_msgSend(a1, "rightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stopAnimating");
    objc_msgSend(a1, "setRightView:", 0);
    objc_msgSend(a1, "setRightViewMode:", 0);
    v3 = v4;
  }

}

@end
