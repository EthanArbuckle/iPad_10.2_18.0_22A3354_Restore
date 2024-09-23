@implementation MUPlaceRibbonItemViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceRibbonItemViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("hoursItemViewModelForMapItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("amenityItemViewForMapItem:amenityItemConfiguration:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("costItemViewForMapItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("factoidItemForFactoid:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("guidesItemViewModelForMapItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemViewModel"), CFSTR("ratingSubmissionStatusViewModelForRatingState:"), "@", "q", 0);

}

+ (id)hoursItemViewModelForMapItem:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v6, sel_hoursItemViewModelForMapItem_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("RibbonItemViewTypeKey"));

  return v3;
}

+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v7, sel_amenityItemViewForMapItem_amenityItemConfiguration_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("RibbonItemViewTypeKey"));

  return v4;
}

+ (id)costItemViewForMapItem:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v6, sel_costItemViewForMapItem_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("RibbonItemViewTypeKey"));

  return v3;
}

+ (id)factoidItemForFactoid:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v6, sel_factoidItemForFactoid_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("RibbonItemViewTypeKey"));

  return v3;
}

+ (id)guidesItemViewModelForMapItem:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v6, sel_guidesItemViewModelForMapItem_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("RibbonItemViewTypeKey"));

  return v3;
}

+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  objc_msgSendSuper2(&v6, sel_ratingSubmissionStatusViewModelForRatingState_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("RibbonItemViewTypeKey"));

  return v3;
}

@end
