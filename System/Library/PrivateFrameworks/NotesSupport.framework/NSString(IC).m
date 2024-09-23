@implementation NSString(IC)

- (uint64_t)ic_substringWithRange:()IC
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
  return objc_msgSend(a1, "substringWithRange:", v2, v3);
}

- (void)ic_enumerateParagraphsInRange:()IC usingBlock:
{
  void (**v8)(id, uint64_t, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  if (v9 >= v10)
    v9 = v10;
  v14 = 0;
  do
  {
    if (a3 >= v9)
      break;
    v12 = 0;
    v13 = 0;
    v11 = 0;
    objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v13, &v12, &v11, a3, 0);
    v8[2](v8, v13, v12, v11, &v14);
    a3 = v12;
  }
  while (!v14);

}

- (uint64_t)ic_containsHashtagPrefix
{
  uint64_t result;
  int v3;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", 0);
    return v3 == 35 || v3 == 65283;
  }
  return result;
}

- (BOOL)ic_rangeIsValid:()IC
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)objc_msgSend(a1, "length");
}

- (void)ic_enumerateContentLineRangesInRange:()IC usingBlock:
{
  void (**v8)(id, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  v14 = 0;
  v15 = a3;
  if (v9 >= v10)
    v9 = v10;
  v13 = 0;
  v12 = 0;
  do
  {
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, a3, 0);
    v8[2](v8, v15, v13 - v15, &v12);
    a3 = v14;
    v15 = v14;
  }
  while (v14 < v9 && v12 == 0);

}

- (id)ic_nilWhenEmpty
{
  void *v2;

  if (objc_msgSend(a1, "length"))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (uint64_t)ic_range
{
  objc_msgSend(a1, "length");
  return 0;
}

+ (uint64_t)ic_attachmentCharacterString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 65532);
}

+ (const)ic_ellipsisCharacterString
{
  return CFSTR("…");
}

+ (const)ic_hashtagCharacterString
{
  return CFSTR("#");
}

+ (const)ic_mentionCharacterString
{
  return CFSTR("@");
}

+ (const)ic_thinSpaceCharacterString
{
  return CFSTR(" ");
}

+ (const)ic_equalsSignCharacterString
{
  return CFSTR("=");
}

+ (const)ic_fullWidthEqualsSignCharacterString
{
  return CFSTR("＝");
}

+ (id)ic_calculateEqualsSignString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "ic_thinSpaceCharacterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_equalsSignCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_thinSpaceCharacterString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@%@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ic_calculateGraphExpressionString
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "ic_calculateEqualsSignString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("y%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (const)ic_leftToRightCharacterString
{
  return CFSTR("\u200E");
}

+ (const)ic_rightToLeftCharacterString
{
  return CFSTR("\u200F");
}

- (id)ic_leftToRightString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "ic_leftToRightCharacterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ic_rightToLeftString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "ic_rightToLeftCharacterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ic_md5
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_dataValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_md5");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_sha256
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_dataValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_sha256");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_htmlStringEscapingQuotesAndLineBreaks
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(&unk_1EA832618, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      v6 = v1;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(&unk_1EA832618);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v8, v9);
        v1 = (id)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1EA832618, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
  return v1;
}

- (id)ic_trimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFString)ic_trailingTrimmedString
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1, "length") + 1;
    v4 = &stru_1EA825738;
    while (1)
    {
      v5 = v3 - 2;
      if (v3 - 2 < 0)
        break;
      --v3;
      if ((objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v5)) & 1) == 0)
      {
        objc_msgSend(a1, "substringToIndex:", v3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      }
    }

  }
  else
  {
    v4 = &stru_1EA825738;
  }
  return v4;
}

- (id)ic_leadingTrimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_stringByTrimmingLeadingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ic_whitespaceAndNewlineCoalescedString
{
  if (ic_whitespaceAndNewlineCoalescedString_onceToken != -1)
    dispatch_once(&ic_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_27);
  return objc_msgSend((id)ic_whitespaceAndNewlineCoalescedString_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), CFSTR(" "));
}

