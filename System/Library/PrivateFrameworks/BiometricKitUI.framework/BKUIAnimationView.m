@implementation BKUIAnimationView

- (double)topOffsetPercentage
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  double result;
  uint8_t v28[16];

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIdiomPad");

  if (v3)
  {
    if (+[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", 0) == 4|| +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", 0) == 3)
    {
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isMini");

      if (v5)
        v6 = 0.806399985;
      else
        v6 = 0.778899985;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPad6");

      if (v8)
        v6 = v6 + -0.026;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isIPad2");

      if (v10)
        v6 = v6 + 0.026;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isiPad21");

      v13 = 0.01;
    }
    else
    {
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isMini");

      if (v21)
        v6 = 0.803499985;
      else
        v6 = 0.753499985;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isPad7");

      if (v23)
        v6 = v6 + 0.025;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isIPad2");

      if (v25)
        v6 = v6 + 0.051;
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v26, "isiPad21");

      v13 = 0.0324;
    }
  }
  else
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isZoomEnabled");

    if ((v15 & 1) != 0)
    {
      v6 = 0.598000009;
    }
    else
    {
      _BKUILoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1DB281000, v16, OS_LOG_TYPE_DEFAULT, "Unable to determine displayzoom as DisplayAndBrightnessSettings is not available", v28, 2u);
      }

      v6 = 0.61500001;
    }
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isN69");

    if (v18)
      v6 = v6 + -0.0419999994;
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v19, "isD10");

    v13 = -0.0199999996;
  }
  result = v6 + v13;
  if (!v12)
    return v6;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  int v15;
  CGAffineTransform *v16;
  CGAffineTransform *v17;
  CGAffineTransform *v18;
  CGFloat v19;
  CGFloat v20;
  _OWORD v21[3];
  _BYTE v22[48];
  CGAffineTransform v23;
  CGAffineTransform v24;

  -[BKUIAnimationView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

  -[BKUIAnimationView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIAnimationView bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[BKUIAnimationView bounds](self, "bounds");
  objc_msgSend(v6, "setPosition:", v8, v9 * 0.5);
  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v10, "isIdiomPad");

  if (!(_DWORD)v4)
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isN69");

    if ((v12 & 1) != 0)
    {
      v13 = 0.349999994;
      if (v6)
      {
LABEL_6:
        objc_msgSend(v6, "contentsTransform");
LABEL_12:
        v16 = (CGAffineTransform *)v22;
        v17 = (CGAffineTransform *)v22;
        v18 = (CGAffineTransform *)v21;
        v19 = v13;
        v20 = v13;
        goto LABEL_15;
      }
    }
    else
    {
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isD10");

      if (v15)
        v13 = 0.400000006;
      else
        v13 = 0.449999988;
      if (v6)
        goto LABEL_6;
    }
    memset(v21, 0, sizeof(v21));
    goto LABEL_12;
  }
  if (v6)
    objc_msgSend(v6, "contentsTransform");
  else
    memset(&v23, 0, sizeof(v23));
  v19 = 0.3;
  v16 = &v24;
  v17 = &v24;
  v18 = &v23;
  v20 = 0.3;
LABEL_15:
  CGAffineTransformScale(v17, v18, v19, v20);
  objc_msgSend(v6, "setAffineTransform:", v16);

}

@end
