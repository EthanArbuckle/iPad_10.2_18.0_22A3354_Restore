@implementation UIColor(CUIKPlatforms)

+ (id)cuik_timelineHourColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("timelineHourColor"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)cuik_todayTimelineColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

+ (id)cuik_nonTodayTimelineColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "cuik_todayTimelineColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)cuik_alphaComponent
{
  return CGColorGetAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
}

- (uint64_t)cuik_colorWithAlphaScaled:()CUIKPlatforms
{
  double v4;

  objc_msgSend(a1, "cuik_alphaComponent");
  return objc_msgSend(a1, "colorWithAlphaComponent:", v4 * a2);
}

@end
