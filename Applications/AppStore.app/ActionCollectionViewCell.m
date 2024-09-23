@implementation ActionCollectionViewCell

- (_TtC8AppStore24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ActionCollectionViewCell *)sub_100524294(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ActionCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100526898();
}

- (void)layoutSubviews
{
  _TtC8AppStore24ActionCollectionViewCell *v2;

  v2 = self;
  sub_100524A30();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore24ActionCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1005251AC(a3);

}

- (void)prepareForReuse
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ActionCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  v2[OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_hasArtworkToDisplay] = 0;

}

- (void)accessoryDidActionWithSender:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC8AppStore24ActionCollectionViewCell *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction];
    v6 = a3;
    v7 = self;
    sub_10003A340((uint64_t)v3, v5);
    v3(v6);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessory, &qword_1008346F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_searchAdTransparencyButton));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_layoutMetrics;
  v4 = type metadata accessor for ActionLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_lazilyCreatedArtworkView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction), *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction]);
}

@end
