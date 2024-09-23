@implementation _UIFindNavigatorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFindNavigatorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  int v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIFindNavigatorViewController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFindNavigatorViewController"), CFSTR("_handleSearchReturn:"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_handleHighlightPreviousResult:"), v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_performSearchWithQuery:options:"), v4, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_handleDone:"), v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("findSession"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("findNavigatorView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_didEnterReplacementString:"), v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFindNavigatorView"), CFSTR("searchTextField"), v5, 0);
  v6 = CFSTR("UITextInput_Internal");
  v7 = 1;
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:");
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:", v6, CFSTR("_rangeOfSentenceEnclosingPosition:"), v7 & 1, v7 & 1);
  objc_storeStrong(v9, v8);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIFindNavigatorViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIFindNavigatorViewControllerAccessibility _axReloadElementRelations:](v4, "_axReloadElementRelations:", 1);
}

- (void)_handleSearchReturn:(id)a3
{
  objc_super v3;
  id location[2];
  _UIFindNavigatorViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _handleSearchReturn:](&v3, sel__handleSearchReturn_, location[0]);
  -[_UIFindNavigatorViewControllerAccessibility _axReloadElementRelations:](v5, "_axReloadElementRelations:", 1);
  -[_UIFindNavigatorViewControllerAccessibility _axAnnounceCurrentSearchResult](v5, "_axAnnounceCurrentSearchResult");
  objc_storeStrong(location, 0);
}

- (void)_handleHighlightPreviousResult:(id)a3
{
  objc_super v3;
  id location[2];
  _UIFindNavigatorViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _handleHighlightPreviousResult:](&v3, sel__handleHighlightPreviousResult_, location[0]);
  -[_UIFindNavigatorViewControllerAccessibility _axReloadElementRelations:](v5, "_axReloadElementRelations:", 1);
  -[_UIFindNavigatorViewControllerAccessibility _axAnnounceCurrentSearchResult](v5, "_axAnnounceCurrentSearchResult");
  objc_storeStrong(location, 0);
}

- (void)_performSearchWithQuery:(id)a3 options:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  _UIFindNavigatorViewControllerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _performSearchWithQuery:options:](&v5, sel__performSearchWithQuery_options_, location[0], v6);
  -[_UIFindNavigatorViewControllerAccessibility _axReloadElementRelations:](v8, "_axReloadElementRelations:", 1);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleDone:(id)a3
{
  objc_super v3;
  id location[2];
  _UIFindNavigatorViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _handleDone:](&v3, sel__handleDone_, location[0]);
  -[_UIFindNavigatorViewControllerAccessibility _axReloadElementRelations:](v5, "_axReloadElementRelations:", 0);
  objc_storeStrong(location, 0);
}

