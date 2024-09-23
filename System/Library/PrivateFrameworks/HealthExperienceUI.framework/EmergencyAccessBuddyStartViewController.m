@implementation EmergencyAccessBuddyStartViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyStartViewController();
  v2 = v5.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1A96686E8();
}

- (void)didTapCancel:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A9668444);
}

- (void)didTapReviewLater
{
  _TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *v2;

  v2 = self;
  sub_1A9668E58();

}

- (void)didTapNext:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A9669270);
}

- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *result;

  result = (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_healthStore));
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_flow), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_flow));
  sub_1A96698DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_emergencyStatus);
}

@end
