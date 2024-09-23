@implementation UnifiedMessageCollectionViewCell

- (_TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell *)sub_1004331AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_placement);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView) = 0;
  v8 = a3;

  result = (_TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/UnifiedMessageCollectionViewCell.swift", 61, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell *v2;

  v2 = self;
  sub_100433448();

}

- (void)prepareForReuse
{
  void *v2;
  _TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView);
  v3 = self;
  if (v2)
    objc_msgSend(v2, "removeFromSuperview");
  sub_1004339C0(0);

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext);
  swift_bridgeObjectRelease(*(_QWORD *)&self->placement[OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_placement]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView));
}

@end
