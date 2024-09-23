@implementation SearchResultTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SearchResultTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_secondLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_secondPartLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_thirdLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_contextualInformationLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_mapItem"), "MKMapItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SearchResultTableViewCell"), CFSTR("_transitInfoLabel"), "MKTransitInfoLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SearchResultTableViewCell"), CFSTR("ratingsAttributedString"), "@", 0);

}

- (id)_axRatingDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  const __CFString *v15;
  uint64_t v16;

  -[SearchResultTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "_hasUserRatingScore");
  objc_msgSend(v3, "_normalizedUserRatingScore");
  if ((_DWORD)v2)
  {
    UIAXStarRatingStringForRating();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "_reviewsAttribution", v14, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "_sampleSizeForUserRatingScore");
  v8 = objc_msgSend(v6, "length");
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (v8)
  {
    AXMapsLocString(CFSTR("REVIEWS_COUNT_WITH_PROVIDER_FORMAT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v7, v6);
  }
  else
  {
    AXMapsLocString(CFSTR("REVIEWS_COUNT_FORMAT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v7, v16);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  SearchResultTableViewCellAccessibility *v24;
  id v25;
  char v26;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_secondLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_secondPartLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_thirdLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_transitInfoLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_contextualInformationLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SearchResultTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ratingsAttributedString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  objc_opt_class();
  -[SearchResultTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_priceRangeString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__SearchResultTableViewCellAccessibility_accessibilityLabel__block_invoke;
  v22[3] = &unk_250259230;
  v23 = v13;
  v24 = self;
  v25 = v16;
  v17 = v16;
  v18 = v13;
  objc_msgSend(v10, "ax_flatMappedArrayUsingBlock:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135DC]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __60__SearchResultTableViewCellAccessibility_accessibilityLabel__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[4], "length"))
    {
      v6 = objc_msgSend(v5, "rangeOfString:", a1[4]);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v6;
        v9 = v7;
        objc_msgSend(a1[5], "_axRatingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v8, v9, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }
    }
    if (objc_msgSend(a1[6], "length"))
    {
      v12 = objc_msgSend(v5, "rangeOfString:", a1[6]);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = v12;
        v15 = v13;
        UIAXPriceRangeDescription();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v14, v15, v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v17;
      }
    }
    AXStringByReplacingMiddleDots(v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
