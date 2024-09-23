@implementation VideosUI_MultiPlayerContainerEditOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MultiPlayerContainerEditOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_MultiPlayerContainerEditOverlayViewAccessibility;
  -[VideosUI_MultiPlayerContainerEditOverlayViewAccessibility setHidden:](&v3, sel_setHidden_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
