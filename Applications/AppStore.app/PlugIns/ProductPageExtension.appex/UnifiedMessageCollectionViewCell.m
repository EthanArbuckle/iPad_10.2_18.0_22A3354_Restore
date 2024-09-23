@implementation UnifiedMessageCollectionViewCell

- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *)sub_10020A290(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_placement);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView) = 0;
  v8 = a3;

  result = (_TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/UnifiedMessageCollectionViewCell.swift", 59, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *v3;

  v3 = self;
  sub_10020A52C((uint64_t)v3, v2);

}

- (void)prepareForReuse
{
  void *v2;
  _TtC20ProductPageExtension32UnifiedMessageCollectionViewCell *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView);
  v3 = self;
  if (v2)
    objc_msgSend(v2, "removeFromSuperview");
  sub_10020AAA4(0);

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_itemLayoutContext);
  swift_bridgeObjectRelease(*(_QWORD *)&self->placement[OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_placement]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView));
}

@end
