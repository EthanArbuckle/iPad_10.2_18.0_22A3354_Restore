@implementation MKUserLocationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKUserLocation");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLocality
{
  return (id)-[MKUserLocationAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityDeterminedLocality"));
}

- (void)setLocation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKUserLocationAccessibility;
  -[MKUserLocationAccessibility setLocation:](&v7, sel_setLocation_, v4);
  if (v4 && UIAccessibilityIsVoiceOverRunning())
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBFA68]);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__MKUserLocationAccessibility_setLocation___block_invoke;
    v6[3] = &unk_2502509B8;
    v6[4] = self;
    objc_msgSend(v5, "reverseGeocodeLocation:completionHandler:", v4, v6);

  }
}

void __43__MKUserLocationAccessibility_setLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v15 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v15;
    if (v7)
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "thoroughfare");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locality");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v9 && v10)
      {
        if ((objc_msgSend(v9, "hasPrefix:", v10) & 1) != 0 || objc_msgSend(v9, "hasSuffix:", v10))
        {
          v13 = v11;
          v14 = CFSTR("__AXStringForVariablesSentinel");
        }
        else
        {
          v14 = v11;
          v13 = v10;
        }
        __UIAXStringForVariables();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AccessibilityDeterminedLocation"), v13, v14);

      }
      objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetRetainedValue:forKey:", v11, CFSTR("AccessibilityDeterminedLocality"));

      v6 = v15;
    }
  }

}

@end
