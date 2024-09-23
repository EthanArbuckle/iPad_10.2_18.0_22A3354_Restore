@implementation UIColor(BaseBoardUI)

- (id)BSColor
{
  void *v1;
  NSObject *v2;
  uint8_t v4[16];
  double v5;
  double v6;
  double v7;
  double v8;

  v8 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5))
  {
    objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", v8, v7, v6, v5);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A0234000, v2, OS_LOG_TYPE_ERROR, "UIColor is not in a RGBA-compatible color-space.", v4, 2u);
    }

    v1 = 0;
  }
  return v1;
}

@end
