@implementation ICHashtagController(App)

- (void)_checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:
{
  uint64_t v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;

  v16 = a9;
  v67 = a5;
  v17 = a7;
  v18 = a11;
  if (objc_msgSend(a1, "allowsHashtag"))
  {
    v19 = objc_msgSend(v67, "hasNamedStyle:inRange:", 4, a3, a4);
    if ((v19 & 1) != 0 || a4)
    {
      if (v19)
        goto LABEL_5;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v17, "typingAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v21 = v17;
      v22 = a8;
      v23 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "style");

      v18 = v23;
      a8 = v22;
      v17 = v21;
      v16 = a9;
      a4 = 0;

      if (v26 == 4)
      {
LABEL_5:
        objc_msgSend(a1, "clearUnconfirmedHashtagInTextStorage:", v67);
        goto LABEL_31;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      ICDynamicCast();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setTableTextView:", v27);

    }
    else
    {
      objc_msgSend(a1, "setTableTextView:", 0);
    }
    v28 = objc_msgSend(a1, "maxLengthOfStringForCheckingHashtag") + 1;
    v29 = a4;
    v30 = a3;
    v31 = v28 - a4;
    if (v28 > a4)
    {
      v29 = a4;
      v30 = a3;
      if ((v16 & 1) == 0)
      {
        v32 = a3 >= v31;
        v33 = a3 - v31;
        if (v32)
          v30 = v33;
        else
          v30 = 0;
        v34 = objc_msgSend(v67, "length");
        if (v28 >= v34 - v30)
          v29 = v34 - v30;
        else
          v29 = v28;
      }
    }
    v35 = objc_msgSend(v17, "selectedRange");
    objc_msgSend(a1, "checkForHashtagInString:inRange:selectionRange:languageHasSpaces:", v67, v30, v29, v35, v36, a10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37
      && (objc_msgSend(v37, "matchingHashtagSuggestions"),
          v39 = (void *)objc_claimAutoreleasedReturnValue(),
          v39,
          v39)
      && (v16 & 1) == 0)
    {
      v40 = a8;
      v41 = objc_msgSend(v38, "rangeOfHashtag");
      v43 = v42;
      if (objc_msgSend(v67, "containsAttachmentsInRange:", v41, v42))
      {
        objc_msgSend(a1, "clearUnconfirmedHashtagInTextStorage:", v67);
LABEL_30:

        goto LABEL_31;
      }
      v66 = v18;
      if (v41 + v43 == a3 + a4)
      {
        objc_msgSend(v67, "string");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", v41, v43, v50))
        {

LABEL_36:
          objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v67, v41, v43);
          objc_msgSend(v38, "matchingHashtagSuggestions");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "allObjects");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v52, "mutableCopy");

          v54 = objc_msgSend(MEMORY[0x1E0D63B28], "shouldAutoConvertToTag");
          v55 = v67;
          if ((v54 & 1) == 0)
          {
            objc_msgSend(v67, "string");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "substringWithRange:", a3, a4);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "currentUnconfirmedHashtagString:textStorage:", v57, v67);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(a1, "isExistingHashtag:hashtagSuggestionsArray:", v58, v53) & 1) == 0)
            {
              v59 = objc_alloc_init(MEMORY[0x1E0D63B30]);
              objc_msgSend(v59, "setDisplayText:", v58);
              objc_msgSend(v53, "addObject:", v59);

            }
            v55 = v67;
          }
          objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", v53, v41, v43, v17, v55);

          v18 = v66;
          goto LABEL_30;
        }
        v64 = objc_msgSend(v67, "length");

        if (v41 + v43 == v64)
          goto LABEL_36;
      }
      if (a3)
      {
        objc_msgSend(v67, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D38], a3 - 1, 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v65 = (void *)objc_opt_class();
          v61 = objc_msgSend(MEMORY[0x1E0D63B28], "shouldAutoConvertToTag");
          if (v61)
            v62 = v41;
          else
            v62 = a3;
          if (v61)
            v63 = v43;
          else
            v63 = a4;
          objc_msgSend(v65, "addUnconfirmedAttributeToTextStorage:atRange:", v67, v62, v63);
        }

      }
      if (!v40)
        goto LABEL_30;
      v45 = a1;
      v46 = a3;
      v47 = a4;
      v48 = v67;
      v49 = 0;
    }
    else
    {
      if (a3)
      {
        objc_msgSend(v67, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D38], a3 - 1, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
          objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v67, a3, a4);

      }
      if (!a8)
        goto LABEL_30;
      v45 = a1;
      v46 = a3;
      v47 = a4;
      v48 = v67;
      v49 = v16;
    }
    objc_msgSend(v45, "createNewHashtagIfNecessary:textStorage:ignoreDelimiter:parentAttachment:", v46, v47, v48, v49, v18);
    goto LABEL_30;
  }
