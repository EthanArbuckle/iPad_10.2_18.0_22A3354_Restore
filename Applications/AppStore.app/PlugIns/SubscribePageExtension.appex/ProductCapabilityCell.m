@implementation ProductCapabilityCell

- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21ProductCapabilityCell *)sub_1001827D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100183D68();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21ProductCapabilityCell *v2;

  v2 = self;
  sub_100182D78();

}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC22SubscribePageExtension21ProductCapabilityCell *v3;

  v3 = self;
  sub_1001832A0((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension21ProductCapabilityCell *v6;

  v5 = a3;
  v6 = self;
  sub_100183374(a3);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_captionLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_icon));
}

@end
