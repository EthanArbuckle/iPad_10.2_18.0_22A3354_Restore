@implementation ICDrawingHashtagsAndMentionsController

- (ICDrawingHashtagsAndMentionsController)initWithAttachment:(id)a3
{
  id v4;
  ICDrawingHashtagsAndMentionsController *v5;
  ICDrawingHashtagsAndMentionsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDrawingHashtagsAndMentionsController;
  v5 = -[ICDrawingHashtagsAndMentionsController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_attachment, v4);

  return v6;
}

- (void)allPossibleParticipantNameTokensForAttachmentView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  -[ICDrawingHashtagsAndMentionsController eligibleShareParticipants](self, "eligibleShareParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke;
  v12[3] = &unk_1E5C1E9B8;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[ICDrawingHashtagsAndMentionsController fetchMentionTokensForParticipants:completion:](self, "fetchMentionTokensForParticipants:completion:", v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  v4 = v3;
  v5 = a1[4];
  v6 = a1[5];
  performBlockOnMainThread();

  objc_destroyWeak(&v7);
}

void __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(WeakRetained, "setMentionTokensForParticipants:", v3);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(WeakRetained, "mentionTokensForParticipants", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
          v10 = *(void **)(a1 + 40);
          objc_msgSend(WeakRetained, "mentionTokensForParticipants");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "unionSet:", v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D63BB0], "allKeyword");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ic_tokenSafeText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

    }
    v16 = *(_QWORD *)(a1 + 48);
    v17 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
}

- (id)allConfirmedMentionsForAttachmentView:(id)a3
{
  void *v4;
  void *v5;
  ICDrawingHashtagsAndMentionsController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  ICDrawingHashtagsAndMentionsController *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v38 = self;
  -[ICDrawingHashtagsAndMentionsController share](self, "share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v6 = self;
    -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleInlineAttachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (!v9)
      goto LABEL_16;
    v10 = v9;
    v11 = 0x1E0D63000uLL;
    v12 = *(_QWORD *)v42;
    v39 = *(_QWORD *)v42;
    v37 = v8;
    while (1)
    {
      v13 = 0;
      v40 = v10;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
        if (objc_msgSend(v14, "isMentionAttachment", v37))
        {
          objc_msgSend(v14, "tokenContentIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v11 + 2992), "allUserRecordName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (v17)
          {
            v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v14, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);

            objc_msgSend(*(id *)(v11 + 2992), "allKeyword");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD11F8], "mentionWithDisplayName:identifier:color:", v21, v15, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v20);
            goto LABEL_12;
          }
          -[ICDrawingHashtagsAndMentionsController note](v6, "note");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "participantForUserID:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v14, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);

            v27 = (void *)MEMORY[0x1E0C95130];
            -[ICDrawingHashtagsAndMentionsController note](v6, "note");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "ic_participantNameOrFallbackForUserRecordName:note:", v15, v28);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[ICDrawingHashtagsAndMentionsController note](v6, "note");
            v29 = v4;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "collaborationColorManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDrawingHashtagsAndMentionsController note](v6, "note");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "highlightColorForUserID:note:", v15, v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v38;
            v4 = v29;
            v11 = 0x1E0D63000;
            objc_msgSend(MEMORY[0x1E0CD11F8], "mentionWithDisplayName:identifier:color:", v22, v15, v23);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v21);

            v8 = v37;
LABEL_12:

            v12 = v39;
          }

          v10 = v40;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (!v10)
      {
LABEL_16:

        break;
      }
    }
  }
  v34 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[ICDrawingHashtagsAndMentionsController allConfirmedMentionsForAttachmentView:].cold.1();

  v35 = (void *)objc_msgSend(v4, "copy");
  return v35;
}

