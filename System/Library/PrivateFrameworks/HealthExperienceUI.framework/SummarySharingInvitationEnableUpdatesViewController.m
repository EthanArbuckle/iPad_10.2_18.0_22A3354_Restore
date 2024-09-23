@implementation SummarySharingInvitationEnableUpdatesViewController

- (void)cancelButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController *v4;
  _TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController *v5;
  _BYTE v6[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = v4;
  sub_1A977F18C((uint64_t)&unk_1E5576640, (uint64_t)v5);

  -[SummarySharingInvitationEnableUpdatesViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

- (void)nextButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A977E0D4();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)disableButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController *v4;
  void *v5;
  uint64_t v6;
  unsigned __int16 v7;
  unsigned __int8 v8;
  _BYTE v9[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A977EBE0(0);
  type metadata accessor for SummarySharingInviteToReceiveAnalyticsEvent();
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_healthStore);
  v8 = 1;
  v7 = 1025;
  static SummarySharingInviteToReceiveAnalyticsEvent.submitAnalytics(healthStore:location:version:stepDetails:)(v5, &v8, v6, &v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (void)fetchNotificationAuthorizationStatus
{
  _TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController *v2;

  v2 = self;
  sub_1A977E3EC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_sharingEntryStore));
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_profileInformation;
  v4 = sub_1A9A9346C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_notificationSettingsManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController____lazy_storage___disableUpdatesButton));
}

@end
