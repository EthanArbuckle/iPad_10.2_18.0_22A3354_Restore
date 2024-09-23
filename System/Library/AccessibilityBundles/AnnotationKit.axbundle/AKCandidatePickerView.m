@implementation AKCandidatePickerView

void __70__AKCandidatePickerView_iOSAccessibility__createButtonsWithBlurStyle___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(CFSTR("sketch.suggestion.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v8);

    objc_msgSend(v7, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityValue:", v9);

  }
}

@end
