@implementation CKLinkBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLinkBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLinkBalloonView"), CFSTR("linkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("tapGestureRecognized:"), "v", "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[CKLinkBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("linkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKLinkBalloonViewAccessibility;
    -[CKLinkBalloonViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __55__CKLinkBalloonViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tapGestureRecognized:", 0);
}

@end
