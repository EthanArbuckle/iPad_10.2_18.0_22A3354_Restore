@implementation AXUITextViewParagraphElement

double __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  id v5;
  id WeakRetained;
  uint64_t v7;
  double v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_msgSend(v5, "range");
  objc_msgSend(WeakRetained, "_accessibilityBoundsForRange:", v7, v1);
  v8 = v2;

  return v8;
}

uint64_t __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke_2(uint64_t a1)
{
  id v2;
  char v3;
  id WeakRetained;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (id)__UIAccessibilityCastAsSafeCategory();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = -[UITextViewAccessibility _accessibilityActivateLink:](v6, v2);

  return v3 & 1;
}

@end
