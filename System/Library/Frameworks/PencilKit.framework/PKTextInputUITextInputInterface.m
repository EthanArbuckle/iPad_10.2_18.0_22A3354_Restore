@implementation PKTextInputUITextInputInterface

+ (BOOL)makeTextInputFirstResponder:(id)a3 forPencilInput:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a4;
  v5 = a3;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "set_textInputSource:", 3);
  if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "textInputTraits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && (objc_msgSend(v7, "deferBecomingResponder") & 1) != 0)
      {
        objc_msgSend(v8, "setDeferBecomingResponder:", 0);
        v6 = objc_msgSend(v5, "becomeFirstResponder");
        objc_msgSend(v8, "setDeferBecomingResponder:", 1);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v8 = 0;
    }
    v6 = objc_msgSend(v5, "becomeFirstResponder");
    goto LABEL_12;
  }
  v6 = 1;
LABEL_13:
  v9 = objc_msgSend(v5, "isFirstResponder") & v6;

  return v9;
}

+ (BOOL)isValidRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:offset:", v7, location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "positionFromPosition:offset:", v8, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;

  return v11;
}

+ (BOOL)_callShouldChangeTextInRange:(id)a3 replacementText:(id)a4 inTextInput:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v10, "conformsToProtocol:", &unk_1EF5D6B48))
  {
    objc_msgSend(v8, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "end");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "_rangeFromUITextPosition:toUITextPosition:inTextInput:", v11, v12, v10);
    v15 = v14;

    v16 = objc_msgSend(v10, "keyboardInput:shouldReplaceTextInRange:replacementText:", v10, v13, v15, v9);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = 1;
      goto LABEL_10;
    }
    if (!v8)
    {
      v17 = 0;
      goto LABEL_10;
    }
    v16 = objc_msgSend(v10, "shouldChangeTextInRange:replacementText:", v8, v9);
  }
  v17 = v16;
LABEL_10:

  return v17;
}

+ (BOOL)_callShouldInsertText:(id)a3 inTextInput:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  char v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "conformsToProtocol:", &unk_1EF5D6B48))
  {
    v9 = objc_msgSend(v8, "keyboardInput:shouldInsertText:isMarkedText:", v8, v7, v5);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v9 = objc_msgSend(v8, "shouldChangeTextInRange:replacementText:", v10, v7);
    else
      v9 = 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (BOOL)insertCommittedText:(id)a3 withAlternatives:(id)a4 activePreviewText:(id)a5 replacingRange:(_NSRange)a6 inTextInput:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  id v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];

  length = a6.length;
  location = a6.location;
  v68[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (__CFString *)a5;
  v16 = a7;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    if (objc_msgSend(v13, "length") | length)
    {
      LODWORD(v17) = objc_msgSend(a1, "_callShouldInsertText:inTextInput:isMarkedText:", v13, v16, 0);
      v18 = v16;
      if ((_DWORD)v17)
      {
        v56 = v14;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((objc_opt_respondsToSelector() & 1) == 0 || (isKindOfClass & 1) != 0)
        {
          v24 = objc_opt_respondsToSelector();
          v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          if ((v24 & 1) != 0)
          {
            v14 = v56;
            if (v26)
            {
              v27 = (objc_class *)objc_opt_class();
              NSStringFromClass(v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v60 = v18;
              v61 = 2112;
              v62 = v28;
              v63 = 2048;
              v64 = objc_msgSend(v13, "length");
              _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertAttributedText:. Inserting text of length %ld.", buf, 0x20u);

            }
            objc_msgSend(v18, "insertText:alternatives:style:", v13, v56, 1);
          }
          else
          {
            v14 = v56;
            if (v26)
            {
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v60 = v18;
              v61 = 2112;
              v62 = v30;
              v63 = 2048;
              v64 = objc_msgSend(v13, "length");
              v65 = 2048;
              v66 = objc_msgSend(v56, "count");
              _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Text input <%p %@> does not support insertText:alternatives:style:. Inserting text of length %ld and ignoring %ld alternatives.", buf, 0x2Au);

            }
            objc_msgSend(v18, "insertText:", v13);
          }
        }
        else
        {
          objc_opt_class();
          if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            && objc_msgSend(v18, "textAlignment") != 4)
          {
            v54 = 0;
            v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v13);
          }
          else
          {
            v20 = (void *)objc_opt_new();
            if (objc_msgSend(v13, "_isNaturallyRTL"))
              v21 = 2;
            else
              v21 = 0;
            objc_msgSend(v20, "setAlignment:", v21);
            v22 = objc_alloc(MEMORY[0x1E0CB3778]);
            v67 = *MEMORY[0x1E0DC1178];
            v68[0] = v20;
            v54 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)objc_msgSend(v22, "initWithString:attributes:", v13, v23);

          }
          v31 = objc_opt_respondsToSelector();
          v14 = v56;
          if (v56 && (v31 & 1) != 0 && objc_msgSend(v56, "count"))
          {
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12A8]), "initWithPrimaryString:alternativeStrings:", v13, v56);
            v14 = v56;
            objc_msgSend(v55, "addAttribute:value:range:", *MEMORY[0x1E0DC11C8], v32, 0, objc_msgSend(v55, "length"));

          }
          objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v33, "start");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "textStylingAtPosition:inDirection:", v34, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v35, "mutableCopy");

            if (v36)
            {
              if (v54)
              {
                v53 = *MEMORY[0x1E0DC1178];
                objc_msgSend(v36, "objectForKeyedSubscript:");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = (void *)objc_msgSend(v37, "mutableCopy");

                v38 = v54;
                if (v52)
                {
                  objc_msgSend(v52, "setAlignment:", objc_msgSend(v54, "alignment", v54));
                  v38 = v52;
                }
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, v53);

              }
              objc_msgSend(v55, "addAttributes:range:", v36, 0, objc_msgSend(v55, "length"));
            }

            v14 = v56;
          }
          objc_msgSend(v18, "insertAttributedText:", v55);

        }
      }

    }
    else
    {
      LODWORD(v17) = 1;
    }
    goto LABEL_39;
  }
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v16, "setSelectedTextRange:", v17);

    goto LABEL_4;
  }
