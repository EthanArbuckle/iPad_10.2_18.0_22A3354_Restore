@implementation CKCollaborationNoticeSuggestion

+ (id)suggestionWithNotice:(id)a3 delegate:(id)a4 wantsInlineReplyStyle:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CKCollaborationNoticeSuggestion *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CKCollaborationNoticeSuggestion initWithNotice:wantsInlineReplyStyle:]([CKCollaborationNoticeSuggestion alloc], "initWithNotice:wantsInlineReplyStyle:", v8, v5);

  -[CKCollaborationNoticeSuggestion setDelegate:](v9, "setDelegate:", v7);
  return v9;
}

- (CKCollaborationNoticeSuggestion)initWithNotice:(id)a3 wantsInlineReplyStyle:(BOOL)a4
{
  id v7;
  CKCollaborationNoticeSuggestion *v8;
  CKCollaborationNoticeSuggestion *v9;
  void *v10;
  uint64_t v11;
  CKEntity *senderEntity;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKCollaborationNoticeSuggestion;
  v8 = -[CKCollaborationNoticeSuggestion init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notice, a3);
    objc_msgSend(v7, "senderHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    senderEntity = v9->_senderEntity;
    v9->_senderEntity = (CKEntity *)v11;

    v9->_wantsInlineReplyStyle = a4;
  }

  return v9;
}

- (id)suggestionListTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UPDATES"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)suggestionListSupportsDismissal
{
  return 1;
}

- (id)suggestionPrimaryAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 >= 8)
  {
    if (v7 == 8)
    {
      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADD_TO_DOCUMENT_ACTION"), &stru_1E276D870, CFSTR("ChatKit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v3;
      v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_4;
      v11 = &v18;
    }
    else
    {
      if (v7 != 9)
      {
        v9 = 0;
        v12 = 0;
        goto LABEL_4;
      }
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_DOCUMENT_ACTION"), &stru_1E276D870, CFSTR("ChatKit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v3;
      v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_5;
      v11 = &v17;
    }
  }
  else
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHOW"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v3;
    v10 = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_3;
    v11 = &v19;
  }
  v11[1] = 3221225472;
  v11[2] = (uint64_t)v10;
  v11[3] = (uint64_t)&unk_1E2759FF0;
  v11[4] = (uint64_t)self;
  v11[5] = (uint64_t)v4;
  v12 = _Block_copy(v11);

LABEL_4:
  objc_msgSend(MEMORY[0x1E0D19F18], "actionWithTitle:handler:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_2;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "suggestionDismissAction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "notice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:withCompletionHandler:", v8, 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addToCollaboration:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58__CKCollaborationNoticeSuggestion_suggestionPrimaryAction__block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromCollaboration:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)suggestionDismissAction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[CKCollaborationNoticeSuggestion delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)MEMORY[0x1E0D19F18];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IGNORE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CKCollaborationNoticeSuggestion_suggestionDismissAction__block_invoke;
  v10[3] = &unk_1E2757768;
  v10[4] = self;
  objc_msgSend(v5, "actionWithTitle:handler:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __58__CKCollaborationNoticeSuggestion_suggestionDismissAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collaborationNoticeSuggestionWillDismiss:", *(_QWORD *)(a1 + 32));

}

- (id)suggestionBackgroundVisualEffectView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_wantsInlineReplyStyle)
  {
    v2 = objc_alloc(MEMORY[0x1E0CEABE8]);
    v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replyTranscriptBlurBackgroundEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundEffects:", v6);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replyTranscriptBlurBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v9);

    objc_msgSend(v3, "_setGroupName:", CFSTR("inlineReplyVisualEffectViewGroup"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)suggestionDivider
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_wantsInlineReplyStyle)
  {
    v2 = objc_alloc(MEMORY[0x1E0D19F00]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryFieldBorderColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v2, "initWithPosition:color:", 3, v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)suggestionSubtitle
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;

  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 > 9)
  {
    v11 = 0;
  }
  else
  {
    -[CKCollaborationNoticeSuggestion notice](self, "notice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    if (v9 <= -3.0)
    {
      v11 = 0;
    }
    else
    {
      if ((uint64_t)v9 / 60 % 60 <= 0)
      {
        CKFrameworkBundle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TIME_STATUS_JUST_NOW"), &stru_1E276D870, CFSTR("ChatKit"));
      }
      else
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
        objc_msgSend(v10, "localizedStringForDate:relativeToDate:", v7, v8);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v11;
}

- (id)suggestionImageSGView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97518], "descriptorForRequiredKeysIncludingImage:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchCNContactForHandleID:withKeys:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C97498]);
  if (v8)
  {
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContacts:", v10);
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKCollaborationNoticeSuggestion suggestionImageSGView].cold.1(self, v10);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C97490]);
  objc_msgSend(v11, "setPosition:", 2);
  objc_msgSend(v11, "setCropStyle:", 1);
  objc_msgSend(v9, "setBadgeStyleSettings:", v11);
  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v14);
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareImageForDescriptor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "CGImage");

    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBadgeImage:", v19);

  }
  objc_msgSend(v9, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, 32.0, 32.0);

  return v20;
}

