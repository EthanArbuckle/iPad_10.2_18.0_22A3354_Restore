@implementation PKTextInputElementContent

- (id)initWithElement:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKTextInputElementContent;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)description
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  UIWKDocumentContext *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  PKTextInputElement *element;
  void *v15;
  objc_super v17;
  NSRange v18;

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__textInput);

    if (WeakRetained)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = objc_loadWeakRetained((id *)&self->__textInput);
      v6 = objc_opt_class();
      v7 = (UIWKDocumentContext *)objc_loadWeakRetained((id *)&self->__textInput);
      objc_msgSend(v4, "stringWithFormat:", CFSTR("type: UITextInput, textInput: <%@: %p>"), v6, v7);
LABEL_6:
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = objc_loadWeakRetained((id *)&self->__webDocumentSourceView);

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v7 = self->__webDocumentContext;
      v18.location = -[UIWKDocumentContext selectedTextRange](v7, "selectedTextRange");
      NSStringFromRange(v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("type: WebInput, selectedRange: %@, webDocumentContext: (%@)"), v5, self->__webDocumentContext);
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: NoData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self)
  {
LABEL_8:
    v11 = CFSTR("None");
    goto LABEL_13;
  }
LABEL_7:
  switch(self->_dataLoadedState)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v11 = CFSTR("Requesting");
      break;
    case 2:
      v11 = CFSTR("Ready");
      break;
    case 3:
      v11 = CFSTR("Failed");
      break;
    default:
      v11 = 0;
      break;
  }
LABEL_13:
  v17.receiver = self;
  v17.super_class = (Class)PKTextInputElementContent;
  -[PKTextInputElementContent description](&v17, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self)
    element = self->_element;
  else
    element = 0;
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %@, loadedState: %@, element: (%@)"), v10, v11, element);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)loadDataIfNeededWithTextInput:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 == 3 || v4 == 0)
    {
      v9 = v3;
      v6 = objc_storeWeak((id *)(a1 + 32), v3);
      +[PKTextInputUtilities textInputTraitsFromTextInput:](PKTextInputUtilities, "textInputTraitsFromTextInput:", v9);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v7;

      v3 = v9;
      *(_QWORD *)(a1 + 24) = 2;
    }
  }

}

- (void)loadDataIfNeededWithWebDocumentSourceView:(void *)a3 textInput:(void *)a4 rectOfInterest:(CGFloat)a5 completion:(CGFloat)a6
{
  id v15;
  id v16;
  void (**v17)(id, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD v29[5];
  void (**v30)(id, uint64_t);
  uint64_t v31;
  _QWORD v32[5];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;
  CGRect v38;

  v37 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  if (a1)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0DC3F60]);
    objc_msgSend(v18, "setSurroundingGranularity:", 4);
    objc_msgSend(v18, "setGranularityCount:", 1);
    objc_msgSend(v18, "setFlags:", 1);
    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke;
    v32[3] = &unk_1E7779A18;
    v32[4] = a1;
    +[PKTextInputUtilities requestDocumentContext:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "requestDocumentContext:forWebDocumentSourceView:completionHandler:", v18, v15, v32);
    v20 = *(_QWORD *)(a1 + 24);
    if (v20 && v20 != 3)
    {
      v17[2](v17, 1);
    }
    else
    {
      v21 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 134218242;
        v34 = a1;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Will load content for web element %@", buf, 0x16u);
      }

      objc_storeWeak((id *)(a1 + 56), v15);
      objc_storeWeak((id *)(a1 + 40), v16);
      *(_QWORD *)(a1 + 24) = 1;
      v23 = objc_alloc_init(MEMORY[0x1E0DC3F60]);
      objc_msgSend(v23, "setSurroundingGranularity:", 0);
      objc_msgSend(v23, "setGranularityCount:", 200);
      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      if (CGRectIsNull(v38))
      {
        v24 = 5;
      }
      else
      {
        objc_msgSend(v23, "setDocumentRect:", a5, a6, a7, a8);
        v25 = *(_QWORD **)(a1 + 8);
        if (v25)
          v25 = (_QWORD *)v25[15];
        v26 = v25;
        objc_msgSend(v23, "setInputElementIdentifier:", v26);

        v24 = 69;
      }
      objc_msgSend(v23, "setFlags:", v24);
      v27 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v34 = a1;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Sending web document context request to view %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_16;
      v29[3] = &unk_1E7779A68;
      v31 = v28;
      v29[4] = a1;
      v30 = v17;
      +[PKTextInputUtilities requestDocumentContext:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "requestDocumentContext:forWebDocumentSourceView:completionHandler:", v23, v15, v29);

    }
  }

}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2;
  v5[3] = &unk_1E7777C20;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(v1 + 72), *(id *)(a1 + 40));
}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  double v11;

  v3 = a2;
  objc_msgSend(v3, "sortTextRectsByCharacterRange");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 - *(double *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2_17;
  v8[3] = &unk_1E7779A40;
  v11 = v5;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __107__PKTextInputElementContent_loadDataIfNeededWithWebDocumentSourceView_textInput_rectOfInterest_completion___block_invoke_2_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(double *)(a1 + 56) * 1000.0;
    if (v3)
      v5 = *(_QWORD *)(v3 + 8);
    else
      v5 = 0;
    *(_DWORD *)buf = 134218498;
    v26 = v3;
    v27 = 2048;
    v28 = v4;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "ElementContent %p: Web document context request finished after %0.2fms for element %@", buf, 0x20u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v6 && (objc_storeStrong((id *)(v6 + 64), *(id *)(a1 + 40)), (v8 = *(_QWORD *)(a1 + 32)) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 40));
    +[PKTextInputUtilities textInputTraitsFromTextInput:](PKTextInputUtilities, "textInputTraitsFromTextInput:", WeakRetained);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v10;

  }
  else
  {
    WeakRetained = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "contextBefore");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectedText");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contextAfter");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = &stru_1E777DEE8;
  if (v12)
    v16 = v12;
  else
    v16 = &stru_1E777DEE8;
  if (v13)
    v17 = v13;
  else
    v17 = &stru_1E777DEE8;
  if (v14)
    v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v16, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    objc_storeStrong((id *)(v19 + 48), v18);

  if (v7)
  {
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
    {
      v21 = 2;
LABEL_24:
      *(_QWORD *)(v20 + 24) = v21;
    }
  }
  else
  {
    v22 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      if (v23)
        v24 = *(double *)(v23 + 8);
      else
        v24 = 0.0;
      *(_DWORD *)buf = 134218242;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_1BE213000, v22, OS_LOG_TYPE_ERROR, "ElementContent %p: Failed to load web document context for element %@", buf, 0x16u);
    }

    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
    {
      v21 = 3;
      goto LABEL_24;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)textContentType
{
  if (a1)
  {
    objc_msgSend(a1[2], "textContentType");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)contentLength
{
  uint64_t v1;
  id v2;
  id WeakRetained;
  id v4;

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));

    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)(v1 + 32));
      v1 = +[PKTextInputUITextInputInterface contentLengthForTextInput:](PKTextInputUITextInputInterface, "contentLengthForTextInput:", v4);

    }
    else if (v2)
    {
      v1 = objc_msgSend(*(id *)(v1 + 48), "length");
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)stringInRange:(uint64_t)a3
{
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;

  if (!a1)
    goto LABEL_6;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (!WeakRetained)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a2, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
LABEL_6:
    v9 = 0;
    return v9;
  }
  v8 = objc_loadWeakRetained(v6);
  +[PKTextInputUITextInputInterface stringInRange:inTextInput:](PKTextInputUITextInputInterface, "stringInRange:inTextInput:", a2, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)protectedCharacterIndexesInRange:(uint64_t)a3
{
  id *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;

  if (a1
    && (v6 = (id *)(a1 + 32), (v7 = objc_loadWeakRetained((id *)(a1 + 32))) != 0)
    && (v8 = v7, v9 = -[PKTextInputElementContent isSingleLineDocumentContent](a1), v8, (v9 & 1) == 0))
  {
    WeakRetained = objc_loadWeakRetained(v6);
    +[PKTextInputUITextInputInterface protectedCharacterIndexesInRange:inTextInput:](PKTextInputUITextInputInterface, "protectedCharacterIndexesInRange:inTextInput:", a2, a3, WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (uint64_t)isSingleLineDocumentContent
{
  void *v2;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 16);
  if (v2)
    return objc_msgSend(v2, "isSingleLineDocument");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    v6 = WeakRetained;
  else
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "isSingleLineDocument");
  else
    v8 = 1;

  return v8;
}

- (uint64_t)rangeOfCharacterAtIndex:(uint64_t)a1
{
  id *v4;
  id WeakRetained;
  id v6;

  if (!a1)
    return 0;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);
    a2 = +[PKTextInputUITextInputInterface rangeOfCharacterAtIndex:inTextInput:](PKTextInputUITextInputInterface, "rangeOfCharacterAtIndex:inTextInput:", a2, v6);

  }
  else if (*(_QWORD *)(a1 + 64))
  {
    return objc_msgSend(*(id *)(a1 + 48), "rangeOfComposedCharacterSequenceAtIndex:", a2);
  }
  return a2;
}

