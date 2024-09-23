@implementation TUICandidateGroupHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUICandidateGroupHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUICandidateGroupHeader"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TUICandidateGroupHeaderAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFString *)objc_msgSend(v2, "mutableCopy");
  if (!CFStringTransform(v3, 0, CFSTR("[:Block=Kangxi_Radicals:] NFKC"), 0))
    _AXAssert();
  v4 = v3;
  v5 = v4;
  if (!-[__CFString length](v4, "length"))
  {
    v5 = v2;

  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityHeaderElements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