LABEL_39:
  objc_msgSend(v16, "markedTextRange");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v16, "markedTextRange");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEmpty") ^ 1;

  }
  else
  {
    v41 = 0;
  }

  if ((_DWORD)v17)
  {
    if (-[__CFString length](v15, "length"))
      v42 = 1;
    else
      v42 = v41;
    if (v42 != 1)
      goto LABEL_56;
    if (!v15)
      v15 = &stru_1E777DEE8;
    if (objc_msgSend(a1, "_callShouldInsertText:inTextInput:isMarkedText:", v15, v16, 1))
    {
      v43 = -[__CFString length](v15, "length");
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "styledActivePreview"))
      {
        v45 = objc_opt_respondsToSelector();

        if ((v45 & 1) != 0)
        {
          v57[0] = *MEMORY[0x1E0DC1140];
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = v46;
          v57[1] = *MEMORY[0x1E0DC1100];
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v58[1] = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v48);
          objc_msgSend(v16, "setAttributedMarkedText:selectedRange:", v49, v43, 0);

LABEL_56:
          v50 = 1;
          goto LABEL_57;
        }
      }
      else
      {

      }
      objc_msgSend(v16, "setMarkedText:selectedRange:", v15, v43, 0);
      goto LABEL_56;
    }
  }
  v50 = 0;
LABEL_57:

  return v50;
}

+ (id)insertTextPlaceholderWithSize:(CGSize)a3 inTextInput:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (width <= 0.0)
    {
      if (height <= 0.0)
      {
        v9 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v8, "start");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "caretRectForPosition:", v16);
      v18 = v17;

      v19 = vcvtpd_s64_f64(height / v18);
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 >= 1)
      {
        do
        {
          objc_msgSend(v9, "appendString:", CFSTR("\n"));
          --v19;
        }
        while (v19);
      }
    }
    else
    {
      v14 = vcvtpd_s64_f64(width / 5.0);
      if (v14 <= 16)
        v15 = 16;
      else
        v15 = v14;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(v9, "appendString:", CFSTR(" "));
        --v15;
      }
      while (v15);
    }
    if (v9 && objc_msgSend(a1, "_callShouldInsertText:inTextInput:isMarkedText:", v9, v7, 0))
    {
      objc_msgSend(a1, "notifyTextWillChangeInTextInput:", v7);
      objc_msgSend(v7, "insertText:", v9);
      objc_msgSend(v7, "selectedTextRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21
        && (v22 = (void *)v21,
            objc_msgSend(v20, "end"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v22,
            v23))
      {
        objc_msgSend(v8, "start");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "end");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "textRangeFromPosition:toPosition:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "selectionRectsForRange:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKTextInputTextPlaceholder placeholderWithText:rects:](PKTextInputTextPlaceholder, "placeholderWithText:rects:", v9, v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v20, "end");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "caretRectForPosition:", v26);
        +[PKTextInputTextPlaceholder placeholderWithToken:frame:](PKTextInputTextPlaceholder, "placeholderWithToken:frame:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_3;
    }
