@implementation LinkCollectionViewCell

- (_TtC8AppStore22LinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22LinkCollectionViewCell *)sub_1006058DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22LinkCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore22LinkCollectionViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell____lazy_storage___standardLinkView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell____lazy_storage___presentationLinkView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell_currentLinkView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore22LinkCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/LinkCollectionViewCell.swift", 37, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore22LinkCollectionViewCell *v2;

  v2 = self;
  sub_100605AD4();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[LinkCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1006056F8(0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell____lazy_storage___standardLinkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell____lazy_storage___presentationLinkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell_currentLinkView));
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore22LinkCollectionViewCell_itemLayoutContext);
}

@end
