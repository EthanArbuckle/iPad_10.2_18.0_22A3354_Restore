@implementation UIView(ABDebugging)

- (id)tintColorOverride
{
  void *v2;
  void *v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColorOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)abSetLayoutDebuggingColor:()ABDebugging
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

- (id)tintColorOverrideDarkened
{
  void *v1;
  id v2;
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "tintColorOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (objc_msgSend(v1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v8, v7, v6 * 0.75, v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

@end
