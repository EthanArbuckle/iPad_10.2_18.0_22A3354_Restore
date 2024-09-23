@implementation _MKUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKUILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("_MKUILabel"), CFSTR("UILabel"));
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;
  char v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_MKUILabelAccessibility;
  -[_MKUILabelAccessibility accessibilityLabel](&v19, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v18 = 0;
    objc_opt_class();
    -[_MKUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedText"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDFEA60];
      objc_msgSend(v6, "accessibilityLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
    }
    else
    {
      v14 = objc_msgSend(v7, "length");
      v15 = (void *)MEMORY[0x24BDFEA60];
      if (v14)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithStringOrAttributedString:", v6);
        goto LABEL_8;
      }
      v17.receiver = self;
      v17.super_class = (Class)_MKUILabelAccessibility;
      -[_MKUILabelAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
    }
    objc_msgSend(v12, "axAttributedStringWithString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("·"), CFSTR(", "));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v4 = v3;
LABEL_9:

  return v4;
}

@end