- (id)suggestionTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[CKCollaborationNoticeSuggestion senderEntity](self, "senderEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "abbreviatedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCollaborationNoticeSuggestion notice](self, "notice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  -[CKCollaborationNoticeSuggestion suggestionCategoryTitleWithSenderName:documentTitle:noticeType:](self, "suggestionCategoryTitleWithSenderName:documentTitle:noticeType:", v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)suggestionCategoryId
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)suggestionCategoryImage
{
  return objc_alloc_init(MEMORY[0x1E0CEA638]);
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("N_COLLABORATIONS"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "count");

  objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  if (v10 == 1)
    v11 = CFSTR("\u200F");
  else
    v11 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return 0;
}

- (id)suggestionCategoryTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("COLLABORATIONS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  -[CKCollaborationNoticeSuggestion collaborationNoticeSuggestionsForItems:](self, "collaborationNoticeSuggestionsForItems:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCollaborationNoticeSuggestion suggestionHandlesForItems:](self, "suggestionHandlesForItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCollaborationNoticeSuggestion suggestionURLsForItems:](self, "suggestionURLsForItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKCollaborationNoticeSuggestion aggregateCollaborationNoticeTypeForItems:](self, "aggregateCollaborationNoticeTypeForItems:", v4);
  -[CKCollaborationNoticeSuggestion aggregateUTTypeForItems:withAggregateNoticeType:](self, "aggregateUTTypeForItems:withAggregateNoticeType:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "aggregateNoticeType: %@", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "aggregateContentType: %@", buf, 0xCu);
    }

  }
  v12 = objc_msgSend(v5, "count");
  v13 = objc_msgSend(v6, "count");
  v14 = v13;
  if (v12 != 1)
  {
    objc_msgSend(v4, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "notice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "ck_suggestionCategoryTitleWithNumberOfSenders:documentTitle:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:", v12, v18, v14, objc_msgSend(v4, "count"), v8, v7);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = (void *)v24;
    goto LABEL_15;
  }
  if (v13 != 1)
  {
    -[CKCollaborationNoticeSuggestion senderEntity](self, "senderEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "abbreviatedDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCollaborationNoticeSuggestion suggestionCategoryTitleWithSenderName:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:](self, "suggestionCategoryTitleWithSenderName:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:", v18, v14, objc_msgSend(v4, "count"), v8, v7);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v4, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCollaborationNoticeSuggestion senderEntity](self, "senderEntity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "abbreviatedDisplayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCollaborationNoticeSuggestion suggestionCategoryTitleWithSenderName:documentTitle:noticeType:](self, "suggestionCategoryTitleWithSenderName:documentTitle:noticeType:", v20, v18, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v21;
}

- (id)collaborationNoticeSuggestionsForItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)suggestionHandlesForItems:(id)a3
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "notice", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "senderHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)suggestionURLsForItems:(id)a3
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "notice", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "metadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)aggregateUTTypeForItems:(id)a3 withAggregateNoticeType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = (id)*MEMORY[0x1E0CEC498];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "notice", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentType");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (v14 != v8)
          {
            v15 = v10;

            v8 = v15;
          }
        }
        else
        {
          v8 = v14;
        }

        if (!a4 && v8 == v10)
        {
          v8 = v10;
          goto LABEL_17;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (int64_t)aggregateCollaborationNoticeTypeForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = -1;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "notice", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");

        if (v7 == -1)
        {
          v7 = v11;
          if (!v11)
            goto LABEL_16;
        }
        else
        {
          if (v11 != v7)
          {
            v7 = 0;
            goto LABEL_16;
          }
          if (!v7)
            goto LABEL_16;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = -1;
  }
LABEL_16:

  return v7;
}

