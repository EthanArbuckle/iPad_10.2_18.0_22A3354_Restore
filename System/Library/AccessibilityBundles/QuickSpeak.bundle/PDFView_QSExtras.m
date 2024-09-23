@implementation PDFView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFView"), CFSTR("currentSelection"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PDFPageLayerSelectionEffect"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFView"), CFSTR("_private"), "PDFViewPrivate");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PDFViewPrivate"), CFSTR("scrollView"), "PDFScrollView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PDFScrollView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PDFScrollView"), CFSTR("pdfDocumentView"), "@", 0);

}

- (id)_accessibilitySpeakTextSelectionViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[PDFView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_private"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("pdfDocumentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sublayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v8);

  if (objc_msgSend(v6, "count"))
  {
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("PDFPageLayerSelectionEffect"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v9, "sublayers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v10);

      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v6, "count"))
        goto LABEL_4;
    }
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v11 = 0;
  }

  return v11;
}

- (void)_axConvertRange:(_NSRange)a3 toRects:(id)a4 operatingPage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[144];
  uint64_t v22;

  length = a3.length;
  location = a3.location;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "selectionForRange:", location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v11, "selectionsByLine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "boundsForPage:", v10);
        -[PDFView_QSExtras convertRect:fromPage:](self, "convertRect:fromPage:", v10);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)_accessibilityQuickSpeakTextRectsWithRange:(_NSRange)a3 string:(id)a4 highlightRects:(id)a5 sentenceRects:(id)a6 singleTextRect:(CGRect *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  void *v48;
  NSUInteger v49;
  void *v50;
  NSUInteger v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  length = a3.length;
  location = a3.location;
  v56 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "ignoreLogging");

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = v12;
      AXColorizeFormatLog();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = location;
      v51 = length;
      _AXStringForArgs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138543362;
        v55 = v22;
        _os_log_impl(&dword_230C05000, v18, v19, "%{public}@", buf, 0xCu);
      }

      v12 = v20;
    }

  }
  buf[0] = 0;
  -[PDFView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("currentSelection"), v49, v51);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (buf[0])
    abort();
  objc_msgSend(v24, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (location + length <= objc_msgSend(v25, "length"))
  {
    objc_msgSend(v24, "pages");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "indexOfFirstCharacterOnPage:", v26);
    v28 = v13;
    v29 = v27;
    v30 = v27 + location;
    v31 = length;
    v32 = v28;
    -[PDFView_QSExtras _axConvertRange:toRects:operatingPage:](self, "_axConvertRange:toRects:operatingPage:", v27 + location, v31);
    v53 = v12;
    v33 = objc_msgSend(v12, "ax_sentenceFromPosition:inDirection:", location, v30 != 0);
    -[PDFView_QSExtras _axConvertRange:toRects:operatingPage:](self, "_axConvertRange:toRects:operatingPage:", v33 + v29, v34, v14, v26);
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "ignoreLogging");

    if ((v36 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v38, v39))
      {
        AXColorizeFormatLog();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v32;
        _AXStringForArgs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v41;
          _os_log_impl(&dword_230C05000, v38, v39, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance", v50);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "ignoreLogging");

    v13 = v32;
    if ((v43 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v45, v46))
      {
        AXColorizeFormatLog();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v48;
          _os_log_impl(&dword_230C05000, v45, v46, "%{public}@", buf, 0xCu);
        }

      }
    }

    v12 = v53;
  }

}

- (id)_accessibilityQuickSpeakContent
{
  void *v2;
  void *v3;
  void *v4;

  -[PDFView_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("currentSelection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