LABEL_22:

    v10 = 0;
    goto LABEL_23;
  }
  objc_msgSend(a1, "notifyTextWillChangeInTextInput:", v7);
  objc_msgSend(v7, "insertTextPlaceholderWithSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputTextPlaceholder placeholderWithTextPlaceholder:](PKTextInputTextPlaceholder, "placeholderWithTextPlaceholder:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:

  if (v10)
  {
    objc_msgSend(v8, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "start");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textRangeFromPosition:toPosition:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSelectedTextRange:", v13);
  }
  objc_msgSend(a1, "notifyTextDidChangeInTextInput:", v7);
LABEL_23:

  return v10;
}

+ (void)removeTextPlaceholder:(id)a3 inTextInput:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "placeholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(a1, "notifyTextWillChangeInTextInput:", v6);
      objc_msgSend(v19, "placeholder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeTextPlaceholder:", v9);

      objc_msgSend(a1, "notifyTextDidChangeInTextInput:", v6);
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v19, "placeholder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v19, "placeholder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "positionFromPosition:offset:", v14, objc_msgSend(v12, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "start");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "textInRange:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", v12)
      && objc_msgSend(a1, "_callShouldChangeTextInRange:replacementText:inTextInput:", v17, &stru_1E777DEE8, v6))
    {
      objc_msgSend(a1, "notifyTextWillChangeInTextInput:", v6);
      objc_msgSend(v6, "replaceRange:withText:", v17, &stru_1E777DEE8);
      objc_msgSend(a1, "notifyTextDidChangeInTextInput:", v6);
    }

  }
LABEL_10:

}

+ (BOOL)deleteTextInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  BOOL v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && objc_msgSend(a1, "_callShouldChangeTextInRange:replacementText:inTextInput:", v8, &stru_1E777DEE8, v7))
  {
    objc_msgSend(v7, "setSelectedTextRange:", v8);
    objc_msgSend(v7, "deleteBackward");
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (_NSRange)selectedRangeInTextInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "_rangeFromUITextPosition:toUITextPosition:inTextInput:", v7, v8, v4);
    v11 = v10;

  }
  else
  {
    v11 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

+ (BOOL)selectTextInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = objc_msgSend(a1, "_selectTextRange:inTextInput:", v8, v7);

  return location;
}

+ (BOOL)_selectTextRange:(id)a3 inTextInput:(id)a4
{
  id v5;
  id v6;
  void *v7;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend(v5, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionWillChange:", v5);
    objc_msgSend(v5, "setSelectedTextRange:", v6);

    objc_msgSend(v7, "selectionDidChange:", v5);
  }
  return a3 != 0;
}

+ (BOOL)setSelectionWithReferencePoint:(CGPoint)a3 inTextInput:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  char v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "closestPositionToPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(a1, "_selectTextRange:inTextInput:", v9, v7);

  return v10;
}

