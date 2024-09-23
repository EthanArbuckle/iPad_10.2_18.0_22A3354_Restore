@implementation CKConversationListCollectionViewRecentlyDeletedConversationCell

- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v7 = a3;
  objc_msgSend(v23, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "recoverableMessagesCount");

  objc_msgSend(v23, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDeletingIncomingMessages");

  if (v11)
  {
    objc_msgSend(v23, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unreadRecoverableMessagesCount");

  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_CONVERSATIONLIST_CELL_SUMMARY_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, v9, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceLayoutDirection");

  if (v19 == 1)
    v20 = CFSTR("\u200F");
  else
    v20 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewRecentlyDeletedConversationCell _attributedStringForRecoverableSummaryLabelWithText:](self, "_attributedStringForRecoverableSummaryLabelWithText:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v22);

}

- (id)_attributedStringForRecoverableSummaryLabelWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationListSummaryFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewConversationCell summaryLabelTextColor](self, "summaryLabelTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);

  v9 = objc_msgSend(v8, "length");
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v6, 0, v9);
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v7, 0, v9);

  return v8;
}

- (unint64_t)_daysUntilDeletion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earliestRecoverableMessageDeletionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:](CKUtilities, "daysUntilRecentlyDeletedDeletionForDate:", v4);

  return v5;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeletingIncomingMessages");

  return v4 ^ 1;
}

- (BOOL)shouldAlwaysHideAvatar
{
  return 0;
}

- (BOOL)hasUnreadMessagesForConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unreadRecoverableMessagesCount"))
  {
    objc_msgSend(v3, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDeletingIncomingMessages");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
