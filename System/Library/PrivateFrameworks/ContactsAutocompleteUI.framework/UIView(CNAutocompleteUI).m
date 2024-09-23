@implementation UIView(CNAutocompleteUI)

- (void)abSetLayoutDebuggingColor:()CNAutocompleteUI
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGColor");
  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 1.0);

  objc_msgSend(v4, "colorWithAlphaComponent:", 0.25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v8);
  v9 = objc_msgSend(v11, "CGColor");
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (double)cnaui_currentScreenScale
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

@end
