@implementation UIWebDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebDocumentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_zoomToCenter: scale: duration:"), "v", "{CGPoint=dd}", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("_focusedOrMainFrame"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("_zoomedDocumentScale"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("approximateNodeAtViewportLocation:"), "@", "^{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("clearSelection"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("didEndZoom"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("didZoom"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("hasEditableSelection"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("hasSelection"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("inputDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("keyboardInputShouldDelete:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("maximumScale"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("minimumScale"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("redrawScaledDocument"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("setSelectedDOMRange: affinity:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("stopLoading:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("textInputTraits"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("toggleBoldface:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("toggleItalics:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("toggleUnderline:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("updatesScrollView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("webView: didFinishLoadForFrame:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("webView: willShowFullScreenForPlugInView:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("willStartZoom"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebDocumentView"), CFSTR("handleKeyWebEvent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebDocumentView"), CFSTR("_documentScale"), "f");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebDocumentView"), CFSTR("_plugInViews"), "^{__CFDictionary=}");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebDocumentView"), CFSTR("_webView"), "WebView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIWebDocumentView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("UIWebDocumentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("WebView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibleSubviews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOMNode"), CFSTR("handleKeyWebEvent:"), "v", "@", 0);

}

- (void)stopLoading:(id)a3
{
  UIAccessibilityNotifications v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility stopLoading:](&v6, sel_stopLoading_, a3);
  v3 = *MEMORY[0x24BEBB1F8];
  LODWORD(v4) = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  UIAccessibilityNotifications v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility webView:didFailLoadWithError:forFrame:](&v8, sel_webView_didFailLoadWithError_forFrame_, a3, a4, a5);
  v5 = *MEMORY[0x24BEBB1F8];
  LODWORD(v6) = -1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v5, v7);

}

- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4
{
  UIAccessibilityNotifications v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility webView:willShowFullScreenForPlugInView:](&v7, sel_webView_willShowFullScreenForPlugInView_, a3, a4);
  v4 = *MEMORY[0x24BEBB1F8];
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility setSelectedDOMRange:affinity:](&v4, sel_setSelectedDOMRange_affinity_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
}

- (void)copy:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility copy:](&v4, sel_copy_, a3);
  -[UIWebDocumentViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF018]);
}

- (void)cut:(id)a3
{
  uint64_t v4;
  id v5;
  objc_super v6;

  v4 = *MEMORY[0x24BDFF018];
  v5 = a3;
  -[UIWebDocumentViewAccessibility _accessibilityIgnoreNextPostPasteboardTextOperation:](self, "_accessibilityIgnoreNextPostPasteboardTextOperation:", v4);
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility cut:](&v6, sel_cut_, v5);

  -[UIWebDocumentViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF020]);
}

- (void)paste:(id)a3
{
  uint64_t v4;
  id v5;
  objc_super v6;

  v4 = *MEMORY[0x24BDFF060];
  v5 = a3;
  -[UIWebDocumentViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", v4);
  v6.receiver = self;
  v6.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility paste:](&v6, sel_paste_, v5);

}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility selectAll:](&v5, sel_selectAll_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)toggleBoldface:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility toggleBoldface:](&v5, sel_toggleBoldface_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)toggleItalics:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility toggleItalics:](&v5, sel_toggleItalics_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)toggleUnderline:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility toggleUnderline:](&v5, sel_toggleUnderline_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)_axZoomToCenterWithScale:(CGPoint)a3 scale:(double)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enclosingScrollView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "safeBoolForKey:", CFSTR("isZoomEnabled")))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebDocumentViewAccessibility willZoomToLocation:atScale:forDuration:](self, "willZoomToLocation:atScale:forDuration:", x, y, a4, 0.1);
    v10 = v9;
    AXPerformSafeBlock();

  }
}

uint64_t __65__UIWebDocumentViewAccessibility__axZoomToCenterWithScale_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_zoomToCenter:scale:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), 0.1);
}

- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  double v28;
  UIAccessibilityNotifications v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  WebThreadLock();
  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enclosingScrollView"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v34, "safeValueForKey:", CFSTR("_zoomScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_documentScale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimumScale"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maximumScale"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;

  v24 = v20 / v17;
  v25 = v23 / v17;
  v26 = (float)((float)(v23 / v17) + -1.0) / 10.0;
  if (v14 < 1.0)
    v26 = (float)(1.0 - (float)(v20 / v17)) / 5.0;
  v27 = v26;
  if (!v4)
    v27 = -v27;
  v28 = v27 + v14;
  if (v28 < v24)
    v28 = v24;
  if (v28 > v25)
    v28 = v25;
  -[UIWebDocumentViewAccessibility _axZoomToCenterWithScale:scale:](self, "_axZoomToCenterWithScale:scale:", v9, v11, v28);
  v29 = *MEMORY[0x24BDF71E8];
  v30 = (void *)MEMORY[0x24BDD17C8];
  UIKitAccessibilityLocalizedString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v29, v33);

  UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  -[UIWebDocumentViewAccessibility _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 1, a3.x, a3.y);
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  -[UIWebDocumentViewAccessibility _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 0, a3.x, a3.y);
  return 1;
}

- (void)setSelectedTextRange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility setSelectedTextRange:](&v3, sel_setSelectedTextRange_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
}

- (BOOL)_accessibilityHasTextOperations
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hasSelection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)-[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibleSubviews"));
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  double v19;
  void *v20;
  void *v21;
  UIWebDocumentViewAccessibility *v22;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility webView:didFinishLoadForFrame:](&v23, sel_webView_didFinishLoadForFrame_, a3, v6);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!webView_didFinishLoadForFrame__appsOKToPost)
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.Preferences"), 0);
    v9 = (void *)webView_didFinishLoadForFrame__appsOKToPost;
    webView_didFinishLoadForFrame__appsOKToPost = v8;

  }
  objc_msgSend(v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isFileURL"))
  {

  }
  else
  {
    objc_msgSend(v6, "dataSource");
    v22 = self;
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("about:blank"));

    v7 = v13;
    if ((v18 & 1) == 0)
    {
      -[UIWebDocumentViewAccessibility bounds](v22, "bounds");
      if (v19 >= 100.0)
      {
        -[UIWebDocumentViewAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("superview"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if (objc_msgSend((id)webView_didFinishLoadForFrame__appsOKToPost, "containsObject:", v13))
          {
            objc_msgSend(v6, "parentFrame");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
              UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], 0);
          }
        }
      }
    }
  }

}

- (id)_accessibilityEquivalenceTag
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
}

- (BOOL)_accessibilityScrollingEnabled
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityScrollingEnabled");

  return v3;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  const __CFString *Category;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  const __CFString *Type;
  BOOL v18;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;

  WebThreadLock();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v22) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySceneReferencePointToScreenPoint();
    objc_msgSend(v5, "convertPoint:fromWindow:", 0);
    objc_msgSend(v5, "convertPoint:toView:", v4);
    v7 = v6;
    v9 = v8;
    v26 = v6;
    v27 = v8;
    -[UIWebDocumentViewAccessibility approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Category = 0;
    if (vabdd_f64(v9, v27) <= 2.0)
    {
      if (vabdd_f64(v7, v26) > 2.0)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      if (!NSClassFromString(CFSTR("DDDetectionController")))
        goto LABEL_13;
      objc_msgSend(v10, "absoluteLinkURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("x-apple-data-detectors:"));

      if (!v14)
        goto LABEL_13;
      -[objc_class sharedController](NSClassFromString(CFSTR("DDDetectionController")), "sharedController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v16 = v15;
      v21 = v10;
      AXPerformSafeBlock();
      if (v23[3])
      {
        Category = (const __CFString *)DDResultGetCategory();
        Type = (const __CFString *)DDResultGetType();
        switch((int)Category)
        {
          case 1:
            v18 = 0;
            Category = CFSTR("http");
            break;
          case 2:
            v18 = 0;
            Category = CFSTR("tel");
            break;
          case 3:
            v18 = 0;
            Category = CFSTR("address");
            break;
          case 4:
            v18 = 0;
            Category = CFSTR("event");
            break;
          case 5:
            v20 = Type;
            if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x24BE2B240], 0))
            {
              v18 = CFStringCompare(v20, (CFStringRef)*MEMORY[0x24BE2B200], 0) != kCFCompareEqualTo;
              Category = CFSTR("item-number");
            }
            else
            {
              v18 = 0;
              Category = CFSTR("tracking-number");
            }
            break;
          case 6:
            v18 = 0;
            Category = CFSTR("money");
            break;
          case 7:
            v18 = 0;
            Category = CFSTR("propername");
            break;
          default:
            v18 = 1;
            break;
        }
      }
      else
      {
        v18 = 0;
        Category = 0;
      }

      _Block_object_dispose(&v22, 8);
      if (v18)
LABEL_13:
        Category = 0;
    }

  }
  else
  {
    _AXAssert();
    return 0;
  }
  return (id)Category;
}

