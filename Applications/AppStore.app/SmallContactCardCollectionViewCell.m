@implementation SmallContactCardCollectionViewCell

- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SmallContactCardCollectionViewCell *)sub_1004CAE80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore34SmallContactCardCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate) = 0;
  v7 = a3;

  result = (_TtC8AppStore34SmallContactCardCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SmallContactCardCollectionViewCell.swift", 49, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[SmallContactCardCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_smallPlayerCard];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v4.receiver;
  v3 = -[SmallContactCardCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  dispatch thunk of SmallPlayerCardView.prepareForReuse()(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_smallPlayerCard));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate));
}

@end
