@implementation B498TutorialController

- (void)viewDidLoad
{
  _TtC16HeadphoneConfigs22B498TutorialController *v2;

  v2 = self;
  sub_1DB39343C();

}

- (void)viewDidLayoutSubviews
{
  _TtC16HeadphoneConfigs22B498TutorialController *v2;

  v2 = self;
  sub_1DB3937D4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16HeadphoneConfigs22B498TutorialController *v4;

  v4 = self;
  sub_1DB3938F0(a3);

}

- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC16HeadphoneConfigs22B498TutorialController *result;

  result = (_TtC16HeadphoneConfigs22B498TutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC16HeadphoneConfigs22B498TutorialController *result;

  v6 = a5;
  result = (_TtC16HeadphoneConfigs22B498TutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType;
  sub_1DB396B64(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((void **)v3 + 6), *((_QWORD *)v3 + 7), v3[64]);
  sub_1DB396C7C(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView));
}

@end