- (id)attachmentView:(id)a3 participantMatchesForMentionText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "ic_tokenSafeText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  -[ICDrawingHashtagsAndMentionsController share](self, "share");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D63BB0], "allKeyword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_tokenSafeText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CD11F8];
      objc_msgSend(MEMORY[0x1E0D63BB0], "allKeyword");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D63BB0], "allUserRecordName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mentionWithDisplayName:identifier:color:", v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addObject:", v16);
    }
    else
    {
      v44 = v7;
      v41 = v6;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[ICDrawingHashtagsAndMentionsController eligibleShareParticipants](self, "eligibleShareParticipants");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v47;
        v42 = *(_QWORD *)v47;
        v43 = v5;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v47 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
            -[ICDrawingHashtagsAndMentionsController mentionTokensForParticipants](self, "mentionTokensForParticipants");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "ic_tokenSafeText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "containsObject:", v24);

            if (v25)
            {
              -[ICDrawingHashtagsAndMentionsController note](self, "note");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "ic_userRecordNameInNote:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "ic_participantNameMatchingString:returnFullName:", v5, 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if ((!v28 || !objc_msgSend(v28, "length"))
                && (objc_msgSend(v21, "ic_cachedDisplayNameFromContacts"),
                    v30 = objc_claimAutoreleasedReturnValue(),
                    v29,
                    (v29 = (void *)v30) == 0)
                || !objc_msgSend(v29, "length"))
              {
                v31 = (void *)MEMORY[0x1E0C95130];
                -[ICDrawingHashtagsAndMentionsController note](self, "note");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "ic_participantNameOrFallbackForUserRecordName:note:", v27, v32);
                v33 = objc_claimAutoreleasedReturnValue();

                v29 = (void *)v33;
              }
              -[ICDrawingHashtagsAndMentionsController note](self, "note");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "collaborationColorManager");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICDrawingHashtagsAndMentionsController note](self, "note");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "highlightColorForUserID:note:", v27, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CD11F8], "mentionWithDisplayName:identifier:color:", v29, v27, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v38);

              v19 = v42;
              v5 = v43;
            }

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        }
        while (v18);
      }

      v6 = v41;
      v7 = v44;
    }
  }
  v39 = (void *)objc_msgSend(v7, "copy");

  return v39;
}

- (void)attachmentView:(id)a3 userConfirmedMentionWithUUID:(id)a4 participantIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  os_log_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  os_log_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D63BB0], "allUserRecordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  -[ICDrawingHashtagsAndMentionsController note](self, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "participantForUserID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0 || v12)
  {
    v41 = v12;
    v42 = v8;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D63BB0], "allKeyword");
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C95130];
      -[ICDrawingHashtagsAndMentionsController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ic_participantNameOrFallbackForUserRecordName:note:", v8, v16);
      v40 = objc_claimAutoreleasedReturnValue();

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inlineAttachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
LABEL_11:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v22);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if (v26)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v20)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v13 = v23;
      if (-[NSObject attachmentType](v13, "attachmentType") != 2)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "inlineAttachment.attachmentType == ICInlineAttachmentTypeMention", "-[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedMentionWithUUID:participantIdentifier:]", 1, 1, CFSTR("Found existing inline attachment for a drawing but it is not a mention"));
      v14 = (void *)v40;
      if (-[NSObject markedForDeletion](v13, "markedForDeletion"))
        -[NSObject unmarkForDeletion](v13, "unmarkForDeletion");

      if (v13)
        goto LABEL_24;
    }
    else
    {
LABEL_17:

      v14 = (void *)v40;
    }
    v27 = (void *)MEMORY[0x1E0D63B40];
    objc_msgSend(v7, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawingHashtagsAndMentionsController note](self, "note");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (os_log_t)objc_msgSend(v27, "newMentionAttachmentWithIdentifier:mentionText:userRecordName:note:parentAttachment:", v28, v14, v42, v29, v30);

    -[NSObject setMentionNotificationState:](v13, "setMentionNotificationState:", 1);
LABEL_24:
    -[NSObject updateChangeCountWithReason:](v13, "updateChangeCountWithReason:", CFSTR("Confirmed mention"));
    v31 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedMentionWithUUID:participantIdentifier:].cold.1(v13);

    -[NSObject note](v13, "note");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject note](v13, "note");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)objc_msgSend(v32, "persistMentionActivityEventForObject:mentionAttachments:", v33, v34);

    -[ICDrawingHashtagsAndMentionsController managedObjectContext](self, "managedObjectContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ic_save");

    +[ICMentionNotificationController sharedController](ICMentionNotificationController, "sharedController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sendPendingNotifications");

    v12 = v41;
    v8 = v42;
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "UUIDString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDrawingHashtagsAndMentionsController share](self, "share");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v38;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = 0;
      v53 = 2112;
      v54 = v8;
      _os_log_error_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_ERROR, "Unable to confirm mention (%@) for share (%@) participant (%@; identifier %@)",
        buf,
        0x2Au);

    }
    v14 = v13;
  }

}

- (void)attachmentView:(id)a3 userDeletedMentionWithUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingHashtagsAndMentionsController managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithIdentifier:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.notes", "PencilKit");
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedMentionWithUUID:].cold.2();

    objc_msgSend(MEMORY[0x1E0D63B40], "deleteAttachment:", v9);
    objc_msgSend(v9, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedMentionWithUUID:].cold.1();

  }
}

