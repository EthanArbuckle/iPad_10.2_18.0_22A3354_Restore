@implementation _CKAudioComposition

- (_CKAudioComposition)initWithText:(id)a3 subject:(id)a4 powerLevels:(id)a5
{
  id v8;
  _CKAudioComposition *v9;
  _CKAudioComposition *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CKAudioComposition;
  v9 = -[CKComposition initWithText:subject:](&v22, sel_initWithText_subject_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKComposition mediaObjects](v9, "mediaObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "setPowerLevels:", v8);
    }
    else
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_CKAudioComposition initWithText:subject:powerLevels:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    }
  }

  return v10;
}

- (BOOL)isAudioComposition
{
  return 1;
}

+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _CKAudioComposition *v10;
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
  v10 = -[CKComposition initWithText:subject:]([_CKAudioComposition alloc], "initWithText:subject:", v9, v6);

  return v10;
}

- (BOOL)isSendAnimated
{
  return 1;
}

- (void)initWithText:(uint64_t)a3 subject:(uint64_t)a4 powerLevels:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "loading audio composition without an audio media object", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
