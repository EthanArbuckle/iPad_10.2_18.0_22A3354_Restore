@implementation TUICandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUICandidateCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TUICandidateGroupHeader"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TUICandidateCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUICandidateCell"), CFSTR("candidate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("_accessibilityIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UIKeyboardCandidateController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("isExtended"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  BOOL v3;

  -[TUICandidateCellAccessibility _axCandidateText](self, "_axCandidateText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBAEA8];
}

- (id)_axCandidateText
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TUICandidateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("candidate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateCellAccessibility _axCandidateText](self, "_axCandidateText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionOfWord:forLanguage:", v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length", v11, CFSTR("__AXStringForVariablesSentinel")))
  {
    v9 = v6;

    v8 = v9;
  }

  return v8;
}

- (id)accessibilityHeaderElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[TUICandidateCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[TUICandidateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityIndexPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementaryViewForElementKind:atIndexPath:", CFSTR("GroupHeader"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  MEMORY[0x2349226DC](CFSTR("TUICandidateGroupHeader"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    AXLogAppAccessibility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TUICandidateCellAccessibility accessibilityHeaderElements].cold.1((uint64_t)v7, v9);

    goto LABEL_7;
  }
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v8;
}

- (BOOL)_axCellIsVisibleInCollectionView
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend((id)MEMORY[0x2349226DC](CFSTR("UIKeyboardCandidateController"), a2), "safeValueForKey:", CFSTR("sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isExtended"));

  if ((v4 & 1) != 0)
    return 1;
  -[TUICandidateCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[TUICandidateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityIndexPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  objc_msgSend(v9, "frame");
  v5 = v11 < v12;

  return v5;
}

- (void)accessibilityHeaderElements
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232AFD000, a2, OS_LOG_TYPE_ERROR, "Unexpected class for candidate group header: %@", (uint8_t *)&v2, 0xCu);
}

@end
