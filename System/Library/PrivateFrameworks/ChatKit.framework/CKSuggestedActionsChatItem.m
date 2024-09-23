@implementation CKSuggestedActionsChatItem

- (Class)balloonViewClass
{
  type metadata accessor for SuggestedActionsBalloonView();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (CKSuggestedActionsChatItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestedActionsChatItem();
  return -[CKMessagePartChatItem init](&v3, sel_init);
}

- (CKSuggestedActionsChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKSuggestedActionsChatItem *)sub_18E67AB44(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKSuggestedActionsChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKSuggestedActionsChatItem *)sub_18E67AB44(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end
