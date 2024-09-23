@implementation WKContentView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("selectedText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("accessibilityRetrieveSpeakSelectionContent"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebSelectionRect"), CFSTR("rect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_accessibilityRetrieveRectsEnclosingSelectionOffset:withGranularity:"), "v", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_accessibilityRetrieveRectsAtSelectionOffset:withText:"), "v", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_selectionChanged"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_accessibilityStoreSelection"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_accessibilityClearSelection"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WKTextRange"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("selectedTextRange"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKTextRange"), CFSTR("selectedTextLength"), "Q", 0);

}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  void *v3;
  BOOL v4;

  if (!-[WKContentView_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon"))return 0;
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isPaused") & 1) != 0
    || -[WKContentView_QSExtras _accessibilityShouldShowSpeakBubble](self, "_accessibilityShouldShowSpeakBubble");

  return v4;
}

- (void)_selectionChanged
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKContentView_QSExtras;
  -[WKContentView_QSExtras _selectionChanged](&v7, sel__selectionChanged);
  -[WKContentView_QSExtras _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSelectionRange"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTextRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "isEqual:", v5);
  if (!v5)
  {
    -[WKContentView_QSExtras _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXSelectionRange"));
    if ((v6 & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[WKContentView_QSExtras _accessibilitySetValue:forKey:storageMode:](self, "_accessibilitySetValue:forKey:storageMode:", v5, CFSTR("AXSelectionRange"), 0);
  if ((v6 & 1) == 0)
LABEL_3:
    -[WKContentView_QSExtras _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXSpeakSelectionString"));
LABEL_4:

}

- (void)_axWaitForSpeakSelectionContentResults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230C05000, v0, v1, "WKContentView: will wait for speak selection content", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  uint64_t v3;
  void *v4;

  -[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTextRange"));
  v3 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEmpty");
  if ((v3 & 1) != 0)
    return 0;
  else
    return -[WKContentView_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon");
}

- (BOOL)_accessibilityShouldShowSpeakSpellOut
{
  uint64_t v3;
  void *v4;

  -[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTextRange"));
  v3 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEmpty");
  if ((v3 & 1) != 0)
    return 0;
  else
    return -[WKContentView_QSExtras _accessibilitySystemShouldShowSpeakSpellOut](self, "_accessibilitySystemShouldShowSpeakSpellOut");
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  uint64_t v3;
  void *v4;

  -[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTextRange"));
  v3 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEmpty");
  if ((v3 & 1) != 0)
    return 0;
  else
    return -[WKContentView_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon");
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  void *v2;
  BOOL v3;

  -[WKContentView_QSExtras _accessibilityQuickSpeakContent](self, "_accessibilityQuickSpeakContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (void)accessibilitySpeakSelectionSetContent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  AXLogSpeakSelection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WKContentView_QSExtras accessibilitySpeakSelectionSetContent:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[WKContentView_QSExtras _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXSpeakSelectionString"));
  v12 = (id)-[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityCacheContentIfNecessary"));
  -[WKContentView_QSExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXRetrievingContent"));

}

- (id)_accessibilityQuickSpeakContent
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((-[WKContentView_QSExtras _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXIsCachingContent")) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[WKContentView_QSExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXIsCachingContent"));
    -[WKContentView_QSExtras _axWaitForSpeakSelectionContentResults](self, "_axWaitForSpeakSelectionContentResults");
    -[WKContentView_QSExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXIsCachingContent"));
    -[WKContentView_QSExtras _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSpeakSelectionString"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogSpeakSelection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[WKContentView_QSExtras _accessibilityQuickSpeakContent].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v3;
}

- (id)accessibilityQSSentenceRects
{
  return objc_getAssociatedObject(self, &__WKContentView_QSExtras__accessibilityQSSentenceRects);
}

- (void)accessibilitySetQSSentenceRects:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityQSWordRects
{
  return objc_getAssociatedObject(self, &__WKContentView_QSExtras__accessibilityQSWordRects);
}

- (void)accessibilitySetQSWordRects:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_webTextRectsFromWKTextRects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "safeValueForKey:", CFSTR("rect"), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "axSafelyAddObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityRetrieveRectsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5
{
  void *v7;

  -[WKContentView_QSExtras _axWaitForSpeakSelectionRectResultsForGuanularity:atSelectionOffset:wordText:](self, "_axWaitForSpeakSelectionRectResultsForGuanularity:atSelectionOffset:wordText:", a3, a4, a5);
  if (a3 == 1)
  {
    -[WKContentView_QSExtras accessibilityQSWordRects](self, "accessibilityQSWordRects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    -[WKContentView_QSExtras accessibilityQSSentenceRects](self, "accessibilityQSSentenceRects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_axWaitForSpeakSelectionRectResultsForGuanularity:(int64_t)a3 atSelectionOffset:(int64_t)a4 wordText:(id)a5
{
  id v6;
  id v7;
  double Current;
  const __CFString *i;
  double v10;
  double v11;

  v6 = a5;
  -[WKContentView_QSExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXRetrievingRects"));
  v7 = v6;
  AXPerformSafeBlock();
  Current = CFAbsoluteTimeGetCurrent();
  for (i = (const __CFString *)*MEMORY[0x24BDBD5A0];
        -[WKContentView_QSExtras _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXRetrievingRects"));
        CFRunLoopRunInMode(i, 0.025, 1u))
  {
    v10 = CFAbsoluteTimeGetCurrent();
    v11 = _AXSInUnitTestMode() ? 1.0 : 0.2;
    if (v10 - Current >= v11)
      break;
  }

}

- (void)_accessibilityDidGetSelectionRects:(id)a3 withGranularity:(int64_t)a4 atOffset:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  -[WKContentView_QSExtras _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXRetrievingRects"));
  -[WKContentView_QSExtras _webTextRectsFromWKTextRects:](self, "_webTextRectsFromWKTextRects:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    -[WKContentView_QSExtras accessibilitySetQSWordRects:](self, "accessibilitySetQSWordRects:", v8);
  }
  else if (a4 == 2)
  {
    -[WKContentView_QSExtras accessibilitySetQSSentenceRects:](self, "accessibilitySetQSSentenceRects:", v8);
  }

}

- (unint64_t)_axSelectedTextLength
{
  void *v2;
  unint64_t v3;

  -[WKContentView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTextRange"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("selectedTextLength"));

  return v3;
}

- (void)accessibilitySpeakSelectionSetContent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_230C05000, a2, a3, "WebKit content setting AXSpeakSelectionString '%{private}@'", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_4();
}

- (void)_accessibilityQuickSpeakContent
{
  OUTLINED_FUNCTION_3(&dword_230C05000, a2, a3, "WebKit content requesting AXSpeakSelectionString: '%{private}@'", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_4();
}

@end
