@implementation BrickCollectionViewCell

- (_TtC8AppStore23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23BrickCollectionViewCell *)sub_100127A90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore23BrickCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC8AppStore23BrickCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabel) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabelText);
  *v7 = 0;
  v7[1] = 0;
  v8 = a3;

  result = (_TtC8AppStore23BrickCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/BrickCollectionViewCell.swift", 38, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore23BrickCollectionViewCell *v2;

  v2 = self;
  sub_100127F84();

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[BrickCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = &v2[OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabelText];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabelText + 8];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  swift_bridgeObjectRelease(v4);
  sub_100127CE8();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->shortDescriptionLabel[OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabelText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_artworkView));
}

@end
