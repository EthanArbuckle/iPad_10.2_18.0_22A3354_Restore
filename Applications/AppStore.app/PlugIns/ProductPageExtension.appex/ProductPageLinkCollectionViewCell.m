@implementation ProductPageLinkCollectionViewCell

- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell *)sub_1002B7764(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B8D30();
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[ProductPageLinkCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage];
  *(_QWORD *)&v2[OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_1002B7B70();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_1002B7D24();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension33ProductPageLinkCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1002B85BC(a3);

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC20ProductPageExtension33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_1002B8728();

}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage));
}

@end
