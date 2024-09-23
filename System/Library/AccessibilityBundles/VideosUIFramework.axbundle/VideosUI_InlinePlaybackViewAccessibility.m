@implementation VideosUI_InlinePlaybackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.InlinePlaybackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.InlinePlaybackView"), CFSTR("accessibilityPlaybackView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.InlinePlaybackView"), CFSTR("accessibilityImageView"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[VideosUI_InlinePlaybackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlaybackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_InlinePlaybackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