+ (BOOL)selectWordBoundaryAtPoint:(CGPoint)a3 inTextInput:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t (**v15)(void *, void *);
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat MidX;
  CGFloat v39;
  CGFloat MidY;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  id v45;
  void *v46;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  id v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  id v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "closestPositionToPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginningOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endOfDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKTextInputUITextInputInterface_selectWordBoundaryAtPoint_inTextInput___block_invoke;
  aBlock[3] = &unk_1E777D2A8;
  v12 = v7;
  v53 = v12;
  v13 = v9;
  v54 = v13;
  v14 = v10;
  v55 = v14;
  v15 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  if (v11)
  {
    v16 = v11;
    v51 = v13;
    do
    {
      v17 = v15[2](v15, v16);
      if ((v17 & 1) != 0)
        break;
      objc_msgSend(v12, "tokenizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:toBoundary:inDirection:", v16, 1, 1);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v19;
    }
    while (v19);
    v20 = v11;
    do
    {
      if ((v15[2](v15, v20) & 1) != 0)
      {
        if (v17)
        {
          objc_msgSend(v12, "caretRectForPosition:", v16);
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;
          objc_msgSend(v12, "caretRectForPosition:", v20);
          v49 = v34;
          v50 = v33;
          v36 = v35;
          v48 = v37;
          v56.origin.x = v26;
          v56.origin.y = v28;
          v56.size.width = v30;
          v56.size.height = v32;
          MidX = CGRectGetMidX(v56);
          v39 = (MidX - x) * (MidX - x);
          v57.origin.x = v26;
          v57.origin.y = v28;
          v57.size.width = v30;
          v57.size.height = v32;
          MidY = CGRectGetMidY(v57);
          v41 = v39 + (MidY - y) * (MidY - y);
          v58.origin.x = v50;
          v58.origin.y = v36;
          v58.size.width = v49;
          v58.size.height = v48;
          v42 = CGRectGetMidX(v58);
          v43 = (v42 - x) * (v42 - x);
          v59.origin.x = v50;
          v59.origin.y = v36;
          v59.size.width = v49;
          v59.size.height = v48;
          v44 = CGRectGetMidY(v59);
          if (v41 >= v43 + (v44 - y) * (v44 - y))
            v23 = v20;
          else
            v23 = v16;
        }
        else
        {
          v23 = v20;
        }
        goto LABEL_17;
      }
      objc_msgSend(v12, "tokenizer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "positionFromPosition:toBoundary:inDirection:", v20, 1, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
    while (v22);
    if ((v17 & 1) == 0)
    {
      v24 = 0;
      goto LABEL_18;
    }
    v20 = 0;
    v23 = v16;
LABEL_17:
    v45 = v23;

    objc_msgSend(v12, "textRangeFromPosition:toPosition:", v45, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(a1, "_selectTextRange:inTextInput:", v46, v12);

    v11 = v45;
LABEL_18:
    v13 = v51;
  }
  else
  {
    v16 = 0;
    v24 = 0;
  }

  return v24;
}

uint64_t __73__PKTextInputUITextInputInterface_selectWordBoundaryAtPoint_inTextInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tokenizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if ((objc_msgSend(v4, "isPosition:atBoundary:inDirection:", v3, 1, 0) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48));
  }

  return v5;
}

+ (BOOL)showSelectionCommandsForTextInput:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();
    if ((v5 & 1) != 0)
      objc_msgSend(v4, "showSelectionCommands");

  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

+ (BOOL)configureSelectionStyleForHighlightInTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v4 != 0;
    if (v4)
      objc_msgSend(v4, "configureForPencilHighlightMode");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)configureSelectionStyleForDeletionPreviewInTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v4 != 0;
    if (v4)
      objc_msgSend(v4, "configureForPencilDeletionPreviewMode");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)configureSelectionStyleForNormalSelectionInTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v4 != 0;
    if (v4)
      objc_msgSend(v4, "configureForSelectionMode");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (CGRect)caretRectInCoordinateSpace:(id)a3 inTextInput:(id)a4
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caretRectForPosition:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "textInputView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v6, v10, v12, v14, v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (_NSRange)activePreviewRangeInTextInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v3 = a3;
  objc_msgSend(v3, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && v5)
  {
    objc_msgSend(v5, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v4, v9);

    objc_msgSend(v6, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v10, v11);

  }
  v12 = v8;
  v13 = v7;
  result.length = v13;
  result.location = v12;
  return result;
}

+ (BOOL)clearActivePreviewInTextInput:(id)a3
{
  objc_msgSend(a3, "setMarkedText:selectedRange:", 0, 0, 0);
  return 1;
}

+ (int64_t)contentLengthForTextInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_msgSend(v4, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOfDocument");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v4, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_rangeFromUITextPosition:toUITextPosition:inTextInput:", v9, v10, v4);
    v8 = v11;

  }
  return v8;
}

