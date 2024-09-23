@implementation UnifiedMessageCollectionViewCell

- (_TtC8AppStore32UnifiedMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32UnifiedMessageCollectionViewCell *)sub_1001CFA78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32UnifiedMessageCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC8AppStore32UnifiedMessageCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_placement);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView) = 0;
  v8 = a3;

  result = (_TtC8AppStore32UnifiedMessageCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/UnifiedMessageCollectionViewCell.swift", 47, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore32UnifiedMessageCollectionViewCell *v3;

  v3 = self;
  sub_1001CFD14((uint64_t)v3, v2);

}

- (void)prepareForReuse
{
  void *v2;
  _TtC8AppStore32UnifiedMessageCollectionViewCell *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView);
  v3 = self;
  if (v2)
    objc_msgSend(v2, "removeFromSuperview");
  sub_1001D028C(0);

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_itemLayoutContext);
  swift_bridgeObjectRelease(*(_QWORD *)&self->placement[OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_placement]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_inlineUnifiedMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32UnifiedMessageCollectionViewCell_inlineUnifiedMessageView));
}

@end
