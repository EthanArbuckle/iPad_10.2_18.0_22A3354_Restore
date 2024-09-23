@implementation PXPeopleStripCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleStripCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleStripCollectionViewCell"), CFSTR("people"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPerson"), CFSTR("displayName"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  objc_opt_class();
  -[PXPeopleStripCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("people"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (!v6)
  {

LABEL_11:
    accessibilityPhotosUICoreLocalizedString(CFSTR("people.name.unknown"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "safeStringForKey:", CFSTR("displayName"), v13, v14, (_QWORD)v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v13, CFSTR("__AXStringForVariablesSentinel"));
  }
  while (v7);

  if (!v8)
    goto LABEL_11;
LABEL_12:

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
