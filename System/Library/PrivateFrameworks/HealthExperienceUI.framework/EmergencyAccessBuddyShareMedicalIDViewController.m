@implementation EmergencyAccessBuddyShareMedicalIDViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyShareMedicalIDViewController();
  v2 = v5.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  sub_1A9A0B5FC();
  v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1A9A0C034();
}

- (void)didTapLearnMore:(id)a3
{
  _TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *v4;
  id v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_makeViewController);
  -[EmergencyAccessBuddyShareMedicalIDViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v5, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)didTapCancel:(id)a3
{
  _TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9A0BD28();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapShare:(id)a3
{
  sub_1A9A0CE90(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)didTapDontShare:(id)a3
{
  sub_1A9A0CE90(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *result;

  result = (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_dontShareButton));
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_flow), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_flow));
  sub_1A96698DC((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_emergencyStatus);
}

@end