LABEL_31:

}

- (void)clearUnconfirmedHashtagInTextStorage:()App
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", 0, 0, 0, 0, v6);
  v4 = objc_msgSend((id)objc_opt_class(), "rangeOfUnconfirmedHashtagInTextStorage:", v6);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0D63D38], v4, v5);

}

- (void)updateUIWhenAutoConversionOff:()App textStorage:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "rangeOfUnconfirmedHashtagInTextStorage:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = v9;
    if (objc_msgSend(v6, "length")
      && (!objc_msgSend(a1, "isValidElement:", objc_msgSend(v6, "characterAtIndex:", 0))
       || objc_msgSend(a1, "isEmoji:", v6)))
    {
      objc_msgSend(a1, "clearUnconfirmedHashtagInTextStorage:", v7);
      objc_msgSend(a1, "updatePredictiveBar:", 0);
    }
    else
    {
      objc_msgSend(v7, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringWithRange:", v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v13, "length") >= 2
        && objc_msgSend(v13, "ic_containsHashtagPrefix"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0D63B30]);
        objc_msgSend(v14, "setDisplayText:", v13);
        objc_msgSend(a1, "setEditedRange:", v10, v11);
        v16[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "updatePredictiveBar:", v15);

      }
    }
  }

}

- (__CFString)currentUnconfirmedHashtagString:()App textStorage:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "rangeOfUnconfirmedHashtagInTextStorage:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  v10 = v8;
  v11 = v9;
  if (objc_msgSend(v6, "length")
    && (!objc_msgSend(a1, "isValidElement:", objc_msgSend(v6, "characterAtIndex:", 0))
     || objc_msgSend(a1, "isEmoji:", v6)))
  {
    objc_msgSend(a1, "dismissAutoCompletionView");
LABEL_9:
    v13 = &stru_1EA7E9860;
    goto LABEL_10;
  }
  objc_msgSend(v7, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringWithRange:", v10, v11);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)-[__CFString length](v13, "length") < 2
    || (-[__CFString ic_containsHashtagPrefix](v13, "ic_containsHashtagPrefix") & 1) == 0)
  {

    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (void)updatePredictiveBar:()App
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "hashtagKeyboardDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "hashtagKeyboardDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateKeyboardSuggestions:hashtagController:", v8, a1);

  }
  objc_msgSend(a1, "hashtagTableKeyboardDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "hashtagTableKeyboardDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateKeyboardSuggestions:hashtagController:", v8, a1);

  }
}

