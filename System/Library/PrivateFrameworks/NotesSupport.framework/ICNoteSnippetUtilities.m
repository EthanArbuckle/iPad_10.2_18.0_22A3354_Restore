@implementation ICNoteSnippetUtilities

+ (id)snippetAndTitleTrimCharacterSet
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
}

+ (_NSRange)rangeForTitleInContent:(id)a3 truncated:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  unint64_t v15;
  NSUInteger v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  BOOL v26;
  NSUInteger v27;
  NSUInteger v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  NSUInteger v34;
  uint64_t v35;
  _NSRange result;

  v5 = a3;
  +[ICNoteSnippetUtilities snippetAndTitleTrimCharacterSet](ICNoteSnippetUtilities, "snippetAndTitleTrimCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);

  v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v8;
  v11 = objc_msgSend(v5, "paragraphRangeForRange:", v10, 0);
  v13 = v11 < v8;
  v14 = !v9 || !v13;
  if (v9 && v13)
    v15 = v12 - v8 + v11;
  else
    v15 = v12;
  if (v14)
    v16 = v11;
  else
    v16 = v8;
  if (v15 >= 0x41)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3010000000;
    v33 = &unk_1DDAFB48B;
    v34 = v16;
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __59__ICNoteSnippetUtilities_rangeForTitleInContent_truncated___block_invoke;
    v29[3] = &unk_1EA824708;
    v29[4] = &v30;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", v16, v15, 3, v29);
    v17 = v31;
    v18 = v31[5];
    if (v18 <= 0x64)
    {
      if (v18)
      {
LABEL_20:
        v20 = objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", v17[4]);
        v22 = v20;
        v23 = v21;
        v24 = v31;
        v31[4] = v20;
        v24[5] = v21;
        if (a4)
        {
          v26 = v16 != v20 || v15 != v21;
          *a4 = v26;
        }
        _Block_object_dispose(&v30, 8);
        v15 = v23;
        v16 = v22;
        goto LABEL_29;
      }
      v31[4] = v16;
      if (v15 >= 0x64)
        v19 = 100;
      else
        v19 = v15;
    }
    else
    {
      v19 = 100;
    }
    v17[5] = v19;
    goto LABEL_20;
  }
  if (a4)
    *a4 = 0;
LABEL_29:

  v27 = v16;
  v28 = v15;
  result.length = v28;
  result.location = v27;
  return result;
}

NSUInteger __59__ICNoteSnippetUtilities_rangeForTitleInContent_truncated___block_invoke(uint64_t a1, uint64_t a2, NSRange a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  NSUInteger result;
  NSRange v9;

  v9 = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a3);
  result = v9.location;
  *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) >= 0x41uLL)
    *a6 = 1;
  return result;
}

+ (id)titleForContent:(id)a3 truncated:(BOOL *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(a1, "rangeForTitleInContent:truncated:", v6, a4);
  objc_msgSend(v6, "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNoteSnippetUtilities snippetAndTitleTrimCharacterSet](ICNoteSnippetUtilities, "snippetAndTitleTrimCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)snippetForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x100)
  {
    objc_msgSend(v4, "ic_substringToIndex:", 255);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "snippetAndTitleTrimCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ic_whitespaceAndNewlineCoalescedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)widgetSnippetForContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  __CFString *v14;

  v3 = a3;
  v4 = v3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x100)
  {
    objc_msgSend(v3, "ic_substringToIndex:", 255);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "ic_stringByRemovingAttachmentCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = (id *)&v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = &stru_1EA825738;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ICNoteSnippetUtilities_widgetSnippetForContent___block_invoke;
  v8[3] = &unk_1EA824730;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateLinesUsingBlock:", v8);
  if (!objc_msgSend(v10[5], "length"))
    objc_storeStrong(v10 + 5, v5);
  v6 = v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__ICNoteSnippetUtilities_widgetSnippetForContent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "isEqualToString:", &stru_1EA825738) & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isEqualToString:", &stru_1EA825738) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", CFSTR("\n"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

+ (id)stringByRemovingTitle:(id)a3 fromString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = objc_msgSend(v5, "rangeOfString:", a3);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v7 + v8;
    if (v9 <= objc_msgSend(v6, "length"))
      v10 = v9;
    else
      v10 = 0;
    objc_msgSend(v6, "substringFromIndex:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v5;
  }
  v12 = v11;

  return v12;
}

@end
