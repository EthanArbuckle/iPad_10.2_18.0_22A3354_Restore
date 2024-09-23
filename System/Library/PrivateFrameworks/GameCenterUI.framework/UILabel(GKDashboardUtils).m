@implementation UILabel(GKDashboardUtils)

- (void)_gkUpdateShadowForFocusChange:()GKDashboardUtils
{
  id v3;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v3, "CGColor");
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", v6);

  if (a3)
  {

    objc_msgSend(a1, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1053609165;
    objc_msgSend(v8, "setShadowOpacity:", v9);

    v10 = 0.0;
    v11 = 2.0;
    v12 = 4.0;
  }
  else
  {
    objc_msgSend(a1, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1053609165;
    objc_msgSend(v13, "setShadowOpacity:", v14);

    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v12 = 0.0;
  }
  objc_msgSend(a1, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowOffset:", v10, v11);

  objc_msgSend(a1, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowRadius:", v12);

}

@end
