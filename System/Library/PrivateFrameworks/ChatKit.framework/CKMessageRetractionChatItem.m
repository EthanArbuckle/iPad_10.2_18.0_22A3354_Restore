@implementation CKMessageRetractionChatItem

- (BOOL)hasSelectableText
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFailedRetraction");

  return v3;
}

- (id)_retractionUnsupportedByNamesFromHandles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "_displayNameWithAbbreviation", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)_loadTranscriptTextWithRetractionUnsupportedCount:(unint64_t)a3 unsupportedNames:(id)a4 isFromMe:(BOOL)a5 isFailedRetraction:(BOOL)a6 senderName:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;

  v8 = a6;
  v9 = a5;
  v11 = a4;
  v12 = a7;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transcriptRegularPreferredFontAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transcriptEmphasizedPreferredFontAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    CKFrameworkBundle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_PERSON_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v14, v16, v21, v22, v23, v24, v25, v26, (uint64_t)v12);
LABEL_8:
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    goto LABEL_22;
  }
  if (!a3)
  {
    CKFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v29;
    if (v8)
    {
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_RETRACTION_FAILED_STATUS_ERROR_SUBSTRING_HARDSPACE"), &stru_1E276D870, CFSTR("ChatKit"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_RETRACTION_FAILED_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CKAttributedFormatString(v14, v16, v21, v30, v31, v32, v33, v34, (uint64_t)v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttributedFormatString(v14, v16, v21, v77, v78, v79, v80, v81, 0);
    goto LABEL_8;
  }
  v17 = v11;
  if ((unint64_t)objc_msgSend(v17, "count") >= 4)
  {
    objc_msgSend(v17, "subarrayWithRange:", 0, 2);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v18;
  }
  v19 = objc_msgSend(v17, "count");
  v20 = a3 - v19;
  v84 = v12;
  v86 = v11;
  if (a3 != v19)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("N_OTHER_PEOPLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringWithFormat:", v37, v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "userInterfaceLayoutDirection");

    if (v40 == 1)
      v41 = CFSTR("\u200F");
    else
      v41 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v41, "stringByAppendingString:", v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "arrayByAddingObject:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v43;
  }
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CKFrameworkBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_WITH_UNSUPPORTED_RECIPIENTS_AND_RETRACTION_FAILED_STATUS_ERROR_SUBSTRING_HARDSPACE"), &stru_1E276D870, CFSTR("ChatKit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_WITH_N_UNSUPPORTED_RECIPIENTS_AND_RETRACTION_FAILED_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringWithFormat:", v47, a3, v21, v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RETRACTED_BY_ME_WITH_N_UNSUPPORTED_RECIPIENTS_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringWithFormat:", v47, a3, v21);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "userInterfaceLayoutDirection");

  if (v51 == 1)
    v52 = CFSTR("\u200F");
  else
    v52 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v52, "stringByAppendingString:", v48);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  CKAttributedFormatString(v14, v16, v53, v54, v55, v56, v57, v58, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v84;
  v11 = v86;
LABEL_22:

  if (v27 && objc_msgSend(v28, "length"))
  {
    v85 = v12;
    v87 = v11;
    objc_msgSend(v27, "string");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "rangeOfString:", v28);
    v62 = v61;

    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v85;
      v11 = v87;
    }
    else
    {
      v82 = v14;
      v63 = (void *)objc_msgSend(v27, "mutableCopy");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "transcriptErrorStampPreferredFontAttributes");
      v65 = objc_claimAutoreleasedReturnValue();

      v83 = (void *)v65;
      objc_msgSend(v63, "setAttributes:range:", v65, v60, v62);
      objc_msgSend(v63, "string");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "rangeOfString:options:range:", CFSTR("(!)"), 0, v60, v62);
      v69 = v68;

      if (v67 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v63, "replaceCharactersInRange:withString:", v67, v69, &stru_1E276D870);
        v70 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "messageStampWarningIconRed");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "setImage:", v72);
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_msgSend(v73, "mutableCopy");

        objc_msgSend(v74, "addAttributes:range:", v83, 0, objc_msgSend(v74, "length"));
        objc_msgSend(v63, "insertAttributedString:atIndex:", v74, v67);

      }
      v75 = objc_msgSend(v63, "copy");

      v27 = (void *)v75;
      v12 = v85;
      v11 = v87;
      v14 = v82;
    }
  }

  return v27;
}

- (id)loadTranscriptText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMe");
  objc_msgSend(v3, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "isFailedRetraction");
  objc_msgSend(v3, "retractionUnsupportedByHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageRetractionChatItem _retractionUnsupportedByNamesFromHandles:](self, "_retractionUnsupportedByNamesFromHandles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageRetractionChatItem _loadTranscriptTextWithRetractionUnsupportedCount:unsupportedNames:isFromMe:isFailedRetraction:senderName:](self, "_loadTranscriptTextWithRetractionUnsupportedCount:unsupportedNames:isFromMe:isFailedRetraction:senderName:", objc_msgSend(v8, "count"), v9, v4, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIEdgeInsets)contentInsets
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v3 = -[CKMessageRetractionChatItem isRetractedReply](self, "isRetractedReply");
  v4 = -[CKMessageRetractionChatItem isRetractedReplyThreadOriginator](self, "isRetractedReplyThreadOriginator");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 || v4)
    objc_msgSend(v5, "retractedReplyStampInsets");
  else
    objc_msgSend(v5, "stampTranscriptInsets");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)isRetractedReply
{
  void *v2;
  char v3;

  -[CKMessageRetractionChatItem imMessageRetractionChatItem](self, "imMessageRetractionChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemIsReply");

  return v3;
}

- (BOOL)isRetractedReplyThreadOriginator
{
  void *v2;
  char v3;

  -[CKMessageRetractionChatItem imMessageRetractionChatItem](self, "imMessageRetractionChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemIsThreadOriginator");

  return v3;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
}

@end
