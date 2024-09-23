@implementation ProductPageLinkCollectionViewCell

- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell *)sub_100411F2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004134F8();
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage];
  *(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_100412338();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_1004124EC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_100412D84(a3);

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell *v2;

  v2 = self;
  sub_100412EF0();

}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage));
}

@end
