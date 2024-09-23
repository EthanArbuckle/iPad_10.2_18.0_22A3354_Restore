@implementation CKMentionsUtilities

+ (id)attributedStringByHighlightingMentionsInAttributedString:(id)a3 withFont:(id)a4 textColor:(id)a5 mentionFont:(id)a6 mentionColor:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(v11, "mutableCopy");
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  v18 = *MEMORY[0x1E0DC10F0];
  v35[0] = *MEMORY[0x1E0DC10F8];
  v35[1] = v18;
  v36 = *MEMORY[0x1E0D381F0];
  v19 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithArray:", v20);

  v22 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __124__CKMentionsUtilities_attributedStringByHighlightingMentionsInAttributedString_withFont_textColor_mentionFont_mentionColor___block_invoke;
  v33[3] = &unk_1E2756C08;
  v23 = v21;
  v34 = v23;
  objc_msgSend(v16, "__ck_filterAttributes:", v33);
  v24 = objc_msgSend(v16, "length");
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v15, 0, v24);

  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v14, 0, v24);
  if (objc_msgSend(v11, "containsAttribute:", v19))
  {
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __124__CKMentionsUtilities_attributedStringByHighlightingMentionsInAttributedString_withFont_textColor_mentionFont_mentionColor___block_invoke_2;
    v28[3] = &unk_1E2756C30;
    v29 = v16;
    v30 = v12;
    v32 = a1;
    v31 = v13;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v24, 0, v28);

  }
  v25 = (void *)objc_msgSend(v16, "copy");

  return v25;
}

+ (BOOL)supportsSupplementalLexiconMentions
{
  void *v2;
  void *v3;
  char v4;
  void *v6;
  char v7;
  const char *v8;
  void *v9;
  char v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  char v14;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExtensionInputMode");

  if ((v4 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "predictionFromPreference"))
    v7 = UIKeyboardPredictionEnabledForCurrentInputMode();
  else
    v7 = 0;

  v8 = NSSelectorFromString(CFSTR("autocorrectionPreference"));
  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, v8);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "displaysCandidates");

  return v7 | v12 | v14;
}

BOOL __124__CKMentionsUtilities_attributedStringByHighlightingMentionsInAttributedString_withFont_textColor_mentionFont_mentionColor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC10F8])
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = 1;
    }
  }

  return v7;
}

void __124__CKMentionsUtilities_attributedStringByHighlightingMentionsInAttributedString_withFont_textColor_mentionFont_mentionColor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  char isKindOfClass;
  int v10;
  id v11;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v11 = v7;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], *(_QWORD *)(a1 + 40), a3, a4);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = objc_msgSend(*(id *)(a1 + 56), "metionedHandleMatchesMeCard:", v11);
      v8 = v11;
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], *(_QWORD *)(a1 + 48), a3, a4);
        v8 = v11;
      }
    }
  }

}

+ (BOOL)metionedHandleMatchesMeCard:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0D35738];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "metionedHandleMatchesMeCard:", v4);

  return v6;
}

+ (BOOL)attributedString:(id)a3 containsConfirmedMentionInRange:(_NSRange)a4
{
  return objc_msgSend(a3, "attribute:existsInRange:", *MEMORY[0x1E0D381F0], a4.location, a4.length);
}

+ (void)replaceAttributedString:(id)a3 withEntity:(id)a4 fromInputText:(id)a5 inRange:(_NSRange)a6 updatingRange:(_NSRange *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  length = a6.length;
  location = a6.location;
  v17 = a3;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v13, "mentionsHandleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayNameMatchingInputText:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v17, "replaceCharactersInRange:withString:", location, length, v15);
    v16 = objc_msgSend(v15, "length");
    a7->location = location;
    a7->length = v16;
  }
  else
  {
    location = a7->location;
    v16 = a7->length;
  }
  objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x1E0D381F0], v14, location, v16);

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 withOriginalText:(id)a5 inRange:(_NSRange)a6
{
  objc_msgSend(a3, "addAttribute:value:range:", *MEMORY[0x1E0D38208], a5, a6.location, a6.length);
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 boldingFont:(BOOL)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSRange v24;

  length = a6.length;
  location = a6.location;
  v8 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "symbolicTraits");

  if (v8)
    v15 = 2;
  else
    v15 = 0;
  v16 = v14 & 0xFFFFFFFD | v15;
  objc_msgSend(v11, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fontDescriptorWithSymbolicTraits:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v11, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "pointSize");
  objc_msgSend(v20, "fontWithDescriptor:size:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v22 && length)
  {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v22, location, length);
  }
  else
  {
    IMLogHandleForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24.location = location;
      v24.length = length;
      +[CKMentionsUtilities configureAttributedString:inTextView:boldingFont:inRange:].cold.1((uint64_t)v22, v24, v23);
    }

  }
}

