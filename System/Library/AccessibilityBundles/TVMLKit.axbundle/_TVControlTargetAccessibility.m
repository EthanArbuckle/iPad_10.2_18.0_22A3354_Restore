@implementation _TVControlTargetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVControlTarget");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("_TVControlTarget"), CFSTR("addTargetInControl:withViewElement:"), "v", "@", "@", 0);
}

+ (void)addTargetInControl:(id)a3 withViewElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS____TVControlTargetAccessibility;
  v7 = a4;
  objc_msgSendSuper2(&v13, sel_addTargetInControl_withViewElement_, v6, v7);
  objc_msgSend(v7, "dataDictionary", v13.receiver, v13.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("click"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeStringForKey:", CFSTR("targetType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityRetrieveLabelForSource(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AXTVMLKitAccessibilityTextOverrideKey"));

}

@end
