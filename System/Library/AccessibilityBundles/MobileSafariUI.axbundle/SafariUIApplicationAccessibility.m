@implementation SafariUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebHTMLView"), CFSTR("accessibilityRootElement"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebBrowserFindOnPageHighlighter"), CFSTR("setSearchText: matchLimit:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebBrowserFindOnPageHighlighter"), CFSTR("numberOfMatches"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("loadURL: userDriven:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabDocument"), CFSTR("_findCompletionProvider"), "FindOnPageCompletionProvider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("activeTabDocument"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("URLString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Application"), CFSTR("browserWindowController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabDocument"), CFSTR("_sfScribbleController"), "SFScribbleController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFScribbleController"), CFSTR("_elementController"), "WBSScribbleController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFScribbleController"), CFSTR("_hideSelectedElement"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFScribbleController"), CFSTR("_updateScribbleControllerForElementAtPoint:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSScribbleController"), CFSTR("getElementAtPoint:completion:"), "v", "{CGPoint=dd}", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WBSScribbleElement"), CFSTR("_targetedElements"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WBSScribbleElement"), CFSTR("_screenReaderText"), "NSString");

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("application.name"));
}

- (id)_accessibilityMainBrowserController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_browserWindowController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("browserControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v19 = v3;
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v24 = 0;
        objc_opt_class();
        objc_msgSend(v9, "safeValueForKey:", CFSTR("rootViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          goto LABEL_17;
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "window");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "windowScene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyWindow");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v15)
        {
          v24 = 0;
          __UIAccessibilitySafeClass();
          v17 = objc_claimAutoreleasedReturnValue();
          if (v24)
LABEL_17:
            abort();
          v16 = (void *)v17;

          goto LABEL_14;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v6)
        continue;
      break;
    }
    v16 = 0;
LABEL_14:
    v3 = v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_accessibilityWebSearchResultsActive
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  AXUIApplicationWindows();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 1;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "firstResponder", (_QWORD)v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

uint64_t __72__SafariUIApplicationAccessibility__accessibilityWebSearchResultsActive__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SFFindOnPageBarIdentifier"));

  return v3;
}

- (id)_accessibilityRetrieveWebViewForSearchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SafariUIApplicationAccessibility _accessibilityMainBrowserController](self, "_accessibilityMainBrowserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "safeValueForKey:", CFSTR("browserView")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "safeValueForKey:", CFSTR("webView")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[SafariUIApplicationAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("WebView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_accessibilityActiveURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SafariUIApplicationAccessibility _accessibilityMainBrowserController](self, "_accessibilityMainBrowserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityActiveTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("URLString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityWebViewIsLoading
{
  return -[SafariUIApplicationAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isLoading"));
}

- (BOOL)_accessibilityLoadURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    -[SafariUIApplicationAccessibility _accessibilityMainBrowserController](self, "_accessibilityMainBrowserController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "accessibilityActiveTabDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v8;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v4);
    v9 = v13;
    v10 = v8;
    AXPerformSafeBlock();

  }
  return v4 != 0;
}

