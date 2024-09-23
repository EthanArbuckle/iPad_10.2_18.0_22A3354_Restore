@implementation CKScheduledSectionDateCell

- (CKScheduledSectionDateCell)initWithFrame:(CGRect)a3
{
  CKScheduledSectionDateCell *v3;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *editScheduleButton;
  UIButton *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKScheduledSectionDateCell;
  v3 = -[CKTranscriptStampCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptLabelAccessoryButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](v4, "setConfiguration:", v6);

    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 1.0, 0.0, 0.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transcriptRegularFontAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC1140]);
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithString:attributes:", v12, v9);
    -[UIButton setAttributedTitle:forState:](v4, "setAttributedTitle:forState:", v13, 0);

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4);

    editScheduleButton = v3->_editScheduleButton;
    v3->_editScheduleButton = v4;
    v16 = v4;

    -[CKScheduledSectionDateCell deferredMenuForEditScheduleButton](v3, "deferredMenuForEditScheduleButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](v3->_editScheduleButton, "setMenu:", v17);

    -[UIButton setShowsMenuAsPrimaryAction:](v3->_editScheduleButton, "setShowsMenuAsPrimaryAction:", 1);
  }
  return v3;
}

- (id)deferredMenuForEditScheduleButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA4F0];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke;
  v11 = &unk_1E2756110;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEA740];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  id *v4;
  id WeakRetained;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(id, void *);
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58[2];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(WeakRetained, "conversationFetcher");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v52 = v3;
      objc_msgSend(WeakRetained, "chatItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "IMChatItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v9;
      objc_msgSend(v9, "messagesForScheduledMessageSectionWithTranscriptItem:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SEND_LATER_SEND_MESSAGE_NOW"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v12, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

      if (v18 == 1)
        v19 = CFSTR("\u200F");
      else
        v19 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SEND_LATER_DELETE_ALL_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v12;
      objc_msgSend(v21, "localizedStringWithFormat:", v23, objc_msgSend(v12, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "userInterfaceLayoutDirection");

      if (v26 == 1)
        v27 = CFSTR("\u200F");
      else
        v27 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v24);
      v28 = objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "theme");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sendButtonColorForColorType:", 1);
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrow.up.circle.fill"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "imageWithTintColor:renderingMode:", v31, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0CEA2A8];
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_44;
      v57[3] = &unk_1E274A4C0;
      objc_copyWeak(v58, v4);
      v48 = (void *)v20;
      objc_msgSend(v34, "actionWithTitle:image:identifier:handler:", v20, v33, 0, v57);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v31;
      v35 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("EDIT_TIME"), &stru_1E276D870, CFSTR("ChatKit"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("clock"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_50;
      v55[3] = &unk_1E274A4C0;
      objc_copyWeak(&v56, v4);
      objc_msgSend(v35, "actionWithTitle:image:identifier:handler:", v37, v38, 0, v55);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0CEA2A8];
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_53;
      v53[3] = &unk_1E274A4C0;
      objc_copyWeak(&v54, v4);
      v42 = v40;
      v43 = (void *)v28;
      objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", v28, v41, 0, v53);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v52;
      if (!CKIsRunningInMacCatalyst())
        objc_msgSend(v44, "setAttributes:", 2);
      objc_msgSend(v6, "addObject:", v51);
      objc_msgSend(v6, "addObject:", v39);
      objc_msgSend(v6, "addObject:", v44);
      v52[2](v52, v6);

      objc_destroyWeak(&v54);
      objc_destroyWeak(&v56);

      objc_destroyWeak(v58);
      v9 = v50;
    }
    else
    {
      IMLogHandleForCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_2(WeakRetained);

      v3[2](v3, v6);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_1();

    v3[2](v3, (void *)MEMORY[0x1E0C9AA60]);
  }

}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleSendNowAction:", v3);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_44_cold_1();

  }
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleEditDateAction:", v3);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_50_cold_1();

  }
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Delete all messages", v7, 2u);
      }

    }
    objc_msgSend(WeakRetained, "handleDeleteAllAction:", v3);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_53_cold_1();

  }
}

- (void)handleSendNowAction:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  -[CKScheduledSectionDateCell conversationFetcher](self, "conversationFetcher", a3);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CKScheduledSectionDateCell *))v4)[2](v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKScheduledSectionDateCell chatItem](self, "chatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messagesForScheduledMessageSectionWithTranscriptItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "editScheduledMessageItems:scheduleType:deliveryTime:", v9, 0, 0);
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKScheduledSectionDateCell handleSendNowAction:].cold.1(self);

  }
}

