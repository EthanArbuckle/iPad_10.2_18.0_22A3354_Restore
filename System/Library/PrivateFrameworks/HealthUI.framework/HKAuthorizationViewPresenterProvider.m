@implementation HKAuthorizationViewPresenterProvider

- (id)hkAuthorizationViewControllerPresenter:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
