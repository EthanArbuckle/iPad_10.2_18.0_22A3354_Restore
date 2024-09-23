@implementation MUPlaceRibbonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceRibbonItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceRibbonItemView"), CFSTR("_titleLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceRibbonItemView"), CFSTR("_valueLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlaceRibbonItemView"), CFSTR("viewModel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  -[MUPlaceRibbonItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityIntegerValueForKey:", CFSTR("RibbonItemViewTypeKey")) == 7)
  {
    v7.receiver = self;
    v7.super_class = (Class)MUPlaceRibbonItemViewAccessibility;
    v4 = (-[MUPlaceRibbonItemViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0]) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MUPlaceRibbonItemViewAccessibility;
    v4 = -[MUPlaceRibbonItemViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;

  -[MUPlaceRibbonItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceRibbonItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityIntegerValueForKey:", CFSTR("RibbonItemViewTypeKey")) == 2
    && objc_msgSend(v4, "containsString:", CFSTR("(")))
  {
    accessibilityLocalizedString(CFSTR("RATINGS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  __CFString *v38;

  -[MUPlaceRibbonItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityIntegerValueForKey:", CFSTR("RibbonItemViewTypeKey"));
  -[MUPlaceRibbonItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_valueLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceRibbonItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_valueLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v4)
  {
    case 2:
      objc_msgSend(v8, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsString:", CFSTR("%"));

      if ((v10 & 1) != 0)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("RECOMMEND"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v6, v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      objc_msgSend(v8, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "substringFromIndex:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");

      UIAXStarRatingStringForRating();
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 3:
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__0;
      v37 = __Block_byref_object_dispose__0;
      v38 = &stru_25026A470;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v8, "length");
        v15 = *MEMORY[0x24BDF65C0];
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke_2;
        v29[3] = &unk_25026A110;
        v29[4] = &v33;
        objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v29);
        objc_msgSend(v8, "string");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v34[5];
        v34[5] = v16;

      }
      v13 = (id)v34[5];
      goto LABEL_10;
    case 4:
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__0;
      v37 = __Block_byref_object_dispose__0;
      v38 = &stru_25026A470;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v8, "length");
        v19 = *MEMORY[0x24BDF6600];
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke;
        v30[3] = &unk_25026A0E8;
        v32 = &v33;
        v31 = v8;
        objc_msgSend(v31, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v18, 0, v30);

      }
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v34[5]);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x24BDFEC90];
      v21 = objc_msgSend((id)v34[5], "length");
      objc_msgSend(v13, "setAttribute:forKey:withRange:", MEMORY[0x24BDBD1C8], v20, 0, v21);
LABEL_10:

      _Block_object_dispose(&v33, 8);
      goto LABEL_19;
    case 7:
      v22 = objc_msgSend(v3, "_accessibilityIntegerValueForKey:", CFSTR("RibbonItemViewRatingStateKey"));
      if (v22 == 2)
      {
        v23 = CFSTR("LIKED");
      }
      else if (v22 == 1)
      {
        v23 = CFSTR("DISLIKED");
      }
      else
      {
        v23 = CFSTR("NOT RATED");
      }
      accessibilityLocalizedString(v23);
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v13 = (id)v26;

LABEL_19:
      v6 = v13;
      break;
    default:
      break;
  }

  return v6;
}

void __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x24BDF6950];
  v8 = a2;
  objc_msgSend(v7, "systemGrayColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringWithRange:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  MEMORY[0x234913928](CFSTR("NSTextAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

@end