- (BOOL)isValidRange:(uint64_t)a3
{
  uint64_t v5;
  id *v6;
  id WeakRetained;
  id v8;
  _BOOL8 v9;

  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v5 = result;
    v6 = (id *)(result + 32);
    WeakRetained = objc_loadWeakRetained((id *)(result + 32));

    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained(v6);
      v9 = +[PKTextInputUITextInputInterface isValidRange:inTextInput:](PKTextInputUITextInputInterface, "isValidRange:inTextInput:", a2, a3, v8);

      return v9;
    }
    else
    {
      if (!*(_QWORD *)(v5 + 64))
        return 0;
      return a2 + a3 <= (unint64_t)-[PKTextInputElementContent contentLength](v5);
    }
  }
  return result;
}

- (uint64_t)supportsAutoLineBreaks
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    if ((-[PKTextInputElementContent isSingleLineDocumentContent](result) & 1) != 0)
    {
      return 0;
    }
    else
    {
      v2 = (id *)(v1 + 32);
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
      objc_msgSend(WeakRetained, "textInputView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (id *)*(id *)(v1 + 8);
        v6 = objc_loadWeakRetained(v2);
        objc_msgSend(v6, "textInputView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PKTextInputElement containsView:](v5, v7);

        return v8;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (void)enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6
{
  id v11;
  id WeakRetained;
  id v13;

  v13 = a4;
  v11 = a6;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      -[PKTextInputElementContent _textInput_enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:]((id *)a1, a2, a3, v13, a5, v11);
    }
    else if (*(_QWORD *)(a1 + 64) && a3)
    {
      -[PKTextInputElementContent _webDocumentContext_enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:](a1, a2, a3, v13, a5, v11);
    }
  }

}

- (void)_textInput_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(char)a5 block:(void *)a6
{
  id v11;
  void (**v12)(id, uint64_t, _BYTE *);
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  char v17;

  v11 = a4;
  v12 = a6;
  if (a1)
  {
    if ((a5 & 1) != 0)
    {
      v13 = a2 + a3 - 1;
      do
      {
        if (v13 < a2)
          break;
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:](a1, v13, 1uLL, v11);
        v17 = 0;
        v12[2](v12, v13--, &v17);
      }
      while (!v17);
    }
    else if (a2 < (unint64_t)(a2 + a3))
    {
      v14 = a3 - 1;
      do
      {
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:](a1, a2, 1uLL, v11);
        v16 = 0;
        v12[2](v12, a2++, &v16);
        if (v16)
          v15 = 1;
        else
          v15 = v14 == 0;
        --v14;
      }
      while (!v15);
    }
  }

}

- (void)_webDocumentContext_enumerateBoundsForCharactersInRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 reverse:(int)a5 block:(void *)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v14 = a4;
  v11 = a6;
  if (a1)
  {
    if (a5)
      v12 = 2;
    else
      v12 = 0;
    v13 = *(void **)(a1 + 64);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __117__PKTextInputElementContent__webDocumentContext_enumerateBoundsForCharactersInRange_inCoordinateSpace_reverse_block___block_invoke;
    v15[3] = &unk_1E7779A90;
    v16 = v14;
    v17 = a1;
    v18 = v11;
    objc_msgSend(v13, "enumerateLayoutRectsWithOptions:characterRange:block:", v12, a2, a3, v15);

  }
}

