@implementation FeatureStatusPlatformFeedItemView

- (_TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView)init
{
  return -[FeatureStatusPlatformFeedItemView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView *)sub_1A9709630(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI33FeatureStatusPlatformFeedItemViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView *v6;

  v5 = a3;
  v6 = self;
  sub_1A970C41C(a3);

}

- (void)didSelectCell:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A970E098();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_actionHandler));
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_containerViewBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___primaryDescriptionStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryFootnoteColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryFootnoteFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryLinkColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryLinkFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___secondaryDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___disclosureImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView____lazy_storage___bottomAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_iconImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_iconImageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_disclosureImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_disclosureImageViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_titleLabelTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_primaryDescriptionStackViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_primaryDescriptionStackViewTopSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryDescriptionLabelHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryDescriptionLabelTopSpacingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_secondaryDescriptionLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_bottomAccessoryViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureStatusPlatformFeedItemView_bottomAccessoryViewBottomConstraint));
}

@end