- (void)_didEnterReplacementString:(id)a3
{
  id v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id location[2];
  _UIFindNavigatorViewControllerAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_opt_class();
  v3 = (id)-[_UIFindNavigatorViewControllerAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("findSession"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10 = v7;
  v6 = objc_msgSend(v7, "resultCount");
  v5 = objc_msgSend(v10, "highlightedResultIndex");
  v4.receiver = v12;
  v4.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  -[_UIFindNavigatorViewControllerAccessibility _didEnterReplacementString:](&v4, sel__didEnterReplacementString_, location[0]);
  -[_UIFindNavigatorViewControllerAccessibility _axAnnounceReplacementWithPreviousResultCount:previousIndex:](v12, "_axAnnounceReplacementWithPreviousResultCount:previousIndex:", v6, v5);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_axAnnounceReplacementWithPreviousResultCount:(int64_t)a3 previousIndex:(int64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  int64_t v13;
  id v14;
  id v15;
  id v16;
  id argument;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  int64_t v27;
  int64_t v28;
  SEL v29;
  _UIFindNavigatorViewControllerAccessibility *v30;

  v30 = self;
  v29 = a2;
  v28 = a3;
  v27 = a4;
  v25 = 0;
  objc_opt_class();
  v16 = (id)-[_UIFindNavigatorViewControllerAccessibility safeValueForKey:](v30, "safeValueForKey:", CFSTR("findSession"));
  v24 = (id)__UIAccessibilityCastAsClass();

  v23 = v24;
  objc_storeStrong(&v24, 0);
  v26 = v23;
  v22 = (id)objc_msgSend(v23, "replacementText");
  v21 = (id)objc_msgSend(v26, "searchText");
  v20 = objc_msgSend(v26, "resultCount");
  if (objc_msgSend(v22, "length") && objc_msgSend(v21, "length"))
  {
    v19 = 0;
    if (v28 > 0 && v20 == v28 - 1 && v27 >= 0)
    {
      v15 = (id)accessibilityUIKitLocalizedString();
      v11 = v27 + 1;
      v13 = v28;
      v4 = (id)AXCFormattedString();
      v5 = v19;
      v19 = v4;

    }
    else if (v28 > 0 && !v20)
    {
      v6 = (id)accessibilityUIKitLocalizedString();
      v7 = v19;
      v19 = v6;

    }
    if (objc_msgSend(v19, "length", v11, v13))
    {
      v14 = (id)accessibilityUIKitLocalizedString();
      v18 = (id)AXCFormattedString();

      v12 = v18;
      v8 = (id)__UIAXStringForVariables();
      v9 = v19;
      v19 = v8;

      v10 = objc_alloc(MEMORY[0x24BDFEA60]);
      argument = (id)objc_msgSend(v10, "initWithStringOrAttributedString:", v19, v12, CFSTR("__AXStringForVariablesSentinel"));
      objc_msgSend(argument, "setAttribute:forKey:", &unk_24FF85BC8, *MEMORY[0x24BDFEAD8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
}

- (void)_axAnnounceCurrentSearchResult
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;
  int v13;
  id v14;
  char v15;
  id v16;
  id argument;
  id v18;
  id v19[3];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32[2];
  uint64_t v33;
  uint64_t *v34;
  int v35;
  int v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  int v51;
  int v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56[2];
  uint64_t v57;
  uint64_t *v58;
  int v59;
  int v60;
  void (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  id v64;
  char v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  char v77;
  id v78[2];
  _UIFindNavigatorViewControllerAccessibility *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v79 = self;
  v78[1] = (id)a2;
  v77 = 0;
  objc_opt_class();
  v16 = (id)-[_UIFindNavigatorViewControllerAccessibility safeValueForKey:](v79, "safeValueForKey:", CFSTR("findSession"));
  v76 = (id)__UIAccessibilityCastAsClass();

  v75 = v76;
  objc_storeStrong(&v76, 0);
  v78[0] = v75;
  v74 = (id)objc_msgSend(v75, "searchText");
  v73 = objc_msgSend(v78[0], "resultCount");
  v72 = objc_msgSend(v78[0], "highlightedResultIndex");
  if (objc_msgSend(v74, "length") && v73 > 0 && v72 >= 0)
  {
    v71 = (id)objc_msgSend(v78[0], "_accessibilityElementForFindSessionResult");
    v70 = 0;
    v14 = (id)MEMORY[0x2348C31C4](CFSTR("UITextInput_Internal"));
    v15 = 0;
    if ((objc_msgSend(v71, "conformsToProtocol:") & 1) != 0)
      v15 = objc_msgSend(v71, "conformsToProtocol:", &unk_255ED66F8);

    if ((v15 & 1) != 0)
    {
      v69 = v71;
      v68 = (id)objc_msgSend(v69, "selectedTextRange");
      if (v68 && (objc_msgSend(v68, "isEmpty") & 1) == 0)
      {
        v67 = (id)objc_msgSend(v68, "start");
        v65 = 0;
        objc_opt_class();
        v57 = 0;
        v58 = &v57;
        v59 = 838860800;
        v60 = 48;
        v61 = __Block_byref_object_copy__28;
        v62 = __Block_byref_object_dispose__28;
        v63 = 0;
        v50 = MEMORY[0x24BDAC760];
        v51 = -1073741824;
        v52 = 0;
        v53 = __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke;
        v54 = &unk_24FF3DAB0;
        v56[1] = &v57;
        v55 = v71;
        v56[0] = v67;
        AXPerformSafeBlock();
        v49 = (id)v58[5];
        objc_storeStrong(v56, 0);
        objc_storeStrong(&v55, 0);
        _Block_object_dispose(&v57, 8);
        objc_storeStrong(&v63, 0);
        v64 = (id)__UIAccessibilityCastAsClass();

        if ((v65 & 1) != 0)
          abort();
        v48 = v64;
        objc_storeStrong(&v64, 0);
        v66 = v48;
        v47 = (id)objc_msgSend(v69, "textInRange:", v48);
        v45 = 0;
        v43 = 0;
        LOBYTE(v13) = 0;
        if (objc_msgSend(v47, "length"))
        {
          v46 = (id)objc_msgSend(v47, "lowercaseString");
          v45 = 1;
          v44 = (id)objc_msgSend(v74, "lowercaseString");
          v43 = 1;
          v13 = objc_msgSend(v46, "isEqualToString:") ^ 1;
        }
        if ((v43 & 1) != 0)

        if ((v45 & 1) != 0)
        if ((v13 & 1) != 0)
        {
          objc_storeStrong(&v70, v47);
        }
        else
        {
          v41 = 0;
          objc_opt_class();
          v33 = 0;
          v34 = &v33;
          v35 = 838860800;
          v36 = 48;
          v37 = __Block_byref_object_copy__28;
          v38 = __Block_byref_object_dispose__28;
          v39 = 0;
          v26 = MEMORY[0x24BDAC760];
          v27 = -1073741824;
          v28 = 0;
          v29 = __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke_2;
          v30 = &unk_24FF3DAB0;
          v32[1] = &v33;
          v31 = v71;
          v32[0] = v67;
          AXPerformSafeBlock();
          v25 = (id)v34[5];
          objc_storeStrong(v32, 0);
          objc_storeStrong(&v31, 0);
          _Block_object_dispose(&v33, 8);
          objc_storeStrong(&v39, 0);
          v40 = (id)__UIAccessibilityCastAsClass();

          if ((v41 & 1) != 0)
            abort();
          v24 = v40;
          objc_storeStrong(&v40, 0);
          v42 = v24;
          v23 = (id)objc_msgSend(v69, "textInRange:", v24);
          if (objc_msgSend(v23, "length"))
            objc_storeStrong(&v70, v23);
          objc_storeStrong(&v23, 0);
          objc_storeStrong(&v42, 0);
        }
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
      }
      objc_storeStrong(&v68, 0);
      objc_storeStrong(&v69, 0);
    }
    if (!v70)
    {
      v21 = objc_msgSend(v71, "_accessibilitySelectedTextRange");
      v22 = v2;
      v93 = 0x7FFFFFFFLL;
      v92 = 0;
      v94 = 0x7FFFFFFFLL;
      v95 = 0;
      v20[2] = 0x7FFFFFFFLL;
      v20[3] = 0;
      v86 = 0x7FFFFFFFLL;
      v87 = 0;
      v84 = v21;
      v85 = v2;
      v12 = 0;
      if (v21 == 0x7FFFFFFF)
        v12 = v87 == v85;
      if (!v12 && v22)
      {
        v20[0] = objc_msgSend(v71, "_accessibilityLineRangeForPosition:", v21);
        v20[1] = v3;
        v89 = 0x7FFFFFFFLL;
        v88 = 0;
        v90 = 0x7FFFFFFFLL;
        v91 = 0;
        v19[1] = (id)0x7FFFFFFF;
        v19[2] = 0;
        v82 = 0x7FFFFFFFLL;
        v83 = 0;
        v80 = v20[0];
        v81 = v3;
        v11 = 0;
        if (v20[0] == 0x7FFFFFFFLL)
          v11 = v83 == v81;
        if (!v11)
        {
          v19[0] = (id)objc_msgSend(v71, "_accessibilityAttributedValueForRange:", v20);
          if (objc_msgSend(v19[0], "length"))
          {
            v4 = (id)objc_msgSend(v19[0], "string");
            v5 = v70;
            v70 = v4;

          }
          objc_storeStrong(v19, 0);
        }
      }
    }
    v10 = (id)accessibilityUIKitLocalizedString();
    v18 = (id)AXCFormattedString();

    v9 = v70;
    v6 = (id)__UIAXStringForVariables();
    v7 = v70;
    v70 = v6;

    if (objc_msgSend(v70, "length", v9, CFSTR("__AXStringForVariablesSentinel")))
    {
      v8 = objc_alloc(MEMORY[0x24BDFEA60]);
      argument = (id)objc_msgSend(v8, "initWithStringOrAttributedString:", v70);
      objc_msgSend(argument, "setAttribute:forKey:", &unk_24FF85BC8, *MEMORY[0x24BDFEAD8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
      objc_storeStrong(&argument, 0);
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  objc_storeStrong(&v74, 0);
  objc_storeStrong(v78, 0);
}

- (void)_axReloadElementRelations:(BOOL)a3
{
  id v3;
  id location;
  id v5;
  BOOL v6;
  SEL v7;
  _UIFindNavigatorViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = (id)-[_UIFindNavigatorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("findNavigatorView.searchTextField"));
  if (v5)
  {
    UIAccessibilityUnrelateAllElements();
    if (v6)
    {
      v3 = (id)-[_UIFindNavigatorViewControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("findSession"));
      location = (id)objc_msgSend(v3, "_accessibilityElementForFindSessionResult");

      if (location)
        UIAccessibilityRelateElements();
      objc_storeStrong(&location, 0);
    }
  }
  objc_storeStrong(&v5, 0);
}

@end
