@implementation EmergencyAccessFollowUpStartViewController

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v2 = (char *)v3.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A97CD2BC(*(void **)&v2[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView]);
  sub_1A97CD5F4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v4 = (char *)v7.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);

  }
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)&v4[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView])
                    + 0x138))();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  char *v6;
  char *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v4 = (char *)v8.receiver;
  v5 = -[EmergencyAccessFollowUpStartViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)&v4[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView])
                             + 0x148))(v5);
  v6 = (char *)objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setNavigationBarHidden_, 0);

    v4 = v7;
  }

}

- (void)didTapNext:(id)a3
{
  _TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A97CD734();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *result;

  result = (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView));
  sub_1A96698C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_flow), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_flow));
  sub_1A96698DC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_emergencyStatus);
}

@end