- (id)suggestionCategoryTitleWithSenderName:(id)a3 documentTitle:(id)a4 noticeType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  uint64_t v29;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  switch(a5)
  {
    case 1:
      v10 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v13 = CFSTR("%@_MADE_EDITS_TO_%@");
        goto LABEL_17;
      }
      v16 = CFSTR("%@_MADE_EDITS_TO_FILE");
      goto LABEL_27;
    case 2:
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v16 = CFSTR("%@_LEFT_COMMENTS");
      goto LABEL_28;
    case 3:
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v16 = CFSTR("%@_MENTIONED_YOU");
      goto LABEL_28;
    case 4:
      v17 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v13 = CFSTR("%@_CREATED_%@");
        goto LABEL_17;
      }
      v16 = CFSTR("%@_CREATED_A_FILE");
      goto LABEL_27;
    case 5:
      v18 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v13 = CFSTR("%@_DELETED_%@");
        goto LABEL_17;
      }
      v16 = CFSTR("%@_DELETED_A_FILE");
      goto LABEL_27;
    case 6:
      v19 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v13 = CFSTR("%@_RENAMED_%@");
        goto LABEL_17;
      }
      v16 = CFSTR("%@_RENAMED_A_FILE");
      goto LABEL_27;
    case 7:
      v20 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v13 = CFSTR("%@_MOVED_%@");
        goto LABEL_17;
      }
      v16 = CFSTR("%@_MOVED_A_FILE");
      goto LABEL_27;
    case 8:
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      v13 = CFSTR("ADD_USER_TO_DOCUMENT_BANNER_TITLE");
      goto LABEL_20;
    case 9:
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      v13 = CFSTR("REMOVE_USER_FROM_DOCUMENT_BANNER_TITLE");
      goto LABEL_20;
    default:
      v14 = objc_msgSend(v8, "length");
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v13 = CFSTR("%@_COLLABORATION_UPDATES_TO_%@");
LABEL_17:
        v21 = v12;
LABEL_20:
        objc_msgSend(v21, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKit"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", v22, v7, v9);
      }
      else
      {
        v16 = CFSTR("%@_COLLABORATION_UPDATES_TO_FILE");
LABEL_27:
        v15 = v12;
LABEL_28:
        objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E276D870, CFSTR("ChatKit"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", v22, v7, v29);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "userInterfaceLayoutDirection");

      if (v25 == 1)
        v26 = CFSTR("\u200F");
      else
        v26 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      return v27;
  }
}

- (id)suggestionCategoryTitleWithSenderName:(id)a3 numberOfFiles:(int64_t)a4 numberOfItems:(int64_t)a5 aggregateContentType:(id)a6 aggregateNoticeType:(int64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v30;

  v12 = a3;
  -[CKCollaborationNoticeSuggestion collaborationTitleForUTType:numberOfFiles:](self, "collaborationTitleForUTType:numberOfFiles:", a6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a7)
  {
    case 1:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("MADE_EDITS_TO_N_COLLABORATION");
      goto LABEL_13;
    case 2:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22;
      v23 = CFSTR("%@_LEFT_COMMENTS");
      goto LABEL_6;
    case 3:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22;
      v23 = CFSTR("%@_MENTIONED_YOU");
LABEL_6:
      objc_msgSend(v22, "localizedStringForKey:value:table:", v23, &stru_1E276D870, CFSTR("ChatKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("CREATED_N_COLLABORATION");
      goto LABEL_13;
    case 5:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("DELETED_N_COLLABORATION");
      goto LABEL_13;
    case 6:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("RENAMED_N_COLLABORATION");
      goto LABEL_13;
    case 7:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("MOVED_N_COLLABORATION");
      goto LABEL_13;
    case 8:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("ADD_USER_TO_N_DOCUMENT_BANNER_TITLE");
      goto LABEL_13;
    case 9:
      v14 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("REMOVE_USER_FROM_N_DOCUMENT_BANNER_TITLE");
LABEL_13:
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v13;
LABEL_14:
      objc_msgSend(v14, "stringWithFormat:", v24, v12, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v18 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("N_COLLABORATION_UPDATES"), &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceLayoutDirection");

  if (v26 == 1)
    v27 = CFSTR("\u200F");
  else
    v27 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)collaborationTitleForUTType:(id)a3 numberOfFiles:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v23;

  v5 = a3;
  v6 = v5;
  if ((id)*MEMORY[0x1E0CEC5F0] == v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("SPREADSHEETS");
LABEL_11:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v16, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("COLLABORATIONS");
    goto LABEL_11;
  }
  v7 = (void *)*MEMORY[0x1E0CEC4F0];
  v8 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 == v6)
    v11 = CFSTR("FOLDERS");
  else
    v11 = CFSTR("COLLABORATIONS");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E276D870, CFSTR("ChatKit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v23, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceLayoutDirection");

  if (v19 == 1)
    v20 = CFSTR("\u200F");
  else
    v20 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)suggestionActionButtonType
{
  return 0;
}

- (int64_t)suggestionCategoryActionButtonType
{
  return 0;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->suggestionDelegate, a3);
}

- (IMCollaborationNotice)notice
{
  return self->_notice;
}

- (CKEntity)senderEntity
{
  return self->_senderEntity;
}

- (CKCollaborationNoticeSuggestionDelegate)delegate
{
  return (CKCollaborationNoticeSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wantsInlineReplyStyle
{
  return self->_wantsInlineReplyStyle;
}

- (void)setWantsInlineReplyStyle:(BOOL)a3
{
  self->_wantsInlineReplyStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_senderEntity, 0);
  objc_storeStrong((id *)&self->_notice, 0);
  objc_destroyWeak((id *)&self->suggestionDelegate);
}

- (void)suggestionImageSGView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "notice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch CNContact for senderHandle: %@", (uint8_t *)&v5, 0xCu);

}

@end