+ (void)configureAttributedString:(id)a3 withFontColor:(id)a4 forRange:(_NSRange)a5
{
  objc_msgSend(a3, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], a4, a5.location, a5.length);
}

+ (void)configureAttributedString:(id)a3 withParagraphStyleInTextView:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  objc_msgSend(a4, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v11, "addAttribute:value:range:", v9, v10, location, length);

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forConfirmedMentionInRange:(_NSRange)a5 needingAnimation:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v19 = a3;
  v11 = a4;
  objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0D381C0], &stru_1E276D870, location, length);
  objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E0D38218], location, length);
  objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E0D381D0], location, length);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entryFieldConfirmedMentionColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0D381C8], v16, location, length);
  }
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v19, v11, 1, location, length);
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v19, v14, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v19, v11, location, length);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isExpressiveTextEnabled");

  if (v18 && objc_msgSend(v11, "allowsTextAnimations"))
  {
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 2, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 4, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 8, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 1, 1, location, length);
  }

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forNoMentionInRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  length = a5.length;
  location = a5.location;
  v9 = *MEMORY[0x1E0D381C8];
  v10 = a4;
  v14 = a3;
  objc_msgSend(v14, "removeAttribute:range:", v9, location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E0D381C0], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E0D381F0], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E0D38208], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E0D38210], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E0D38218], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v14, v10, 0, location, length);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entryFieldTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v14, v13, location, length);

  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v14, v10, location, length);
}

+ (void)hideMentionsInAttributedString:(id)a3 inTextView:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  char v12;
  char v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_msgSend(v18, "length");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  v10 = (_QWORD *)MEMORY[0x1E0D381C0];
  v11 = (_QWORD *)MEMORY[0x1E0D381C8];
  if (!v9
    || !objc_msgSend(v6, "allowsTextAnimations")
    || (v12 = objc_msgSend(a1, "attributedString:containsConfirmedMentionInRange:", v18, 0, v7),
        v13 = objc_msgSend(v18, "attribute:existsInRange:", *v10, 0, v7),
        v14 = objc_msgSend(v18, "attribute:existsInRange:", *v11, 0, v7),
        (v12 & 1) != 0)
    || (v13 & 1) != 0
    || v14)
  {
    objc_msgSend(v18, "removeAttribute:range:", *v10, 0, v7);
    objc_msgSend(v18, "removeAttribute:range:", *v11, 0, v7);
    objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v18, v6, 0, 0, v7);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entryFieldTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v18, v17, 0, v7);

    objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v18, v6, 0, v7);
  }

}

+ (void)configureAttributedStringForMentionsChecking:(id)a3 excludingRange:(const _NSRange *)a4
{
  id v6;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v6 = a3;
  v25 = v6;
  if (a4 && (location = a4->location, a4->location != 0x7FFFFFFFFFFFFFFFLL))
  {
    v16 = objc_msgSend(v6, "length");
    if (location >= v16)
      v17 = v16;
    else
      v17 = location;
    v18 = a4->length + a4->location;
    v19 = objc_msgSend(v25, "length");
    if (v18 >= v19)
      v18 = v19;
    v20 = objc_msgSend(v25, "length") - v18;
    v21 = *MEMORY[0x1E0D381C0];
    objc_msgSend(v25, "removeAttribute:range:", *MEMORY[0x1E0D381C0], 0, v17);
    objc_msgSend(v25, "removeAttribute:range:", v21, v18, v20);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "theme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "entryFieldTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v25, v24, 0, v17);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryFieldTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1;
    v13 = v25;
    v14 = v10;
    v15 = v18;
    v11 = v20;
  }
  else
  {
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0D381C0], 0, objc_msgSend(v6, "length"));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryFieldTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v25, "length");
    v12 = a1;
    v13 = v25;
    v14 = v10;
    v15 = 0;
  }
  objc_msgSend(v12, "configureAttributedString:withFontColor:forRange:", v13, v14, v15, v11);

}

+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger v5;
  _NSRange result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    location = a4.location;
  else
    location = a3.location;
  v5 = a4.location + a4.length - location;
  result.length = v5;
  result.location = location;
  return result;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4
{
  int64_t location;
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;

  location = a3.location;
  v5 = a4;
  v6 = v5;
  v7 = location < 1;
  v8 = location - 1;
  v9 = !v7 && v8 < objc_msgSend(v5, "length") && objc_msgSend(v6, "characterAtIndex:", v8) == 64;

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = v7;
  v9 = location + length;
  if (v9 < 0 || v9 >= (unint64_t)objc_msgSend(v7, "length"))
    v10 = 0;
  else
    v10 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v8, "characterAtIndex:", v9));

  return v10;
}

