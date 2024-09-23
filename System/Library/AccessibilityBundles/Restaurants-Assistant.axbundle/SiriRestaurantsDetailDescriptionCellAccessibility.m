@implementation SiriRestaurantsDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriRestaurantsDetailDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setPriceInfoWithRestaurant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SiriRestaurantsDetailDescriptionCellAccessibility;
  -[SiriRestaurantsDetailDescriptionCellAccessibility _setPriceInfoWithRestaurant:](&v18, sel__setPriceInfoWithRestaurant_, v4);
  objc_opt_class();
  -[SiriRestaurantsDetailDescriptionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_priceLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("attributedText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v16 = &unk_2329506BA;
  v17 = xmmword_232950530;
  v8 = objc_msgSend(v7, "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__SiriRestaurantsDetailDescriptionCellAccessibility__setPriceInfoWithRestaurant___block_invoke;
  v12[3] = &unk_25032B2E8;
  v12[4] = &v13;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSColor"), 0, v8, 0, v12);
  if (v14[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v9);
  }
  else
  {
    objc_msgSend(v7, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", v14[4], v14[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXPriceRangeDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v11);

  }
  _Block_object_dispose(&v13, 8);

}

uint64_t __81__SiriRestaurantsDetailDescriptionCellAccessibility__setPriceInfoWithRestaurant___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
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
