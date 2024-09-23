@implementation TitledButtonStackCollectionViewCell

- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35TitledButtonStackCollectionViewCell *)sub_10060F9DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  _TtC8AppStore35TitledButtonStackCollectionViewCell *result;
  uint64_t v17;

  v5 = sub_10007B804(&qword_100852FE8);
  __chkstk_darwin(v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0, v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  v11 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_lineBreaks;
  v12 = sub_10007B804(&qword_10082E6C8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  v13 = type metadata accessor for RoundedTitledButton(0);
  v14 = a3;
  ViewRecycler.init()(v13);
  v15 = sub_100610AD4();
  ReusePool.init(recycler:limit:)(v7, 4, v5, v15);

  result = (_TtC8AppStore35TitledButtonStackCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/TitledButtonStackCollectionViewCell.swift", 50, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore35TitledButtonStackCollectionViewCell *v2;

  v2 = self;
  sub_10061054C();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell(0);
  v2 = v3.receiver;
  -[TitledButtonStackCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_10060FD2C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_lineBreaks, &qword_10082E6B8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_buttons));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_reusePool;
  v4 = sub_10007B804(&qword_100853000);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
