@implementation UIViewController(DC)

- (uint64_t)dc_isRTL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "dc_isRTL");

  return v2;
}

+ (void)dc_enableUIViewAnimations:()DC forBlock:
{
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void);

  v7 = a4;
  v5 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
  if ((_DWORD)v5 == (_DWORD)a3)
  {
    v7[2]();
  }
  else
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", a3);
    v7[2]();
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v6);
  }

}

- (void)dc_showViewController:()DC animated:sender:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__UIViewController_DC__dc_showViewController_animated_sender___block_invoke;
  v13[3] = &unk_24C5B80C0;
  v13[4] = a1;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "dc_enableUIViewAnimations:forBlock:", a4, v13);

}

- (BOOL)dc_isViewVisible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(a1, "_appearState") != 3;
  else
    v4 = 0;

  return v4;
}

- (double)dc_safeAreaDistanceFromTop
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v11;

  objc_msgSend(a1, "dc_safeAreaLayoutGuide");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  return CGRectGetMinY(v11);
}

- (double)dc_safeAreaDistanceFromBottom
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double MaxY;
  double v13;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a1, "dc_safeAreaLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(a1, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  MaxY = CGRectGetMaxY(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v13 = MaxY - CGRectGetMaxY(v16);

  return v13;
}

- (id)dc_safeAreaLayoutGuide
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeAreaLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
