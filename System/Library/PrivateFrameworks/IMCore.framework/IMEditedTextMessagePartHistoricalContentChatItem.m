@implementation IMEditedTextMessagePartHistoricalContentChatItem

- (id)_initWithMessageItem:(id)a3 messagePartIndex:(int64_t)a4 historicalContent:(id)a5 editIndex:(int64_t)a6 messagePartRange:(_NSRange)a7 subject:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v26;
  objc_super v27;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a5;
  v16 = a8;
  objc_msgSend(v15, "messagePartText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)IMEditedTextMessagePartHistoricalContentChatItem;
  v26 = 1;
  v18 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v27, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v14, v17, a4, location, length, v16, v26);

  if (v18)
  {
    objc_storeStrong(v18 + 23, a5);
    objc_msgSend(v14, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)sub_1A2132A84();

    objc_msgSend(v18, "_setGUID:", v24);
  }

  return v18;
}

- (BOOL)isEditedMessageHistory
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canReply
{
  return 0;
}

- (BOOL)canEditMessageText
{
  return 0;
}

- (BOOL)canRetract
{
  return 0;
}

- (IMMessagePartHistoricalContent)historicalContent
{
  return self->_historicalContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalContent, 0);
}

@end
