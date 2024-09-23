@implementation MFMailComposeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMailComposeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("_searchResultsTable"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_toField"), "MFMailComposeToField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_ccField"), "MFMailComposeRecipientTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_bccField"), "MFMailComposeRecipientTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_fromField"), "MFComposeFromView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_subjectField"), "MFComposeSubjectView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_headerView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("composeWebView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeRecipientTextView"), CFSTR("_textView"), "_CNAtomTextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("presentSearchResults:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("composeViewDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_imageSizeField"), "MFComposeImageSizeView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("dropTarget:dragEnteredAtPoint:"), "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("dropTarget:dragDidMoveToPoint:"), "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("dragSource:draggableItemsAtPoint:"), "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("_placeholderAttachmentRange"), "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMailComposeToField"), CFSTR("MFMailComposeRecipientTextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFMailComposeRecipientTextView"), CFSTR("CNComposeRecipientTextView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeRecipientTextView"), CFSTR("_labelView"), "CNComposeHeaderLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("placeholderAttachment"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("recipients"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MFDropTarget"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("addButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFDropTarget"), CFSTR("targetView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("uncommentedAddress"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WKContentView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  -[MFMailComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("toField"));
  -[MFMailComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ccField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ccField"));
  -[MFMailComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bccField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_textView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("bccField"));
  -[MFMailComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchResultsTable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("MessageRecipientSearchTable"));

  -[MFMailComposeViewAccessibility _accessibilityComposeElementsForSorting](self, "_accessibilityComposeElementsForSorting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "_accessibilitySetUsesScrollParentForOrdering:", 0);
        objc_msgSend(v15, "_enumerateDescendentViews:", &__block_literal_global_2);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }

}

uint64_t __76__MFMailComposeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySetUsesScrollParentForOrdering:", 0);
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  -[MFMailComposeViewAccessibility _accessibilityComposeElementsForSorting](self, "_accessibilityComposeElementsForSorting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v31 = objc_msgSend(v8, "indexOfObject:", v6);
  if (v29[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke;
    v25[3] = &unk_24FEFA000;
    v27 = &v28;
    v26 = v8;
    v9 = (id)objc_msgSend(v6, "_accessibilityFindAncestor:startWithSelf:", v25, 0);

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v24 = objc_msgSend(v8, "indexOfObject:", v7);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke_2;
    v18 = &unk_24FEFA000;
    v20 = &v21;
    v19 = v8;
    v10 = (id)objc_msgSend(v7, "_accessibilityFindAncestor:startWithSelf:", &v15, 0);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v29[3], v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

BOOL __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __73__MFMailComposeViewAccessibility__accessibilityCompareElement_toElement___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_accessibilityComposeElementsForSorting
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
  id v15;
  id v16;
  void *v17;
  void *v18;

  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_toField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)MEMORY[0x24BDBCE30];
  v17 = v3;
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_textView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("addButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_ccField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bccField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_fromField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_imageSizeField"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_subjectField"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("composeWebView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilityFindSubviewDescendant:", &__block_literal_global_264);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_searchResultsTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 10, v18, v4, v5, v6, v7, v8, v9, v10, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __73__MFMailComposeViewAccessibility__accessibilityComposeElementsForSorting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("WKContentView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (MFMailComposeViewAccessibility)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5
{
  MFMailComposeViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeViewAccessibility;
  v5 = -[MFMailComposeViewAccessibility initWithFrame:options:isQuickReply:](&v7, sel_initWithFrame_options_isQuickReply_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFMailComposeViewAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

- (id)_searchResultsTable
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility _searchResultsTable](&v4, sel__searchResultsTable);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("MessageRecipientSearchTable"));
  return v2;
}

- (BOOL)presentSearchResults:(id)a3
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeViewAccessibility;
  v3 = -[MFMailComposeViewAccessibility presentSearchResults:](&v5, sel_presentSearchResults_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility scrollViewDidScroll:](&v3, sel_scrollViewDidScroll_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  char v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12 = 0;
  objc_opt_class();
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility dragSource:draggableItemsAtPoint:](&v11, sel_dragSource_draggableItemsAtPoint_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    abort();
  if (v9)
    -[MFMailComposeViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("_axDragItems"));

  return v9;
}

- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIAccessibilityNotifications v19;
  void *v20;
  objc_super v21;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility dropTarget:dragEnteredAtPoint:](&v21, sel_dropTarget_dragEnteredAtPoint_, v7, x, y);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("targetView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("MFMailComposeRecipientTextView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_labelView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("dragged.address.to"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v17, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = *MEMORY[0x24BDF71E8];
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v18);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailComposeViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v20, CFSTR("_axDragEnteredDate"));

      }
      else
      {
        v19 = *MEMORY[0x24BDF71E8];
      }
      UIAccessibilityPostNotification(v19, (id)*MEMORY[0x24BDFEE28]);

    }
  }

}

- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  UIAccessibilityNotifications v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MFMailComposeViewAccessibility;
  -[MFMailComposeViewAccessibility dropTarget:dragDidMoveToPoint:](&v39, sel_dropTarget_dragDidMoveToPoint_, v7, x, y);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("targetView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("MFMailComposeRecipientTextView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v8, "safeValueForKey:", CFSTR("placeholderAttachment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_30:

      goto LABEL_31;
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x3010000000;
    v38 = 0;
    v36 = &unk_230B9550F;
    v37 = 0;
    v32 = v8;
    AXPerformSafeBlock();
    v10 = v34[4];

    _Block_object_dispose(&v33, 8);
    -[MFMailComposeViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_axDragItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safeValueForKey:", CFSTR("recipients"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MFMailComposeViewAccessibility _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("_axDragPlaceholderIndex"));
    if (objc_msgSend(v11, "count") && v10 != 0x7FFFFFFFFFFFFFFFLL && v10 != v13)
    {
      -[MFMailComposeViewAccessibility _accessibilitySetIntegerValue:forKey:](self, "_accessibilitySetIntegerValue:forKey:", v10, CFSTR("_axDragPlaceholderIndex"));
      objc_msgSend(v11, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MFMailComposeViewAccessibility _axIndexOfRecipient:inArray:](self, "_axIndexOfRecipient:inArray:", v14, v12);

      v16 = objc_msgSend(v11, "count");
      v17 = v15 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v15;
      v18 = v15 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v16;
      if (objc_msgSend(v12, "count"))
      {
        if (v10 <= v17 + v18)
        {
          if (v10)
            v22 = 0;
          else
            v22 = v15 == 0x7FFFFFFFFFFFFFFFLL;
          if (v22 || v10 < v17)
          {
            objc_msgSend(v12, "objectAtIndex:", v10);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x24BDD17C8];
            v21 = CFSTR("moved.address.before");
LABEL_23:
            accessibilityLocalizedString(v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "safeValueForKey:", CFSTR("displayString"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              -[MFMailComposeViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_axDragEnteredDate"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v26
                && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v27, "timeIntervalSinceDate:", v26),
                    v29 = v28,
                    v27,
                    v29 <= 1.0))
              {
                v30 = *MEMORY[0x24BDF71E8];
              }
              else
              {
                v30 = *MEMORY[0x24BDF71E8];
                UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v25);
                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[MFMailComposeViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v31, CFSTR("_axDragEnteredDate"));

              }
              UIAccessibilityPostNotification(v30, (id)*MEMORY[0x24BDFEE28]);

            }
          }
        }
        else if (v10 <= objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "objectAtIndex:", v10 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BDD17C8];
          v21 = CFSTR("moved.address.after");
          goto LABEL_23;
        }
      }
    }

    goto LABEL_30;
  }
LABEL_32:

}

uint64_t __64__MFMailComposeViewAccessibility_dropTarget_dragDidMoveToPoint___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "_placeholderAttachmentRange");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = v4;
  return result;
}

- (unint64_t)_axIndexOfRecipient:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  Class v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  Class v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = NSClassFromString(CFSTR("MFComposeRecipient"));
  v8 = objc_msgSend(v6, "count");
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v8 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__MFMailComposeViewAccessibility__axIndexOfRecipient_inArray___block_invoke;
    v11[3] = &unk_24FEFA048;
    v14 = v7;
    v12 = v5;
    v13 = &v15;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
    v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

void __62__MFMailComposeViewAccessibility__axIndexOfRecipient_inArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "safeStringForKey:", CFSTR("uncommentedAddress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "safeStringForKey:", CFSTR("uncommentedAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

@end
