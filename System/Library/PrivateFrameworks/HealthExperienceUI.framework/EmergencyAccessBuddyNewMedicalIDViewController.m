@implementation EmergencyAccessBuddyNewMedicalIDViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyNewMedicalIDViewController();
  v2 = v5.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1A98D54A4();
  sub_1A98D4CD4();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmergencyAccessBuddyNewMedicalIDViewController();
  v2 = (char *)v7.receiver;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  objc_msgSend(v2, sel_availableContentViewHeight, v7.receiver, v7.super_class);
  if (v3 > 120.0)
    v4 = v3;
  else
    v4 = 120.0;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_medicalIDViewController], sel_preferredContentSize);
  if (v4 > v5)
    v6 = v4;
  else
    v6 = v5;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_contentViewHeightConstraint], sel_setConstant_, v6);

}

- (void)didTapCancel:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A98D51E8);
}

- (void)didTapNext:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A98D55DC);
}

- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *result;

  result = (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_medicalIDViewController));
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_flow), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_flow));
  sub_1A96698DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_emergencyStatus);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_contentViewHeightConstraint));
}

@end
