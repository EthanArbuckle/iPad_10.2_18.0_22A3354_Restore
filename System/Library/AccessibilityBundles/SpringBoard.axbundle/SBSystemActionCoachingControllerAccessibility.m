@implementation SBSystemActionCoachingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemActionCoachingController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemActionCoachingController"), CFSTR("systemActionCoachingHUDViewController:didBeginTransitionToState:"), "v", "@", "q", 0);
}

- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSystemActionCoachingControllerAccessibility;
  -[SBSystemActionCoachingControllerAccessibility systemActionCoachingHUDViewController:didBeginTransitionToState:](&v15, sel_systemActionCoachingHUDViewController_didBeginTransitionToState_, v6, a4);
  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_coachingLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a4 - 1) <= 1 && v8)
  {
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      accessibilityLocalizedString(CFSTR("word.separator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x24BDD1458]);
      v16 = *MEMORY[0x24BDFEAD8];
      v17[0] = *MEMORY[0x24BDF7300];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v13);

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v14);
      v9 = (void *)v11;
    }

  }
}

@end