- (id)ic_sanitizedFilenameString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_stringByTrimmingLeadingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "ic_illegalFilenameCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_stringByReplacingCharactersInSet:withString:", v6, &stru_1EA825738);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "length") > 0x80)
  {
    objc_msgSend(v7, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v7, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ic_substringToIndex:", 126 - objc_msgSend(v9, "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v11, v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "ic_substringToIndex:", 127);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (uint64_t)ic_lineRangeIgnoringLineBreakCharactersForIndex:()IC
{
  uint64_t location;
  NSUInteger v5;
  NSUInteger length;
  int v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  NSUInteger i;
  NSRange v12;
  NSRange v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;

  location = objc_msgSend(a1, "lineRangeForRange:", a3, 0);
  length = v5;
  v7 = objc_msgSend(CFSTR("\u2028"), "characterAtIndex:", 0);
  v8 = location - 1;
  if (location - 1 >= 1)
  {
    do
    {
      if (objc_msgSend(a1, "characterAtIndex:", v8) != v7)
        break;
      v16.location = objc_msgSend(a1, "lineRangeForRange:", v8, 0);
      v16.length = v9;
      v14.location = location;
      v14.length = length;
      v10 = NSUnionRange(v14, v16);
      location = v10.location;
      length = v10.length;
      v8 = v10.location - 1;
    }
    while ((int64_t)(v10.location - 1) > 0);
  }
  for (i = location + length;
        (uint64_t)(i - 1) >= 0
     && i < objc_msgSend(a1, "length")
     && objc_msgSend(a1, "characterAtIndex:", i - 1) == v7;
        i = v12.location + v12.length)
  {
    v15.location = objc_msgSend(a1, "lineRangeForRange:", i, 0);
    v17.location = location;
    v17.length = length;
    v12 = NSUnionRange(v15, v17);
    location = v12.location;
    length = v12.length;
  }
  return location;
}

- (uint64_t)ic_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "ic_stringByReplacingCharactersInStringMap:", &unk_1EA832630);
}

- (uint64_t)ic_stringReplacingUnsafeXMLCharacters
{
  return objc_msgSend(a1, "ic_stringByReplacingCharactersInStringMap:", &unk_1EA832658);
}

- (id)ic_stringByRemovingAttachmentCharacters
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "ic_attachmentCharacterString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", v2, &stru_1EA825738);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_stringByRemovingLanguageDirectionCharacters
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v1, "ic_leftToRightCharacterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v3, &stru_1EA825738);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "ic_rightToLeftCharacterString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v5, &stru_1EA825738);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ic_isLastCharacterANewline
{
  return objc_msgSend(a1, "ic_isLastCharacterInRangeANewlineForRange:", 0, objc_msgSend(a1, "length"));
}

- (BOOL)ic_canConvertToTag
{
  void *v1;
  _BOOL8 v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99870], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if ((unint64_t)objc_msgSend(v1, "length") <= 0x4C)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "ic_hashtagAllowedCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "hasPrefix:", v4) & 1) != 0)
    {
      objc_msgSend(v1, "substringFromIndex:", 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v1;
    }
    v6 = v5;

    objc_msgSend(v6, "ic_stringByReplacingCharactersInSet:withString:", v3, &stru_1EA825738);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "ic_containsHashtagPrefix")
      && objc_msgSend(v1, "length") != 1
      && objc_msgSend(v7, "length") == 0;

  }
  return v2;
}

- (uint64_t)ic_numberOfLines
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = objc_msgSend(a1, "lineRangeForRange:", v5, 0);
    v5 = v6 + v7;
    ++v4;
  }
  while (v6 + v7 < v3);
  return v4;
}

- (id)ic_uniqueWordsWithMinLength:()IC
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc(MEMORY[0x1E0CB3730]);
  v26[0] = *MEMORY[0x1E0CB2D28];
  v7 = v26[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTagSchemes:options:", v8, 0);

  objc_msgSend(v9, "setString:", a1);
  v10 = objc_msgSend(a1, "length");
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke;
  v22[3] = &unk_1EA825100;
  v25 = a3;
  v12 = v5;
  v23 = v12;
  v24 = a1;
  objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v7, 6, v22);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke_90;
  v15[3] = &unk_1EA824730;
  v15[4] = &v16;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  v13 = (void *)objc_msgSend((id)v17[5], "copy");
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)ic_containsNonWhitespaceCharacters
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (BOOL)ic_containsNonWhitespaceAndAttachmentCharacters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "ic_attachmentCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCharactersInString:", v4);

  objc_msgSend(v3, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (BOOL)ic_containsAlphanumericCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (BOOL)ic_containsWhitespaceCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (uint64_t)ic_isNumeric
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSupersetOfSet:", v3);

  return v4;
}

- (uint64_t)ic_substringFromIndex:()IC
{
  return objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:"));
}

