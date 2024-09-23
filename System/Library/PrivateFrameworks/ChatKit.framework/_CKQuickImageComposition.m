@implementation _CKQuickImageComposition

+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _CKQuickImageComposition *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v12 = CFSTR("MediaObjectForTextAttachment");
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v7);

  }
  else
  {
    v9 = 0;
  }
  v10 = -[CKComposition initWithText:subject:]([_CKQuickImageComposition alloc], "initWithText:subject:", v9, v6);

  return v10;
}

- (BOOL)isSendAnimated
{
  return 0;
}

@end
