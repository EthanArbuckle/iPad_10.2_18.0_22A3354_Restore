@implementation MTAVPlayerTOCViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAVPlayerTOCViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTAVPlayerTOCViewControllerAccessibility;
  v7 = a4;
  v8 = a3;
  -[MTAVPlayerTOCViewControllerAccessibility configureCell:withObject:atIndexPath:](&v12, sel_configureCell_withObject_atIndexPath_, v8, v7, a5);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("durationLabel"), v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeValueForKey:", CFSTR("duration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  AXDurationStringForDuration();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v11);

}

@end