- (void)firstRectForRange:(unint64_t)a3 inCoordinateSpace:(void *)a4
{
  id v7;
  CGSize v8;
  id WeakRetained;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  void *v16;
  void *v17;
  double Height;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  CGFloat y;
  CGFloat v27;
  double v28;
  double MaxY;
  double v30;
  CGFloat x;
  CGFloat width;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  id v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGRect rect;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGRect r1;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a1)
  {
    memset(&r1, 0, sizeof(r1));
    goto LABEL_5;
  }
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  r1.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  r1.size = v8;
  WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained(a1 + 4);
    +[PKTextInputUITextInputInterface firstRectForRange:inCoordinateSpace:inTextInput:](PKTextInputUITextInputInterface, "firstRectForRange:inCoordinateSpace:inTextInput:", a2, a3, v7, v10);
    r1.origin.x = v11;
    r1.origin.y = v12;
    r1.size.width = v13;
    r1.size.height = v14;
    goto LABEL_4;
  }
  v15 = a1[8];
  if (v15 && a3)
  {
    objc_msgSend(v15, "characterRectsForCharacterRange:", a2, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_4;
    objc_msgSend(v10, "getValue:size:", &r1, 32);
    if (a3 < 2)
      goto LABEL_26;
    objc_msgSend(a1[8], "characterRectsForCharacterRange:", a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    Height = CGRectGetHeight(r1);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (!v20)
      goto LABEL_25;
    v21 = v20;
    v22 = Height * 0.2;
    v23 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        memset(&rect, 0, sizeof(rect));
        objc_msgSend(v25, "getValue:size:", &rect, 32);
        y = rect.origin.y;
        v27 = r1.origin.y;
        v28 = rect.origin.y - r1.origin.y;
        if (rect.origin.y - r1.origin.y < 0.0)
          v28 = -(rect.origin.y - r1.origin.y);
        if (v28 <= v22)
          goto LABEL_22;
        MaxY = CGRectGetMaxY(rect);
        v30 = MaxY - CGRectGetMaxY(rect);
        if (v30 < 0.0)
          v30 = -v30;
        if (v30 <= v22)
        {
          v27 = r1.origin.y;
          y = rect.origin.y;
LABEL_22:
          x = r1.origin.x;
          width = r1.size.width;
          v33 = r1.size.height;
          v34 = rect.origin.x;
          v35 = rect.size.width;
          v36 = rect.size.height;
          r1 = CGRectUnion(*(CGRect *)(&v27 - 1), *(CGRect *)(&y - 1));
          continue;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (!v21)
      {
LABEL_25:

LABEL_26:
        v37 = objc_loadWeakRetained(a1 + 7);
        r1.origin.x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v37, v7, r1.origin.x, r1.origin.y, r1.size.width, r1.size.height);
        r1.origin.y = v38;
        r1.size.width = v39;
        r1.size.height = v40;

LABEL_4:
        break;
      }
    }
  }
LABEL_5:

}

uint64_t __117__PKTextInputElementContent__webDocumentContext_enumerateBoundsForCharactersInRange_inCoordinateSpace_reverse_block___block_invoke(_QWORD *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10;
  void *v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v11 = (void *)a1[4];
  v10 = a1[5];
  if (v10)
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 56));
  else
    WeakRetained = 0;
  v13 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v11, a2, a3, a4, a5);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  return (*(uint64_t (**)(double, double, double, double))(a1[6] + 16))(v13, v15, v17, v19);
}

- (uint64_t)characterIndexClosestToPoint:(uint64_t)a3 inCoordinateSpace:(uint64_t)a4 forInsertingText:(double)a5 adjustForLastCharacter:(double)a6
{
  id v11;
  id WeakRetained;
  id v13;
  uint64_t v14;
  id v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGRect v21;

  v11 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 4);

    if (WeakRetained)
    {
      v13 = objc_loadWeakRetained(a1 + 4);
      v14 = +[PKTextInputUITextInputInterface characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:](PKTextInputUITextInputInterface, "characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:", v11, v13, a3, a4, a5, a6);

    }
    else if (a1[8])
    {
      v16 = objc_loadWeakRetained(a1 + 7);
      v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v16, a5, a6, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v19 = v18;

      v20 = objc_msgSend(a1[8], "closestCharacterIndexForPoint:", v17, v19);
      v14 = v20;
      if ((_DWORD)a3)
      {
        if (v20 + 1 == -[PKTextInputElementContent contentLength]((uint64_t)a1))
        {
          if (-[PKTextInputElementContent _isLastCharacterNewline]((uint64_t)a1))
          {
            v21.origin.x = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)a1, v14, v11);
            if (a6 > CGRectGetMaxY(v21))
              ++v14;
          }
        }
      }
    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)_isLastCharacterNewline
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[PKTextInputElementContent contentLength](a1) < 1)
    return 0;
  v2 = -[PKTextInputElementContent contentLength](a1);
  -[PKTextInputElementContent stringInRange:](a1, v2 - 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") == 1)
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "characterIsMember:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)caretRectForCharacterIndex:(void *)a3 inCoordinateSpace:
{
  id v5;
  id WeakRetained;
  id v7;
  double v8;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 IsNull;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 32));
      +[PKTextInputUITextInputInterface caretRectForCharacterIndex:inCoordinateSpace:inTextInput:](PKTextInputUITextInputInterface, "caretRectForCharacterIndex:inCoordinateSpace:inTextInput:", a2, v5, v7);
      x = v8;

    }
    else if (*(_QWORD *)(a1 + 64))
    {
      -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)a1, a2, 1uLL, v5);
      x = v15.origin.x;
      y = v15.origin.y;
      width = v15.size.width;
      height = v15.size.height;
      IsNull = CGRectIsNull(v15);
      if (a2 >= 1 && IsNull)
      {
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)a1, a2 - 1, 1uLL, v5);
        x = v16.origin.x;
        if (!CGRectIsNull(v16) && -[PKTextInputElementContent contentLength](a1) == a2)
          -[PKTextInputElementContent _isLastCharacterNewline](a1);
      }
      else
      {
        v17.origin.x = x;
        v17.origin.y = y;
        v17.size.width = width;
        v17.size.height = height;
        CGRectIsNull(v17);
      }
    }
    else
    {
      x = *MEMORY[0x1E0C9D628];
    }
  }
  else
  {
    x = 0.0;
  }

  return x;
}

- (double)caretRectInCoordinateSpace:(uint64_t)a1
{
  id v3;
  double v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id *v21;
  id v22;
  double v23;
  CGRect v25;

  v3 = a2;
  if (!a1)
  {
    v4 = 0.0;
    goto LABEL_13;
  }
  v4 = *MEMORY[0x1E0C9D628];
  if (*(_QWORD *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (WeakRetained)
    {
      if (v6)
      {
        objc_msgSend(v7, "start");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(v8, "isEmpty");

          if (v11)
          {
            objc_msgSend(v8, "start");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "caretRectForPosition:", v12);
            v4 = v13;
            v15 = v14;
            v17 = v16;
            v19 = v18;

            v25.origin.x = v4;
            v25.origin.y = v15;
            v25.size.width = v17;
            v25.size.height = v19;
            if (!CGRectIsNull(v25))
            {
              objc_msgSend(v6, "PK_convertRect:toCoordinateSpace:", v3, v4, v15, v17, v19);
              v4 = v20;
            }
          }
        }
      }
    }

    goto LABEL_12;
  }
  v21 = (id *)(a1 + 32);
  v22 = objc_loadWeakRetained((id *)(a1 + 32));

  if (v22)
  {
    WeakRetained = objc_loadWeakRetained(v21);
    +[PKTextInputUITextInputInterface caretRectInCoordinateSpace:inTextInput:](PKTextInputUITextInputInterface, "caretRectInCoordinateSpace:inTextInput:", v3, WeakRetained);
    v4 = v23;
LABEL_12:

  }
LABEL_13:

  return v4;
}

