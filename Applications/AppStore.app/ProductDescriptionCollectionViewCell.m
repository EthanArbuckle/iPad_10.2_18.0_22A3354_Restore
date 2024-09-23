@implementation ProductDescriptionCollectionViewCell

- (_TtC8AppStore36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36ProductDescriptionCollectionViewCell *)sub_10014FE4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore36ProductDescriptionCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore36ProductDescriptionCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductDescriptionCollectionViewCell.swift", 51, 2, 62, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore36ProductDescriptionCollectionViewCell *v2;

  v2 = self;
  sub_1001502A4();

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_developerLinkView));
}

@end
