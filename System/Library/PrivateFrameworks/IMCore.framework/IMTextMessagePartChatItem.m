@implementation IMTextMessagePartChatItem

- (BOOL)shouldDisplayRichLink
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blockingRichLinks") ^ 1;

  return v3;
}

- (void)setShouldDisplayRichLink:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[IMChatItem _item](self, "_item");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlockingRichLinks:", !v3);

}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5;
  IMReplyContextTextMessagePartChatItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = [IMReplyContextTextMessagePartChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isFromMe");
  -[IMMessagePartChatItem text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IMMessagePartChatItem index](self, "index");
  v12 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v14 = v13;
  -[IMTextMessagePartChatItem subject](self, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IMReplyContextTextMessagePartChatItem _initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:subject:](v6, "_initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:subject:", v7, v5, v8, v9, v10, v11, v12, v14, v15);

  return v16;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMTextMessagePartChatItem;
  -[IMMessagePartChatItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMLoggingStringForMessageData();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[[%@] subject: %@]"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canEditMessageText
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eligibilityForEditType:messagePartIndex:", 1, -[IMMessagePartChatItem index](self, "index"));
  v5 = v4;
  if ((unint64_t)(v4 - 1) >= 8)
  {
    if (!v4 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 134217984;
        v13 = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Message can be edited, message edit eligibility is %ld", (uint8_t *)&v12, 0xCu);
      }

    }
    -[IMTextMessagePartChatItem subject](self, "subject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length") == 0;

    if (v11)
    {
      v7 = 1;
      goto LABEL_7;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Message text cannot be edited, message has a subject", (uint8_t *)&v12, 2u);
      }
      goto LABEL_5;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Message cannot be edited. Edit Eligibility: %ld", (uint8_t *)&v12, 0xCu);
    }
LABEL_5:

  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)enumerateEmojiTokensWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  -[IMTextMessagePartChatItem subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_msgSend(v6, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1A208ABEC;
    v14[3] = &unk_1E47202E8;
    v15 = v4;
    v16 = &v17;
    objc_msgSend(v6, "_enumerateEmojiTokensInRange:block:", 0, v7, v14);

  }
  if (!*((_BYTE *)v18 + 24))
  {
    -[IMMessagePartChatItem text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "length");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A208AC50;
    v11[3] = &unk_1E47202E8;
    v12 = v4;
    v13 = &v17;
    objc_msgSend(v9, "_enumerateEmojiTokensInRange:block:", 0, v10, v11);

  }
  _Block_object_dispose(&v17, 8);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSAttributedString *subject;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartChatItem index](self, "index");
  v8 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v10 = v9;
  subject = self->_subject;
  -[IMMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[IMTextMessagePartChatItem isShowingEditHistory](self, "isShowingEditHistory");
  v13 = (void *)objc_msgSend(v4, "_initWithItem:text:index:messagePartRange:subject:visibleAssociatedMessageChatItems:isShowingEditHistory:", v5, v6, v7, v8, v10, subject, v12, v15);

  return v13;
}

- (id)copyWithIsShowingEditHistory:(BOOL)a3
{
  id result;

  result = (id)-[IMTextMessagePartChatItem copy](self, "copy");
  *((_BYTE *)result + 168) = a3;
  return result;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 shouldDisplayLink:(BOOL)a8 isShowingEditHistory:(BOOL)a9
{
  id v9;
  void *v10;
  uint64_t v12;

  LOBYTE(v12) = a9;
  v9 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](self, "_initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:", a3, a4, a5, a6.location, a6.length, a7, v12);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setShouldDisplayRichLink:", a8);
  return v10;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 isShowingEditHistory:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:visibleAssociatedMessageChatItems:isShowingEditHistory:](self, "_initWithItem:text:index:messagePartRange:subject:visibleAssociatedMessageChatItems:isShowingEditHistory:", a3, a4, a5, a6.location, a6.length, a7, 0, v9);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 visibleAssociatedMessageChatItems:(id)a8 isShowingEditHistory:(BOOL)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  length = a6.length;
  location = a6.location;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IMTextMessagePartChatItem;
  v16 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v20, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, a3, a4, a5, location, length, a8);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    v18 = (void *)v16[22];
    v16[22] = v17;

    *((_BYTE *)v16 + 168) = a9;
  }

  return v16;
}

- (BOOL)hasSubject
{
  return -[NSAttributedString length](self->_subject, "length") != 0;
}

- (NSDate)lastEditDateForMessagePart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "historyForMessagePart:", -[IMMessagePartChatItem index](self, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (NSAttributedString)subject
{
  return self->_subject;
}

- (BOOL)isShowingEditHistory
{
  return self->_isShowingEditHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
}

- (unsigned)contentType
{
  return 1;
}

- (id)messageSummaryInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[IMTextMessagePartChatItem subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMMessagePartChatItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    v7 = v4;
  }
  else
  {
    if (!v6)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v7 = v6;
  }
  v8 = v7;
LABEL_9:
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = -[IMTextMessagePartChatItem contentType](self, "contentType");
  -[IMMessagePartChatItem text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithAssociatedMessageSummary:contentType:associatedMessagePartText:pluginBundleID:pluginDisplayName:", v8, v10, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
