@implementation CKRichLinkCardStackChatItem

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (UIEdgeInsets)contentInsets
{
  CKRichLinkCardStackChatItem *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_18E7295AC();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (Class)balloonViewClass
{
  CKRichLinkCardStackChatItem *v2;
  uint64_t v3;

  v2 = self;
  v3 = sub_18E7297A0();

  if (v3)
    return (Class)swift_getObjCClassFromMetadata();
  else
    return 0;
}

- (IMRichCards)richCards
{
  CKRichLinkCardStackChatItem *v2;
  IMTranscriptChatItem *v3;
  void *v4;

  v2 = self;
  v3 = -[CKChatItem IMChatItem](v2, sel_IMChatItem);
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (!v4)

    v3 = (IMTranscriptChatItem *)objc_msgSend(v4, sel_richCards);
  }
  else
  {
    v4 = v2;
  }

  return v3;
}

- (CKRichLinkCardStackChatItem)init
{
  uint64_t v3;
  objc_super v5;

  v3 = OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)type metadata accessor for RichLinkCardStackItemView();
  *(int64x2_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize) = vdupq_n_s64(0x407F400000000000uLL);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  return -[CKMessagePartChatItem init](&v5, sel_init);
}

- (CKRichLinkCardStackChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKRichLinkCardStackChatItem *)sub_18E729BC0((char *)self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKRichLinkCardStackChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKRichLinkCardStackChatItem *)sub_18E729BC0((char *)self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end