+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4
{
  BOOL v4;

  v4 = a4.location <= a3.location + a3.length;
  if (a4.location < a3.location)
    v4 = 0;
  if (!a3.length)
    v4 = 0;
  return !a4.length && v4;
}

+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "characterIsMember:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "characterIsMember:", v3);

  }
  return v5;
}

+ (void)configureAttributedString:(id)a3 automaticMentionAttributeWithOriginalText:(id)a4 entityNode:(id)a5 nodeId:(id)a6 forRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  CKMentionAutoCompleteAttribute *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  length = a7.length;
  location = a7.location;
  v25 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v14, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "substringWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isTextKit2Enabled");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (CKMentionAutoCompleteAttribute *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v20 = (void *)objc_msgSend(v25, "copy");
      -[CKMentionAutoCompleteAttribute setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D381E8]);

    }
    if (v16)
    {
      v21 = (void *)objc_msgSend(v16, "copy");
      -[CKMentionAutoCompleteAttribute setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D381D8]);

    }
    if (v13)
    {
      objc_msgSend(v13, "keys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMentionAutoCompleteAttribute setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D381E0]);

    }
    v23 = *MEMORY[0x1E0D381D0];
    v24 = -[CKMentionAutoCompleteAttribute copy](v19, "copy");
    objc_msgSend(v14, "addAttribute:value:range:", v23, v24, location, length);

    v14 = (id)v24;
  }
  else
  {
    v19 = -[CKMentionAutoCompleteAttribute initWithMentionEntityNode:originalText:displayText:]([CKMentionAutoCompleteAttribute alloc], "initWithMentionEntityNode:originalText:displayText:", v12, v25, v16);
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0D381D0], v19, location, length);
  }

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forDirectMentionInRange:(_NSRange)a5 forChildNode:(id)a6 nodeId:(id)a7 addingVisualStyling:(BOOL)a8 shouldAddAutoComplete:(BOOL)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  id v22;

  length = a5.length;
  location = a5.location;
  v22 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a4;
  objc_msgSend(v22, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "substringWithRange:", location, length);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = location - 1;
  v21 = length + 1;
  objc_msgSend(a1, "configureAttributedString:inTextView:forUnconfirmedDirectMention:inRange:addingVisualStyling:", v22, v17, v19, v20, v21, a8);

  if (a9)
    objc_msgSend(a1, "configureAttributedString:automaticMentionAttributeWithOriginalText:entityNode:nodeId:forRange:", v22, v19, v15, v16, v20, v21);

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedDirectMention:(id)a5 inRange:(_NSRange)a6 addingVisualStyling:(BOOL)a7
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a7;
  length = a6.length;
  location = a6.location;
  v20 = a3;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v20, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "substringWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0D381C0], v16, location, length);
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0D38218], v13, location, length);

  objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x1E0D381F0], location, length);
  objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x1E0D38208], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v20, v14, 0, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v20, v14, location, length);

  if (v7)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "entryFieldUnconfirmedMentionColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v20, v19, location, length);

  }
}

+ (void)removeMentionsAtIndex:(int64_t)a3 onAttributedString:(id)a4 inTextView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a4;
  v9 = a5;
  if ((a3 & 0x8000000000000000) == 0 && objc_msgSend(v8, "length") > (unint64_t)a3)
  {
    v11 = 0;
    v12 = 0;
    objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D381C0], a3, &v11, 0, objc_msgSend(v8, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(a1, "configureAttributedString:inTextView:forNoMentionInRange:", v8, v9, v11, v12);
  }

}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedMentionInRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringWithRange:", location, length);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0D381C0], v15, location, length);
  objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x1E0D381F0], location, length);
  objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x1E0D38208], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v10, v9, 0, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v10, v9, location, length);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entryFieldUnconfirmedMentionColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v10, v14, location, length);

}

+ (id)languagesWithoutSpaces
{
  if (languagesWithoutSpaces_once != -1)
    dispatch_once(&languagesWithoutSpaces_once, &__block_literal_global_156);
  return (id)languagesWithoutSpaces_sLanguages;
}

void __45__CKMentionsUtilities_languagesWithoutSpaces__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zh"), CFSTR("yue"), CFSTR("ja"), CFSTR("th"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)languagesWithoutSpaces_sLanguages;
  languagesWithoutSpaces_sLanguages = v0;

}

+ (void)configureAttributedString:(NSObject *)a3 inTextView:boldingFont:inRange:.cold.1(uint64_t a1, NSRange range, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_ERROR, "Attempted to call addAttribute with value:%@ for range:%@", (uint8_t *)&v6, 0x16u);

}

@end
