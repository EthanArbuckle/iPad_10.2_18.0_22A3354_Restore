@implementation ActionCollectionViewCell

- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24ActionCollectionViewCell *)sub_1002385FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24ActionCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10023AC60();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24ActionCollectionViewCell *v2;

  v2 = self;
  sub_100238D98();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension24ActionCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_100239514(a3);

}

- (void)prepareForReuse
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ActionCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  v2[OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_hasArtworkToDisplay] = 0;

}

- (void)accessoryDidActionWithSender:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC20ProductPageExtension24ActionCollectionViewCell *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction];
    v6 = a3;
    v7 = self;
    sub_100018918((uint64_t)v3, v5);
    v3(v6);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessory, (uint64_t *)&unk_100808F40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_searchAdTransparencyButton));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_layoutMetrics;
  v4 = type metadata accessor for ActionLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_lazilyCreatedArtworkView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction), *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC20ProductPageExtension24ActionCollectionViewCell_accessoryAction]);
}

@end
