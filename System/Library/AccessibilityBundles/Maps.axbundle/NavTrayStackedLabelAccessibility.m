@implementation NavTrayStackedLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavTrayStackedLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayStackedLabel"), CFSTR("topLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayStackedLabel"), CFSTR("bottomLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;

  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v3, "setNumberStyle:", 1);
  -[NavTrayStackedLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ETA"));

  if (v5)
  {
    -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v14 = v8;
    objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB00]);
    -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  -[NavTrayStackedLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RemainingTime"));

  if (!v10)
  {
    -[NavTrayStackedLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("RemainingDistance"));

    if (v18)
    {
      -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topLabel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "string");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = v7;
      }
      v14 = v20;
      objc_msgSend(v3, "numberFromString:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomLabel"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "text");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "accessibilityIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v36 = (void *)MEMORY[0x24BDD17C8];
        AXLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringWithFormat:", v16, v33);
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v27 = (void *)v37;

        goto LABEL_28;
      }

    }
    goto LABEL_25;
  }
  -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "string");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v12;
  }
  v21 = v13;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":-."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "rangeOfCharacterFromSet:", v22) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "numberFromString:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "intValue");

    if (v25)
    {
      v28 = (void *)MEMORY[0x24BDD17C8];
      AXLocalizedString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v29, v27);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 1;
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB30]);
    v30 = 1;
  }

  if (!v30)
  {
LABEL_25:
    -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NavTrayStackedLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
    __UIAXStringForVariables();
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
LABEL_28:

  return v27;
}

@end
