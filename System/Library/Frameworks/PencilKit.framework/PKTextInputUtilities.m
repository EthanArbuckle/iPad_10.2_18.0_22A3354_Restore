@implementation PKTextInputUtilities

+ (id)textInputTraitsFromTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF5F3BE0) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0DC3E00];
    objc_msgSend(v3, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitsByAdoptingTraits:lightweight:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E00], "traitsByAdoptingTraits:lightweight:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (BOOL)textInputTraitsAreSecure:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "isSecureTextEntry") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)*MEMORY[0x1E0DC5468];
    objc_msgSend(v3, "textContentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v7 = (void *)*MEMORY[0x1E0DC5450];
      objc_msgSend(v3, "textContentType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isEqualToString:", v8);

    }
  }

  return v4;
}

+ (Class)notesTextViewClass
{
  if (qword_1ECEE6040 != -1)
    dispatch_once(&qword_1ECEE6040, &__block_literal_global);
  return (Class)(id)_MergedGlobals_109;
}

Class __42__PKTextInputUtilities_notesTextViewClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("ICTextView"));
  _MergedGlobals_109 = (uint64_t)result;
  return result;
}

+ (id)_notesTextViewFromResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.mobilenotes"));

  if (v7)
  {
    objc_msgSend(a1, "notesTextViewClass");
    v8 = v4;
    if (v8)
    {
      do
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v8, "nextResponder");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v9;
      }
      while (v9);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidReachableInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "_notesTextViewFromResponder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isHandwritingInk");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (BOOL)isPKViewProviderView:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(a3, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  while ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF5B6490) & 1) == 0)
  {
    objc_msgSend(v4, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
    if (!v5)
    {
      v6 = 0;
      goto LABEL_9;
    }
  }
  v6 = 1;
LABEL_9:

  return v6;
}

+ (BOOL)isUnderMagicView:(id)a3
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;

  objc_msgSend(a3, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  do
  {
    v5 = +[PKTextInputUtilities isMagicCanvasGenerationView:](PKTextInputUtilities, "isMagicCanvasGenerationView:", v4);
    if (v5)
      break;
    objc_msgSend(v4, "superview");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  while (v6);

  return v5;
}

+ (BOOL)isMagicCanvasGenerationView:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "magicGenerativeViewForHitTesting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isResponderSupportedTextInput:(id)a3
{
  return objc_msgSend(a1, "isResponderSupportedTextInput:outTextInputTraits:", a3, 0);
}

+ (BOOL)isResponderSupportedTextInput:(id)a3 outTextInputTraits:(id *)a4
{
  return objc_msgSend(a1, "isResponderSupportedTextInput:checkForNotes:outTextInputTraits:", a3, 1, a4);
}

+ (BOOL)isResponderSupportedTextInput:(id)a3 checkForNotes:(BOOL)a4 outTextInputTraits:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  _BOOL4 v16;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(a1, "textInputTraitsFromTextInput:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(a1, "textInputTraitsAreSecure:", v9);

  if ((v10 & 1) == 0 && objc_msgSend(v7, "conformsToProtocol:", &unk_1EF5D8B10))
  {
    objc_msgSend(a1, "_notesTextViewFromResponder:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "ink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_isHandwritingInk");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v7;
        v16 = +[PKTextInputUtilities isUnderMagicView:](PKTextInputUtilities, "isUnderMagicView:", v15);
        if (v16)
          v16 = +[PKTextInputUtilities isPKViewProviderView:](PKTextInputUtilities, "isPKViewProviderView:", v15);
        LOBYTE(v14) = (v16 | v14) != 0;

      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }
  else
  {
LABEL_11:
    v12 = 0;
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (int64_t)responderTextInputSource:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_textInputSource");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)shouldAvoidNonEditableView:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v6;

  v3 = a3;
  if (qword_1ECEE6060 != -1)
    dispatch_once(&qword_1ECEE6060, &__block_literal_global_443);
  if (qword_1ECEE6058 && (objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    LOBYTE(v4) = 1;
    goto LABEL_16;
  }
  if (qword_1ECEE6048)
    v5 = qword_1ECEE6050 == 0;
  else
    v5 = 1;
  if (v5 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v4) = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v4, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
      if (!v6)
        goto LABEL_16;
    }

    goto LABEL_5;
  }
LABEL_16:

  return (char)v4;
}

Class __51__PKTextInputUtilities_shouldAvoidNonEditableView___block_invoke()
{
  Class result;

  qword_1ECEE6048 = (uint64_t)NSClassFromString(CFSTR("MUPDFView"));
  qword_1ECEE6050 = (uint64_t)NSClassFromString(CFSTR("PDFDocumentView"));
  result = NSClassFromString(CFSTR("PDFTextInputView"));
  qword_1ECEE6058 = (uint64_t)result;
  return result;
}

+ (id)nonEditableTextInputForView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_msgSend(a1, "shouldAvoidNonEditableView:", v4) & 1) != 0)
    goto LABEL_7;
  if (objc_msgSend(a1, "isResponderSupportedTextInput:checkForNotes:outTextInputTraits:", v4, 0, 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "isEditable") & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v4, "isSelectable"))
        goto LABEL_7;
    }
    else if ((objc_msgSend(v4, "canBecomeFirstResponder") & 1) != 0)
    {
LABEL_7:
      v5 = 0;
      goto LABEL_28;
    }
    v5 = v4;
    goto LABEL_28;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "interactions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {
          v7 = v10;
          goto LABEL_18;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_18:

  objc_msgSend(v7, "textInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF5D8B10)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "interactionAssistant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = v12;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v5 = v14;

LABEL_28:
  return v5;
}