- (double)caretRectForStartOfLineFromCharacterIndex:(void *)a3 coordinateSpace:(uint64_t *)a4 outCharacterIndex:
{
  id v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  if (a1)
  {
    v8 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](a1, a2, v7);
    v12 = v11;
    do
    {
      v13 = v8;
      v14 = v9;
      v15 = a2;
      if (a2-- < 1)
        break;
      v17 = v12;
      if (CGRectIsEmpty(*(CGRect *)&v8))
        break;
      v8 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:](a1, a2, v7);
      v19 = v12 * 0.5;
      v20 = v9 - v14;
      if (v9 - v14 < 0.0)
        v20 = -(v9 - v14);
      v12 = v18;
    }
    while (v20 <= v19);
    if (a4)
      *a4 = v15;
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (void)setSelectionWithReferencePoint:(double)a3 completionHandler:(double)a4
{
  void (**v7)(void);
  id v8;
  void *v9;
  id v10;
  id WeakRetained;
  id *v12;
  id v13;
  id v14;
  void (**v15)(void);

  v7 = a2;
  if (a1)
  {
    v15 = v7;
    v8 = a1[8];
    if (v8 && (v9 = v8, v10 = objc_loadWeakRetained(a1 + 7), v10, v9, v10))
    {
      WeakRetained = objc_loadWeakRetained(a1 + 7);
      objc_msgSend(WeakRetained, "selectPositionAtPoint:completionHandler:", v15, a3, a4);

    }
    else
    {
      v12 = a1 + 4;
      v13 = objc_loadWeakRetained(v12);

      if (v13)
      {
        v14 = objc_loadWeakRetained(v12);
        +[PKTextInputUITextInputInterface setSelectionWithReferencePoint:inTextInput:](PKTextInputUITextInputInterface, "setSelectionWithReferencePoint:inTextInput:", v14, a3, a4);

      }
      v15[2]();
    }
    v7 = v15;
  }

}

- (void)requestUpdatedApproximateCaretRectInCoordinateSpace:(void *)a3 completion:
{
  id v5;
  void (**v6)(_QWORD, __n128);
  id WeakRetained;
  __n128 v8;
  id v9;
  __n128 v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD, __n128);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      v8.n128_f64[0] = -[PKTextInputElementContent caretRectInCoordinateSpace:](a1, v5);
      v6[2](v6, v8);
    }
    else
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 56));

      if (v9)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0DC3F60]);
        objc_msgSend(v11, "setFlags:", 5);
        objc_msgSend(v11, "setSurroundingGranularity:", 0);
        objc_msgSend(v11, "setGranularityCount:", 2);
        v12 = objc_loadWeakRetained((id *)(a1 + 56));
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke;
        v13[3] = &unk_1E7779B08;
        v14 = v5;
        v15 = a1;
        v16 = v6;
        +[PKTextInputUtilities requestDocumentContext:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "requestDocumentContext:forWebDocumentSourceView:completionHandler:", v11, v12, v13);

      }
      else
      {
        v10.n128_u64[0] = *MEMORY[0x1E0C9D628];
        v6[2](v6, v10);
      }
    }
  }

}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_2;
  v8[3] = &unk_1E7779AE0;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double *p_x;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  double v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[7];
  uint64_t v16;
  CGRect *v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;
  __int128 v21;

  v16 = 0;
  v17 = (CGRect *)&v16;
  v19 = "";
  v18 = 0x4010000000;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v20 = *MEMORY[0x1E0C9D628];
  v21 = v2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_3;
  v15[3] = &unk_1E7779AB8;
  v15[5] = v3;
  v15[6] = v5;
  v15[4] = &v16;
  objc_msgSend(v4, "enumerateLayoutRects:", v15);
  if (!CGRectIsNull(v17[1]))
  {
    p_x = &v17->origin.x;
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 56));
    else
      WeakRetained = 0;
    v10 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v8, p_x[4], p_x[5], p_x[6], p_x[7]);
    v11 = (_QWORD *)&v17->origin.x;
    v17[1].origin.x = v10;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = v14;

  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(v17[1].origin.x, v17[1].origin.y, v17[1].size.width, v17[1].size.height);
  _Block_object_dispose(&v16, 8);
}

void __92__PKTextInputElementContent_requestUpdatedApproximateCaretRectInCoordinateSpace_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, double a5, double a6, double a7, double a8)
{
  uint64_t v8;
  uint64_t v9;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MaxX;

  v8 = *(_QWORD *)(a1 + 40);
  v9 = a2 + a3;
  if (a2 == v8 || v9 == v8)
  {
    if (!CGRectIsNull(*(CGRect *)&a5))
    {
      v17 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
      v17[4] = a5;
      v17[5] = a6;
      v17[6] = a7;
      v17[7] = a8;
      v18 = a5;
      v19 = a6;
      v20 = a7;
      v21 = a8;
      if (v9 == v8)
        MaxX = CGRectGetMaxX(*(CGRect *)&v18);
      else
        MaxX = CGRectGetMinX(*(CGRect *)&v18);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = MaxX;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = 0x4000000000000000;
    }
    *a4 = 1;
  }
}

- (void)requestUpdatedLastSelectionRectForCommittedTextLength:(void *)a3 targetCoordinateSpace:(void *)a4 completion:
{
  id v7;
  id v8;
  id WeakRetained;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a1)
    goto LABEL_18;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (!WeakRetained)
  {
    v24 = objc_loadWeakRetained((id *)(a1 + 56));

    if (v24)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0DC3F60]);
      objc_msgSend(v25, "setFlags:", 5);
      objc_msgSend(v25, "setSurroundingGranularity:", 0);
      objc_msgSend(v25, "setGranularityCount:", 2 * a2);
      v26 = objc_loadWeakRetained((id *)(a1 + 56));
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke;
      v27[3] = &unk_1E7779B80;
      v30 = a2;
      v27[4] = a1;
      v28 = v7;
      v29 = v8;
      +[PKTextInputUtilities requestDocumentContext:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "requestDocumentContext:forWebDocumentSourceView:completionHandler:", v25, v26, v27);

      goto LABEL_18;
    }
LABEL_15:
    (*((void (**)(id, uint64_t, double, double, double, double))v8 + 2))(v8, v11, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    goto LABEL_18;
  }
  v10 = -[PKTextInputElementContent selectedRange](a1);
  v11 = v10 - a2;
  if (v10 < a2)
    goto LABEL_15;
  v12 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PKTextInputElementContent selectionRectsForRange:inCoordinateSpace:visibleOnly:](a1, v11, a2, v7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v16, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v21);
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v22, "getValue:size:", &v31, 32);
        v23 = *(double *)&v32;
        if (*(double *)&v32 > 0.0)
        {
          v13 = *((double *)&v31 + 1);
          v12 = *(double *)&v31;
          v14 = *((double *)&v32 + 1);
          goto LABEL_17;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v19)
        continue;
      break;
    }
  }
  v23 = v15;