void __67__UIWebDocumentViewAccessibility__accessibilityDataDetectorScheme___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "absoluteLinkURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("_webView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("mainFrame"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "_resultForURL:forContainer:context:", v5, v4, 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;

  -[UIWebDocumentViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityScrollStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)clearSelection
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility clearSelection](&v2, sel_clearSelection);
  UIAccessibilityPostNotification(0x3FEu, 0);
}

- (BOOL)accessibilityScrollUpPage
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityScrollUpPage");

  return v3;
}

- (BOOL)accessibilityScrollDownPage
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityScrollDownPage");

  return v3;
}

- (BOOL)accessibilityScrollRightPage
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityScrollRightPage");

  return v3;
}

- (BOOL)accessibilityScrollLeftPage
{
  void *v2;
  char v3;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityScrollLeftPage");

  return v3;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  _NSRange *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[UIWebDocumentViewAccessibility _accessibilityRootObject](self, "_accessibilityRootObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__UIWebDocumentViewAccessibility__accessibilityAttributedValueForRange___block_invoke;
  v15 = &unk_24FF8ED40;
  v17 = &v19;
  v6 = v5;
  v16 = v6;
  v18 = a3;
  AXPerformSafeBlock();
  v7 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "_accessibilityAttributedValueForRange:", a3);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWebDocumentViewAccessibility;
    -[UIWebDocumentViewAccessibility _accessibilityAttributedValueForRange:](&v11, sel__accessibilityAttributedValueForRange_, a3);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }

  return v7;
}