- (id)allConfirmedHashtagsForAttachmentView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleInlineAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "isHashtagAttachment"))
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

          objc_msgSend(v4, "ic_addNonNilObject:", v14);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ICDrawingHashtagsAndMentionsController allConfirmedHashtagsForAttachmentView:].cold.1();

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (void)attachmentView:(id)a3 userConfirmedHashtagWithUUID:(id)a4 displayText:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inlineAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v19 = v14;
    if (objc_msgSend(v19, "attachmentType") != 1)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "inlineAttachment.attachmentType == ICInlineAttachmentTypeHashtag", "-[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedHashtagWithUUID:displayText:]", 1, 1, CFSTR("Found existing inline attachment for a drawing but it is not a hashtag"));
    v18 = v26;
    if (objc_msgSend(v19, "markedForDeletion"))
      objc_msgSend(v19, "unmarkForDeletion");

    if (v19)
      goto LABEL_16;
  }
  else
  {
LABEL_9:

    v18 = v26;
  }
  v20 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(v7, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingHashtagsAndMentionsController note](self, "note");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v20, "newHashtagAttachmentWithIdentifier:hashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v21, v18, 1, v22, v23);

LABEL_16:
  objc_msgSend(v19, "updateChangeCountWithReason:", CFSTR("Confirmed tag"));
  v24 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedHashtagWithUUID:displayText:].cold.1(v19);

  -[ICDrawingHashtagsAndMentionsController managedObjectContext](self, "managedObjectContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ic_save");

}

- (void)attachmentView:(id)a3 userDeletedHashtagWithUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D63B40];
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingHashtagsAndMentionsController managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithIdentifier:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.notes", "PencilKit");
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedHashtagWithUUID:].cold.2();

    objc_msgSend(MEMORY[0x1E0D63B40], "deleteAttachment:", v9);
    objc_msgSend(v9, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedHashtagWithUUID:].cold.1();

  }
}

- (NSManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (ICNote)note
{
  void *v2;
  void *v3;

  -[ICDrawingHashtagsAndMentionsController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNote *)v3;
}

- (CKShare)share
{
  void *v2;
  void *v3;

  -[ICDrawingHashtagsAndMentionsController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverShareCheckingParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKShare *)v3;
}

- (NSArray)eligibleShareParticipants
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[ICDrawingHashtagsAndMentionsController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverShareCheckingParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_acceptedParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (void)fetchMentionTokensForParticipants:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *contactsRequestQueue;
  NSObject *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  contactsRequestQueue = self->_contactsRequestQueue;
  if (!contactsRequestQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.drawingContactsRequests", v9);
    v11 = self->_contactsRequestQueue;
    self->_contactsRequestQueue = v10;

    contactsRequestQueue = self->_contactsRequestQueue;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__ICDrawingHashtagsAndMentionsController_fetchMentionTokensForParticipants_completion___block_invoke;
  v14[3] = &unk_1E5C1D718;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(contactsRequestQueue, v14);

}

void __87__ICDrawingHashtagsAndMentionsController_fetchMentionTokensForParticipants_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "ic_mentionTokens", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_mentionTokensFromContacts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setByAddingObjectsFromSet:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "ic_setNonNilObject:forKey:", v11, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (NSDictionary)mentionTokensForParticipants
{
  return self->_mentionTokensForParticipants;
}

- (void)setMentionTokensForParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionTokensForParticipants, 0);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_contactsRequestQueue, 0);
}

- (void)allConfirmedMentionsForAttachmentView:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Confirmed mentions for parent attachment (%@): %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentView:(void *)a1 userConfirmedMentionWithUUID:participantIdentifier:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Created inline attachment for confirmed mention: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

- (void)attachmentView:userDeletedMentionWithUUID:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v4, v5, "Couldn't find inline mention attachment for deletion: %@ (parent: %@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentView:userDeletedMentionWithUUID:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "User deleted an inline mention attachment from drawing: %@ (parent: %@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)allConfirmedHashtagsForAttachmentView:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v0, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Confirmed hashtags for parent attachment (%@): %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentView:(void *)a1 userConfirmedHashtagWithUUID:displayText:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Created inline attachment for confirmed hashtag: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

- (void)attachmentView:userDeletedHashtagWithUUID:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "UUIDString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v4, v5, "Couldn't find inline hashtag attachment for deletion: %@ (parent: %@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)attachmentView:userDeletedHashtagWithUUID:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "User deleted an hashtag attachment from drawing: %@ (parent: %@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

@end
