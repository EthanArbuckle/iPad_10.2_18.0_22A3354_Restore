@implementation CKJunkRecoveryChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  +[CKJunkRecoveryTranscriptCell heightForChatItem:fittingSize:](CKJunkRecoveryTranscriptCell, "heightForChatItem:fittingSize:", self, width, height);
  v18 = v17;
  v19 = width;
  result.height = v18;
  result.width = v19;
  return result;
}

- (id)loadTranscriptText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("JUNK_CONVERSATION_WILL_BE_DELETED_IN_DAYS"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEmphasizedFontAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v3, v5);
  return v6;
}

- (NSDate)earliestMessageDate
{
  return self->_earliestMessageDate;
}

- (void)setEarliestMessageDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestMessageDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestMessageDate, 0);
}

@end
