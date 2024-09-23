@implementation UIWindowScene(AppOverlayManager)

- (ASOOverlayManager)_aso_appOverlayManager
{
  void *v2;
  void *v3;
  ASOOverlayManager *v4;

  objc_msgSend(a1, "_sceneComponentForKey:", CFSTR("_ASOOverlayManagerWindowSceneComponentKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = -[ASOOverlayManager initWithWindowScene:]([ASOOverlayManager alloc], "initWithWindowScene:", a1);
    objc_msgSend(a1, "_registerSceneComponent:forKey:", v4, CFSTR("_ASOOverlayManagerWindowSceneComponentKey"));
  }

  return v4;
}

@end
