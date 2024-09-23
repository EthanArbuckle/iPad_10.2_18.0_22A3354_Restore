@implementation SummarySharingPendingProfileTileCell

- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton) = 0;
  return (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *)sub_1A97D62A4(0, 0);
}

- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewPendingInvitation
{
  _TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *v2;

  v2 = self;
  sub_1A986D25C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A986D87C(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton));
}

@end
