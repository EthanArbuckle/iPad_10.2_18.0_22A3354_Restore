@implementation ZoomUI_UIFocusScrollAnimatorOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusDisplayLinkScrollAnimator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v11 = a4;
  v12 = a6;
  if (_AXSZoomTouchEnabled())
  {
    objc_msgSend(getAXSettingsClass(), "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "zoomInStandby"))
    {

    }
    else
    {
      objc_msgSend(getAXSettingsClass(), "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "zoomScale");
      v16 = v15;

      if (v16 > 1.01)
        a5 = 0.5;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)ZoomUI_UIFocusScrollAnimatorOverride;
  -[ZoomUI_UIFocusScrollAnimatorOverride setTargetContentOffset:forEnvironmentScrollableContainer:convergenceRate:completion:](&v17, sel_setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion_, v11, v12, x, y, a5);

}

@end
