@implementation PHVoicemailGreetingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVoicemailGreetingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailGreetingViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailGreetingViewController"), CFSTR("sliderCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHVoicemailGreetingSliderCell"), CFSTR("_timelineSlider"), "VMPlayerTimelineSlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailGreetingSliderCell"), CFSTR("progressView"), "@", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailGreetingViewControllerAccessibility;
  -[PHVoicemailGreetingViewControllerAccessibility viewDidLoad](&v7, sel_viewDidLoad);
  -[PHVoicemailGreetingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sliderCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("_timelineSlider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("GreetingSlider"));

  objc_msgSend(v4, "safeValueForKey:", CFSTR("_progressView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

}

@end