void __72__UIWebDocumentViewAccessibility__accessibilityAttributedValueForRange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "attributedStringForRange:", **(_QWORD **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  objc_super v4;

  if ((axIsSafari() & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  return -[UIWebDocumentViewAccessibility _accessibilityIsFirstElementForFocus](&v4, sel__accessibilityIsFirstElementForFocus);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)_accessibilityDocumentView
{
  void (*v3)(void);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = (void (*)(void))getWebThreadLockSymbolLoc_ptr;
  v13 = getWebThreadLockSymbolLoc_ptr;
  if (!getWebThreadLockSymbolLoc_ptr)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getWebThreadLockSymbolLoc_block_invoke;
    v9[3] = &unk_24FF8ED68;
    v9[4] = &v10;
    __getWebThreadLockSymbolLoc_block_invoke((uint64_t)v9);
    v3 = (void (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
    -[UIWebDocumentViewAccessibility _accessibilityDocumentView].cold.1();
  v3();
  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityRootObject
{
  void *v2;
  void *v3;

  -[UIWebDocumentViewAccessibility _accessibilityDocumentView](self, "_accessibilityDocumentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityRootElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityResponderElement
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[UIWebDocumentViewAccessibility _accessibilityRootObject](self, "_accessibilityRootObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WebPDFView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
    v4 = v2;
  }
  else
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "accessibilityTraits");
    if ((*MEMORY[0x24BEBB128] & v5) != 0)
    {
      v4 = v4;
      v3 = v4;
    }
    else
    {
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIPeripheralHost")), "safeValueForKey:", CFSTR("sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "safeValueForKey:", CFSTR("_hostView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_accessibleSubviews");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              if ((objc_msgSend(v14, "_accessibilityServesAsFirstElement", (_QWORD)v16) & 1) != 0)
              {
                v3 = v14;

                goto LABEL_17;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v11)
              continue;
            break;
          }
        }

        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "objectAtIndex:", 0);
          v3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v3 = 0;
        }
LABEL_17:

      }
      else
      {
        v3 = 0;
      }

    }
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[UIWebDocumentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXDocumentSeenChildren"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "_accessibilityRemoveValueForKey:", CFSTR("AXWebDocumentViewKey"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility dealloc](&v8, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[UIWebDocumentViewAccessibility _accessibilityRootObject](self, "_accessibilityRootObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGRect)_accessibilityContentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityContentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityMimicsTextInputResponder
{
  return 1;
}

- (BOOL)_accessibilityIsWebDocumentView
{
  return 1;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("updatesScrollView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if (!v13)
      return 0;
  }
  -[UIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_accessibilityScrollToFrame:forView:", 0, x, y, width, height);

  return v15;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  void *v3;
  void *v4;
  char v5;

  -[UIWebDocumentViewAccessibility isAccessibilityUserDefinedScrollAncestor](self, "isAccessibilityUserDefinedScrollAncestor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[UIWebDocumentViewAccessibility isAccessibilityUserDefinedScrollAncestor](self, "isAccessibilityUserDefinedScrollAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (int64_t)accessibilityContainerType
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[UIWebDocumentViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebDocumentViewAccessibility;
    v4 = -[UIWebDocumentViewAccessibility accessibilityContainerType](&v8, sel_accessibilityContainerType);
  }
  else
  {
    -[UIWebDocumentViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIWebDocumentViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "integerValue");

    }
    else
    {
      v4 = 4;
    }
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIWebDocumentViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = *MEMORY[0x24BDF73E0];

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect result;

  v14.receiver = self;
  v14.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility accessibilityFrame](&v14, sel_accessibilityFrame);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (axIsSafari())
    v10 = v5 + 20.0;
  else
    v10 = v5;
  v11 = v3;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIWebDocumentViewAccessibility *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[UIWebDocumentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    if (!_accessibilityHitTest_withEvent__AXObjectWrapperClass)
      _accessibilityHitTest_withEvent__AXObjectWrapperClass = (uint64_t)NSClassFromString(CFSTR("WebAccessibilityObjectWrapper"));
    objc_msgSend((id)-[UIWebDocumentViewAccessibility _axPluginViews](self, "_axPluginViews"), "keyEnumerator");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v12);
          objc_msgSend(v13, "convertPoint:fromView:", self, x, y, (_QWORD)v27);
          objc_msgSend(v13, "hitTest:withEvent:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "isAccessibilityElement") & 1) != 0)
          {

            goto LABEL_31;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[UIWebDocumentViewAccessibility _accessibilityDocumentView](self, "_accessibilityDocumentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
    v16 = v15;
    v18 = v17;
    if (objc_msgSend(v7, "_accessibilityAutomationHitTest"))
      -[UIWebDocumentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXIgnoreFuzzyHitTesting"));
    objc_msgSend(v8, "accessibilityHitTest:", v16, v18, (_QWORD)v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      do
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v14, "safeValueForKey:", CFSTR("isAttachment"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (!v20)
          break;
        objc_msgSend(v14, "safeValueForKey:", CFSTR("attachmentView"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safeValueForKey:", CFSTR("contentView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "safeValueForKey:", CFSTR("documentView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "convertPoint:fromView:", 0, x, y);
        objc_msgSend(v23, "accessibilityHitTest:");
        v24 = objc_claimAutoreleasedReturnValue();

        if ((void *)v24 == v14)
          break;
        v14 = (void *)v24;
      }
      while (v24);
    }
    if (objc_msgSend(v7, "_accessibilityAutomationHitTest"))
      -[UIWebDocumentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXIgnoreFuzzyHitTesting"));
    if ((objc_msgSend(v14, "isAccessibilityElement") & 1) != 0)
    {
      if (v14)
        goto LABEL_31;
    }
    else
    {

    }
    -[UIWebDocumentViewAccessibility __accessibilityHitTest:withEvent:](self, "__accessibilityHitTest:withEvent:", v7, x, y);
    v25 = (UIWebDocumentViewAccessibility *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      if (!-[UIWebDocumentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
      {
        v14 = 0;
        goto LABEL_31;
      }
      v25 = self;
    }
    v14 = v25;
LABEL_31:

    goto LABEL_32;
  }
  v14 = 0;
LABEL_32:

  return v14;
}

- (id)_accessibilitySpeakThisString
{
  UIWebDocumentViewAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v2 = self;
  -[UIWebDocumentViewAccessibility selectedTextRange](v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentViewAccessibility beginningOfDocument](v2, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentViewAccessibility endOfDocument](v2, "endOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebDocumentViewAccessibility textRangeFromPosition:toPosition:](v2, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = v2;
  v10.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility setSelectedTextRange:](&v10, sel_setSelectedTextRange_, v6);
  -[UIWebDocumentViewAccessibility textInRange:](v2, "textInRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = v2;
  v9.super_class = (Class)UIWebDocumentViewAccessibility;
  -[UIWebDocumentViewAccessibility setSelectedTextRange:](&v9, sel_setSelectedTextRange_, v3);

  return v7;
}

- (void)handleKeyWebEvent:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebDocumentViewAccessibility;
  v3 = a3;
  -[UIWebDocumentViewAccessibility handleKeyWebEvent:](&v4, sel_handleKeyWebEvent_, v3);
  sendNotificationAfterHandlingWebKeyEventIfNeeded(v3);

}

- (void)_accessibilityDocumentView
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void get_WebThreadLock(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIWebDocumentViewAccessibility.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
