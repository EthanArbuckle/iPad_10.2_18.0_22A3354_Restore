@implementation VKCameraDelegateMediatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCameraDelegateMediator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("VKCameraDelegateMediator"), CFSTR("VKMapViewCameraDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCameraDelegateMediator"), CFSTR("mapLayerDidChangeVisibleRegion"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCameraDelegateMediator"), CFSTR("mapLayerDidChangeRegionAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCameraDelegateMediator"), CFSTR("cameraDelegate"), "@", 0);

}

- (void)mapLayerDidChangeVisibleRegion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCameraDelegateMediatorAccessibility;
  -[VKCameraDelegateMediatorAccessibility mapLayerDidChangeVisibleRegion](&v5, sel_mapLayerDidChangeVisibleRegion);
  -[VKCameraDelegateMediatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_mapView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityMapViewDidChangeVisibleRegion");

  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKCameraDelegateMediatorAccessibility;
  -[VKCameraDelegateMediatorAccessibility mapLayerDidChangeRegionAnimated:](&v7, sel_mapLayerDidChangeRegionAnimated_);
  -[VKCameraDelegateMediatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_mapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityMapViewDidChangeRegionAnimated:", v3);

  }
}

@end
