@implementation CKTapbackPileViewModel

- (int64_t)totalDisplayCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPileViewModel_totalDisplayCount);
  swift_beginAccess();
  return *v2;
}

- (void)setTotalDisplayCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPileViewModel_totalDisplayCount);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)leftLayoutDirection
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_leftLayoutDirection;
  swift_beginAccess();
  return *v2;
}

- (void)setLeftLayoutDirection:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_leftLayoutDirection;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)useTailOffset
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_useTailOffset;
  swift_beginAccess();
  return *v2;
}

- (void)setUseTailOffset:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_useTailOffset;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)showBottomPeekPlatter
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_showBottomPeekPlatter;
  swift_beginAccess();
  return *v2;
}

- (void)setShowBottomPeekPlatter:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_showBottomPeekPlatter;
  swift_beginAccess();
  *v4 = a3;
}

+ (int64_t)maxDisplayCount
{
  return 3;
}

- (NSArray)tapbackChatItems
{
  void *v2;

  sub_18E59671C();
  sub_18E7669BC();
  v2 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (CKAggregateAcknowledgmentChatItem)aggregateAcknowledgmentChatItem
{
  return (CKAggregateAcknowledgmentChatItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___CKTapbackPileViewModel_aggregateAcknowledgmentChatItem));
}

- (IMTapback)sentTapback
{
  void *v2;
  CKTapbackPileViewModel *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPileViewModel_aggregateAcknowledgmentChatItem);
  v3 = self;
  v4 = objc_msgSend(v2, sel_sentTapbackChatItem);
  v5 = objc_msgSend(v4, sel_tapback);

  return (IMTapback *)v5;
}

- (CKTapbackPileViewModel)initWithAggregateAcknowledgmentChatItem:(id)a3
{
  id v3;
  CKTapbackPileViewModel *v4;

  v3 = a3;
  v4 = (CKTapbackPileViewModel *)sub_18E5962E0(v3);

  return v4;
}

- (CKTapbackPileViewModel)init
{
  CKTapbackPileViewModel *result;

  result = (CKTapbackPileViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
