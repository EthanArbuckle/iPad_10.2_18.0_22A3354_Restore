@implementation _CKQuickSendMediaComposition

+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  const __CFString **v9;
  void *v10;
  id v11;
  void *v12;
  _CKQuickSendMediaComposition *v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = CFSTR("AdaptiveImageGlyphMediaObject");
    v18[0] = v5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (id *)v18;
    v9 = &v17;
  }
  else
  {
    if (!v5)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v15 = CFSTR("MediaObjectForTextAttachment");
    v16 = v5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v16;
    v9 = &v15;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = (void *)objc_msgSend(v11, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v10);

LABEL_6:
  v13 = -[CKComposition initWithText:subject:]([_CKQuickSendMediaComposition alloc], "initWithText:subject:", v12, v6);

  return v13;
}

+ (id)compositionWithMediaObjects:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  _CKQuickSendMediaComposition *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _CKQuickSendMediaComposition *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[CKComposition initWithText:subject:]([_CKQuickSendMediaComposition alloc], "initWithText:subject:", 0, v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        +[_CKQuickSendMediaComposition compositionWithMediaObject:subject:](_CKQuickSendMediaComposition, "compositionWithMediaObject:subject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), 0, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposition compositionByAppendingComposition:](v13, "compositionByAppendingComposition:", v14);
        v7 = (_CKQuickSendMediaComposition *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isSendAnimated
{
  return 0;
}

@end
