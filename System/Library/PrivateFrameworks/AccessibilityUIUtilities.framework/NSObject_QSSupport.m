@implementation NSObject_QSSupport

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityQuickSpeakTokenizer
{
  return 0;
}

- (BOOL)_accessibilityIsTextInput
{
  char v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_opt_respondsToSelector();
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)_accessibilityIsTextInteraction
{
  NSClassFromString(CFSTR("UITextInteraction"));
  return objc_opt_isKindOfClass() & 1;
}

- (id)_accessibilityUITextInput
{
  NSObject_QSSupport *v3;
  uint64_t v4;

  if (-[NSObject_QSSupport _accessibilityIsTextInput](self, "_accessibilityIsTextInput"))
    v3 = self;
  else
    v3 = 0;
  if (-[NSObject_QSSupport _accessibilityIsTextInteraction](self, "_accessibilityIsTextInteraction"))
  {
    -[NSObject_QSSupport safeValueForKey:](self, "safeValueForKey:", CFSTR("_textInput"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSObject_QSSupport *)v4;
  }
  return v3;
}

- (id)_accessibilityQuickSpeakEnclosingSentence:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NSObject_QSSupport _accessibilityUITextInput](self, "_accessibilityUITextInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject_QSSupport safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityQuickSpeakTokenizer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXUISentenceTextRangeForInput(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    objc_msgSend(v6, "textInRange:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;

  }
  v11 = 0;
LABEL_8:

LABEL_10:
  return v11;
}

- (id)_accessibilityQuickSpeakContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NSObject_QSSupport _accessibilityUITextInput](self, "_accessibilityUITextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "textInRange:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {

        goto LABEL_14;
      }

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (buf[0] = 0,
        objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "canPerformAction:withSender:", sel_copy_, 0),
        v7,
        v8))
  {
    v9 = objc_msgSend(MEMORY[0x1E0DC3AC0], "_accessibilityUseQuickSpeakPasteBoard");
    objc_msgSend(MEMORY[0x1E0DC3AC0], "_accessibilitySetUseQuickSpeakPasteBoard:", 1);
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStrings:", 0);
    AXLogSpeakSelection();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject_QSSupport _accessibilityQuickSpeakContent].cold.1(v13, (uint64_t)self, buf, v11);
    }

    -[NSObject_QSSupport performSelector:withObject:](self, "performSelector:withObject:", sel_copy_, 0);
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __53__NSObject_QSSupport__accessibilityQuickSpeakContent__block_invoke;
    v23 = &unk_1E76ABF30;
    v24 = v14;
    v25 = v15;
    v16 = v15;
    v17 = v14;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v20);
    objc_msgSend(MEMORY[0x1E0DC3AC0], "_accessibilitySetUseQuickSpeakPasteBoard:", v9, v20, v21, v22, v23);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (id)_accessibilitySentenceRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject_QSSupport *v7;
  void *v8;
  NSObject_QSSupport *v9;
  id v10;
  unsigned int (**v11)(void *, void *);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  _QWORD aBlock[4];
  NSObject_QSSupport *v22;
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject_QSSupport safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityQuickSpeakTokenizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  AXUISentenceTextRangeForInput(v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NSObject_QSSupport__accessibilitySentenceRectsForRange___block_invoke;
  aBlock[3] = &unk_1E76ABF58;
  v9 = v7;
  v22 = v9;
  v10 = v8;
  v23 = v10;
  v11 = (unsigned int (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject_QSSupport positionFromPosition:offset:](v9, "positionFromPosition:offset:", v12, 1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    while (v11[2](v11, v14))
    {
      -[NSObject_QSSupport textRangeFromPosition:toPosition:](v9, "textRangeFromPosition:toPosition:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v16 = -[NSObject_QSSupport _accessibilityTextRectsForRange:singleTextRect:](v9, "_accessibilityTextRectsForRange:singleTextRect:", v15, &v19);
      if (*(double *)&v20 > 0.0)
        QSUnionRectsWithRect(v5, *(CGFloat *)&v19, *((double *)&v19 + 1), *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
      v17 = v14;

      -[NSObject_QSSupport positionFromPosition:offset:](v9, "positionFromPosition:offset:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
      if (!v14)
      {
        v12 = v17;
        break;
      }
    }

  }
  return v5;
}

- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4
{
  id v6;
  NSObject_QSSupport *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[NSObject_QSSupport _accessibilityIsTextInput](self, "_accessibilityIsTextInput"))
    goto LABEL_6;
  v7 = self;
  objc_msgSend(v6, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSObject_QSSupport offsetFromPosition:toPosition:](v7, "offsetFromPosition:toPosition:", v8, v9);

  if (!v10)
  {

LABEL_6:
    v12 = 0;
    goto LABEL_33;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject_QSSupport selectionRectsForRange:](v7, "selectionRectsForRange:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v13 = 0x1E0C99000;
  if (objc_msgSend(v11, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v52;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v13 = 0x1E0C99000uLL;
            goto LABEL_26;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        if (v16)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v23), "rect", (_QWORD)v47);
          objc_msgSend(v24, "valueWithCGRect:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v25);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v21);
    }

    objc_msgSend(v12, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "CGRectValue");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v13 = 0x1E0C99000;
  }
  else
  {
LABEL_26:
    -[NSObject_QSSupport firstRectForRange:](v7, "firstRectForRange:", v6);
    v28 = v35;
    v30 = v36;
    v32 = v37;
    v34 = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v39;
    objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", &v56, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v60.origin.x = v28;
  v60.origin.y = v30;
  v60.size.width = v32;
  v60.size.height = v34;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], v60) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject_QSSupport _accessibilitySpeakRectForRange:](v7, "_accessibilitySpeakRectForRange:", v6);
    v28 = v40;
    v30 = v41;
    v32 = v42;
    v34 = v43;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v44;
    objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", &v55, 1);
    v45 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v45;
  }
  if (a4)
  {
    a4->origin.x = v28;
    a4->origin.y = v30;
    a4->size.width = v32;
    a4->size.height = v34;
  }

LABEL_33:
  return v12;
}

- (void)_accessibilityQuickSpeakContent
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1BD892000, log, OS_LOG_TYPE_DEBUG, "Wil call copy: on %@<%p> for speak selection content", buf, 0x16u);

}

@end