- (id)ic_substringToIndex:()IC
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a1, "length");
    if (v5 - 1 >= a3)
      v6 = a3;
    else
      v6 = v5 - 1;
    v7 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
    objc_msgSend(a1, "substringToIndex:", v7 + v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(a1, "copy");
  }
  return v9;
}

- (id)ic_checkedSubstringWithRange:()IC
{
  void *v7;

  if (objc_msgSend(a1, "ic_rangeIsValid:"))
  {
    objc_msgSend(a1, "ic_substringWithRange:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)ic_stringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_stringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_stringByReplacingCharactersInSet:()IC withString:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    v13 = v10;
    v11 = 0;
    do
    {
      if (!v11)
        v11 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v12, v13, v7);
      v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 2, v12, objc_msgSend(v11, "length") - v12);
      v13 = v14;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    if (v11)
    {
      v15 = objc_msgSend(v11, "copy");

      v8 = (id)v15;
    }
  }

  return v8;
}

- (id)ic_stringByReplacingCharactersInStringMap:()IC
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = a1;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("("));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v4;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v10);

        objc_msgSend(v5, "appendString:", CFSTR("|"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_1EA825738);
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v5, 0, 0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v37 = 0;
  v11 = objc_msgSend(v26, "length");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__NSString_IC__ic_stringByReplacingCharactersInStringMap___block_invoke;
  v31[3] = &unk_1EA825128;
  v31[4] = &v32;
  objc_msgSend(v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v11, v31);
  if (objc_msgSend((id)v33[5], "count"))
    v12 = (void *)objc_msgSend(v26, "mutableCopy");
  else
    v12 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend((id)v33[5], "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "rangeValue");
        v19 = v18;
        objc_msgSend(v26, "substringWithRange:", v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        else
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSString(IC) ic_stringByReplacingCharactersInStringMap:]", 1, 0, CFSTR("nil replacement string replacestring map"));

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    }
    while (v14);
  }

  if (v12)
  {
    v22 = objc_msgSend(v12, "copy");

    v26 = (id)v22;
  }

  _Block_object_dispose(&v32, 8);
  return v26;
}

- (id)ic_stringByReplacingLeadingFullWidthHashSignIfPossible
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1, "ic_containsHashtagPrefix"))
  {
    objc_msgSend(a1, "substringToIndex:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "substringFromIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99870], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@%@"), v4, v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (uint64_t)ic_paragraphRangeForRange:()IC contentEnd:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v9, &v8, &v7, a3, a4);
  if (a5)
    *a5 = v7;
  return v9;
}

- (uint64_t)ic_sentenceRangeForRange:()IC
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3010000000;
  v14 = &unk_1DDAFB48B;
  v15 = xmmword_1DDAF06D0;
  if ((objc_msgSend(a1, "ic_rangeIsValid:") & 1) != 0)
  {
    v7 = objc_msgSend(a1, "length");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__NSString_IC__ic_sentenceRangeForRange___block_invoke;
    v10[3] = &unk_1EA825150;
    v10[5] = a3;
    v10[6] = a4;
    v10[4] = &v11;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 4, v10);
  }
  v8 = v12[4];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (uint64_t)ic_lengthOfLongestLine
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_IC__ic_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_1EA824730;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateLinesUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (BOOL)ic_isLastCharacterInRangeANewlineForRange:()IC
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;

  v7 = objc_msgSend(a1, "ic_safeCharacterRangeForRange:");
  v9 = 0;
  if (a3 == v7 && a4 == v8)
  {
    objc_msgSend(a1, "ic_substringWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v9 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1) == 10;
    else
      v9 = 0;

  }
  return v9;
}

