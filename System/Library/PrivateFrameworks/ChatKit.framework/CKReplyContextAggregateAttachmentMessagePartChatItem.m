@implementation CKReplyContextAggregateAttachmentMessagePartChatItem

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  v20.receiver = self;
  v20.super_class = (Class)CKReplyContextAggregateAttachmentMessagePartChatItem;
  -[CKAggregateAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v20, sel_loadSizeThatFits_textAlignmentInsets_, a4, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textBalloonMinHeight");
  v10 = v9 + v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replyPreviewBalloonMinWidth");
  v13 = v12 + v12;

  if (v13 < v5 || v10 < v7)
  {
    v15 = v13 / v5;
    v16 = 0.0;
    if (v5 == 0.0)
      v15 = 0.0;
    if (v7 != 0.0)
      v16 = v10 / v7;
    v17 = fmax(v15, v16);
    v13 = ceil(v5 * v17);
    v10 = ceil(v7 * v17);
  }
  v18 = v13;
  v19 = v10;
  result.height = v19;
  result.width = v18;
  return result;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)replyIsFromMe
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "replyIsFromMe");

  return v3;
}

@end
