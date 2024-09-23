@implementation SectionDictionaryForCompletionGroup

id __SectionDictionaryForCompletionGroup_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  objc_class *v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "urlStringForHistoryServiceCompletionList");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = CFSTR(" • Open Tab");
  else
    v4 = 0;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "subtextForHistoryServiceCompletionList");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[__CFString safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:](v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "uuidString");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  v25[0] = CFSTR("title");
  objc_msgSend(v2, "titleForHistoryServiceCompletionList");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E9CFDBB0;
  if (v3)
    v10 = v3;
  else
    v10 = &stru_1E9CFDBB0;
  v26[0] = v9;
  v26[1] = v10;
  v25[1] = CFSTR("url");
  v25[2] = CFSTR("truncated_url");
  if (v5)
    v11 = v5;
  else
    v11 = &stru_1E9CFDBB0;
  if (v4)
    v12 = v4;
  else
    v12 = &stru_1E9CFDBB0;
  v26[2] = v11;
  v26[3] = v12;
  v25[3] = CFSTR("url_subtext");
  v25[4] = CFSTR("type");
  v13 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "resultType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("SFSearchResult(%@)"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "sfSearchResultValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resultBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "safari_substringFromPrefix:", CFSTR("com.apple.Safari.CompletionList."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 || (v19 = v15) != 0)
    {
      v20 = v19;
    }
    else
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v20;

  }
  v25[5] = CFSTR("uuid");
  if (v6)
    v21 = v6;
  else
    v21 = &stru_1E9CFDBB0;
  v26[4] = v16;
  v26[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
