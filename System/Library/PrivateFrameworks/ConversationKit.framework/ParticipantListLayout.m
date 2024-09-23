@implementation ParticipantListLayout

- (_TtC15ConversationKit21ParticipantListLayout)init
{
  return (_TtC15ConversationKit21ParticipantListLayout *)ParticipantListLayout.init()();
}

- (_TtC15ConversationKit21ParticipantListLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantListLayout.init(coder:)();
}

- (void)prepareLayout
{
  _TtC15ConversationKit21ParticipantListLayout *v2;

  v2 = self;
  ParticipantListLayout.prepare()();

}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = ParticipantListLayout.collectionViewContentSize.getter();
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return ParticipantListLayout.shouldInvalidateLayout(forBoundsChange:)((__C::CGRect)a3);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit21ParticipantListLayout *v8;
  void *v9;
  uint64_t v11;

  v4 = type metadata accessor for IndexPath();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = ParticipantListLayout.layoutAttributesForItem(at:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC15ConversationKit21ParticipantListLayout *v7;
  unint64_t v8;
  NSArray v9;
  __C::CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = (unint64_t)ParticipantListLayout.layoutAttributesForElements(in:)(v11);

  if (v8)
  {
    _sSo8NSObjectCMaTm_0(0, &lazy cache variable for type metadata for UICollectionViewLayoutAttributes);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21ParticipantListLayout_delegate);
}

@end
