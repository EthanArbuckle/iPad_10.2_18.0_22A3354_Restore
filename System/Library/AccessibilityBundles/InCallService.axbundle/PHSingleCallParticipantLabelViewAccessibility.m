@implementation PHSingleCallParticipantLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSingleCallParticipantLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHSingleCallParticipantLabelView"), CFSTR("_statusLabel"), "UILabel");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHSingleCallParticipantLabelViewAccessibility;
  -[PHSingleCallParticipantLabelViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[PHSingleCallParticipantLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  v5 = *MEMORY[0x24BDF7430] | v4;

  -[PHSingleCallParticipantLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", v5);

  LOBYTE(location) = 0;
  objc_opt_class();
  -[PHSingleCallParticipantLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__PHSingleCallParticipantLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_2502450B0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __91__PHSingleCallParticipantLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("((\\d{1,2}:)?\\d{2}:\\d{2})"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "range");
    v8 = v7;

    if (v8 > 5)
    {
      v17 = *MEMORY[0x24BDFEB30];
      v18 = MEMORY[0x24BDBD1C8];
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = &v18;
      v11 = &v17;
    }
    else
    {
      v19 = *MEMORY[0x24BDFEB38];
      v20[0] = MEMORY[0x24BDBD1C8];
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v20;
      v11 = &v19;
    }
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "range");
    objc_msgSend(v5, "setAttributes:withRange:", v12, v14, v15);

  }
  else
  {
    v5 = v2;
  }

  return v5;
}

@end
