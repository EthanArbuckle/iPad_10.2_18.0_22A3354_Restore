@implementation _CKExpirableComposition

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
  _CKExpirableComposition *v13;
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
  v13 = -[CKComposition initWithText:subject:]([_CKExpirableComposition alloc], "initWithText:subject:", v12, v6);

  return v13;
}

+ (id)newCompositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  _CKExpirableComposition *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CKComposition initWithText:subject:shelfPluginPayload:]([_CKExpirableComposition alloc], "initWithText:subject:shelfPluginPayload:", v9, v8, v7);

  return v10;
}

- (BOOL)isSendAnimated
{
  return 0;
}

- (BOOL)isSaveable
{
  return 0;
}

@end