- (void)handleDeleteAllAction:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKScheduledSectionDateCell conversationFetcher](self, "conversationFetcher", a3);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CKScheduledSectionDateCell *))v4)[2](v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKScheduledSectionDateCell chatItem](self, "chatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messagesForScheduledMessageSectionWithTranscriptItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "cancelScheduledMessageItem:cancelType:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 1, (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKScheduledSectionDateCell handleSendNowAction:].cold.1(self);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CKScheduledSectionDateCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKScheduledSectionDateCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v4, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  -[CKScheduledSectionDateCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 1, v3);
}

+ (id)createStampLabelView
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)createStampTextView
{
  return (id)objc_msgSend((id)objc_opt_class(), "createStampLabelView");
}

- (BOOL)_shouldShowEditButton
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CKScheduledSectionDateCell conversationFetcher](self, "conversationFetcher");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CKScheduledSectionDateCell *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[CKScheduledSectionDateCell chatItem](self, "chatItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "IMChatItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[CKScheduledSectionDateCell chatItem](self, "chatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "IMChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagesForScheduledMessageSectionWithTranscriptItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v20;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v11);
        if ((unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "scheduleState", (_QWORD)v19) - 1) < 2)
          v14 = 1;
        if ((v14 & 1) != 0)
          break;
        if (v13 == ++v16)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      v14 = 0;
    }

    v17 = v14 & 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)attributedText
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEmphasizedFontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0DC1140]);
  v7 = -[CKScheduledSectionDateCell _shouldShowEditButton](self, "_shouldShowEditButton");
  if (-[CKScheduledSectionDateCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v10, v6);
      objc_msgSend(v3, "appendAttributedString:", v11);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v3, "appendAttributedString:", v12);

    }
    -[CKScheduledSectionDateCell chatItem](self, "chatItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transcriptText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v14);
    goto LABEL_7;
  }
  -[CKScheduledSectionDateCell chatItem](self, "chatItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transcriptText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendAttributedString:", v16);

  if (v7)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v3, "appendAttributedString:", v17);

    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "initWithString:attributes:", v14, v6);
    objc_msgSend(v3, "appendAttributedString:", v19);

LABEL_7:
  }

  return v3;
}

- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v4 = a4;
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v8 = v7;
  v10 = v9;
  -[CKScheduledSectionDateCell editScheduleButton](self, "editScheduleButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKScheduledSectionDateCell attributedText](self, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedTitle:forState:", v12, 0);

  objc_msgSend(v11, "setEnabled:", -[CKScheduledSectionDateCell _shouldShowEditButton](self, "_shouldShowEditButton"));
  objc_msgSend(v11, "sizeThatFits:", a3, 1.79769313e308);
  v15 = v14;
  if (v4)
  {
    v16 = fmin(a3, v13);
    objc_msgSend(v11, "setFrame:", v8 + floor((v10 - v16) * 0.5), 0.0, v16, v14);
    objc_msgSend(v11, "__ck_ensureMinimumTouchInsets");
  }

  v17 = a3;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKScheduledSectionDateCell;
  v4 = a3;
  -[CKTranscriptStampCell addFilter:](&v8, sel_addFilter_, v4);
  -[CKScheduledSectionDateCell editScheduleButton](self, "editScheduleButton", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAlpha");
  v7 = v6;

  objc_msgSend(v5, "setAlpha:", v7);
}

- (void)clearFilters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKScheduledSectionDateCell;
  -[CKTranscriptStampCell clearFilters](&v4, sel_clearFilters);
  -[CKScheduledSectionDateCell editScheduleButton](self, "editScheduleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (CKScheduledSectionDateCellDelegate)delegate
{
  return (CKScheduledSectionDateCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKScheduledSectionDateChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (id)conversationFetcher
{
  return self->_conversationFetcher;
}

- (void)setConversationFetcher:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 864);
}

- (UIButton)editScheduleButton
{
  return self->_editScheduleButton;
}

- (void)setEditScheduleButton:(id)a3
{
  objc_storeStrong((id *)&self->_editScheduleButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editScheduleButton, 0);
  objc_storeStrong(&self->_conversationFetcher, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CKScheduledSectionDateCell;
  v12 = a3;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v13, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  -[CKScheduledSectionDateCell setChatItem:](self, "setChatItem:", v12, v13.receiver, v13.super_class);

}

- (void)handleEditDateAction:(id)a3
{
  id v4;
  CKScheduledSectionDateCell *v5;

  v4 = a3;
  v5 = self;
  sub_18E6AC150();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Lost reference to self when trying to populate menu!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "chatItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Failed to find chat for item: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Lost reference to self when acting on sendNow button!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Lost reference to self when acting on edit button!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKScheduledSectionDateCell_deferredMenuForEditScheduleButton__block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Lost reference to self when acting on cancel all button!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleSendNowAction:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "chatItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Failed to find chat for item: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