LABEL_17:

  (*((void (**)(id, double, double, double, double))v8 + 2))(v8, v12, v13, v23, v14);
LABEL_18:

}

- (uint64_t)selectedRange
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      if (-[PKTextInputElement isFocused](*(_QWORD *)(v1 + 8)))
      {
        v4 = objc_loadWeakRetained(v2);
        v1 = +[PKTextInputUITextInputInterface selectedRangeInTextInput:](PKTextInputUITextInputInterface, "selectedRangeInTextInput:", v4);

        return v1;
      }
    }
    else
    {
      v5 = *(void **)(v1 + 64);
      if (v5)
        return objc_msgSend(v5, "selectedTextRange");
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v1;
}

- (id)selectionRectsForRange:(uint64_t)a3 inCoordinateSpace:(void *)a4 visibleOnly:(int)a5
{
  id v9;
  id *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id WeakRetained;

  v9 = a4;
  if (a1 && (v10 = (id *)(a1 + 32), v11 = objc_loadWeakRetained((id *)(a1 + 32)), v11, v11))
  {
    if (a5)
    {
      v12 = *(id *)(a1 + 8);
      v13 = -[PKTextInputElement frame]((uint64_t)v12);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[PKTextInputElement coordinateSpace](*(_QWORD *)(a1 + 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, v9, v13, v15, v17, v19);
      v23 = v22;
      v25 = v24;
      v27 = v26;

    }
    else
    {
      v21 = *MEMORY[0x1E0C9D628];
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    WeakRetained = objc_loadWeakRetained(v10);
    +[PKTextInputUITextInputInterface selectionRectsForRange:inCoordinateSpace:inTextInput:intersectingRect:](PKTextInputUITextInputInterface, "selectionRectsForRange:inCoordinateSpace:inTextInput:intersectingRect:", a2, a3, v9, WeakRetained, v21, v23, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "sortTextRectsByCharacterRange");
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_2;
  block[3] = &unk_1E7779B58;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  block[1] = 3221225472;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  double *p_x;
  uint64_t v8;
  id WeakRetained;
  double v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[4];
  uint64_t v17;
  CGRect *v18;
  uint64_t v19;
  const char *v20;
  __int128 v21;
  __int128 v22;

  v17 = 0;
  v18 = (CGRect *)&v17;
  v20 = "";
  v19 = 0x4010000000;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v21 = *MEMORY[0x1E0C9D628];
  v22 = v2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
  v4 = *(_QWORD *)(a1 + 64);
  if (v3 >= v4)
  {
    v5 = v3 - v4;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v6 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_3;
    v15[3] = &unk_1E7779B30;
    v15[4] = &v17;
    v15[5] = v16;
    objc_msgSend(v6, "enumerateLayoutRectsWithOptions:characterRange:block:", 2, v5, v4, v15);
    _Block_object_dispose(v16, 8);
  }
  if (!CGRectIsNull(v18[1]))
  {
    p_x = &v18->origin.x;
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    else
      WeakRetained = 0;
    v10 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, *(void **)(a1 + 48), p_x[4], p_x[5], p_x[6], p_x[7]);
    v11 = (_QWORD *)&v18->origin.x;
    v18[1].origin.x = v10;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = v14;

  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(v18[1].origin.x, v18[1].origin.y, v18[1].size.width, v18[1].size.height);
  _Block_object_dispose(&v17, 8);
}

void __116__PKTextInputElementContent_requestUpdatedLastSelectionRectForCommittedTextLength_targetCoordinateSpace_completion___block_invoke_3(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  double *v14;
  uint64_t v15;
  double v16;
  double v17;
  double MaxY;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
  {
    v14 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    v14[4] = a2;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                             + 32))
                                                                 * 0.2;
    return;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v16 = *(double *)(v15 + 40);
  v17 = a3 - v16;
  if (a3 - v16 < 0.0)
    v17 = -(a3 - v16);
  if (v17 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v23.origin.x = a2;
    v23.origin.y = a3;
    v23.size.width = a4;
    v23.size.height = a5;
    MaxY = CGRectGetMaxY(v23);
    v24.origin.x = a2;
    v24.origin.y = a3;
    v24.size.width = a4;
    v24.size.height = a5;
    v19 = MaxY - CGRectGetMaxY(v24);
    if (v19 < 0.0)
      v19 = -v19;
    if (v19 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *a8 = 1;
      return;
    }
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(double *)(v15 + 40);
  }
  v20 = *(_QWORD *)(v15 + 32);
  v21 = *(_QWORD *)(v15 + 48);
  v22 = *(_QWORD *)(v15 + 56);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(&v16 - 1), v25);
}

- (id)rectValuesForSelectionRects:(void *)a3 inCoordinateSpace:(int)a4 visibleOnly:
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id WeakRetained;
  id v26;
  id *v27;
  void *v28;

  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v28 = 0;
    goto LABEL_10;
  }
  if (a4)
  {
    v9 = a1[1];
    v10 = -[PKTextInputElement frame]((uint64_t)v9);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PKTextInputElement coordinateSpace]((uint64_t)a1[1]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v8, v10, v12, v14, v16);
    v20 = v19;
    v22 = v21;
    v24 = v23;

  }
  else
  {
    v18 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    v26 = objc_loadWeakRetained(a1 + 4);
LABEL_9:
    +[PKTextInputUITextInputInterface rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:](PKTextInputUITextInputInterface, "rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:", v7, v8, v26, v18, v20, v22, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v27 = a1 + 5;
  v28 = objc_loadWeakRetained(v27);

  if (v28)
  {
    v26 = objc_loadWeakRetained(v27);
    goto LABEL_9;
  }
LABEL_10:

  return v28;
}

- (BOOL)hasLinkAtCharacterIndex:(void *)a3 location:(double)a4 coordinateSpace:(double)a5
{
  id v9;
  id *v10;
  id WeakRetained;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  double v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v9 = a3;
  if (a1)
  {
    v10 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PKTextInputElement coordinateSpace](*(_QWORD *)(a1 + 8));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v9, v13, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v16 = v15;

      v17 = objc_loadWeakRetained(v10);
      objc_msgSend(v17, "_anyTextItemConstrainedToLineAtPoint:", v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v18 != 0;
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v20, "textInputView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_7;
      v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v9, v18, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __78__PKTextInputElementContent_hasLinkAtCharacterIndex_location_coordinateSpace___block_invoke;
      v28[3] = &unk_1E7779BA8;
      v28[4] = &v29;
      objc_msgSend(v18, "_requestTextItemConstrainedToLineAtPoint:resultHandler:", v28, v21);
      v22 = *((unsigned __int8 *)v30 + 24);
      _Block_object_dispose(&v29, 8);
      if (v22)
      {
        v19 = 1;
      }
      else
      {
LABEL_7:
        v23 = objc_loadWeakRetained(v10);

        if (v23)
        {
          v24 = objc_loadWeakRetained(v10);
          +[PKTextInputUITextInputInterface attributesAtCharacterIndex:inTextInput:](PKTextInputUITextInputInterface, "attributesAtCharacterIndex:inTextInput:", a2, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1160]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v26 != 0;

      }
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

BOOL __78__PKTextInputElementContent_hasLinkAtCharacterIndex_location_coordinateSpace___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;

  result = CGRectIsEmpty(*(CGRect *)&a3);
  if (!result)
  {
    if (a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (uint64_t)indexOfLastNonWhitespaceCharacter
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = -[PKTextInputElementContent contentLength](a1);
  -[PKTextInputElementContent stringInRange:](a1, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v5, 4, 0, v2);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)insertTextsToCommit:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 completion:(void *)a7
{
  void (**v13)(id, uint64_t, _QWORD);
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _BOOL4 v24;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  _BOOL8 v32;
  uint64_t v33;
  id v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void (**v41)(id, uint64_t, _QWORD);
  id v42;
  uint64_t v43;
  id *location;
  id v45;
  id v46;
  uint64_t v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  void (**v52)(id, uint64_t, _QWORD);
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  void (**v56)(id, uint64_t, _QWORD);

  v46 = a2;
  v45 = a3;
  v42 = a4;
  v13 = a7;
  if (!a1)
    goto LABEL_43;
  location = a1 + 4;
  WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    v15 = v46;
    if (objc_msgSend(v46, "count"))
    {
      if (objc_msgSend(v46, "count"))
      {
        v16 = a6;
        v41 = v13;
        v17 = 0;
        v43 = 0;
        do
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v17, v41);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            v20 = 0;
          else
            v20 = v16;
          if (v17)
            v21 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v21 = a5;
          v22 = 0;
          if (v17 == objc_msgSend(v15, "count") - 1)
            v22 = v42;
          v23 = objc_loadWeakRetained(location);
          v24 = +[PKTextInputUITextInputInterface insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:](PKTextInputUITextInputInterface, "insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:", v18, v19, v22, v21, v20, v23);

          if (v24)
            v43 += objc_msgSend(v18, "length");
          v15 = v46;

        }
        while (++v17 < (unint64_t)objc_msgSend(v46, "count") && v24);
        if (v24)
        {
          v13 = v41;
          a6 = v16;
          v26 = v43;
          goto LABEL_33;
        }
        v33 = 0;
        v13 = v41;
        v26 = v43;
        if (!v41)
          goto LABEL_43;
LABEL_39:
        v13[2](v13, v33, v26);
        goto LABEL_43;
      }
      goto LABEL_32;
    }
    if (!v42 && !a6)
    {
LABEL_32:
      v26 = 0;
      goto LABEL_33;
    }
    v34 = objc_loadWeakRetained(location);
    v35 = +[PKTextInputUITextInputInterface insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:](PKTextInputUITextInputInterface, "insertCommittedText:withAlternatives:activePreviewText:replacingRange:inTextInput:", &stru_1E777DEE8, MEMORY[0x1E0C9AA60], v42, a5, a6, v34);

    v26 = 0;
    if (v35)
    {
LABEL_33:
      +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", v15, a5, a6, objc_msgSend(v45, "count"));
      v33 = 1;
      if (!v13)
        goto LABEL_43;
      goto LABEL_39;
    }
    v33 = 0;
    if (v13)
      goto LABEL_39;
  }
  else
  {
    v27 = a1[8];
    if (v27)
    {
      v28 = v27;
      v29 = objc_loadWeakRetained(a1 + 7);
      if (v29)
      {
        v30 = v29;
        v31 = objc_loadWeakRetained(a1 + 5);

        if (v31)
        {
          if (a5 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v47 = 0;
            v32 = -[PKTextInputElementContent _webInsertTextsToCommitPhase2:withAlternatives:activePreviewText:replacingRange:committedLength:]((_BOOL8)a1, v46, v45, v42, 0x7FFFFFFFFFFFFFFFLL, a6, &v47);
            if (v32)
              +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", v46, 0x7FFFFFFFFFFFFFFFLL, a6, objc_msgSend(v45, "count"));
            if (v13)
              v13[2](v13, v32, v47);
          }
          else
          {
            if (objc_msgSend(v46, "count") || objc_msgSend(v42, "length"))
            {
              v36 = objc_msgSend(a1[8], "deltaForSelectionRange:", a5, a6);
              v38 = v37;
              v39 = objc_loadWeakRetained(a1 + 7);
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke_2;
              v48[3] = &unk_1E7779BF8;
              v48[4] = a1;
              v49 = v46;
              v50 = v45;
              v51 = v42;
              v53 = a5;
              v54 = a6;
              v52 = v13;
              +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v36, v38, v39, v48);

              v40 = v49;
            }
            else
            {
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke;
              v55[3] = &unk_1E7779BD0;
              v56 = v13;
              -[PKTextInputElementContent deleteTextInRange:completion:]((uint64_t)a1, a5, a6, v55);
              v40 = v56;
            }

          }
          goto LABEL_43;
        }
      }
      else
      {

      }
    }
    if (v13)
      v13[2](v13, 0, 0);
  }
LABEL_43:

}

uint64_t __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)deleteTextInRange:(uint64_t)a3 completion:(void *)a4
{
  void (**v7)(id, _BOOL8);
  id *v8;
  id WeakRetained;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  _BOOL8 v30;
  _QWORD v31[5];
  void (**v32)(id, _BOOL8);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a4;
  if (a1)
  {
    v8 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      if (a3)
      {
        if (*(_QWORD *)(a1 + 16))
        {
          objc_msgSend(MEMORY[0x1E0DBDD20], "traitsForUITextInputTraits:");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = objc_alloc_init(MEMORY[0x1E0DBDD20]);
        }
        v20 = v10;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDCC8]), "initWithTextInputTraits:", v10);
        v22 = (void *)MEMORY[0x1E0DBDB78];
        v23 = objc_loadWeakRetained((id *)(a1 + 32));
        objc_msgSend(v22, "documentStateOfDocumentWithParagraph:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0;
        v36 = 0;
        objc_msgSend(v21, "smartDeleteForDocumentState:outBeforeLength:outAfterLength:", v24, &v36, &v35);
        a2 -= v36;
        a3 += v36 + v35;

      }
      if (qword_1ECEE61E8 != -1)
        dispatch_once(&qword_1ECEE61E8, &__block_literal_global_34);
      v25 = (id)_MergedGlobals_127;
      if (a2)
      {
        -[PKTextInputElementContent stringInRange:](a1, a2 - 1, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "length") == 1)
        {
          v27 = objc_msgSend(v25, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0));
          a3 += v27;
          if (v27)
            --a2;
        }

      }
      if (a2 + a3 < (unint64_t)-[PKTextInputElementContent contentLength](a1))
      {
        -[PKTextInputElementContent stringInRange:](a1, a2 + a3, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "length") == 1)
          a3 += objc_msgSend(v25, "characterIsMember:", objc_msgSend(v28, "characterAtIndex:", 0));

      }
      v29 = objc_loadWeakRetained(v8);
      v30 = +[PKTextInputUITextInputInterface deleteTextInRange:inTextInput:](PKTextInputUITextInputInterface, "deleteTextInRange:inTextInput:", a2, a3, v29);

      if (v30)
        +[PKTextInputUtilities markAnalyticsForDeletionCount:rangeToReplace:](PKTextInputUtilities, "markAnalyticsForDeletionCount:rangeToReplace:", a3, a2, a3);
      if (v7)
        v7[2](v7, v30);

    }
    else
    {
      v11 = *(id *)(a1 + 64);
      if (v11)
      {
        v12 = v11;
        v13 = objc_loadWeakRetained((id *)(a1 + 56));
        if (v13)
        {
          v14 = v13;
          v15 = objc_loadWeakRetained((id *)(a1 + 40));

          if (v15)
          {
            v16 = objc_msgSend(*(id *)(a1 + 64), "deltaForSelectionRange:", a2, a3);
            v18 = v17;
            v19 = objc_loadWeakRetained((id *)(a1 + 56));
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __58__PKTextInputElementContent_deleteTextInRange_completion___block_invoke;
            v31[3] = &unk_1E7779C20;
            v31[4] = a1;
            v33 = a2;
            v34 = a3;
            v32 = v7;
            +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v16, v18, v19, v31);

            goto LABEL_31;
          }
        }
        else
        {

        }
      }
      if (v7)
        v7[2](v7, 0);
    }
  }
