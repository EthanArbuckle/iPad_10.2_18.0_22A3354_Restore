@implementation ClinicalSharingOnboardingSharingHealthDataViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClinicalSharingOnboardingSharingHealthDataViewController();
  v2 = v6.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_animated_, 1, 0);

  v4 = objc_msgSend(v2, sel_buttonTray);
  v5 = sub_1BC561A5C();
  objc_msgSend(v4, sel_addButton_, v5);

  sub_1BC561FB0();
  sub_1BC563A94();

}

- (uint64_t)doneButtonTapped:(void *)a1
{
  id v2;
  uint64_t v4;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_1BC62D088();
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v4);
}

- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *result;

  result = (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *result;

  v6 = a5;
  result = (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController_account));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController____lazy_storage___spinner));
}

@end