+ (void)requestDocumentContext:(id)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF5F3BE0))
  {
    v10 = v8;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)qword_1ECEE6068;
    v23 = qword_1ECEE6068;
    if (!qword_1ECEE6068)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getBETextDocumentRequestClass_block_invoke;
      v19[3] = &unk_1E7777068;
      v19[4] = &v20;
      __getBETextDocumentRequestClass_block_invoke((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "_initWithUIKitDocumentRequest:", v7);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke;
    v17[3] = &unk_1E7777018;
    v18 = v9;
    v14 = v9;
    objc_msgSend(v10, "requestDocumentContext:completionHandler:", v13, v17);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke_2;
    v15[3] = &unk_1E7777040;
    v16 = v9;
    v10 = v9;
    objc_msgSend(v8, "requestDocumentContext:completionHandler:", v7, v15);
    v13 = v16;
  }

}

void __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_uikitDocumentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __90__PKTextInputUtilities_requestDocumentContext_forWebDocumentSourceView_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)adjustSelectionWithDelta:(_NSRange)a3 forWebDocumentSourceView:(id)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v8 = a5;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF5F3BE0))
    objc_msgSend(v9, "adjustSelectionByRange:completionHandler:", location, length, v8);
  else
    objc_msgSend(v9, "adjustSelectionWithDelta:completionHandler:", location, length, v8);

}

+ (CGRect)selectionClipRectForTextInput:(id)a3
{
  id v3;
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
  double v15;
  CGRect result;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "selectionClipRect");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = *MEMORY[0x1E0C9D628];
      v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_7;
    }
    objc_msgSend(v3, "_selectionClipRect");
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
LABEL_7:

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (void)removeTextAlternativesForTextInput:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "removeTextAlternatives");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "removeEmojiAlternatives");

}

+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id v8;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a3, "componentsJoinedByString:", &stru_1E777DEE8);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_textInputSessionAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didInsertText:relativeRangeBefore:", v8, location, length);

}

+ (void)markAnalyticsForInsertionWithTexts:(id)a3 rangeToReplace:(_NSRange)a4 withAlternatives:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  id v10;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a3, "componentsJoinedByString:", &stru_1E777DEE8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_textInputSessionAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didInsertText:relativeRangeBefore:withNumAlternatives:", v10, location, length, a5);

}

+ (void)markAnalyticsForDeletionCount:(unint64_t)a3 rangeToReplace:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;

  length = a4.length;
  location = a4.location;
  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_textInputSessionAnalytics");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "didDeleteBackwardCount:", a3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "didDeleteBackward:relativeRangeBefore:", a3, location, length);
  }

}

+ (void)markAnalyticsForSelectionChange:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_textInputSessionAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didChangeToSelection:relativeRangeBefore:", v7, v6, location, length);

}

+ (void)markAnalyticsForUndo
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInputSessionAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUndo");

}

+ (void)markAnalyticsForRedo
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInputSessionAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didRedo");

}

@end
