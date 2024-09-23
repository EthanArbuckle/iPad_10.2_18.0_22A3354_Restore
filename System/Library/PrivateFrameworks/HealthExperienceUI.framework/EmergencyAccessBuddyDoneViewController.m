@implementation EmergencyAccessBuddyDoneViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmergencyAccessBuddyDoneViewController();
  v2 = v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A9945264();
  sub_1A994539C();

}

- (void)didTapDone:(id)a3
{
  _TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9945E4C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *result;

  result = (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_flow), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_flow));
  sub_1A96698DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_emergencyStatus);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_stewieStateMonitor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___queue));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___reviewMedicalIDReminderBullet));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutModeBullet));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutModeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutFootnote));
}

@end
