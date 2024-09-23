@implementation UIViewControllerAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIViewControllerAccessibility__MusicApplication__UIKit;
  -[UIViewControllerAccessibility__MusicApplication__UIKit viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didChangeVoiceOverOrSwitchControlStatus_, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didChangeVoiceOverOrSwitchControlStatus_, *MEMORY[0x24BDF7380], 0);

  -[UIViewControllerAccessibility__MusicApplication__UIKit didChangeVoiceOverOrSwitchControlStatus:](self, "didChangeVoiceOverOrSwitchControlStatus:", 0);
}

- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_opt_class();
  -[UIViewControllerAccessibility__MusicApplication__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", v7);

}

@end