- (NSUInteger)ic_safeCharacterRangeForRange:()IC
{
  NSUInteger v6;
  NSRange v7;
  NSRange v9;

  v6 = objc_msgSend(a1, "length");
  if (v6 == a3)
    return a3;
  v7.length = v6;
  if (v6 < a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9.location = a3;
  v9.length = a4;
  v7.location = 0;
  return NSIntersectionRange(v9, v7).location;
}

- (uint64_t)ic_countOfCharactersInSet:()IC
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));
  v6 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v6 = 0;
    do
    {
      ++v6;
      v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, v7 + 1, objc_msgSend(a1, "length") + ~v7);
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (__CFString)ic_stringByTrimmingLeadingCharactersInSet:()IC
{
  void *v4;
  uint64_t v5;
  __CFString *v6;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = &stru_1EA825738;
  }
  else if (v5)
  {
    objc_msgSend(a1, "ic_substringFromIndex:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)ic_truncatedStringWithMaxLength:()IC truncated:
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (a4)
    *a4 = 0;
  if (objc_msgSend(a1, "length") <= a3)
  {
    v9 = a1;
  }
  else
  {
    objc_msgSend(a1, "ic_substringWithRange:", 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    if (v8 == objc_msgSend(a1, "length"))
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "ic_trailingTrimmedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("…"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = 1;
    }
  }
  return v9;
}

- (id)ic_tokenSafeText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localizedUppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ic_withHashtagPrefix
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", v4))
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)ic_withoutHashtagPrefix
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", v4) & 1) != 0)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (__CFString)ic_hashtagDisplayText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;

  v2 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characterSetWithCharactersInString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v5);

  if (v6)
  {
    if ((unint64_t)objc_msgSend(a1, "length") < 2)
    {
      v8 = &stru_1EA825738;
      goto LABEL_7;
    }
    objc_msgSend(a1, "ic_substringFromIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(a1, "copy");
  }
  v8 = (__CFString *)v7;
LABEL_7:

  return v8;
}

- (id)ic_stringWithoutSuffix:()IC
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  if (objc_msgSend(v5, "hasSuffix:", v4))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v4, "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

+ (BOOL)ic_isCharacterInlineAttachmentPrefix:()IC
{
  return a3 == 35 || a3 == 64;
}

- (id)ic_mentionString
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "ic_mentionCharacterString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  if (v5)
  {
    v6 = v3;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "ic_mentionCharacterString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", CFSTR("%@%@"), v8, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)ic_newURLForContentID:()IC percentEscaped:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "rangeOfString:", CFSTR("<"));
    v9 = v8;
    v10 = objc_msgSend(v6, "rangeOfString:", CFSTR(">"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL || v10 <= v7 + v9)
    {
      v11 = v6;
    }
    else
    {
      objc_msgSend(v6, "substringWithRange:", v7 + v9, v10 - (v7 + v9));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    if (a4)
    {
      v13 = v11;
      if (v13)
      {
LABEL_9:
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("cid:%@"), v13);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_9;
    }
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (uint64_t)ic_dataValue
{
  return objc_msgSend(a1, "dataUsingEncoding:", 4);
}

+ (__CFString)ic_shortNameFromGivenName:()IC familyName:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  __CFString *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v7, "setGivenName:", v5);
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v7, "setFamilyName:", v6);
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_trimmedString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1EA825738;
  }

  return v9;
}

- (BOOL)ic_isCaseInsensitiveEqualToString:()IC
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

+ (uint64_t)ic_nonDelimeterSet
{
  return objc_msgSend(MEMORY[0x1E0CB3500], "ic_hashtagAllowedCharacterSet");
}

- (uint64_t)ic_startsWithDelimeter:()IC
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (!a3)
    return 1;
  v3 = objc_msgSend(a1, "characterAtIndex:", a3 - 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_nonDelimeterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterIsMember:", v3) ^ 1;

  return v5;
}

- (uint64_t)ic_endsWithDelimeter:()IC
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3 + a4;
  v6 = objc_msgSend(a1, "length");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v7 == objc_msgSend(a1, "length"))
    return 1;
  v9 = objc_msgSend(a1, "characterAtIndex:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_nonDelimeterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "characterIsMember:", v9) ^ 1;

  return v8;
}

- (uint64_t)ic_rangeEncapsulatesWord:()IC
{
  uint64_t result;

  result = objc_msgSend(a1, "ic_startsWithDelimeter:");
  if ((_DWORD)result)
    return objc_msgSend(a1, "ic_endsWithDelimeter:", a3, a4);
  return result;
}

- (BOOL)ic_range:()IC onlyContainsCharacterSet:
{
  id v8;
  NSUInteger v9;
  NSRange v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  char v14;
  _BOOL8 v15;
  NSRange v17;
  NSRange v18;

  v8 = a5;
  v18.location = objc_msgSend(a1, "ic_range");
  v18.length = v9;
  v17.location = a3;
  v17.length = a4;
  v10 = NSIntersectionRange(v17, v18);
  if (v10.length && v10.location < v10.location + v10.length)
  {
    if (objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v10.location)))
    {
      v11 = v10.location + 1;
      v12 = v10.length - 1;
      do
      {
        v13 = v11;
        if (!v12)
          break;
        v14 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11));
        v11 = v13 + 1;
        --v12;
      }
      while ((v14 & 1) != 0);
      v15 = v13 >= v10.location + v10.length;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

@end
