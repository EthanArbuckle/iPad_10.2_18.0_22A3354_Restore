@implementation ProductCapabilityCell

- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21ProductCapabilityCell *)sub_10035DFF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10035F4EC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension21ProductCapabilityCell *v2;

  v2 = self;
  sub_10035E59C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension21ProductCapabilityCell *v2;

  v2 = self;
  sub_10035DAF8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension21ProductCapabilityCell *v6;

  v5 = a3;
  v6 = self;
  sub_10035EAF8(a3);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_captionLabel));
  swift_release();
}

@end