LABEL_31:

}

uint64_t __110__PKTextInputElementContent_insertTextsToCommit_withAlternatives_activePreviewText_replacingRange_completion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  v2 = -[PKTextInputElementContent _webInsertTextsToCommitPhase2:withAlternatives:activePreviewText:replacingRange:committedLength:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), &v4);
  if (v2)
    +[PKTextInputUtilities markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:](PKTextInputUtilities, "markAnalyticsForInsertionWithTexts:rangeToReplace:withAlternatives:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 48), "count"));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8, uint64_t))(result + 16))(result, v2, v4);
  return result;
}

- (BOOL)_webInsertTextsToCommitPhase2:(void *)a3 withAlternatives:(void *)a4 activePreviewText:(uint64_t)a5 replacingRange:(uint64_t)a6 committedLength:(_QWORD *)a7
{
  id v12;
  id WeakRetained;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD *v22;
  id v23;
  id v25;

  v12 = a2;
  v25 = a3;
  v23 = a4;
  if (!a1)
    goto LABEL_21;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22 = a7;
  if (WeakRetained)
  {
    if (objc_msgSend(v12, "count"))
    {
      if (objc_msgSend(v12, "count"))
      {
        v14 = 0;
        v15 = 0;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            v18 = 0;
          else
            v18 = a6;
          if (v14)
            v19 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v19 = a5;
          v20 = 0;
          if (v14 == objc_msgSend(v12, "count") - 1)
            v20 = v23;
          -[PKTextInputElementContent _webInsertCommittedTextPhase3:withAlternatives:activePreviewText:replacingRange:webTextInput:](v16, v17, v20, v19, v18, WeakRetained);
          v15 += objc_msgSend(v16, "length");

          ++v14;
        }
        while (v14 < objc_msgSend(v12, "count"));
        goto LABEL_18;
      }
    }
    else
    {
      -[PKTextInputElementContent _webInsertCommittedTextPhase3:withAlternatives:activePreviewText:replacingRange:webTextInput:](&stru_1E777DEE8, MEMORY[0x1E0C9AA60], v23, a5, a6, WeakRetained);
    }
  }
  v15 = 0;
