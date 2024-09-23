@implementation CKKeyTransparencyTranscriptUtilities

+ (id)transcriptStringFromHandles:(id)a3 status:(unint64_t)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = v5;
  v7 = CFSTR("KT_TRANSCRIPT_STATUS_ERROR_WITHOUT_STATIC_ACCOUNT_KEY");
  switch(a4)
  {
    case 5uLL:
      v7 = CFSTR("KT_TRANSCRIPT_STATUS_ERROR_WITH_STATIC_ACCOUNT_KEY");
      goto LABEL_8;
    case 6uLL:
      goto LABEL_8;
    case 9uLL:
      if (objc_msgSend(v5, "count") == 1)
        v7 = CFSTR("KT_TRANSCRIPT_STATUS_TURNED_OFF");
      else
        v7 = CFSTR("KT_TRANSCRIPT_STATUS_TURNED_OFF_PLURAL");
      goto LABEL_8;
    case 0xBuLL:
      v7 = CFSTR("KT_TRANSCRIPT_STATUS_UNAVAILABLE");
LABEL_8:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transcriptEmphasizedFontAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transcriptRegularFontAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_138);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB3778]);
      v16 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v7, &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

      if (v21 == 1)
        v22 = CFSTR("\u200F");
      else
        v22 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(v15, "initWithString:attributes:", v23, v12);
      if (v14)
      {
        objc_msgSend(v24, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "rangeOfString:", v14);
        v28 = v27;

        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v24, "setAttributes:range:", v10, v26, v28);
      }
      v8 = (void *)objc_msgSend(v24, "copy");

      break;
    default:
      v8 = (void *)objc_opt_new();
      break;
  }

  return v8;
}

uint64_t __75__CKKeyTransparencyTranscriptUtilities_transcriptStringFromHandles_status___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_displayNameWithAbbreviation");
}

@end
