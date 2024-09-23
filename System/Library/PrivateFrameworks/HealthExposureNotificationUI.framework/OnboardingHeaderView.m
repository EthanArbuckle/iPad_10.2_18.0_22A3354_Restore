@implementation OnboardingHeaderView

- (UIImageView)imageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_imageView));
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)header
{
  return (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_header);
}

- (_TtC28HealthExposureNotificationUI20OnboardingHeaderView)initWithHeader:(id)a3 insets:(UIEdgeInsets)a4 proxyDisabled:(BOOL)a5 corners:(unint64_t)a6
{
  return (_TtC28HealthExposureNotificationUI20OnboardingHeaderView *)OnboardingHeaderView.init(header:insets:proxyDisabled:corners:)(a3, a5, a6, a4.top, a4.left, a4.bottom, a4.right);
}

- (_TtC28HealthExposureNotificationUI20OnboardingHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD4EB1C();
}

- (_TtC28HealthExposureNotificationUI20OnboardingHeaderView)initWithFrame:(CGRect)a3
{
  sub_21CD2145C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_header));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_labelContainerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_imageWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI20OnboardingHeaderView_imageHeightConstraint));
}

@end
