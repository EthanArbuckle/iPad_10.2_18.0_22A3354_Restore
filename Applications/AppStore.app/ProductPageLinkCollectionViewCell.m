@implementation ProductPageLinkCollectionViewCell

- (_TtC8AppStore33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33ProductPageLinkCollectionViewCell *)sub_1004D0150(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_1004D171C((uint64_t)v3, v4);
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_iconImage];
  *(_QWORD *)&v2[OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_1004D055C();
}

- (void)layoutSubviews
{
  _TtC8AppStore33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_1004D0710();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore33ProductPageLinkCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1004D0FA8(a3);

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC8AppStore33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_1004D1114();

}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ProductPageLinkCollectionViewCell_iconImage));
}

@end