- (void)createNewHashtagIfNecessary:()App textStorage:ignoreDelimiter:parentAttachment:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD *v52;
  char v53;
  id v54;
  _QWORD v55[5];
  __CFString *v56;

  v12 = a5;
  v13 = a7;
  objc_msgSend(v12, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringWithRange:", a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(MEMORY[0x1E0D63B28], "shouldAutoConvertToTag")
    || a3 + a4 > (unint64_t)objc_msgSend(v12, "length"))
  {
    objc_msgSend(a1, "updateUIWhenAutoConversionOff:textStorage:", v15, v12);
    goto LABEL_4;
  }
  if (objc_msgSend(MEMORY[0x1E0D63B28], "shouldAutoConvertToTag"))
    objc_msgSend(a1, "updatePredictiveBar:", 0);
  v16 = objc_msgSend(a1, "isValidPostfixString:", v15);
  if (objc_msgSend(v15, "length"))
    v17 = v16;
  else
    v17 = 0;
  if ((v17 & 1) == 0 && !a6)
  {
    if (!a3)
      goto LABEL_4;
    objc_msgSend(v12, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "substringWithRange:", a3 - 1, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D38], a3 - 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      objc_msgSend(v19, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99870], 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "ic_hashtagCharacterString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqualToString:", v40);

      if (!v41)
      {
LABEL_24:

        goto LABEL_4;
      }
    }
    objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v12, a3, a4);
    goto LABEL_24;
  }
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__0;
  v55[4] = __Block_byref_object_dispose__0;
  v56 = &stru_1EA7E9860;
  v21 = a3;
  v22 = a4;
  if ((a6 & 1) == 0)
    v21 = objc_msgSend(a1, "rangeToCheckForHashtagCreation:", a3, a4);
  v44 = v22;
  v45 = v21;
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", -1, &v54);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v54;
  if (!v23)
  {
    v24 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[ICHashtagController(App) createNewHashtagIfNecessary:textStorage:ignoreDelimiter:parentAttachment:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  objc_msgSend(v12, "attributedString", v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "string");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v33, "paragraphRangeForRange:", a3, a4);
  objc_msgSend(v23, "matchesInString:options:range:", v33, 0, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __101__ICHashtagController_App__createNewHashtagIfNecessary_textStorage_ignoreDelimiter_parentAttachment___block_invoke;
  v46[3] = &unk_1EA7DD210;
  v38 = v36;
  v47 = v38;
  v48 = a1;
  v52 = v55;
  v53 = a6;
  v49 = v15;
  v50 = v13;
  v51 = v12;
  objc_msgSend(v37, "enumerateSubstringsInRange:options:usingBlock:", v45, v44, 258, v46);

  _Block_object_dispose(v55, 8);
LABEL_4:

}

- (unint64_t)rangeToCheckForHashtagCreation:()App
{
  if (a3 >= 0x4C)
    return a3 - 76;
  else
    return 0;
}

- (uint64_t)isExistingHashtag:()App hashtagSuggestionsArray:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "displayText", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ic_hashtagDisplayText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)dismissAutoCompletionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "tableTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "tableTextView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(a1, "tableTextView");
  }
  else
  {
    objc_msgSend(a1, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(a1, "textView");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", 0, 0, 0, v6, v5);

}

- (void)updateAutoCompletionView:()App range:textView:ofTextStorage:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v12 = a6;
  v13 = a7;
  if (v23)
  {
    v14 = (void *)MEMORY[0x1E0D63B30];
    objc_msgSend(a1, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedItems:context:", v23, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(a1, "setEditedRange:", a4, a5);
  objc_msgSend(a1, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "ic_isInSecureWindow");

  if ((v19 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      ICDynamicCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setTableTextView:", v20);

      objc_msgSend(a1, "hashtagTableKeyboardDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "setTableTextView:", 0);
      objc_msgSend(a1, "hashtagKeyboardDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    objc_msgSend(v21, "updateKeyboardSuggestions:hashtagController:", v17, a1);

  }
}

- (uint64_t)range:()App hasValidPostfixCharacterForString:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = a5;
  v9 = v8;
  v10 = a3 + a4;
  if (v10 < 0 || v10 >= (unint64_t)objc_msgSend(v8, "length"))
    v11 = 0;
  else
    v11 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v9, "characterAtIndex:", v10));

  return v11;
}

- (uint64_t)isValidPostfixCharacter:()App
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "ic_hashtagAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterIsMember:", a3) ^ 1;

  return v5;
}

- (uint64_t)isValidPostfixString:()App
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isEmoji:", v4) & 1) != 0 || !objc_msgSend(v4, "length"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "ic_hashtagAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0)) ^ 1;

  }
  return v6;
}

- (BOOL)isEmoji:()App
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    v5 = objc_msgSend(v3, "length");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__ICHashtagController_App__isEmoji___block_invoke;
    v8[3] = &unk_1EA7DD238;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 258, v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)isValidElement:()App
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "ic_hashtagAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterIsMember:", a3);

  return v5;
}

