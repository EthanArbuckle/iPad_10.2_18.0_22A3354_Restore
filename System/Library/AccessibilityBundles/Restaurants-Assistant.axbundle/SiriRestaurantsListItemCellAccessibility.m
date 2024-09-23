@implementation SiriRestaurantsListItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriRestaurantsListItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_distanceLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_addressLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_tableTimesLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_categoriesLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_reviewsLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_priceLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriRestaurantsListItemCell"), CFSTR("_starsView"), "SiriUIStarsView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;

  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_priceLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3010000000;
  v30 = &unk_2329506BA;
  v31 = xmmword_232950530;
  v4 = objc_msgSend(v3, "length");
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __62__SiriRestaurantsListItemCellAccessibility_accessibilityLabel__block_invoke;
  v26[3] = &unk_25032B2E8;
  v26[4] = &v27;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSColor"), 0, v4, 0, v26);
  v18 = v3;
  objc_msgSend(v3, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28[4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v25, "stringByReplacingCharactersInRange:withString:", v5, v28[5], &stru_25032B3D8);
    v6 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v6;
  }
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessibilityLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_distanceLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_addressLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_categoriesLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableTimesLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_starsView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriRestaurantsListItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reviewsLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v27, 8);
  return v15;
}

uint64_t __62__SiriRestaurantsListItemCellAccessibility_accessibilityLabel__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a2)
  {
    *a5 = 1;
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
  }
  return result;
}

@end
