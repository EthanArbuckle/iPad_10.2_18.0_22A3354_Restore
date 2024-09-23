@implementation CKReplyContextDeletedMessagePartChatItem

- (char)balloonOrientation
{
  return -[CKReplyContextDeletedMessagePartChatItem isFromMe](self, "isFromMe");
}

- (char)transcriptOrientation
{
  if (-[CKReplyContextDeletedMessagePartChatItem isFromMe](self, "isFromMe"))
    return 2;
  else
    return 0;
}

- (id)loadTranscriptText
{
  return (id)objc_opt_new();
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
  objc_msgSend(v4, "deletedReplyBalloonMaskSizeWithTailShape:", 1);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)contact
{
  if (contact_onceToken != -1)
    dispatch_once(&contact_onceToken, &__block_literal_global_165);
  return (id)contact_blankContact;
}

void __51__CKReplyContextDeletedMessagePartChatItem_contact__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97200]);
  v1 = (void *)contact_blankContact;
  contact_blankContact = (uint64_t)v0;

}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[CKReplyContextDeletedMessagePartChatItem imReplyContextDeletedMessageChatItem](self, "imReplyContextDeletedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deletedMessageIsFromMe");

  return v3;
}

- (char)color
{
  return 9;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v5;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKReplyContextDeletedMessagePartChatItem;
  result = (CKBalloonDescriptor_t *)-[CKBalloonDescriptor_t balloonDescriptor](&v5, sel_balloonDescriptor);
  retstr->var0 = 5;
  retstr->var10 = 1;
  return result;
}

- (BOOL)itemIsReplyContextPreview
{
  return 1;
}

@end