- (uint64_t)insertHashtagWithText:()App viaAutoComplete:parentAttachment:
{
  return objc_msgSend(a1, "insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:", a3, a4, 0, a5);
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D63B40];
  v12 = a6;
  v13 = a3;
  objc_msgSend(a1, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createHashtagAttachmentIfApplicableWithHashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v13, 1, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICHashtagController(App) insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_9;
  }
  objc_msgSend(a1, "attachmentInsertionController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICHashtagController(App) insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:].cold.2(v18);
LABEL_9:

    goto LABEL_12;
  }
  objc_msgSend(a1, "tableTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(a1, "tableTextView");
  else
    objc_msgSend(a1, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(a1, "editedRange");
  objc_msgSend(a1, "insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:", v15, v26, v27, v28, a4, v10);

  objc_msgSend(v15, "accessibilityAnnounceCreationWithVoiceOver");
LABEL_12:

}

- (void)insertHashtagAttachment:()App toTextView:range:viaAutoComplete:delimiter:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSUInteger v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSUInteger v41;
  unint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSUInteger v50;
  void *v51;
  NSRange v52;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_opt_class();
  objc_msgSend(v15, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 <= objc_msgSend(v18, "length"))
  {
    objc_msgSend(a1, "analyticsDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(a1, "analyticsDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "note");
      v50 = a5;
      v22 = a1;
      v23 = a6;
      v24 = v18;
      v25 = v16;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tokenContentIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hashtagInsertedInNote:tokenContentIdentifier:viaAutoComplete:", v26, v27, a7);

      v16 = v25;
      v18 = v24;
      a6 = v23;
      a1 = v22;
      a5 = v50;

    }
    objc_msgSend(a1, "attachmentInsertionController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v28, "addInlineAttachment:atTextRange:textView:", v14, a5, a6, v15);

    if ((_DWORD)a7)
    {
      objc_opt_class();
      ICCheckedDynamicCast();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "languageHasSpaces"))
      {
        objc_msgSend(v15, "setSelectedRange:", a5 + 1, 0);
      }
      else
      {
        v51 = v18;
        v32 = v14;
        objc_msgSend(v15, "textStorage");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "length");
        v35 = v16;
        v36 = objc_msgSend(v16, "length") + a5 + 1;

        v37 = v34 >= v36;
        v16 = v35;
        if (v37)
        {
          objc_msgSend(v15, "textStorage");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "replaceCharactersInRange:withString:", objc_msgSend(v35, "length") + a5 + 1, 0, CFSTR(" "));

        }
        objc_msgSend(v15, "textStorage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "length");
        v41 = a5 + 2;
        v42 = objc_msgSend(v35, "length") + v41;

        if (v40 >= v42)
        {
          objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v35, "length") + v41, 0);
        }
        else
        {
          objc_msgSend(v15, "textStorage");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v43, "length"), 0);

        }
        v14 = v32;
        v18 = v51;
      }

    }
    else
    {
      objc_msgSend(v15, "textStorage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "length");
      v46 = a5 + 2;

      if (v45 <= v46)
      {
        objc_msgSend(v15, "textStorage");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v47, "length"), 0);

      }
      else
      {
        objc_msgSend(v15, "setSelectedRange:", v46, 0);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      ICDynamicCast();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "cellDelegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setNeedsSave");

      objc_msgSend(a1, "setTableTextView:", 0);
    }
    objc_msgSend(a1, "updateNoteHashtags");
    objc_msgSend(a1, "setTableTextView:", 0);
  }
  else
  {
    v19 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v52.location = a5;
      v52.length = a6;
      -[ICHashtagController(App) insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:].cold.1(v52, v18, v19);
    }

  }
}

+ (uint64_t)rangeOfUnconfirmedHashtagInTextStorage:()App
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = &unk_1DDA28851;
  v13 = xmmword_1DD9E6F90;
  v4 = *MEMORY[0x1E0D63D38];
  v5 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__ICHashtagController_App__rangeOfUnconfirmedHashtagInTextStorage___block_invoke;
  v8[3] = &unk_1EA7DD260;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v8);
  v6 = v10[4];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (void)addUnconfirmedAttributeToTextStorage:()App atRange:
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v7 = *MEMORY[0x1E0D63D38];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithBool:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:value:range:", v7, v10, a4, a5);

}

- (void)createNewHashtagIfNecessary:()App textStorage:ignoreDelimiter:parentAttachment:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, a1, a3, "Could not create NSDataDetector in ICHashtagController+App.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, a1, a3, "Cannot addInlineAttachment because hashtagAttachment is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Cannot addInlineAttachment because attachmentInsertionController is nil", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertHashtagAttachment:()App toTextView:range:viaAutoComplete:delimiter:.cold.1(NSRange a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. textStorage length is %lu.", (uint8_t *)&v6, 0x16u);

}

@end
