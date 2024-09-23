@implementation UIButtonAccessibility__AnnotationKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarViewController_iOS"), CFSTR("lineStyleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarViewController_iOS"), CFSTR("textStyleButton"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[6];
  char v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)UIButtonAccessibility__AnnotationKit__UIKit;
  -[UIButtonAccessibility__AnnotationKit__UIKit accessibilityLabel](&v35, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tag");

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = v5;
  v30 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v30 = 0;
    objc_opt_class();
    v29 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __65__UIButtonAccessibility__AnnotationKit__UIKit_accessibilityLabel__block_invoke;
    v28[3] = &unk_25014EFC0;
    v28[4] = self;
    v28[5] = &v31;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v28);

  }
  if (v5 == 764015 || (v13 = v32[3], v13 == 764015))
  {
    v14 = CFSTR("tool.intel.sketch.label");
LABEL_6:
    accessibilityLocalizedString(v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
    goto LABEL_7;
  }
  v14 = CFSTR("tool.var.sketch.label");
  if (v5 == 764016)
    goto LABEL_6;
  if (v13 == 764016)
    goto LABEL_6;
  v14 = CFSTR("tool.signature.label");
  if (v5 == 764019 || v13 == 764019)
    goto LABEL_6;
LABEL_7:
  if (!objc_msgSend(v3, "length"))
  {
    v30 = 0;
    objc_opt_class();
    -[UIButtonAccessibility__AnnotationKit__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("allTargets"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      abort();
    objc_msgSend(v17, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23490590C](CFSTR("AKToolbarViewController_iOS"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0;
      objc_opt_class();
      objc_msgSend(v18, "safeValueForKey:", CFSTR("lineStyleButton"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        abort();
      objc_msgSend(v20, "customView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0;
      objc_opt_class();
      objc_msgSend(v18, "safeValueForKey:", CFSTR("textStyleButton"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        abort();
      objc_msgSend(v23, "customView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "isEqual:", self))
      {
        accessibilityLocalizedString(CFSTR("stroke.thickness.button"));
        v25 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v25;
      }
      if (objc_msgSend(v24, "isEqual:", self))
      {
        accessibilityLocalizedString(CFSTR("text.attributes.button"));
        v26 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v26;
      }

    }
  }
  _Block_object_dispose(&v31, 8);
  return v3;
}

@end
