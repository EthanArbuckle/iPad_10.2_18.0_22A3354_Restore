@implementation CKParticipantSubscriptionSwitchChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptRegularFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptEmphasizedFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKParticipantSubscriptionSwitchChatItem handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1E276D870;
  v11 = v10;

  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("GROUP_SUBSCRIPTION_CHANGE_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttributedFormatString(v4, v6, v13, v14, v15, v16, v17, v18, (uint64_t)v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)handle
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "otherHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
