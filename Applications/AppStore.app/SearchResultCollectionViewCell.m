@implementation SearchResultCollectionViewCell

- (_TtC8AppStore30SearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30SearchResultCollectionViewCell *)sub_1001325AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore30SearchResultCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  _TtC8AppStore30SearchResultCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_resultContents);
  *v7 = 0;
  v7[1] = 0;
  swift_weakInit((char *)self + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_impressionsCalculator, 0);
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_impressionsUpdateBlock);
  *v8 = 0;
  v8[1] = 0;
  v9 = a3;

  result = (_TtC8AppStore30SearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SearchResultCollectionViewCell.swift", 45, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore30SearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1001333F4();

}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResultCollectionViewCell(0);
  v2 = (char *)v8.receiver;
  -[SearchResultCollectionViewCell prepareForReuse](&v8, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_resultContents];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_resultContents + 8];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 40);
    v7 = v3;
    v6(ObjectType, v4);

    v2 = v7;
  }

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_resultContents));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->resultContents[OBJC_IVAR____TtC8AppStore30SearchResultCollectionViewCell_impressionsUpdateBlock]);
}

@end
