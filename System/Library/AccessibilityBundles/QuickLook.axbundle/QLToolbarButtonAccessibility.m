@implementation QLToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLToolbarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLToolbarButton"), CFSTR("barButtonWithTarget: action: maxSize:"), "@", "@", ":", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLToolbarButton"), CFSTR("identifier"), "@", 0);

}

- (id)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  __CFString *(*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)QLToolbarButtonAccessibility;
  -[QLToolbarButtonAccessibility barButtonWithTarget:action:maxSize:](&v26, sel_barButtonWithTarget_action_maxSize_, v9, a4, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLToolbarButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("QLInlineMarkup")) & 1) == 0
    && !objc_msgSend(v13, "isEqualToString:", CFSTR("QLOverlayMarkupButtonAccessibilityIdentifier")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("QLMarkupRedo")))
    {
      v15 = CFSTR("redo.button");
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("QLMarkupUndo")))
    {
      v15 = CFSTR("undo.button");
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("QLMarkupUndoAll")))
    {
      v15 = CFSTR("undo.all.button");
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("QLMediaItemViewControllerBarTrimButtonAccessibilityIdentifier")))
    {
      v15 = CFSTR("ql.trim");
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("QLMediaItemViewControllerBarRotateRightButtonAccessibilityIdentifier")))goto LABEL_15;
      v15 = CFSTR("ql.rotate.right");
    }
    accessibilityLocalizedString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLToolbarButtonAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v16);

    goto LABEL_15;
  }
  accessibilityLocalizedString(CFSTR("markup.button"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLToolbarButtonAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v14);

  objc_initWeak(&location, self);
  objc_msgSend(v10, "_setAccessibilityTraitsBlock:", &__block_literal_global_0);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke_2;
  v23 = &unk_24FF21C70;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v10, "_setAccessibilityValueBlock:", &v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_15:
  -[QLToolbarButtonAccessibility accessibilityLabel](self, "accessibilityLabel", v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v17);

  -[QLToolbarButtonAccessibility accessibilityLabel](self, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v18);

  return v10;
}

uint64_t __67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke()
{
  return *MEMORY[0x24BEBB1A8];
}

__CFString *__67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("selected")))
    v2 = CFSTR("1");
  else
    v2 = CFSTR("0");
  v3 = v2;

  return v3;
}

@end
