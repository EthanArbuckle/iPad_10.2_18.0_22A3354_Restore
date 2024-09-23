@implementation SiriRestaurantsOpenHoursCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriRestaurantsOpenHoursCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configureWithParsedOpenHoursInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsOpenHoursCellAccessibility;
  -[SiriRestaurantsOpenHoursCellAccessibility configureWithParsedOpenHoursInfo:](&v9, sel_configureWithParsedOpenHoursInfo_, a3);
  -[SiriRestaurantsOpenHoursCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayRangeLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsOpenHoursCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_hoursLabelPerRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 == objc_msgSend(v5, "count"))
    {
      v7 = v4;
      v8 = v5;
      AXPerformSafeBlock();

    }
  }

}

void __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_2;
  v2[3] = &unk_25032B390;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 2)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    restaurantAccessibilityLocalizedString(CFSTR("daterange.join"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v10, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_1);
  objc_msgSend(v5, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v14, v15, CFSTR("__AXStringForVariablesSentinel"));

}

uint64_t __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAccessibilityElement:", 0);
}

@end
