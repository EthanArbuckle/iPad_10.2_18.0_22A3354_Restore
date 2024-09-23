@implementation CKMessageReplyCountChatItem

- (char)transcriptOrientation
{
  void *v2;
  int v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  if (v3)
    return 2;
  else
    return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (int64_t)buttonType
{
  return 6;
}

- (id)_loadTranscriptButtonTextForReplyCountButtonType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[CKMessageReplyCountChatItem replyCount](self, "replyCount"));
  v3 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REPLY_COUNT"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceLayoutDirection");

  if (v8 == 1)
    v9 = CFSTR("\u200F");
  else
    v9 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transcriptBoldFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = *MEMORY[0x1E0DC1140];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "theme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v16);
  return v17;
}

- (unint64_t)replyCount
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 0;
}

- (unint64_t)layoutType
{
  return 15;
}

@end
