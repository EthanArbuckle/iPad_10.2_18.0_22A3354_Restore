@implementation POIAnnotationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("POIAnnotation");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("POIAnnotation"), CFSTR("_subtext"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("POIAnnotation"), CFSTR("_compoundItem"), "PersonalizedCompoundItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PersonalizedCompoundItem"), CFSTR("items"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("DroppedPinMapItem"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKAnnotationView"), CFSTR("droppedPinTitle"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  objc_opt_class();
  -[POIAnnotationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_compoundItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v5, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        MEMORY[0x2349135AC](CFSTR("DroppedPinMapItem")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDDB028], "safeStringForKey:", CFSTR("droppedPinTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
