@implementation MediaControlsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsContainerView"), CFSTR("_timeControl"), "MediaControlsTimeControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsContainerView"), CFSTR("_transportStackView"), "MediaControlsTransportStackView");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[MediaControlsContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_transportStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