+ (id)stringInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "textInRange:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)editableTextAttachmentFileTypes
{
  if (qword_1ECEE6510 != -1)
    dispatch_once(&qword_1ECEE6510, &__block_literal_global_81);
  return (id)_MergedGlobals_152;
}

void __66__PKTextInputUITextInputInterface_editableTextAttachmentFileTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.notes.inlinetextattachment"), CFSTR("com.apple.notes.inlinetextattachment.hashtag"), CFSTR("com.apple.notes.inlinetextattachment.mention"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_152;
  _MergedGlobals_152 = v0;

}

+ (BOOL)isProtectedTextAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(v4, "fileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "editableTextAttachmentFileTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)protectedCharacterIndexesInRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isEmpty") & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = objc_msgSend(a1, "selectedRangeInTextInput:", v7);
    v23 = v12;
    if (length)
    {
      v13 = 0;
      v21 = *MEMORY[0x1E0DC10F8];
      v22 = location - v11;
      do
      {
        objc_msgSend(v9, "start");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:offset:", v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if ((v22 + v13) | v23)
          {
            v17 = 0;
LABEL_11:
            objc_msgSend(v7, "textStylingAtPosition:inDirection:", v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || objc_msgSend(a1, "isProtectedTextAttachment:", v19))
            {
              objc_msgSend(v10, "addIndex:", location + v13);
            }

            goto LABEL_16;
          }
          objc_msgSend(v7, "positionFromPosition:offset:", v15, 1);
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
          v17 = 1;
          if (v16)
            goto LABEL_11;
        }
LABEL_16:
        ++v13;
      }
      while (length != v13);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)attributesAtCharacterIndex:(int64_t)a3 inTextInput:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "positionFromPosition:offset:", v6, a3), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "textStylingAtPosition:inDirection:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (_NSRange)rangeOfCharacterAtIndex:(unint64_t)a3 inTextInput:(id)a4
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  v4 = a3;
  if (a3 >= 0xA)
    v6 = a3 - 10;
  else
    v6 = 0;
  v7 = a3 + 20;
  v8 = a4;
  v9 = objc_msgSend(a1, "contentLengthForTextInput:", v8) - 1;
  if (v7 < v9)
    v9 = v7;
  objc_msgSend(a1, "stringInRange:inTextInput:", v6, v9 - v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") <= v4 - v6)
  {
    v14 = 1;
  }
  else
  {
    v11 = objc_msgSend(v10, "rangeOfComposedCharacterSequenceAtIndex:", v4 - v6);
    v13 = v11 + v6;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v14 = 1;
    else
      v14 = v12;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      v4 = v13;
  }

  v15 = v4;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

+ (CGRect)firstRectForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "firstRectForRange:", v11);
    v15 = v12;
    v17 = v16;
    v18 = v13;
    v19 = v14;
    if (v14 > 0.0)
    {
      v12 = v13 / v14;
      if (v13 / v14 > 1.0 && length == 1)
      {
        objc_msgSend(v10, "textInRange:", v11, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length") == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", 0));

          if (v23)
            v18 = v19 * 0.5;
        }

      }
    }
    objc_msgSend(v10, "textInputView", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v24, v9, v15, v17, v18, v19);
    v27 = v26;
    v29 = v28;
    v31 = v30;

  }
  else
  {
    v25 = *MEMORY[0x1E0C9D628];
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v31 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6
{
  return objc_msgSend(a1, "characterIndexClosestToPoint:inCoordinateSpace:inTextInput:forInsertingText:adjustForLastCharacter:", a4, a5, a6, 1, a3.x, a3.y);
}

+ (int64_t)characterIndexClosestToPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 forInsertingText:(BOOL)a6 adjustForLastCharacter:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v7 = a7;
  v8 = a6;
  y = a3.y;
  x = a3.x;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v13, "textInputView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v14, v15, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v18 = v17;

  objc_msgSend(v13, "closestPositionToPoint:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginningOfDocument");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endOfDocument");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v19)
    v23 = v20 == 0;
  else
    v23 = 1;
  if (v23 || v21 == 0)
  {
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v26 = objc_msgSend(v13, "offsetFromPosition:toPosition:", v20, v19);
    if (v26 <= 1)
      v27 = 1;
    else
      v27 = v26;
    v28 = v27 - 1;
    if (v8)
      v25 = v26;
    else
      v25 = v28;
    if (objc_msgSend(v13, "offsetFromPosition:toPosition:", v20, v22) >= 1
      && objc_msgSend(v19, "isEqual:", v22)
      && v7)
    {
      objc_msgSend(v13, "positionFromPosition:offset:", v22, -1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = objc_msgSend(a1, "_rangeFromUITextPosition:toUITextPosition:inTextInput:", v30, v22, v13);
        v33 = v32;
        objc_msgSend(v13, "textInputView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "firstRectForRange:inCoordinateSpace:inTextInput:", v31, v33, v34, v13);
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;

        v49.origin.x = v36;
        v49.origin.y = v38;
        v49.size.width = v40;
        v49.size.height = v42;
        if (!CGRectIsNull(v49))
        {
          v50.origin.x = v36;
          v50.origin.y = v38;
          v50.size.width = v40;
          v50.size.height = v42;
          v43 = v18 - CGRectGetMaxY(v50);
          if (v43 >= 0.0 && v43 < v42)
          {
            v51.origin.x = v36;
            v51.origin.y = v38;
            v51.size.width = v40;
            v51.size.height = v42;
            objc_msgSend(v13, "closestPositionToPoint:", v16, CGRectGetMidY(v51));
            v45 = objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              v46 = objc_msgSend(v13, "offsetFromPosition:toPosition:", v20, v45);
              if (v46 <= 1)
                v47 = 1;
              else
                v47 = v46;
              v25 = v47 - 1;
              v19 = (void *)v45;
            }
            else
            {
              v19 = 0;
            }
          }
        }
      }

    }
  }

  return v25;
}

