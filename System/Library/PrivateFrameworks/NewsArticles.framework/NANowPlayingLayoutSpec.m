@implementation NANowPlayingLayoutSpec

+ (double)artworkBottomMarginInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 568.0;
  result = 36.0;
  if (!v3)
    return 16.0;
  return result;
}

+ (double)bottomControlsTopMarginInView:(id)a3
{
  id v3;
  double v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v4 = 0.0;
  if (CGRectGetHeight(v6) > 568.0)
  {
    objc_msgSend(v3, "bounds");
    v4 = 10.0;
    if (CGRectGetHeight(v7) > 667.0)
    {
      objc_msgSend(v3, "bounds");
      if (CGRectGetHeight(v8) <= 736.0)
        v4 = 14.0;
      else
        v4 = 17.0;
    }
  }

  return v4;
}

+ (double)playPausePointSizeInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 736.0;
  result = 34.0;
  if (v3)
    return 46.0;
  return result;
}

+ (double)nextTrackAndRewindButtonPointSizeInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 736.0;
  result = 24.0;
  if (v3)
    return 30.0;
  return result;
}

+ (double)titleLabelFontSizeInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 568.0;
  result = 22.0;
  if (v3)
    return 26.0;
  return result;
}

+ (double)publisherLogoBottomMarginInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 568.0;
  result = 3.0;
  if (v3)
    return 5.0;
  return result;
}

+ (double)publisherLogoHeightInView:(id)a3
{
  BOOL v3;
  double result;
  CGRect v5;

  objc_msgSend(a3, "bounds");
  v3 = CGRectGetHeight(v5) > 736.0;
  result = 14.0;
  if (v3)
    return 20.0;
  return result;
}

+ (double)playbackControlsHorizontalInsetInView:(id)a3
{
  id v3;
  double v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v4 = 27.0;
  if (CGRectGetHeight(v6) > 568.0)
  {
    objc_msgSend(v3, "bounds");
    if (CGRectGetHeight(v7) <= 667.0)
    {
      v4 = 55.0;
    }
    else
    {
      objc_msgSend(v3, "bounds");
      if (CGRectGetHeight(v8) <= 736.0)
        v4 = 67.0;
      else
        v4 = 34.0;
    }
  }

  return v4;
}

+ (double)titleViewBottomMarginInView:(id)a3
{
  id v3;
  double v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v4 = 0.0;
  if (CGRectGetHeight(v6) > 568.0)
  {
    objc_msgSend(v3, "bounds");
    v4 = 4.0;
    if (CGRectGetHeight(v7) > 667.0)
    {
      objc_msgSend(v3, "bounds");
      if (CGRectGetHeight(v8) <= 736.0)
        v4 = 0.0;
      else
        v4 = 18.0;
    }
  }

  return v4;
}

@end
