@implementation CKUnknownInternationalSenderChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptEmphasizedFontAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SENDER_IS_UNKNOWN_INTERNATIONAL_SENDER_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v3);
  return v6;
}

@end
