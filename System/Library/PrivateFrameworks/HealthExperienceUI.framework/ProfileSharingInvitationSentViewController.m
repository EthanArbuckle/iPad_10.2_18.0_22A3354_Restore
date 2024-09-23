@implementation ProfileSharingInvitationSentViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileSharingInvitationSentViewController();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A9687878();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42ProfileSharingInvitationSentViewController_profileBeingShared;
  v4 = sub_1A9A92BFC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI42ProfileSharingInvitationSentViewController_profileReceivingSharedProfile;
  v6 = sub_1A9A93190();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
