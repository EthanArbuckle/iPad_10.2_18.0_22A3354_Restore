@implementation UIPageControl(CCUIStaging)

- (uint64_t)ccui_setPageIndicatorVibrantColorMatrix:()CCUIStaging
{
  char v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[5];

  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    v6 = a3[3];
    v9[2] = a3[2];
    v9[3] = v6;
    v9[4] = a3[4];
    v7 = a3[1];
    v9[0] = *a3;
    v9[1] = v7;
    objc_msgSend(a1, "_setPageIndicatorVibrantColorMatrix:", v9);
  }
  return v5 & 1;
}

- (uint64_t)ccui_setActivePageIndicatorVibrantColorMatrix:()CCUIStaging
{
  char v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[5];

  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    v6 = a3[3];
    v9[2] = a3[2];
    v9[3] = v6;
    v9[4] = a3[4];
    v7 = a3[1];
    v9[0] = *a3;
    v9[1] = v7;
    objc_msgSend(a1, "_setActivePageIndicatorVibrantColorMatrix:", v9);
  }
  return v5 & 1;
}

- (uint64_t)ccui_setTargetTransformForTouchedPage:()CCUIStaging
{
  char v5;
  __int128 v6;
  _OWORD v8[3];

  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    v6 = a3[1];
    v8[0] = *a3;
    v8[1] = v6;
    v8[2] = a3[2];
    objc_msgSend(a1, "_setTargetTransformForTouchedPage:", v8);
  }
  return v5 & 1;
}

@end