+ (CGRect)caretRectForCharacterIndex:(int64_t)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "beginningOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "positionFromPosition:offset:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "caretRectForPosition:", v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v8, "textInputView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v7, v12, v14, v16, v18);
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v20 = *MEMORY[0x1E0C9D628];
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

+ (id)selectionRectsForRange:(_NSRange)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  length = a3.length;
  location = a3.location;
  v14 = a4;
  v15 = a5;
  objc_msgSend(a1, "_uiTextRangeForRange:inTextInput:", location, length, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "selectionRectsForRange:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rectValuesForSelectionRects:inCoordinateSpace:inTextInput:intersectingRect:", v17, v14, v15, x, y, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (id)rectValuesForSelectionRects:(id)a3 inCoordinateSpace:(id)a4 inTextInput:(id)a5 intersectingRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v20);
        objc_msgSend(v14, "textInputView", (_QWORD)v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rect");
        objc_msgSend(v22, "PK_convertRect:toCoordinateSpace:", v13);
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;

        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        if (!CGRectIsNull(v39))
        {
          v40.origin.x = v24;
          v40.origin.y = v26;
          v40.size.width = v28;
          v40.size.height = v30;
          v43.origin.x = x;
          v43.origin.y = y;
          v43.size.width = width;
          v43.size.height = height;
          v41 = CGRectIntersection(v40, v43);
          v24 = v41.origin.x;
          v26 = v41.origin.y;
          v28 = v41.size.width;
          v30 = v41.size.height;
        }
        v42.origin.x = v24;
        v42.origin.y = v26;
        v42.size.width = v28;
        v42.size.height = v30;
        if (!CGRectIsNull(v42))
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24, v26, v28, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v31);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  return v15;
}

+ (void)notifyTextWillChangeInTextInput:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "willBeginPencilTextInputEditing");
  objc_msgSend(v3, "textWillChange:", v4);

}

+ (void)notifyTextDidChangeInTextInput:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textDidChange:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didFinishPencilTextInputEditing");

}

+ (id)_uiTextRangeForRange:(_NSRange)a3 inTextInput:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:offset:", v9, location);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "positionFromPosition:offset:", v10, length);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v8 = 0;
    if (v10 && v11)
    {
      objc_msgSend(v7, "textRangeFromPosition:toPosition:", v10, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

+ (_NSRange)_rangeFromUITextPosition:(id)a3 toUITextPosition:(id)a4 inTextInput:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "beginningOfDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !v10)
  {

    goto LABEL_6;
  }

  if (!v8)
  {
LABEL_6:
    v13 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  objc_msgSend(v9, "beginningOfDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v11, v7);

  v13 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v7, v8);
LABEL_7:

  v14 = v12;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

@end
