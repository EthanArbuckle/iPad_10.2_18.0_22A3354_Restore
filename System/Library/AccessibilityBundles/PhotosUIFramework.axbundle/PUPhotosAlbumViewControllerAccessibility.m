@implementation PUPhotosAlbumViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotosAlbumViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotosAlbumViewControllerAccessibility;
  -[PUPhotosAlbumViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (UIAccessibilityIsSwitchControlRunning())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
