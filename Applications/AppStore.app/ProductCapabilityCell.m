@implementation ProductCapabilityCell

- (_TtC8AppStore21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21ProductCapabilityCell *)sub_10041E910(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10041FE08();
}

- (void)layoutSubviews
{
  _TtC8AppStore21ProductCapabilityCell *v2;

  v2 = self;
  sub_10041EEB8();

}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC8AppStore21ProductCapabilityCell *v3;

  v3 = self;
  sub_10041E414((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore21ProductCapabilityCell *v6;

  v5 = a3;
  v6 = self;
  sub_10041F414(a3);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_captionLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_icon));
}

@end
