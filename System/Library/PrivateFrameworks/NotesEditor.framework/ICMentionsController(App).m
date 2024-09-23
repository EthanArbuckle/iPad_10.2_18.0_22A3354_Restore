@implementation ICMentionsController(App)

- (void)updateAutoCompletionView:()App range:textView:mentionString:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a6;
  v12 = a7;
  v13 = a3;
  objc_msgSend(a1, "setEditedRange:", a4, a5);
  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTableTextView:", v14);

  objc_msgSend(a1, "moveCurrentUserToLast:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "ic_isInSecureWindow") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "mentionsTableKeyboardDelegate");
    else
      objc_msgSend(a1, "mentionsKeyboardDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateKeyboardSuggestions:mentionsController:mentionString:", v15, a1, v12);

  }
}

- (void)insertMentionAttachment:()App atRange:viaAutoComplete:
{
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v10 = a3;
  objc_msgSend(a1, "attachmentInsertionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "tableTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(a1, "tableTextView");
    else
      objc_msgSend(a1, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertMention:toTextView:atRange:viaAutoComplete:", v10, v14, a4, a5, a6);

  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICMentionsController(App) insertMentionAttachment:atRange:viaAutoComplete:].cold.1(v13);

  }
}

- (void)insertMention:()App toTextView:atRange:viaAutoComplete:
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  NSRange v38;

  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v13, "selectedRange");
  objc_opt_class();
  objc_msgSend(v13, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 <= objc_msgSend(v16, "length"))
  {
    objc_msgSend(a1, "attachmentInsertionController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "addInlineAttachment:atTextRange:textView:", v12, a5, a6, v13);

    if ((_DWORD)a7)
    {
      objc_opt_class();
      ICCheckedDynamicCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "languageHasSpaces"))
      {
        v23 = 1;
      }
      else
      {
        objc_msgSend(v13, "textStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "replaceCharactersInRange:withString:", a5 + 1, 0, CFSTR(" "));

        v23 = 2;
      }
      objc_msgSend(v13, "setSelectedRange:", a5 + v23, 0);

    }
    else if (v14 > a5)
    {
      v24 = v14 - a6;
      if (v14 < a6)
        v24 = -1;
      objc_msgSend(v13, "setSelectedRange:", v24 + 1, 0);
    }
    objc_msgSend(a1, "setTableTextView:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      ICDynamicCast();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cellDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNeedsSave");

    }
    objc_msgSend(v12, "note");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "note");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v27, "persistMentionActivityEventForObject:mentionAttachments:", v28, v29);

    objc_msgSend(a1, "analyticsDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(a1, "analyticsDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "note");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tokenContentIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "mentionInsertedInNote:mentionID:participantID:viaAutoComplete:", v33, v34, v35, a7);

    }
    objc_msgSend(v12, "note");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sendPendingNotificationsAfterDelay:forNote:", 180, v36);

    objc_msgSend(v12, "accessibilityAnnounceCreationWithVoiceOver");
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v38.location = a5;
      v38.length = a6;
      -[ICHashtagController(App) insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:].cold.1(v38, v16, v17);
    }

  }
}

- (id)moveCurrentUserToLast:()App
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isCurrentUser", (_QWORD)v15) & 1) != 0)
        {
          v12 = v11;

          v8 = v12;
        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);

    if (v8)
      objc_msgSend(v4, "addObject:", v8);
  }
  else
  {

    v8 = 0;
  }
  v13 = (void *)objc_msgSend(v4, "copy", (_QWORD)v15);

  return v13;
}

- (void)insertMentionAttachment:()App atRange:viaAutoComplete:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Cannot addInlineAttachment because attachmentInsertionController is nil", v1, 2u);
}

@end
