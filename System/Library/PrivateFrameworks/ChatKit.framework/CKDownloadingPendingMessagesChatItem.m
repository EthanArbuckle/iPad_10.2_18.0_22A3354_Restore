@implementation CKDownloadingPendingMessagesChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptDownloadingPendingMessagesViewDefaultSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
