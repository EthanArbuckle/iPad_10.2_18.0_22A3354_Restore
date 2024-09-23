@implementation BadgeCollectionViewCell

- (_TtC8AppStore23BadgeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23BadgeCollectionViewCell *)sub_1006079A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23BadgeCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore23BadgeCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore23BadgeCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/BadgeCollectionViewCell.swift", 38, 2, 52, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore23BadgeCollectionViewCell *v2;

  v2 = self;
  sub_100607D68();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[BadgeCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_100433A64();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_verticalSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BadgeCollectionViewCell_bottomSeparatorView));
}

@end