id __58__SafariUIApplicationAccessibility__accessibilityLoadURL___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "loadURL:userDriven:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)_accessibilityAlternateActionForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    v9 = v4;
    AXPerformSafeBlock();
    v6 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    v7 = v6 != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __72__SafariUIApplicationAccessibility__accessibilityAlternateActionForURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class urlForExternalURL:](NSClassFromString(CFSTR("TabDocument")), "urlForExternalURL:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  if (a3 == 5073)
  {
    -[SafariUIApplicationAccessibility _getScribbleController](self, "_getScribbleController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isScribbling"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SafariUIApplicationAccessibility;
    -[SafariUIApplicationAccessibility _iosAccessibilityAttributeValue:](&v7, sel__iosAccessibilityAttributeValue_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  void *v5;
  void *v6;
  BOOL v7;
  id v9;
  objc_super v10;

  if (a3 == 4200)
  {
    -[SafariUIApplicationAccessibility _getScribbleController](self, "_getScribbleController", *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v5 != 0;
    if (v5)
    {
      v9 = v5;
      AXPerformSafeBlock();

    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SafariUIApplicationAccessibility;
    return -[SafariUIApplicationAccessibility _iosAccessibilityPerformAction:withValue:fencePort:](&v10, sel__iosAccessibilityPerformAction_withValue_fencePort_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
  }
  return v7;
}

uint64_t __87__SafariUIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideSelectedElement");
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v32;
  const __CFString *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[8];
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  uint8_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 == 94100)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "pointValue");
      v8 = v7;
      v10 = v9;
      -[SafariUIApplicationAccessibility _getScribbleController](self, "_getScribbleController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v11;
      if (v11)
      {
        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        v65 = 0;
        *(_QWORD *)buf = 0;
        v57 = buf;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__1;
        v60 = __Block_byref_object_dispose__1;
        v61 = 0;
        v12 = MEMORY[0x24BDAC760];
        v47 = MEMORY[0x24BDAC760];
        v48 = 3221225472;
        v49 = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke;
        v50 = &unk_25029F338;
        v13 = v11;
        v54 = v8;
        v55 = v10;
        v51 = v13;
        v52 = buf;
        v53 = &v62;
        AXPerformSafeBlock();
        while (!*((_BYTE *)v63 + 24))
        {
          CFRunLoopGetCurrent();
          CFRunLoopRunSpecific();
        }
        if (*((_QWORD *)v57 + 5))
        {
          v39 = v12;
          v40 = 3221225472;
          v41 = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_274;
          v42 = &unk_25029F360;
          v43 = v13;
          v44 = v8;
          v45 = v10;
          AXPerformSafeBlock();

          objc_msgSend(*((id *)v57 + 5), "safeArrayForKey:", CFSTR("targetedElements"));
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v67, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v36;
            do
            {
              v20 = 0;
              v21 = v17;
              do
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "safeStringForKey:", CFSTR("screenReaderText"), v32, v33);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = CFSTR("__AXStringForVariablesSentinel");
                __UIAXStringForVariables();
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                ++v20;
                v21 = v17;
              }
              while (v18 != v20);
              v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v67, 16, v32, CFSTR("__AXStringForVariablesSentinel"));
            }
            while (v18);
          }

          if (objc_msgSend(v17, "length"))
          {
            objc_msgSend(*((id *)v57 + 5), "safeCGRectForKey:", CFSTR("geometry"));
            v23 = v22;
            v25 = v24;
            v27 = v26;
            v29 = v28;
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("AXScribbleRenderedTextKey"));
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v23, v25, v27, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("AXScribbleGeometryKey"));

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          AXLogAppAccessibility();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v46 = 0;
            _os_log_impl(&dword_2327BD000, v16, OS_LOG_TYPE_DEFAULT, "[Scribble] no element found at point", v46, 2u);
          }
          v14 = 0;
        }

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v62, 8);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      AXLogAppAccessibility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2327BD000, v15, OS_LOG_TYPE_DEFAULT, "[Scribble] attribute value is not an NSValue", buf, 2u);
      }

      v14 = 0;
    }
  }
  else
  {
    v66.receiver = self;
    v66.super_class = (Class)SafariUIApplicationAccessibility;
    -[SafariUIApplicationAccessibility _iosAccessibilityAttributeValue:forParameter:](&v66, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_elementController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_2;
  v3[3] = &unk_25029F310;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "getElementAtPoint:completion:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  AXLogAppAccessibility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_2327BD000, v8, OS_LOG_TYPE_DEFAULT, "[Scribble] error getting element at point: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

uint64_t __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_274(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScribbleControllerForElementAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_getScribbleController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SafariUIApplicationAccessibility _accessibilityMainBrowserController](self, "_accessibilityMainBrowserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityActiveTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("_sfScribbleController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
