@implementation NSObject(BEAccessibility)

- (id)browserAccessibilityCurrentStatus
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityCurrentStatus);
}

- (void)setBrowserAccessibilityCurrentStatus:()BEAccessibility
{
  objc_setAssociatedObject(a1, &BrowserAccessibilityCurrentStatus, a3, (void *)1);
}

- (id)browserAccessibilitySortDirection
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySortDirection);
}

- (void)setBrowserAccessibilitySortDirection:()BEAccessibility
{
  objc_setAssociatedObject(a1, &BrowserAccessibilitySortDirection, a3, (void *)1);
}

- (id)_browserAccessibilityStoredValueSortDirection
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySortDirection);
}

- (id)browserAccessibilityRoleDescription
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityRoleDescription);
}

- (void)setBrowserAccessibilityRoleDescription:()BEAccessibility
{
  objc_setAssociatedObject(a1, &BrowserAccessibilityRoleDescription, a3, (void *)1);
}

- (uint64_t)browserAccessibilityIsRequired
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &BrowserAccessibilityIsRequired);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setBrowserAccessibilityIsRequired:()BEAccessibility
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityIsRequired, v2, (void *)1);

}

- (id)_browserAccessibilityStoredValueIsRequired
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityIsRequired);
}

- (uint64_t)browserAccessibilityHasDOMFocus
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setBrowserAccessibilityHasDOMFocus:()BEAccessibility
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus, v2, (void *)1);

}

- (id)_browserAccessibilityStoredValueHasDOMFocus
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus);
}

- (uint64_t)browserAccessibilityPressedState
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &BrowserAccessibilityPressedState);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setBrowserAccessibilityPressedState:()BEAccessibility
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityPressedState, v2, (void *)1);

}

- (id)_browserAccessibilityStoredValuePressedState
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityPressedState);
}

- (uint64_t)browserAccessibilityContainerType
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &BrowserAccessibilityContainerType);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)setBrowserAccessibilityContainerType:()BEAccessibility
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityContainerType, v2, (void *)1);

}

- (id)_browserAccessibilityStoredValueContainerType
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityContainerType);
}

- (uint64_t)browserAccessibilitySelectedTextRange
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeValue");

  return v2;
}

- (void)browserAccessibilitySetSelectedTextRange:()BEAccessibility
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange, v2, (void *)1);

}

- (id)_browserAccessibilityStoredValueSelectedTextRange
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange);
}

- (uint64_t)browserAccessibilityValueInRange:()BEAccessibility
{
  return 0;
}

- (uint64_t)browserAccessibilityAttributedValueInRange:()BEAccessibility
{
  return 0;
}

@end