LABEL_18:
  if (v22)
    *v22 = v15;

  a1 = WeakRetained != 0;
LABEL_21:

  return a1;
}

- (void)_webInsertCommittedTextPhase3:(void *)a3 withAlternatives:(uint64_t)a4 activePreviewText:(uint64_t)a5 replacingRange:(void *)a6 webTextInput:
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v11 = a2;
  v12 = a3;
  v13 = a6;
  if (objc_msgSend(v10, "length") | a5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "insertText:alternatives:style:", v10, v11, 1);
    }
    else
    {
      v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v30 = v13;
        v31 = 2112;
        v32 = v16;
        v33 = 2048;
        v34 = objc_msgSend(v10, "length");
        v35 = 2048;
        v36 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertText:alternatives:style:. Inserting text of %ld length and ignoring %ld alternatives.", buf, 0x2Au);

      }
      objc_msgSend(v13, "insertText:", v10);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "markedTextRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v13, "markedTextRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEmpty") ^ 1;

    }
    else
    {
      v19 = 0;
    }

    if (-[__CFString length](v12, "length") || v19)
    {
      if (!v12)
        v12 = &stru_1E777DEE8;
      v20 = -[__CFString length](v12, "length");
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "styledActivePreview"))
      {
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.3, *MEMORY[0x1E0DC1140]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v23;
          v27[1] = *MEMORY[0x1E0DC1100];
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28[1] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v25);
          objc_msgSend(v13, "setAttributedMarkedText:selectedRange:", v26, v20, 0);

          goto LABEL_21;
        }
      }
      else
      {

      }
      objc_msgSend(v13, "setMarkedText:selectedRange:", v12, v20, 0);
    }
  }
LABEL_21:

}

void __68__PKTextInputElementContent_controlCharacterSetUsedByEducationPanel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 17, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_127;
  _MergedGlobals_127 = v0;

}

void __58__PKTextInputElementContent_deleteTextInRange_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (v3 = (void *)v2, v4 = objc_opt_respondsToSelector(), v3, (v4 & 1) != 0))
  {
    objc_msgSend(v8, "performDelete");
  }
  else
  {
    v5 = a1[4];
    if (v5)
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 40));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "deleteBackward");

  }
  +[PKTextInputUtilities markAnalyticsForDeletionCount:rangeToReplace:](PKTextInputUtilities, "markAnalyticsForDeletionCount:rangeToReplace:", a1[7], a1[6], a1[7]);
  v7 = a1[5];
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);

}

