@implementation EMKOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EMKOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKOverlayView"), CFSTR("initWithView: anchorRect: emojiTokenList: selectionHandler:"), "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKEmojiTokenList"), CFSTR("emojiTokenArray"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("EMFEmojiToken"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMFEmojiToken"), CFSTR("string"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __57__EMKOverlayViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (EMKOverlayViewAccessibility)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  EMKOverlayViewAccessibility *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  double v27;
  void *v28;
  EMKEmojiOverlayElement *v29;
  unint64_t v30;
  void *v31;
  UIAccessibilityNotifications v32;
  void *v33;
  void *v34;
  void *v36;
  objc_super v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)EMKOverlayViewAccessibility;
  v16 = -[EMKOverlayViewAccessibility initWithView:anchorRect:emojiTokenList:selectionHandler:](&v37, sel_initWithView_anchorRect_emojiTokenList_selectionHandler_, v13, v14, v15, x, y, width, height);
  -[EMKOverlayViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_overlayRect"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rectValue");
  v19 = v18;
  v21 = v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilitySafeClass();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeValueForKey:", CFSTR("emojiTokenArray"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v14;
  if (objc_msgSend(v25, "count"))
  {
    v26 = 0;
    v27 = v21 + 6.0;
    do
    {
      objc_msgSend(v25, "objectAtIndex:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[EMKEmojiOverlayElement initWithAccessibilityContainer:]([EMKEmojiOverlayElement alloc], "initWithAccessibilityContainer:", v16);
      v30 = v26 + 1;
      -[EMKEmojiOverlayElement setRowRange:](v29, "setRowRange:", v26, objc_msgSend(v25, "count"));
      -[EMKEmojiOverlayElement setAccessibilityFrame:](v29, "setAccessibilityFrame:", v19 + (double)v26 * 36.0 + 10.0 + (double)(v26 + 1) * 4.0, v27, 36.0, 43.0);
      objc_msgSend(v28, "safeValueForKey:", CFSTR("string"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMKEmojiOverlayElement setAccessibilityLabel:](v29, "setAccessibilityLabel:", v31);
      objc_msgSend(v22, "addObject:", v29);

      v26 = v30;
    }
    while (objc_msgSend(v25, "count") > v30);
  }
  -[EMKOverlayViewAccessibility setAccessibilityElements:](v16, "setAccessibilityElements:", v22);
  v32 = *MEMORY[0x24BDF7328];
  -[EMKOverlayViewAccessibility accessibilityElements](v16, "accessibilityElements");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v32, v34);

  return v16;
}

- (void)setView:(id)a3 anchorRect:(CGRect)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EMKOverlayViewAccessibility;
  -[EMKOverlayViewAccessibility setView:anchorRect:](&v18, sel_setView_anchorRect_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  -[EMKOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_overlayRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;
  v9 = v8;

  -[EMKOverlayViewAccessibility accessibilityElements](self, "accessibilityElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    v13 = v9 + 6.0;
    do
    {
      v14 = v12 + 1;
      v15 = v7 + (double)v12 * 36.0 + 10.0 + (double)(unint64_t)(v12 + 1) * 4.0;
      -[EMKOverlayViewAccessibility accessibilityElements](self, "accessibilityElements");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setAccessibilityFrame:", v15, v13, 36.0, 43.0);
      v12 = v14;
    }
    while (v14 != v11);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
