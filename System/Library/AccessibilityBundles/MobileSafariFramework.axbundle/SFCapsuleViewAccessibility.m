@implementation SFCapsuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCapsuleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFCapsuleCollectionView"), CFSTR("_items"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFCapsuleCollectionView"), CFSTR("_selectedItemIndex"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleCollectionViewItem"), CFSTR("capsuleView"), "@", 0);

}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  char isKindOfClass;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  SFCapsuleViewAccessibility *v10;

  -[SFCapsuleViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491571C](CFSTR("SFCapsuleCollectionView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491571C](CFSTR("TabGroupSwitcherViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "safeArrayForKey:", CFSTR("_items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("_selectedItemIndex"));
    v6 = 0;
    if (v8 < objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("capsuleView"));
      v10 = (SFCapsuleViewAccessibility *)objc_claimAutoreleasedReturnValue();

      if (v10 != self)
        v6 = 1;
    }

  }
  return v6;
}

@end