- (void)selectTextInRange:(uint64_t)a3 completion:(void *)a4
{
  void (**v7)(id, _BOOL8);
  id *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  id *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  void (**v28)(id, _BOOL8);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a4;
  if (a1)
  {
    v8 = a1 + 4;
    WeakRetained = objc_loadWeakRetained(a1 + 4);

    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained(v8);
      v11 = +[PKTextInputUITextInputInterface selectedRangeInTextInput:](PKTextInputUITextInputInterface, "selectedRangeInTextInput:", v10);
      v13 = v12;

      v14 = objc_loadWeakRetained(v8);
      v15 = +[PKTextInputUITextInputInterface selectTextInRange:inTextInput:](PKTextInputUITextInputInterface, "selectTextInRange:inTextInput:", a2, a3, v14);

      +[PKTextInputUtilities markAnalyticsForSelectionChange:relativeRangeBefore:](PKTextInputUtilities, "markAnalyticsForSelectionChange:relativeRangeBefore:", a2, a3, v11, v13);
      if (v7)
        v7[2](v7, v15);
    }
    else
    {
      v16 = a1[8];
      if (v16
        && (v17 = v16, v18 = a1 + 7, v19 = objc_loadWeakRetained(a1 + 7), v19, v17, v19))
      {
        v20 = objc_msgSend(a1[8], "selectedTextRange");
        v22 = v21;
        v23 = objc_msgSend(a1[8], "deltaForSelectionRange:", a2, a3);
        v25 = v24;
        v26 = objc_loadWeakRetained(v18);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __58__PKTextInputElementContent_selectTextInRange_completion___block_invoke;
        v27[3] = &unk_1E7779C48;
        v29 = a2;
        v30 = a3;
        v31 = v20;
        v32 = v22;
        v28 = v7;
        +[PKTextInputUtilities adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "adjustSelectionWithDelta:forWebDocumentSourceView:completionHandler:", v23, v25, v26, v27);

      }
      else if (v7)
      {
        v7[2](v7, 0);
      }
    }
  }

}

uint64_t __58__PKTextInputElementContent_selectTextInRange_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;

  +[PKTextInputUtilities markAnalyticsForSelectionChange:relativeRangeBefore:](PKTextInputUtilities, "markAnalyticsForSelectionChange:relativeRangeBefore:", a1[5], a1[6], a1[7], a1[8]);
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)configureSelectionStyleForHighlight
{
  id *v2;
  id WeakRetained;
  id *v4;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v4 = v2;
  else
    v4 = (id *)(a1 + 40);
  v5 = objc_loadWeakRetained(v4);

  if (v5)
    v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForHighlightInTextInput:](PKTextInputUITextInputInterface, "configureSelectionStyleForHighlightInTextInput:", v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)configureSelectionStyleForDeletionPreview
{
  id *v2;
  id WeakRetained;
  id *v4;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v4 = v2;
  else
    v4 = (id *)(a1 + 40);
  v5 = objc_loadWeakRetained(v4);

  if (v5)
    v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForDeletionPreviewInTextInput:](PKTextInputUITextInputInterface, "configureSelectionStyleForDeletionPreviewInTextInput:", v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)configureSelectionStyleForNormalSelection
{
  id *v2;
  id WeakRetained;
  id *v4;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v4 = v2;
  else
    v4 = (id *)(a1 + 40);
  v5 = objc_loadWeakRetained(v4);

  if (v5)
    v6 = +[PKTextInputUITextInputInterface configureSelectionStyleForNormalSelectionInTextInput:](PKTextInputUITextInputInterface, "configureSelectionStyleForNormalSelectionInTextInput:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)_insertTextPlaceholderWithSize:(double)a3 completionHandler:(double)a4
{
  void (**v7)(id, void *);
  id WeakRetained;
  id v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 32));
      +[PKTextInputUITextInputInterface insertTextPlaceholderWithSize:inTextInput:](PKTextInputUITextInputInterface, "insertTextPlaceholderWithSize:inTextInput:", v9, a3, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v10);
LABEL_4:

      goto LABEL_5;
    }
    v11 = (id *)(a1 + 56);
    v12 = objc_loadWeakRetained(v11);

    if (v12)
    {
      v10 = objc_loadWeakRetained(v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __78__PKTextInputElementContent__insertTextPlaceholderWithSize_completionHandler___block_invoke;
        v19[3] = &unk_1E7779C70;
        v20 = v7;
        objc_msgSend(v10, "insertTextPlaceholderWithSize:completionHandler:", v19, a3, a4);

      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "insertDictationResultPlaceholder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v10, "frameForDictationResultPlaceholder:", v13);
          }
          else
          {
            v14 = *MEMORY[0x1E0C9D628];
            v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
            v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
            v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
          }
          +[PKTextInputTextPlaceholder placeholderWithToken:frame:](PKTextInputTextPlaceholder, "placeholderWithToken:frame:", v13, v14, v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v18);

        }
        else
        {
          v7[2](v7, 0);
        }

      }
      else
      {
        v7[2](v7, 0);
      }
      goto LABEL_4;
    }
    if (v7)
      v7[2](v7, 0);
  }
LABEL_5:

}

void __78__PKTextInputElementContent__insertTextPlaceholderWithSize_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[PKTextInputTextPlaceholder placeholderWithWebTextPlaceholder:](PKTextInputTextPlaceholder, "placeholderWithWebTextPlaceholder:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_removeTextPlaceholder:(uint64_t)a3 willInsertText:(void *)a4 completionHandler:
{
  void (**v7)(_QWORD);
  id WeakRetained;
  id v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 32));
      +[PKTextInputUITextInputInterface removeTextPlaceholder:inTextInput:](PKTextInputUITextInputInterface, "removeTextPlaceholder:inTextInput:", v15, v9);

LABEL_4:
      v7[2](v7);
      goto LABEL_12;
    }
    v10 = (id *)(a1 + 56);
    v11 = objc_loadWeakRetained(v10);

    if (!v11)
      goto LABEL_4;
    v12 = objc_loadWeakRetained(v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "placeholder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeTextPlaceholder:willInsertText:completionHandler:", v13, a3, v7);

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "placeholder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeDictationResultPlaceholder:willInsertResult:", v14, a3);

      }
      v7[2](v7);
    }

  }
LABEL_12:

}

- (double)frameForTextPlaceholder:(void *)a3 inCoordinateSpace:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;
  id v18;
  void *v19;
  double v20;
  id *v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v20 = 0.0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "rects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v18, "textInputView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v6, v10, v12, v14, v16);

  }
  else
  {
    v21 = (id *)(a1 + 56);
    v22 = objc_loadWeakRetained(v21);

    if (!v22)
    {
      v20 = *MEMORY[0x1E0C9D628];
      goto LABEL_7;
    }
    v18 = objc_loadWeakRetained(v21);
    v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v18, v6, v10, v12, v14, v16);
  }

LABEL_7:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__webDocumentCurrentLineContext, 0);
  objc_storeStrong((id *)&self->__webDocumentContext, 0);
  objc_destroyWeak((id *)&self->__webDocumentSourceView);
  objc_storeStrong((id *)&self->__webComposedContextString, 0);
  objc_destroyWeak((id *)&self->__webTextInput);
  objc_destroyWeak((id *)&self->__textInput);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
